; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7068 () Bool)

(assert start!7068)

(declare-fun res!26612 () Bool)

(declare-fun e!28863 () Bool)

(assert (=> start!7068 (=> (not res!26612) (not e!28863))))

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k0!2989 () (_ BitVec 64))

(declare-datatypes ((array!3033 0))(
  ( (array!3034 (arr!1457 (Array (_ BitVec 32) (_ BitVec 64))) (size!1679 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3033)

(assert (=> start!7068 (= res!26612 (and (bvslt (size!1679 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1679 a!4401)) (= (select (arr!1457 a!4401) i!1488) k0!2989)))))

(assert (=> start!7068 e!28863))

(declare-fun array_inv!860 (array!3033) Bool)

(assert (=> start!7068 (array_inv!860 a!4401)))

(assert (=> start!7068 true))

(declare-fun b!45381 () Bool)

(declare-fun arrayContainsKey!0 (array!3033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45381 (= e!28863 (not (arrayContainsKey!0 a!4401 k0!2989 i!1488)))))

(assert (= (and start!7068 res!26612) b!45381))

(declare-fun m!39865 () Bool)

(assert (=> start!7068 m!39865))

(declare-fun m!39867 () Bool)

(assert (=> start!7068 m!39867))

(declare-fun m!39869 () Bool)

(assert (=> b!45381 m!39869))

(check-sat (not start!7068) (not b!45381))
(check-sat)
(get-model)

(declare-fun d!8839 () Bool)

(assert (=> d!8839 (= (array_inv!860 a!4401) (bvsge (size!1679 a!4401) #b00000000000000000000000000000000))))

(assert (=> start!7068 d!8839))

(declare-fun d!8841 () Bool)

(declare-fun res!26623 () Bool)

(declare-fun e!28881 () Bool)

(assert (=> d!8841 (=> res!26623 e!28881)))

(assert (=> d!8841 (= res!26623 (= (select (arr!1457 a!4401) i!1488) k0!2989))))

(assert (=> d!8841 (= (arrayContainsKey!0 a!4401 k0!2989 i!1488) e!28881)))

(declare-fun b!45392 () Bool)

(declare-fun e!28882 () Bool)

(assert (=> b!45392 (= e!28881 e!28882)))

(declare-fun res!26624 () Bool)

(assert (=> b!45392 (=> (not res!26624) (not e!28882))))

(assert (=> b!45392 (= res!26624 (bvslt (bvadd i!1488 #b00000000000000000000000000000001) (size!1679 a!4401)))))

(declare-fun b!45393 () Bool)

(assert (=> b!45393 (= e!28882 (arrayContainsKey!0 a!4401 k0!2989 (bvadd i!1488 #b00000000000000000000000000000001)))))

(assert (= (and d!8841 (not res!26623)) b!45392))

(assert (= (and b!45392 res!26624) b!45393))

(assert (=> d!8841 m!39865))

(declare-fun m!39883 () Bool)

(assert (=> b!45393 m!39883))

(assert (=> b!45381 d!8841))

(check-sat (not b!45393))
(check-sat)
