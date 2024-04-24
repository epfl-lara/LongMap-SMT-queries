; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137180 () Bool)

(assert start!137180)

(declare-fun res!1079378 () Bool)

(declare-fun e!881996 () Bool)

(assert (=> start!137180 (=> (not res!1079378) (not e!881996))))

(declare-fun mask!907 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!137180 (= res!1079378 (validMask!0 mask!907))))

(assert (=> start!137180 e!881996))

(assert (=> start!137180 true))

(declare-fun b!1581015 () Bool)

(declare-fun x!457 () (_ BitVec 32))

(declare-fun ee!11 () (_ BitVec 32))

(assert (=> b!1581015 (= e!881996 (and (bvsge mask!907 #b00000000000000000000000000000000) (bvsge ee!11 #b00000000000000000000000000000000) (bvslt ee!11 (bvadd #b00000000000000000000000000000001 mask!907)) (bvsle x!457 #b01111111111111111111111111111110) (bvsge x!457 #b00000000000000000000000000000000) (let ((bdg!57050 (bvand (bvsub (bvadd ee!11 (bvmul #b00000000000000000000000000000010 x!457 (bvadd #b00000000000000000000000000000001 x!457))) #b00000000000000000000000000000011) mask!907))) (or (bvslt bdg!57050 #b00000000000000000000000000000000) (bvsge bdg!57050 (bvadd #b00000000000000000000000000000001 mask!907))))))))

(assert (= (and start!137180 res!1079378) b!1581015))

(declare-fun m!1452927 () Bool)

(assert (=> start!137180 m!1452927))

(check-sat (not start!137180))
(check-sat)
