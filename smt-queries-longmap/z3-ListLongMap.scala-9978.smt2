; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118046 () Bool)

(assert start!118046)

(declare-fun res!923426 () Bool)

(declare-fun e!783815 () Bool)

(assert (=> start!118046 (=> (not res!923426) (not e!783815))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118046 (= res!923426 (validMask!0 mask!3034))))

(assert (=> start!118046 e!783815))

(assert (=> start!118046 true))

(declare-datatypes ((array!94373 0))(
  ( (array!94374 (arr!45568 (Array (_ BitVec 32) (_ BitVec 64))) (size!46119 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94373)

(declare-fun array_inv!34849 (array!94373) Bool)

(assert (=> start!118046 (array_inv!34849 a!2971)))

(declare-fun b!1382586 () Bool)

(declare-fun res!923424 () Bool)

(assert (=> b!1382586 (=> (not res!923424) (not e!783815))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382586 (= res!923424 (validKeyInArray!0 (select (arr!45568 a!2971) i!1094)))))

(declare-fun b!1382587 () Bool)

(declare-fun res!923427 () Bool)

(assert (=> b!1382587 (=> (not res!923427) (not e!783815))))

(assert (=> b!1382587 (= res!923427 (and (bvsle #b00000000000000000000000000000000 (size!46119 a!2971)) (bvslt (size!46119 a!2971) #b01111111111111111111111111111111)))))

(declare-fun b!1382585 () Bool)

(declare-fun res!923425 () Bool)

(assert (=> b!1382585 (=> (not res!923425) (not e!783815))))

(assert (=> b!1382585 (= res!923425 (and (= (size!46119 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46119 a!2971))))))

(declare-fun b!1382588 () Bool)

(declare-datatypes ((List!32089 0))(
  ( (Nil!32086) (Cons!32085 (h!33303 (_ BitVec 64)) (t!46775 List!32089)) )
))
(declare-fun noDuplicate!2605 (List!32089) Bool)

(assert (=> b!1382588 (= e!783815 (not (noDuplicate!2605 Nil!32086)))))

(assert (= (and start!118046 res!923426) b!1382585))

(assert (= (and b!1382585 res!923425) b!1382586))

(assert (= (and b!1382586 res!923424) b!1382587))

(assert (= (and b!1382587 res!923427) b!1382588))

(declare-fun m!1268113 () Bool)

(assert (=> start!118046 m!1268113))

(declare-fun m!1268115 () Bool)

(assert (=> start!118046 m!1268115))

(declare-fun m!1268117 () Bool)

(assert (=> b!1382586 m!1268117))

(assert (=> b!1382586 m!1268117))

(declare-fun m!1268119 () Bool)

(assert (=> b!1382586 m!1268119))

(declare-fun m!1268121 () Bool)

(assert (=> b!1382588 m!1268121))

(check-sat (not b!1382588) (not start!118046) (not b!1382586))
(check-sat)
(get-model)

(declare-fun d!149499 () Bool)

(declare-fun res!923456 () Bool)

(declare-fun e!783833 () Bool)

(assert (=> d!149499 (=> res!923456 e!783833)))

(get-info :version)

(assert (=> d!149499 (= res!923456 ((_ is Nil!32086) Nil!32086))))

(assert (=> d!149499 (= (noDuplicate!2605 Nil!32086) e!783833)))

(declare-fun b!1382617 () Bool)

(declare-fun e!783834 () Bool)

(assert (=> b!1382617 (= e!783833 e!783834)))

(declare-fun res!923457 () Bool)

(assert (=> b!1382617 (=> (not res!923457) (not e!783834))))

(declare-fun contains!9774 (List!32089 (_ BitVec 64)) Bool)

(assert (=> b!1382617 (= res!923457 (not (contains!9774 (t!46775 Nil!32086) (h!33303 Nil!32086))))))

(declare-fun b!1382618 () Bool)

(assert (=> b!1382618 (= e!783834 (noDuplicate!2605 (t!46775 Nil!32086)))))

(assert (= (and d!149499 (not res!923456)) b!1382617))

(assert (= (and b!1382617 res!923457) b!1382618))

(declare-fun m!1268143 () Bool)

(assert (=> b!1382617 m!1268143))

(declare-fun m!1268145 () Bool)

(assert (=> b!1382618 m!1268145))

(assert (=> b!1382588 d!149499))

(declare-fun d!149501 () Bool)

(assert (=> d!149501 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!118046 d!149501))

(declare-fun d!149511 () Bool)

(assert (=> d!149511 (= (array_inv!34849 a!2971) (bvsge (size!46119 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!118046 d!149511))

(declare-fun d!149513 () Bool)

(assert (=> d!149513 (= (validKeyInArray!0 (select (arr!45568 a!2971) i!1094)) (and (not (= (select (arr!45568 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45568 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382586 d!149513))

(check-sat (not b!1382617) (not b!1382618))
(check-sat)
