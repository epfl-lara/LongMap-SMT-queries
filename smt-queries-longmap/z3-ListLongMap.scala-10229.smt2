; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120614 () Bool)

(assert start!120614)

(declare-fun res!941010 () Bool)

(declare-fun e!794652 () Bool)

(assert (=> start!120614 (=> (not res!941010) (not e!794652))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120614 (= res!941010 (validMask!0 mask!2840))))

(assert (=> start!120614 e!794652))

(assert (=> start!120614 true))

(declare-datatypes ((array!95945 0))(
  ( (array!95946 (arr!46321 (Array (_ BitVec 32) (_ BitVec 64))) (size!46872 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95945)

(declare-fun array_inv!35602 (array!95945) Bool)

(assert (=> start!120614 (array_inv!35602 a!2901)))

(declare-fun b!1403177 () Bool)

(declare-fun res!941008 () Bool)

(assert (=> b!1403177 (=> (not res!941008) (not e!794652))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403177 (= res!941008 (validKeyInArray!0 (select (arr!46321 a!2901) i!1037)))))

(declare-fun b!1403178 () Bool)

(declare-fun res!941006 () Bool)

(assert (=> b!1403178 (=> (not res!941006) (not e!794652))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403178 (= res!941006 (validKeyInArray!0 (select (arr!46321 a!2901) j!112)))))

(declare-fun b!1403179 () Bool)

(declare-fun res!941014 () Bool)

(assert (=> b!1403179 (=> (not res!941014) (not e!794652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95945 (_ BitVec 32)) Bool)

(assert (=> b!1403179 (= res!941014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun lt!617769 () array!95945)

(declare-fun b!1403180 () Bool)

(declare-fun lt!617771 () (_ BitVec 64))

(declare-fun e!794656 () Bool)

(declare-datatypes ((SeekEntryResult!10541 0))(
  ( (MissingZero!10541 (index!44541 (_ BitVec 32))) (Found!10541 (index!44542 (_ BitVec 32))) (Intermediate!10541 (undefined!11353 Bool) (index!44543 (_ BitVec 32)) (x!126323 (_ BitVec 32))) (Undefined!10541) (MissingVacant!10541 (index!44544 (_ BitVec 32))) )
))
(declare-fun lt!617767 () SeekEntryResult!10541)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95945 (_ BitVec 32)) SeekEntryResult!10541)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95945 (_ BitVec 32)) SeekEntryResult!10541)

(assert (=> b!1403180 (= e!794656 (= (seekEntryOrOpen!0 lt!617771 lt!617769 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126323 lt!617767) (index!44543 lt!617767) (index!44543 lt!617767) (select (arr!46321 a!2901) j!112) lt!617769 mask!2840)))))

(declare-fun b!1403181 () Bool)

(declare-fun e!794654 () Bool)

(assert (=> b!1403181 (= e!794654 true)))

(declare-fun lt!617768 () (_ BitVec 32))

(declare-fun lt!617770 () SeekEntryResult!10541)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95945 (_ BitVec 32)) SeekEntryResult!10541)

(assert (=> b!1403181 (= lt!617770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617768 lt!617771 lt!617769 mask!2840))))

(declare-fun b!1403182 () Bool)

(declare-fun res!941004 () Bool)

(assert (=> b!1403182 (=> (not res!941004) (not e!794652))))

(declare-datatypes ((List!32827 0))(
  ( (Nil!32824) (Cons!32823 (h!34079 (_ BitVec 64)) (t!47513 List!32827)) )
))
(declare-fun arrayNoDuplicates!0 (array!95945 (_ BitVec 32) List!32827) Bool)

(assert (=> b!1403182 (= res!941004 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32824))))

(declare-fun b!1403183 () Bool)

(declare-fun e!794653 () Bool)

(declare-fun e!794651 () Bool)

(assert (=> b!1403183 (= e!794653 e!794651)))

(declare-fun res!941013 () Bool)

(assert (=> b!1403183 (=> res!941013 e!794651)))

(declare-fun lt!617766 () SeekEntryResult!10541)

(get-info :version)

(assert (=> b!1403183 (= res!941013 (or (= lt!617766 lt!617767) (not ((_ is Intermediate!10541) lt!617767))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403183 (= lt!617767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617771 mask!2840) lt!617771 lt!617769 mask!2840))))

