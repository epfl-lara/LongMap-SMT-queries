; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122168 () Bool)

(assert start!122168)

(declare-fun b!1416806 () Bool)

(declare-fun res!952168 () Bool)

(declare-fun e!801976 () Bool)

(assert (=> b!1416806 (=> (not res!952168) (not e!801976))))

(declare-datatypes ((array!96776 0))(
  ( (array!96777 (arr!46717 (Array (_ BitVec 32) (_ BitVec 64))) (size!47268 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96776)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416806 (= res!952168 (validKeyInArray!0 (select (arr!46717 a!2901) i!1037)))))

(declare-fun b!1416807 () Bool)

(declare-fun res!952172 () Bool)

(assert (=> b!1416807 (=> (not res!952172) (not e!801976))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96776 (_ BitVec 32)) Bool)

(assert (=> b!1416807 (= res!952172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416808 () Bool)

(declare-fun e!801972 () Bool)

(declare-fun e!801974 () Bool)

(assert (=> b!1416808 (= e!801972 e!801974)))

(declare-fun res!952170 () Bool)

(assert (=> b!1416808 (=> res!952170 e!801974)))

(declare-datatypes ((SeekEntryResult!10931 0))(
  ( (MissingZero!10931 (index!46116 (_ BitVec 32))) (Found!10931 (index!46117 (_ BitVec 32))) (Intermediate!10931 (undefined!11743 Bool) (index!46118 (_ BitVec 32)) (x!127877 (_ BitVec 32))) (Undefined!10931) (MissingVacant!10931 (index!46119 (_ BitVec 32))) )
))
(declare-fun lt!624701 () SeekEntryResult!10931)

(declare-fun lt!624698 () (_ BitVec 32))

(declare-fun lt!624699 () SeekEntryResult!10931)

(assert (=> b!1416808 (= res!952170 (or (bvslt (x!127877 lt!624699) #b00000000000000000000000000000000) (bvsgt (x!127877 lt!624699) #b01111111111111111111111111111110) (bvslt (x!127877 lt!624701) #b00000000000000000000000000000000) (bvsgt (x!127877 lt!624701) #b01111111111111111111111111111110) (bvslt lt!624698 #b00000000000000000000000000000000) (bvsge lt!624698 (size!47268 a!2901)) (bvslt (index!46118 lt!624699) #b00000000000000000000000000000000) (bvsge (index!46118 lt!624699) (size!47268 a!2901)) (bvslt (index!46118 lt!624701) #b00000000000000000000000000000000) (bvsge (index!46118 lt!624701) (size!47268 a!2901)) (not (= lt!624699 (Intermediate!10931 false (index!46118 lt!624699) (x!127877 lt!624699)))) (not (= lt!624701 (Intermediate!10931 false (index!46118 lt!624701) (x!127877 lt!624701))))))))

(declare-fun e!801977 () Bool)

(assert (=> b!1416808 e!801977))

(declare-fun res!952174 () Bool)

(assert (=> b!1416808 (=> (not res!952174) (not e!801977))))

(assert (=> b!1416808 (= res!952174 (and (not (undefined!11743 lt!624701)) (= (index!46118 lt!624701) i!1037) (bvslt (x!127877 lt!624701) (x!127877 lt!624699)) (= (select (store (arr!46717 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46118 lt!624701)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47863 0))(
  ( (Unit!47864) )
))
(declare-fun lt!624704 () Unit!47863)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47863)

(assert (=> b!1416808 (= lt!624704 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624698 (x!127877 lt!624699) (index!46118 lt!624699) (x!127877 lt!624701) (index!46118 lt!624701) (undefined!11743 lt!624701) mask!2840))))

(declare-fun lt!624700 () array!96776)

(declare-fun b!1416809 () Bool)

(declare-fun lt!624702 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96776 (_ BitVec 32)) SeekEntryResult!10931)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96776 (_ BitVec 32)) SeekEntryResult!10931)

(assert (=> b!1416809 (= e!801977 (= (seekEntryOrOpen!0 lt!624702 lt!624700 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127877 lt!624701) (index!46118 lt!624701) (index!46118 lt!624701) (select (arr!46717 a!2901) j!112) lt!624700 mask!2840)))))

(declare-fun b!1416810 () Bool)

(declare-fun res!952173 () Bool)

(assert (=> b!1416810 (=> (not res!952173) (not e!801976))))

(assert (=> b!1416810 (= res!952173 (and (= (size!47268 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47268 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47268 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416811 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96776 (_ BitVec 32)) SeekEntryResult!10931)

(assert (=> b!1416811 (= e!801974 (= lt!624701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624698 lt!624702 lt!624700 mask!2840)))))

(declare-fun res!952169 () Bool)

(assert (=> start!122168 (=> (not res!952169) (not e!801976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122168 (= res!952169 (validMask!0 mask!2840))))

(assert (=> start!122168 e!801976))

(assert (=> start!122168 true))

(declare-fun array_inv!35998 (array!96776) Bool)

(assert (=> start!122168 (array_inv!35998 a!2901)))

(declare-fun b!1416812 () Bool)

(declare-fun res!952171 () Bool)

(assert (=> b!1416812 (=> (not res!952171) (not e!801976))))

(declare-datatypes ((List!33223 0))(
  ( (Nil!33220) (Cons!33219 (h!34514 (_ BitVec 64)) (t!47909 List!33223)) )
))
(declare-fun arrayNoDuplicates!0 (array!96776 (_ BitVec 32) List!33223) Bool)

(assert (=> b!1416812 (= res!952171 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33220))))

(declare-fun b!1416813 () Bool)

(declare-fun e!801975 () Bool)

(assert (=> b!1416813 (= e!801976 (not e!801975))))

(declare-fun res!952164 () Bool)

(assert (=> b!1416813 (=> res!952164 e!801975)))

(get-info :version)

(assert (=> b!1416813 (= res!952164 (or (not ((_ is Intermediate!10931) lt!624699)) (undefined!11743 lt!624699)))))

(declare-fun e!801973 () Bool)

(assert (=> b!1416813 e!801973))

(declare-fun res!952166 () Bool)

(assert (=> b!1416813 (=> (not res!952166) (not e!801973))))

(assert (=> b!1416813 (= res!952166 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624703 () Unit!47863)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47863)

(assert (=> b!1416813 (= lt!624703 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416813 (= lt!624699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624698 (select (arr!46717 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416813 (= lt!624698 (toIndex!0 (select (arr!46717 a!2901) j!112) mask!2840))))

(declare-fun b!1416814 () Bool)

(assert (=> b!1416814 (= e!801975 e!801972)))

(declare-fun res!952167 () Bool)

(assert (=> b!1416814 (=> res!952167 e!801972)))

(assert (=> b!1416814 (= res!952167 (or (= lt!624699 lt!624701) (not ((_ is Intermediate!10931) lt!624701))))))

(assert (=> b!1416814 (= lt!624701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624702 mask!2840) lt!624702 lt!624700 mask!2840))))

(assert (=> b!1416814 (= lt!624702 (select (store (arr!46717 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416814 (= lt!624700 (array!96777 (store (arr!46717 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47268 a!2901)))))

(declare-fun b!1416815 () Bool)

(declare-fun res!952165 () Bool)

(assert (=> b!1416815 (=> (not res!952165) (not e!801976))))

(assert (=> b!1416815 (= res!952165 (validKeyInArray!0 (select (arr!46717 a!2901) j!112)))))

(declare-fun b!1416816 () Bool)

(assert (=> b!1416816 (= e!801973 (= (seekEntryOrOpen!0 (select (arr!46717 a!2901) j!112) a!2901 mask!2840) (Found!10931 j!112)))))

(assert (= (and start!122168 res!952169) b!1416810))

(assert (= (and b!1416810 res!952173) b!1416806))

(assert (= (and b!1416806 res!952168) b!1416815))

(assert (= (and b!1416815 res!952165) b!1416807))

(assert (= (and b!1416807 res!952172) b!1416812))

(assert (= (and b!1416812 res!952171) b!1416813))

(assert (= (and b!1416813 res!952166) b!1416816))

(assert (= (and b!1416813 (not res!952164)) b!1416814))

(assert (= (and b!1416814 (not res!952167)) b!1416808))

(assert (= (and b!1416808 res!952174) b!1416809))

(assert (= (and b!1416808 (not res!952170)) b!1416811))

(declare-fun m!1307407 () Bool)

(assert (=> b!1416814 m!1307407))

(assert (=> b!1416814 m!1307407))

(declare-fun m!1307409 () Bool)

(assert (=> b!1416814 m!1307409))

(declare-fun m!1307411 () Bool)

(assert (=> b!1416814 m!1307411))

(declare-fun m!1307413 () Bool)

(assert (=> b!1416814 m!1307413))

(assert (=> b!1416808 m!1307411))

(declare-fun m!1307415 () Bool)

(assert (=> b!1416808 m!1307415))

(declare-fun m!1307417 () Bool)

(assert (=> b!1416808 m!1307417))

(declare-fun m!1307419 () Bool)

(assert (=> b!1416809 m!1307419))

(declare-fun m!1307421 () Bool)

(assert (=> b!1416809 m!1307421))

(assert (=> b!1416809 m!1307421))

(declare-fun m!1307423 () Bool)

(assert (=> b!1416809 m!1307423))

(declare-fun m!1307425 () Bool)

(assert (=> start!122168 m!1307425))

(declare-fun m!1307427 () Bool)

(assert (=> start!122168 m!1307427))

(assert (=> b!1416813 m!1307421))

(declare-fun m!1307429 () Bool)

(assert (=> b!1416813 m!1307429))

(assert (=> b!1416813 m!1307421))

(declare-fun m!1307431 () Bool)

(assert (=> b!1416813 m!1307431))

(assert (=> b!1416813 m!1307421))

(declare-fun m!1307433 () Bool)

(assert (=> b!1416813 m!1307433))

(declare-fun m!1307435 () Bool)

(assert (=> b!1416813 m!1307435))

(assert (=> b!1416815 m!1307421))

(assert (=> b!1416815 m!1307421))

(declare-fun m!1307437 () Bool)

(assert (=> b!1416815 m!1307437))

(declare-fun m!1307439 () Bool)

(assert (=> b!1416807 m!1307439))

(declare-fun m!1307441 () Bool)

(assert (=> b!1416812 m!1307441))

(assert (=> b!1416816 m!1307421))

(assert (=> b!1416816 m!1307421))

(declare-fun m!1307443 () Bool)

(assert (=> b!1416816 m!1307443))

(declare-fun m!1307445 () Bool)

(assert (=> b!1416811 m!1307445))

(declare-fun m!1307447 () Bool)

(assert (=> b!1416806 m!1307447))

(assert (=> b!1416806 m!1307447))

(declare-fun m!1307449 () Bool)

(assert (=> b!1416806 m!1307449))

(check-sat (not b!1416808) (not b!1416806) (not b!1416807) (not b!1416815) (not start!122168) (not b!1416813) (not b!1416811) (not b!1416816) (not b!1416809) (not b!1416812) (not b!1416814))
(check-sat)
