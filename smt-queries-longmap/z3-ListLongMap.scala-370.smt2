; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7066 () Bool)

(assert start!7066)

(declare-fun res!26640 () Bool)

(declare-fun e!28906 () Bool)

(assert (=> start!7066 (=> (not res!26640) (not e!28906))))

(declare-datatypes ((array!3049 0))(
  ( (array!3050 (arr!1465 (Array (_ BitVec 32) (_ BitVec 64))) (size!1687 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3049)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(assert (=> start!7066 (= res!26640 (and (bvslt (size!1687 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1687 a!4401)) (= (select (arr!1465 a!4401) i!1488) k0!2989)))))

(assert (=> start!7066 e!28906))

(declare-fun array_inv!877 (array!3049) Bool)

(assert (=> start!7066 (array_inv!877 a!4401)))

(assert (=> start!7066 true))

(declare-fun b!45441 () Bool)

(declare-fun arrayContainsKey!0 (array!3049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45441 (= e!28906 (not (arrayContainsKey!0 a!4401 k0!2989 i!1488)))))

(assert (= (and start!7066 res!26640) b!45441))

(declare-fun m!39995 () Bool)

(assert (=> start!7066 m!39995))

(declare-fun m!39997 () Bool)

(assert (=> start!7066 m!39997))

(declare-fun m!39999 () Bool)

(assert (=> b!45441 m!39999))

(check-sat (not start!7066) (not b!45441))
(check-sat)
(get-model)

(declare-fun d!8853 () Bool)

(assert (=> d!8853 (= (array_inv!877 a!4401) (bvsge (size!1687 a!4401) #b00000000000000000000000000000000))))

(assert (=> start!7066 d!8853))

(declare-fun d!8855 () Bool)

(declare-fun res!26652 () Bool)

(declare-fun e!28922 () Bool)

(assert (=> d!8855 (=> res!26652 e!28922)))

(assert (=> d!8855 (= res!26652 (= (select (arr!1465 a!4401) i!1488) k0!2989))))

(assert (=> d!8855 (= (arrayContainsKey!0 a!4401 k0!2989 i!1488) e!28922)))

(declare-fun b!45453 () Bool)

(declare-fun e!28923 () Bool)

(assert (=> b!45453 (= e!28922 e!28923)))

(declare-fun res!26653 () Bool)

(assert (=> b!45453 (=> (not res!26653) (not e!28923))))

(assert (=> b!45453 (= res!26653 (bvslt (bvadd i!1488 #b00000000000000000000000000000001) (size!1687 a!4401)))))

(declare-fun b!45454 () Bool)

(assert (=> b!45454 (= e!28923 (arrayContainsKey!0 a!4401 k0!2989 (bvadd i!1488 #b00000000000000000000000000000001)))))

(assert (= (and d!8855 (not res!26652)) b!45453))

(assert (= (and b!45453 res!26653) b!45454))

(assert (=> d!8855 m!39995))

(declare-fun m!40007 () Bool)

(assert (=> b!45454 m!40007))

(assert (=> b!45441 d!8855))

(check-sat (not b!45454))
(check-sat)
