; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25842 () Bool)

(assert start!25842)

(declare-fun b!267500 () Bool)

(declare-fun res!131775 () Bool)

(declare-fun e!172912 () Bool)

(assert (=> b!267500 (=> (not res!131775) (not e!172912))))

(declare-datatypes ((array!12986 0))(
  ( (array!12987 (arr!6145 (Array (_ BitVec 32) (_ BitVec 64))) (size!6497 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12986)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267500 (= res!131775 (and (= (size!6497 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6497 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6497 a!3325))))))

(declare-fun res!131773 () Bool)

(assert (=> start!25842 (=> (not res!131773) (not e!172912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25842 (= res!131773 (validMask!0 mask!3868))))

(assert (=> start!25842 e!172912))

(declare-fun array_inv!4095 (array!12986) Bool)

(assert (=> start!25842 (array_inv!4095 a!3325)))

(assert (=> start!25842 true))

(declare-fun b!267501 () Bool)

(declare-fun e!172911 () Bool)

(assert (=> b!267501 (= e!172912 e!172911)))

(declare-fun res!131772 () Bool)

(assert (=> b!267501 (=> res!131772 e!172911)))

(declare-datatypes ((List!3866 0))(
  ( (Nil!3863) (Cons!3862 (h!4529 (_ BitVec 64)) (t!8940 List!3866)) )
))
(declare-fun contains!1897 (List!3866 (_ BitVec 64)) Bool)

(assert (=> b!267501 (= res!131772 (contains!1897 Nil!3863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267502 () Bool)

(assert (=> b!267502 (= e!172911 (contains!1897 Nil!3863 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267503 () Bool)

(declare-fun res!131770 () Bool)

(assert (=> b!267503 (=> (not res!131770) (not e!172912))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267503 (= res!131770 (validKeyInArray!0 k0!2581))))

(declare-fun b!267504 () Bool)

(declare-fun res!131774 () Bool)

(assert (=> b!267504 (=> (not res!131774) (not e!172912))))

(assert (=> b!267504 (= res!131774 (and (bvsle #b00000000000000000000000000000000 (size!6497 a!3325)) (bvslt (size!6497 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267505 () Bool)

(declare-fun res!131771 () Bool)

(assert (=> b!267505 (=> (not res!131771) (not e!172912))))

(declare-fun noDuplicate!116 (List!3866) Bool)

(assert (=> b!267505 (= res!131771 (noDuplicate!116 Nil!3863))))

(assert (= (and start!25842 res!131773) b!267500))

(assert (= (and b!267500 res!131775) b!267503))

(assert (= (and b!267503 res!131770) b!267504))

(assert (= (and b!267504 res!131774) b!267505))

(assert (= (and b!267505 res!131771) b!267501))

(assert (= (and b!267501 (not res!131772)) b!267502))

(declare-fun m!284021 () Bool)

(assert (=> b!267503 m!284021))

(declare-fun m!284023 () Bool)

(assert (=> b!267505 m!284023))

(declare-fun m!284025 () Bool)

(assert (=> b!267501 m!284025))

(declare-fun m!284027 () Bool)

(assert (=> start!25842 m!284027))

(declare-fun m!284029 () Bool)

(assert (=> start!25842 m!284029))

(declare-fun m!284031 () Bool)

(assert (=> b!267502 m!284031))

(check-sat (not b!267501) (not b!267502) (not b!267503) (not b!267505) (not start!25842))
(check-sat)
(get-model)

(declare-fun d!64417 () Bool)

(assert (=> d!64417 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25842 d!64417))

(declare-fun d!64427 () Bool)

(assert (=> d!64427 (= (array_inv!4095 a!3325) (bvsge (size!6497 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25842 d!64427))

(declare-fun d!64429 () Bool)

(assert (=> d!64429 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267503 d!64429))

(declare-fun d!64431 () Bool)

(declare-fun lt!134755 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!182 (List!3866) (InoxSet (_ BitVec 64)))

(assert (=> d!64431 (= lt!134755 (select (content!182 Nil!3863) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!172951 () Bool)

(assert (=> d!64431 (= lt!134755 e!172951)))

(declare-fun res!131830 () Bool)

(assert (=> d!64431 (=> (not res!131830) (not e!172951))))

(get-info :version)

(assert (=> d!64431 (= res!131830 ((_ is Cons!3862) Nil!3863))))

(assert (=> d!64431 (= (contains!1897 Nil!3863 #b1000000000000000000000000000000000000000000000000000000000000000) lt!134755)))

(declare-fun b!267560 () Bool)

(declare-fun e!172950 () Bool)

(assert (=> b!267560 (= e!172951 e!172950)))

(declare-fun res!131831 () Bool)

(assert (=> b!267560 (=> res!131831 e!172950)))

(assert (=> b!267560 (= res!131831 (= (h!4529 Nil!3863) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267561 () Bool)

(assert (=> b!267561 (= e!172950 (contains!1897 (t!8940 Nil!3863) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64431 res!131830) b!267560))

(assert (= (and b!267560 (not res!131831)) b!267561))

(declare-fun m!284071 () Bool)

(assert (=> d!64431 m!284071))

(declare-fun m!284073 () Bool)

(assert (=> d!64431 m!284073))

(declare-fun m!284075 () Bool)

(assert (=> b!267561 m!284075))

(assert (=> b!267502 d!64431))

(declare-fun d!64437 () Bool)

(declare-fun lt!134756 () Bool)

(assert (=> d!64437 (= lt!134756 (select (content!182 Nil!3863) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!172953 () Bool)

(assert (=> d!64437 (= lt!134756 e!172953)))

(declare-fun res!131832 () Bool)

(assert (=> d!64437 (=> (not res!131832) (not e!172953))))

(assert (=> d!64437 (= res!131832 ((_ is Cons!3862) Nil!3863))))

(assert (=> d!64437 (= (contains!1897 Nil!3863 #b0000000000000000000000000000000000000000000000000000000000000000) lt!134756)))

(declare-fun b!267562 () Bool)

(declare-fun e!172952 () Bool)

(assert (=> b!267562 (= e!172953 e!172952)))

(declare-fun res!131833 () Bool)

(assert (=> b!267562 (=> res!131833 e!172952)))

(assert (=> b!267562 (= res!131833 (= (h!4529 Nil!3863) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267563 () Bool)

(assert (=> b!267563 (= e!172952 (contains!1897 (t!8940 Nil!3863) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64437 res!131832) b!267562))

(assert (= (and b!267562 (not res!131833)) b!267563))

(assert (=> d!64437 m!284071))

(declare-fun m!284077 () Bool)

(assert (=> d!64437 m!284077))

(declare-fun m!284079 () Bool)

(assert (=> b!267563 m!284079))

(assert (=> b!267501 d!64437))

(declare-fun d!64439 () Bool)

(declare-fun res!131838 () Bool)

(declare-fun e!172958 () Bool)

(assert (=> d!64439 (=> res!131838 e!172958)))

(assert (=> d!64439 (= res!131838 ((_ is Nil!3863) Nil!3863))))

(assert (=> d!64439 (= (noDuplicate!116 Nil!3863) e!172958)))

(declare-fun b!267568 () Bool)

(declare-fun e!172959 () Bool)

(assert (=> b!267568 (= e!172958 e!172959)))

(declare-fun res!131841 () Bool)

(assert (=> b!267568 (=> (not res!131841) (not e!172959))))

(assert (=> b!267568 (= res!131841 (not (contains!1897 (t!8940 Nil!3863) (h!4529 Nil!3863))))))

(declare-fun b!267569 () Bool)

(assert (=> b!267569 (= e!172959 (noDuplicate!116 (t!8940 Nil!3863)))))

(assert (= (and d!64439 (not res!131838)) b!267568))

(assert (= (and b!267568 res!131841) b!267569))

(declare-fun m!284081 () Bool)

(assert (=> b!267568 m!284081))

(declare-fun m!284083 () Bool)

(assert (=> b!267569 m!284083))

(assert (=> b!267505 d!64439))

(check-sat (not b!267561) (not d!64431) (not b!267568) (not b!267563) (not b!267569) (not d!64437))
(check-sat)
