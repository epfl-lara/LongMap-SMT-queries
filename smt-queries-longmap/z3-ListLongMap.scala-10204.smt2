; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120206 () Bool)

(assert start!120206)

(declare-fun b!1399170 () Bool)

(declare-fun res!937973 () Bool)

(declare-fun e!792123 () Bool)

(assert (=> b!1399170 (=> (not res!937973) (not e!792123))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95631 0))(
  ( (array!95632 (arr!46168 (Array (_ BitVec 32) (_ BitVec 64))) (size!46720 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95631)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1399170 (= res!937973 (and (= (size!46720 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46720 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46720 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399171 () Bool)

(declare-fun res!937975 () Bool)

(assert (=> b!1399171 (=> (not res!937975) (not e!792123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399171 (= res!937975 (validKeyInArray!0 (select (arr!46168 a!2901) j!112)))))

(declare-fun b!1399172 () Bool)

(declare-fun res!937976 () Bool)

(assert (=> b!1399172 (=> (not res!937976) (not e!792123))))

(assert (=> b!1399172 (= res!937976 (validKeyInArray!0 (select (arr!46168 a!2901) i!1037)))))

(declare-fun e!792122 () Bool)

(declare-fun b!1399173 () Bool)

(declare-datatypes ((SeekEntryResult!10511 0))(
  ( (MissingZero!10511 (index!44418 (_ BitVec 32))) (Found!10511 (index!44419 (_ BitVec 32))) (Intermediate!10511 (undefined!11323 Bool) (index!44420 (_ BitVec 32)) (x!126059 (_ BitVec 32))) (Undefined!10511) (MissingVacant!10511 (index!44421 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95631 (_ BitVec 32)) SeekEntryResult!10511)

(assert (=> b!1399173 (= e!792122 (= (seekEntryOrOpen!0 (select (arr!46168 a!2901) j!112) a!2901 mask!2840) (Found!10511 j!112)))))

(declare-fun b!1399174 () Bool)

(declare-fun res!937971 () Bool)

(assert (=> b!1399174 (=> (not res!937971) (not e!792123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95631 (_ BitVec 32)) Bool)

(assert (=> b!1399174 (= res!937971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399175 () Bool)

(declare-fun e!792121 () Bool)

(assert (=> b!1399175 (= e!792123 (not e!792121))))

(declare-fun res!937978 () Bool)

(assert (=> b!1399175 (=> res!937978 e!792121)))

(declare-fun lt!615238 () SeekEntryResult!10511)

(get-info :version)

(assert (=> b!1399175 (= res!937978 (or (not ((_ is Intermediate!10511) lt!615238)) (undefined!11323 lt!615238)))))

(assert (=> b!1399175 e!792122))

(declare-fun res!937974 () Bool)

(assert (=> b!1399175 (=> (not res!937974) (not e!792122))))

(assert (=> b!1399175 (= res!937974 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46869 0))(
  ( (Unit!46870) )
))
(declare-fun lt!615239 () Unit!46869)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46869)

(assert (=> b!1399175 (= lt!615239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615242 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95631 (_ BitVec 32)) SeekEntryResult!10511)

(assert (=> b!1399175 (= lt!615238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615242 (select (arr!46168 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399175 (= lt!615242 (toIndex!0 (select (arr!46168 a!2901) j!112) mask!2840))))

(declare-fun b!1399176 () Bool)

(declare-fun res!937969 () Bool)

(assert (=> b!1399176 (=> (not res!937969) (not e!792123))))

(declare-datatypes ((List!32765 0))(
  ( (Nil!32762) (Cons!32761 (h!34006 (_ BitVec 64)) (t!47451 List!32765)) )
))
(declare-fun arrayNoDuplicates!0 (array!95631 (_ BitVec 32) List!32765) Bool)

(assert (=> b!1399176 (= res!937969 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32762))))

(declare-fun b!1399177 () Bool)

(declare-fun e!792125 () Bool)

(assert (=> b!1399177 (= e!792121 e!792125)))

(declare-fun res!937972 () Bool)

(assert (=> b!1399177 (=> res!937972 e!792125)))

(declare-fun lt!615236 () SeekEntryResult!10511)

(assert (=> b!1399177 (= res!937972 (or (= lt!615238 lt!615236) (not ((_ is Intermediate!10511) lt!615236))))))

(declare-fun lt!615237 () (_ BitVec 64))

(declare-fun lt!615241 () array!95631)

(assert (=> b!1399177 (= lt!615236 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615237 mask!2840) lt!615237 lt!615241 mask!2840))))

(assert (=> b!1399177 (= lt!615237 (select (store (arr!46168 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399177 (= lt!615241 (array!95632 (store (arr!46168 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46720 a!2901)))))

(declare-fun b!1399179 () Bool)

(assert (=> b!1399179 (= e!792125 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun e!792124 () Bool)

(assert (=> b!1399179 e!792124))

(declare-fun res!937977 () Bool)

(assert (=> b!1399179 (=> (not res!937977) (not e!792124))))

(assert (=> b!1399179 (= res!937977 (and (not (undefined!11323 lt!615236)) (= (index!44420 lt!615236) i!1037) (bvslt (x!126059 lt!615236) (x!126059 lt!615238)) (= (select (store (arr!46168 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44420 lt!615236)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615240 () Unit!46869)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46869)

(assert (=> b!1399179 (= lt!615240 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615242 (x!126059 lt!615238) (index!44420 lt!615238) (x!126059 lt!615236) (index!44420 lt!615236) (undefined!11323 lt!615236) mask!2840))))

(declare-fun b!1399178 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95631 (_ BitVec 32)) SeekEntryResult!10511)

(assert (=> b!1399178 (= e!792124 (= (seekEntryOrOpen!0 lt!615237 lt!615241 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126059 lt!615236) (index!44420 lt!615236) (index!44420 lt!615236) (select (arr!46168 a!2901) j!112) lt!615241 mask!2840)))))

(declare-fun res!937970 () Bool)

(assert (=> start!120206 (=> (not res!937970) (not e!792123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120206 (= res!937970 (validMask!0 mask!2840))))

(assert (=> start!120206 e!792123))

(assert (=> start!120206 true))

(declare-fun array_inv!35401 (array!95631) Bool)

(assert (=> start!120206 (array_inv!35401 a!2901)))

(assert (= (and start!120206 res!937970) b!1399170))

(assert (= (and b!1399170 res!937973) b!1399172))

(assert (= (and b!1399172 res!937976) b!1399171))

(assert (= (and b!1399171 res!937975) b!1399174))

(assert (= (and b!1399174 res!937971) b!1399176))

(assert (= (and b!1399176 res!937969) b!1399175))

(assert (= (and b!1399175 res!937974) b!1399173))

(assert (= (and b!1399175 (not res!937978)) b!1399177))

(assert (= (and b!1399177 (not res!937972)) b!1399179))

(assert (= (and b!1399179 res!937977) b!1399178))

(declare-fun m!1285975 () Bool)

(assert (=> b!1399175 m!1285975))

(declare-fun m!1285977 () Bool)

(assert (=> b!1399175 m!1285977))

(declare-fun m!1285979 () Bool)

(assert (=> b!1399175 m!1285979))

(declare-fun m!1285981 () Bool)

(assert (=> b!1399175 m!1285981))

(assert (=> b!1399175 m!1285975))

(declare-fun m!1285983 () Bool)

(assert (=> b!1399175 m!1285983))

(assert (=> b!1399175 m!1285975))

(assert (=> b!1399171 m!1285975))

(assert (=> b!1399171 m!1285975))

(declare-fun m!1285985 () Bool)

(assert (=> b!1399171 m!1285985))

(declare-fun m!1285987 () Bool)

(assert (=> b!1399174 m!1285987))

(declare-fun m!1285989 () Bool)

(assert (=> b!1399172 m!1285989))

(assert (=> b!1399172 m!1285989))

(declare-fun m!1285991 () Bool)

(assert (=> b!1399172 m!1285991))

(declare-fun m!1285993 () Bool)

(assert (=> b!1399176 m!1285993))

(declare-fun m!1285995 () Bool)

(assert (=> start!120206 m!1285995))

(declare-fun m!1285997 () Bool)

(assert (=> start!120206 m!1285997))

(assert (=> b!1399173 m!1285975))

(assert (=> b!1399173 m!1285975))

(declare-fun m!1285999 () Bool)

(assert (=> b!1399173 m!1285999))

(declare-fun m!1286001 () Bool)

(assert (=> b!1399177 m!1286001))

(assert (=> b!1399177 m!1286001))

(declare-fun m!1286003 () Bool)

(assert (=> b!1399177 m!1286003))

(declare-fun m!1286005 () Bool)

(assert (=> b!1399177 m!1286005))

(declare-fun m!1286007 () Bool)

(assert (=> b!1399177 m!1286007))

(declare-fun m!1286009 () Bool)

(assert (=> b!1399178 m!1286009))

(assert (=> b!1399178 m!1285975))

(assert (=> b!1399178 m!1285975))

(declare-fun m!1286011 () Bool)

(assert (=> b!1399178 m!1286011))

(assert (=> b!1399179 m!1286005))

(declare-fun m!1286013 () Bool)

(assert (=> b!1399179 m!1286013))

(declare-fun m!1286015 () Bool)

(assert (=> b!1399179 m!1286015))

(check-sat (not b!1399171) (not b!1399179) (not b!1399173) (not b!1399172) (not b!1399178) (not b!1399175) (not start!120206) (not b!1399176) (not b!1399177) (not b!1399174))
(check-sat)
