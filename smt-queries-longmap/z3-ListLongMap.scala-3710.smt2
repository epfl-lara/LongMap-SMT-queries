; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51058 () Bool)

(assert start!51058)

(declare-fun b!557822 () Bool)

(declare-fun res!349690 () Bool)

(declare-fun e!321363 () Bool)

(assert (=> b!557822 (=> (not res!349690) (not e!321363))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35112 0))(
  ( (array!35113 (arr!16861 (Array (_ BitVec 32) (_ BitVec 64))) (size!17225 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35112)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5310 0))(
  ( (MissingZero!5310 (index!23467 (_ BitVec 32))) (Found!5310 (index!23468 (_ BitVec 32))) (Intermediate!5310 (undefined!6122 Bool) (index!23469 (_ BitVec 32)) (x!52370 (_ BitVec 32))) (Undefined!5310) (MissingVacant!5310 (index!23470 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35112 (_ BitVec 32)) SeekEntryResult!5310)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557822 (= res!349690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16861 a!3118) j!142) mask!3119) (select (arr!16861 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16861 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16861 a!3118) i!1132 k0!1914) j!142) (array!35113 (store (arr!16861 a!3118) i!1132 k0!1914) (size!17225 a!3118)) mask!3119)))))

(declare-fun b!557823 () Bool)

(declare-fun e!321365 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35112 (_ BitVec 32)) SeekEntryResult!5310)

(assert (=> b!557823 (= e!321365 (= (seekEntryOrOpen!0 (select (arr!16861 a!3118) j!142) a!3118 mask!3119) (Found!5310 j!142)))))

(declare-fun res!349688 () Bool)

(declare-fun e!321366 () Bool)

(assert (=> start!51058 (=> (not res!349688) (not e!321366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51058 (= res!349688 (validMask!0 mask!3119))))

(assert (=> start!51058 e!321366))

(assert (=> start!51058 true))

(declare-fun array_inv!12657 (array!35112) Bool)

(assert (=> start!51058 (array_inv!12657 a!3118)))

(declare-fun b!557824 () Bool)

(declare-fun res!349685 () Bool)

(assert (=> b!557824 (=> (not res!349685) (not e!321363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35112 (_ BitVec 32)) Bool)

(assert (=> b!557824 (= res!349685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557825 () Bool)

(declare-fun res!349687 () Bool)

(assert (=> b!557825 (=> (not res!349687) (not e!321366))))

(assert (=> b!557825 (= res!349687 (and (= (size!17225 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17225 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17225 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557826 () Bool)

(assert (=> b!557826 (= e!321363 (not true))))

(assert (=> b!557826 e!321365))

(declare-fun res!349693 () Bool)

(assert (=> b!557826 (=> (not res!349693) (not e!321365))))

(assert (=> b!557826 (= res!349693 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17394 0))(
  ( (Unit!17395) )
))
(declare-fun lt!253459 () Unit!17394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17394)

(assert (=> b!557826 (= lt!253459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557827 () Bool)

(declare-fun res!349689 () Bool)

(assert (=> b!557827 (=> (not res!349689) (not e!321366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557827 (= res!349689 (validKeyInArray!0 k0!1914))))

(declare-fun b!557828 () Bool)

(declare-fun res!349692 () Bool)

(assert (=> b!557828 (=> (not res!349692) (not e!321366))))

(declare-fun arrayContainsKey!0 (array!35112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557828 (= res!349692 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557829 () Bool)

(assert (=> b!557829 (= e!321366 e!321363)))

(declare-fun res!349694 () Bool)

(assert (=> b!557829 (=> (not res!349694) (not e!321363))))

(declare-fun lt!253458 () SeekEntryResult!5310)

(assert (=> b!557829 (= res!349694 (or (= lt!253458 (MissingZero!5310 i!1132)) (= lt!253458 (MissingVacant!5310 i!1132))))))

(assert (=> b!557829 (= lt!253458 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557830 () Bool)

(declare-fun res!349686 () Bool)

(assert (=> b!557830 (=> (not res!349686) (not e!321366))))

(assert (=> b!557830 (= res!349686 (validKeyInArray!0 (select (arr!16861 a!3118) j!142)))))

(declare-fun b!557831 () Bool)

(declare-fun res!349691 () Bool)

(assert (=> b!557831 (=> (not res!349691) (not e!321363))))

(declare-datatypes ((List!10941 0))(
  ( (Nil!10938) (Cons!10937 (h!11931 (_ BitVec 64)) (t!17169 List!10941)) )
))
(declare-fun arrayNoDuplicates!0 (array!35112 (_ BitVec 32) List!10941) Bool)

(assert (=> b!557831 (= res!349691 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10938))))

(assert (= (and start!51058 res!349688) b!557825))

(assert (= (and b!557825 res!349687) b!557830))

(assert (= (and b!557830 res!349686) b!557827))

(assert (= (and b!557827 res!349689) b!557828))

(assert (= (and b!557828 res!349692) b!557829))

(assert (= (and b!557829 res!349694) b!557824))

(assert (= (and b!557824 res!349685) b!557831))

(assert (= (and b!557831 res!349691) b!557822))

(assert (= (and b!557822 res!349690) b!557826))

(assert (= (and b!557826 res!349693) b!557823))

(declare-fun m!535677 () Bool)

(assert (=> b!557829 m!535677))

(declare-fun m!535679 () Bool)

(assert (=> b!557827 m!535679))

(declare-fun m!535681 () Bool)

(assert (=> b!557831 m!535681))

(declare-fun m!535683 () Bool)

(assert (=> b!557828 m!535683))

(declare-fun m!535685 () Bool)

(assert (=> b!557823 m!535685))

(assert (=> b!557823 m!535685))

(declare-fun m!535687 () Bool)

(assert (=> b!557823 m!535687))

(assert (=> b!557822 m!535685))

(declare-fun m!535689 () Bool)

(assert (=> b!557822 m!535689))

(assert (=> b!557822 m!535685))

(declare-fun m!535691 () Bool)

(assert (=> b!557822 m!535691))

(declare-fun m!535693 () Bool)

(assert (=> b!557822 m!535693))

(assert (=> b!557822 m!535691))

(declare-fun m!535695 () Bool)

(assert (=> b!557822 m!535695))

(assert (=> b!557822 m!535689))

(assert (=> b!557822 m!535685))

(declare-fun m!535697 () Bool)

(assert (=> b!557822 m!535697))

(declare-fun m!535699 () Bool)

(assert (=> b!557822 m!535699))

(assert (=> b!557822 m!535691))

(assert (=> b!557822 m!535693))

(declare-fun m!535701 () Bool)

(assert (=> b!557824 m!535701))

(declare-fun m!535703 () Bool)

(assert (=> b!557826 m!535703))

(declare-fun m!535705 () Bool)

(assert (=> b!557826 m!535705))

(assert (=> b!557830 m!535685))

(assert (=> b!557830 m!535685))

(declare-fun m!535707 () Bool)

(assert (=> b!557830 m!535707))

(declare-fun m!535709 () Bool)

(assert (=> start!51058 m!535709))

(declare-fun m!535711 () Bool)

(assert (=> start!51058 m!535711))

(check-sat (not b!557827) (not b!557831) (not b!557830) (not b!557829) (not b!557826) (not b!557823) (not start!51058) (not b!557824) (not b!557828) (not b!557822))
(check-sat)
