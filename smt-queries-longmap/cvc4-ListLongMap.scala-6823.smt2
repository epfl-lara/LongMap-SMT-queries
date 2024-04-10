; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85842 () Bool)

(assert start!85842)

(declare-fun res!665728 () Bool)

(declare-fun e!561660 () Bool)

(assert (=> start!85842 (=> (not res!665728) (not e!561660))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85842 (= res!665728 (validMask!0 mask!3464))))

(assert (=> start!85842 e!561660))

(declare-datatypes ((array!62976 0))(
  ( (array!62977 (arr!30324 (Array (_ BitVec 32) (_ BitVec 64))) (size!30826 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62976)

(declare-fun array_inv!23448 (array!62976) Bool)

(assert (=> start!85842 (array_inv!23448 a!3219)))

(assert (=> start!85842 true))

(declare-fun b!995364 () Bool)

(declare-fun res!665732 () Bool)

(declare-fun e!561661 () Bool)

(assert (=> b!995364 (=> (not res!665732) (not e!561661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62976 (_ BitVec 32)) Bool)

(assert (=> b!995364 (= res!665732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995365 () Bool)

(declare-fun res!665730 () Bool)

(assert (=> b!995365 (=> (not res!665730) (not e!561660))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995365 (= res!665730 (validKeyInArray!0 k!2224))))

(declare-fun b!995366 () Bool)

(declare-fun e!561659 () Bool)

(declare-datatypes ((List!21000 0))(
  ( (Nil!20997) (Cons!20996 (h!22158 (_ BitVec 64)) (t!30001 List!21000)) )
))
(declare-fun contains!5861 (List!21000 (_ BitVec 64)) Bool)

(assert (=> b!995366 (= e!561659 (contains!5861 Nil!20997 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995367 () Bool)

(declare-fun res!665729 () Bool)

(assert (=> b!995367 (=> (not res!665729) (not e!561660))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995367 (= res!665729 (and (= (size!30826 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30826 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30826 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995368 () Bool)

(assert (=> b!995368 (= e!561661 e!561659)))

(declare-fun res!665736 () Bool)

(assert (=> b!995368 (=> res!665736 e!561659)))

(assert (=> b!995368 (= res!665736 (contains!5861 Nil!20997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995369 () Bool)

(assert (=> b!995369 (= e!561660 e!561661)))

(declare-fun res!665733 () Bool)

(assert (=> b!995369 (=> (not res!665733) (not e!561661))))

(declare-datatypes ((SeekEntryResult!9256 0))(
  ( (MissingZero!9256 (index!39395 (_ BitVec 32))) (Found!9256 (index!39396 (_ BitVec 32))) (Intermediate!9256 (undefined!10068 Bool) (index!39397 (_ BitVec 32)) (x!86833 (_ BitVec 32))) (Undefined!9256) (MissingVacant!9256 (index!39398 (_ BitVec 32))) )
))
(declare-fun lt!440921 () SeekEntryResult!9256)

(assert (=> b!995369 (= res!665733 (or (= lt!440921 (MissingVacant!9256 i!1194)) (= lt!440921 (MissingZero!9256 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62976 (_ BitVec 32)) SeekEntryResult!9256)

(assert (=> b!995369 (= lt!440921 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995370 () Bool)

(declare-fun res!665734 () Bool)

(assert (=> b!995370 (=> (not res!665734) (not e!561661))))

(assert (=> b!995370 (= res!665734 (and (bvsle #b00000000000000000000000000000000 (size!30826 a!3219)) (bvslt (size!30826 a!3219) #b01111111111111111111111111111111)))))

(declare-fun b!995371 () Bool)

(declare-fun res!665735 () Bool)

(assert (=> b!995371 (=> (not res!665735) (not e!561661))))

(declare-fun noDuplicate!1459 (List!21000) Bool)

(assert (=> b!995371 (= res!665735 (noDuplicate!1459 Nil!20997))))

(declare-fun b!995372 () Bool)

(declare-fun res!665727 () Bool)

(assert (=> b!995372 (=> (not res!665727) (not e!561660))))

(declare-fun arrayContainsKey!0 (array!62976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995372 (= res!665727 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995373 () Bool)

(declare-fun res!665731 () Bool)

(assert (=> b!995373 (=> (not res!665731) (not e!561660))))

(assert (=> b!995373 (= res!665731 (validKeyInArray!0 (select (arr!30324 a!3219) j!170)))))

(assert (= (and start!85842 res!665728) b!995367))

(assert (= (and b!995367 res!665729) b!995373))

(assert (= (and b!995373 res!665731) b!995365))

(assert (= (and b!995365 res!665730) b!995372))

(assert (= (and b!995372 res!665727) b!995369))

(assert (= (and b!995369 res!665733) b!995364))

(assert (= (and b!995364 res!665732) b!995370))

(assert (= (and b!995370 res!665734) b!995371))

(assert (= (and b!995371 res!665735) b!995368))

(assert (= (and b!995368 (not res!665736)) b!995366))

(declare-fun m!922777 () Bool)

(assert (=> b!995365 m!922777))

(declare-fun m!922779 () Bool)

(assert (=> b!995366 m!922779))

(declare-fun m!922781 () Bool)

(assert (=> b!995371 m!922781))

(declare-fun m!922783 () Bool)

(assert (=> start!85842 m!922783))

(declare-fun m!922785 () Bool)

(assert (=> start!85842 m!922785))

(declare-fun m!922787 () Bool)

(assert (=> b!995369 m!922787))

(declare-fun m!922789 () Bool)

(assert (=> b!995364 m!922789))

(declare-fun m!922791 () Bool)

(assert (=> b!995372 m!922791))

(declare-fun m!922793 () Bool)

(assert (=> b!995373 m!922793))

(assert (=> b!995373 m!922793))

(declare-fun m!922795 () Bool)

(assert (=> b!995373 m!922795))

(declare-fun m!922797 () Bool)

(assert (=> b!995368 m!922797))

(push 1)

(assert (not b!995373))

(assert (not b!995372))

(assert (not start!85842))

(assert (not b!995368))

(assert (not b!995366))

(assert (not b!995365))

(assert (not b!995364))

(assert (not b!995369))

(assert (not b!995371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118843 () Bool)

(assert (=> d!118843 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85842 d!118843))

(declare-fun d!118853 () Bool)

(assert (=> d!118853 (= (array_inv!23448 a!3219) (bvsge (size!30826 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85842 d!118853))

(declare-fun d!118857 () Bool)

(declare-fun res!665759 () Bool)

(declare-fun e!561693 () Bool)

(assert (=> d!118857 (=> res!665759 e!561693)))

(assert (=> d!118857 (= res!665759 (= (select (arr!30324 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!118857 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!561693)))

(declare-fun b!995414 () Bool)

(declare-fun e!561694 () Bool)

(assert (=> b!995414 (= e!561693 e!561694)))

(declare-fun res!665760 () Bool)

(assert (=> b!995414 (=> (not res!665760) (not e!561694))))

(assert (=> b!995414 (= res!665760 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30826 a!3219)))))

(declare-fun b!995415 () Bool)

(assert (=> b!995415 (= e!561694 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118857 (not res!665759)) b!995414))

(assert (= (and b!995414 res!665760) b!995415))

(declare-fun m!922827 () Bool)

(assert (=> d!118857 m!922827))

(declare-fun m!922829 () Bool)

(assert (=> b!995415 m!922829))

(assert (=> b!995372 d!118857))

(declare-fun d!118861 () Bool)

(declare-fun lt!440942 () Bool)

(declare-fun content!483 (List!21000) (Set (_ BitVec 64)))

(assert (=> d!118861 (= lt!440942 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!483 Nil!20997)))))

(declare-fun e!561705 () Bool)

(assert (=> d!118861 (= lt!440942 e!561705)))

(declare-fun res!665769 () Bool)

(assert (=> d!118861 (=> (not res!665769) (not e!561705))))

(assert (=> d!118861 (= res!665769 (is-Cons!20996 Nil!20997))))

(assert (=> d!118861 (= (contains!5861 Nil!20997 #b1000000000000000000000000000000000000000000000000000000000000000) lt!440942)))

(declare-fun b!995428 () Bool)

(declare-fun e!561706 () Bool)

(assert (=> b!995428 (= e!561705 e!561706)))

(declare-fun res!665770 () Bool)

(assert (=> b!995428 (=> res!665770 e!561706)))

(assert (=> b!995428 (= res!665770 (= (h!22158 Nil!20997) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995429 () Bool)

(assert (=> b!995429 (= e!561706 (contains!5861 (t!30001 Nil!20997) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118861 res!665769) b!995428))

(assert (= (and b!995428 (not res!665770)) b!995429))

(declare-fun m!922831 () Bool)

(assert (=> d!118861 m!922831))

(declare-fun m!922833 () Bool)

(assert (=> d!118861 m!922833))

(declare-fun m!922835 () Bool)

(assert (=> b!995429 m!922835))

(assert (=> b!995366 d!118861))

(declare-fun d!118865 () Bool)

(declare-fun res!665775 () Bool)

(declare-fun e!561711 () Bool)

(assert (=> d!118865 (=> res!665775 e!561711)))

(assert (=> d!118865 (= res!665775 (is-Nil!20997 Nil!20997))))

(assert (=> d!118865 (= (noDuplicate!1459 Nil!20997) e!561711)))

(declare-fun b!995434 () Bool)

(declare-fun e!561712 () Bool)

(assert (=> b!995434 (= e!561711 e!561712)))

(declare-fun res!665776 () Bool)

(assert (=> b!995434 (=> (not res!665776) (not e!561712))))

(assert (=> b!995434 (= res!665776 (not (contains!5861 (t!30001 Nil!20997) (h!22158 Nil!20997))))))

(declare-fun b!995435 () Bool)

(assert (=> b!995435 (= e!561712 (noDuplicate!1459 (t!30001 Nil!20997)))))

(assert (= (and d!118865 (not res!665775)) b!995434))

(assert (= (and b!995434 res!665776) b!995435))

(declare-fun m!922837 () Bool)

(assert (=> b!995434 m!922837))

(declare-fun m!922839 () Bool)

(assert (=> b!995435 m!922839))

(assert (=> b!995371 d!118865))

(declare-fun d!118867 () Bool)

(assert (=> d!118867 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995365 d!118867))

(declare-fun b!995460 () Bool)

(declare-fun e!561734 () Bool)

(declare-fun e!561735 () Bool)

(assert (=> b!995460 (= e!561734 e!561735)))

(declare-fun lt!440957 () (_ BitVec 64))

(assert (=> b!995460 (= lt!440957 (select (arr!30324 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32960 0))(
  ( (Unit!32961) )
))
(declare-fun lt!440956 () Unit!32960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62976 (_ BitVec 64) (_ BitVec 32)) Unit!32960)

(assert (=> b!995460 (= lt!440956 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!440957 #b00000000000000000000000000000000))))

(assert (=> b!995460 (arrayContainsKey!0 a!3219 lt!440957 #b00000000000000000000000000000000)))

(declare-fun lt!440958 () Unit!32960)

(assert (=> b!995460 (= lt!440958 lt!440956)))

(declare-fun res!665796 () Bool)

(assert (=> b!995460 (= res!665796 (= (seekEntryOrOpen!0 (select (arr!30324 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9256 #b00000000000000000000000000000000)))))

(assert (=> b!995460 (=> (not res!665796) (not e!561735))))

(declare-fun b!995461 () Bool)

(declare-fun call!42200 () Bool)

(assert (=> b!995461 (= e!561735 call!42200)))

(declare-fun b!995462 () Bool)

(declare-fun e!561736 () Bool)

(assert (=> b!995462 (= e!561736 e!561734)))

(declare-fun c!100973 () Bool)

(assert (=> b!995462 (= c!100973 (validKeyInArray!0 (select (arr!30324 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118871 () Bool)

(declare-fun res!665795 () Bool)

(assert (=> d!118871 (=> res!665795 e!561736)))

(assert (=> d!118871 (= res!665795 (bvsge #b00000000000000000000000000000000 (size!30826 a!3219)))))

(assert (=> d!118871 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561736)))

(declare-fun bm!42197 () Bool)

(assert (=> bm!42197 (= call!42200 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

