; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50460 () Bool)

(assert start!50460)

(declare-fun b!551533 () Bool)

(declare-fun res!344214 () Bool)

(declare-fun e!318345 () Bool)

(assert (=> b!551533 (=> (not res!344214) (not e!318345))))

(declare-datatypes ((array!34746 0))(
  ( (array!34747 (arr!16684 (Array (_ BitVec 32) (_ BitVec 64))) (size!17048 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34746)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551533 (= res!344214 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!318346 () Bool)

(declare-fun b!551534 () Bool)

(declare-datatypes ((SeekEntryResult!5089 0))(
  ( (MissingZero!5089 (index!22583 (_ BitVec 32))) (Found!5089 (index!22584 (_ BitVec 32))) (Intermediate!5089 (undefined!5901 Bool) (index!22585 (_ BitVec 32)) (x!51666 (_ BitVec 32))) (Undefined!5089) (MissingVacant!5089 (index!22586 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34746 (_ BitVec 32)) SeekEntryResult!5089)

(assert (=> b!551534 (= e!318346 (= (seekEntryOrOpen!0 (select (arr!16684 a!3118) j!142) a!3118 mask!3119) (Found!5089 j!142)))))

(declare-fun b!551535 () Bool)

(declare-fun res!344213 () Bool)

(declare-fun e!318347 () Bool)

(assert (=> b!551535 (=> (not res!344213) (not e!318347))))

(declare-datatypes ((List!10671 0))(
  ( (Nil!10668) (Cons!10667 (h!11649 (_ BitVec 64)) (t!16891 List!10671)) )
))
(declare-fun arrayNoDuplicates!0 (array!34746 (_ BitVec 32) List!10671) Bool)

(assert (=> b!551535 (= res!344213 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10668))))

(declare-fun b!551536 () Bool)

(assert (=> b!551536 (= e!318345 e!318347)))

(declare-fun res!344206 () Bool)

(assert (=> b!551536 (=> (not res!344206) (not e!318347))))

(declare-fun lt!250920 () SeekEntryResult!5089)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551536 (= res!344206 (or (= lt!250920 (MissingZero!5089 i!1132)) (= lt!250920 (MissingVacant!5089 i!1132))))))

(assert (=> b!551536 (= lt!250920 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551537 () Bool)

(declare-fun res!344207 () Bool)

(assert (=> b!551537 (=> (not res!344207) (not e!318347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34746 (_ BitVec 32)) Bool)

(assert (=> b!551537 (= res!344207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551538 () Bool)

(assert (=> b!551538 (= e!318347 (not true))))

(assert (=> b!551538 e!318346))

(declare-fun res!344212 () Bool)

(assert (=> b!551538 (=> (not res!344212) (not e!318346))))

(assert (=> b!551538 (= res!344212 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17023 0))(
  ( (Unit!17024) )
))
(declare-fun lt!250921 () Unit!17023)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17023)

(assert (=> b!551538 (= lt!250921 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!344211 () Bool)

(assert (=> start!50460 (=> (not res!344211) (not e!318345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50460 (= res!344211 (validMask!0 mask!3119))))

(assert (=> start!50460 e!318345))

(assert (=> start!50460 true))

(declare-fun array_inv!12543 (array!34746) Bool)

(assert (=> start!50460 (array_inv!12543 a!3118)))

(declare-fun b!551539 () Bool)

(declare-fun res!344215 () Bool)

(assert (=> b!551539 (=> (not res!344215) (not e!318345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551539 (= res!344215 (validKeyInArray!0 (select (arr!16684 a!3118) j!142)))))

(declare-fun b!551540 () Bool)

(declare-fun res!344208 () Bool)

(assert (=> b!551540 (=> (not res!344208) (not e!318345))))

(assert (=> b!551540 (= res!344208 (validKeyInArray!0 k0!1914))))

(declare-fun b!551541 () Bool)

(declare-fun res!344210 () Bool)

(assert (=> b!551541 (=> (not res!344210) (not e!318347))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34746 (_ BitVec 32)) SeekEntryResult!5089)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551541 (= res!344210 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16684 a!3118) j!142) mask!3119) (select (arr!16684 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16684 a!3118) i!1132 k0!1914) j!142) (array!34747 (store (arr!16684 a!3118) i!1132 k0!1914) (size!17048 a!3118)) mask!3119)))))

(declare-fun b!551542 () Bool)

(declare-fun res!344209 () Bool)

(assert (=> b!551542 (=> (not res!344209) (not e!318345))))

(assert (=> b!551542 (= res!344209 (and (= (size!17048 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17048 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17048 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50460 res!344211) b!551542))

(assert (= (and b!551542 res!344209) b!551539))

(assert (= (and b!551539 res!344215) b!551540))

(assert (= (and b!551540 res!344208) b!551533))

(assert (= (and b!551533 res!344214) b!551536))

(assert (= (and b!551536 res!344206) b!551537))

(assert (= (and b!551537 res!344207) b!551535))

(assert (= (and b!551535 res!344213) b!551541))

(assert (= (and b!551541 res!344210) b!551538))

(assert (= (and b!551538 res!344212) b!551534))

(declare-fun m!528635 () Bool)

(assert (=> b!551539 m!528635))

(assert (=> b!551539 m!528635))

(declare-fun m!528637 () Bool)

(assert (=> b!551539 m!528637))

(declare-fun m!528639 () Bool)

(assert (=> b!551535 m!528639))

(declare-fun m!528641 () Bool)

(assert (=> b!551537 m!528641))

(declare-fun m!528643 () Bool)

(assert (=> b!551536 m!528643))

(assert (=> b!551534 m!528635))

(assert (=> b!551534 m!528635))

(declare-fun m!528645 () Bool)

(assert (=> b!551534 m!528645))

(assert (=> b!551541 m!528635))

(declare-fun m!528647 () Bool)

(assert (=> b!551541 m!528647))

(assert (=> b!551541 m!528635))

(declare-fun m!528649 () Bool)

(assert (=> b!551541 m!528649))

(declare-fun m!528651 () Bool)

(assert (=> b!551541 m!528651))

(assert (=> b!551541 m!528649))

(declare-fun m!528653 () Bool)

(assert (=> b!551541 m!528653))

(assert (=> b!551541 m!528647))

(assert (=> b!551541 m!528635))

(declare-fun m!528655 () Bool)

(assert (=> b!551541 m!528655))

(declare-fun m!528657 () Bool)

(assert (=> b!551541 m!528657))

(assert (=> b!551541 m!528649))

(assert (=> b!551541 m!528651))

(declare-fun m!528659 () Bool)

(assert (=> b!551533 m!528659))

(declare-fun m!528661 () Bool)

(assert (=> start!50460 m!528661))

(declare-fun m!528663 () Bool)

(assert (=> start!50460 m!528663))

(declare-fun m!528665 () Bool)

(assert (=> b!551538 m!528665))

(declare-fun m!528667 () Bool)

(assert (=> b!551538 m!528667))

(declare-fun m!528669 () Bool)

(assert (=> b!551540 m!528669))

(check-sat (not b!551541) (not b!551534) (not b!551533) (not b!551537) (not b!551535) (not b!551539) (not start!50460) (not b!551538) (not b!551536) (not b!551540))
(check-sat)
