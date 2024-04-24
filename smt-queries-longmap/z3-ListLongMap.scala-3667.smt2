; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50664 () Bool)

(assert start!50664)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!319263 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!553384 () Bool)

(declare-datatypes ((array!34836 0))(
  ( (array!34837 (arr!16726 (Array (_ BitVec 32) (_ BitVec 64))) (size!17090 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34836)

(declare-datatypes ((SeekEntryResult!5131 0))(
  ( (MissingZero!5131 (index!22751 (_ BitVec 32))) (Found!5131 (index!22752 (_ BitVec 32))) (Intermediate!5131 (undefined!5943 Bool) (index!22753 (_ BitVec 32)) (x!51832 (_ BitVec 32))) (Undefined!5131) (MissingVacant!5131 (index!22754 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34836 (_ BitVec 32)) SeekEntryResult!5131)

(assert (=> b!553384 (= e!319263 (= (seekEntryOrOpen!0 (select (arr!16726 a!3118) j!142) a!3118 mask!3119) (Found!5131 j!142)))))

(declare-fun res!345700 () Bool)

(declare-fun e!319260 () Bool)

(assert (=> start!50664 (=> (not res!345700) (not e!319260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50664 (= res!345700 (validMask!0 mask!3119))))

(assert (=> start!50664 e!319260))

(assert (=> start!50664 true))

(declare-fun array_inv!12585 (array!34836) Bool)

(assert (=> start!50664 (array_inv!12585 a!3118)))

(declare-fun b!553385 () Bool)

(declare-fun res!345697 () Bool)

(assert (=> b!553385 (=> (not res!345697) (not e!319260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553385 (= res!345697 (validKeyInArray!0 (select (arr!16726 a!3118) j!142)))))

(declare-fun b!553386 () Bool)

(declare-fun res!345696 () Bool)

(declare-fun e!319262 () Bool)

(assert (=> b!553386 (=> (not res!345696) (not e!319262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34836 (_ BitVec 32)) Bool)

(assert (=> b!553386 (= res!345696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553387 () Bool)

(declare-fun res!345692 () Bool)

(assert (=> b!553387 (=> (not res!345692) (not e!319260))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34836 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553387 (= res!345692 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553388 () Bool)

(declare-fun res!345695 () Bool)

(assert (=> b!553388 (=> (not res!345695) (not e!319260))))

(assert (=> b!553388 (= res!345695 (validKeyInArray!0 k0!1914))))

(declare-fun b!553389 () Bool)

(declare-fun res!345699 () Bool)

(assert (=> b!553389 (=> (not res!345699) (not e!319262))))

(declare-datatypes ((List!10713 0))(
  ( (Nil!10710) (Cons!10709 (h!11697 (_ BitVec 64)) (t!16933 List!10713)) )
))
(declare-fun arrayNoDuplicates!0 (array!34836 (_ BitVec 32) List!10713) Bool)

(assert (=> b!553389 (= res!345699 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10710))))

(declare-fun b!553390 () Bool)

(declare-fun e!319261 () Bool)

(declare-fun lt!251501 () SeekEntryResult!5131)

(get-info :version)

(assert (=> b!553390 (= e!319261 (not (or (not ((_ is Intermediate!5131) lt!251501)) (not (undefined!5943 lt!251501)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!553390 e!319263))

(declare-fun res!345691 () Bool)

(assert (=> b!553390 (=> (not res!345691) (not e!319263))))

(assert (=> b!553390 (= res!345691 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17107 0))(
  ( (Unit!17108) )
))
(declare-fun lt!251503 () Unit!17107)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17107)

(assert (=> b!553390 (= lt!251503 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553391 () Bool)

(declare-fun res!345694 () Bool)

(assert (=> b!553391 (=> (not res!345694) (not e!319260))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553391 (= res!345694 (and (= (size!17090 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17090 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17090 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553392 () Bool)

(assert (=> b!553392 (= e!319260 e!319262)))

(declare-fun res!345693 () Bool)

(assert (=> b!553392 (=> (not res!345693) (not e!319262))))

(declare-fun lt!251502 () SeekEntryResult!5131)

(assert (=> b!553392 (= res!345693 (or (= lt!251502 (MissingZero!5131 i!1132)) (= lt!251502 (MissingVacant!5131 i!1132))))))

(assert (=> b!553392 (= lt!251502 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553393 () Bool)

(assert (=> b!553393 (= e!319262 e!319261)))

(declare-fun res!345698 () Bool)

(assert (=> b!553393 (=> (not res!345698) (not e!319261))))

(declare-fun lt!251500 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34836 (_ BitVec 32)) SeekEntryResult!5131)

(assert (=> b!553393 (= res!345698 (= lt!251501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251500 (select (store (arr!16726 a!3118) i!1132 k0!1914) j!142) (array!34837 (store (arr!16726 a!3118) i!1132 k0!1914) (size!17090 a!3118)) mask!3119)))))

(declare-fun lt!251499 () (_ BitVec 32))

(assert (=> b!553393 (= lt!251501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251499 (select (arr!16726 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553393 (= lt!251500 (toIndex!0 (select (store (arr!16726 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553393 (= lt!251499 (toIndex!0 (select (arr!16726 a!3118) j!142) mask!3119))))

(assert (= (and start!50664 res!345700) b!553391))

(assert (= (and b!553391 res!345694) b!553385))

(assert (= (and b!553385 res!345697) b!553388))

(assert (= (and b!553388 res!345695) b!553387))

(assert (= (and b!553387 res!345692) b!553392))

(assert (= (and b!553392 res!345693) b!553386))

(assert (= (and b!553386 res!345696) b!553389))

(assert (= (and b!553389 res!345699) b!553393))

(assert (= (and b!553393 res!345698) b!553390))

(assert (= (and b!553390 res!345691) b!553384))

(declare-fun m!530555 () Bool)

(assert (=> b!553393 m!530555))

(declare-fun m!530557 () Bool)

(assert (=> b!553393 m!530557))

(assert (=> b!553393 m!530557))

(declare-fun m!530559 () Bool)

(assert (=> b!553393 m!530559))

(assert (=> b!553393 m!530555))

(declare-fun m!530561 () Bool)

(assert (=> b!553393 m!530561))

(assert (=> b!553393 m!530555))

(declare-fun m!530563 () Bool)

(assert (=> b!553393 m!530563))

(declare-fun m!530565 () Bool)

(assert (=> b!553393 m!530565))

(assert (=> b!553393 m!530557))

(declare-fun m!530567 () Bool)

(assert (=> b!553393 m!530567))

(assert (=> b!553384 m!530555))

(assert (=> b!553384 m!530555))

(declare-fun m!530569 () Bool)

(assert (=> b!553384 m!530569))

(declare-fun m!530571 () Bool)

(assert (=> b!553386 m!530571))

(declare-fun m!530573 () Bool)

(assert (=> b!553390 m!530573))

(declare-fun m!530575 () Bool)

(assert (=> b!553390 m!530575))

(assert (=> b!553385 m!530555))

(assert (=> b!553385 m!530555))

(declare-fun m!530577 () Bool)

(assert (=> b!553385 m!530577))

(declare-fun m!530579 () Bool)

(assert (=> start!50664 m!530579))

(declare-fun m!530581 () Bool)

(assert (=> start!50664 m!530581))

(declare-fun m!530583 () Bool)

(assert (=> b!553389 m!530583))

(declare-fun m!530585 () Bool)

(assert (=> b!553392 m!530585))

(declare-fun m!530587 () Bool)

(assert (=> b!553387 m!530587))

(declare-fun m!530589 () Bool)

(assert (=> b!553388 m!530589))

(check-sat (not b!553392) (not b!553388) (not start!50664) (not b!553389) (not b!553390) (not b!553386) (not b!553387) (not b!553384) (not b!553393) (not b!553385))
(check-sat)
