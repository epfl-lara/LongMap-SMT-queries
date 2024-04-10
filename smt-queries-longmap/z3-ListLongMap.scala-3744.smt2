; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51460 () Bool)

(assert start!51460)

(declare-fun b!562638 () Bool)

(declare-fun res!353799 () Bool)

(declare-fun e!324253 () Bool)

(assert (=> b!562638 (=> (not res!353799) (not e!324253))))

(declare-datatypes ((array!35325 0))(
  ( (array!35326 (arr!16963 (Array (_ BitVec 32) (_ BitVec 64))) (size!17327 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35325)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562638 (= res!353799 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562639 () Bool)

(declare-fun e!324254 () Bool)

(declare-fun e!324250 () Bool)

(assert (=> b!562639 (= e!324254 e!324250)))

(declare-fun res!353791 () Bool)

(assert (=> b!562639 (=> res!353791 e!324250)))

(declare-datatypes ((SeekEntryResult!5412 0))(
  ( (MissingZero!5412 (index!23875 (_ BitVec 32))) (Found!5412 (index!23876 (_ BitVec 32))) (Intermediate!5412 (undefined!6224 Bool) (index!23877 (_ BitVec 32)) (x!52771 (_ BitVec 32))) (Undefined!5412) (MissingVacant!5412 (index!23878 (_ BitVec 32))) )
))
(declare-fun lt!256479 () SeekEntryResult!5412)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!256483 () SeekEntryResult!5412)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!256481 () SeekEntryResult!5412)

(declare-fun lt!256480 () (_ BitVec 64))

(assert (=> b!562639 (= res!353791 (or (bvslt (index!23877 lt!256479) #b00000000000000000000000000000000) (bvsge (index!23877 lt!256479) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52771 lt!256479) #b01111111111111111111111111111110) (bvslt (x!52771 lt!256479) #b00000000000000000000000000000000) (not (= lt!256480 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16963 a!3118) i!1132 k0!1914) (index!23877 lt!256479)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256483 lt!256481))))))

(declare-fun lt!256478 () SeekEntryResult!5412)

(declare-fun lt!256470 () SeekEntryResult!5412)

(assert (=> b!562639 (= lt!256478 lt!256470)))

(declare-fun lt!256471 () (_ BitVec 64))

(declare-fun lt!256474 () array!35325)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35325 (_ BitVec 32)) SeekEntryResult!5412)

(assert (=> b!562639 (= lt!256470 (seekKeyOrZeroReturnVacant!0 (x!52771 lt!256479) (index!23877 lt!256479) (index!23877 lt!256479) lt!256471 lt!256474 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35325 (_ BitVec 32)) SeekEntryResult!5412)

(assert (=> b!562639 (= lt!256478 (seekEntryOrOpen!0 lt!256471 lt!256474 mask!3119))))

(declare-fun lt!256477 () SeekEntryResult!5412)

(assert (=> b!562639 (= lt!256477 lt!256483)))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!562639 (= lt!256483 (seekKeyOrZeroReturnVacant!0 (x!52771 lt!256479) (index!23877 lt!256479) (index!23877 lt!256479) (select (arr!16963 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562640 () Bool)

(declare-fun e!324255 () Bool)

(assert (=> b!562640 (= e!324253 e!324255)))

(declare-fun res!353800 () Bool)

(assert (=> b!562640 (=> (not res!353800) (not e!324255))))

(declare-fun lt!256476 () SeekEntryResult!5412)

(assert (=> b!562640 (= res!353800 (or (= lt!256476 (MissingZero!5412 i!1132)) (= lt!256476 (MissingVacant!5412 i!1132))))))

(assert (=> b!562640 (= lt!256476 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!353796 () Bool)

(assert (=> start!51460 (=> (not res!353796) (not e!324253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51460 (= res!353796 (validMask!0 mask!3119))))

(assert (=> start!51460 e!324253))

(assert (=> start!51460 true))

(declare-fun array_inv!12759 (array!35325) Bool)

(assert (=> start!51460 (array_inv!12759 a!3118)))

(declare-fun b!562641 () Bool)

(assert (=> b!562641 (= e!324250 true)))

(assert (=> b!562641 (= lt!256483 lt!256470)))

(declare-datatypes ((Unit!17598 0))(
  ( (Unit!17599) )
))
(declare-fun lt!256475 () Unit!17598)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17598)

(assert (=> b!562641 (= lt!256475 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52771 lt!256479) (index!23877 lt!256479) (index!23877 lt!256479) mask!3119))))

(declare-fun b!562642 () Bool)

(declare-fun e!324251 () Bool)

(assert (=> b!562642 (= e!324251 e!324254)))

(declare-fun res!353797 () Bool)

(assert (=> b!562642 (=> res!353797 e!324254)))

(assert (=> b!562642 (= res!353797 (or (= lt!256480 (select (arr!16963 a!3118) j!142)) (= lt!256480 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562642 (= lt!256480 (select (arr!16963 a!3118) (index!23877 lt!256479)))))

(declare-fun b!562643 () Bool)

(declare-fun res!353790 () Bool)

(assert (=> b!562643 (=> (not res!353790) (not e!324253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562643 (= res!353790 (validKeyInArray!0 k0!1914))))

(declare-fun b!562644 () Bool)

(declare-fun res!353794 () Bool)

(assert (=> b!562644 (=> (not res!353794) (not e!324255))))

(declare-datatypes ((List!11043 0))(
  ( (Nil!11040) (Cons!11039 (h!12042 (_ BitVec 64)) (t!17271 List!11043)) )
))
(declare-fun arrayNoDuplicates!0 (array!35325 (_ BitVec 32) List!11043) Bool)

(assert (=> b!562644 (= res!353794 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11040))))

(declare-fun b!562645 () Bool)

(declare-fun e!324249 () Bool)

(assert (=> b!562645 (= e!324249 (not e!324251))))

(declare-fun res!353798 () Bool)

(assert (=> b!562645 (=> res!353798 e!324251)))

(get-info :version)

(assert (=> b!562645 (= res!353798 (or (undefined!6224 lt!256479) (not ((_ is Intermediate!5412) lt!256479))))))

(assert (=> b!562645 (= lt!256477 lt!256481)))

(assert (=> b!562645 (= lt!256481 (Found!5412 j!142))))

(assert (=> b!562645 (= lt!256477 (seekEntryOrOpen!0 (select (arr!16963 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35325 (_ BitVec 32)) Bool)

(assert (=> b!562645 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256482 () Unit!17598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17598)

(assert (=> b!562645 (= lt!256482 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562646 () Bool)

(declare-fun res!353792 () Bool)

(assert (=> b!562646 (=> (not res!353792) (not e!324253))))

(assert (=> b!562646 (= res!353792 (validKeyInArray!0 (select (arr!16963 a!3118) j!142)))))

(declare-fun b!562647 () Bool)

(declare-fun res!353795 () Bool)

(assert (=> b!562647 (=> (not res!353795) (not e!324255))))

(assert (=> b!562647 (= res!353795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562648 () Bool)

(assert (=> b!562648 (= e!324255 e!324249)))

(declare-fun res!353801 () Bool)

(assert (=> b!562648 (=> (not res!353801) (not e!324249))))

(declare-fun lt!256472 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35325 (_ BitVec 32)) SeekEntryResult!5412)

(assert (=> b!562648 (= res!353801 (= lt!256479 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256472 lt!256471 lt!256474 mask!3119)))))

(declare-fun lt!256473 () (_ BitVec 32))

(assert (=> b!562648 (= lt!256479 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256473 (select (arr!16963 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562648 (= lt!256472 (toIndex!0 lt!256471 mask!3119))))

(assert (=> b!562648 (= lt!256471 (select (store (arr!16963 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562648 (= lt!256473 (toIndex!0 (select (arr!16963 a!3118) j!142) mask!3119))))

(assert (=> b!562648 (= lt!256474 (array!35326 (store (arr!16963 a!3118) i!1132 k0!1914) (size!17327 a!3118)))))

(declare-fun b!562649 () Bool)

(declare-fun res!353793 () Bool)

(assert (=> b!562649 (=> (not res!353793) (not e!324253))))

(assert (=> b!562649 (= res!353793 (and (= (size!17327 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17327 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17327 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51460 res!353796) b!562649))

(assert (= (and b!562649 res!353793) b!562646))

(assert (= (and b!562646 res!353792) b!562643))

(assert (= (and b!562643 res!353790) b!562638))

(assert (= (and b!562638 res!353799) b!562640))

(assert (= (and b!562640 res!353800) b!562647))

(assert (= (and b!562647 res!353795) b!562644))

(assert (= (and b!562644 res!353794) b!562648))

(assert (= (and b!562648 res!353801) b!562645))

(assert (= (and b!562645 (not res!353798)) b!562642))

(assert (= (and b!562642 (not res!353797)) b!562639))

(assert (= (and b!562639 (not res!353791)) b!562641))

(declare-fun m!540741 () Bool)

(assert (=> b!562642 m!540741))

(declare-fun m!540743 () Bool)

(assert (=> b!562642 m!540743))

(declare-fun m!540745 () Bool)

(assert (=> b!562647 m!540745))

(declare-fun m!540747 () Bool)

(assert (=> b!562643 m!540747))

(declare-fun m!540749 () Bool)

(assert (=> b!562639 m!540749))

(declare-fun m!540751 () Bool)

(assert (=> b!562639 m!540751))

(declare-fun m!540753 () Bool)

(assert (=> b!562639 m!540753))

(assert (=> b!562639 m!540741))

(declare-fun m!540755 () Bool)

(assert (=> b!562639 m!540755))

(declare-fun m!540757 () Bool)

(assert (=> b!562639 m!540757))

(assert (=> b!562639 m!540741))

(assert (=> b!562646 m!540741))

(assert (=> b!562646 m!540741))

(declare-fun m!540759 () Bool)

(assert (=> b!562646 m!540759))

(declare-fun m!540761 () Bool)

(assert (=> b!562640 m!540761))

(assert (=> b!562648 m!540741))

(declare-fun m!540763 () Bool)

(assert (=> b!562648 m!540763))

(assert (=> b!562648 m!540741))

(declare-fun m!540765 () Bool)

(assert (=> b!562648 m!540765))

(declare-fun m!540767 () Bool)

(assert (=> b!562648 m!540767))

(assert (=> b!562648 m!540753))

(assert (=> b!562648 m!540741))

(declare-fun m!540769 () Bool)

(assert (=> b!562648 m!540769))

(declare-fun m!540771 () Bool)

(assert (=> b!562648 m!540771))

(declare-fun m!540773 () Bool)

(assert (=> b!562641 m!540773))

(declare-fun m!540775 () Bool)

(assert (=> start!51460 m!540775))

(declare-fun m!540777 () Bool)

(assert (=> start!51460 m!540777))

(declare-fun m!540779 () Bool)

(assert (=> b!562638 m!540779))

(assert (=> b!562645 m!540741))

(assert (=> b!562645 m!540741))

(declare-fun m!540781 () Bool)

(assert (=> b!562645 m!540781))

(declare-fun m!540783 () Bool)

(assert (=> b!562645 m!540783))

(declare-fun m!540785 () Bool)

(assert (=> b!562645 m!540785))

(declare-fun m!540787 () Bool)

(assert (=> b!562644 m!540787))

(check-sat (not start!51460) (not b!562645) (not b!562643) (not b!562641) (not b!562639) (not b!562640) (not b!562644) (not b!562638) (not b!562646) (not b!562648) (not b!562647))
(check-sat)
