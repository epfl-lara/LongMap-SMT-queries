; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120312 () Bool)

(assert start!120312)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95721 0))(
  ( (array!95722 (arr!46211 (Array (_ BitVec 32) (_ BitVec 64))) (size!46761 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95721)

(declare-fun b!1400157 () Bool)

(declare-fun lt!616003 () array!95721)

(declare-fun lt!616005 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10528 0))(
  ( (MissingZero!10528 (index!44489 (_ BitVec 32))) (Found!10528 (index!44490 (_ BitVec 32))) (Intermediate!10528 (undefined!11340 Bool) (index!44491 (_ BitVec 32)) (x!126139 (_ BitVec 32))) (Undefined!10528) (MissingVacant!10528 (index!44492 (_ BitVec 32))) )
))
(declare-fun lt!616002 () SeekEntryResult!10528)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!792719 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95721 (_ BitVec 32)) SeekEntryResult!10528)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95721 (_ BitVec 32)) SeekEntryResult!10528)

(assert (=> b!1400157 (= e!792719 (= (seekEntryOrOpen!0 lt!616005 lt!616003 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126139 lt!616002) (index!44491 lt!616002) (index!44491 lt!616002) (select (arr!46211 a!2901) j!112) lt!616003 mask!2840)))))

(declare-fun b!1400158 () Bool)

(declare-fun res!938673 () Bool)

(declare-fun e!792718 () Bool)

(assert (=> b!1400158 (=> (not res!938673) (not e!792718))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400158 (= res!938673 (validKeyInArray!0 (select (arr!46211 a!2901) i!1037)))))

(declare-fun b!1400159 () Bool)

(declare-fun res!938672 () Bool)

(assert (=> b!1400159 (=> (not res!938672) (not e!792718))))

(declare-datatypes ((List!32730 0))(
  ( (Nil!32727) (Cons!32726 (h!33974 (_ BitVec 64)) (t!47424 List!32730)) )
))
(declare-fun arrayNoDuplicates!0 (array!95721 (_ BitVec 32) List!32730) Bool)

(assert (=> b!1400159 (= res!938672 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32727))))

(declare-fun b!1400160 () Bool)

(declare-fun e!792720 () Bool)

(assert (=> b!1400160 (= e!792718 (not e!792720))))

(declare-fun res!938677 () Bool)

(assert (=> b!1400160 (=> res!938677 e!792720)))

(declare-fun lt!616001 () SeekEntryResult!10528)

(assert (=> b!1400160 (= res!938677 (or (not (is-Intermediate!10528 lt!616001)) (undefined!11340 lt!616001)))))

(declare-fun e!792722 () Bool)

(assert (=> b!1400160 e!792722))

(declare-fun res!938674 () Bool)

