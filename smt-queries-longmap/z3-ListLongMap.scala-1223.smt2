; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25844 () Bool)

(assert start!25844)

(declare-fun b!267306 () Bool)

(declare-fun res!131656 () Bool)

(declare-fun e!172788 () Bool)

(assert (=> b!267306 (=> (not res!131656) (not e!172788))))

(declare-datatypes ((array!12978 0))(
  ( (array!12979 (arr!6141 (Array (_ BitVec 32) (_ BitVec 64))) (size!6494 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12978)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267306 (= res!131656 (and (= (size!6494 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6494 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6494 a!3325))))))

(declare-fun res!131655 () Bool)

(assert (=> start!25844 (=> (not res!131655) (not e!172788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25844 (= res!131655 (validMask!0 mask!3868))))

(assert (=> start!25844 e!172788))

(declare-fun array_inv!4113 (array!12978) Bool)

(assert (=> start!25844 (array_inv!4113 a!3325)))

(assert (=> start!25844 true))

(declare-fun b!267307 () Bool)

(declare-fun res!131654 () Bool)

(assert (=> b!267307 (=> (not res!131654) (not e!172788))))

(assert (=> b!267307 (= res!131654 (and (bvsle #b00000000000000000000000000000000 (size!6494 a!3325)) (bvslt (size!6494 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267308 () Bool)

(declare-fun e!172787 () Bool)

(assert (=> b!267308 (= e!172788 e!172787)))

(declare-fun res!131659 () Bool)

(assert (=> b!267308 (=> res!131659 e!172787)))

(declare-datatypes ((List!3922 0))(
  ( (Nil!3919) (Cons!3918 (h!4585 (_ BitVec 64)) (t!8995 List!3922)) )
))
(declare-fun contains!1900 (List!3922 (_ BitVec 64)) Bool)

(assert (=> b!267308 (= res!131659 (contains!1900 Nil!3919 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267309 () Bool)

(assert (=> b!267309 (= e!172787 (contains!1900 Nil!3919 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267310 () Bool)

(declare-fun res!131658 () Bool)

(assert (=> b!267310 (=> (not res!131658) (not e!172788))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267310 (= res!131658 (validKeyInArray!0 k0!2581))))

(declare-fun b!267311 () Bool)

(declare-fun res!131657 () Bool)

(assert (=> b!267311 (=> (not res!131657) (not e!172788))))

(declare-fun noDuplicate!115 (List!3922) Bool)

(assert (=> b!267311 (= res!131657 (noDuplicate!115 Nil!3919))))

(assert (= (and start!25844 res!131655) b!267306))

(assert (= (and b!267306 res!131656) b!267310))

(assert (= (and b!267310 res!131658) b!267307))

(assert (= (and b!267307 res!131654) b!267311))

(assert (= (and b!267311 res!131657) b!267308))

(assert (= (and b!267308 (not res!131659)) b!267309))

(declare-fun m!283223 () Bool)

(assert (=> b!267309 m!283223))

(declare-fun m!283225 () Bool)

(assert (=> b!267310 m!283225))

(declare-fun m!283227 () Bool)

(assert (=> b!267311 m!283227))

(declare-fun m!283229 () Bool)

(assert (=> start!25844 m!283229))

(declare-fun m!283231 () Bool)

(assert (=> start!25844 m!283231))

(declare-fun m!283233 () Bool)

(assert (=> b!267308 m!283233))

(check-sat (not b!267308) (not b!267309) (not b!267311) (not start!25844) (not b!267310))
(check-sat)
(get-model)

(declare-fun d!64197 () Bool)

(assert (=> d!64197 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267310 d!64197))

(declare-fun d!64199 () Bool)

(declare-fun lt!134511 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!181 (List!3922) (InoxSet (_ BitVec 64)))

(assert (=> d!64199 (= lt!134511 (select (content!181 Nil!3919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!172812 () Bool)

(assert (=> d!64199 (= lt!134511 e!172812)))

(declare-fun res!131700 () Bool)

(assert (=> d!64199 (=> (not res!131700) (not e!172812))))

(get-info :version)

(assert (=> d!64199 (= res!131700 ((_ is Cons!3918) Nil!3919))))

(assert (=> d!64199 (= (contains!1900 Nil!3919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!134511)))

(declare-fun b!267352 () Bool)

(declare-fun e!172811 () Bool)

(assert (=> b!267352 (= e!172812 e!172811)))

(declare-fun res!131701 () Bool)

(assert (=> b!267352 (=> res!131701 e!172811)))

(assert (=> b!267352 (= res!131701 (= (h!4585 Nil!3919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267353 () Bool)

(assert (=> b!267353 (= e!172811 (contains!1900 (t!8995 Nil!3919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64199 res!131700) b!267352))

(assert (= (and b!267352 (not res!131701)) b!267353))

(declare-fun m!283259 () Bool)

(assert (=> d!64199 m!283259))

(declare-fun m!283261 () Bool)

(assert (=> d!64199 m!283261))

(declare-fun m!283263 () Bool)

(assert (=> b!267353 m!283263))

(assert (=> b!267309 d!64199))

(declare-fun d!64201 () Bool)

(assert (=> d!64201 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25844 d!64201))

(declare-fun d!64209 () Bool)

(assert (=> d!64209 (= (array_inv!4113 a!3325) (bvsge (size!6494 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25844 d!64209))

(declare-fun d!64211 () Bool)

(declare-fun lt!134515 () Bool)

(assert (=> d!64211 (= lt!134515 (select (content!181 Nil!3919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!172824 () Bool)

(assert (=> d!64211 (= lt!134515 e!172824)))

(declare-fun res!131712 () Bool)

(assert (=> d!64211 (=> (not res!131712) (not e!172824))))

(assert (=> d!64211 (= res!131712 ((_ is Cons!3918) Nil!3919))))

(assert (=> d!64211 (= (contains!1900 Nil!3919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!134515)))

(declare-fun b!267364 () Bool)

(declare-fun e!172823 () Bool)

(assert (=> b!267364 (= e!172824 e!172823)))

(declare-fun res!131713 () Bool)

(assert (=> b!267364 (=> res!131713 e!172823)))

(assert (=> b!267364 (= res!131713 (= (h!4585 Nil!3919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267365 () Bool)

(assert (=> b!267365 (= e!172823 (contains!1900 (t!8995 Nil!3919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64211 res!131712) b!267364))

(assert (= (and b!267364 (not res!131713)) b!267365))

(assert (=> d!64211 m!283259))

(declare-fun m!283271 () Bool)

(assert (=> d!64211 m!283271))

(declare-fun m!283273 () Bool)

(assert (=> b!267365 m!283273))

(assert (=> b!267308 d!64211))

(declare-fun d!64213 () Bool)

(declare-fun res!131720 () Bool)

(declare-fun e!172831 () Bool)

(assert (=> d!64213 (=> res!131720 e!172831)))

(assert (=> d!64213 (= res!131720 ((_ is Nil!3919) Nil!3919))))

(assert (=> d!64213 (= (noDuplicate!115 Nil!3919) e!172831)))

(declare-fun b!267372 () Bool)

(declare-fun e!172832 () Bool)

(assert (=> b!267372 (= e!172831 e!172832)))

(declare-fun res!131721 () Bool)

(assert (=> b!267372 (=> (not res!131721) (not e!172832))))

(assert (=> b!267372 (= res!131721 (not (contains!1900 (t!8995 Nil!3919) (h!4585 Nil!3919))))))

(declare-fun b!267373 () Bool)

(assert (=> b!267373 (= e!172832 (noDuplicate!115 (t!8995 Nil!3919)))))

(assert (= (and d!64213 (not res!131720)) b!267372))

(assert (= (and b!267372 res!131721) b!267373))

(declare-fun m!283279 () Bool)

(assert (=> b!267372 m!283279))

(declare-fun m!283281 () Bool)

(assert (=> b!267373 m!283281))

(assert (=> b!267311 d!64213))

(check-sat (not b!267353) (not d!64199) (not b!267372) (not d!64211) (not b!267373) (not b!267365))
(check-sat)
