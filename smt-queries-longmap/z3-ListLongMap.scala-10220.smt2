; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120560 () Bool)

(assert start!120560)

(declare-fun b!1402286 () Bool)

(declare-fun res!940113 () Bool)

(declare-fun e!794090 () Bool)

(assert (=> b!1402286 (=> (not res!940113) (not e!794090))))

(declare-datatypes ((array!95891 0))(
  ( (array!95892 (arr!46294 (Array (_ BitVec 32) (_ BitVec 64))) (size!46845 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95891)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402286 (= res!940113 (validKeyInArray!0 (select (arr!46294 a!2901) j!112)))))

(declare-fun b!1402287 () Bool)

(declare-fun res!940118 () Bool)

(assert (=> b!1402287 (=> (not res!940118) (not e!794090))))

(declare-datatypes ((List!32800 0))(
  ( (Nil!32797) (Cons!32796 (h!34052 (_ BitVec 64)) (t!47486 List!32800)) )
))
(declare-fun arrayNoDuplicates!0 (array!95891 (_ BitVec 32) List!32800) Bool)

(assert (=> b!1402287 (= res!940118 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32797))))

(declare-fun b!1402288 () Bool)

(declare-fun e!794088 () Bool)

(assert (=> b!1402288 (= e!794088 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10514 0))(
  ( (MissingZero!10514 (index!44433 (_ BitVec 32))) (Found!10514 (index!44434 (_ BitVec 32))) (Intermediate!10514 (undefined!11326 Bool) (index!44435 (_ BitVec 32)) (x!126224 (_ BitVec 32))) (Undefined!10514) (MissingVacant!10514 (index!44436 (_ BitVec 32))) )
))
(declare-fun lt!617122 () SeekEntryResult!10514)

(declare-fun lt!617123 () (_ BitVec 32))

(declare-fun lt!617120 () array!95891)

(declare-fun lt!617121 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95891 (_ BitVec 32)) SeekEntryResult!10514)

(assert (=> b!1402288 (= lt!617122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617123 lt!617121 lt!617120 mask!2840))))

(declare-fun e!794089 () Bool)

(declare-fun b!1402289 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95891 (_ BitVec 32)) SeekEntryResult!10514)

(assert (=> b!1402289 (= e!794089 (= (seekEntryOrOpen!0 (select (arr!46294 a!2901) j!112) a!2901 mask!2840) (Found!10514 j!112)))))

(declare-fun b!1402290 () Bool)

(declare-fun res!940119 () Bool)

(assert (=> b!1402290 (=> (not res!940119) (not e!794090))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402290 (= res!940119 (validKeyInArray!0 (select (arr!46294 a!2901) i!1037)))))

(declare-fun b!1402291 () Bool)

(declare-fun e!794087 () Bool)

(assert (=> b!1402291 (= e!794087 e!794088)))

(declare-fun res!940122 () Bool)

(assert (=> b!1402291 (=> res!940122 e!794088)))

(declare-fun lt!617117 () SeekEntryResult!10514)

(declare-fun lt!617119 () SeekEntryResult!10514)

