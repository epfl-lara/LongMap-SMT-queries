; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120290 () Bool)

(assert start!120290)

(declare-fun b!1399793 () Bool)

(declare-fun e!792486 () Bool)

(declare-fun e!792489 () Bool)

(assert (=> b!1399793 (= e!792486 e!792489)))

(declare-fun res!938304 () Bool)

(assert (=> b!1399793 (=> res!938304 e!792489)))

(declare-datatypes ((array!95699 0))(
  ( (array!95700 (arr!46200 (Array (_ BitVec 32) (_ BitVec 64))) (size!46750 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95699)

(declare-datatypes ((SeekEntryResult!10517 0))(
  ( (MissingZero!10517 (index!44445 (_ BitVec 32))) (Found!10517 (index!44446 (_ BitVec 32))) (Intermediate!10517 (undefined!11329 Bool) (index!44447 (_ BitVec 32)) (x!126096 (_ BitVec 32))) (Undefined!10517) (MissingVacant!10517 (index!44448 (_ BitVec 32))) )
))
(declare-fun lt!615740 () SeekEntryResult!10517)

(declare-fun lt!615739 () SeekEntryResult!10517)

(declare-fun lt!615741 () (_ BitVec 32))

(assert (=> b!1399793 (= res!938304 (or (bvslt (x!126096 lt!615739) #b00000000000000000000000000000000) (bvsgt (x!126096 lt!615739) #b01111111111111111111111111111110) (bvslt (x!126096 lt!615740) #b00000000000000000000000000000000) (bvsgt (x!126096 lt!615740) #b01111111111111111111111111111110) (bvslt lt!615741 #b00000000000000000000000000000000) (bvsge lt!615741 (size!46750 a!2901)) (bvslt (index!44447 lt!615739) #b00000000000000000000000000000000) (bvsge (index!44447 lt!615739) (size!46750 a!2901)) (bvslt (index!44447 lt!615740) #b00000000000000000000000000000000) (bvsge (index!44447 lt!615740) (size!46750 a!2901)) (not (= lt!615739 (Intermediate!10517 false (index!44447 lt!615739) (x!126096 lt!615739)))) (not (= lt!615740 (Intermediate!10517 false (index!44447 lt!615740) (x!126096 lt!615740))))))))

(declare-fun e!792485 () Bool)

(assert (=> b!1399793 e!792485))

(declare-fun res!938307 () Bool)

(assert (=> b!1399793 (=> (not res!938307) (not e!792485))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1399793 (= res!938307 (and (not (undefined!11329 lt!615740)) (= (index!44447 lt!615740) i!1037) (bvslt (x!126096 lt!615740) (x!126096 lt!615739)) (= (select (store (arr!46200 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44447 lt!615740)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47038 0))(
  ( (Unit!47039) )
))
(declare-fun lt!615737 () Unit!47038)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47038)

(assert (=> b!1399793 (= lt!615737 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615741 (x!126096 lt!615739) (index!44447 lt!615739) (x!126096 lt!615740) (index!44447 lt!615740) (undefined!11329 lt!615740) mask!2840))))

(declare-fun b!1399794 () Bool)

(declare-fun res!938312 () Bool)

(declare-fun e!792488 () Bool)

(assert (=> b!1399794 (=> (not res!938312) (not e!792488))))

(declare-datatypes ((List!32719 0))(
  ( (Nil!32716) (Cons!32715 (h!33963 (_ BitVec 64)) (t!47413 List!32719)) )
))
(declare-fun arrayNoDuplicates!0 (array!95699 (_ BitVec 32) List!32719) Bool)

(assert (=> b!1399794 (= res!938312 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32716))))

(declare-fun b!1399795 () Bool)

(declare-fun e!792491 () Bool)

(assert (=> b!1399795 (= e!792488 (not e!792491))))

(declare-fun res!938306 () Bool)

(assert (=> b!1399795 (=> res!938306 e!792491)))

(get-info :version)

(assert (=> b!1399795 (= res!938306 (or (not ((_ is Intermediate!10517) lt!615739)) (undefined!11329 lt!615739)))))

(declare-fun e!792487 () Bool)

(assert (=> b!1399795 e!792487))

(declare-fun res!938308 () Bool)

(assert (=> b!1399795 (=> (not res!938308) (not e!792487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95699 (_ BitVec 32)) Bool)

(assert (=> b!1399795 (= res!938308 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615738 () Unit!47038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47038)

(assert (=> b!1399795 (= lt!615738 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95699 (_ BitVec 32)) SeekEntryResult!10517)

(assert (=> b!1399795 (= lt!615739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615741 (select (arr!46200 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399795 (= lt!615741 (toIndex!0 (select (arr!46200 a!2901) j!112) mask!2840))))

(declare-fun b!1399796 () Bool)

(assert (=> b!1399796 (= e!792489 true)))

(declare-fun lt!615735 () array!95699)

(declare-fun lt!615734 () (_ BitVec 64))

(declare-fun lt!615736 () SeekEntryResult!10517)

(assert (=> b!1399796 (= lt!615736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615741 lt!615734 lt!615735 mask!2840))))

(declare-fun b!1399797 () Bool)

(declare-fun res!938314 () Bool)

(assert (=> b!1399797 (=> (not res!938314) (not e!792488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399797 (= res!938314 (validKeyInArray!0 (select (arr!46200 a!2901) i!1037)))))

(declare-fun b!1399798 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95699 (_ BitVec 32)) SeekEntryResult!10517)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95699 (_ BitVec 32)) SeekEntryResult!10517)

(assert (=> b!1399798 (= e!792485 (= (seekEntryOrOpen!0 lt!615734 lt!615735 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126096 lt!615740) (index!44447 lt!615740) (index!44447 lt!615740) (select (arr!46200 a!2901) j!112) lt!615735 mask!2840)))))

(declare-fun res!938311 () Bool)

(assert (=> start!120290 (=> (not res!938311) (not e!792488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120290 (= res!938311 (validMask!0 mask!2840))))

(assert (=> start!120290 e!792488))

(assert (=> start!120290 true))

(declare-fun array_inv!35228 (array!95699) Bool)

(assert (=> start!120290 (array_inv!35228 a!2901)))

(declare-fun b!1399799 () Bool)

(declare-fun res!938310 () Bool)

(assert (=> b!1399799 (=> (not res!938310) (not e!792488))))

(assert (=> b!1399799 (= res!938310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399800 () Bool)

(assert (=> b!1399800 (= e!792491 e!792486)))

(declare-fun res!938305 () Bool)

(assert (=> b!1399800 (=> res!938305 e!792486)))

(assert (=> b!1399800 (= res!938305 (or (= lt!615739 lt!615740) (not ((_ is Intermediate!10517) lt!615740))))))

(assert (=> b!1399800 (= lt!615740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615734 mask!2840) lt!615734 lt!615735 mask!2840))))

(assert (=> b!1399800 (= lt!615734 (select (store (arr!46200 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399800 (= lt!615735 (array!95700 (store (arr!46200 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46750 a!2901)))))

(declare-fun b!1399801 () Bool)

(declare-fun res!938313 () Bool)

(assert (=> b!1399801 (=> (not res!938313) (not e!792488))))

(assert (=> b!1399801 (= res!938313 (and (= (size!46750 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46750 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46750 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399802 () Bool)

(declare-fun res!938309 () Bool)

(assert (=> b!1399802 (=> (not res!938309) (not e!792488))))

(assert (=> b!1399802 (= res!938309 (validKeyInArray!0 (select (arr!46200 a!2901) j!112)))))

(declare-fun b!1399803 () Bool)

(assert (=> b!1399803 (= e!792487 (= (seekEntryOrOpen!0 (select (arr!46200 a!2901) j!112) a!2901 mask!2840) (Found!10517 j!112)))))

(assert (= (and start!120290 res!938311) b!1399801))

(assert (= (and b!1399801 res!938313) b!1399797))

(assert (= (and b!1399797 res!938314) b!1399802))

(assert (= (and b!1399802 res!938309) b!1399799))

(assert (= (and b!1399799 res!938310) b!1399794))

(assert (= (and b!1399794 res!938312) b!1399795))

(assert (= (and b!1399795 res!938308) b!1399803))

(assert (= (and b!1399795 (not res!938306)) b!1399800))

(assert (= (and b!1399800 (not res!938305)) b!1399793))

(assert (= (and b!1399793 res!938307) b!1399798))

(assert (= (and b!1399793 (not res!938304)) b!1399796))

(declare-fun m!1287029 () Bool)

(assert (=> b!1399793 m!1287029))

(declare-fun m!1287031 () Bool)

(assert (=> b!1399793 m!1287031))

(declare-fun m!1287033 () Bool)

(assert (=> b!1399793 m!1287033))

(declare-fun m!1287035 () Bool)

(assert (=> b!1399799 m!1287035))

(declare-fun m!1287037 () Bool)

(assert (=> b!1399796 m!1287037))

(declare-fun m!1287039 () Bool)

(assert (=> b!1399797 m!1287039))

(assert (=> b!1399797 m!1287039))

(declare-fun m!1287041 () Bool)

(assert (=> b!1399797 m!1287041))

(declare-fun m!1287043 () Bool)

(assert (=> b!1399802 m!1287043))

(assert (=> b!1399802 m!1287043))

(declare-fun m!1287045 () Bool)

(assert (=> b!1399802 m!1287045))

(assert (=> b!1399803 m!1287043))

(assert (=> b!1399803 m!1287043))

(declare-fun m!1287047 () Bool)

(assert (=> b!1399803 m!1287047))

(declare-fun m!1287049 () Bool)

(assert (=> start!120290 m!1287049))

(declare-fun m!1287051 () Bool)

(assert (=> start!120290 m!1287051))

(declare-fun m!1287053 () Bool)

(assert (=> b!1399800 m!1287053))

(assert (=> b!1399800 m!1287053))

(declare-fun m!1287055 () Bool)

(assert (=> b!1399800 m!1287055))

(assert (=> b!1399800 m!1287029))

(declare-fun m!1287057 () Bool)

(assert (=> b!1399800 m!1287057))

(assert (=> b!1399795 m!1287043))

(declare-fun m!1287059 () Bool)

(assert (=> b!1399795 m!1287059))

(assert (=> b!1399795 m!1287043))

(assert (=> b!1399795 m!1287043))

(declare-fun m!1287061 () Bool)

(assert (=> b!1399795 m!1287061))

(declare-fun m!1287063 () Bool)

(assert (=> b!1399795 m!1287063))

(declare-fun m!1287065 () Bool)

(assert (=> b!1399795 m!1287065))

(declare-fun m!1287067 () Bool)

(assert (=> b!1399794 m!1287067))

(declare-fun m!1287069 () Bool)

(assert (=> b!1399798 m!1287069))

(assert (=> b!1399798 m!1287043))

(assert (=> b!1399798 m!1287043))

(declare-fun m!1287071 () Bool)

(assert (=> b!1399798 m!1287071))

(check-sat (not b!1399793) (not b!1399795) (not b!1399802) (not b!1399794) (not b!1399799) (not b!1399798) (not b!1399796) (not b!1399800) (not b!1399803) (not start!120290) (not b!1399797))
(check-sat)
