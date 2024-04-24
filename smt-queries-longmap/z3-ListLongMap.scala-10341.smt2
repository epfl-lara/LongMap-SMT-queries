; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121784 () Bool)

(assert start!121784)

(declare-fun b!1413696 () Bool)

(declare-fun e!800109 () Bool)

(declare-fun e!800110 () Bool)

(assert (=> b!1413696 (= e!800109 (not e!800110))))

(declare-fun res!950006 () Bool)

(assert (=> b!1413696 (=> res!950006 e!800110)))

(declare-datatypes ((SeekEntryResult!10871 0))(
  ( (MissingZero!10871 (index!45864 (_ BitVec 32))) (Found!10871 (index!45865 (_ BitVec 32))) (Intermediate!10871 (undefined!11683 Bool) (index!45866 (_ BitVec 32)) (x!127609 (_ BitVec 32))) (Undefined!10871) (MissingVacant!10871 (index!45867 (_ BitVec 32))) )
))
(declare-fun lt!622819 () SeekEntryResult!10871)

(get-info :version)

(assert (=> b!1413696 (= res!950006 (or (not ((_ is Intermediate!10871) lt!622819)) (undefined!11683 lt!622819)))))

(declare-fun e!800112 () Bool)

(assert (=> b!1413696 e!800112))

(declare-fun res!950010 () Bool)

(assert (=> b!1413696 (=> (not res!950010) (not e!800112))))

