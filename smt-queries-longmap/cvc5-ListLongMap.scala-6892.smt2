; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86606 () Bool)

(assert start!86606)

(declare-fun b!1004487 () Bool)

(declare-fun res!673970 () Bool)

(declare-fun e!565629 () Bool)

(assert (=> b!1004487 (=> (not res!673970) (not e!565629))))

(declare-datatypes ((array!63407 0))(
  ( (array!63408 (arr!30529 (Array (_ BitVec 32) (_ BitVec 64))) (size!31031 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63407)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004487 (= res!673970 (validKeyInArray!0 (select (arr!30529 a!3219) j!170)))))

(declare-fun b!1004488 () Bool)

(declare-fun e!565633 () Bool)

(declare-fun e!565631 () Bool)

(assert (=> b!1004488 (= e!565633 e!565631)))

(declare-fun res!673973 () Bool)

(assert (=> b!1004488 (=> (not res!673973) (not e!565631))))

(declare-datatypes ((SeekEntryResult!9461 0))(
  ( (MissingZero!9461 (index!40215 (_ BitVec 32))) (Found!9461 (index!40216 (_ BitVec 32))) (Intermediate!9461 (undefined!10273 Bool) (index!40217 (_ BitVec 32)) (x!87617 (_ BitVec 32))) (Undefined!9461) (MissingVacant!9461 (index!40218 (_ BitVec 32))) )
))
(declare-fun lt!444200 () SeekEntryResult!9461)

(declare-fun lt!444201 () SeekEntryResult!9461)

(assert (=> b!1004488 (= res!673973 (= lt!444200 lt!444201))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004488 (= lt!444201 (Intermediate!9461 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63407 (_ BitVec 32)) SeekEntryResult!9461)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004488 (= lt!444200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30529 a!3219) j!170) mask!3464) (select (arr!30529 a!3219) j!170) a!3219 mask!3464))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun e!565628 () Bool)

(declare-fun b!1004489 () Bool)

(assert (=> b!1004489 (= e!565628 (and (= index!1507 resIndex!38) (not (= x!1245 resX!38))))))

(declare-fun b!1004490 () Bool)

(declare-fun res!673976 () Bool)

(assert (=> b!1004490 (=> (not res!673976) (not e!565629))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004490 (= res!673976 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004491 () Bool)

(declare-fun res!673966 () Bool)

(assert (=> b!1004491 (=> (not res!673966) (not e!565633))))

(declare-datatypes ((List!21205 0))(
  ( (Nil!21202) (Cons!21201 (h!22378 (_ BitVec 64)) (t!30206 List!21205)) )
))
(declare-fun arrayNoDuplicates!0 (array!63407 (_ BitVec 32) List!21205) Bool)

(assert (=> b!1004491 (= res!673966 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21202))))

(declare-fun b!1004492 () Bool)

(declare-fun res!673967 () Bool)

(assert (=> b!1004492 (=> (not res!673967) (not e!565633))))

(assert (=> b!1004492 (= res!673967 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31031 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31031 a!3219))))))

(declare-fun b!1004493 () Bool)

(declare-fun res!673974 () Bool)

(assert (=> b!1004493 (=> (not res!673974) (not e!565628))))

(declare-fun lt!444203 () (_ BitVec 64))

(declare-fun lt!444202 () array!63407)

(declare-fun lt!444198 () SeekEntryResult!9461)

(assert (=> b!1004493 (= res!673974 (not (= lt!444198 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444203 lt!444202 mask!3464))))))

(declare-fun b!1004494 () Bool)

(declare-fun res!673977 () Bool)

