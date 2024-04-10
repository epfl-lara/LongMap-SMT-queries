; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52440 () Bool)

(assert start!52440)

(declare-fun b!572543 () Bool)

(declare-fun res!362060 () Bool)

(declare-fun e!329346 () Bool)

(assert (=> b!572543 (=> (not res!362060) (not e!329346))))

(declare-datatypes ((array!35837 0))(
  ( (array!35838 (arr!17207 (Array (_ BitVec 32) (_ BitVec 64))) (size!17571 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35837)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572543 (= res!362060 (validKeyInArray!0 (select (arr!17207 a!3118) j!142)))))

(declare-fun b!572544 () Bool)

(declare-fun e!329342 () Bool)

(declare-fun e!329339 () Bool)

(assert (=> b!572544 (= e!329342 e!329339)))

(declare-fun res!362057 () Bool)

(assert (=> b!572544 (=> res!362057 e!329339)))

(declare-fun lt!261316 () (_ BitVec 64))

(assert (=> b!572544 (= res!362057 (or (= lt!261316 (select (arr!17207 a!3118) j!142)) (= lt!261316 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5656 0))(
  ( (MissingZero!5656 (index!24851 (_ BitVec 32))) (Found!5656 (index!24852 (_ BitVec 32))) (Intermediate!5656 (undefined!6468 Bool) (index!24853 (_ BitVec 32)) (x!53717 (_ BitVec 32))) (Undefined!5656) (MissingVacant!5656 (index!24854 (_ BitVec 32))) )
))
(declare-fun lt!261310 () SeekEntryResult!5656)

(assert (=> b!572544 (= lt!261316 (select (arr!17207 a!3118) (index!24853 lt!261310)))))

(declare-fun b!572545 () Bool)

(declare-fun e!329343 () Bool)

(assert (=> b!572545 (= e!329343 (not true))))

(declare-fun e!329341 () Bool)

(assert (=> b!572545 e!329341))

(declare-fun res!362053 () Bool)

(assert (=> b!572545 (=> (not res!362053) (not e!329341))))

(declare-fun lt!261313 () SeekEntryResult!5656)

(assert (=> b!572545 (= res!362053 (= lt!261313 (Found!5656 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35837 (_ BitVec 32)) SeekEntryResult!5656)

(assert (=> b!572545 (= lt!261313 (seekEntryOrOpen!0 (select (arr!17207 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35837 (_ BitVec 32)) Bool)

(assert (=> b!572545 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18014 0))(
  ( (Unit!18015) )
))
(declare-fun lt!261314 () Unit!18014)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18014)

(assert (=> b!572545 (= lt!261314 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572546 () Bool)

(declare-fun e!329344 () Bool)

(assert (=> b!572546 (= e!329339 e!329344)))

(declare-fun res!362059 () Bool)

(assert (=> b!572546 (=> (not res!362059) (not e!329344))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35837 (_ BitVec 32)) SeekEntryResult!5656)

(assert (=> b!572546 (= res!362059 (= lt!261313 (seekKeyOrZeroReturnVacant!0 (x!53717 lt!261310) (index!24853 lt!261310) (index!24853 lt!261310) (select (arr!17207 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572547 () Bool)

(declare-fun e!329345 () Bool)

(assert (=> b!572547 (= e!329346 e!329345)))

(declare-fun res!362054 () Bool)

(assert (=> b!572547 (=> (not res!362054) (not e!329345))))

(declare-fun lt!261315 () SeekEntryResult!5656)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572547 (= res!362054 (or (= lt!261315 (MissingZero!5656 i!1132)) (= lt!261315 (MissingVacant!5656 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!572547 (= lt!261315 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572548 () Bool)

(declare-fun res!362063 () Bool)

(assert (=> b!572548 (=> (not res!362063) (not e!329346))))

(assert (=> b!572548 (= res!362063 (validKeyInArray!0 k!1914))))

(declare-fun b!572549 () Bool)

(assert (=> b!572549 (= e!329341 e!329342)))

(declare-fun res!362062 () Bool)

(assert (=> b!572549 (=> res!362062 e!329342)))

(assert (=> b!572549 (= res!362062 (or (undefined!6468 lt!261310) (not (is-Intermediate!5656 lt!261310))))))

(declare-fun b!572550 () Bool)

(declare-fun res!362061 () Bool)

(assert (=> b!572550 (=> (not res!362061) (not e!329346))))

(declare-fun arrayContainsKey!0 (array!35837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572550 (= res!362061 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!362051 () Bool)

(assert (=> start!52440 (=> (not res!362051) (not e!329346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52440 (= res!362051 (validMask!0 mask!3119))))

(assert (=> start!52440 e!329346))

(assert (=> start!52440 true))

(declare-fun array_inv!13003 (array!35837) Bool)

(assert (=> start!52440 (array_inv!13003 a!3118)))

(declare-fun b!572551 () Bool)

(declare-fun res!362056 () Bool)

(assert (=> b!572551 (=> (not res!362056) (not e!329345))))

(assert (=> b!572551 (= res!362056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun lt!261309 () (_ BitVec 64))

(declare-fun b!572552 () Bool)

(declare-fun lt!261308 () array!35837)

(assert (=> b!572552 (= e!329344 (= (seekEntryOrOpen!0 lt!261309 lt!261308 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53717 lt!261310) (index!24853 lt!261310) (index!24853 lt!261310) lt!261309 lt!261308 mask!3119)))))

(declare-fun b!572553 () Bool)

(declare-fun res!362052 () Bool)

(assert (=> b!572553 (=> (not res!362052) (not e!329345))))

(declare-datatypes ((List!11287 0))(
  ( (Nil!11284) (Cons!11283 (h!12310 (_ BitVec 64)) (t!17515 List!11287)) )
))
(declare-fun arrayNoDuplicates!0 (array!35837 (_ BitVec 32) List!11287) Bool)

(assert (=> b!572553 (= res!362052 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11284))))

(declare-fun b!572554 () Bool)

(assert (=> b!572554 (= e!329345 e!329343)))

(declare-fun res!362058 () Bool)

(assert (=> b!572554 (=> (not res!362058) (not e!329343))))

(declare-fun lt!261312 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35837 (_ BitVec 32)) SeekEntryResult!5656)

(assert (=> b!572554 (= res!362058 (= lt!261310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261312 lt!261309 lt!261308 mask!3119)))))

(declare-fun lt!261311 () (_ BitVec 32))

(assert (=> b!572554 (= lt!261310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261311 (select (arr!17207 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572554 (= lt!261312 (toIndex!0 lt!261309 mask!3119))))

(assert (=> b!572554 (= lt!261309 (select (store (arr!17207 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572554 (= lt!261311 (toIndex!0 (select (arr!17207 a!3118) j!142) mask!3119))))

(assert (=> b!572554 (= lt!261308 (array!35838 (store (arr!17207 a!3118) i!1132 k!1914) (size!17571 a!3118)))))

(declare-fun b!572555 () Bool)

(declare-fun res!362055 () Bool)

(assert (=> b!572555 (=> (not res!362055) (not e!329346))))

(assert (=> b!572555 (= res!362055 (and (= (size!17571 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17571 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17571 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52440 res!362051) b!572555))

(assert (= (and b!572555 res!362055) b!572543))

(assert (= (and b!572543 res!362060) b!572548))

(assert (= (and b!572548 res!362063) b!572550))

(assert (= (and b!572550 res!362061) b!572547))

(assert (= (and b!572547 res!362054) b!572551))

(assert (= (and b!572551 res!362056) b!572553))

(assert (= (and b!572553 res!362052) b!572554))

(assert (= (and b!572554 res!362058) b!572545))

(assert (= (and b!572545 res!362053) b!572549))

(assert (= (and b!572549 (not res!362062)) b!572544))

(assert (= (and b!572544 (not res!362057)) b!572546))

(assert (= (and b!572546 res!362059) b!572552))

(declare-fun m!551533 () Bool)

(assert (=> b!572546 m!551533))

(assert (=> b!572546 m!551533))

(declare-fun m!551535 () Bool)

(assert (=> b!572546 m!551535))

(declare-fun m!551537 () Bool)

(assert (=> b!572552 m!551537))

(declare-fun m!551539 () Bool)

(assert (=> b!572552 m!551539))

(declare-fun m!551541 () Bool)

(assert (=> start!52440 m!551541))

(declare-fun m!551543 () Bool)

(assert (=> start!52440 m!551543))

(assert (=> b!572545 m!551533))

(assert (=> b!572545 m!551533))

(declare-fun m!551545 () Bool)

(assert (=> b!572545 m!551545))

(declare-fun m!551547 () Bool)

(assert (=> b!572545 m!551547))

(declare-fun m!551549 () Bool)

(assert (=> b!572545 m!551549))

(assert (=> b!572544 m!551533))

(declare-fun m!551551 () Bool)

(assert (=> b!572544 m!551551))

(assert (=> b!572543 m!551533))

(assert (=> b!572543 m!551533))

(declare-fun m!551553 () Bool)

(assert (=> b!572543 m!551553))

(declare-fun m!551555 () Bool)

(assert (=> b!572547 m!551555))

(declare-fun m!551557 () Bool)

(assert (=> b!572551 m!551557))

(declare-fun m!551559 () Bool)

(assert (=> b!572550 m!551559))

(declare-fun m!551561 () Bool)

(assert (=> b!572548 m!551561))

(assert (=> b!572554 m!551533))

(declare-fun m!551563 () Bool)

(assert (=> b!572554 m!551563))

(assert (=> b!572554 m!551533))

(assert (=> b!572554 m!551533))

(declare-fun m!551565 () Bool)

(assert (=> b!572554 m!551565))

(declare-fun m!551567 () Bool)

(assert (=> b!572554 m!551567))

(declare-fun m!551569 () Bool)

(assert (=> b!572554 m!551569))

(declare-fun m!551571 () Bool)

(assert (=> b!572554 m!551571))

(declare-fun m!551573 () Bool)

(assert (=> b!572554 m!551573))

(declare-fun m!551575 () Bool)

(assert (=> b!572553 m!551575))

(push 1)