(declare-datatypes ((array!96644 0))(
  ( (array!96645 (arr!46657 (Array (_ BitVec 32) (_ BitVec 64))) (size!47208 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96644)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96644 (_ BitVec 32)) Bool)

(assert (=> b!1413696 (= res!950010 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47743 0))(
  ( (Unit!47744) )
))
(declare-fun lt!622820 () Unit!47743)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47743)

(assert (=> b!1413696 (= lt!622820 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622814 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96644 (_ BitVec 32)) SeekEntryResult!10871)

(assert (=> b!1413696 (= lt!622819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622814 (select (arr!46657 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413696 (= lt!622814 (toIndex!0 (select (arr!46657 a!2901) j!112) mask!2840))))

(declare-fun res!950011 () Bool)

(assert (=> start!121784 (=> (not res!950011) (not e!800109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121784 (= res!950011 (validMask!0 mask!2840))))

(assert (=> start!121784 e!800109))

(assert (=> start!121784 true))

(declare-fun array_inv!35938 (array!96644) Bool)

(assert (=> start!121784 (array_inv!35938 a!2901)))

(declare-fun b!1413697 () Bool)

(declare-fun e!800113 () Bool)

(assert (=> b!1413697 (= e!800113 true)))

(declare-fun e!800114 () Bool)

(assert (=> b!1413697 e!800114))

(declare-fun res!950004 () Bool)

(assert (=> b!1413697 (=> (not res!950004) (not e!800114))))

(declare-fun lt!622818 () SeekEntryResult!10871)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413697 (= res!950004 (and (not (undefined!11683 lt!622818)) (= (index!45866 lt!622818) i!1037) (bvslt (x!127609 lt!622818) (x!127609 lt!622819)) (= (select (store (arr!46657 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45866 lt!622818)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622815 () Unit!47743)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47743)

(assert (=> b!1413697 (= lt!622815 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622814 (x!127609 lt!622819) (index!45866 lt!622819) (x!127609 lt!622818) (index!45866 lt!622818) (undefined!11683 lt!622818) mask!2840))))

(declare-fun b!1413698 () Bool)

(declare-fun res!950003 () Bool)

(assert (=> b!1413698 (=> (not res!950003) (not e!800109))))

(assert (=> b!1413698 (= res!950003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413699 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96644 (_ BitVec 32)) SeekEntryResult!10871)

(assert (=> b!1413699 (= e!800112 (= (seekEntryOrOpen!0 (select (arr!46657 a!2901) j!112) a!2901 mask!2840) (Found!10871 j!112)))))

(declare-fun b!1413700 () Bool)

(declare-fun res!950002 () Bool)

(assert (=> b!1413700 (=> (not res!950002) (not e!800109))))

(assert (=> b!1413700 (= res!950002 (and (= (size!47208 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47208 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47208 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413701 () Bool)

(declare-fun res!950009 () Bool)

(assert (=> b!1413701 (=> (not res!950009) (not e!800109))))

(declare-datatypes ((List!33163 0))(
  ( (Nil!33160) (Cons!33159 (h!34442 (_ BitVec 64)) (t!47849 List!33163)) )
))
(declare-fun arrayNoDuplicates!0 (array!96644 (_ BitVec 32) List!33163) Bool)

(assert (=> b!1413701 (= res!950009 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33160))))

(declare-fun b!1413702 () Bool)

(declare-fun res!950008 () Bool)

(assert (=> b!1413702 (=> (not res!950008) (not e!800109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413702 (= res!950008 (validKeyInArray!0 (select (arr!46657 a!2901) i!1037)))))

(declare-fun lt!622817 () (_ BitVec 64))

(declare-fun lt!622816 () array!96644)

(declare-fun b!1413703 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96644 (_ BitVec 32)) SeekEntryResult!10871)

(assert (=> b!1413703 (= e!800114 (= (seekEntryOrOpen!0 lt!622817 lt!622816 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127609 lt!622818) (index!45866 lt!622818) (index!45866 lt!622818) (select (arr!46657 a!2901) j!112) lt!622816 mask!2840)))))

(declare-fun b!1413704 () Bool)

(declare-fun res!950007 () Bool)

(assert (=> b!1413704 (=> (not res!950007) (not e!800109))))

(assert (=> b!1413704 (= res!950007 (validKeyInArray!0 (select (arr!46657 a!2901) j!112)))))

(declare-fun b!1413705 () Bool)

(assert (=> b!1413705 (= e!800110 e!800113)))

(declare-fun res!950005 () Bool)

(assert (=> b!1413705 (=> res!950005 e!800113)))

(assert (=> b!1413705 (= res!950005 (or (= lt!622819 lt!622818) (not ((_ is Intermediate!10871) lt!622818))))))

(assert (=> b!1413705 (= lt!622818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622817 mask!2840) lt!622817 lt!622816 mask!2840))))

(assert (=> b!1413705 (= lt!622817 (select (store (arr!46657 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413705 (= lt!622816 (array!96645 (store (arr!46657 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47208 a!2901)))))

(assert (= (and start!121784 res!950011) b!1413700))

(assert (= (and b!1413700 res!950002) b!1413702))

(assert (= (and b!1413702 res!950008) b!1413704))

(assert (= (and b!1413704 res!950007) b!1413698))

(assert (= (and b!1413698 res!950003) b!1413701))

(assert (= (and b!1413701 res!950009) b!1413696))

(assert (= (and b!1413696 res!950010) b!1413699))

(assert (= (and b!1413696 (not res!950006)) b!1413705))

(assert (= (and b!1413705 (not res!950005)) b!1413697))

(assert (= (and b!1413697 res!950004) b!1413703))

(declare-fun m!1303999 () Bool)

(assert (=> start!121784 m!1303999))

(declare-fun m!1304001 () Bool)

(assert (=> start!121784 m!1304001))

(declare-fun m!1304003 () Bool)

(assert (=> b!1413705 m!1304003))

(assert (=> b!1413705 m!1304003))

(declare-fun m!1304005 () Bool)

(assert (=> b!1413705 m!1304005))

(declare-fun m!1304007 () Bool)

(assert (=> b!1413705 m!1304007))

(declare-fun m!1304009 () Bool)

(assert (=> b!1413705 m!1304009))

(declare-fun m!1304011 () Bool)

(assert (=> b!1413699 m!1304011))

(assert (=> b!1413699 m!1304011))

(declare-fun m!1304013 () Bool)

(assert (=> b!1413699 m!1304013))

(declare-fun m!1304015 () Bool)

(assert (=> b!1413701 m!1304015))

(declare-fun m!1304017 () Bool)

(assert (=> b!1413703 m!1304017))

(assert (=> b!1413703 m!1304011))

(assert (=> b!1413703 m!1304011))

(declare-fun m!1304019 () Bool)

(assert (=> b!1413703 m!1304019))

(assert (=> b!1413696 m!1304011))

(declare-fun m!1304021 () Bool)

(assert (=> b!1413696 m!1304021))

(assert (=> b!1413696 m!1304011))

(assert (=> b!1413696 m!1304011))

(declare-fun m!1304023 () Bool)

(assert (=> b!1413696 m!1304023))

(declare-fun m!1304025 () Bool)

(assert (=> b!1413696 m!1304025))

(declare-fun m!1304027 () Bool)

(assert (=> b!1413696 m!1304027))

(declare-fun m!1304029 () Bool)

(assert (=> b!1413698 m!1304029))

(assert (=> b!1413697 m!1304007))

(declare-fun m!1304031 () Bool)

(assert (=> b!1413697 m!1304031))

(declare-fun m!1304033 () Bool)

(assert (=> b!1413697 m!1304033))

(assert (=> b!1413704 m!1304011))

(assert (=> b!1413704 m!1304011))

(declare-fun m!1304035 () Bool)

(assert (=> b!1413704 m!1304035))

(declare-fun m!1304037 () Bool)

(assert (=> b!1413702 m!1304037))

(assert (=> b!1413702 m!1304037))

(declare-fun m!1304039 () Bool)

(assert (=> b!1413702 m!1304039))

(check-sat (not b!1413699) (not b!1413701) (not b!1413697) (not b!1413703) (not b!1413698) (not b!1413702) (not start!121784) (not b!1413696) (not b!1413705) (not b!1413704))
(check-sat)
