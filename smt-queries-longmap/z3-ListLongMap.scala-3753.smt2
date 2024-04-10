; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51514 () Bool)

(assert start!51514)

(declare-fun res!354710 () Bool)

(declare-fun e!324741 () Bool)

(assert (=> start!51514 (=> (not res!354710) (not e!324741))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51514 (= res!354710 (validMask!0 mask!3119))))

(assert (=> start!51514 e!324741))

(assert (=> start!51514 true))

(declare-datatypes ((array!35379 0))(
  ( (array!35380 (arr!16990 (Array (_ BitVec 32) (_ BitVec 64))) (size!17354 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35379)

(declare-fun array_inv!12786 (array!35379) Bool)

(assert (=> start!51514 (array_inv!12786 a!3118)))

(declare-fun b!563555 () Bool)

(declare-fun res!354714 () Bool)

(declare-fun e!324740 () Bool)

(assert (=> b!563555 (=> (not res!354714) (not e!324740))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5439 0))(
  ( (MissingZero!5439 (index!23983 (_ BitVec 32))) (Found!5439 (index!23984 (_ BitVec 32))) (Intermediate!5439 (undefined!6251 Bool) (index!23985 (_ BitVec 32)) (x!52870 (_ BitVec 32))) (Undefined!5439) (MissingVacant!5439 (index!23986 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35379 (_ BitVec 32)) SeekEntryResult!5439)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563555 (= res!354714 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16990 a!3118) j!142) mask!3119) (select (arr!16990 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16990 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16990 a!3118) i!1132 k0!1914) j!142) (array!35380 (store (arr!16990 a!3118) i!1132 k0!1914) (size!17354 a!3118)) mask!3119)))))

(declare-fun b!563556 () Bool)

(declare-fun res!354715 () Bool)

(assert (=> b!563556 (=> (not res!354715) (not e!324740))))

(declare-datatypes ((List!11070 0))(
  ( (Nil!11067) (Cons!11066 (h!12069 (_ BitVec 64)) (t!17298 List!11070)) )
))
(declare-fun arrayNoDuplicates!0 (array!35379 (_ BitVec 32) List!11070) Bool)

(assert (=> b!563556 (= res!354715 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11067))))

(declare-fun b!563557 () Bool)

(assert (=> b!563557 (= e!324740 (not true))))

(declare-fun e!324738 () Bool)

(assert (=> b!563557 e!324738))

(declare-fun res!354708 () Bool)

(assert (=> b!563557 (=> (not res!354708) (not e!324738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35379 (_ BitVec 32)) Bool)

(assert (=> b!563557 (= res!354708 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17652 0))(
  ( (Unit!17653) )
))
(declare-fun lt!257257 () Unit!17652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35379 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17652)

(assert (=> b!563557 (= lt!257257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563558 () Bool)

(declare-fun res!354709 () Bool)

(assert (=> b!563558 (=> (not res!354709) (not e!324740))))

(assert (=> b!563558 (= res!354709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563559 () Bool)

(declare-fun res!354712 () Bool)

(assert (=> b!563559 (=> (not res!354712) (not e!324741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563559 (= res!354712 (validKeyInArray!0 k0!1914))))

(declare-fun b!563560 () Bool)

(declare-fun res!354713 () Bool)

(assert (=> b!563560 (=> (not res!354713) (not e!324741))))

(assert (=> b!563560 (= res!354713 (and (= (size!17354 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17354 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17354 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563561 () Bool)

(declare-fun res!354716 () Bool)

(assert (=> b!563561 (=> (not res!354716) (not e!324741))))

(assert (=> b!563561 (= res!354716 (validKeyInArray!0 (select (arr!16990 a!3118) j!142)))))

(declare-fun b!563562 () Bool)

(assert (=> b!563562 (= e!324741 e!324740)))

(declare-fun res!354707 () Bool)

(assert (=> b!563562 (=> (not res!354707) (not e!324740))))

(declare-fun lt!257256 () SeekEntryResult!5439)

(assert (=> b!563562 (= res!354707 (or (= lt!257256 (MissingZero!5439 i!1132)) (= lt!257256 (MissingVacant!5439 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35379 (_ BitVec 32)) SeekEntryResult!5439)

(assert (=> b!563562 (= lt!257256 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563563 () Bool)

(declare-fun res!354711 () Bool)

(assert (=> b!563563 (=> (not res!354711) (not e!324741))))

(declare-fun arrayContainsKey!0 (array!35379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563563 (= res!354711 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563564 () Bool)

(assert (=> b!563564 (= e!324738 (= (seekEntryOrOpen!0 (select (arr!16990 a!3118) j!142) a!3118 mask!3119) (Found!5439 j!142)))))

(assert (= (and start!51514 res!354710) b!563560))

(assert (= (and b!563560 res!354713) b!563561))

(assert (= (and b!563561 res!354716) b!563559))

(assert (= (and b!563559 res!354712) b!563563))

(assert (= (and b!563563 res!354711) b!563562))

(assert (= (and b!563562 res!354707) b!563558))

(assert (= (and b!563558 res!354709) b!563556))

(assert (= (and b!563556 res!354715) b!563555))

(assert (= (and b!563555 res!354714) b!563557))

(assert (= (and b!563557 res!354708) b!563564))

(declare-fun m!541923 () Bool)

(assert (=> start!51514 m!541923))

(declare-fun m!541925 () Bool)

(assert (=> start!51514 m!541925))

(declare-fun m!541927 () Bool)

(assert (=> b!563556 m!541927))

(declare-fun m!541929 () Bool)

(assert (=> b!563558 m!541929))

(declare-fun m!541931 () Bool)

(assert (=> b!563559 m!541931))

(declare-fun m!541933 () Bool)

(assert (=> b!563555 m!541933))

(declare-fun m!541935 () Bool)

(assert (=> b!563555 m!541935))

(assert (=> b!563555 m!541933))

(declare-fun m!541937 () Bool)

(assert (=> b!563555 m!541937))

(declare-fun m!541939 () Bool)

(assert (=> b!563555 m!541939))

(assert (=> b!563555 m!541937))

(declare-fun m!541941 () Bool)

(assert (=> b!563555 m!541941))

(assert (=> b!563555 m!541935))

(assert (=> b!563555 m!541933))

(declare-fun m!541943 () Bool)

(assert (=> b!563555 m!541943))

(declare-fun m!541945 () Bool)

(assert (=> b!563555 m!541945))

(assert (=> b!563555 m!541937))

(assert (=> b!563555 m!541939))

(assert (=> b!563564 m!541933))

(assert (=> b!563564 m!541933))

(declare-fun m!541947 () Bool)

(assert (=> b!563564 m!541947))

(declare-fun m!541949 () Bool)

(assert (=> b!563562 m!541949))

(declare-fun m!541951 () Bool)

(assert (=> b!563563 m!541951))

(assert (=> b!563561 m!541933))

(assert (=> b!563561 m!541933))

(declare-fun m!541953 () Bool)

(assert (=> b!563561 m!541953))

(declare-fun m!541955 () Bool)

(assert (=> b!563557 m!541955))

(declare-fun m!541957 () Bool)

(assert (=> b!563557 m!541957))

(check-sat (not b!563564) (not b!563556) (not b!563558) (not b!563555) (not b!563557) (not b!563561) (not b!563559) (not start!51514) (not b!563563) (not b!563562))
(check-sat)
