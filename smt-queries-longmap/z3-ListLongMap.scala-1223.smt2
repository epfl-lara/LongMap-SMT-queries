; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25844 () Bool)

(assert start!25844)

(declare-fun b!267471 () Bool)

(declare-fun res!131772 () Bool)

(declare-fun e!172898 () Bool)

(assert (=> b!267471 (=> (not res!131772) (not e!172898))))

(declare-datatypes ((array!12989 0))(
  ( (array!12990 (arr!6147 (Array (_ BitVec 32) (_ BitVec 64))) (size!6499 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!12989)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267471 (= res!131772 (and (= (size!6499 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6499 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6499 a!3325))))))

(declare-fun b!267472 () Bool)

(declare-fun res!131768 () Bool)

(assert (=> b!267472 (=> (not res!131768) (not e!172898))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267472 (= res!131768 (validKeyInArray!0 k0!2581))))

(declare-fun b!267473 () Bool)

(declare-fun e!172896 () Bool)

(declare-datatypes ((List!3955 0))(
  ( (Nil!3952) (Cons!3951 (h!4618 (_ BitVec 64)) (t!9037 List!3955)) )
))
(declare-fun contains!1924 (List!3955 (_ BitVec 64)) Bool)

(assert (=> b!267473 (= e!172896 (contains!1924 Nil!3952 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267474 () Bool)

(assert (=> b!267474 (= e!172898 e!172896)))

(declare-fun res!131770 () Bool)

(assert (=> b!267474 (=> res!131770 e!172896)))

(assert (=> b!267474 (= res!131770 (contains!1924 Nil!3952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267475 () Bool)

(declare-fun res!131767 () Bool)

(assert (=> b!267475 (=> (not res!131767) (not e!172898))))

(assert (=> b!267475 (= res!131767 (and (bvsle #b00000000000000000000000000000000 (size!6499 a!3325)) (bvslt (size!6499 a!3325) #b01111111111111111111111111111111)))))

(declare-fun res!131771 () Bool)

(assert (=> start!25844 (=> (not res!131771) (not e!172898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25844 (= res!131771 (validMask!0 mask!3868))))

(assert (=> start!25844 e!172898))

(declare-fun array_inv!4110 (array!12989) Bool)

(assert (=> start!25844 (array_inv!4110 a!3325)))

(assert (=> start!25844 true))

(declare-fun b!267476 () Bool)

(declare-fun res!131769 () Bool)

(assert (=> b!267476 (=> (not res!131769) (not e!172898))))

(declare-fun noDuplicate!114 (List!3955) Bool)

(assert (=> b!267476 (= res!131769 (noDuplicate!114 Nil!3952))))

(assert (= (and start!25844 res!131771) b!267471))

(assert (= (and b!267471 res!131772) b!267472))

(assert (= (and b!267472 res!131768) b!267475))

(assert (= (and b!267475 res!131767) b!267476))

(assert (= (and b!267476 res!131769) b!267474))

(assert (= (and b!267474 (not res!131770)) b!267473))

(declare-fun m!283827 () Bool)

(assert (=> b!267472 m!283827))

(declare-fun m!283829 () Bool)

(assert (=> start!25844 m!283829))

(declare-fun m!283831 () Bool)

(assert (=> start!25844 m!283831))

(declare-fun m!283833 () Bool)

(assert (=> b!267476 m!283833))

(declare-fun m!283835 () Bool)

(assert (=> b!267473 m!283835))

(declare-fun m!283837 () Bool)

(assert (=> b!267474 m!283837))

(check-sat (not b!267474) (not b!267476) (not start!25844) (not b!267472) (not b!267473))
(check-sat)
(get-model)

(declare-fun d!64347 () Bool)

(assert (=> d!64347 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267472 d!64347))

(declare-fun d!64349 () Bool)

(declare-fun lt!134692 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!181 (List!3955) (InoxSet (_ BitVec 64)))

(assert (=> d!64349 (= lt!134692 (select (content!181 Nil!3952) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!172912 () Bool)

(assert (=> d!64349 (= lt!134692 e!172912)))

(declare-fun res!131796 () Bool)

(assert (=> d!64349 (=> (not res!131796) (not e!172912))))

(get-info :version)

(assert (=> d!64349 (= res!131796 ((_ is Cons!3951) Nil!3952))))

(assert (=> d!64349 (= (contains!1924 Nil!3952 #b1000000000000000000000000000000000000000000000000000000000000000) lt!134692)))

(declare-fun b!267499 () Bool)

(declare-fun e!172913 () Bool)

(assert (=> b!267499 (= e!172912 e!172913)))

(declare-fun res!131795 () Bool)

(assert (=> b!267499 (=> res!131795 e!172913)))

(assert (=> b!267499 (= res!131795 (= (h!4618 Nil!3952) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267500 () Bool)

(assert (=> b!267500 (= e!172913 (contains!1924 (t!9037 Nil!3952) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64349 res!131796) b!267499))

(assert (= (and b!267499 (not res!131795)) b!267500))

(declare-fun m!283851 () Bool)

(assert (=> d!64349 m!283851))

(declare-fun m!283853 () Bool)

(assert (=> d!64349 m!283853))

(declare-fun m!283855 () Bool)

(assert (=> b!267500 m!283855))

(assert (=> b!267473 d!64349))

(declare-fun d!64351 () Bool)

(declare-fun res!131801 () Bool)

(declare-fun e!172918 () Bool)

(assert (=> d!64351 (=> res!131801 e!172918)))

(assert (=> d!64351 (= res!131801 ((_ is Nil!3952) Nil!3952))))

(assert (=> d!64351 (= (noDuplicate!114 Nil!3952) e!172918)))

(declare-fun b!267505 () Bool)

(declare-fun e!172919 () Bool)

(assert (=> b!267505 (= e!172918 e!172919)))

(declare-fun res!131802 () Bool)

(assert (=> b!267505 (=> (not res!131802) (not e!172919))))

(assert (=> b!267505 (= res!131802 (not (contains!1924 (t!9037 Nil!3952) (h!4618 Nil!3952))))))

(declare-fun b!267506 () Bool)

(assert (=> b!267506 (= e!172919 (noDuplicate!114 (t!9037 Nil!3952)))))

(assert (= (and d!64351 (not res!131801)) b!267505))

(assert (= (and b!267505 res!131802) b!267506))

(declare-fun m!283857 () Bool)

(assert (=> b!267505 m!283857))

(declare-fun m!283859 () Bool)

(assert (=> b!267506 m!283859))

(assert (=> b!267476 d!64351))

(declare-fun d!64353 () Bool)

(assert (=> d!64353 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25844 d!64353))

(declare-fun d!64361 () Bool)

(assert (=> d!64361 (= (array_inv!4110 a!3325) (bvsge (size!6499 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25844 d!64361))

(declare-fun d!64367 () Bool)

(declare-fun lt!134696 () Bool)

(assert (=> d!64367 (= lt!134696 (select (content!181 Nil!3952) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!172926 () Bool)

(assert (=> d!64367 (= lt!134696 e!172926)))

(declare-fun res!131810 () Bool)

(assert (=> d!64367 (=> (not res!131810) (not e!172926))))

(assert (=> d!64367 (= res!131810 ((_ is Cons!3951) Nil!3952))))

(assert (=> d!64367 (= (contains!1924 Nil!3952 #b0000000000000000000000000000000000000000000000000000000000000000) lt!134696)))

(declare-fun b!267513 () Bool)

(declare-fun e!172927 () Bool)

(assert (=> b!267513 (= e!172926 e!172927)))

(declare-fun res!131809 () Bool)

(assert (=> b!267513 (=> res!131809 e!172927)))

(assert (=> b!267513 (= res!131809 (= (h!4618 Nil!3952) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!267514 () Bool)

(assert (=> b!267514 (= e!172927 (contains!1924 (t!9037 Nil!3952) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64367 res!131810) b!267513))

(assert (= (and b!267513 (not res!131809)) b!267514))

(assert (=> d!64367 m!283851))

(declare-fun m!283867 () Bool)

(assert (=> d!64367 m!283867))

(declare-fun m!283869 () Bool)

(assert (=> b!267514 m!283869))

(assert (=> b!267474 d!64367))

(check-sat (not b!267500) (not d!64367) (not d!64349) (not b!267506) (not b!267505) (not b!267514))
(check-sat)
