; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120112 () Bool)

(assert start!120112)

(declare-fun b!1398481 () Bool)

(declare-fun e!791714 () Bool)

(declare-fun e!791713 () Bool)

(assert (=> b!1398481 (= e!791714 (not e!791713))))

(declare-fun res!937399 () Bool)

(assert (=> b!1398481 (=> res!937399 e!791713)))

(declare-datatypes ((SeekEntryResult!10491 0))(
  ( (MissingZero!10491 (index!44335 (_ BitVec 32))) (Found!10491 (index!44336 (_ BitVec 32))) (Intermediate!10491 (undefined!11303 Bool) (index!44337 (_ BitVec 32)) (x!125977 (_ BitVec 32))) (Undefined!10491) (MissingVacant!10491 (index!44338 (_ BitVec 32))) )
))
(declare-fun lt!614956 () SeekEntryResult!10491)

(assert (=> b!1398481 (= res!937399 (or (not (is-Intermediate!10491 lt!614956)) (undefined!11303 lt!614956)))))

(declare-fun e!791716 () Bool)

(assert (=> b!1398481 e!791716))

(declare-fun res!937400 () Bool)

(assert (=> b!1398481 (=> (not res!937400) (not e!791716))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!95641 0))(
  ( (array!95642 (arr!46174 (Array (_ BitVec 32) (_ BitVec 64))) (size!46724 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95641)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95641 (_ BitVec 32)) Bool)

(assert (=> b!1398481 (= res!937400 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46986 0))(
  ( (Unit!46987) )
))
(declare-fun lt!614958 () Unit!46986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46986)

(assert (=> b!1398481 (= lt!614958 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614954 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95641 (_ BitVec 32)) SeekEntryResult!10491)

(assert (=> b!1398481 (= lt!614956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614954 (select (arr!46174 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398481 (= lt!614954 (toIndex!0 (select (arr!46174 a!2901) j!112) mask!2840))))

(declare-fun b!1398482 () Bool)

(declare-fun res!937401 () Bool)

(assert (=> b!1398482 (=> (not res!937401) (not e!791714))))

(declare-datatypes ((List!32693 0))(
  ( (Nil!32690) (Cons!32689 (h!33931 (_ BitVec 64)) (t!47387 List!32693)) )
))
(declare-fun arrayNoDuplicates!0 (array!95641 (_ BitVec 32) List!32693) Bool)

(assert (=> b!1398482 (= res!937401 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32690))))

(declare-fun b!1398483 () Bool)

(declare-fun res!937394 () Bool)

(assert (=> b!1398483 (=> (not res!937394) (not e!791714))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398483 (= res!937394 (and (= (size!46724 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46724 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46724 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!937396 () Bool)

(assert (=> start!120112 (=> (not res!937396) (not e!791714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120112 (= res!937396 (validMask!0 mask!2840))))

(assert (=> start!120112 e!791714))

(assert (=> start!120112 true))

(declare-fun array_inv!35202 (array!95641) Bool)

(assert (=> start!120112 (array_inv!35202 a!2901)))

(declare-fun b!1398484 () Bool)

(declare-fun res!937398 () Bool)

(assert (=> b!1398484 (=> (not res!937398) (not e!791714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398484 (= res!937398 (validKeyInArray!0 (select (arr!46174 a!2901) j!112)))))

(declare-fun b!1398485 () Bool)

(declare-fun res!937402 () Bool)

(assert (=> b!1398485 (=> (not res!937402) (not e!791714))))

(assert (=> b!1398485 (= res!937402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398486 () Bool)

(declare-fun e!791717 () Bool)

(assert (=> b!1398486 (= e!791713 e!791717)))

(declare-fun res!937397 () Bool)

(assert (=> b!1398486 (=> res!937397 e!791717)))

(declare-fun lt!614953 () SeekEntryResult!10491)

(assert (=> b!1398486 (= res!937397 (or (= lt!614956 lt!614953) (not (is-Intermediate!10491 lt!614953))))))

(declare-fun lt!614957 () (_ BitVec 64))

(assert (=> b!1398486 (= lt!614953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614957 mask!2840) lt!614957 (array!95642 (store (arr!46174 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46724 a!2901)) mask!2840))))

(assert (=> b!1398486 (= lt!614957 (select (store (arr!46174 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398487 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95641 (_ BitVec 32)) SeekEntryResult!10491)

(assert (=> b!1398487 (= e!791716 (= (seekEntryOrOpen!0 (select (arr!46174 a!2901) j!112) a!2901 mask!2840) (Found!10491 j!112)))))

(declare-fun b!1398488 () Bool)

(declare-fun res!937395 () Bool)

(assert (=> b!1398488 (=> (not res!937395) (not e!791714))))

(assert (=> b!1398488 (= res!937395 (validKeyInArray!0 (select (arr!46174 a!2901) i!1037)))))

(declare-fun b!1398489 () Bool)

(assert (=> b!1398489 (= e!791717 (bvsge mask!2840 #b00000000000000000000000000000000))))

(assert (=> b!1398489 (and (not (undefined!11303 lt!614953)) (= (index!44337 lt!614953) i!1037) (bvslt (x!125977 lt!614953) (x!125977 lt!614956)) (= (select (store (arr!46174 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44337 lt!614953)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614955 () Unit!46986)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46986)

(assert (=> b!1398489 (= lt!614955 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614954 (x!125977 lt!614956) (index!44337 lt!614956) (x!125977 lt!614953) (index!44337 lt!614953) (undefined!11303 lt!614953) mask!2840))))

(assert (= (and start!120112 res!937396) b!1398483))

(assert (= (and b!1398483 res!937394) b!1398488))

(assert (= (and b!1398488 res!937395) b!1398484))

(assert (= (and b!1398484 res!937398) b!1398485))

(assert (= (and b!1398485 res!937402) b!1398482))

(assert (= (and b!1398482 res!937401) b!1398481))

(assert (= (and b!1398481 res!937400) b!1398487))

(assert (= (and b!1398481 (not res!937399)) b!1398486))

(assert (= (and b!1398486 (not res!937397)) b!1398489))

(declare-fun m!1285627 () Bool)

(assert (=> start!120112 m!1285627))

(declare-fun m!1285629 () Bool)

(assert (=> start!120112 m!1285629))

(declare-fun m!1285631 () Bool)

(assert (=> b!1398488 m!1285631))

(assert (=> b!1398488 m!1285631))

(declare-fun m!1285633 () Bool)

(assert (=> b!1398488 m!1285633))

(declare-fun m!1285635 () Bool)

(assert (=> b!1398484 m!1285635))

(assert (=> b!1398484 m!1285635))

(declare-fun m!1285637 () Bool)

(assert (=> b!1398484 m!1285637))

(declare-fun m!1285639 () Bool)

(assert (=> b!1398482 m!1285639))

(assert (=> b!1398481 m!1285635))

(declare-fun m!1285641 () Bool)

(assert (=> b!1398481 m!1285641))

(assert (=> b!1398481 m!1285635))

(declare-fun m!1285643 () Bool)

(assert (=> b!1398481 m!1285643))

(assert (=> b!1398481 m!1285635))

(declare-fun m!1285645 () Bool)

(assert (=> b!1398481 m!1285645))

(declare-fun m!1285647 () Bool)

(assert (=> b!1398481 m!1285647))

(declare-fun m!1285649 () Bool)

(assert (=> b!1398489 m!1285649))

(declare-fun m!1285651 () Bool)

(assert (=> b!1398489 m!1285651))

(declare-fun m!1285653 () Bool)

(assert (=> b!1398489 m!1285653))

(declare-fun m!1285655 () Bool)

(assert (=> b!1398485 m!1285655))

(assert (=> b!1398487 m!1285635))

(assert (=> b!1398487 m!1285635))

(declare-fun m!1285657 () Bool)

(assert (=> b!1398487 m!1285657))

(declare-fun m!1285659 () Bool)

(assert (=> b!1398486 m!1285659))

(assert (=> b!1398486 m!1285649))

(assert (=> b!1398486 m!1285659))

(declare-fun m!1285661 () Bool)

(assert (=> b!1398486 m!1285661))

(declare-fun m!1285663 () Bool)

(assert (=> b!1398486 m!1285663))

(push 1)

