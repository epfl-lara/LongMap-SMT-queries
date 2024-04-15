; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121970 () Bool)

(assert start!121970)

(declare-datatypes ((array!96609 0))(
  ( (array!96610 (arr!46636 (Array (_ BitVec 32) (_ BitVec 64))) (size!47188 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96609)

(declare-datatypes ((SeekEntryResult!10973 0))(
  ( (MissingZero!10973 (index!46284 (_ BitVec 32))) (Found!10973 (index!46285 (_ BitVec 32))) (Intermediate!10973 (undefined!11785 Bool) (index!46286 (_ BitVec 32)) (x!127889 (_ BitVec 32))) (Undefined!10973) (MissingVacant!10973 (index!46287 (_ BitVec 32))) )
))
(declare-fun lt!624047 () SeekEntryResult!10973)

(declare-fun lt!624052 () (_ BitVec 64))

(declare-fun b!1415493 () Bool)

(declare-fun lt!624048 () array!96609)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!801142 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96609 (_ BitVec 32)) SeekEntryResult!10973)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96609 (_ BitVec 32)) SeekEntryResult!10973)

(assert (=> b!1415493 (= e!801142 (= (seekEntryOrOpen!0 lt!624052 lt!624048 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127889 lt!624047) (index!46286 lt!624047) (index!46286 lt!624047) (select (arr!46636 a!2901) j!112) lt!624048 mask!2840)))))

(declare-fun b!1415494 () Bool)

(declare-fun res!951586 () Bool)

(declare-fun e!801141 () Bool)