(assert (=> b!1402291 (= res!940122 (or (bvslt (x!126224 lt!617119) #b00000000000000000000000000000000) (bvsgt (x!126224 lt!617119) #b01111111111111111111111111111110) (bvslt (x!126224 lt!617117) #b00000000000000000000000000000000) (bvsgt (x!126224 lt!617117) #b01111111111111111111111111111110) (bvslt lt!617123 #b00000000000000000000000000000000) (bvsge lt!617123 (size!46845 a!2901)) (bvslt (index!44435 lt!617119) #b00000000000000000000000000000000) (bvsge (index!44435 lt!617119) (size!46845 a!2901)) (bvslt (index!44435 lt!617117) #b00000000000000000000000000000000) (bvsge (index!44435 lt!617117) (size!46845 a!2901)) (not (= lt!617119 (Intermediate!10514 false (index!44435 lt!617119) (x!126224 lt!617119)))) (not (= lt!617117 (Intermediate!10514 false (index!44435 lt!617117) (x!126224 lt!617117))))))))

(declare-fun e!794084 () Bool)

(assert (=> b!1402291 e!794084))

(declare-fun res!940120 () Bool)

(assert (=> b!1402291 (=> (not res!940120) (not e!794084))))

(assert (=> b!1402291 (= res!940120 (and (not (undefined!11326 lt!617117)) (= (index!44435 lt!617117) i!1037) (bvslt (x!126224 lt!617117) (x!126224 lt!617119)) (= (select (store (arr!46294 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44435 lt!617117)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47059 0))(
  ( (Unit!47060) )
))
(declare-fun lt!617116 () Unit!47059)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47059)

(assert (=> b!1402291 (= lt!617116 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617123 (x!126224 lt!617119) (index!44435 lt!617119) (x!126224 lt!617117) (index!44435 lt!617117) (undefined!11326 lt!617117) mask!2840))))

(declare-fun res!940123 () Bool)

(assert (=> start!120560 (=> (not res!940123) (not e!794090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120560 (= res!940123 (validMask!0 mask!2840))))

(assert (=> start!120560 e!794090))

(assert (=> start!120560 true))

(declare-fun array_inv!35575 (array!95891) Bool)

(assert (=> start!120560 (array_inv!35575 a!2901)))

(declare-fun b!1402292 () Bool)

(declare-fun res!940117 () Bool)

(assert (=> b!1402292 (=> (not res!940117) (not e!794090))))

(assert (=> b!1402292 (= res!940117 (and (= (size!46845 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46845 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46845 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402293 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95891 (_ BitVec 32)) SeekEntryResult!10514)

(assert (=> b!1402293 (= e!794084 (= (seekEntryOrOpen!0 lt!617121 lt!617120 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126224 lt!617117) (index!44435 lt!617117) (index!44435 lt!617117) (select (arr!46294 a!2901) j!112) lt!617120 mask!2840)))))

(declare-fun b!1402294 () Bool)

(declare-fun e!794085 () Bool)

(assert (=> b!1402294 (= e!794085 e!794087)))

(declare-fun res!940116 () Bool)

(assert (=> b!1402294 (=> res!940116 e!794087)))

(get-info :version)

(assert (=> b!1402294 (= res!940116 (or (= lt!617119 lt!617117) (not ((_ is Intermediate!10514) lt!617117))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402294 (= lt!617117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617121 mask!2840) lt!617121 lt!617120 mask!2840))))

(assert (=> b!1402294 (= lt!617121 (select (store (arr!46294 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402294 (= lt!617120 (array!95892 (store (arr!46294 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46845 a!2901)))))

(declare-fun b!1402295 () Bool)

(declare-fun res!940114 () Bool)

(assert (=> b!1402295 (=> (not res!940114) (not e!794090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95891 (_ BitVec 32)) Bool)

(assert (=> b!1402295 (= res!940114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402296 () Bool)

(assert (=> b!1402296 (= e!794090 (not e!794085))))

(declare-fun res!940115 () Bool)

(assert (=> b!1402296 (=> res!940115 e!794085)))

(assert (=> b!1402296 (= res!940115 (or (not ((_ is Intermediate!10514) lt!617119)) (undefined!11326 lt!617119)))))

(assert (=> b!1402296 e!794089))

(declare-fun res!940121 () Bool)

(assert (=> b!1402296 (=> (not res!940121) (not e!794089))))

(assert (=> b!1402296 (= res!940121 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617118 () Unit!47059)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47059)

(assert (=> b!1402296 (= lt!617118 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402296 (= lt!617119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617123 (select (arr!46294 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402296 (= lt!617123 (toIndex!0 (select (arr!46294 a!2901) j!112) mask!2840))))

(assert (= (and start!120560 res!940123) b!1402292))

(assert (= (and b!1402292 res!940117) b!1402290))

(assert (= (and b!1402290 res!940119) b!1402286))

(assert (= (and b!1402286 res!940113) b!1402295))

(assert (= (and b!1402295 res!940114) b!1402287))

(assert (= (and b!1402287 res!940118) b!1402296))

(assert (= (and b!1402296 res!940121) b!1402289))

(assert (= (and b!1402296 (not res!940115)) b!1402294))

(assert (= (and b!1402294 (not res!940116)) b!1402291))

(assert (= (and b!1402291 res!940120) b!1402293))

(assert (= (and b!1402291 (not res!940122)) b!1402288))

(declare-fun m!1290205 () Bool)

(assert (=> b!1402290 m!1290205))

(assert (=> b!1402290 m!1290205))

(declare-fun m!1290207 () Bool)

(assert (=> b!1402290 m!1290207))

(declare-fun m!1290209 () Bool)

(assert (=> b!1402294 m!1290209))

(assert (=> b!1402294 m!1290209))

(declare-fun m!1290211 () Bool)

(assert (=> b!1402294 m!1290211))

(declare-fun m!1290213 () Bool)

(assert (=> b!1402294 m!1290213))

(declare-fun m!1290215 () Bool)

(assert (=> b!1402294 m!1290215))

(declare-fun m!1290217 () Bool)

(assert (=> b!1402296 m!1290217))

(declare-fun m!1290219 () Bool)

(assert (=> b!1402296 m!1290219))

(assert (=> b!1402296 m!1290217))

(assert (=> b!1402296 m!1290217))

(declare-fun m!1290221 () Bool)

(assert (=> b!1402296 m!1290221))

(declare-fun m!1290223 () Bool)

(assert (=> b!1402296 m!1290223))

(declare-fun m!1290225 () Bool)

(assert (=> b!1402296 m!1290225))

(declare-fun m!1290227 () Bool)

(assert (=> b!1402293 m!1290227))

(assert (=> b!1402293 m!1290217))

(assert (=> b!1402293 m!1290217))

(declare-fun m!1290229 () Bool)

(assert (=> b!1402293 m!1290229))

(assert (=> b!1402286 m!1290217))

(assert (=> b!1402286 m!1290217))

(declare-fun m!1290231 () Bool)

(assert (=> b!1402286 m!1290231))

(assert (=> b!1402289 m!1290217))

(assert (=> b!1402289 m!1290217))

(declare-fun m!1290233 () Bool)

(assert (=> b!1402289 m!1290233))

(declare-fun m!1290235 () Bool)

(assert (=> b!1402295 m!1290235))

(assert (=> b!1402291 m!1290213))

(declare-fun m!1290237 () Bool)

(assert (=> b!1402291 m!1290237))

(declare-fun m!1290239 () Bool)

(assert (=> b!1402291 m!1290239))

(declare-fun m!1290241 () Bool)

(assert (=> start!120560 m!1290241))

(declare-fun m!1290243 () Bool)

(assert (=> start!120560 m!1290243))

(declare-fun m!1290245 () Bool)

(assert (=> b!1402287 m!1290245))

(declare-fun m!1290247 () Bool)

(assert (=> b!1402288 m!1290247))

(check-sat (not b!1402289) (not b!1402296) (not b!1402291) (not b!1402294) (not b!1402290) (not b!1402295) (not start!120560) (not b!1402287) (not b!1402288) (not b!1402286) (not b!1402293))
(check-sat)
