; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120480 () Bool)

(assert start!120480)

(declare-fun b!1402865 () Bool)

(declare-fun e!794352 () Bool)

(declare-fun e!794354 () Bool)

(assert (=> b!1402865 (= e!794352 e!794354)))

(declare-fun res!941386 () Bool)

(assert (=> b!1402865 (=> res!941386 e!794354)))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1402865 (= res!941386 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!10612 0))(
  ( (MissingZero!10612 (index!44825 (_ BitVec 32))) (Found!10612 (index!44826 (_ BitVec 32))) (Intermediate!10612 (undefined!11424 Bool) (index!44827 (_ BitVec 32)) (x!126447 (_ BitVec 32))) (Undefined!10612) (MissingVacant!10612 (index!44828 (_ BitVec 32))) )
))
(declare-fun lt!618147 () SeekEntryResult!10612)

(declare-fun lt!618146 () SeekEntryResult!10612)

(assert (=> b!1402865 (= lt!618147 lt!618146)))

(declare-datatypes ((array!95889 0))(
  ( (array!95890 (arr!46295 (Array (_ BitVec 32) (_ BitVec 64))) (size!46845 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95889)

(declare-fun lt!618151 () SeekEntryResult!10612)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!618153 () (_ BitVec 32))

(declare-fun lt!618150 () SeekEntryResult!10612)

(declare-datatypes ((Unit!47228 0))(
  ( (Unit!47229) )
))
(declare-fun lt!618149 () Unit!47228)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47228)

(assert (=> b!1402865 (= lt!618149 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618153 (x!126447 lt!618150) (index!44827 lt!618150) (x!126447 lt!618151) (index!44827 lt!618151) mask!2840))))

(declare-fun b!1402866 () Bool)

(declare-fun res!941382 () Bool)

(declare-fun e!794356 () Bool)

(assert (=> b!1402866 (=> (not res!941382) (not e!794356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402866 (= res!941382 (validKeyInArray!0 (select (arr!46295 a!2901) j!112)))))

(declare-fun res!941378 () Bool)

(assert (=> start!120480 (=> (not res!941378) (not e!794356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120480 (= res!941378 (validMask!0 mask!2840))))

(assert (=> start!120480 e!794356))

(assert (=> start!120480 true))

(declare-fun array_inv!35323 (array!95889) Bool)

(assert (=> start!120480 (array_inv!35323 a!2901)))

(declare-fun b!1402867 () Bool)

(declare-fun res!941380 () Bool)

(assert (=> b!1402867 (=> (not res!941380) (not e!794356))))

(assert (=> b!1402867 (= res!941380 (validKeyInArray!0 (select (arr!46295 a!2901) i!1037)))))

(declare-fun b!1402868 () Bool)

(declare-fun e!794353 () Bool)

(assert (=> b!1402868 (= e!794356 (not e!794353))))

(declare-fun res!941379 () Bool)

(assert (=> b!1402868 (=> res!941379 e!794353)))

(assert (=> b!1402868 (= res!941379 (or (not (is-Intermediate!10612 lt!618150)) (undefined!11424 lt!618150)))))

(assert (=> b!1402868 (= lt!618147 (Found!10612 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95889 (_ BitVec 32)) SeekEntryResult!10612)

(assert (=> b!1402868 (= lt!618147 (seekEntryOrOpen!0 (select (arr!46295 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95889 (_ BitVec 32)) Bool)

(assert (=> b!1402868 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618145 () Unit!47228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47228)

(assert (=> b!1402868 (= lt!618145 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95889 (_ BitVec 32)) SeekEntryResult!10612)

(assert (=> b!1402868 (= lt!618150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618153 (select (arr!46295 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402868 (= lt!618153 (toIndex!0 (select (arr!46295 a!2901) j!112) mask!2840))))

(declare-fun b!1402869 () Bool)

(declare-fun res!941383 () Bool)

(assert (=> b!1402869 (=> (not res!941383) (not e!794356))))

(assert (=> b!1402869 (= res!941383 (and (= (size!46845 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46845 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46845 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402870 () Bool)

(declare-fun res!941381 () Bool)

(assert (=> b!1402870 (=> (not res!941381) (not e!794356))))

(assert (=> b!1402870 (= res!941381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402871 () Bool)

(declare-fun res!941384 () Bool)

(assert (=> b!1402871 (=> (not res!941384) (not e!794356))))

(declare-datatypes ((List!32814 0))(
  ( (Nil!32811) (Cons!32810 (h!34058 (_ BitVec 64)) (t!47508 List!32814)) )
))
(declare-fun arrayNoDuplicates!0 (array!95889 (_ BitVec 32) List!32814) Bool)

(assert (=> b!1402871 (= res!941384 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32811))))

(declare-fun b!1402872 () Bool)

(declare-fun e!794357 () Bool)

(assert (=> b!1402872 (= e!794357 e!794352)))

(declare-fun res!941377 () Bool)

(assert (=> b!1402872 (=> res!941377 e!794352)))

(assert (=> b!1402872 (= res!941377 (or (bvslt (x!126447 lt!618150) #b00000000000000000000000000000000) (bvsgt (x!126447 lt!618150) #b01111111111111111111111111111110) (bvslt (x!126447 lt!618151) #b00000000000000000000000000000000) (bvsgt (x!126447 lt!618151) #b01111111111111111111111111111110) (bvslt lt!618153 #b00000000000000000000000000000000) (bvsge lt!618153 (size!46845 a!2901)) (bvslt (index!44827 lt!618150) #b00000000000000000000000000000000) (bvsge (index!44827 lt!618150) (size!46845 a!2901)) (bvslt (index!44827 lt!618151) #b00000000000000000000000000000000) (bvsge (index!44827 lt!618151) (size!46845 a!2901)) (not (= lt!618150 (Intermediate!10612 false (index!44827 lt!618150) (x!126447 lt!618150)))) (not (= lt!618151 (Intermediate!10612 false (index!44827 lt!618151) (x!126447 lt!618151))))))))

(declare-fun lt!618144 () array!95889)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95889 (_ BitVec 32)) SeekEntryResult!10612)

(assert (=> b!1402872 (= lt!618146 (seekKeyOrZeroReturnVacant!0 (x!126447 lt!618151) (index!44827 lt!618151) (index!44827 lt!618151) (select (arr!46295 a!2901) j!112) lt!618144 mask!2840))))

(declare-fun lt!618152 () (_ BitVec 64))

(assert (=> b!1402872 (= lt!618146 (seekEntryOrOpen!0 lt!618152 lt!618144 mask!2840))))

(assert (=> b!1402872 (and (not (undefined!11424 lt!618151)) (= (index!44827 lt!618151) i!1037) (bvslt (x!126447 lt!618151) (x!126447 lt!618150)) (= (select (store (arr!46295 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44827 lt!618151)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!618148 () Unit!47228)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95889 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47228)

(assert (=> b!1402872 (= lt!618148 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618153 (x!126447 lt!618150) (index!44827 lt!618150) (x!126447 lt!618151) (index!44827 lt!618151) (undefined!11424 lt!618151) mask!2840))))

(declare-fun b!1402873 () Bool)

(assert (=> b!1402873 (= e!794353 e!794357)))

(declare-fun res!941376 () Bool)

(assert (=> b!1402873 (=> res!941376 e!794357)))

(assert (=> b!1402873 (= res!941376 (or (= lt!618150 lt!618151) (not (is-Intermediate!10612 lt!618151))))))

(assert (=> b!1402873 (= lt!618151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618152 mask!2840) lt!618152 lt!618144 mask!2840))))

(assert (=> b!1402873 (= lt!618152 (select (store (arr!46295 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402873 (= lt!618144 (array!95890 (store (arr!46295 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46845 a!2901)))))

(declare-fun b!1402874 () Bool)

(declare-fun res!941385 () Bool)

(assert (=> b!1402874 (=> res!941385 e!794352)))

(assert (=> b!1402874 (= res!941385 (not (= lt!618151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618153 lt!618152 lt!618144 mask!2840))))))

(declare-fun b!1402875 () Bool)

(assert (=> b!1402875 (= e!794354 (validKeyInArray!0 lt!618152))))

(assert (= (and start!120480 res!941378) b!1402869))

(assert (= (and b!1402869 res!941383) b!1402867))

(assert (= (and b!1402867 res!941380) b!1402866))

(assert (= (and b!1402866 res!941382) b!1402870))

(assert (= (and b!1402870 res!941381) b!1402871))

(assert (= (and b!1402871 res!941384) b!1402868))

(assert (= (and b!1402868 (not res!941379)) b!1402873))

(assert (= (and b!1402873 (not res!941376)) b!1402872))

(assert (= (and b!1402872 (not res!941377)) b!1402874))

(assert (= (and b!1402874 (not res!941385)) b!1402865))

(assert (= (and b!1402865 (not res!941386)) b!1402875))

(declare-fun m!1291251 () Bool)

(assert (=> b!1402867 m!1291251))

(assert (=> b!1402867 m!1291251))

(declare-fun m!1291253 () Bool)

(assert (=> b!1402867 m!1291253))

(declare-fun m!1291255 () Bool)

(assert (=> b!1402874 m!1291255))

(declare-fun m!1291257 () Bool)

(assert (=> b!1402871 m!1291257))

(declare-fun m!1291259 () Bool)

(assert (=> start!120480 m!1291259))

(declare-fun m!1291261 () Bool)

(assert (=> start!120480 m!1291261))

(declare-fun m!1291263 () Bool)

(assert (=> b!1402872 m!1291263))

(declare-fun m!1291265 () Bool)

(assert (=> b!1402872 m!1291265))

(declare-fun m!1291267 () Bool)

(assert (=> b!1402872 m!1291267))

(assert (=> b!1402872 m!1291263))

(declare-fun m!1291269 () Bool)

(assert (=> b!1402872 m!1291269))

(declare-fun m!1291271 () Bool)

(assert (=> b!1402872 m!1291271))

(declare-fun m!1291273 () Bool)

(assert (=> b!1402872 m!1291273))

(declare-fun m!1291275 () Bool)

(assert (=> b!1402865 m!1291275))

(declare-fun m!1291277 () Bool)

(assert (=> b!1402875 m!1291277))

(declare-fun m!1291279 () Bool)

(assert (=> b!1402870 m!1291279))

(assert (=> b!1402868 m!1291263))

(declare-fun m!1291281 () Bool)

(assert (=> b!1402868 m!1291281))

(assert (=> b!1402868 m!1291263))

(declare-fun m!1291283 () Bool)

(assert (=> b!1402868 m!1291283))

(assert (=> b!1402868 m!1291263))

(declare-fun m!1291285 () Bool)

(assert (=> b!1402868 m!1291285))

(declare-fun m!1291287 () Bool)

(assert (=> b!1402868 m!1291287))

(assert (=> b!1402868 m!1291263))

(declare-fun m!1291289 () Bool)

(assert (=> b!1402868 m!1291289))

(assert (=> b!1402866 m!1291263))

(assert (=> b!1402866 m!1291263))

(declare-fun m!1291291 () Bool)

(assert (=> b!1402866 m!1291291))

(declare-fun m!1291293 () Bool)

(assert (=> b!1402873 m!1291293))

(assert (=> b!1402873 m!1291293))

(declare-fun m!1291295 () Bool)

(assert (=> b!1402873 m!1291295))

(assert (=> b!1402873 m!1291267))

(declare-fun m!1291297 () Bool)

(assert (=> b!1402873 m!1291297))

(push 1)

