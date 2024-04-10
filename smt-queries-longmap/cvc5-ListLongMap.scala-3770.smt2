; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51614 () Bool)

(assert start!51614)

(declare-fun res!355998 () Bool)

(declare-fun e!325264 () Bool)

(assert (=> start!51614 (=> (not res!355998) (not e!325264))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51614 (= res!355998 (validMask!0 mask!3119))))

(assert (=> start!51614 e!325264))

(assert (=> start!51614 true))

(declare-datatypes ((array!35479 0))(
  ( (array!35480 (arr!17040 (Array (_ BitVec 32) (_ BitVec 64))) (size!17404 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35479)

(declare-fun array_inv!12836 (array!35479) Bool)

(assert (=> start!51614 (array_inv!12836 a!3118)))

(declare-fun b!564844 () Bool)

(declare-fun e!325266 () Bool)

(assert (=> b!564844 (= e!325266 false)))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!257674 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5489 0))(
  ( (MissingZero!5489 (index!24183 (_ BitVec 32))) (Found!5489 (index!24184 (_ BitVec 32))) (Intermediate!5489 (undefined!6301 Bool) (index!24185 (_ BitVec 32)) (x!53056 (_ BitVec 32))) (Undefined!5489) (MissingVacant!5489 (index!24186 (_ BitVec 32))) )
))
(declare-fun lt!257672 () SeekEntryResult!5489)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35479 (_ BitVec 32)) SeekEntryResult!5489)

(assert (=> b!564844 (= lt!257672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257674 (select (store (arr!17040 a!3118) i!1132 k!1914) j!142) (array!35480 (store (arr!17040 a!3118) i!1132 k!1914) (size!17404 a!3118)) mask!3119))))

(declare-fun lt!257673 () SeekEntryResult!5489)

(declare-fun lt!257671 () (_ BitVec 32))

(assert (=> b!564844 (= lt!257673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257671 (select (arr!17040 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564844 (= lt!257674 (toIndex!0 (select (store (arr!17040 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!564844 (= lt!257671 (toIndex!0 (select (arr!17040 a!3118) j!142) mask!3119))))

(declare-fun b!564845 () Bool)

(declare-fun res!355996 () Bool)

(assert (=> b!564845 (=> (not res!355996) (not e!325264))))

(declare-fun arrayContainsKey!0 (array!35479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564845 (= res!355996 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564846 () Bool)

(declare-fun res!355997 () Bool)

(assert (=> b!564846 (=> (not res!355997) (not e!325264))))

(assert (=> b!564846 (= res!355997 (and (= (size!17404 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17404 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17404 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564847 () Bool)

(declare-fun res!356002 () Bool)

(assert (=> b!564847 (=> (not res!356002) (not e!325264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564847 (= res!356002 (validKeyInArray!0 k!1914))))

(declare-fun b!564848 () Bool)

(declare-fun res!356001 () Bool)

(assert (=> b!564848 (=> (not res!356001) (not e!325266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35479 (_ BitVec 32)) Bool)

(assert (=> b!564848 (= res!356001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564849 () Bool)

(assert (=> b!564849 (= e!325264 e!325266)))

(declare-fun res!356000 () Bool)

(assert (=> b!564849 (=> (not res!356000) (not e!325266))))

(declare-fun lt!257670 () SeekEntryResult!5489)

(assert (=> b!564849 (= res!356000 (or (= lt!257670 (MissingZero!5489 i!1132)) (= lt!257670 (MissingVacant!5489 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35479 (_ BitVec 32)) SeekEntryResult!5489)

(assert (=> b!564849 (= lt!257670 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564850 () Bool)

(declare-fun res!355999 () Bool)

(assert (=> b!564850 (=> (not res!355999) (not e!325266))))

(declare-datatypes ((List!11120 0))(
  ( (Nil!11117) (Cons!11116 (h!12119 (_ BitVec 64)) (t!17348 List!11120)) )
))
(declare-fun arrayNoDuplicates!0 (array!35479 (_ BitVec 32) List!11120) Bool)

(assert (=> b!564850 (= res!355999 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11117))))

(declare-fun b!564851 () Bool)

(declare-fun res!356003 () Bool)

(assert (=> b!564851 (=> (not res!356003) (not e!325264))))

(assert (=> b!564851 (= res!356003 (validKeyInArray!0 (select (arr!17040 a!3118) j!142)))))

(assert (= (and start!51614 res!355998) b!564846))

(assert (= (and b!564846 res!355997) b!564851))

(assert (= (and b!564851 res!356003) b!564847))

(assert (= (and b!564847 res!356002) b!564845))

(assert (= (and b!564845 res!355996) b!564849))

(assert (= (and b!564849 res!356000) b!564848))

(assert (= (and b!564848 res!356001) b!564850))

(assert (= (and b!564850 res!355999) b!564844))

(declare-fun m!543321 () Bool)

(assert (=> start!51614 m!543321))

(declare-fun m!543323 () Bool)

(assert (=> start!51614 m!543323))

(declare-fun m!543325 () Bool)

(assert (=> b!564847 m!543325))

(declare-fun m!543327 () Bool)

(assert (=> b!564849 m!543327))

(declare-fun m!543329 () Bool)

(assert (=> b!564845 m!543329))

(declare-fun m!543331 () Bool)

(assert (=> b!564848 m!543331))

(declare-fun m!543333 () Bool)

(assert (=> b!564850 m!543333))

(declare-fun m!543335 () Bool)

(assert (=> b!564851 m!543335))

(assert (=> b!564851 m!543335))

(declare-fun m!543337 () Bool)

(assert (=> b!564851 m!543337))

(assert (=> b!564844 m!543335))

(declare-fun m!543339 () Bool)

(assert (=> b!564844 m!543339))

(assert (=> b!564844 m!543335))

(declare-fun m!543341 () Bool)

(assert (=> b!564844 m!543341))

(assert (=> b!564844 m!543335))

(declare-fun m!543343 () Bool)

(assert (=> b!564844 m!543343))

(declare-fun m!543345 () Bool)

(assert (=> b!564844 m!543345))

(assert (=> b!564844 m!543343))

(declare-fun m!543347 () Bool)

(assert (=> b!564844 m!543347))

(assert (=> b!564844 m!543343))

(declare-fun m!543349 () Bool)

(assert (=> b!564844 m!543349))

(push 1)

