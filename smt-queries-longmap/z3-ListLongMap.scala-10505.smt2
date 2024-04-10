; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123728 () Bool)

(assert start!123728)

(declare-fun b!1434239 () Bool)

(declare-fun res!967713 () Bool)

(declare-fun e!809484 () Bool)

(assert (=> b!1434239 (=> (not res!967713) (not e!809484))))

(declare-datatypes ((array!97586 0))(
  ( (array!97587 (arr!47097 (Array (_ BitVec 32) (_ BitVec 64))) (size!47647 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97586)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434239 (= res!967713 (validKeyInArray!0 (select (arr!47097 a!2831) j!81)))))

(declare-fun b!1434240 () Bool)

(declare-fun res!967711 () Bool)

(assert (=> b!1434240 (=> (not res!967711) (not e!809484))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434240 (= res!967711 (and (= (size!47647 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47647 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47647 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434241 () Bool)

(declare-fun res!967701 () Bool)

(declare-fun e!809486 () Bool)

(assert (=> b!1434241 (=> (not res!967701) (not e!809486))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434241 (= res!967701 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434242 () Bool)

(declare-fun res!967704 () Bool)

(assert (=> b!1434242 (=> (not res!967704) (not e!809484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97586 (_ BitVec 32)) Bool)

(assert (=> b!1434242 (= res!967704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434243 () Bool)

(declare-fun res!967702 () Bool)

(assert (=> b!1434243 (=> (not res!967702) (not e!809486))))

(declare-datatypes ((SeekEntryResult!11376 0))(
  ( (MissingZero!11376 (index!47896 (_ BitVec 32))) (Found!11376 (index!47897 (_ BitVec 32))) (Intermediate!11376 (undefined!12188 Bool) (index!47898 (_ BitVec 32)) (x!129548 (_ BitVec 32))) (Undefined!11376) (MissingVacant!11376 (index!47899 (_ BitVec 32))) )
))
(declare-fun lt!631381 () SeekEntryResult!11376)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97586 (_ BitVec 32)) SeekEntryResult!11376)

(assert (=> b!1434243 (= res!967702 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47097 a!2831) j!81) a!2831 mask!2608) lt!631381))))

(declare-fun res!967712 () Bool)

(assert (=> start!123728 (=> (not res!967712) (not e!809484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123728 (= res!967712 (validMask!0 mask!2608))))

(assert (=> start!123728 e!809484))

(assert (=> start!123728 true))

(declare-fun array_inv!36125 (array!97586) Bool)

(assert (=> start!123728 (array_inv!36125 a!2831)))

(declare-fun b!1434244 () Bool)

(declare-fun e!809488 () Bool)

(assert (=> b!1434244 (= e!809484 e!809488)))

(declare-fun res!967706 () Bool)

(assert (=> b!1434244 (=> (not res!967706) (not e!809488))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434244 (= res!967706 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47097 a!2831) j!81) mask!2608) (select (arr!47097 a!2831) j!81) a!2831 mask!2608) lt!631381))))

(assert (=> b!1434244 (= lt!631381 (Intermediate!11376 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434245 () Bool)

(declare-fun res!967709 () Bool)

(assert (=> b!1434245 (=> (not res!967709) (not e!809486))))

(declare-fun lt!631382 () (_ BitVec 64))

(declare-fun lt!631385 () array!97586)

(declare-fun lt!631384 () SeekEntryResult!11376)

(assert (=> b!1434245 (= res!967709 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631382 lt!631385 mask!2608) lt!631384))))

(declare-fun b!1434246 () Bool)

(declare-fun e!809487 () Bool)

(assert (=> b!1434246 (= e!809487 true)))

(declare-fun lt!631386 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434246 (= lt!631386 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun e!809489 () Bool)

(declare-fun b!1434247 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97586 (_ BitVec 32)) SeekEntryResult!11376)

(assert (=> b!1434247 (= e!809489 (= (seekEntryOrOpen!0 (select (arr!47097 a!2831) j!81) a!2831 mask!2608) (Found!11376 j!81)))))

(declare-fun b!1434248 () Bool)

(declare-fun res!967714 () Bool)

(assert (=> b!1434248 (=> (not res!967714) (not e!809484))))

(declare-datatypes ((List!33607 0))(
  ( (Nil!33604) (Cons!33603 (h!34932 (_ BitVec 64)) (t!48301 List!33607)) )
))
(declare-fun arrayNoDuplicates!0 (array!97586 (_ BitVec 32) List!33607) Bool)

(assert (=> b!1434248 (= res!967714 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33604))))

(declare-fun b!1434249 () Bool)

(declare-fun res!967705 () Bool)

(assert (=> b!1434249 (=> (not res!967705) (not e!809484))))

(assert (=> b!1434249 (= res!967705 (validKeyInArray!0 (select (arr!47097 a!2831) i!982)))))

(declare-fun b!1434250 () Bool)

(declare-fun res!967710 () Bool)

(assert (=> b!1434250 (=> (not res!967710) (not e!809484))))

(assert (=> b!1434250 (= res!967710 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47647 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47647 a!2831))))))

(declare-fun b!1434251 () Bool)

(assert (=> b!1434251 (= e!809488 e!809486)))

(declare-fun res!967707 () Bool)

(assert (=> b!1434251 (=> (not res!967707) (not e!809486))))

(assert (=> b!1434251 (= res!967707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631382 mask!2608) lt!631382 lt!631385 mask!2608) lt!631384))))

