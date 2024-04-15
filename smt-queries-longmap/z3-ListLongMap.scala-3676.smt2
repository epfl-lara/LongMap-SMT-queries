; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50660 () Bool)

(assert start!50660)

(declare-fun b!553732 () Bool)

(declare-fun res!346290 () Bool)

(declare-fun e!319326 () Bool)

(assert (=> b!553732 (=> (not res!346290) (not e!319326))))

(declare-datatypes ((array!34894 0))(
  ( (array!34895 (arr!16757 (Array (_ BitVec 32) (_ BitVec 64))) (size!17122 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34894)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553732 (= res!346290 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553733 () Bool)

(declare-fun res!346289 () Bool)

(declare-fun e!319324 () Bool)

(assert (=> b!553733 (=> (not res!346289) (not e!319324))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34894 (_ BitVec 32)) Bool)

(assert (=> b!553733 (= res!346289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!553734 () Bool)

(declare-fun e!319325 () Bool)

(declare-datatypes ((SeekEntryResult!5203 0))(
  ( (MissingZero!5203 (index!23039 (_ BitVec 32))) (Found!5203 (index!23040 (_ BitVec 32))) (Intermediate!5203 (undefined!6015 Bool) (index!23041 (_ BitVec 32)) (x!51968 (_ BitVec 32))) (Undefined!5203) (MissingVacant!5203 (index!23042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34894 (_ BitVec 32)) SeekEntryResult!5203)

(assert (=> b!553734 (= e!319325 (= (seekEntryOrOpen!0 (select (arr!16757 a!3118) j!142) a!3118 mask!3119) (Found!5203 j!142)))))

(declare-fun b!553735 () Bool)

(declare-fun res!346294 () Bool)

(assert (=> b!553735 (=> (not res!346294) (not e!319326))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553735 (= res!346294 (and (= (size!17122 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17122 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17122 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553736 () Bool)

(assert (=> b!553736 (= e!319324 (not true))))

(assert (=> b!553736 e!319325))

(declare-fun res!346286 () Bool)

(assert (=> b!553736 (=> (not res!346286) (not e!319325))))

(assert (=> b!553736 (= res!346286 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17166 0))(
  ( (Unit!17167) )
))
(declare-fun lt!251419 () Unit!17166)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17166)

(assert (=> b!553736 (= lt!251419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553738 () Bool)

(declare-fun res!346287 () Bool)

(assert (=> b!553738 (=> (not res!346287) (not e!319326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553738 (= res!346287 (validKeyInArray!0 k0!1914))))

(declare-fun b!553739 () Bool)

(declare-fun res!346295 () Bool)

(assert (=> b!553739 (=> (not res!346295) (not e!319324))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34894 (_ BitVec 32)) SeekEntryResult!5203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553739 (= res!346295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16757 a!3118) j!142) mask!3119) (select (arr!16757 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16757 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16757 a!3118) i!1132 k0!1914) j!142) (array!34895 (store (arr!16757 a!3118) i!1132 k0!1914) (size!17122 a!3118)) mask!3119)))))

(declare-fun b!553740 () Bool)

(declare-fun res!346288 () Bool)

(assert (=> b!553740 (=> (not res!346288) (not e!319324))))

(declare-datatypes ((List!10876 0))(
  ( (Nil!10873) (Cons!10872 (h!11857 (_ BitVec 64)) (t!17095 List!10876)) )
))
(declare-fun arrayNoDuplicates!0 (array!34894 (_ BitVec 32) List!10876) Bool)

(assert (=> b!553740 (= res!346288 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10873))))

(declare-fun b!553741 () Bool)

(assert (=> b!553741 (= e!319326 e!319324)))

(declare-fun res!346291 () Bool)

(assert (=> b!553741 (=> (not res!346291) (not e!319324))))

(declare-fun lt!251418 () SeekEntryResult!5203)

(assert (=> b!553741 (= res!346291 (or (= lt!251418 (MissingZero!5203 i!1132)) (= lt!251418 (MissingVacant!5203 i!1132))))))

(assert (=> b!553741 (= lt!251418 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!346293 () Bool)

(assert (=> start!50660 (=> (not res!346293) (not e!319326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50660 (= res!346293 (validMask!0 mask!3119))))

(assert (=> start!50660 e!319326))

(assert (=> start!50660 true))

(declare-fun array_inv!12640 (array!34894) Bool)

(assert (=> start!50660 (array_inv!12640 a!3118)))

(declare-fun b!553737 () Bool)

(declare-fun res!346292 () Bool)

(assert (=> b!553737 (=> (not res!346292) (not e!319326))))

(assert (=> b!553737 (= res!346292 (validKeyInArray!0 (select (arr!16757 a!3118) j!142)))))

(assert (= (and start!50660 res!346293) b!553735))

(assert (= (and b!553735 res!346294) b!553737))

(assert (= (and b!553737 res!346292) b!553738))

(assert (= (and b!553738 res!346287) b!553732))

(assert (= (and b!553732 res!346290) b!553741))

(assert (= (and b!553741 res!346291) b!553733))

(assert (= (and b!553733 res!346289) b!553740))

(assert (= (and b!553740 res!346288) b!553739))

(assert (= (and b!553739 res!346295) b!553736))

(assert (= (and b!553736 res!346286) b!553734))

(declare-fun m!530435 () Bool)

(assert (=> b!553732 m!530435))

(declare-fun m!530437 () Bool)

(assert (=> b!553733 m!530437))

(declare-fun m!530439 () Bool)

(assert (=> b!553741 m!530439))

(declare-fun m!530441 () Bool)

(assert (=> b!553738 m!530441))

(declare-fun m!530443 () Bool)

(assert (=> b!553740 m!530443))

(declare-fun m!530445 () Bool)

(assert (=> b!553737 m!530445))

(assert (=> b!553737 m!530445))

(declare-fun m!530447 () Bool)

(assert (=> b!553737 m!530447))

(declare-fun m!530449 () Bool)

(assert (=> start!50660 m!530449))

(declare-fun m!530451 () Bool)

(assert (=> start!50660 m!530451))

(declare-fun m!530453 () Bool)

(assert (=> b!553736 m!530453))

(declare-fun m!530455 () Bool)

(assert (=> b!553736 m!530455))

(assert (=> b!553739 m!530445))

(declare-fun m!530457 () Bool)

(assert (=> b!553739 m!530457))

(assert (=> b!553739 m!530445))

(declare-fun m!530459 () Bool)

(assert (=> b!553739 m!530459))

(declare-fun m!530461 () Bool)

(assert (=> b!553739 m!530461))

(assert (=> b!553739 m!530459))

(declare-fun m!530463 () Bool)

(assert (=> b!553739 m!530463))

(assert (=> b!553739 m!530457))

(assert (=> b!553739 m!530445))

(declare-fun m!530465 () Bool)

(assert (=> b!553739 m!530465))

(declare-fun m!530467 () Bool)

(assert (=> b!553739 m!530467))

(assert (=> b!553739 m!530459))

(assert (=> b!553739 m!530461))

(assert (=> b!553734 m!530445))

(assert (=> b!553734 m!530445))

(declare-fun m!530469 () Bool)

(assert (=> b!553734 m!530469))

(check-sat (not start!50660) (not b!553732) (not b!553736) (not b!553737) (not b!553734) (not b!553733) (not b!553738) (not b!553739) (not b!553741) (not b!553740))
(check-sat)
