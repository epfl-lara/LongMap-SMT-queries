; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120528 () Bool)

(assert start!120528)

(declare-fun b!1403429 () Bool)

(declare-fun res!941997 () Bool)

(declare-fun e!794639 () Bool)

(assert (=> b!1403429 (=> (not res!941997) (not e!794639))))

(declare-datatypes ((array!95890 0))(
  ( (array!95891 (arr!46296 (Array (_ BitVec 32) (_ BitVec 64))) (size!46848 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95890)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95890 (_ BitVec 32)) Bool)

(assert (=> b!1403429 (= res!941997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!941993 () Bool)

(assert (=> start!120528 (=> (not res!941993) (not e!794639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120528 (= res!941993 (validMask!0 mask!2840))))

(assert (=> start!120528 e!794639))

(assert (=> start!120528 true))

(declare-fun array_inv!35529 (array!95890) Bool)

(assert (=> start!120528 (array_inv!35529 a!2901)))

(declare-fun b!1403430 () Bool)

(declare-fun e!794641 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10639 0))(
  ( (MissingZero!10639 (index!44933 (_ BitVec 32))) (Found!10639 (index!44934 (_ BitVec 32))) (Intermediate!10639 (undefined!11451 Bool) (index!44935 (_ BitVec 32)) (x!126535 (_ BitVec 32))) (Undefined!10639) (MissingVacant!10639 (index!44936 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95890 (_ BitVec 32)) SeekEntryResult!10639)

(assert (=> b!1403430 (= e!794641 (= (seekEntryOrOpen!0 (select (arr!46296 a!2901) j!112) a!2901 mask!2840) (Found!10639 j!112)))))

(declare-fun b!1403431 () Bool)

(declare-fun e!794642 () Bool)

(assert (=> b!1403431 (= e!794642 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!618237 () SeekEntryResult!10639)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95890 (_ BitVec 32)) SeekEntryResult!10639)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403431 (= lt!618237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46296 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46296 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95891 (store (arr!46296 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46848 a!2901)) mask!2840))))

(declare-fun b!1403432 () Bool)

(declare-fun res!941995 () Bool)

(assert (=> b!1403432 (=> (not res!941995) (not e!794639))))

(assert (=> b!1403432 (= res!941995 (and (= (size!46848 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46848 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46848 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403433 () Bool)

(assert (=> b!1403433 (= e!794639 (not e!794642))))

(declare-fun res!941994 () Bool)

(assert (=> b!1403433 (=> res!941994 e!794642)))

(declare-fun lt!618238 () SeekEntryResult!10639)

(assert (=> b!1403433 (= res!941994 (or (not (is-Intermediate!10639 lt!618238)) (undefined!11451 lt!618238)))))

(assert (=> b!1403433 e!794641))

(declare-fun res!941991 () Bool)

(assert (=> b!1403433 (=> (not res!941991) (not e!794641))))

(assert (=> b!1403433 (= res!941991 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47125 0))(
  ( (Unit!47126) )
))
(declare-fun lt!618239 () Unit!47125)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47125)

(assert (=> b!1403433 (= lt!618239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403433 (= lt!618238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46296 a!2901) j!112) mask!2840) (select (arr!46296 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403434 () Bool)

(declare-fun res!941996 () Bool)

(assert (=> b!1403434 (=> (not res!941996) (not e!794639))))

(declare-datatypes ((List!32893 0))(
  ( (Nil!32890) (Cons!32889 (h!34137 (_ BitVec 64)) (t!47579 List!32893)) )
))
(declare-fun arrayNoDuplicates!0 (array!95890 (_ BitVec 32) List!32893) Bool)

(assert (=> b!1403434 (= res!941996 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32890))))

(declare-fun b!1403435 () Bool)

(declare-fun res!941998 () Bool)

(assert (=> b!1403435 (=> (not res!941998) (not e!794639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403435 (= res!941998 (validKeyInArray!0 (select (arr!46296 a!2901) j!112)))))

(declare-fun b!1403436 () Bool)

(declare-fun res!941992 () Bool)

(assert (=> b!1403436 (=> (not res!941992) (not e!794639))))

(assert (=> b!1403436 (= res!941992 (validKeyInArray!0 (select (arr!46296 a!2901) i!1037)))))

(assert (= (and start!120528 res!941993) b!1403432))

(assert (= (and b!1403432 res!941995) b!1403436))

(assert (= (and b!1403436 res!941992) b!1403435))

(assert (= (and b!1403435 res!941998) b!1403429))

(assert (= (and b!1403429 res!941997) b!1403434))

(assert (= (and b!1403434 res!941996) b!1403433))

(assert (= (and b!1403433 res!941991) b!1403430))

(assert (= (and b!1403433 (not res!941994)) b!1403431))

(declare-fun m!1291641 () Bool)

(assert (=> b!1403429 m!1291641))

(declare-fun m!1291643 () Bool)

(assert (=> b!1403430 m!1291643))

(assert (=> b!1403430 m!1291643))

(declare-fun m!1291645 () Bool)

(assert (=> b!1403430 m!1291645))

(declare-fun m!1291647 () Bool)

(assert (=> b!1403434 m!1291647))

(declare-fun m!1291649 () Bool)

(assert (=> start!120528 m!1291649))

(declare-fun m!1291651 () Bool)

(assert (=> start!120528 m!1291651))

(declare-fun m!1291653 () Bool)

(assert (=> b!1403436 m!1291653))

(assert (=> b!1403436 m!1291653))

(declare-fun m!1291655 () Bool)

(assert (=> b!1403436 m!1291655))

(assert (=> b!1403435 m!1291643))

(assert (=> b!1403435 m!1291643))

(declare-fun m!1291657 () Bool)

(assert (=> b!1403435 m!1291657))

(declare-fun m!1291659 () Bool)

(assert (=> b!1403431 m!1291659))

(declare-fun m!1291661 () Bool)

(assert (=> b!1403431 m!1291661))

(assert (=> b!1403431 m!1291661))

(declare-fun m!1291663 () Bool)

(assert (=> b!1403431 m!1291663))

(assert (=> b!1403431 m!1291663))

(assert (=> b!1403431 m!1291661))

(declare-fun m!1291665 () Bool)

(assert (=> b!1403431 m!1291665))

(assert (=> b!1403433 m!1291643))

(declare-fun m!1291667 () Bool)

(assert (=> b!1403433 m!1291667))

(assert (=> b!1403433 m!1291643))

(declare-fun m!1291669 () Bool)

(assert (=> b!1403433 m!1291669))

(assert (=> b!1403433 m!1291667))

(assert (=> b!1403433 m!1291643))

(declare-fun m!1291671 () Bool)

(assert (=> b!1403433 m!1291671))

(declare-fun m!1291673 () Bool)

(assert (=> b!1403433 m!1291673))

(push 1)

(assert (not b!1403436))

(assert (not start!120528))

(assert (not b!1403433))

(assert (not b!1403431))

(assert (not b!1403435))

(assert (not b!1403434))

(assert (not b!1403429))

(assert (not b!1403430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

