; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119504 () Bool)

(assert start!119504)

(declare-fun b!1392322 () Bool)

(declare-fun e!788434 () Bool)

(declare-fun e!788435 () Bool)

(assert (=> b!1392322 (= e!788434 e!788435)))

(declare-fun res!931947 () Bool)

(assert (=> b!1392322 (=> res!931947 e!788435)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!611416 () (_ BitVec 32))

(assert (=> b!1392322 (= res!931947 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!611416 #b00000000000000000000000000000000) (bvsge lt!611416 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(declare-datatypes ((array!95190 0))(
  ( (array!95191 (arr!45955 (Array (_ BitVec 32) (_ BitVec 64))) (size!46507 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95190)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392322 (= lt!611416 (toIndex!0 (select (store (arr!45955 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392323 () Bool)

(declare-fun res!931946 () Bool)

(declare-fun e!788437 () Bool)

(assert (=> b!1392323 (=> (not res!931946) (not e!788437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392323 (= res!931946 (validKeyInArray!0 (select (arr!45955 a!2901) j!112)))))

(declare-fun b!1392325 () Bool)

(declare-fun res!931954 () Bool)

(assert (=> b!1392325 (=> (not res!931954) (not e!788437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95190 (_ BitVec 32)) Bool)

(assert (=> b!1392325 (= res!931954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392326 () Bool)

(declare-fun res!931948 () Bool)

(assert (=> b!1392326 (=> (not res!931948) (not e!788437))))

(assert (=> b!1392326 (= res!931948 (validKeyInArray!0 (select (arr!45955 a!2901) i!1037)))))

(declare-fun e!788436 () Bool)

(declare-fun b!1392327 () Bool)

(declare-datatypes ((SeekEntryResult!10298 0))(
  ( (MissingZero!10298 (index!43563 (_ BitVec 32))) (Found!10298 (index!43564 (_ BitVec 32))) (Intermediate!10298 (undefined!11110 Bool) (index!43565 (_ BitVec 32)) (x!125245 (_ BitVec 32))) (Undefined!10298) (MissingVacant!10298 (index!43566 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95190 (_ BitVec 32)) SeekEntryResult!10298)

(assert (=> b!1392327 (= e!788436 (= (seekEntryOrOpen!0 (select (arr!45955 a!2901) j!112) a!2901 mask!2840) (Found!10298 j!112)))))

(declare-fun b!1392328 () Bool)

(declare-fun res!931952 () Bool)

(assert (=> b!1392328 (=> (not res!931952) (not e!788437))))

(declare-datatypes ((List!32552 0))(
  ( (Nil!32549) (Cons!32548 (h!33778 (_ BitVec 64)) (t!47238 List!32552)) )
))
(declare-fun arrayNoDuplicates!0 (array!95190 (_ BitVec 32) List!32552) Bool)

(assert (=> b!1392328 (= res!931952 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32549))))

(declare-fun b!1392329 () Bool)

(declare-fun res!931949 () Bool)

(assert (=> b!1392329 (=> (not res!931949) (not e!788437))))

(assert (=> b!1392329 (= res!931949 (and (= (size!46507 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46507 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46507 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392330 () Bool)

(assert (=> b!1392330 (= e!788437 (not e!788434))))

(declare-fun res!931951 () Bool)

(assert (=> b!1392330 (=> res!931951 e!788434)))

(declare-fun lt!611417 () SeekEntryResult!10298)

(get-info :version)

(assert (=> b!1392330 (= res!931951 (or (not ((_ is Intermediate!10298) lt!611417)) (undefined!11110 lt!611417)))))

(assert (=> b!1392330 e!788436))

(declare-fun res!931953 () Bool)

(assert (=> b!1392330 (=> (not res!931953) (not e!788436))))

(assert (=> b!1392330 (= res!931953 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46443 0))(
  ( (Unit!46444) )
))
(declare-fun lt!611415 () Unit!46443)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46443)

(assert (=> b!1392330 (= lt!611415 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95190 (_ BitVec 32)) SeekEntryResult!10298)

(assert (=> b!1392330 (= lt!611417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45955 a!2901) j!112) mask!2840) (select (arr!45955 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392324 () Bool)

(assert (=> b!1392324 (= e!788435 (validKeyInArray!0 (select (store (arr!45955 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun res!931950 () Bool)

(assert (=> start!119504 (=> (not res!931950) (not e!788437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119504 (= res!931950 (validMask!0 mask!2840))))

(assert (=> start!119504 e!788437))

(assert (=> start!119504 true))

(declare-fun array_inv!35188 (array!95190) Bool)

(assert (=> start!119504 (array_inv!35188 a!2901)))

(assert (= (and start!119504 res!931950) b!1392329))

(assert (= (and b!1392329 res!931949) b!1392326))

(assert (= (and b!1392326 res!931948) b!1392323))

(assert (= (and b!1392323 res!931946) b!1392325))

(assert (= (and b!1392325 res!931954) b!1392328))

(assert (= (and b!1392328 res!931952) b!1392330))

(assert (= (and b!1392330 res!931953) b!1392327))

(assert (= (and b!1392330 (not res!931951)) b!1392322))

(assert (= (and b!1392322 (not res!931947)) b!1392324))

(declare-fun m!1277593 () Bool)

(assert (=> b!1392324 m!1277593))

(declare-fun m!1277595 () Bool)

(assert (=> b!1392324 m!1277595))

(assert (=> b!1392324 m!1277595))

(declare-fun m!1277597 () Bool)

(assert (=> b!1392324 m!1277597))

(declare-fun m!1277599 () Bool)

(assert (=> b!1392327 m!1277599))

(assert (=> b!1392327 m!1277599))

(declare-fun m!1277601 () Bool)

(assert (=> b!1392327 m!1277601))

(declare-fun m!1277603 () Bool)

(assert (=> start!119504 m!1277603))

(declare-fun m!1277605 () Bool)

(assert (=> start!119504 m!1277605))

(assert (=> b!1392323 m!1277599))

(assert (=> b!1392323 m!1277599))

(declare-fun m!1277607 () Bool)

(assert (=> b!1392323 m!1277607))

(declare-fun m!1277609 () Bool)

(assert (=> b!1392326 m!1277609))

(assert (=> b!1392326 m!1277609))

(declare-fun m!1277611 () Bool)

(assert (=> b!1392326 m!1277611))

(declare-fun m!1277613 () Bool)

(assert (=> b!1392328 m!1277613))

(assert (=> b!1392322 m!1277593))

(assert (=> b!1392322 m!1277595))

(assert (=> b!1392322 m!1277595))

(declare-fun m!1277615 () Bool)

(assert (=> b!1392322 m!1277615))

(assert (=> b!1392330 m!1277599))

(declare-fun m!1277617 () Bool)

(assert (=> b!1392330 m!1277617))

(assert (=> b!1392330 m!1277599))

(declare-fun m!1277619 () Bool)

(assert (=> b!1392330 m!1277619))

(assert (=> b!1392330 m!1277617))

(assert (=> b!1392330 m!1277599))

(declare-fun m!1277621 () Bool)

(assert (=> b!1392330 m!1277621))

(declare-fun m!1277623 () Bool)

(assert (=> b!1392330 m!1277623))

(declare-fun m!1277625 () Bool)

(assert (=> b!1392325 m!1277625))

(check-sat (not b!1392322) (not b!1392324) (not b!1392327) (not b!1392330) (not start!119504) (not b!1392328) (not b!1392323) (not b!1392325) (not b!1392326))
(check-sat)
