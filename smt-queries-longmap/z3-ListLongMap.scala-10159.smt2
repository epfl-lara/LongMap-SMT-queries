; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119720 () Bool)

(assert start!119720)

(declare-fun b!1394629 () Bool)

(declare-fun e!789587 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1394629 (= e!789587 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((array!95402 0))(
  ( (array!95403 (arr!46059 (Array (_ BitVec 32) (_ BitVec 64))) (size!46609 (_ BitVec 32))) )
))
(declare-fun lt!612623 () array!95402)

(declare-fun lt!612618 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10376 0))(
  ( (MissingZero!10376 (index!43875 (_ BitVec 32))) (Found!10376 (index!43876 (_ BitVec 32))) (Intermediate!10376 (undefined!11188 Bool) (index!43877 (_ BitVec 32)) (x!125540 (_ BitVec 32))) (Undefined!10376) (MissingVacant!10376 (index!43878 (_ BitVec 32))) )
))
(declare-fun lt!612624 () SeekEntryResult!10376)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95402 (_ BitVec 32)) SeekEntryResult!10376)

(assert (=> b!1394629 (= lt!612624 (seekEntryOrOpen!0 lt!612618 lt!612623 mask!2840))))

(declare-fun a!2901 () array!95402)

(declare-datatypes ((Unit!46756 0))(
  ( (Unit!46757) )
))
(declare-fun lt!612620 () Unit!46756)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612622 () SeekEntryResult!10376)

(declare-fun lt!612619 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46756)

(assert (=> b!1394629 (= lt!612620 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612619 (x!125540 lt!612622) (index!43877 lt!612622) mask!2840))))

(declare-fun b!1394630 () Bool)

(declare-fun res!934041 () Bool)

(declare-fun e!789588 () Bool)

(assert (=> b!1394630 (=> (not res!934041) (not e!789588))))

