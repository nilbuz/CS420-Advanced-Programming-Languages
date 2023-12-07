#####################################################################################################
STACK=stack
#####################################################################################################

test: clean
	$(STACK) test --allow-different-user

bin:
	$(STACK) build --allow-different-user

clean:
	$(STACK) clean --allow-different-user

ghci:
	$(STACK) exec --allow-different-user -- ghci

distclean: clean
	rm -rf .stack-work