(assert (=> b!1004494 (=> (not res!673977) (not e!565633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63407 (_ BitVec 32)) Bool)

(assert (=> b!1004494 (= res!673977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004495 () Bool)

(declare-fun e!565632 () Bool)

(assert (=> b!1004495 (= e!565632 e!565628)))

(declare-fun res!673965 () Bool)

(assert (=> b!1004495 (=> (not res!673965) (not e!565628))))

(assert (=> b!1004495 (= res!673965 (not (= lt!444200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444203 mask!3464) lt!444203 lt!444202 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004495 (= lt!444203 (select (store (arr!30529 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004495 (= lt!444202 (array!63408 (store (arr!30529 a!3219) i!1194 k!2224) (size!31031 a!3219)))))

(declare-fun res!673971 () Bool)

(assert (=> start!86606 (=> (not res!673971) (not e!565629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86606 (= res!673971 (validMask!0 mask!3464))))

(assert (=> start!86606 e!565629))

(declare-fun array_inv!23653 (array!63407) Bool)

(assert (=> start!86606 (array_inv!23653 a!3219)))

(assert (=> start!86606 true))

(declare-fun b!1004496 () Bool)

(assert (=> b!1004496 (= e!565629 e!565633)))

(declare-fun res!673975 () Bool)

(assert (=> b!1004496 (=> (not res!673975) (not e!565633))))

(declare-fun lt!444199 () SeekEntryResult!9461)

(assert (=> b!1004496 (= res!673975 (or (= lt!444199 (MissingVacant!9461 i!1194)) (= lt!444199 (MissingZero!9461 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63407 (_ BitVec 32)) SeekEntryResult!9461)

(assert (=> b!1004496 (= lt!444199 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1004497 () Bool)

(declare-fun res!673972 () Bool)

(assert (=> b!1004497 (=> (not res!673972) (not e!565629))))

(assert (=> b!1004497 (= res!673972 (validKeyInArray!0 k!2224))))

(declare-fun b!1004498 () Bool)

(declare-fun res!673969 () Bool)

(assert (=> b!1004498 (=> (not res!673969) (not e!565629))))

(assert (=> b!1004498 (= res!673969 (and (= (size!31031 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31031 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31031 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004499 () Bool)

(assert (=> b!1004499 (= e!565631 e!565632)))

(declare-fun res!673968 () Bool)

(assert (=> b!1004499 (=> (not res!673968) (not e!565632))))

(assert (=> b!1004499 (= res!673968 (= lt!444198 lt!444201))))

(assert (=> b!1004499 (= lt!444198 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30529 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86606 res!673971) b!1004498))

(assert (= (and b!1004498 res!673969) b!1004487))

(assert (= (and b!1004487 res!673970) b!1004497))

(assert (= (and b!1004497 res!673972) b!1004490))

(assert (= (and b!1004490 res!673976) b!1004496))

(assert (= (and b!1004496 res!673975) b!1004494))

(assert (= (and b!1004494 res!673977) b!1004491))

(assert (= (and b!1004491 res!673966) b!1004492))

(assert (= (and b!1004492 res!673967) b!1004488))

(assert (= (and b!1004488 res!673973) b!1004499))

(assert (= (and b!1004499 res!673968) b!1004495))

(assert (= (and b!1004495 res!673965) b!1004493))

(assert (= (and b!1004493 res!673974) b!1004489))

(declare-fun m!930029 () Bool)

(assert (=> b!1004496 m!930029))

(declare-fun m!930031 () Bool)

(assert (=> start!86606 m!930031))

(declare-fun m!930033 () Bool)

(assert (=> start!86606 m!930033))

(declare-fun m!930035 () Bool)

(assert (=> b!1004494 m!930035))

(declare-fun m!930037 () Bool)

(assert (=> b!1004487 m!930037))

(assert (=> b!1004487 m!930037))

(declare-fun m!930039 () Bool)

(assert (=> b!1004487 m!930039))

(assert (=> b!1004488 m!930037))

(assert (=> b!1004488 m!930037))

(declare-fun m!930041 () Bool)

(assert (=> b!1004488 m!930041))

(assert (=> b!1004488 m!930041))

(assert (=> b!1004488 m!930037))

(declare-fun m!930043 () Bool)

(assert (=> b!1004488 m!930043))

(assert (=> b!1004499 m!930037))

(assert (=> b!1004499 m!930037))

(declare-fun m!930045 () Bool)

(assert (=> b!1004499 m!930045))

(declare-fun m!930047 () Bool)

(assert (=> b!1004490 m!930047))

(declare-fun m!930049 () Bool)

(assert (=> b!1004495 m!930049))

(assert (=> b!1004495 m!930049))

(declare-fun m!930051 () Bool)

(assert (=> b!1004495 m!930051))

(declare-fun m!930053 () Bool)

(assert (=> b!1004495 m!930053))

(declare-fun m!930055 () Bool)

(assert (=> b!1004495 m!930055))

(declare-fun m!930057 () Bool)

(assert (=> b!1004497 m!930057))

(declare-fun m!930059 () Bool)

(assert (=> b!1004493 m!930059))

(declare-fun m!930061 () Bool)

(assert (=> b!1004491 m!930061))

(push 1)

(assert (not start!86606))

(assert (not b!1004493))

(assert (not b!1004487))

(assert (not b!1004495))

(assert (not b!1004488))

(assert (not b!1004490))

(assert (not b!1004496))

(assert (not b!1004491))

(assert (not b!1004497))

(assert (not b!1004499))

(assert (not b!1004494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1004692 () Bool)

(declare-fun e!565736 () SeekEntryResult!9461)

(declare-fun e!565735 () SeekEntryResult!9461)

(assert (=> b!1004692 (= e!565736 e!565735)))

(declare-fun lt!444284 () (_ BitVec 64))

(declare-fun lt!444286 () SeekEntryResult!9461)

(assert (=> b!1004692 (= lt!444284 (select (arr!30529 a!3219) (index!40217 lt!444286)))))

(declare-fun c!101453 () Bool)

(assert (=> b!1004692 (= c!101453 (= lt!444284 k!2224))))

(declare-fun b!1004693 () Bool)

(assert (=> b!1004693 (= e!565736 Undefined!9461)))

(declare-fun b!1004694 () Bool)

(declare-fun e!565734 () SeekEntryResult!9461)

(assert (=> b!1004694 (= e!565734 (MissingZero!9461 (index!40217 lt!444286)))))

(declare-fun d!119419 () Bool)

(declare-fun lt!444285 () SeekEntryResult!9461)

(assert (=> d!119419 (and (or (is-Undefined!9461 lt!444285) (not (is-Found!9461 lt!444285)) (and (bvsge (index!40216 lt!444285) #b00000000000000000000000000000000) (bvslt (index!40216 lt!444285) (size!31031 a!3219)))) (or (is-Undefined!9461 lt!444285) (is-Found!9461 lt!444285) (not (is-MissingZero!9461 lt!444285)) (and (bvsge (index!40215 lt!444285) #b00000000000000000000000000000000) (bvslt (index!40215 lt!444285) (size!31031 a!3219)))) (or (is-Undefined!9461 lt!444285) (is-Found!9461 lt!444285) (is-MissingZero!9461 lt!444285) (not (is-MissingVacant!9461 lt!444285)) (and (bvsge (index!40218 lt!444285) #b00000000000000000000000000000000) (bvslt (index!40218 lt!444285) (size!31031 a!3219)))) (or (is-Undefined!9461 lt!444285) (ite (is-Found!9461 lt!444285) (= (select (arr!30529 a!3219) (index!40216 lt!444285)) k!2224) (ite (is-MissingZero!9461 lt!444285) (= (select (arr!30529 a!3219) (index!40215 lt!444285)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9461 lt!444285) (= (select (arr!30529 a!3219) (index!40218 lt!444285)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119419 (= lt!444285 e!565736)))

(declare-fun c!101452 () Bool)

(assert (=> d!119419 (= c!101452 (and (is-Intermediate!9461 lt!444286) (undefined!10273 lt!444286)))))

(assert (=> d!119419 (= lt!444286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119419 (validMask!0 mask!3464)))

(assert (=> d!119419 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!444285)))

(declare-fun b!1004695 () Bool)

(assert (=> b!1004695 (= e!565735 (Found!9461 (index!40217 lt!444286)))))

(declare-fun b!1004696 () Bool)

(declare-fun c!101451 () Bool)

(assert (=> b!1004696 (= c!101451 (= lt!444284 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004696 (= e!565735 e!565734)))

(declare-fun b!1004697 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63407 (_ BitVec 32)) SeekEntryResult!9461)

(assert (=> b!1004697 (= e!565734 (seekKeyOrZeroReturnVacant!0 (x!87617 lt!444286) (index!40217 lt!444286) (index!40217 lt!444286) k!2224 a!3219 mask!3464))))

(assert (= (and d!119419 c!101452) b!1004693))

(assert (= (and d!119419 (not c!101452)) b!1004692))

(assert (= (and b!1004692 c!101453) b!1004695))

(assert (= (and b!1004692 (not c!101453)) b!1004696))

(assert (= (and b!1004696 c!101451) b!1004694))

(assert (= (and b!1004696 (not c!101451)) b!1004697))

(declare-fun m!930187 () Bool)

(assert (=> b!1004692 m!930187))

(declare-fun m!930189 () Bool)

(assert (=> d!119419 m!930189))

(declare-fun m!930191 () Bool)

(assert (=> d!119419 m!930191))

(declare-fun m!930193 () Bool)

(assert (=> d!119419 m!930193))

(assert (=> d!119419 m!930191))

(declare-fun m!930195 () Bool)

(assert (=> d!119419 m!930195))

(declare-fun m!930197 () Bool)

(assert (=> d!119419 m!930197))

(assert (=> d!119419 m!930031))

(declare-fun m!930199 () Bool)

(assert (=> b!1004697 m!930199))

(assert (=> b!1004496 d!119419))

(declare-fun b!1004714 () Bool)

(declare-fun e!565754 () Bool)

(declare-fun e!565752 () Bool)

(assert (=> b!1004714 (= e!565754 e!565752)))

(declare-fun res!674100 () Bool)

(assert (=> b!1004714 (=> (not res!674100) (not e!565752))))

(declare-fun e!565751 () Bool)

(assert (=> b!1004714 (= res!674100 (not e!565751))))

(declare-fun res!674101 () Bool)

(assert (=> b!1004714 (=> (not res!674101) (not e!565751))))

(assert (=> b!1004714 (= res!674101 (validKeyInArray!0 (select (arr!30529 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004716 () Bool)

(declare-fun contains!5880 (List!21205 (_ BitVec 64)) Bool)

(assert (=> b!1004716 (= e!565751 (contains!5880 Nil!21202 (select (arr!30529 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1004717 () Bool)

(declare-fun e!565753 () Bool)

(declare-fun call!42317 () Bool)

(assert (=> b!1004717 (= e!565753 call!42317)))

(declare-fun bm!42314 () Bool)

(declare-fun c!101456 () Bool)

(assert (=> bm!42314 (= call!42317 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101456 (Cons!21201 (select (arr!30529 a!3219) #b00000000000000000000000000000000) Nil!21202) Nil!21202)))))

(declare-fun b!1004718 () Bool)

(assert (=> b!1004718 (= e!565753 call!42317)))

(declare-fun b!1004715 () Bool)

(assert (=> b!1004715 (= e!565752 e!565753)))

(assert (=> b!1004715 (= c!101456 (validKeyInArray!0 (select (arr!30529 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119433 () Bool)

(declare-fun res!674102 () Bool)

(assert (=> d!119433 (=> res!674102 e!565754)))

(assert (=> d!119433 (= res!674102 (bvsge #b00000000000000000000000000000000 (size!31031 a!3219)))))

(assert (=> d!119433 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21202) e!565754)))

(assert (= (and d!119433 (not res!674102)) b!1004714))

(assert (= (and b!1004714 res!674101) b!1004716))

(assert (= (and b!1004714 res!674100) b!1004715))

(assert (= (and b!1004715 c!101456) b!1004717))

(assert (= (and b!1004715 (not c!101456)) b!1004718))

(assert (= (or b!1004717 b!1004718) bm!42314))

(declare-fun m!930203 () Bool)

(assert (=> b!1004714 m!930203))

(assert (=> b!1004714 m!930203))

(declare-fun m!930205 () Bool)

(assert (=> b!1004714 m!930205))

(assert (=> b!1004716 m!930203))

(assert (=> b!1004716 m!930203))

(declare-fun m!930207 () Bool)

(assert (=> b!1004716 m!930207))

(assert (=> bm!42314 m!930203))

(declare-fun m!930209 () Bool)

(assert (=> bm!42314 m!930209))

(assert (=> b!1004715 m!930203))

(assert (=> b!1004715 m!930203))

(assert (=> b!1004715 m!930205))

(assert (=> b!1004491 d!119433))

(declare-fun d!119439 () Bool)

(declare-fun res!674107 () Bool)

(declare-fun e!565759 () Bool)

(assert (=> d!119439 (=> res!674107 e!565759)))

(assert (=> d!119439 (= res!674107 (= (select (arr!30529 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119439 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!565759)))

(declare-fun b!1004723 () Bool)

(declare-fun e!565760 () Bool)

(assert (=> b!1004723 (= e!565759 e!565760)))

(declare-fun res!674108 () Bool)

(assert (=> b!1004723 (=> (not res!674108) (not e!565760))))

(assert (=> b!1004723 (= res!674108 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31031 a!3219)))))

(declare-fun b!1004724 () Bool)

(assert (=> b!1004724 (= e!565760 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119439 (not res!674107)) b!1004723))

(assert (= (and b!1004723 res!674108) b!1004724))

(assert (=> d!119439 m!930203))

(declare-fun m!930211 () Bool)

(assert (=> b!1004724 m!930211))

(assert (=> b!1004490 d!119439))

(declare-fun d!119441 () Bool)

(assert (=> d!119441 (= (validKeyInArray!0 (select (arr!30529 a!3219) j!170)) (and (not (= (select (arr!30529 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30529 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004487 d!119441))

(declare-fun d!119443 () Bool)

(assert (=> d!119443 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1004497 d!119443))

(declare-fun d!119445 () Bool)

(assert (=> d!119445 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86606 d!119445))

(declare-fun d!119453 () Bool)

(assert (=> d!119453 (= (array_inv!23653 a!3219) (bvsge (size!31031 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86606 d!119453))

(declare-fun b!1004830 () Bool)

(declare-fun e!565832 () SeekEntryResult!9461)

(declare-fun e!565829 () SeekEntryResult!9461)

(assert (=> b!1004830 (= e!565832 e!565829)))

(declare-fun lt!444325 () (_ BitVec 64))

(declare-fun c!101491 () Bool)

(assert (=> b!1004830 (= c!101491 (or (= lt!444325 (select (arr!30529 a!3219) j!170)) (= (bvadd lt!444325 lt!444325) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004831 () Bool)

(assert (=> b!1004831 (= e!565829 (Intermediate!9461 false (toIndex!0 (select (arr!30529 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004832 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004832 (= e!565829 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30529 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30529 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004833 () Bool)

(assert (=> b!1004833 (= e!565832 (Intermediate!9461 true (toIndex!0 (select (arr!30529 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004834 () Bool)

(declare-fun lt!444326 () SeekEntryResult!9461)

(assert (=> b!1004834 (and (bvsge (index!40217 lt!444326) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444326) (size!31031 a!3219)))))

(declare-fun e!565830 () Bool)

(assert (=> b!1004834 (= e!565830 (= (select (arr!30529 a!3219) (index!40217 lt!444326)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004835 () Bool)

(declare-fun e!565828 () Bool)

(assert (=> b!1004835 (= e!565828 (bvsge (x!87617 lt!444326) #b01111111111111111111111111111110))))

(declare-fun d!119455 () Bool)

(assert (=> d!119455 e!565828))

(declare-fun c!101492 () Bool)

(assert (=> d!119455 (= c!101492 (and (is-Intermediate!9461 lt!444326) (undefined!10273 lt!444326)))))

(assert (=> d!119455 (= lt!444326 e!565832)))

(declare-fun c!101490 () Bool)

(assert (=> d!119455 (= c!101490 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119455 (= lt!444325 (select (arr!30529 a!3219) (toIndex!0 (select (arr!30529 a!3219) j!170) mask!3464)))))

(assert (=> d!119455 (validMask!0 mask!3464)))

(assert (=> d!119455 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30529 a!3219) j!170) mask!3464) (select (arr!30529 a!3219) j!170) a!3219 mask!3464) lt!444326)))

(declare-fun b!1004836 () Bool)

(assert (=> b!1004836 (and (bvsge (index!40217 lt!444326) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444326) (size!31031 a!3219)))))

(declare-fun res!674148 () Bool)

(assert (=> b!1004836 (= res!674148 (= (select (arr!30529 a!3219) (index!40217 lt!444326)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004836 (=> res!674148 e!565830)))

(declare-fun b!1004837 () Bool)

(declare-fun e!565831 () Bool)

(assert (=> b!1004837 (= e!565828 e!565831)))

(declare-fun res!674149 () Bool)

(assert (=> b!1004837 (= res!674149 (and (is-Intermediate!9461 lt!444326) (not (undefined!10273 lt!444326)) (bvslt (x!87617 lt!444326) #b01111111111111111111111111111110) (bvsge (x!87617 lt!444326) #b00000000000000000000000000000000) (bvsge (x!87617 lt!444326) #b00000000000000000000000000000000)))))

(assert (=> b!1004837 (=> (not res!674149) (not e!565831))))

(declare-fun b!1004838 () Bool)

(assert (=> b!1004838 (and (bvsge (index!40217 lt!444326) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444326) (size!31031 a!3219)))))

(declare-fun res!674150 () Bool)

(assert (=> b!1004838 (= res!674150 (= (select (arr!30529 a!3219) (index!40217 lt!444326)) (select (arr!30529 a!3219) j!170)))))

(assert (=> b!1004838 (=> res!674150 e!565830)))

(assert (=> b!1004838 (= e!565831 e!565830)))

(assert (= (and d!119455 c!101490) b!1004833))

(assert (= (and d!119455 (not c!101490)) b!1004830))

(assert (= (and b!1004830 c!101491) b!1004831))

(assert (= (and b!1004830 (not c!101491)) b!1004832))

(assert (= (and d!119455 c!101492) b!1004835))

(assert (= (and d!119455 (not c!101492)) b!1004837))

(assert (= (and b!1004837 res!674149) b!1004838))

(assert (= (and b!1004838 (not res!674150)) b!1004836))

(assert (= (and b!1004836 (not res!674148)) b!1004834))

(assert (=> d!119455 m!930041))

(declare-fun m!930269 () Bool)

(assert (=> d!119455 m!930269))

(assert (=> d!119455 m!930031))

(declare-fun m!930271 () Bool)

(assert (=> b!1004836 m!930271))

(assert (=> b!1004832 m!930041))

(declare-fun m!930273 () Bool)

(assert (=> b!1004832 m!930273))

(assert (=> b!1004832 m!930273))

(assert (=> b!1004832 m!930037))

(declare-fun m!930275 () Bool)

(assert (=> b!1004832 m!930275))

(assert (=> b!1004838 m!930271))

(assert (=> b!1004834 m!930271))

(assert (=> b!1004488 d!119455))

(declare-fun d!119469 () Bool)

(declare-fun lt!444332 () (_ BitVec 32))

(declare-fun lt!444331 () (_ BitVec 32))

(assert (=> d!119469 (= lt!444332 (bvmul (bvxor lt!444331 (bvlshr lt!444331 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119469 (= lt!444331 ((_ extract 31 0) (bvand (bvxor (select (arr!30529 a!3219) j!170) (bvlshr (select (arr!30529 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119469 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674157 (let ((h!22383 ((_ extract 31 0) (bvand (bvxor (select (arr!30529 a!3219) j!170) (bvlshr (select (arr!30529 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87625 (bvmul (bvxor h!22383 (bvlshr h!22383 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87625 (bvlshr x!87625 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674157 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674157 #b00000000000000000000000000000000))))))

(assert (=> d!119469 (= (toIndex!0 (select (arr!30529 a!3219) j!170) mask!3464) (bvand (bvxor lt!444332 (bvlshr lt!444332 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004488 d!119469))

(declare-fun b!1004845 () Bool)

(declare-fun e!565843 () SeekEntryResult!9461)

(declare-fun e!565840 () SeekEntryResult!9461)

(assert (=> b!1004845 (= e!565843 e!565840)))

(declare-fun c!101494 () Bool)

(declare-fun lt!444333 () (_ BitVec 64))

(assert (=> b!1004845 (= c!101494 (or (= lt!444333 (select (arr!30529 a!3219) j!170)) (= (bvadd lt!444333 lt!444333) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004846 () Bool)

(assert (=> b!1004846 (= e!565840 (Intermediate!9461 false index!1507 x!1245))))

(declare-fun b!1004847 () Bool)

(assert (=> b!1004847 (= e!565840 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30529 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004848 () Bool)

(assert (=> b!1004848 (= e!565843 (Intermediate!9461 true index!1507 x!1245))))

(declare-fun b!1004849 () Bool)

(declare-fun lt!444334 () SeekEntryResult!9461)

(assert (=> b!1004849 (and (bvsge (index!40217 lt!444334) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444334) (size!31031 a!3219)))))

(declare-fun e!565841 () Bool)

(assert (=> b!1004849 (= e!565841 (= (select (arr!30529 a!3219) (index!40217 lt!444334)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004850 () Bool)

(declare-fun e!565839 () Bool)

(assert (=> b!1004850 (= e!565839 (bvsge (x!87617 lt!444334) #b01111111111111111111111111111110))))

(declare-fun d!119473 () Bool)

(assert (=> d!119473 e!565839))

(declare-fun c!101495 () Bool)

(assert (=> d!119473 (= c!101495 (and (is-Intermediate!9461 lt!444334) (undefined!10273 lt!444334)))))

(assert (=> d!119473 (= lt!444334 e!565843)))

(declare-fun c!101493 () Bool)

(assert (=> d!119473 (= c!101493 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119473 (= lt!444333 (select (arr!30529 a!3219) index!1507))))

(assert (=> d!119473 (validMask!0 mask!3464)))

(assert (=> d!119473 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30529 a!3219) j!170) a!3219 mask!3464) lt!444334)))

(declare-fun b!1004851 () Bool)

(assert (=> b!1004851 (and (bvsge (index!40217 lt!444334) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444334) (size!31031 a!3219)))))

(declare-fun res!674158 () Bool)

(assert (=> b!1004851 (= res!674158 (= (select (arr!30529 a!3219) (index!40217 lt!444334)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004851 (=> res!674158 e!565841)))

(declare-fun b!1004852 () Bool)

(declare-fun e!565842 () Bool)

(assert (=> b!1004852 (= e!565839 e!565842)))

(declare-fun res!674159 () Bool)

(assert (=> b!1004852 (= res!674159 (and (is-Intermediate!9461 lt!444334) (not (undefined!10273 lt!444334)) (bvslt (x!87617 lt!444334) #b01111111111111111111111111111110) (bvsge (x!87617 lt!444334) #b00000000000000000000000000000000) (bvsge (x!87617 lt!444334) x!1245)))))

(assert (=> b!1004852 (=> (not res!674159) (not e!565842))))

(declare-fun b!1004853 () Bool)

(assert (=> b!1004853 (and (bvsge (index!40217 lt!444334) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444334) (size!31031 a!3219)))))

(declare-fun res!674160 () Bool)

(assert (=> b!1004853 (= res!674160 (= (select (arr!30529 a!3219) (index!40217 lt!444334)) (select (arr!30529 a!3219) j!170)))))

(assert (=> b!1004853 (=> res!674160 e!565841)))

(assert (=> b!1004853 (= e!565842 e!565841)))

(assert (= (and d!119473 c!101493) b!1004848))

(assert (= (and d!119473 (not c!101493)) b!1004845))

(assert (= (and b!1004845 c!101494) b!1004846))

(assert (= (and b!1004845 (not c!101494)) b!1004847))

(assert (= (and d!119473 c!101495) b!1004850))

(assert (= (and d!119473 (not c!101495)) b!1004852))

(assert (= (and b!1004852 res!674159) b!1004853))

(assert (= (and b!1004853 (not res!674160)) b!1004851))

(assert (= (and b!1004851 (not res!674158)) b!1004849))

(declare-fun m!930279 () Bool)

(assert (=> d!119473 m!930279))

(assert (=> d!119473 m!930031))

(declare-fun m!930281 () Bool)

(assert (=> b!1004851 m!930281))

(declare-fun m!930283 () Bool)

(assert (=> b!1004847 m!930283))

(assert (=> b!1004847 m!930283))

(assert (=> b!1004847 m!930037))

(declare-fun m!930285 () Bool)

(assert (=> b!1004847 m!930285))

(assert (=> b!1004853 m!930281))

(assert (=> b!1004849 m!930281))

(assert (=> b!1004499 d!119473))

(declare-fun b!1004854 () Bool)

(declare-fun e!565848 () SeekEntryResult!9461)

(declare-fun e!565845 () SeekEntryResult!9461)

(assert (=> b!1004854 (= e!565848 e!565845)))

(declare-fun c!101497 () Bool)

(declare-fun lt!444335 () (_ BitVec 64))

(assert (=> b!1004854 (= c!101497 (or (= lt!444335 lt!444203) (= (bvadd lt!444335 lt!444335) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004855 () Bool)

(assert (=> b!1004855 (= e!565845 (Intermediate!9461 false index!1507 x!1245))))

(declare-fun b!1004856 () Bool)

(assert (=> b!1004856 (= e!565845 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444203 lt!444202 mask!3464))))

(declare-fun b!1004857 () Bool)

(assert (=> b!1004857 (= e!565848 (Intermediate!9461 true index!1507 x!1245))))

(declare-fun b!1004858 () Bool)

(declare-fun lt!444336 () SeekEntryResult!9461)

(assert (=> b!1004858 (and (bvsge (index!40217 lt!444336) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444336) (size!31031 lt!444202)))))

(declare-fun e!565846 () Bool)

(assert (=> b!1004858 (= e!565846 (= (select (arr!30529 lt!444202) (index!40217 lt!444336)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004859 () Bool)

(declare-fun e!565844 () Bool)

(assert (=> b!1004859 (= e!565844 (bvsge (x!87617 lt!444336) #b01111111111111111111111111111110))))

(declare-fun d!119475 () Bool)

(assert (=> d!119475 e!565844))

(declare-fun c!101498 () Bool)

(assert (=> d!119475 (= c!101498 (and (is-Intermediate!9461 lt!444336) (undefined!10273 lt!444336)))))

(assert (=> d!119475 (= lt!444336 e!565848)))

(declare-fun c!101496 () Bool)

(assert (=> d!119475 (= c!101496 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119475 (= lt!444335 (select (arr!30529 lt!444202) index!1507))))

(assert (=> d!119475 (validMask!0 mask!3464)))

(assert (=> d!119475 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444203 lt!444202 mask!3464) lt!444336)))

(declare-fun b!1004860 () Bool)

(assert (=> b!1004860 (and (bvsge (index!40217 lt!444336) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444336) (size!31031 lt!444202)))))

(declare-fun res!674161 () Bool)

(assert (=> b!1004860 (= res!674161 (= (select (arr!30529 lt!444202) (index!40217 lt!444336)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004860 (=> res!674161 e!565846)))

(declare-fun b!1004861 () Bool)

(declare-fun e!565847 () Bool)

(assert (=> b!1004861 (= e!565844 e!565847)))

(declare-fun res!674162 () Bool)

(assert (=> b!1004861 (= res!674162 (and (is-Intermediate!9461 lt!444336) (not (undefined!10273 lt!444336)) (bvslt (x!87617 lt!444336) #b01111111111111111111111111111110) (bvsge (x!87617 lt!444336) #b00000000000000000000000000000000) (bvsge (x!87617 lt!444336) x!1245)))))

(assert (=> b!1004861 (=> (not res!674162) (not e!565847))))

(declare-fun b!1004862 () Bool)

(assert (=> b!1004862 (and (bvsge (index!40217 lt!444336) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444336) (size!31031 lt!444202)))))

(declare-fun res!674163 () Bool)

(assert (=> b!1004862 (= res!674163 (= (select (arr!30529 lt!444202) (index!40217 lt!444336)) lt!444203))))

(assert (=> b!1004862 (=> res!674163 e!565846)))

(assert (=> b!1004862 (= e!565847 e!565846)))

(assert (= (and d!119475 c!101496) b!1004857))

(assert (= (and d!119475 (not c!101496)) b!1004854))

(assert (= (and b!1004854 c!101497) b!1004855))

(assert (= (and b!1004854 (not c!101497)) b!1004856))

(assert (= (and d!119475 c!101498) b!1004859))

(assert (= (and d!119475 (not c!101498)) b!1004861))

(assert (= (and b!1004861 res!674162) b!1004862))

(assert (= (and b!1004862 (not res!674163)) b!1004860))

(assert (= (and b!1004860 (not res!674161)) b!1004858))

(declare-fun m!930287 () Bool)

(assert (=> d!119475 m!930287))

(assert (=> d!119475 m!930031))

(declare-fun m!930289 () Bool)

(assert (=> b!1004860 m!930289))

(assert (=> b!1004856 m!930283))

(assert (=> b!1004856 m!930283))

(declare-fun m!930291 () Bool)

(assert (=> b!1004856 m!930291))

(assert (=> b!1004862 m!930289))

(assert (=> b!1004858 m!930289))

(assert (=> b!1004493 d!119475))

(declare-fun b!1004863 () Bool)

(declare-fun e!565853 () SeekEntryResult!9461)

(declare-fun e!565850 () SeekEntryResult!9461)

(assert (=> b!1004863 (= e!565853 e!565850)))

(declare-fun c!101500 () Bool)

(declare-fun lt!444337 () (_ BitVec 64))

(assert (=> b!1004863 (= c!101500 (or (= lt!444337 lt!444203) (= (bvadd lt!444337 lt!444337) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1004864 () Bool)

(assert (=> b!1004864 (= e!565850 (Intermediate!9461 false (toIndex!0 lt!444203 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004865 () Bool)

(assert (=> b!1004865 (= e!565850 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444203 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444203 lt!444202 mask!3464))))

(declare-fun b!1004866 () Bool)

(assert (=> b!1004866 (= e!565853 (Intermediate!9461 true (toIndex!0 lt!444203 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1004867 () Bool)

(declare-fun lt!444338 () SeekEntryResult!9461)

(assert (=> b!1004867 (and (bvsge (index!40217 lt!444338) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444338) (size!31031 lt!444202)))))

(declare-fun e!565851 () Bool)

(assert (=> b!1004867 (= e!565851 (= (select (arr!30529 lt!444202) (index!40217 lt!444338)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1004868 () Bool)

(declare-fun e!565849 () Bool)

(assert (=> b!1004868 (= e!565849 (bvsge (x!87617 lt!444338) #b01111111111111111111111111111110))))

(declare-fun d!119477 () Bool)

(assert (=> d!119477 e!565849))

(declare-fun c!101501 () Bool)

(assert (=> d!119477 (= c!101501 (and (is-Intermediate!9461 lt!444338) (undefined!10273 lt!444338)))))

(assert (=> d!119477 (= lt!444338 e!565853)))

(declare-fun c!101499 () Bool)

(assert (=> d!119477 (= c!101499 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119477 (= lt!444337 (select (arr!30529 lt!444202) (toIndex!0 lt!444203 mask!3464)))))

(assert (=> d!119477 (validMask!0 mask!3464)))

(assert (=> d!119477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444203 mask!3464) lt!444203 lt!444202 mask!3464) lt!444338)))

(declare-fun b!1004869 () Bool)

(assert (=> b!1004869 (and (bvsge (index!40217 lt!444338) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444338) (size!31031 lt!444202)))))

(declare-fun res!674164 () Bool)

(assert (=> b!1004869 (= res!674164 (= (select (arr!30529 lt!444202) (index!40217 lt!444338)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1004869 (=> res!674164 e!565851)))

(declare-fun b!1004870 () Bool)

(declare-fun e!565852 () Bool)

(assert (=> b!1004870 (= e!565849 e!565852)))

(declare-fun res!674165 () Bool)

(assert (=> b!1004870 (= res!674165 (and (is-Intermediate!9461 lt!444338) (not (undefined!10273 lt!444338)) (bvslt (x!87617 lt!444338) #b01111111111111111111111111111110) (bvsge (x!87617 lt!444338) #b00000000000000000000000000000000) (bvsge (x!87617 lt!444338) #b00000000000000000000000000000000)))))

(assert (=> b!1004870 (=> (not res!674165) (not e!565852))))

(declare-fun b!1004871 () Bool)

(assert (=> b!1004871 (and (bvsge (index!40217 lt!444338) #b00000000000000000000000000000000) (bvslt (index!40217 lt!444338) (size!31031 lt!444202)))))

(declare-fun res!674166 () Bool)

(assert (=> b!1004871 (= res!674166 (= (select (arr!30529 lt!444202) (index!40217 lt!444338)) lt!444203))))

(assert (=> b!1004871 (=> res!674166 e!565851)))

(assert (=> b!1004871 (= e!565852 e!565851)))

(assert (= (and d!119477 c!101499) b!1004866))

(assert (= (and d!119477 (not c!101499)) b!1004863))

(assert (= (and b!1004863 c!101500) b!1004864))

(assert (= (and b!1004863 (not c!101500)) b!1004865))

(assert (= (and d!119477 c!101501) b!1004868))

(assert (= (and d!119477 (not c!101501)) b!1004870))

(assert (= (and b!1004870 res!674165) b!1004871))

(assert (= (and b!1004871 (not res!674166)) b!1004869))

(assert (= (and b!1004869 (not res!674164)) b!1004867))

(assert (=> d!119477 m!930049))

(declare-fun m!930293 () Bool)

(assert (=> d!119477 m!930293))

(assert (=> d!119477 m!930031))

(declare-fun m!930295 () Bool)

(assert (=> b!1004869 m!930295))

(assert (=> b!1004865 m!930049))

(declare-fun m!930297 () Bool)

(assert (=> b!1004865 m!930297))

(assert (=> b!1004865 m!930297))

(declare-fun m!930299 () Bool)

(assert (=> b!1004865 m!930299))

(assert (=> b!1004871 m!930295))

(assert (=> b!1004867 m!930295))

(assert (=> b!1004495 d!119477))

(declare-fun d!119479 () Bool)

(declare-fun lt!444340 () (_ BitVec 32))

(declare-fun lt!444339 () (_ BitVec 32))

(assert (=> d!119479 (= lt!444340 (bvmul (bvxor lt!444339 (bvlshr lt!444339 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119479 (= lt!444339 ((_ extract 31 0) (bvand (bvxor lt!444203 (bvlshr lt!444203 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119479 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674157 (let ((h!22383 ((_ extract 31 0) (bvand (bvxor lt!444203 (bvlshr lt!444203 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87625 (bvmul (bvxor h!22383 (bvlshr h!22383 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87625 (bvlshr x!87625 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674157 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674157 #b00000000000000000000000000000000))))))

(assert (=> d!119479 (= (toIndex!0 lt!444203 mask!3464) (bvand (bvxor lt!444340 (bvlshr lt!444340 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1004495 d!119479))

(declare-fun b!1004889 () Bool)

(declare-fun e!565866 () Bool)

(declare-fun e!565865 () Bool)

(assert (=> b!1004889 (= e!565866 e!565865)))

(declare-fun c!101507 () Bool)

(assert (=> b!1004889 (= c!101507 (validKeyInArray!0 (select (arr!30529 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119481 () Bool)

(declare-fun res!674175 () Bool)

(assert (=> d!119481 (=> res!674175 e!565866)))

(assert (=> d!119481 (= res!674175 (bvsge #b00000000000000000000000000000000 (size!31031 a!3219)))))

(assert (=> d!119481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!565866)))

(declare-fun b!1004890 () Bool)

(declare-fun call!42329 () Bool)

(assert (=> b!1004890 (= e!565865 call!42329)))

(declare-fun b!1004891 () Bool)

(declare-fun e!565867 () Bool)

(assert (=> b!1004891 (= e!565867 call!42329)))

(declare-fun b!1004892 () Bool)

(assert (=> b!1004892 (= e!565865 e!565867)))

(declare-fun lt!444353 () (_ BitVec 64))

(assert (=> b!1004892 (= lt!444353 (select (arr!30529 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33002 0))(
  ( (Unit!33003) )
))
(declare-fun lt!444351 () Unit!33002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63407 (_ BitVec 64) (_ BitVec 32)) Unit!33002)

(assert (=> b!1004892 (= lt!444351 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444353 #b00000000000000000000000000000000))))

(assert (=> b!1004892 (arrayContainsKey!0 a!3219 lt!444353 #b00000000000000000000000000000000)))

(declare-fun lt!444352 () Unit!33002)

(assert (=> b!1004892 (= lt!444352 lt!444351)))

(declare-fun res!674174 () Bool)

(assert (=> b!1004892 (= res!674174 (= (seekEntryOrOpen!0 (select (arr!30529 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9461 #b00000000000000000000000000000000)))))

(assert (=> b!1004892 (=> (not res!674174) (not e!565867))))

(declare-fun bm!42326 () Bool)

(assert (=> bm!42326 (= call!42329 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119481 (not res!674175)) b!1004889))

(assert (= (and b!1004889 c!101507) b!1004892))

(assert (= (and b!1004889 (not c!101507)) b!1004890))

(assert (= (and b!1004892 res!674174) b!1004891))

(assert (= (or b!1004891 b!1004890) bm!42326))

(assert (=> b!1004889 m!930203))

(assert (=> b!1004889 m!930203))

(assert (=> b!1004889 m!930205))

(assert (=> b!1004892 m!930203))

(declare-fun m!930309 () Bool)

(assert (=> b!1004892 m!930309))

(declare-fun m!930311 () Bool)

(assert (=> b!1004892 m!930311))

(assert (=> b!1004892 m!930203))

(declare-fun m!930313 () Bool)

(assert (=> b!1004892 m!930313))

(declare-fun m!930315 () Bool)

(assert (=> bm!42326 m!930315))

(assert (=> b!1004494 d!119481))

(push 1)

