; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120488 () Bool)

(assert start!120488)

(declare-fun b!1402982 () Bool)

(declare-fun res!941497 () Bool)

(declare-fun e!794416 () Bool)

(assert (=> b!1402982 (=> (not res!941497) (not e!794416))))

(declare-datatypes ((array!95897 0))(
  ( (array!95898 (arr!46299 (Array (_ BitVec 32) (_ BitVec 64))) (size!46849 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95897)

(declare-datatypes ((List!32818 0))(
  ( (Nil!32815) (Cons!32814 (h!34062 (_ BitVec 64)) (t!47512 List!32818)) )
))
(declare-fun arrayNoDuplicates!0 (array!95897 (_ BitVec 32) List!32818) Bool)

(assert (=> b!1402982 (= res!941497 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32815))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!794417 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1402983 () Bool)

(declare-datatypes ((SeekEntryResult!10616 0))(
  ( (MissingZero!10616 (index!44841 (_ BitVec 32))) (Found!10616 (index!44842 (_ BitVec 32))) (Intermediate!10616 (undefined!11428 Bool) (index!44843 (_ BitVec 32)) (x!126459 (_ BitVec 32))) (Undefined!10616) (MissingVacant!10616 (index!44844 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95897 (_ BitVec 32)) SeekEntryResult!10616)

(assert (=> b!1402983 (= e!794417 (= (seekEntryOrOpen!0 (select (arr!46299 a!2901) j!112) a!2901 mask!2840) (Found!10616 j!112)))))

(declare-fun b!1402984 () Bool)

(declare-fun res!941500 () Bool)

(assert (=> b!1402984 (=> (not res!941500) (not e!794416))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402984 (= res!941500 (and (= (size!46849 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46849 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46849 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!941499 () Bool)

(assert (=> start!120488 (=> (not res!941499) (not e!794416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120488 (= res!941499 (validMask!0 mask!2840))))

(assert (=> start!120488 e!794416))

(assert (=> start!120488 true))

(declare-fun array_inv!35327 (array!95897) Bool)

(assert (=> start!120488 (array_inv!35327 a!2901)))

(declare-fun b!1402985 () Bool)

(declare-fun res!941498 () Bool)

(assert (=> b!1402985 (=> (not res!941498) (not e!794416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402985 (= res!941498 (validKeyInArray!0 (select (arr!46299 a!2901) j!112)))))

(declare-fun b!1402986 () Bool)

(declare-fun res!941496 () Bool)

(assert (=> b!1402986 (=> (not res!941496) (not e!794416))))

(assert (=> b!1402986 (= res!941496 (validKeyInArray!0 (select (arr!46299 a!2901) i!1037)))))

(declare-fun b!1402987 () Bool)

(declare-fun e!794415 () Bool)

(assert (=> b!1402987 (= e!794416 (not e!794415))))

(declare-fun res!941493 () Bool)

(assert (=> b!1402987 (=> res!941493 e!794415)))

(declare-fun lt!618229 () SeekEntryResult!10616)

(get-info :version)

(assert (=> b!1402987 (= res!941493 (or (not ((_ is Intermediate!10616) lt!618229)) (undefined!11428 lt!618229)))))

(assert (=> b!1402987 e!794417))

(declare-fun res!941495 () Bool)

(assert (=> b!1402987 (=> (not res!941495) (not e!794417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95897 (_ BitVec 32)) Bool)

(assert (=> b!1402987 (= res!941495 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47236 0))(
  ( (Unit!47237) )
))
(declare-fun lt!618230 () Unit!47236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95897 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47236)

(assert (=> b!1402987 (= lt!618230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95897 (_ BitVec 32)) SeekEntryResult!10616)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402987 (= lt!618229 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46299 a!2901) j!112) mask!2840) (select (arr!46299 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1402988 () Bool)

(declare-fun res!941494 () Bool)

(assert (=> b!1402988 (=> (not res!941494) (not e!794416))))

(assert (=> b!1402988 (= res!941494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402989 () Bool)

(assert (=> b!1402989 (= e!794415 true)))

(declare-fun lt!618231 () SeekEntryResult!10616)

(assert (=> b!1402989 (= lt!618231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46299 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46299 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95898 (store (arr!46299 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46849 a!2901)) mask!2840))))

(assert (= (and start!120488 res!941499) b!1402984))

(assert (= (and b!1402984 res!941500) b!1402986))

(assert (= (and b!1402986 res!941496) b!1402985))

(assert (= (and b!1402985 res!941498) b!1402988))

(assert (= (and b!1402988 res!941494) b!1402982))

(assert (= (and b!1402982 res!941497) b!1402987))

(assert (= (and b!1402987 res!941495) b!1402983))

(assert (= (and b!1402987 (not res!941493)) b!1402989))

(declare-fun m!1291429 () Bool)

(assert (=> b!1402982 m!1291429))

(declare-fun m!1291431 () Bool)

(assert (=> b!1402987 m!1291431))

(declare-fun m!1291433 () Bool)

(assert (=> b!1402987 m!1291433))

(assert (=> b!1402987 m!1291431))

(declare-fun m!1291435 () Bool)

(assert (=> b!1402987 m!1291435))

(assert (=> b!1402987 m!1291433))

(assert (=> b!1402987 m!1291431))

(declare-fun m!1291437 () Bool)

(assert (=> b!1402987 m!1291437))

(declare-fun m!1291439 () Bool)

(assert (=> b!1402987 m!1291439))

(declare-fun m!1291441 () Bool)

(assert (=> b!1402989 m!1291441))

(declare-fun m!1291443 () Bool)

(assert (=> b!1402989 m!1291443))

(assert (=> b!1402989 m!1291443))

(declare-fun m!1291445 () Bool)

(assert (=> b!1402989 m!1291445))

(assert (=> b!1402989 m!1291445))

(assert (=> b!1402989 m!1291443))

(declare-fun m!1291447 () Bool)

(assert (=> b!1402989 m!1291447))

(assert (=> b!1402983 m!1291431))

(assert (=> b!1402983 m!1291431))

(declare-fun m!1291449 () Bool)

(assert (=> b!1402983 m!1291449))

(declare-fun m!1291451 () Bool)

(assert (=> b!1402986 m!1291451))

(assert (=> b!1402986 m!1291451))

(declare-fun m!1291453 () Bool)

(assert (=> b!1402986 m!1291453))

(assert (=> b!1402985 m!1291431))

(assert (=> b!1402985 m!1291431))

(declare-fun m!1291455 () Bool)

(assert (=> b!1402985 m!1291455))

(declare-fun m!1291457 () Bool)

(assert (=> b!1402988 m!1291457))

(declare-fun m!1291459 () Bool)

(assert (=> start!120488 m!1291459))

(declare-fun m!1291461 () Bool)

(assert (=> start!120488 m!1291461))

(check-sat (not b!1402989) (not b!1402986) (not b!1402988) (not b!1402987) (not b!1402982) (not b!1402985) (not b!1402983) (not start!120488))
