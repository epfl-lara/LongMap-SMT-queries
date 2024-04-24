; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122204 () Bool)

(assert start!122204)

(declare-fun b!1417371 () Bool)

(declare-fun res!952736 () Bool)

(declare-fun e!802295 () Bool)

(assert (=> b!1417371 (=> (not res!952736) (not e!802295))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96812 0))(
  ( (array!96813 (arr!46735 (Array (_ BitVec 32) (_ BitVec 64))) (size!47286 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96812)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417371 (= res!952736 (and (= (size!47286 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47286 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47286 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417372 () Bool)

(declare-fun e!802291 () Bool)

(declare-fun e!802293 () Bool)

(assert (=> b!1417372 (= e!802291 e!802293)))

(declare-fun res!952733 () Bool)

(assert (=> b!1417372 (=> res!952733 e!802293)))

(declare-fun lt!625185 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10949 0))(
  ( (MissingZero!10949 (index!46188 (_ BitVec 32))) (Found!10949 (index!46189 (_ BitVec 32))) (Intermediate!10949 (undefined!11761 Bool) (index!46190 (_ BitVec 32)) (x!127943 (_ BitVec 32))) (Undefined!10949) (MissingVacant!10949 (index!46191 (_ BitVec 32))) )
))
(declare-fun lt!625188 () SeekEntryResult!10949)

(declare-fun lt!625181 () SeekEntryResult!10949)

(assert (=> b!1417372 (= res!952733 (or (bvslt (x!127943 lt!625181) #b00000000000000000000000000000000) (bvsgt (x!127943 lt!625181) #b01111111111111111111111111111110) (bvslt (x!127943 lt!625188) #b00000000000000000000000000000000) (bvsgt (x!127943 lt!625188) #b01111111111111111111111111111110) (bvslt lt!625185 #b00000000000000000000000000000000) (bvsge lt!625185 (size!47286 a!2901)) (bvslt (index!46190 lt!625181) #b00000000000000000000000000000000) (bvsge (index!46190 lt!625181) (size!47286 a!2901)) (bvslt (index!46190 lt!625188) #b00000000000000000000000000000000) (bvsge (index!46190 lt!625188) (size!47286 a!2901)) (not (= lt!625181 (Intermediate!10949 false (index!46190 lt!625181) (x!127943 lt!625181)))) (not (= lt!625188 (Intermediate!10949 false (index!46190 lt!625188) (x!127943 lt!625188))))))))

(declare-fun lt!625183 () array!96812)

(declare-fun lt!625187 () SeekEntryResult!10949)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96812 (_ BitVec 32)) SeekEntryResult!10949)

(assert (=> b!1417372 (= lt!625187 (seekKeyOrZeroReturnVacant!0 (x!127943 lt!625188) (index!46190 lt!625188) (index!46190 lt!625188) (select (arr!46735 a!2901) j!112) lt!625183 mask!2840))))

(declare-fun lt!625186 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96812 (_ BitVec 32)) SeekEntryResult!10949)

(assert (=> b!1417372 (= lt!625187 (seekEntryOrOpen!0 lt!625186 lt!625183 mask!2840))))

(assert (=> b!1417372 (and (not (undefined!11761 lt!625188)) (= (index!46190 lt!625188) i!1037) (bvslt (x!127943 lt!625188) (x!127943 lt!625181)) (= (select (store (arr!46735 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46190 lt!625188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47899 0))(
  ( (Unit!47900) )
))
(declare-fun lt!625182 () Unit!47899)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47899)

(assert (=> b!1417372 (= lt!625182 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!625185 (x!127943 lt!625181) (index!46190 lt!625181) (x!127943 lt!625188) (index!46190 lt!625188) (undefined!11761 lt!625188) mask!2840))))

(declare-fun b!1417373 () Bool)

(declare-fun res!952730 () Bool)

(assert (=> b!1417373 (=> (not res!952730) (not e!802295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417373 (= res!952730 (validKeyInArray!0 (select (arr!46735 a!2901) i!1037)))))

(declare-fun b!1417374 () Bool)

(declare-fun res!952729 () Bool)

(assert (=> b!1417374 (=> (not res!952729) (not e!802295))))

(assert (=> b!1417374 (= res!952729 (validKeyInArray!0 (select (arr!46735 a!2901) j!112)))))

(declare-fun b!1417375 () Bool)

(declare-fun res!952732 () Bool)

(assert (=> b!1417375 (=> (not res!952732) (not e!802295))))

(declare-datatypes ((List!33241 0))(
  ( (Nil!33238) (Cons!33237 (h!34532 (_ BitVec 64)) (t!47927 List!33241)) )
))
(declare-fun arrayNoDuplicates!0 (array!96812 (_ BitVec 32) List!33241) Bool)

(assert (=> b!1417375 (= res!952732 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33238))))

(declare-fun b!1417376 () Bool)

(declare-fun res!952738 () Bool)

(assert (=> b!1417376 (=> res!952738 e!802293)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96812 (_ BitVec 32)) SeekEntryResult!10949)

(assert (=> b!1417376 (= res!952738 (not (= lt!625188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!625185 lt!625186 lt!625183 mask!2840))))))

(declare-fun b!1417377 () Bool)

(assert (=> b!1417377 (= e!802293 true)))

(declare-fun lt!625189 () SeekEntryResult!10949)

(assert (=> b!1417377 (= lt!625189 lt!625187)))

(declare-fun lt!625190 () Unit!47899)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47899)

(assert (=> b!1417377 (= lt!625190 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!625185 (x!127943 lt!625181) (index!46190 lt!625181) (x!127943 lt!625188) (index!46190 lt!625188) mask!2840))))

(declare-fun b!1417378 () Bool)

(declare-fun res!952731 () Bool)

(assert (=> b!1417378 (=> (not res!952731) (not e!802295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96812 (_ BitVec 32)) Bool)

(assert (=> b!1417378 (= res!952731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!952737 () Bool)

(assert (=> start!122204 (=> (not res!952737) (not e!802295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122204 (= res!952737 (validMask!0 mask!2840))))

(assert (=> start!122204 e!802295))

(assert (=> start!122204 true))

(declare-fun array_inv!36016 (array!96812) Bool)

(assert (=> start!122204 (array_inv!36016 a!2901)))

(declare-fun b!1417379 () Bool)

(declare-fun e!802294 () Bool)

(assert (=> b!1417379 (= e!802294 e!802291)))

(declare-fun res!952735 () Bool)

(assert (=> b!1417379 (=> res!952735 e!802291)))

(get-info :version)

(assert (=> b!1417379 (= res!952735 (or (= lt!625181 lt!625188) (not ((_ is Intermediate!10949) lt!625188))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417379 (= lt!625188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625186 mask!2840) lt!625186 lt!625183 mask!2840))))

(assert (=> b!1417379 (= lt!625186 (select (store (arr!46735 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1417379 (= lt!625183 (array!96813 (store (arr!46735 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47286 a!2901)))))

(declare-fun b!1417380 () Bool)

(assert (=> b!1417380 (= e!802295 (not e!802294))))

(declare-fun res!952734 () Bool)

(assert (=> b!1417380 (=> res!952734 e!802294)))

(assert (=> b!1417380 (= res!952734 (or (not ((_ is Intermediate!10949) lt!625181)) (undefined!11761 lt!625181)))))

(assert (=> b!1417380 (= lt!625189 (Found!10949 j!112))))

(assert (=> b!1417380 (= lt!625189 (seekEntryOrOpen!0 (select (arr!46735 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1417380 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625184 () Unit!47899)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47899)

(assert (=> b!1417380 (= lt!625184 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1417380 (= lt!625181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!625185 (select (arr!46735 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1417380 (= lt!625185 (toIndex!0 (select (arr!46735 a!2901) j!112) mask!2840))))

(assert (= (and start!122204 res!952737) b!1417371))

(assert (= (and b!1417371 res!952736) b!1417373))

(assert (= (and b!1417373 res!952730) b!1417374))

(assert (= (and b!1417374 res!952729) b!1417378))

(assert (= (and b!1417378 res!952731) b!1417375))

(assert (= (and b!1417375 res!952732) b!1417380))

(assert (= (and b!1417380 (not res!952734)) b!1417379))

(assert (= (and b!1417379 (not res!952735)) b!1417372))

(assert (= (and b!1417372 (not res!952733)) b!1417376))

(assert (= (and b!1417376 (not res!952738)) b!1417377))

(declare-fun m!1308217 () Bool)

(assert (=> b!1417376 m!1308217))

(declare-fun m!1308219 () Bool)

(assert (=> start!122204 m!1308219))

(declare-fun m!1308221 () Bool)

(assert (=> start!122204 m!1308221))

(declare-fun m!1308223 () Bool)

(assert (=> b!1417375 m!1308223))

(declare-fun m!1308225 () Bool)

(assert (=> b!1417378 m!1308225))

(declare-fun m!1308227 () Bool)

(assert (=> b!1417380 m!1308227))

(declare-fun m!1308229 () Bool)

(assert (=> b!1417380 m!1308229))

(assert (=> b!1417380 m!1308227))

(declare-fun m!1308231 () Bool)

(assert (=> b!1417380 m!1308231))

(assert (=> b!1417380 m!1308227))

(declare-fun m!1308233 () Bool)

(assert (=> b!1417380 m!1308233))

(declare-fun m!1308235 () Bool)

(assert (=> b!1417380 m!1308235))

(assert (=> b!1417380 m!1308227))

(declare-fun m!1308237 () Bool)

(assert (=> b!1417380 m!1308237))

(declare-fun m!1308239 () Bool)

(assert (=> b!1417373 m!1308239))

(assert (=> b!1417373 m!1308239))

(declare-fun m!1308241 () Bool)

(assert (=> b!1417373 m!1308241))

(declare-fun m!1308243 () Bool)

(assert (=> b!1417372 m!1308243))

(declare-fun m!1308245 () Bool)

(assert (=> b!1417372 m!1308245))

(declare-fun m!1308247 () Bool)

(assert (=> b!1417372 m!1308247))

(assert (=> b!1417372 m!1308227))

(assert (=> b!1417372 m!1308227))

(declare-fun m!1308249 () Bool)

(assert (=> b!1417372 m!1308249))

(declare-fun m!1308251 () Bool)

(assert (=> b!1417372 m!1308251))

(declare-fun m!1308253 () Bool)

(assert (=> b!1417379 m!1308253))

(assert (=> b!1417379 m!1308253))

(declare-fun m!1308255 () Bool)

(assert (=> b!1417379 m!1308255))

(assert (=> b!1417379 m!1308251))

(declare-fun m!1308257 () Bool)

(assert (=> b!1417379 m!1308257))

(declare-fun m!1308259 () Bool)

(assert (=> b!1417377 m!1308259))

(assert (=> b!1417374 m!1308227))

(assert (=> b!1417374 m!1308227))

(declare-fun m!1308261 () Bool)

(assert (=> b!1417374 m!1308261))

(check-sat (not b!1417380) (not b!1417379) (not b!1417374) (not b!1417377) (not start!122204) (not b!1417373) (not b!1417375) (not b!1417378) (not b!1417376) (not b!1417372))
(check-sat)