(assert (=> b!1400160 (=> (not res!938674) (not e!792722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95721 (_ BitVec 32)) Bool)

(assert (=> b!1400160 (= res!938674 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47060 0))(
  ( (Unit!47061) )
))
(declare-fun lt!615998 () Unit!47060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47060)

(assert (=> b!1400160 (= lt!615998 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615999 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95721 (_ BitVec 32)) SeekEntryResult!10528)

(assert (=> b!1400160 (= lt!616001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615999 (select (arr!46211 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400160 (= lt!615999 (toIndex!0 (select (arr!46211 a!2901) j!112) mask!2840))))

(declare-fun b!1400161 () Bool)

(declare-fun res!938667 () Bool)

(assert (=> b!1400161 (=> (not res!938667) (not e!792718))))

(assert (=> b!1400161 (= res!938667 (validKeyInArray!0 (select (arr!46211 a!2901) j!112)))))

(declare-fun b!1400162 () Bool)

(declare-fun res!938668 () Bool)

(assert (=> b!1400162 (=> (not res!938668) (not e!792718))))

(assert (=> b!1400162 (= res!938668 (and (= (size!46761 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46761 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46761 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400163 () Bool)

(declare-fun e!792721 () Bool)

(assert (=> b!1400163 (= e!792721 true)))

(declare-fun lt!616000 () SeekEntryResult!10528)

(assert (=> b!1400163 (= lt!616000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615999 lt!616005 lt!616003 mask!2840))))

(declare-fun b!1400164 () Bool)

(declare-fun e!792717 () Bool)

(assert (=> b!1400164 (= e!792717 e!792721)))

(declare-fun res!938675 () Bool)

(assert (=> b!1400164 (=> res!938675 e!792721)))

(assert (=> b!1400164 (= res!938675 (or (bvslt (x!126139 lt!616001) #b00000000000000000000000000000000) (bvsgt (x!126139 lt!616001) #b01111111111111111111111111111110) (bvslt (x!126139 lt!616002) #b00000000000000000000000000000000) (bvsgt (x!126139 lt!616002) #b01111111111111111111111111111110) (bvslt lt!615999 #b00000000000000000000000000000000) (bvsge lt!615999 (size!46761 a!2901)) (bvslt (index!44491 lt!616001) #b00000000000000000000000000000000) (bvsge (index!44491 lt!616001) (size!46761 a!2901)) (bvslt (index!44491 lt!616002) #b00000000000000000000000000000000) (bvsge (index!44491 lt!616002) (size!46761 a!2901)) (not (= lt!616001 (Intermediate!10528 false (index!44491 lt!616001) (x!126139 lt!616001)))) (not (= lt!616002 (Intermediate!10528 false (index!44491 lt!616002) (x!126139 lt!616002))))))))

(assert (=> b!1400164 e!792719))

(declare-fun res!938670 () Bool)

(assert (=> b!1400164 (=> (not res!938670) (not e!792719))))

(assert (=> b!1400164 (= res!938670 (and (not (undefined!11340 lt!616002)) (= (index!44491 lt!616002) i!1037) (bvslt (x!126139 lt!616002) (x!126139 lt!616001)) (= (select (store (arr!46211 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44491 lt!616002)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616004 () Unit!47060)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47060)

(assert (=> b!1400164 (= lt!616004 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615999 (x!126139 lt!616001) (index!44491 lt!616001) (x!126139 lt!616002) (index!44491 lt!616002) (undefined!11340 lt!616002) mask!2840))))

(declare-fun b!1400156 () Bool)

(declare-fun res!938669 () Bool)

(assert (=> b!1400156 (=> (not res!938669) (not e!792718))))

(assert (=> b!1400156 (= res!938669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!938676 () Bool)

(assert (=> start!120312 (=> (not res!938676) (not e!792718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120312 (= res!938676 (validMask!0 mask!2840))))

(assert (=> start!120312 e!792718))

(assert (=> start!120312 true))

(declare-fun array_inv!35239 (array!95721) Bool)

(assert (=> start!120312 (array_inv!35239 a!2901)))

(declare-fun b!1400165 () Bool)

(assert (=> b!1400165 (= e!792722 (= (seekEntryOrOpen!0 (select (arr!46211 a!2901) j!112) a!2901 mask!2840) (Found!10528 j!112)))))

(declare-fun b!1400166 () Bool)

(assert (=> b!1400166 (= e!792720 e!792717)))

(declare-fun res!938671 () Bool)

(assert (=> b!1400166 (=> res!938671 e!792717)))

(assert (=> b!1400166 (= res!938671 (or (= lt!616001 lt!616002) (not (is-Intermediate!10528 lt!616002))))))

(assert (=> b!1400166 (= lt!616002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616005 mask!2840) lt!616005 lt!616003 mask!2840))))

(assert (=> b!1400166 (= lt!616005 (select (store (arr!46211 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400166 (= lt!616003 (array!95722 (store (arr!46211 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46761 a!2901)))))

(assert (= (and start!120312 res!938676) b!1400162))

(assert (= (and b!1400162 res!938668) b!1400158))

(assert (= (and b!1400158 res!938673) b!1400161))

(assert (= (and b!1400161 res!938667) b!1400156))

(assert (= (and b!1400156 res!938669) b!1400159))

(assert (= (and b!1400159 res!938672) b!1400160))

(assert (= (and b!1400160 res!938674) b!1400165))

(assert (= (and b!1400160 (not res!938677)) b!1400166))

(assert (= (and b!1400166 (not res!938671)) b!1400164))

(assert (= (and b!1400164 res!938670) b!1400157))

(assert (= (and b!1400164 (not res!938675)) b!1400163))

(declare-fun m!1287513 () Bool)

(assert (=> b!1400166 m!1287513))

(assert (=> b!1400166 m!1287513))

(declare-fun m!1287515 () Bool)

(assert (=> b!1400166 m!1287515))

(declare-fun m!1287517 () Bool)

(assert (=> b!1400166 m!1287517))

(declare-fun m!1287519 () Bool)

(assert (=> b!1400166 m!1287519))

(declare-fun m!1287521 () Bool)

(assert (=> b!1400159 m!1287521))

(declare-fun m!1287523 () Bool)

(assert (=> b!1400165 m!1287523))

(assert (=> b!1400165 m!1287523))

(declare-fun m!1287525 () Bool)

(assert (=> b!1400165 m!1287525))

(declare-fun m!1287527 () Bool)

(assert (=> b!1400157 m!1287527))

(assert (=> b!1400157 m!1287523))

(assert (=> b!1400157 m!1287523))

(declare-fun m!1287529 () Bool)

(assert (=> b!1400157 m!1287529))

(assert (=> b!1400160 m!1287523))

(declare-fun m!1287531 () Bool)

(assert (=> b!1400160 m!1287531))

(assert (=> b!1400160 m!1287523))

(declare-fun m!1287533 () Bool)

(assert (=> b!1400160 m!1287533))

(assert (=> b!1400160 m!1287523))

(declare-fun m!1287535 () Bool)

(assert (=> b!1400160 m!1287535))

(declare-fun m!1287537 () Bool)

(assert (=> b!1400160 m!1287537))

(declare-fun m!1287539 () Bool)

(assert (=> b!1400158 m!1287539))

(assert (=> b!1400158 m!1287539))

(declare-fun m!1287541 () Bool)

(assert (=> b!1400158 m!1287541))

(assert (=> b!1400164 m!1287517))

(declare-fun m!1287543 () Bool)

(assert (=> b!1400164 m!1287543))

(declare-fun m!1287545 () Bool)

(assert (=> b!1400164 m!1287545))

(assert (=> b!1400161 m!1287523))

(assert (=> b!1400161 m!1287523))

(declare-fun m!1287547 () Bool)

(assert (=> b!1400161 m!1287547))

(declare-fun m!1287549 () Bool)

(assert (=> b!1400163 m!1287549))

(declare-fun m!1287551 () Bool)

(assert (=> start!120312 m!1287551))

(declare-fun m!1287553 () Bool)

(assert (=> start!120312 m!1287553))

(declare-fun m!1287555 () Bool)

(assert (=> b!1400156 m!1287555))

(push 1)

