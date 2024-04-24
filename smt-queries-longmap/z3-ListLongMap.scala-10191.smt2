; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120260 () Bool)

(assert start!120260)

(declare-fun b!1399072 () Bool)

(declare-fun res!937301 () Bool)

(declare-fun e!792143 () Bool)

(assert (=> b!1399072 (=> (not res!937301) (not e!792143))))

(declare-datatypes ((array!95711 0))(
  ( (array!95712 (arr!46207 (Array (_ BitVec 32) (_ BitVec 64))) (size!46758 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95711)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399072 (= res!937301 (validKeyInArray!0 (select (arr!46207 a!2901) i!1037)))))

(declare-fun b!1399073 () Bool)

(declare-fun e!792146 () Bool)

(assert (=> b!1399073 (= e!792143 (not e!792146))))

(declare-fun res!937309 () Bool)

(assert (=> b!1399073 (=> res!937309 e!792146)))

(declare-datatypes ((SeekEntryResult!10427 0))(
  ( (MissingZero!10427 (index!44079 (_ BitVec 32))) (Found!10427 (index!44080 (_ BitVec 32))) (Intermediate!10427 (undefined!11239 Bool) (index!44081 (_ BitVec 32)) (x!125884 (_ BitVec 32))) (Undefined!10427) (MissingVacant!10427 (index!44082 (_ BitVec 32))) )
))
(declare-fun lt!614985 () SeekEntryResult!10427)

(get-info :version)

(assert (=> b!1399073 (= res!937309 (or (not ((_ is Intermediate!10427) lt!614985)) (undefined!11239 lt!614985)))))

(declare-fun e!792145 () Bool)

(assert (=> b!1399073 e!792145))

(declare-fun res!937303 () Bool)

(assert (=> b!1399073 (=> (not res!937303) (not e!792145))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95711 (_ BitVec 32)) Bool)

(assert (=> b!1399073 (= res!937303 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46885 0))(
  ( (Unit!46886) )
))
(declare-fun lt!614984 () Unit!46885)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46885)

(assert (=> b!1399073 (= lt!614984 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614990 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95711 (_ BitVec 32)) SeekEntryResult!10427)

(assert (=> b!1399073 (= lt!614985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614990 (select (arr!46207 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399073 (= lt!614990 (toIndex!0 (select (arr!46207 a!2901) j!112) mask!2840))))

(declare-fun b!1399074 () Bool)

(declare-fun e!792142 () Bool)

(assert (=> b!1399074 (= e!792142 true)))

(declare-fun lt!614988 () SeekEntryResult!10427)

(declare-fun lt!614989 () (_ BitVec 64))

(declare-fun lt!614987 () array!95711)

(assert (=> b!1399074 (= lt!614988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614990 lt!614989 lt!614987 mask!2840))))

(declare-fun b!1399075 () Bool)

(declare-fun res!937308 () Bool)

(assert (=> b!1399075 (=> (not res!937308) (not e!792143))))

(assert (=> b!1399075 (= res!937308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399076 () Bool)

(declare-fun res!937302 () Bool)

(assert (=> b!1399076 (=> (not res!937302) (not e!792143))))

(declare-datatypes ((List!32713 0))(
  ( (Nil!32710) (Cons!32709 (h!33959 (_ BitVec 64)) (t!47399 List!32713)) )
))
(declare-fun arrayNoDuplicates!0 (array!95711 (_ BitVec 32) List!32713) Bool)

(assert (=> b!1399076 (= res!937302 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32710))))

(declare-fun b!1399077 () Bool)

(declare-fun res!937305 () Bool)

(assert (=> b!1399077 (=> (not res!937305) (not e!792143))))

(assert (=> b!1399077 (= res!937305 (and (= (size!46758 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46758 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46758 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399078 () Bool)

(assert (=> b!1399078 (= e!792146 e!792142)))

(declare-fun res!937306 () Bool)

(assert (=> b!1399078 (=> res!937306 e!792142)))

(declare-fun lt!614986 () SeekEntryResult!10427)

(assert (=> b!1399078 (= res!937306 (or (= lt!614985 lt!614986) (not ((_ is Intermediate!10427) lt!614986)) (bvslt (x!125884 lt!614985) #b00000000000000000000000000000000) (bvsgt (x!125884 lt!614985) #b01111111111111111111111111111110) (bvslt lt!614990 #b00000000000000000000000000000000) (bvsge lt!614990 (size!46758 a!2901)) (bvslt (index!44081 lt!614985) #b00000000000000000000000000000000) (bvsge (index!44081 lt!614985) (size!46758 a!2901)) (not (= lt!614985 (Intermediate!10427 false (index!44081 lt!614985) (x!125884 lt!614985)))) (not (= lt!614986 (Intermediate!10427 (undefined!11239 lt!614986) (index!44081 lt!614986) (x!125884 lt!614986))))))))

(assert (=> b!1399078 (= lt!614986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614989 mask!2840) lt!614989 lt!614987 mask!2840))))

(assert (=> b!1399078 (= lt!614989 (select (store (arr!46207 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399078 (= lt!614987 (array!95712 (store (arr!46207 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46758 a!2901)))))

(declare-fun res!937304 () Bool)

(assert (=> start!120260 (=> (not res!937304) (not e!792143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120260 (= res!937304 (validMask!0 mask!2840))))

(assert (=> start!120260 e!792143))

(assert (=> start!120260 true))

(declare-fun array_inv!35488 (array!95711) Bool)

(assert (=> start!120260 (array_inv!35488 a!2901)))

(declare-fun b!1399079 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95711 (_ BitVec 32)) SeekEntryResult!10427)

(assert (=> b!1399079 (= e!792145 (= (seekEntryOrOpen!0 (select (arr!46207 a!2901) j!112) a!2901 mask!2840) (Found!10427 j!112)))))

(declare-fun b!1399080 () Bool)

(declare-fun res!937307 () Bool)

(assert (=> b!1399080 (=> (not res!937307) (not e!792143))))

(assert (=> b!1399080 (= res!937307 (validKeyInArray!0 (select (arr!46207 a!2901) j!112)))))

(assert (= (and start!120260 res!937304) b!1399077))

(assert (= (and b!1399077 res!937305) b!1399072))

(assert (= (and b!1399072 res!937301) b!1399080))

(assert (= (and b!1399080 res!937307) b!1399075))

(assert (= (and b!1399075 res!937308) b!1399076))

(assert (= (and b!1399076 res!937302) b!1399073))

(assert (= (and b!1399073 res!937303) b!1399079))

(assert (= (and b!1399073 (not res!937309)) b!1399078))

(assert (= (and b!1399078 (not res!937306)) b!1399074))

(declare-fun m!1286239 () Bool)

(assert (=> b!1399073 m!1286239))

(declare-fun m!1286241 () Bool)

(assert (=> b!1399073 m!1286241))

(declare-fun m!1286243 () Bool)

(assert (=> b!1399073 m!1286243))

(assert (=> b!1399073 m!1286239))

(declare-fun m!1286245 () Bool)

(assert (=> b!1399073 m!1286245))

(assert (=> b!1399073 m!1286239))

(declare-fun m!1286247 () Bool)

(assert (=> b!1399073 m!1286247))

(declare-fun m!1286249 () Bool)

(assert (=> b!1399074 m!1286249))

(declare-fun m!1286251 () Bool)

(assert (=> b!1399072 m!1286251))

(assert (=> b!1399072 m!1286251))

(declare-fun m!1286253 () Bool)

(assert (=> b!1399072 m!1286253))

(declare-fun m!1286255 () Bool)

(assert (=> start!120260 m!1286255))

(declare-fun m!1286257 () Bool)

(assert (=> start!120260 m!1286257))

(assert (=> b!1399079 m!1286239))

(assert (=> b!1399079 m!1286239))

(declare-fun m!1286259 () Bool)

(assert (=> b!1399079 m!1286259))

(declare-fun m!1286261 () Bool)

(assert (=> b!1399075 m!1286261))

(declare-fun m!1286263 () Bool)

(assert (=> b!1399076 m!1286263))

(assert (=> b!1399080 m!1286239))

(assert (=> b!1399080 m!1286239))

(declare-fun m!1286265 () Bool)

(assert (=> b!1399080 m!1286265))

(declare-fun m!1286267 () Bool)

(assert (=> b!1399078 m!1286267))

(assert (=> b!1399078 m!1286267))

(declare-fun m!1286269 () Bool)

(assert (=> b!1399078 m!1286269))

(declare-fun m!1286271 () Bool)

(assert (=> b!1399078 m!1286271))

(declare-fun m!1286273 () Bool)

(assert (=> b!1399078 m!1286273))

(check-sat (not b!1399074) (not b!1399072) (not b!1399073) (not b!1399075) (not b!1399080) (not b!1399078) (not start!120260) (not b!1399079) (not b!1399076))
(check-sat)
