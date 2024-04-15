; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7062 () Bool)

(assert start!7062)

(declare-fun res!26611 () Bool)

(declare-fun e!28851 () Bool)

(assert (=> start!7062 (=> (not res!26611) (not e!28851))))

(declare-datatypes ((array!3021 0))(
  ( (array!3022 (arr!1451 (Array (_ BitVec 32) (_ BitVec 64))) (size!1674 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3021)

(declare-fun k0!2989 () (_ BitVec 64))

(declare-fun i!1488 () (_ BitVec 32))

(assert (=> start!7062 (= res!26611 (and (bvslt (size!1674 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1674 a!4401)) (= (select (arr!1451 a!4401) i!1488) k0!2989)))))

(assert (=> start!7062 e!28851))

(declare-fun array_inv!874 (array!3021) Bool)

(assert (=> start!7062 (array_inv!874 a!4401)))

(assert (=> start!7062 true))

(declare-fun b!45366 () Bool)

(declare-fun arrayContainsKey!0 (array!3021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45366 (= e!28851 (not (arrayContainsKey!0 a!4401 k0!2989 i!1488)))))

(assert (= (and start!7062 res!26611) b!45366))

(declare-fun m!39905 () Bool)

(assert (=> start!7062 m!39905))

(declare-fun m!39907 () Bool)

(assert (=> start!7062 m!39907))

(declare-fun m!39909 () Bool)

(assert (=> b!45366 m!39909))

(check-sat (not b!45366) (not start!7062))
(check-sat)
(get-model)

(declare-fun d!8823 () Bool)

(declare-fun res!26626 () Bool)

(declare-fun e!28873 () Bool)

(assert (=> d!8823 (=> res!26626 e!28873)))

(assert (=> d!8823 (= res!26626 (= (select (arr!1451 a!4401) i!1488) k0!2989))))

(assert (=> d!8823 (= (arrayContainsKey!0 a!4401 k0!2989 i!1488) e!28873)))

(declare-fun b!45381 () Bool)

(declare-fun e!28874 () Bool)

(assert (=> b!45381 (= e!28873 e!28874)))

(declare-fun res!26627 () Bool)

(assert (=> b!45381 (=> (not res!26627) (not e!28874))))

(assert (=> b!45381 (= res!26627 (bvslt (bvadd i!1488 #b00000000000000000000000000000001) (size!1674 a!4401)))))

(declare-fun b!45382 () Bool)

(assert (=> b!45382 (= e!28874 (arrayContainsKey!0 a!4401 k0!2989 (bvadd i!1488 #b00000000000000000000000000000001)))))

(assert (= (and d!8823 (not res!26626)) b!45381))

(assert (= (and b!45381 res!26627) b!45382))

(assert (=> d!8823 m!39905))

(declare-fun m!39923 () Bool)

(assert (=> b!45382 m!39923))

(assert (=> b!45366 d!8823))

(declare-fun d!8833 () Bool)

(assert (=> d!8833 (= (array_inv!874 a!4401) (bvsge (size!1674 a!4401) #b00000000000000000000000000000000))))

(assert (=> start!7062 d!8833))

(check-sat (not b!45382))
(check-sat)