(assert (=> b!1403183 (= lt!617771 (select (store (arr!46321 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403183 (= lt!617769 (array!95946 (store (arr!46321 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46872 a!2901)))))

(declare-fun b!1403184 () Bool)

(assert (=> b!1403184 (= e!794652 (not e!794653))))

(declare-fun res!941012 () Bool)

(assert (=> b!1403184 (=> res!941012 e!794653)))

(assert (=> b!1403184 (= res!941012 (or (not ((_ is Intermediate!10541) lt!617766)) (undefined!11353 lt!617766)))))

(declare-fun e!794657 () Bool)

(assert (=> b!1403184 e!794657))

(declare-fun res!941005 () Bool)

(assert (=> b!1403184 (=> (not res!941005) (not e!794657))))

(assert (=> b!1403184 (= res!941005 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47113 0))(
  ( (Unit!47114) )
))
(declare-fun lt!617764 () Unit!47113)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47113)

(assert (=> b!1403184 (= lt!617764 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403184 (= lt!617766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617768 (select (arr!46321 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1403184 (= lt!617768 (toIndex!0 (select (arr!46321 a!2901) j!112) mask!2840))))

(declare-fun b!1403185 () Bool)

(assert (=> b!1403185 (= e!794651 e!794654)))

(declare-fun res!941007 () Bool)

(assert (=> b!1403185 (=> res!941007 e!794654)))

(assert (=> b!1403185 (= res!941007 (or (bvslt (x!126323 lt!617766) #b00000000000000000000000000000000) (bvsgt (x!126323 lt!617766) #b01111111111111111111111111111110) (bvslt (x!126323 lt!617767) #b00000000000000000000000000000000) (bvsgt (x!126323 lt!617767) #b01111111111111111111111111111110) (bvslt lt!617768 #b00000000000000000000000000000000) (bvsge lt!617768 (size!46872 a!2901)) (bvslt (index!44543 lt!617766) #b00000000000000000000000000000000) (bvsge (index!44543 lt!617766) (size!46872 a!2901)) (bvslt (index!44543 lt!617767) #b00000000000000000000000000000000) (bvsge (index!44543 lt!617767) (size!46872 a!2901)) (not (= lt!617766 (Intermediate!10541 false (index!44543 lt!617766) (x!126323 lt!617766)))) (not (= lt!617767 (Intermediate!10541 false (index!44543 lt!617767) (x!126323 lt!617767))))))))

(assert (=> b!1403185 e!794656))

(declare-fun res!941011 () Bool)

(assert (=> b!1403185 (=> (not res!941011) (not e!794656))))

(assert (=> b!1403185 (= res!941011 (and (not (undefined!11353 lt!617767)) (= (index!44543 lt!617767) i!1037) (bvslt (x!126323 lt!617767) (x!126323 lt!617766)) (= (select (store (arr!46321 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44543 lt!617767)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617765 () Unit!47113)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47113)

(assert (=> b!1403185 (= lt!617765 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617768 (x!126323 lt!617766) (index!44543 lt!617766) (x!126323 lt!617767) (index!44543 lt!617767) (undefined!11353 lt!617767) mask!2840))))

(declare-fun b!1403186 () Bool)

(assert (=> b!1403186 (= e!794657 (= (seekEntryOrOpen!0 (select (arr!46321 a!2901) j!112) a!2901 mask!2840) (Found!10541 j!112)))))

(declare-fun b!1403187 () Bool)

(declare-fun res!941009 () Bool)

(assert (=> b!1403187 (=> (not res!941009) (not e!794652))))

(assert (=> b!1403187 (= res!941009 (and (= (size!46872 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46872 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46872 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120614 res!941010) b!1403187))

(assert (= (and b!1403187 res!941009) b!1403177))

(assert (= (and b!1403177 res!941008) b!1403178))

(assert (= (and b!1403178 res!941006) b!1403179))

(assert (= (and b!1403179 res!941014) b!1403182))

(assert (= (and b!1403182 res!941004) b!1403184))

(assert (= (and b!1403184 res!941005) b!1403186))

(assert (= (and b!1403184 (not res!941012)) b!1403183))

(assert (= (and b!1403183 (not res!941013)) b!1403185))

(assert (= (and b!1403185 res!941011) b!1403180))

(assert (= (and b!1403185 (not res!941007)) b!1403181))

(declare-fun m!1291393 () Bool)

(assert (=> b!1403182 m!1291393))

(declare-fun m!1291395 () Bool)

(assert (=> b!1403185 m!1291395))

(declare-fun m!1291397 () Bool)

(assert (=> b!1403185 m!1291397))

(declare-fun m!1291399 () Bool)

(assert (=> b!1403185 m!1291399))

(declare-fun m!1291401 () Bool)

(assert (=> start!120614 m!1291401))

(declare-fun m!1291403 () Bool)

(assert (=> start!120614 m!1291403))

(declare-fun m!1291405 () Bool)

(assert (=> b!1403177 m!1291405))

(assert (=> b!1403177 m!1291405))

(declare-fun m!1291407 () Bool)

(assert (=> b!1403177 m!1291407))

(declare-fun m!1291409 () Bool)

(assert (=> b!1403184 m!1291409))

(declare-fun m!1291411 () Bool)

(assert (=> b!1403184 m!1291411))

(assert (=> b!1403184 m!1291409))

(declare-fun m!1291413 () Bool)

(assert (=> b!1403184 m!1291413))

(declare-fun m!1291415 () Bool)

(assert (=> b!1403184 m!1291415))

(assert (=> b!1403184 m!1291409))

(declare-fun m!1291417 () Bool)

(assert (=> b!1403184 m!1291417))

(declare-fun m!1291419 () Bool)

(assert (=> b!1403183 m!1291419))

(assert (=> b!1403183 m!1291419))

(declare-fun m!1291421 () Bool)

(assert (=> b!1403183 m!1291421))

(assert (=> b!1403183 m!1291395))

(declare-fun m!1291423 () Bool)

(assert (=> b!1403183 m!1291423))

(assert (=> b!1403186 m!1291409))

(assert (=> b!1403186 m!1291409))

(declare-fun m!1291425 () Bool)

(assert (=> b!1403186 m!1291425))

(declare-fun m!1291427 () Bool)

(assert (=> b!1403179 m!1291427))

(declare-fun m!1291429 () Bool)

(assert (=> b!1403180 m!1291429))

(assert (=> b!1403180 m!1291409))

(assert (=> b!1403180 m!1291409))

(declare-fun m!1291431 () Bool)

(assert (=> b!1403180 m!1291431))

(declare-fun m!1291433 () Bool)

(assert (=> b!1403181 m!1291433))

(assert (=> b!1403178 m!1291409))

(assert (=> b!1403178 m!1291409))

(declare-fun m!1291435 () Bool)

(assert (=> b!1403178 m!1291435))

(check-sat (not b!1403185) (not b!1403182) (not b!1403179) (not b!1403184) (not b!1403183) (not b!1403177) (not b!1403178) (not b!1403181) (not b!1403186) (not start!120614) (not b!1403180))
(check-sat)