(assert (=> b!1394630 (= res!934041 (and (= (size!46609 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46609 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46609 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394631 () Bool)

(declare-fun res!934045 () Bool)

(assert (=> b!1394631 (=> (not res!934045) (not e!789588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394631 (= res!934045 (validKeyInArray!0 (select (arr!46059 a!2901) i!1037)))))

(declare-fun b!1394632 () Bool)

(declare-fun res!934044 () Bool)

(assert (=> b!1394632 (=> (not res!934044) (not e!789588))))

(assert (=> b!1394632 (= res!934044 (validKeyInArray!0 (select (arr!46059 a!2901) j!112)))))

(declare-fun b!1394633 () Bool)

(declare-fun e!789589 () Bool)

(assert (=> b!1394633 (= e!789589 e!789587)))

(declare-fun res!934038 () Bool)

(assert (=> b!1394633 (=> res!934038 e!789587)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95402 (_ BitVec 32)) SeekEntryResult!10376)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394633 (= res!934038 (not (= lt!612622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612618 mask!2840) lt!612618 lt!612623 mask!2840))))))

(assert (=> b!1394633 (= lt!612618 (select (store (arr!46059 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394633 (= lt!612623 (array!95403 (store (arr!46059 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46609 a!2901)))))

(declare-fun b!1394634 () Bool)

(declare-fun res!934040 () Bool)

(assert (=> b!1394634 (=> (not res!934040) (not e!789588))))

(declare-datatypes ((List!32578 0))(
  ( (Nil!32575) (Cons!32574 (h!33807 (_ BitVec 64)) (t!47272 List!32578)) )
))
(declare-fun arrayNoDuplicates!0 (array!95402 (_ BitVec 32) List!32578) Bool)

(assert (=> b!1394634 (= res!934040 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32575))))

(declare-fun res!934042 () Bool)

(assert (=> start!119720 (=> (not res!934042) (not e!789588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119720 (= res!934042 (validMask!0 mask!2840))))

(assert (=> start!119720 e!789588))

(assert (=> start!119720 true))

(declare-fun array_inv!35087 (array!95402) Bool)

(assert (=> start!119720 (array_inv!35087 a!2901)))

(declare-fun b!1394635 () Bool)

(declare-fun res!934043 () Bool)

(assert (=> b!1394635 (=> res!934043 e!789587)))

(assert (=> b!1394635 (= res!934043 (or (bvslt (x!125540 lt!612622) #b00000000000000000000000000000000) (bvsgt (x!125540 lt!612622) #b01111111111111111111111111111110) (bvslt lt!612619 #b00000000000000000000000000000000) (bvsge lt!612619 (size!46609 a!2901)) (bvslt (index!43877 lt!612622) #b00000000000000000000000000000000) (bvsge (index!43877 lt!612622) (size!46609 a!2901)) (not (= lt!612622 (Intermediate!10376 false (index!43877 lt!612622) (x!125540 lt!612622))))))))

(declare-fun b!1394636 () Bool)

(assert (=> b!1394636 (= e!789588 (not e!789589))))

(declare-fun res!934039 () Bool)

(assert (=> b!1394636 (=> res!934039 e!789589)))

(get-info :version)

(assert (=> b!1394636 (= res!934039 (or (not ((_ is Intermediate!10376) lt!612622)) (undefined!11188 lt!612622)))))

(assert (=> b!1394636 (= lt!612624 (Found!10376 j!112))))

(assert (=> b!1394636 (= lt!612624 (seekEntryOrOpen!0 (select (arr!46059 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95402 (_ BitVec 32)) Bool)

(assert (=> b!1394636 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612621 () Unit!46756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46756)

(assert (=> b!1394636 (= lt!612621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394636 (= lt!612622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612619 (select (arr!46059 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394636 (= lt!612619 (toIndex!0 (select (arr!46059 a!2901) j!112) mask!2840))))

(declare-fun b!1394637 () Bool)

(declare-fun res!934037 () Bool)

(assert (=> b!1394637 (=> (not res!934037) (not e!789588))))

(assert (=> b!1394637 (= res!934037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119720 res!934042) b!1394630))

(assert (= (and b!1394630 res!934041) b!1394631))

(assert (= (and b!1394631 res!934045) b!1394632))

(assert (= (and b!1394632 res!934044) b!1394637))

(assert (= (and b!1394637 res!934037) b!1394634))

(assert (= (and b!1394634 res!934040) b!1394636))

(assert (= (and b!1394636 (not res!934039)) b!1394633))

(assert (= (and b!1394633 (not res!934038)) b!1394635))

(assert (= (and b!1394635 (not res!934043)) b!1394629))

(declare-fun m!1281029 () Bool)

(assert (=> b!1394633 m!1281029))

(assert (=> b!1394633 m!1281029))

(declare-fun m!1281031 () Bool)

(assert (=> b!1394633 m!1281031))

(declare-fun m!1281033 () Bool)

(assert (=> b!1394633 m!1281033))

(declare-fun m!1281035 () Bool)

(assert (=> b!1394633 m!1281035))

(declare-fun m!1281037 () Bool)

(assert (=> b!1394631 m!1281037))

(assert (=> b!1394631 m!1281037))

(declare-fun m!1281039 () Bool)

(assert (=> b!1394631 m!1281039))

(declare-fun m!1281041 () Bool)

(assert (=> b!1394632 m!1281041))

(assert (=> b!1394632 m!1281041))

(declare-fun m!1281043 () Bool)

(assert (=> b!1394632 m!1281043))

(assert (=> b!1394636 m!1281041))

(declare-fun m!1281045 () Bool)

(assert (=> b!1394636 m!1281045))

(assert (=> b!1394636 m!1281041))

(declare-fun m!1281047 () Bool)

(assert (=> b!1394636 m!1281047))

(assert (=> b!1394636 m!1281041))

(declare-fun m!1281049 () Bool)

(assert (=> b!1394636 m!1281049))

(assert (=> b!1394636 m!1281041))

(declare-fun m!1281051 () Bool)

(assert (=> b!1394636 m!1281051))

(declare-fun m!1281053 () Bool)

(assert (=> b!1394636 m!1281053))

(declare-fun m!1281055 () Bool)

(assert (=> start!119720 m!1281055))

(declare-fun m!1281057 () Bool)

(assert (=> start!119720 m!1281057))

(declare-fun m!1281059 () Bool)

(assert (=> b!1394634 m!1281059))

(declare-fun m!1281061 () Bool)

(assert (=> b!1394629 m!1281061))

(declare-fun m!1281063 () Bool)

(assert (=> b!1394629 m!1281063))

(declare-fun m!1281065 () Bool)

(assert (=> b!1394637 m!1281065))

(check-sat (not b!1394634) (not b!1394636) (not b!1394637) (not b!1394633) (not b!1394629) (not b!1394632) (not b!1394631) (not start!119720))
(check-sat)
