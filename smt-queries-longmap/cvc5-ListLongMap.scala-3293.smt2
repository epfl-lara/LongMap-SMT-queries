; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45702 () Bool)

(assert start!45702)

(declare-fun b!504829 () Bool)

(declare-fun e!295559 () Bool)

(assert (=> b!504829 (= e!295559 true)))

(declare-datatypes ((SeekEntryResult!4076 0))(
  ( (MissingZero!4076 (index!18492 (_ BitVec 32))) (Found!4076 (index!18493 (_ BitVec 32))) (Intermediate!4076 (undefined!4888 Bool) (index!18494 (_ BitVec 32)) (x!47509 (_ BitVec 32))) (Undefined!4076) (MissingVacant!4076 (index!18495 (_ BitVec 32))) )
))
(declare-fun lt!229927 () SeekEntryResult!4076)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32458 0))(
  ( (array!32459 (arr!15609 (Array (_ BitVec 32) (_ BitVec 64))) (size!15973 (_ BitVec 32))) )
))
(declare-fun lt!229923 () array!32458)

(declare-fun lt!229929 () (_ BitVec 32))

(declare-fun lt!229924 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32458 (_ BitVec 32)) SeekEntryResult!4076)

(assert (=> b!504829 (= lt!229927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229929 lt!229924 lt!229923 mask!3524))))

(declare-fun b!504830 () Bool)

(declare-fun e!295561 () Bool)

(assert (=> b!504830 (= e!295561 e!295559)))

(declare-fun res!305965 () Bool)

(assert (=> b!504830 (=> res!305965 e!295559)))

(declare-fun a!3235 () array!32458)

(declare-fun lt!229928 () SeekEntryResult!4076)

