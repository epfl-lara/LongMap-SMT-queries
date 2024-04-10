; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50680 () Bool)

(assert start!50680)

(declare-fun b!554129 () Bool)

(declare-fun res!346540 () Bool)

(declare-fun e!319560 () Bool)

(assert (=> b!554129 (=> (not res!346540) (not e!319560))))

(declare-datatypes ((array!34905 0))(
  ( (array!34906 (arr!16762 (Array (_ BitVec 32) (_ BitVec 64))) (size!17126 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34905)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554129 (= res!346540 (validKeyInArray!0 (select (arr!16762 a!3118) j!142)))))

(declare-fun b!554130 () Bool)

(declare-fun e!319557 () Bool)

(declare-fun e!319559 () Bool)

(assert (=> b!554130 (= e!319557 (not e!319559))))

(declare-fun res!346546 () Bool)

(assert (=> b!554130 (=> res!346546 e!319559)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5211 0))(
  ( (MissingZero!5211 (index!23071 (_ BitVec 32))) (Found!5211 (index!23072 (_ BitVec 32))) (Intermediate!5211 (undefined!6023 Bool) (index!23073 (_ BitVec 32)) (x!51989 (_ BitVec 32))) (Undefined!5211) (MissingVacant!5211 (index!23074 (_ BitVec 32))) )
))
(declare-fun lt!251694 () SeekEntryResult!5211)

(get-info :version)

(assert (=> b!554130 (= res!346546 (or (not ((_ is Intermediate!5211) lt!251694)) (undefined!6023 lt!251694) (not (= (select (arr!16762 a!3118) (index!23073 lt!251694)) (select (arr!16762 a!3118) j!142))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!319558 () Bool)

(assert (=> b!554130 e!319558))

(declare-fun res!346550 () Bool)

(assert (=> b!554130 (=> (not res!346550) (not e!319558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34905 (_ BitVec 32)) Bool)

(assert (=> b!554130 (= res!346550 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17196 0))(
  ( (Unit!17197) )
))
(declare-fun lt!251695 () Unit!17196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34905 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17196)

(assert (=> b!554130 (= lt!251695 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554131 () Bool)

(declare-fun res!346549 () Bool)

(declare-fun e!319556 () Bool)

(assert (=> b!554131 (=> (not res!346549) (not e!319556))))

(assert (=> b!554131 (= res!346549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554132 () Bool)

(declare-fun res!346541 () Bool)

(assert (=> b!554132 (=> (not res!346541) (not e!319560))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554132 (= res!346541 (and (= (size!17126 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17126 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17126 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554133 () Bool)

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!554133 (= e!319559 (validKeyInArray!0 (select (store (arr!16762 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!554134 () Bool)

(declare-fun res!346543 () Bool)

(assert (=> b!554134 (=> (not res!346543) (not e!319560))))

(assert (=> b!554134 (= res!346543 (validKeyInArray!0 k0!1914))))

(declare-fun b!554135 () Bool)

(assert (=> b!554135 (= e!319560 e!319556)))

(declare-fun res!346544 () Bool)

(assert (=> b!554135 (=> (not res!346544) (not e!319556))))

(declare-fun lt!251692 () SeekEntryResult!5211)

(assert (=> b!554135 (= res!346544 (or (= lt!251692 (MissingZero!5211 i!1132)) (= lt!251692 (MissingVacant!5211 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34905 (_ BitVec 32)) SeekEntryResult!5211)

(assert (=> b!554135 (= lt!251692 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554136 () Bool)

(declare-fun res!346547 () Bool)

(assert (=> b!554136 (=> (not res!346547) (not e!319560))))

(declare-fun arrayContainsKey!0 (array!34905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554136 (= res!346547 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554137 () Bool)

(declare-fun res!346542 () Bool)

(assert (=> b!554137 (=> (not res!346542) (not e!319556))))

(declare-datatypes ((List!10842 0))(
  ( (Nil!10839) (Cons!10838 (h!11823 (_ BitVec 64)) (t!17070 List!10842)) )
))
(declare-fun arrayNoDuplicates!0 (array!34905 (_ BitVec 32) List!10842) Bool)

(assert (=> b!554137 (= res!346542 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10839))))

(declare-fun b!554138 () Bool)

(assert (=> b!554138 (= e!319558 (= (seekEntryOrOpen!0 (select (arr!16762 a!3118) j!142) a!3118 mask!3119) (Found!5211 j!142)))))

(declare-fun res!346545 () Bool)

(assert (=> start!50680 (=> (not res!346545) (not e!319560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50680 (= res!346545 (validMask!0 mask!3119))))

(assert (=> start!50680 e!319560))

(assert (=> start!50680 true))

(declare-fun array_inv!12558 (array!34905) Bool)

(assert (=> start!50680 (array_inv!12558 a!3118)))

(declare-fun b!554128 () Bool)

(assert (=> b!554128 (= e!319556 e!319557)))

(declare-fun res!346548 () Bool)

(assert (=> b!554128 (=> (not res!346548) (not e!319557))))

(declare-fun lt!251691 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34905 (_ BitVec 32)) SeekEntryResult!5211)

(assert (=> b!554128 (= res!346548 (= lt!251694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251691 (select (store (arr!16762 a!3118) i!1132 k0!1914) j!142) (array!34906 (store (arr!16762 a!3118) i!1132 k0!1914) (size!17126 a!3118)) mask!3119)))))

(declare-fun lt!251693 () (_ BitVec 32))

(assert (=> b!554128 (= lt!251694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251693 (select (arr!16762 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554128 (= lt!251691 (toIndex!0 (select (store (arr!16762 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554128 (= lt!251693 (toIndex!0 (select (arr!16762 a!3118) j!142) mask!3119))))

(assert (= (and start!50680 res!346545) b!554132))

(assert (= (and b!554132 res!346541) b!554129))

(assert (= (and b!554129 res!346540) b!554134))

(assert (= (and b!554134 res!346543) b!554136))

(assert (= (and b!554136 res!346547) b!554135))

(assert (= (and b!554135 res!346544) b!554131))

(assert (= (and b!554131 res!346549) b!554137))

(assert (= (and b!554137 res!346542) b!554128))

(assert (= (and b!554128 res!346548) b!554130))

(assert (= (and b!554130 res!346550) b!554138))

(assert (= (and b!554130 (not res!346546)) b!554133))

(declare-fun m!531355 () Bool)

(assert (=> start!50680 m!531355))

(declare-fun m!531357 () Bool)

(assert (=> start!50680 m!531357))

(declare-fun m!531359 () Bool)

(assert (=> b!554128 m!531359))

(declare-fun m!531361 () Bool)

(assert (=> b!554128 m!531361))

(declare-fun m!531363 () Bool)

(assert (=> b!554128 m!531363))

(declare-fun m!531365 () Bool)

(assert (=> b!554128 m!531365))

(assert (=> b!554128 m!531359))

(assert (=> b!554128 m!531363))

(assert (=> b!554128 m!531359))

(declare-fun m!531367 () Bool)

(assert (=> b!554128 m!531367))

(declare-fun m!531369 () Bool)

(assert (=> b!554128 m!531369))

(assert (=> b!554128 m!531363))

(declare-fun m!531371 () Bool)

(assert (=> b!554128 m!531371))

(assert (=> b!554129 m!531359))

(assert (=> b!554129 m!531359))

(declare-fun m!531373 () Bool)

(assert (=> b!554129 m!531373))

(declare-fun m!531375 () Bool)

(assert (=> b!554135 m!531375))

(assert (=> b!554138 m!531359))

(assert (=> b!554138 m!531359))

(declare-fun m!531377 () Bool)

(assert (=> b!554138 m!531377))

(declare-fun m!531379 () Bool)

(assert (=> b!554136 m!531379))

(declare-fun m!531381 () Bool)

(assert (=> b!554134 m!531381))

(assert (=> b!554133 m!531369))

(assert (=> b!554133 m!531363))

(assert (=> b!554133 m!531363))

(declare-fun m!531383 () Bool)

(assert (=> b!554133 m!531383))

(declare-fun m!531385 () Bool)

(assert (=> b!554130 m!531385))

(assert (=> b!554130 m!531359))

(declare-fun m!531387 () Bool)

(assert (=> b!554130 m!531387))

(declare-fun m!531389 () Bool)

(assert (=> b!554130 m!531389))

(declare-fun m!531391 () Bool)

(assert (=> b!554131 m!531391))

(declare-fun m!531393 () Bool)

(assert (=> b!554137 m!531393))

(check-sat (not b!554128) (not b!554137) (not b!554131) (not b!554138) (not b!554136) (not start!50680) (not b!554133) (not b!554130) (not b!554134) (not b!554129) (not b!554135))
(check-sat)