(assert (=> b!1415494 (=> (not res!951586) (not e!801141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96609 (_ BitVec 32)) Bool)

(assert (=> b!1415494 (= res!951586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun lt!624050 () (_ BitVec 32))

(declare-fun lt!624051 () SeekEntryResult!10973)

(declare-fun e!801140 () Bool)

(declare-fun b!1415495 () Bool)

(assert (=> b!1415495 (= e!801140 (or (bvslt (x!127889 lt!624051) #b00000000000000000000000000000000) (bvsgt (x!127889 lt!624051) #b01111111111111111111111111111110) (bvslt (x!127889 lt!624047) #b00000000000000000000000000000000) (bvsgt (x!127889 lt!624047) #b01111111111111111111111111111110) (bvslt lt!624050 #b00000000000000000000000000000000) (bvsge lt!624050 (size!47188 a!2901)) (bvslt (index!46286 lt!624051) #b00000000000000000000000000000000) (bvsge (index!46286 lt!624051) (size!47188 a!2901)) (bvslt (index!46286 lt!624047) #b00000000000000000000000000000000) (bvsge (index!46286 lt!624047) (size!47188 a!2901)) (not (= lt!624051 (Intermediate!10973 false (index!46286 lt!624051) (x!127889 lt!624051)))) (= lt!624047 (Intermediate!10973 false (index!46286 lt!624047) (x!127889 lt!624047)))))))

(assert (=> b!1415495 e!801142))

(declare-fun res!951589 () Bool)

(assert (=> b!1415495 (=> (not res!951589) (not e!801142))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415495 (= res!951589 (and (not (undefined!11785 lt!624047)) (= (index!46286 lt!624047) i!1037) (bvslt (x!127889 lt!624047) (x!127889 lt!624051)) (= (select (store (arr!46636 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46286 lt!624047)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47763 0))(
  ( (Unit!47764) )
))
(declare-fun lt!624049 () Unit!47763)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47763)

(assert (=> b!1415495 (= lt!624049 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624050 (x!127889 lt!624051) (index!46286 lt!624051) (x!127889 lt!624047) (index!46286 lt!624047) (undefined!11785 lt!624047) mask!2840))))

(declare-fun b!1415496 () Bool)

(declare-fun res!951587 () Bool)

(assert (=> b!1415496 (=> (not res!951587) (not e!801141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415496 (= res!951587 (validKeyInArray!0 (select (arr!46636 a!2901) i!1037)))))

(declare-fun b!1415497 () Bool)

(declare-fun e!801138 () Bool)

(assert (=> b!1415497 (= e!801138 (= (seekEntryOrOpen!0 (select (arr!46636 a!2901) j!112) a!2901 mask!2840) (Found!10973 j!112)))))

(declare-fun b!1415498 () Bool)

(declare-fun res!951588 () Bool)

(assert (=> b!1415498 (=> (not res!951588) (not e!801141))))

(assert (=> b!1415498 (= res!951588 (validKeyInArray!0 (select (arr!46636 a!2901) j!112)))))

(declare-fun res!951593 () Bool)

(assert (=> start!121970 (=> (not res!951593) (not e!801141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121970 (= res!951593 (validMask!0 mask!2840))))

(assert (=> start!121970 e!801141))

(assert (=> start!121970 true))

(declare-fun array_inv!35869 (array!96609) Bool)

(assert (=> start!121970 (array_inv!35869 a!2901)))

(declare-fun b!1415499 () Bool)

(declare-fun res!951590 () Bool)

(assert (=> b!1415499 (=> (not res!951590) (not e!801141))))

(declare-datatypes ((List!33233 0))(
  ( (Nil!33230) (Cons!33229 (h!34516 (_ BitVec 64)) (t!47919 List!33233)) )
))
(declare-fun arrayNoDuplicates!0 (array!96609 (_ BitVec 32) List!33233) Bool)

(assert (=> b!1415499 (= res!951590 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33230))))

(declare-fun b!1415500 () Bool)

(declare-fun e!801139 () Bool)

(assert (=> b!1415500 (= e!801141 (not e!801139))))

(declare-fun res!951592 () Bool)

(assert (=> b!1415500 (=> res!951592 e!801139)))

(get-info :version)

(assert (=> b!1415500 (= res!951592 (or (not ((_ is Intermediate!10973) lt!624051)) (undefined!11785 lt!624051)))))

(assert (=> b!1415500 e!801138))

(declare-fun res!951591 () Bool)

(assert (=> b!1415500 (=> (not res!951591) (not e!801138))))

(assert (=> b!1415500 (= res!951591 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624053 () Unit!47763)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47763)

(assert (=> b!1415500 (= lt!624053 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96609 (_ BitVec 32)) SeekEntryResult!10973)

(assert (=> b!1415500 (= lt!624051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624050 (select (arr!46636 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415500 (= lt!624050 (toIndex!0 (select (arr!46636 a!2901) j!112) mask!2840))))

(declare-fun b!1415501 () Bool)

(declare-fun res!951595 () Bool)

(assert (=> b!1415501 (=> (not res!951595) (not e!801141))))

(assert (=> b!1415501 (= res!951595 (and (= (size!47188 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47188 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47188 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415502 () Bool)

(assert (=> b!1415502 (= e!801139 e!801140)))

(declare-fun res!951594 () Bool)

(assert (=> b!1415502 (=> res!951594 e!801140)))

(assert (=> b!1415502 (= res!951594 (or (= lt!624051 lt!624047) (not ((_ is Intermediate!10973) lt!624047))))))

(assert (=> b!1415502 (= lt!624047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624052 mask!2840) lt!624052 lt!624048 mask!2840))))

(assert (=> b!1415502 (= lt!624052 (select (store (arr!46636 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415502 (= lt!624048 (array!96610 (store (arr!46636 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47188 a!2901)))))

(assert (= (and start!121970 res!951593) b!1415501))

(assert (= (and b!1415501 res!951595) b!1415496))

(assert (= (and b!1415496 res!951587) b!1415498))

(assert (= (and b!1415498 res!951588) b!1415494))

(assert (= (and b!1415494 res!951586) b!1415499))

(assert (= (and b!1415499 res!951590) b!1415500))

(assert (= (and b!1415500 res!951591) b!1415497))

(assert (= (and b!1415500 (not res!951592)) b!1415502))

(assert (= (and b!1415502 (not res!951594)) b!1415495))

(assert (= (and b!1415495 res!951589) b!1415493))

(declare-fun m!1305373 () Bool)

(assert (=> b!1415502 m!1305373))

(assert (=> b!1415502 m!1305373))

(declare-fun m!1305375 () Bool)

(assert (=> b!1415502 m!1305375))

(declare-fun m!1305377 () Bool)

(assert (=> b!1415502 m!1305377))

(declare-fun m!1305379 () Bool)

(assert (=> b!1415502 m!1305379))

(declare-fun m!1305381 () Bool)

(assert (=> b!1415493 m!1305381))

(declare-fun m!1305383 () Bool)

(assert (=> b!1415493 m!1305383))

(assert (=> b!1415493 m!1305383))

(declare-fun m!1305385 () Bool)

(assert (=> b!1415493 m!1305385))

(declare-fun m!1305387 () Bool)

(assert (=> start!121970 m!1305387))

(declare-fun m!1305389 () Bool)

(assert (=> start!121970 m!1305389))

(declare-fun m!1305391 () Bool)

(assert (=> b!1415499 m!1305391))

(assert (=> b!1415498 m!1305383))

(assert (=> b!1415498 m!1305383))

(declare-fun m!1305393 () Bool)

(assert (=> b!1415498 m!1305393))

(assert (=> b!1415495 m!1305377))

(declare-fun m!1305395 () Bool)

(assert (=> b!1415495 m!1305395))

(declare-fun m!1305397 () Bool)

(assert (=> b!1415495 m!1305397))

(assert (=> b!1415500 m!1305383))

(declare-fun m!1305399 () Bool)

(assert (=> b!1415500 m!1305399))

(assert (=> b!1415500 m!1305383))

(declare-fun m!1305401 () Bool)

(assert (=> b!1415500 m!1305401))

(declare-fun m!1305403 () Bool)

(assert (=> b!1415500 m!1305403))

(assert (=> b!1415500 m!1305383))

(declare-fun m!1305405 () Bool)

(assert (=> b!1415500 m!1305405))

(declare-fun m!1305407 () Bool)

(assert (=> b!1415494 m!1305407))

(assert (=> b!1415497 m!1305383))

(assert (=> b!1415497 m!1305383))

(declare-fun m!1305409 () Bool)

(assert (=> b!1415497 m!1305409))

(declare-fun m!1305411 () Bool)

(assert (=> b!1415496 m!1305411))

(assert (=> b!1415496 m!1305411))

(declare-fun m!1305413 () Bool)

(assert (=> b!1415496 m!1305413))

(check-sat (not b!1415499) (not b!1415502) (not b!1415496) (not b!1415495) (not b!1415500) (not start!121970) (not b!1415498) (not b!1415493) (not b!1415494) (not b!1415497))
(check-sat)