(assert (=> b!1434251 (= lt!631384 (Intermediate!11376 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434251 (= lt!631382 (select (store (arr!47097 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434251 (= lt!631385 (array!97587 (store (arr!47097 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47647 a!2831)))))

(declare-fun b!1434252 () Bool)

(assert (=> b!1434252 (= e!809486 (not e!809487))))

(declare-fun res!967703 () Bool)

(assert (=> b!1434252 (=> res!967703 e!809487)))

(assert (=> b!1434252 (= res!967703 (or (= (select (arr!47097 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47097 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47097 a!2831) index!585) (select (arr!47097 a!2831) j!81)) (= (select (store (arr!47097 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434252 e!809489))

(declare-fun res!967708 () Bool)

(assert (=> b!1434252 (=> (not res!967708) (not e!809489))))

(assert (=> b!1434252 (= res!967708 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48498 0))(
  ( (Unit!48499) )
))
(declare-fun lt!631383 () Unit!48498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48498)

(assert (=> b!1434252 (= lt!631383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!123728 res!967712) b!1434240))

(assert (= (and b!1434240 res!967711) b!1434249))

(assert (= (and b!1434249 res!967705) b!1434239))

(assert (= (and b!1434239 res!967713) b!1434242))

(assert (= (and b!1434242 res!967704) b!1434248))

(assert (= (and b!1434248 res!967714) b!1434250))

(assert (= (and b!1434250 res!967710) b!1434244))

(assert (= (and b!1434244 res!967706) b!1434251))

(assert (= (and b!1434251 res!967707) b!1434243))

(assert (= (and b!1434243 res!967702) b!1434245))

(assert (= (and b!1434245 res!967709) b!1434241))

(assert (= (and b!1434241 res!967701) b!1434252))

(assert (= (and b!1434252 res!967708) b!1434247))

(assert (= (and b!1434252 (not res!967703)) b!1434246))

(declare-fun m!1323857 () Bool)

(assert (=> b!1434248 m!1323857))

(declare-fun m!1323859 () Bool)

(assert (=> b!1434252 m!1323859))

(declare-fun m!1323861 () Bool)

(assert (=> b!1434252 m!1323861))

(declare-fun m!1323863 () Bool)

(assert (=> b!1434252 m!1323863))

(declare-fun m!1323865 () Bool)

(assert (=> b!1434252 m!1323865))

(declare-fun m!1323867 () Bool)

(assert (=> b!1434252 m!1323867))

(declare-fun m!1323869 () Bool)

(assert (=> b!1434252 m!1323869))

(assert (=> b!1434239 m!1323867))

(assert (=> b!1434239 m!1323867))

(declare-fun m!1323871 () Bool)

(assert (=> b!1434239 m!1323871))

(assert (=> b!1434244 m!1323867))

(assert (=> b!1434244 m!1323867))

(declare-fun m!1323873 () Bool)

(assert (=> b!1434244 m!1323873))

(assert (=> b!1434244 m!1323873))

(assert (=> b!1434244 m!1323867))

(declare-fun m!1323875 () Bool)

(assert (=> b!1434244 m!1323875))

(assert (=> b!1434243 m!1323867))

(assert (=> b!1434243 m!1323867))

(declare-fun m!1323877 () Bool)

(assert (=> b!1434243 m!1323877))

(declare-fun m!1323879 () Bool)

(assert (=> start!123728 m!1323879))

(declare-fun m!1323881 () Bool)

(assert (=> start!123728 m!1323881))

(declare-fun m!1323883 () Bool)

(assert (=> b!1434245 m!1323883))

(declare-fun m!1323885 () Bool)

(assert (=> b!1434249 m!1323885))

(assert (=> b!1434249 m!1323885))

(declare-fun m!1323887 () Bool)

(assert (=> b!1434249 m!1323887))

(declare-fun m!1323889 () Bool)

(assert (=> b!1434246 m!1323889))

(declare-fun m!1323891 () Bool)

(assert (=> b!1434251 m!1323891))

(assert (=> b!1434251 m!1323891))

(declare-fun m!1323893 () Bool)

(assert (=> b!1434251 m!1323893))

(assert (=> b!1434251 m!1323859))

(declare-fun m!1323895 () Bool)

(assert (=> b!1434251 m!1323895))

(assert (=> b!1434247 m!1323867))

(assert (=> b!1434247 m!1323867))

(declare-fun m!1323897 () Bool)

(assert (=> b!1434247 m!1323897))

(declare-fun m!1323899 () Bool)

(assert (=> b!1434242 m!1323899))

(check-sat (not b!1434252) (not b!1434245) (not start!123728) (not b!1434246) (not b!1434242) (not b!1434244) (not b!1434243) (not b!1434239) (not b!1434251) (not b!1434248) (not b!1434249) (not b!1434247))
(check-sat)
