; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25812 () Bool)

(assert start!25812)

(declare-fun b!267443 () Bool)

(declare-fun res!131713 () Bool)

(declare-fun e!172873 () Bool)

(assert (=> b!267443 (=> (not res!131713) (not e!172873))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267443 (= res!131713 (validKeyInArray!0 k0!2581))))

(declare-fun b!267442 () Bool)

(declare-fun res!131715 () Bool)

(assert (=> b!267442 (=> (not res!131715) (not e!172873))))

(declare-datatypes ((array!12977 0))(
  ( (array!12978 (arr!6142 (Array (_ BitVec 32) (_ BitVec 64))) (size!6494 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12977)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267442 (= res!131715 (and (= (size!6494 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6494 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6494 a!3325))))))

(declare-fun res!131714 () Bool)

(assert (=> start!25812 (=> (not res!131714) (not e!172873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25812 (= res!131714 (validMask!0 mask!3868))))

(assert (=> start!25812 e!172873))

(declare-fun array_inv!4092 (array!12977) Bool)

(assert (=> start!25812 (array_inv!4092 a!3325)))

(assert (=> start!25812 true))

(declare-fun b!267445 () Bool)

(declare-datatypes ((List!3863 0))(
  ( (Nil!3860) (Cons!3859 (h!4526 (_ BitVec 64)) (t!8937 List!3863)) )
))
(declare-fun noDuplicate!113 (List!3863) Bool)

(assert (=> b!267445 (= e!172873 (not (noDuplicate!113 Nil!3860)))))

(declare-fun b!267444 () Bool)

(declare-fun res!131712 () Bool)

(assert (=> b!267444 (=> (not res!131712) (not e!172873))))

(assert (=> b!267444 (= res!131712 (and (bvsle #b00000000000000000000000000000000 (size!6494 a!3325)) (bvslt (size!6494 a!3325) #b01111111111111111111111111111111)))))

(assert (= (and start!25812 res!131714) b!267442))

(assert (= (and b!267442 res!131715) b!267443))

(assert (= (and b!267443 res!131713) b!267444))

(assert (= (and b!267444 res!131712) b!267445))

(declare-fun m!283985 () Bool)

(assert (=> b!267443 m!283985))

(declare-fun m!283987 () Bool)

(assert (=> start!25812 m!283987))

(declare-fun m!283989 () Bool)

(assert (=> start!25812 m!283989))

(declare-fun m!283991 () Bool)

(assert (=> b!267445 m!283991))

(check-sat (not b!267445) (not b!267443) (not start!25812))
(check-sat)
(get-model)

(declare-fun d!64391 () Bool)

(declare-fun res!131744 () Bool)

(declare-fun e!172891 () Bool)

(assert (=> d!64391 (=> res!131744 e!172891)))

(get-info :version)

(assert (=> d!64391 (= res!131744 ((_ is Nil!3860) Nil!3860))))

(assert (=> d!64391 (= (noDuplicate!113 Nil!3860) e!172891)))

(declare-fun b!267474 () Bool)

(declare-fun e!172892 () Bool)

(assert (=> b!267474 (= e!172891 e!172892)))

(declare-fun res!131745 () Bool)

(assert (=> b!267474 (=> (not res!131745) (not e!172892))))

(declare-fun contains!1895 (List!3863 (_ BitVec 64)) Bool)

(assert (=> b!267474 (= res!131745 (not (contains!1895 (t!8937 Nil!3860) (h!4526 Nil!3860))))))

(declare-fun b!267475 () Bool)

(assert (=> b!267475 (= e!172892 (noDuplicate!113 (t!8937 Nil!3860)))))

(assert (= (and d!64391 (not res!131744)) b!267474))

(assert (= (and b!267474 res!131745) b!267475))

(declare-fun m!284009 () Bool)

(assert (=> b!267474 m!284009))

(declare-fun m!284011 () Bool)

(assert (=> b!267475 m!284011))

(assert (=> b!267445 d!64391))

(declare-fun d!64395 () Bool)

(assert (=> d!64395 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267443 d!64395))

(declare-fun d!64399 () Bool)

(assert (=> d!64399 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25812 d!64399))

(declare-fun d!64403 () Bool)

(assert (=> d!64403 (= (array_inv!4092 a!3325) (bvsge (size!6494 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25812 d!64403))

(check-sat (not b!267475) (not b!267474))
(check-sat)
