; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120038 () Bool)

(assert start!120038)

(declare-fun b!1397473 () Bool)

(declare-fun res!936386 () Bool)

(declare-fun e!791152 () Bool)

(assert (=> b!1397473 (=> (not res!936386) (not e!791152))))

(declare-datatypes ((array!95567 0))(
  ( (array!95568 (arr!46137 (Array (_ BitVec 32) (_ BitVec 64))) (size!46687 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95567)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397473 (= res!936386 (validKeyInArray!0 (select (arr!46137 a!2901) j!112)))))

(declare-fun b!1397474 () Bool)

(declare-fun res!936387 () Bool)

(assert (=> b!1397474 (=> (not res!936387) (not e!791152))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95567 (_ BitVec 32)) Bool)

(assert (=> b!1397474 (= res!936387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397475 () Bool)

(declare-fun e!791151 () Bool)

(assert (=> b!1397475 (= e!791152 (not e!791151))))

(declare-fun res!936388 () Bool)

(assert (=> b!1397475 (=> res!936388 e!791151)))

(declare-datatypes ((SeekEntryResult!10454 0))(
  ( (MissingZero!10454 (index!44187 (_ BitVec 32))) (Found!10454 (index!44188 (_ BitVec 32))) (Intermediate!10454 (undefined!11266 Bool) (index!44189 (_ BitVec 32)) (x!125844 (_ BitVec 32))) (Undefined!10454) (MissingVacant!10454 (index!44190 (_ BitVec 32))) )
))
(declare-fun lt!614233 () SeekEntryResult!10454)

(get-info :version)

(assert (=> b!1397475 (= res!936388 (or (not ((_ is Intermediate!10454) lt!614233)) (undefined!11266 lt!614233)))))

(declare-fun e!791153 () Bool)

(assert (=> b!1397475 e!791153))

(declare-fun res!936389 () Bool)

(assert (=> b!1397475 (=> (not res!936389) (not e!791153))))

(assert (=> b!1397475 (= res!936389 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46912 0))(
  ( (Unit!46913) )
))
(declare-fun lt!614232 () Unit!46912)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46912)

(assert (=> b!1397475 (= lt!614232 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614234 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95567 (_ BitVec 32)) SeekEntryResult!10454)

(assert (=> b!1397475 (= lt!614233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614234 (select (arr!46137 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397475 (= lt!614234 (toIndex!0 (select (arr!46137 a!2901) j!112) mask!2840))))

(declare-fun b!1397477 () Bool)

(declare-fun res!936392 () Bool)

(assert (=> b!1397477 (=> (not res!936392) (not e!791152))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397477 (= res!936392 (validKeyInArray!0 (select (arr!46137 a!2901) i!1037)))))

(declare-fun b!1397478 () Bool)

(declare-fun res!936390 () Bool)

(assert (=> b!1397478 (=> (not res!936390) (not e!791152))))

(assert (=> b!1397478 (= res!936390 (and (= (size!46687 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46687 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46687 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397479 () Bool)

(declare-fun e!791150 () Bool)

(assert (=> b!1397479 (= e!791150 true)))

(declare-fun lt!614229 () array!95567)

(declare-fun lt!614235 () SeekEntryResult!10454)

(declare-fun lt!614230 () (_ BitVec 64))

(assert (=> b!1397479 (= lt!614235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614234 lt!614230 lt!614229 mask!2840))))

(declare-fun b!1397480 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95567 (_ BitVec 32)) SeekEntryResult!10454)

(assert (=> b!1397480 (= e!791153 (= (seekEntryOrOpen!0 (select (arr!46137 a!2901) j!112) a!2901 mask!2840) (Found!10454 j!112)))))

(declare-fun b!1397481 () Bool)

(declare-fun res!936391 () Bool)

(assert (=> b!1397481 (=> (not res!936391) (not e!791152))))

(declare-datatypes ((List!32656 0))(
  ( (Nil!32653) (Cons!32652 (h!33894 (_ BitVec 64)) (t!47350 List!32656)) )
))
(declare-fun arrayNoDuplicates!0 (array!95567 (_ BitVec 32) List!32656) Bool)

(assert (=> b!1397481 (= res!936391 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32653))))

(declare-fun res!936393 () Bool)

(assert (=> start!120038 (=> (not res!936393) (not e!791152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120038 (= res!936393 (validMask!0 mask!2840))))

(assert (=> start!120038 e!791152))

(assert (=> start!120038 true))

(declare-fun array_inv!35165 (array!95567) Bool)

(assert (=> start!120038 (array_inv!35165 a!2901)))

(declare-fun b!1397476 () Bool)

(assert (=> b!1397476 (= e!791151 e!791150)))

(declare-fun res!936394 () Bool)

(assert (=> b!1397476 (=> res!936394 e!791150)))

(declare-fun lt!614231 () SeekEntryResult!10454)

(assert (=> b!1397476 (= res!936394 (or (= lt!614233 lt!614231) (not ((_ is Intermediate!10454) lt!614231)) (bvslt (x!125844 lt!614233) #b00000000000000000000000000000000) (bvsgt (x!125844 lt!614233) #b01111111111111111111111111111110) (bvslt lt!614234 #b00000000000000000000000000000000) (bvsge lt!614234 (size!46687 a!2901)) (bvslt (index!44189 lt!614233) #b00000000000000000000000000000000) (bvsge (index!44189 lt!614233) (size!46687 a!2901)) (not (= lt!614233 (Intermediate!10454 false (index!44189 lt!614233) (x!125844 lt!614233)))) (not (= lt!614231 (Intermediate!10454 (undefined!11266 lt!614231) (index!44189 lt!614231) (x!125844 lt!614231))))))))

(assert (=> b!1397476 (= lt!614231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614230 mask!2840) lt!614230 lt!614229 mask!2840))))

(assert (=> b!1397476 (= lt!614230 (select (store (arr!46137 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397476 (= lt!614229 (array!95568 (store (arr!46137 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46687 a!2901)))))

(assert (= (and start!120038 res!936393) b!1397478))

(assert (= (and b!1397478 res!936390) b!1397477))

(assert (= (and b!1397477 res!936392) b!1397473))

(assert (= (and b!1397473 res!936386) b!1397474))

(assert (= (and b!1397474 res!936387) b!1397481))

(assert (= (and b!1397481 res!936391) b!1397475))

(assert (= (and b!1397475 res!936389) b!1397480))

(assert (= (and b!1397475 (not res!936388)) b!1397476))

(assert (= (and b!1397476 (not res!936394)) b!1397479))

(declare-fun m!1284255 () Bool)

(assert (=> b!1397477 m!1284255))

(assert (=> b!1397477 m!1284255))

(declare-fun m!1284257 () Bool)

(assert (=> b!1397477 m!1284257))

(declare-fun m!1284259 () Bool)

(assert (=> b!1397474 m!1284259))

(declare-fun m!1284261 () Bool)

(assert (=> b!1397481 m!1284261))

(declare-fun m!1284263 () Bool)

(assert (=> b!1397475 m!1284263))

(declare-fun m!1284265 () Bool)

(assert (=> b!1397475 m!1284265))

(assert (=> b!1397475 m!1284263))

(declare-fun m!1284267 () Bool)

(assert (=> b!1397475 m!1284267))

(declare-fun m!1284269 () Bool)

(assert (=> b!1397475 m!1284269))

(assert (=> b!1397475 m!1284263))

(declare-fun m!1284271 () Bool)

(assert (=> b!1397475 m!1284271))

(assert (=> b!1397480 m!1284263))

(assert (=> b!1397480 m!1284263))

(declare-fun m!1284273 () Bool)

(assert (=> b!1397480 m!1284273))

(assert (=> b!1397473 m!1284263))

(assert (=> b!1397473 m!1284263))

(declare-fun m!1284275 () Bool)

(assert (=> b!1397473 m!1284275))

(declare-fun m!1284277 () Bool)

(assert (=> b!1397476 m!1284277))

(assert (=> b!1397476 m!1284277))

(declare-fun m!1284279 () Bool)

(assert (=> b!1397476 m!1284279))

(declare-fun m!1284281 () Bool)

(assert (=> b!1397476 m!1284281))

(declare-fun m!1284283 () Bool)

(assert (=> b!1397476 m!1284283))

(declare-fun m!1284285 () Bool)

(assert (=> start!120038 m!1284285))

(declare-fun m!1284287 () Bool)

(assert (=> start!120038 m!1284287))

(declare-fun m!1284289 () Bool)

(assert (=> b!1397479 m!1284289))

(check-sat (not b!1397473) (not b!1397474) (not b!1397479) (not b!1397477) (not start!120038) (not b!1397475) (not b!1397480) (not b!1397481) (not b!1397476))
(check-sat)