(assert (=> b!504830 (= res!305965 (or (bvsgt (x!47509 lt!229928) #b01111111111111111111111111111110) (bvslt lt!229929 #b00000000000000000000000000000000) (bvsge lt!229929 (size!15973 a!3235)) (bvslt (index!18494 lt!229928) #b00000000000000000000000000000000) (bvsge (index!18494 lt!229928) (size!15973 a!3235)) (not (= lt!229928 (Intermediate!4076 false (index!18494 lt!229928) (x!47509 lt!229928))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504830 (= (index!18494 lt!229928) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15380 0))(
  ( (Unit!15381) )
))
(declare-fun lt!229930 () Unit!15380)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32458 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15380)

(assert (=> b!504830 (= lt!229930 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229929 #b00000000000000000000000000000000 (index!18494 lt!229928) (x!47509 lt!229928) mask!3524))))

(assert (=> b!504830 (and (or (= (select (arr!15609 a!3235) (index!18494 lt!229928)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15609 a!3235) (index!18494 lt!229928)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15609 a!3235) (index!18494 lt!229928)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15609 a!3235) (index!18494 lt!229928)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229932 () Unit!15380)

(declare-fun e!295560 () Unit!15380)

(assert (=> b!504830 (= lt!229932 e!295560)))

(declare-fun c!59711 () Bool)

(assert (=> b!504830 (= c!59711 (= (select (arr!15609 a!3235) (index!18494 lt!229928)) (select (arr!15609 a!3235) j!176)))))

(assert (=> b!504830 (and (bvslt (x!47509 lt!229928) #b01111111111111111111111111111110) (or (= (select (arr!15609 a!3235) (index!18494 lt!229928)) (select (arr!15609 a!3235) j!176)) (= (select (arr!15609 a!3235) (index!18494 lt!229928)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15609 a!3235) (index!18494 lt!229928)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!295558 () Bool)

(declare-fun b!504831 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32458 (_ BitVec 32)) SeekEntryResult!4076)

(assert (=> b!504831 (= e!295558 (= (seekEntryOrOpen!0 (select (arr!15609 a!3235) j!176) a!3235 mask!3524) (Found!4076 j!176)))))

(declare-fun b!504832 () Bool)

(declare-fun Unit!15382 () Unit!15380)

(assert (=> b!504832 (= e!295560 Unit!15382)))

(declare-fun lt!229933 () Unit!15380)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32458 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15380)

(assert (=> b!504832 (= lt!229933 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229929 #b00000000000000000000000000000000 (index!18494 lt!229928) (x!47509 lt!229928) mask!3524))))

(declare-fun res!305967 () Bool)

(assert (=> b!504832 (= res!305967 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229929 lt!229924 lt!229923 mask!3524) (Intermediate!4076 false (index!18494 lt!229928) (x!47509 lt!229928))))))

(declare-fun e!295562 () Bool)

(assert (=> b!504832 (=> (not res!305967) (not e!295562))))

(assert (=> b!504832 e!295562))

(declare-fun b!504833 () Bool)

(declare-fun Unit!15383 () Unit!15380)

(assert (=> b!504833 (= e!295560 Unit!15383)))

(declare-fun b!504834 () Bool)

(declare-fun res!305977 () Bool)

(assert (=> b!504834 (=> res!305977 e!295561)))

(assert (=> b!504834 (= res!305977 (or (undefined!4888 lt!229928) (not (is-Intermediate!4076 lt!229928))))))

(declare-fun b!504835 () Bool)

(declare-fun res!305968 () Bool)

(declare-fun e!295566 () Bool)

(assert (=> b!504835 (=> (not res!305968) (not e!295566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504835 (= res!305968 (validKeyInArray!0 k!2280))))

(declare-fun b!504836 () Bool)

(declare-fun e!295564 () Bool)

(assert (=> b!504836 (= e!295564 (not e!295561))))

(declare-fun res!305970 () Bool)

(assert (=> b!504836 (=> res!305970 e!295561)))

(declare-fun lt!229925 () (_ BitVec 32))

(assert (=> b!504836 (= res!305970 (= lt!229928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229925 lt!229924 lt!229923 mask!3524)))))

(assert (=> b!504836 (= lt!229928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229929 (select (arr!15609 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504836 (= lt!229925 (toIndex!0 lt!229924 mask!3524))))

(assert (=> b!504836 (= lt!229924 (select (store (arr!15609 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504836 (= lt!229929 (toIndex!0 (select (arr!15609 a!3235) j!176) mask!3524))))

(assert (=> b!504836 (= lt!229923 (array!32459 (store (arr!15609 a!3235) i!1204 k!2280) (size!15973 a!3235)))))

(assert (=> b!504836 e!295558))

(declare-fun res!305978 () Bool)

(assert (=> b!504836 (=> (not res!305978) (not e!295558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32458 (_ BitVec 32)) Bool)

(assert (=> b!504836 (= res!305978 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229931 () Unit!15380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15380)

(assert (=> b!504836 (= lt!229931 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504837 () Bool)

(declare-fun res!305966 () Bool)

(assert (=> b!504837 (=> res!305966 e!295559)))

(declare-fun e!295565 () Bool)

(assert (=> b!504837 (= res!305966 e!295565)))

(declare-fun res!305974 () Bool)

(assert (=> b!504837 (=> (not res!305974) (not e!295565))))

(assert (=> b!504837 (= res!305974 (bvsgt #b00000000000000000000000000000000 (x!47509 lt!229928)))))

(declare-fun b!504838 () Bool)

(declare-fun res!305964 () Bool)

(assert (=> b!504838 (=> (not res!305964) (not e!295566))))

(assert (=> b!504838 (= res!305964 (and (= (size!15973 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15973 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15973 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504839 () Bool)

(assert (=> b!504839 (= e!295562 false)))

(declare-fun b!504840 () Bool)

(declare-fun res!305976 () Bool)

(assert (=> b!504840 (=> (not res!305976) (not e!295564))))

(assert (=> b!504840 (= res!305976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504841 () Bool)

(declare-fun res!305973 () Bool)

(assert (=> b!504841 (=> (not res!305973) (not e!295564))))

(declare-datatypes ((List!9767 0))(
  ( (Nil!9764) (Cons!9763 (h!10640 (_ BitVec 64)) (t!15995 List!9767)) )
))
(declare-fun arrayNoDuplicates!0 (array!32458 (_ BitVec 32) List!9767) Bool)

(assert (=> b!504841 (= res!305973 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9764))))

(declare-fun b!504842 () Bool)

(declare-fun res!305975 () Bool)

(assert (=> b!504842 (=> (not res!305975) (not e!295566))))

(assert (=> b!504842 (= res!305975 (validKeyInArray!0 (select (arr!15609 a!3235) j!176)))))

(declare-fun b!504843 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32458 (_ BitVec 32)) SeekEntryResult!4076)

(assert (=> b!504843 (= e!295565 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229929 (index!18494 lt!229928) (select (arr!15609 a!3235) j!176) a!3235 mask!3524) (Found!4076 j!176))))))

(declare-fun b!504844 () Bool)

(declare-fun res!305971 () Bool)

(assert (=> b!504844 (=> (not res!305971) (not e!295566))))

(declare-fun arrayContainsKey!0 (array!32458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504844 (= res!305971 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!305969 () Bool)

(assert (=> start!45702 (=> (not res!305969) (not e!295566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45702 (= res!305969 (validMask!0 mask!3524))))

(assert (=> start!45702 e!295566))

(assert (=> start!45702 true))

(declare-fun array_inv!11405 (array!32458) Bool)

(assert (=> start!45702 (array_inv!11405 a!3235)))

(declare-fun b!504845 () Bool)

(assert (=> b!504845 (= e!295566 e!295564)))

(declare-fun res!305972 () Bool)

(assert (=> b!504845 (=> (not res!305972) (not e!295564))))

(declare-fun lt!229926 () SeekEntryResult!4076)

(assert (=> b!504845 (= res!305972 (or (= lt!229926 (MissingZero!4076 i!1204)) (= lt!229926 (MissingVacant!4076 i!1204))))))

(assert (=> b!504845 (= lt!229926 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45702 res!305969) b!504838))

(assert (= (and b!504838 res!305964) b!504842))

(assert (= (and b!504842 res!305975) b!504835))

(assert (= (and b!504835 res!305968) b!504844))

(assert (= (and b!504844 res!305971) b!504845))

(assert (= (and b!504845 res!305972) b!504840))

(assert (= (and b!504840 res!305976) b!504841))

(assert (= (and b!504841 res!305973) b!504836))

(assert (= (and b!504836 res!305978) b!504831))

(assert (= (and b!504836 (not res!305970)) b!504834))

(assert (= (and b!504834 (not res!305977)) b!504830))

(assert (= (and b!504830 c!59711) b!504832))

(assert (= (and b!504830 (not c!59711)) b!504833))

(assert (= (and b!504832 res!305967) b!504839))

(assert (= (and b!504830 (not res!305965)) b!504837))

(assert (= (and b!504837 res!305974) b!504843))

(assert (= (and b!504837 (not res!305966)) b!504829))

(declare-fun m!485529 () Bool)

(assert (=> b!504840 m!485529))

(declare-fun m!485531 () Bool)

(assert (=> b!504836 m!485531))

(declare-fun m!485533 () Bool)

(assert (=> b!504836 m!485533))

(declare-fun m!485535 () Bool)

(assert (=> b!504836 m!485535))

(declare-fun m!485537 () Bool)

(assert (=> b!504836 m!485537))

(declare-fun m!485539 () Bool)

(assert (=> b!504836 m!485539))

(declare-fun m!485541 () Bool)

(assert (=> b!504836 m!485541))

(assert (=> b!504836 m!485531))

(declare-fun m!485543 () Bool)

(assert (=> b!504836 m!485543))

(assert (=> b!504836 m!485531))

(declare-fun m!485545 () Bool)

(assert (=> b!504836 m!485545))

(declare-fun m!485547 () Bool)

(assert (=> b!504836 m!485547))

(declare-fun m!485549 () Bool)

(assert (=> b!504841 m!485549))

(declare-fun m!485551 () Bool)

(assert (=> b!504844 m!485551))

(declare-fun m!485553 () Bool)

(assert (=> b!504832 m!485553))

(declare-fun m!485555 () Bool)

(assert (=> b!504832 m!485555))

(assert (=> b!504831 m!485531))

(assert (=> b!504831 m!485531))

(declare-fun m!485557 () Bool)

(assert (=> b!504831 m!485557))

(declare-fun m!485559 () Bool)

(assert (=> start!45702 m!485559))

(declare-fun m!485561 () Bool)

(assert (=> start!45702 m!485561))

(assert (=> b!504842 m!485531))

(assert (=> b!504842 m!485531))

(declare-fun m!485563 () Bool)

(assert (=> b!504842 m!485563))

(assert (=> b!504829 m!485555))

(declare-fun m!485565 () Bool)

(assert (=> b!504830 m!485565))

(declare-fun m!485567 () Bool)

(assert (=> b!504830 m!485567))

(assert (=> b!504830 m!485531))

(declare-fun m!485569 () Bool)

(assert (=> b!504845 m!485569))

(declare-fun m!485571 () Bool)

(assert (=> b!504835 m!485571))

(assert (=> b!504843 m!485531))

(assert (=> b!504843 m!485531))

(declare-fun m!485573 () Bool)

(assert (=> b!504843 m!485573))

(push 1)

