; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50850 () Bool)

(assert start!50850)

(declare-fun b!556529 () Bool)

(declare-fun res!348947 () Bool)

(declare-fun e!320613 () Bool)

(assert (=> b!556529 (=> (not res!348947) (not e!320613))))

(declare-datatypes ((array!35075 0))(
  ( (array!35076 (arr!16847 (Array (_ BitVec 32) (_ BitVec 64))) (size!17211 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35075)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556529 (= res!348947 (validKeyInArray!0 (select (arr!16847 a!3118) j!142)))))

(declare-fun res!348949 () Bool)

(assert (=> start!50850 (=> (not res!348949) (not e!320613))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50850 (= res!348949 (validMask!0 mask!3119))))

(assert (=> start!50850 e!320613))

(assert (=> start!50850 true))

(declare-fun array_inv!12643 (array!35075) Bool)

(assert (=> start!50850 (array_inv!12643 a!3118)))

(declare-fun b!556530 () Bool)

(declare-fun res!348946 () Bool)

(declare-fun e!320611 () Bool)

(assert (=> b!556530 (=> (not res!348946) (not e!320611))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5296 0))(
  ( (MissingZero!5296 (index!23411 (_ BitVec 32))) (Found!5296 (index!23412 (_ BitVec 32))) (Intermediate!5296 (undefined!6108 Bool) (index!23413 (_ BitVec 32)) (x!52298 (_ BitVec 32))) (Undefined!5296) (MissingVacant!5296 (index!23414 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35075 (_ BitVec 32)) SeekEntryResult!5296)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556530 (= res!348946 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16847 a!3118) j!142) mask!3119) (select (arr!16847 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16847 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16847 a!3118) i!1132 k!1914) j!142) (array!35076 (store (arr!16847 a!3118) i!1132 k!1914) (size!17211 a!3118)) mask!3119)))))

(declare-fun b!556531 () Bool)

(assert (=> b!556531 (= e!320613 e!320611)))

(declare-fun res!348945 () Bool)

(assert (=> b!556531 (=> (not res!348945) (not e!320611))))

(declare-fun lt!252907 () SeekEntryResult!5296)

(assert (=> b!556531 (= res!348945 (or (= lt!252907 (MissingZero!5296 i!1132)) (= lt!252907 (MissingVacant!5296 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35075 (_ BitVec 32)) SeekEntryResult!5296)

(assert (=> b!556531 (= lt!252907 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556532 () Bool)

(declare-fun res!348950 () Bool)

(assert (=> b!556532 (=> (not res!348950) (not e!320613))))

(declare-fun arrayContainsKey!0 (array!35075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556532 (= res!348950 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556533 () Bool)

(declare-fun res!348948 () Bool)

(assert (=> b!556533 (=> (not res!348948) (not e!320611))))

(declare-datatypes ((List!10927 0))(
  ( (Nil!10924) (Cons!10923 (h!11908 (_ BitVec 64)) (t!17155 List!10927)) )
))
(declare-fun arrayNoDuplicates!0 (array!35075 (_ BitVec 32) List!10927) Bool)

(assert (=> b!556533 (= res!348948 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10924))))

(declare-fun b!556534 () Bool)

(declare-fun res!348942 () Bool)

(assert (=> b!556534 (=> (not res!348942) (not e!320613))))

(assert (=> b!556534 (= res!348942 (validKeyInArray!0 k!1914))))

(declare-fun b!556535 () Bool)

(assert (=> b!556535 (= e!320611 (not true))))

(declare-fun e!320612 () Bool)

(assert (=> b!556535 e!320612))

(declare-fun res!348944 () Bool)

(assert (=> b!556535 (=> (not res!348944) (not e!320612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35075 (_ BitVec 32)) Bool)

(assert (=> b!556535 (= res!348944 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17366 0))(
  ( (Unit!17367) )
))
(declare-fun lt!252906 () Unit!17366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17366)

(assert (=> b!556535 (= lt!252906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556536 () Bool)

(declare-fun res!348943 () Bool)

(assert (=> b!556536 (=> (not res!348943) (not e!320613))))

(assert (=> b!556536 (= res!348943 (and (= (size!17211 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17211 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17211 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556537 () Bool)

(assert (=> b!556537 (= e!320612 (= (seekEntryOrOpen!0 (select (arr!16847 a!3118) j!142) a!3118 mask!3119) (Found!5296 j!142)))))

(declare-fun b!556538 () Bool)

(declare-fun res!348941 () Bool)

(assert (=> b!556538 (=> (not res!348941) (not e!320611))))

(assert (=> b!556538 (= res!348941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50850 res!348949) b!556536))

(assert (= (and b!556536 res!348943) b!556529))

(assert (= (and b!556529 res!348947) b!556534))

(assert (= (and b!556534 res!348942) b!556532))

(assert (= (and b!556532 res!348950) b!556531))

(assert (= (and b!556531 res!348945) b!556538))

(assert (= (and b!556538 res!348941) b!556533))

(assert (= (and b!556533 res!348948) b!556530))

(assert (= (and b!556530 res!348946) b!556535))

(assert (= (and b!556535 res!348944) b!556537))

(declare-fun m!534543 () Bool)

(assert (=> b!556535 m!534543))

(declare-fun m!534545 () Bool)

(assert (=> b!556535 m!534545))

(declare-fun m!534547 () Bool)

(assert (=> b!556537 m!534547))

(assert (=> b!556537 m!534547))

(declare-fun m!534549 () Bool)

(assert (=> b!556537 m!534549))

(declare-fun m!534551 () Bool)

(assert (=> b!556534 m!534551))

(declare-fun m!534553 () Bool)

(assert (=> b!556533 m!534553))

(declare-fun m!534555 () Bool)

(assert (=> b!556531 m!534555))

(declare-fun m!534557 () Bool)

(assert (=> b!556538 m!534557))

(assert (=> b!556529 m!534547))

(assert (=> b!556529 m!534547))

(declare-fun m!534559 () Bool)

(assert (=> b!556529 m!534559))

(declare-fun m!534561 () Bool)

(assert (=> b!556532 m!534561))

(assert (=> b!556530 m!534547))

(declare-fun m!534563 () Bool)

(assert (=> b!556530 m!534563))

(assert (=> b!556530 m!534547))

(declare-fun m!534565 () Bool)

(assert (=> b!556530 m!534565))

(declare-fun m!534567 () Bool)

(assert (=> b!556530 m!534567))

(assert (=> b!556530 m!534565))

(declare-fun m!534569 () Bool)

(assert (=> b!556530 m!534569))

(assert (=> b!556530 m!534563))

(assert (=> b!556530 m!534547))

(declare-fun m!534571 () Bool)

(assert (=> b!556530 m!534571))

(declare-fun m!534573 () Bool)

(assert (=> b!556530 m!534573))

(assert (=> b!556530 m!534565))

(assert (=> b!556530 m!534567))

(declare-fun m!534575 () Bool)

(assert (=> start!50850 m!534575))

(declare-fun m!534577 () Bool)

(assert (=> start!50850 m!534577))

(push 1)

