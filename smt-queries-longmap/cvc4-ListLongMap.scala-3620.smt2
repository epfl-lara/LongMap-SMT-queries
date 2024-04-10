; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49872 () Bool)

(assert start!49872)

(declare-fun b!547484 () Bool)

(declare-fun res!341056 () Bool)

(declare-fun e!316344 () Bool)

(assert (=> b!547484 (=> (not res!341056) (not e!316344))))

(declare-datatypes ((array!34538 0))(
  ( (array!34539 (arr!16592 (Array (_ BitVec 32) (_ BitVec 64))) (size!16956 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34538)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547484 (= res!341056 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!547485 () Bool)

(declare-fun res!341059 () Bool)

(assert (=> b!547485 (=> (not res!341059) (not e!316344))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547485 (= res!341059 (and (= (size!16956 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16956 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16956 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547486 () Bool)

(declare-fun res!341054 () Bool)

(assert (=> b!547486 (=> (not res!341054) (not e!316344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547486 (= res!341054 (validKeyInArray!0 k!1914))))

(declare-fun b!547487 () Bool)

(declare-fun res!341057 () Bool)

(assert (=> b!547487 (=> (not res!341057) (not e!316344))))

(assert (=> b!547487 (= res!341057 (validKeyInArray!0 (select (arr!16592 a!3118) j!142)))))

(declare-fun b!547488 () Bool)

(declare-fun e!316341 () Bool)

(declare-datatypes ((List!10672 0))(
  ( (Nil!10669) (Cons!10668 (h!11635 (_ BitVec 64)) (t!16900 List!10672)) )
))
(declare-fun contains!2821 (List!10672 (_ BitVec 64)) Bool)

(assert (=> b!547488 (= e!316341 (contains!2821 Nil!10669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547489 () Bool)

(declare-fun res!341062 () Bool)

(declare-fun e!316343 () Bool)

(assert (=> b!547489 (=> (not res!341062) (not e!316343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34538 (_ BitVec 32)) Bool)

(assert (=> b!547489 (= res!341062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547491 () Bool)

(assert (=> b!547491 (= e!316343 e!316341)))

(declare-fun res!341063 () Bool)

(assert (=> b!547491 (=> res!341063 e!316341)))

(assert (=> b!547491 (= res!341063 (contains!2821 Nil!10669 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547492 () Bool)

(declare-fun res!341060 () Bool)

(assert (=> b!547492 (=> (not res!341060) (not e!316343))))

(assert (=> b!547492 (= res!341060 (and (bvsle #b00000000000000000000000000000000 (size!16956 a!3118)) (bvslt (size!16956 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547493 () Bool)

(assert (=> b!547493 (= e!316344 e!316343)))

(declare-fun res!341058 () Bool)

(assert (=> b!547493 (=> (not res!341058) (not e!316343))))

(declare-datatypes ((SeekEntryResult!5041 0))(
  ( (MissingZero!5041 (index!22391 (_ BitVec 32))) (Found!5041 (index!22392 (_ BitVec 32))) (Intermediate!5041 (undefined!5853 Bool) (index!22393 (_ BitVec 32)) (x!51333 (_ BitVec 32))) (Undefined!5041) (MissingVacant!5041 (index!22394 (_ BitVec 32))) )
))
(declare-fun lt!249544 () SeekEntryResult!5041)

(assert (=> b!547493 (= res!341058 (or (= lt!249544 (MissingZero!5041 i!1132)) (= lt!249544 (MissingVacant!5041 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34538 (_ BitVec 32)) SeekEntryResult!5041)

(assert (=> b!547493 (= lt!249544 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!547490 () Bool)

(declare-fun res!341061 () Bool)

(assert (=> b!547490 (=> (not res!341061) (not e!316343))))

(declare-fun noDuplicate!224 (List!10672) Bool)

(assert (=> b!547490 (= res!341061 (noDuplicate!224 Nil!10669))))

(declare-fun res!341055 () Bool)

(assert (=> start!49872 (=> (not res!341055) (not e!316344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49872 (= res!341055 (validMask!0 mask!3119))))

(assert (=> start!49872 e!316344))

(assert (=> start!49872 true))

(declare-fun array_inv!12388 (array!34538) Bool)

(assert (=> start!49872 (array_inv!12388 a!3118)))

(assert (= (and start!49872 res!341055) b!547485))

(assert (= (and b!547485 res!341059) b!547487))

(assert (= (and b!547487 res!341057) b!547486))

(assert (= (and b!547486 res!341054) b!547484))

(assert (= (and b!547484 res!341056) b!547493))

(assert (= (and b!547493 res!341058) b!547489))

(assert (= (and b!547489 res!341062) b!547492))

(assert (= (and b!547492 res!341060) b!547490))

(assert (= (and b!547490 res!341061) b!547491))

(assert (= (and b!547491 (not res!341063)) b!547488))

(declare-fun m!524735 () Bool)

(assert (=> b!547484 m!524735))

(declare-fun m!524737 () Bool)

(assert (=> b!547493 m!524737))

(declare-fun m!524739 () Bool)

(assert (=> b!547486 m!524739))

(declare-fun m!524741 () Bool)

(assert (=> b!547489 m!524741))

(declare-fun m!524743 () Bool)

(assert (=> start!49872 m!524743))

(declare-fun m!524745 () Bool)

(assert (=> start!49872 m!524745))

(declare-fun m!524747 () Bool)

(assert (=> b!547490 m!524747))

(declare-fun m!524749 () Bool)

(assert (=> b!547491 m!524749))

(declare-fun m!524751 () Bool)

(assert (=> b!547488 m!524751))

(declare-fun m!524753 () Bool)

(assert (=> b!547487 m!524753))

(assert (=> b!547487 m!524753))

(declare-fun m!524755 () Bool)

(assert (=> b!547487 m!524755))

(push 1)

(assert (not b!547484))

(assert (not b!547488))

(assert (not b!547491))

(assert (not start!49872))

(assert (not b!547487))

(assert (not b!547493))

(assert (not b!547490))

(assert (not b!547489))

(assert (not b!547486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82503 () Bool)

(declare-fun lt!249550 () Bool)

(declare-fun content!228 (List!10672) (Set (_ BitVec 64)))

(assert (=> d!82503 (= lt!249550 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!228 Nil!10669)))))

(declare-fun e!316372 () Bool)

(assert (=> d!82503 (= lt!249550 e!316372)))

(declare-fun res!341090 () Bool)

(assert (=> d!82503 (=> (not res!341090) (not e!316372))))

(assert (=> d!82503 (= res!341090 (is-Cons!10668 Nil!10669))))

(assert (=> d!82503 (= (contains!2821 Nil!10669 #b0000000000000000000000000000000000000000000000000000000000000000) lt!249550)))

(declare-fun b!547520 () Bool)

(declare-fun e!316371 () Bool)

(assert (=> b!547520 (= e!316372 e!316371)))

(declare-fun res!341091 () Bool)

(assert (=> b!547520 (=> res!341091 e!316371)))

(assert (=> b!547520 (= res!341091 (= (h!11635 Nil!10669) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547521 () Bool)

(assert (=> b!547521 (= e!316371 (contains!2821 (t!16900 Nil!10669) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82503 res!341090) b!547520))

(assert (= (and b!547520 (not res!341091)) b!547521))

(declare-fun m!524771 () Bool)

(assert (=> d!82503 m!524771))

(declare-fun m!524773 () Bool)

(assert (=> d!82503 m!524773))

(declare-fun m!524775 () Bool)

(assert (=> b!547521 m!524775))

(assert (=> b!547491 d!82503))

(declare-fun d!82509 () Bool)

(assert (=> d!82509 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547486 d!82509))

(declare-fun d!82511 () Bool)

(declare-fun res!341102 () Bool)

(declare-fun e!316383 () Bool)

(assert (=> d!82511 (=> res!341102 e!316383)))

(assert (=> d!82511 (= res!341102 (= (select (arr!16592 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82511 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!316383)))

(declare-fun b!547532 () Bool)

(declare-fun e!316384 () Bool)

(assert (=> b!547532 (= e!316383 e!316384)))

(declare-fun res!341103 () Bool)

(assert (=> b!547532 (=> (not res!341103) (not e!316384))))

(assert (=> b!547532 (= res!341103 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16956 a!3118)))))

(declare-fun b!547533 () Bool)

(assert (=> b!547533 (= e!316384 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82511 (not res!341102)) b!547532))

(assert (= (and b!547532 res!341103) b!547533))

(declare-fun m!524781 () Bool)

(assert (=> d!82511 m!524781))

(declare-fun m!524783 () Bool)

(assert (=> b!547533 m!524783))

(assert (=> b!547484 d!82511))

(declare-fun d!82515 () Bool)

(declare-fun res!341110 () Bool)

(declare-fun e!316391 () Bool)

(assert (=> d!82515 (=> res!341110 e!316391)))

(assert (=> d!82515 (= res!341110 (is-Nil!10669 Nil!10669))))

(assert (=> d!82515 (= (noDuplicate!224 Nil!10669) e!316391)))

(declare-fun b!547540 () Bool)

(declare-fun e!316392 () Bool)

(assert (=> b!547540 (= e!316391 e!316392)))

(declare-fun res!341111 () Bool)

(assert (=> b!547540 (=> (not res!341111) (not e!316392))))

(assert (=> b!547540 (= res!341111 (not (contains!2821 (t!16900 Nil!10669) (h!11635 Nil!10669))))))

(declare-fun b!547541 () Bool)

(assert (=> b!547541 (= e!316392 (noDuplicate!224 (t!16900 Nil!10669)))))

(assert (= (and d!82515 (not res!341110)) b!547540))

(assert (= (and b!547540 res!341111) b!547541))

(declare-fun m!524789 () Bool)

(assert (=> b!547540 m!524789))

(declare-fun m!524791 () Bool)

(assert (=> b!547541 m!524791))

(assert (=> b!547490 d!82515))

(declare-fun d!82519 () Bool)

(declare-fun lt!249551 () Bool)

(assert (=> d!82519 (= lt!249551 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!228 Nil!10669)))))

(declare-fun e!316394 () Bool)

(assert (=> d!82519 (= lt!249551 e!316394)))

(declare-fun res!341112 () Bool)

(assert (=> d!82519 (=> (not res!341112) (not e!316394))))

(assert (=> d!82519 (= res!341112 (is-Cons!10668 Nil!10669))))

(assert (=> d!82519 (= (contains!2821 Nil!10669 #b1000000000000000000000000000000000000000000000000000000000000000) lt!249551)))

(declare-fun b!547542 () Bool)

(declare-fun e!316393 () Bool)

(assert (=> b!547542 (= e!316394 e!316393)))

(declare-fun res!341113 () Bool)

(assert (=> b!547542 (=> res!341113 e!316393)))

(assert (=> b!547542 (= res!341113 (= (h!11635 Nil!10669) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!547543 () Bool)

(assert (=> b!547543 (= e!316393 (contains!2821 (t!16900 Nil!10669) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!82519 res!341112) b!547542))

(assert (= (and b!547542 (not res!341113)) b!547543))

(assert (=> d!82519 m!524771))

(declare-fun m!524793 () Bool)

(assert (=> d!82519 m!524793))

(declare-fun m!524795 () Bool)

(assert (=> b!547543 m!524795))

(assert (=> b!547488 d!82519))

(declare-fun b!547560 () Bool)

(declare-fun e!316407 () Bool)

(declare-fun call!32170 () Bool)

(assert (=> b!547560 (= e!316407 call!32170)))

(declare-fun b!547561 () Bool)

(declare-fun e!316409 () Bool)

(assert (=> b!547561 (= e!316409 e!316407)))

(declare-fun c!63547 () Bool)

(assert (=> b!547561 (= c!63547 (validKeyInArray!0 (select (arr!16592 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!547562 () Bool)

(declare-fun e!316408 () Bool)

(assert (=> b!547562 (= e!316407 e!316408)))

(declare-fun lt!249565 () (_ BitVec 64))

(assert (=> b!547562 (= lt!249565 (select (arr!16592 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16956 0))(
  ( (Unit!16957) )
))
(declare-fun lt!249566 () Unit!16956)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34538 (_ BitVec 64) (_ BitVec 32)) Unit!16956)

(assert (=> b!547562 (= lt!249566 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249565 #b00000000000000000000000000000000))))

(assert (=> b!547562 (arrayContainsKey!0 a!3118 lt!249565 #b00000000000000000000000000000000)))

(declare-fun lt!249564 () Unit!16956)

(assert (=> b!547562 (= lt!249564 lt!249566)))

(declare-fun res!341123 () Bool)

(assert (=> b!547562 (= res!341123 (= (seekEntryOrOpen!0 (select (arr!16592 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5041 #b00000000000000000000000000000000)))))

(assert (=> b!547562 (=> (not res!341123) (not e!316408))))

(declare-fun d!82521 () Bool)

(declare-fun res!341122 () Bool)

(assert (=> d!82521 (=> res!341122 e!316409)))

(assert (=> d!82521 (= res!341122 (bvsge #b00000000000000000000000000000000 (size!16956 a!3118)))))

(assert (=> d!82521 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316409)))

(declare-fun bm!32167 () Bool)

(assert (=> bm!32167 (= call!32170 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547563 () Bool)

(assert (=> b!547563 (= e!316408 call!32170)))

(assert (= (and d!82521 (not res!341122)) b!547561))

(assert (= (and b!547561 c!63547) b!547562))

(assert (= (and b!547561 (not c!63547)) b!547560))

(assert (= (and b!547562 res!341123) b!547563))

(assert (= (or b!547563 b!547560) bm!32167))

(assert (=> b!547561 m!524781))

(assert (=> b!547561 m!524781))

(declare-fun m!524797 () Bool)

(assert (=> b!547561 m!524797))

(assert (=> b!547562 m!524781))

(declare-fun m!524799 () Bool)

(assert (=> b!547562 m!524799))

(declare-fun m!524801 () Bool)

(assert (=> b!547562 m!524801))

(assert (=> b!547562 m!524781))

(declare-fun m!524803 () Bool)

(assert (=> b!547562 m!524803))

(declare-fun m!524805 () Bool)

(assert (=> bm!32167 m!524805))

(assert (=> b!547489 d!82521))

(declare-fun d!82527 () Bool)

(assert (=> d!82527 (= (validKeyInArray!0 (select (arr!16592 a!3118) j!142)) (and (not (= (select (arr!16592 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16592 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547487 d!82527))

(declare-fun d!82529 () Bool)

(declare-fun lt!249588 () SeekEntryResult!5041)

(assert (=> d!82529 (and (or (is-Undefined!5041 lt!249588) (not (is-Found!5041 lt!249588)) (and (bvsge (index!22392 lt!249588) #b00000000000000000000000000000000) (bvslt (index!22392 lt!249588) (size!16956 a!3118)))) (or (is-Undefined!5041 lt!249588) (is-Found!5041 lt!249588) (not (is-MissingZero!5041 lt!249588)) (and (bvsge (index!22391 lt!249588) #b00000000000000000000000000000000) (bvslt (index!22391 lt!249588) (size!16956 a!3118)))) (or (is-Undefined!5041 lt!249588) (is-Found!5041 lt!249588) (is-MissingZero!5041 lt!249588) (not (is-MissingVacant!5041 lt!249588)) (and (bvsge (index!22394 lt!249588) #b00000000000000000000000000000000) (bvslt (index!22394 lt!249588) (size!16956 a!3118)))) (or (is-Undefined!5041 lt!249588) (ite (is-Found!5041 lt!249588) (= (select (arr!16592 a!3118) (index!22392 lt!249588)) k!1914) (ite (is-MissingZero!5041 lt!249588) (= (select (arr!16592 a!3118) (index!22391 lt!249588)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5041 lt!249588) (= (select (arr!16592 a!3118) (index!22394 lt!249588)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316435 () SeekEntryResult!5041)

(assert (=> d!82529 (= lt!249588 e!316435)))

(declare-fun c!63560 () Bool)

(declare-fun lt!249590 () SeekEntryResult!5041)

(assert (=> d!82529 (= c!63560 (and (is-Intermediate!5041 lt!249590) (undefined!5853 lt!249590)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34538 (_ BitVec 32)) SeekEntryResult!5041)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82529 (= lt!249590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82529 (validMask!0 mask!3119)))

(assert (=> d!82529 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!249588)))

(declare-fun b!547598 () Bool)

(declare-fun e!316434 () SeekEntryResult!5041)

(assert (=> b!547598 (= e!316435 e!316434)))

(declare-fun lt!249589 () (_ BitVec 64))

(assert (=> b!547598 (= lt!249589 (select (arr!16592 a!3118) (index!22393 lt!249590)))))

(declare-fun c!63559 () Bool)

(assert (=> b!547598 (= c!63559 (= lt!249589 k!1914))))

(declare-fun b!547599 () Bool)

(assert (=> b!547599 (= e!316434 (Found!5041 (index!22393 lt!249590)))))

(declare-fun b!547600 () Bool)

(assert (=> b!547600 (= e!316435 Undefined!5041)))

(declare-fun b!547601 () Bool)

(declare-fun e!316436 () SeekEntryResult!5041)

(assert (=> b!547601 (= e!316436 (MissingZero!5041 (index!22393 lt!249590)))))

(declare-fun b!547602 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34538 (_ BitVec 32)) SeekEntryResult!5041)

(assert (=> b!547602 (= e!316436 (seekKeyOrZeroReturnVacant!0 (x!51333 lt!249590) (index!22393 lt!249590) (index!22393 lt!249590) k!1914 a!3118 mask!3119))))

(declare-fun b!547603 () Bool)

(declare-fun c!63558 () Bool)

(assert (=> b!547603 (= c!63558 (= lt!249589 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547603 (= e!316434 e!316436)))

(assert (= (and d!82529 c!63560) b!547600))

(assert (= (and d!82529 (not c!63560)) b!547598))

(assert (= (and b!547598 c!63559) b!547599))

(assert (= (and b!547598 (not c!63559)) b!547603))

(assert (= (and b!547603 c!63558) b!547601))

(assert (= (and b!547603 (not c!63558)) b!547602))

(declare-fun m!524833 () Bool)

(assert (=> d!82529 m!524833))

(declare-fun m!524835 () Bool)

(assert (=> d!82529 m!524835))

(declare-fun m!524837 () Bool)

(assert (=> d!82529 m!524837))

(declare-fun m!524839 () Bool)

(assert (=> d!82529 m!524839))

(assert (=> d!82529 m!524743))

(assert (=> d!82529 m!524839))

(declare-fun m!524841 () Bool)

(assert (=> d!82529 m!524841))

(declare-fun m!524843 () Bool)

(assert (=> b!547598 m!524843))

(declare-fun m!524845 () Bool)

(assert (=> b!547602 m!524845))

(assert (=> b!547493 d!82529))

(declare-fun d!82537 () Bool)

(assert (=> d!82537 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49872 d!82537))

(declare-fun d!82539 () Bool)

(assert (=> d!82539 (= (array_inv!12388 a!3118) (bvsge (size!16956 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49872 d!82539))

(push 1)

(assert (not d!82529))

(assert (not b!547562))

(assert (not d!82503))

(assert (not b!547521))

(assert (not b!547533))

(assert (not b!547602))

(assert (not bm!32167))

(assert (not b!547543))

(assert (not b!547561))

(assert (not b!547540))

(assert (not b!547541))

(assert (not d!82519))

(check-sat)

(pop 1)

