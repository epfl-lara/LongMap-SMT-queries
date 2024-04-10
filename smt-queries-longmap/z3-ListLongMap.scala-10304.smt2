; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121148 () Bool)

(assert start!121148)

(declare-fun b!1408622 () Bool)

(declare-fun res!946344 () Bool)

(declare-fun e!797186 () Bool)

(assert (=> b!1408622 (=> (not res!946344) (not e!797186))))

(declare-datatypes ((array!96302 0))(
  ( (array!96303 (arr!46494 (Array (_ BitVec 32) (_ BitVec 64))) (size!47044 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96302)

(declare-datatypes ((List!33013 0))(
  ( (Nil!33010) (Cons!33009 (h!34272 (_ BitVec 64)) (t!47707 List!33013)) )
))
(declare-fun arrayNoDuplicates!0 (array!96302 (_ BitVec 32) List!33013) Bool)

(assert (=> b!1408622 (= res!946344 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33010))))

(declare-fun b!1408623 () Bool)

(declare-fun res!946347 () Bool)

(assert (=> b!1408623 (=> (not res!946347) (not e!797186))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96302 (_ BitVec 32)) Bool)

(assert (=> b!1408623 (= res!946347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408624 () Bool)

(declare-fun res!946346 () Bool)

(assert (=> b!1408624 (=> (not res!946346) (not e!797186))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408624 (= res!946346 (validKeyInArray!0 (select (arr!46494 a!2901) j!112)))))

(declare-fun b!1408625 () Bool)

(declare-fun res!946348 () Bool)

(assert (=> b!1408625 (=> (not res!946348) (not e!797186))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408625 (= res!946348 (validKeyInArray!0 (select (arr!46494 a!2901) i!1037)))))

(declare-fun b!1408626 () Bool)

(declare-fun e!797188 () Bool)

(assert (=> b!1408626 (= e!797188 true)))

(declare-datatypes ((SeekEntryResult!10805 0))(
  ( (MissingZero!10805 (index!45597 (_ BitVec 32))) (Found!10805 (index!45598 (_ BitVec 32))) (Intermediate!10805 (undefined!11617 Bool) (index!45599 (_ BitVec 32)) (x!127198 (_ BitVec 32))) (Undefined!10805) (MissingVacant!10805 (index!45600 (_ BitVec 32))) )
))
(declare-fun lt!620417 () SeekEntryResult!10805)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96302 (_ BitVec 32)) SeekEntryResult!10805)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408626 (= lt!620417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46494 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46494 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96303 (store (arr!46494 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47044 a!2901)) mask!2840))))

(declare-fun b!1408627 () Bool)

(assert (=> b!1408627 (= e!797186 (not e!797188))))

(declare-fun res!946349 () Bool)

(assert (=> b!1408627 (=> res!946349 e!797188)))

(declare-fun lt!620416 () SeekEntryResult!10805)

(get-info :version)

(assert (=> b!1408627 (= res!946349 (or (not ((_ is Intermediate!10805) lt!620416)) (undefined!11617 lt!620416)))))

(declare-fun e!797189 () Bool)

(assert (=> b!1408627 e!797189))

(declare-fun res!946351 () Bool)

(assert (=> b!1408627 (=> (not res!946351) (not e!797189))))

(assert (=> b!1408627 (= res!946351 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47584 0))(
  ( (Unit!47585) )
))
(declare-fun lt!620418 () Unit!47584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47584)

(assert (=> b!1408627 (= lt!620418 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408627 (= lt!620416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46494 a!2901) j!112) mask!2840) (select (arr!46494 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408628 () Bool)

(declare-fun res!946345 () Bool)

(assert (=> b!1408628 (=> (not res!946345) (not e!797186))))

(assert (=> b!1408628 (= res!946345 (and (= (size!47044 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47044 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47044 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!946350 () Bool)

(assert (=> start!121148 (=> (not res!946350) (not e!797186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121148 (= res!946350 (validMask!0 mask!2840))))

(assert (=> start!121148 e!797186))

(assert (=> start!121148 true))

(declare-fun array_inv!35522 (array!96302) Bool)

(assert (=> start!121148 (array_inv!35522 a!2901)))

(declare-fun b!1408629 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96302 (_ BitVec 32)) SeekEntryResult!10805)

(assert (=> b!1408629 (= e!797189 (= (seekEntryOrOpen!0 (select (arr!46494 a!2901) j!112) a!2901 mask!2840) (Found!10805 j!112)))))

(assert (= (and start!121148 res!946350) b!1408628))

(assert (= (and b!1408628 res!946345) b!1408625))

(assert (= (and b!1408625 res!946348) b!1408624))

(assert (= (and b!1408624 res!946346) b!1408623))

(assert (= (and b!1408623 res!946347) b!1408622))

(assert (= (and b!1408622 res!946344) b!1408627))

(assert (= (and b!1408627 res!946351) b!1408629))

(assert (= (and b!1408627 (not res!946349)) b!1408626))

(declare-fun m!1297999 () Bool)

(assert (=> b!1408622 m!1297999))

(declare-fun m!1298001 () Bool)

(assert (=> b!1408627 m!1298001))

(declare-fun m!1298003 () Bool)

(assert (=> b!1408627 m!1298003))

(assert (=> b!1408627 m!1298001))

(declare-fun m!1298005 () Bool)

(assert (=> b!1408627 m!1298005))

(assert (=> b!1408627 m!1298003))

(assert (=> b!1408627 m!1298001))

(declare-fun m!1298007 () Bool)

(assert (=> b!1408627 m!1298007))

(declare-fun m!1298009 () Bool)

(assert (=> b!1408627 m!1298009))

(declare-fun m!1298011 () Bool)

(assert (=> b!1408623 m!1298011))

(declare-fun m!1298013 () Bool)

(assert (=> start!121148 m!1298013))

(declare-fun m!1298015 () Bool)

(assert (=> start!121148 m!1298015))

(declare-fun m!1298017 () Bool)

(assert (=> b!1408626 m!1298017))

(declare-fun m!1298019 () Bool)

(assert (=> b!1408626 m!1298019))

(assert (=> b!1408626 m!1298019))

(declare-fun m!1298021 () Bool)

(assert (=> b!1408626 m!1298021))

(assert (=> b!1408626 m!1298021))

(assert (=> b!1408626 m!1298019))

(declare-fun m!1298023 () Bool)

(assert (=> b!1408626 m!1298023))

(assert (=> b!1408624 m!1298001))

(assert (=> b!1408624 m!1298001))

(declare-fun m!1298025 () Bool)

(assert (=> b!1408624 m!1298025))

(declare-fun m!1298027 () Bool)

(assert (=> b!1408625 m!1298027))

(assert (=> b!1408625 m!1298027))

(declare-fun m!1298029 () Bool)

(assert (=> b!1408625 m!1298029))

(assert (=> b!1408629 m!1298001))

(assert (=> b!1408629 m!1298001))

(declare-fun m!1298031 () Bool)

(assert (=> b!1408629 m!1298031))

(check-sat (not b!1408625) (not b!1408623) (not b!1408622) (not b!1408626) (not start!121148) (not b!1408627) (not b!1408629) (not b!1408624))
(check-sat)
