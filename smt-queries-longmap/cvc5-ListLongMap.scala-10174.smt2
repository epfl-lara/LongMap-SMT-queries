; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119970 () Bool)

(assert start!119970)

(declare-fun res!935468 () Bool)

(declare-fun e!790643 () Bool)

(assert (=> start!119970 (=> (not res!935468) (not e!790643))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119970 (= res!935468 (validMask!0 mask!2840))))

(assert (=> start!119970 e!790643))

(assert (=> start!119970 true))

(declare-datatypes ((array!95499 0))(
  ( (array!95500 (arr!46103 (Array (_ BitVec 32) (_ BitVec 64))) (size!46653 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95499)

(declare-fun array_inv!35131 (array!95499) Bool)

(assert (=> start!119970 (array_inv!35131 a!2901)))

(declare-fun b!1396555 () Bool)

(declare-fun e!790642 () Bool)

(assert (=> b!1396555 (= e!790643 (not e!790642))))

(declare-fun res!935476 () Bool)

(assert (=> b!1396555 (=> res!935476 e!790642)))

(declare-datatypes ((SeekEntryResult!10420 0))(
  ( (MissingZero!10420 (index!44051 (_ BitVec 32))) (Found!10420 (index!44052 (_ BitVec 32))) (Intermediate!10420 (undefined!11232 Bool) (index!44053 (_ BitVec 32)) (x!125722 (_ BitVec 32))) (Undefined!10420) (MissingVacant!10420 (index!44054 (_ BitVec 32))) )
))
(declare-fun lt!613520 () SeekEntryResult!10420)

(assert (=> b!1396555 (= res!935476 (or (not (is-Intermediate!10420 lt!613520)) (undefined!11232 lt!613520)))))

(declare-fun e!790641 () Bool)

(assert (=> b!1396555 e!790641))

(declare-fun res!935472 () Bool)

(assert (=> b!1396555 (=> (not res!935472) (not e!790641))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95499 (_ BitVec 32)) Bool)

(assert (=> b!1396555 (= res!935472 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46844 0))(
  ( (Unit!46845) )
))
(declare-fun lt!613517 () Unit!46844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46844)

(assert (=> b!1396555 (= lt!613517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!613518 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95499 (_ BitVec 32)) SeekEntryResult!10420)

(assert (=> b!1396555 (= lt!613520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613518 (select (arr!46103 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396555 (= lt!613518 (toIndex!0 (select (arr!46103 a!2901) j!112) mask!2840))))

(declare-fun b!1396556 () Bool)

(declare-fun res!935470 () Bool)

(assert (=> b!1396556 (=> (not res!935470) (not e!790643))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396556 (= res!935470 (and (= (size!46653 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46653 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46653 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396557 () Bool)

(declare-fun e!790640 () Bool)

(assert (=> b!1396557 (= e!790642 e!790640)))

(declare-fun res!935474 () Bool)

(assert (=> b!1396557 (=> res!935474 e!790640)))

(declare-fun lt!613519 () SeekEntryResult!10420)

(assert (=> b!1396557 (= res!935474 (or (= lt!613520 lt!613519) (not (is-Intermediate!10420 lt!613519)) (bvslt (x!125722 lt!613520) #b00000000000000000000000000000000) (bvsgt (x!125722 lt!613520) #b01111111111111111111111111111110) (bvslt lt!613518 #b00000000000000000000000000000000) (bvsge lt!613518 (size!46653 a!2901)) (bvslt (index!44053 lt!613520) #b00000000000000000000000000000000) (bvsge (index!44053 lt!613520) (size!46653 a!2901)) (not (= lt!613520 (Intermediate!10420 false (index!44053 lt!613520) (x!125722 lt!613520)))) (not (= lt!613519 (Intermediate!10420 (undefined!11232 lt!613519) (index!44053 lt!613519) (x!125722 lt!613519))))))))

(declare-fun lt!613516 () array!95499)

(declare-fun lt!613521 () (_ BitVec 64))

(assert (=> b!1396557 (= lt!613519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613521 mask!2840) lt!613521 lt!613516 mask!2840))))

(assert (=> b!1396557 (= lt!613521 (select (store (arr!46103 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396557 (= lt!613516 (array!95500 (store (arr!46103 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46653 a!2901)))))

(declare-fun b!1396558 () Bool)

(declare-fun res!935471 () Bool)

(assert (=> b!1396558 (=> (not res!935471) (not e!790643))))

(assert (=> b!1396558 (= res!935471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396559 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95499 (_ BitVec 32)) SeekEntryResult!10420)

(assert (=> b!1396559 (= e!790641 (= (seekEntryOrOpen!0 (select (arr!46103 a!2901) j!112) a!2901 mask!2840) (Found!10420 j!112)))))

(declare-fun b!1396560 () Bool)

(declare-fun res!935469 () Bool)

(assert (=> b!1396560 (=> (not res!935469) (not e!790643))))

(declare-datatypes ((List!32622 0))(
  ( (Nil!32619) (Cons!32618 (h!33860 (_ BitVec 64)) (t!47316 List!32622)) )
))
(declare-fun arrayNoDuplicates!0 (array!95499 (_ BitVec 32) List!32622) Bool)

(assert (=> b!1396560 (= res!935469 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32619))))

(declare-fun b!1396561 () Bool)

(declare-fun res!935473 () Bool)

(assert (=> b!1396561 (=> (not res!935473) (not e!790643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396561 (= res!935473 (validKeyInArray!0 (select (arr!46103 a!2901) j!112)))))

(declare-fun b!1396562 () Bool)

(assert (=> b!1396562 (= e!790640 true)))

(declare-fun lt!613515 () SeekEntryResult!10420)

(assert (=> b!1396562 (= lt!613515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613518 lt!613521 lt!613516 mask!2840))))

(declare-fun b!1396563 () Bool)

(declare-fun res!935475 () Bool)

(assert (=> b!1396563 (=> (not res!935475) (not e!790643))))

(assert (=> b!1396563 (= res!935475 (validKeyInArray!0 (select (arr!46103 a!2901) i!1037)))))

(assert (= (and start!119970 res!935468) b!1396556))

(assert (= (and b!1396556 res!935470) b!1396563))

(assert (= (and b!1396563 res!935475) b!1396561))

(assert (= (and b!1396561 res!935473) b!1396558))

(assert (= (and b!1396558 res!935471) b!1396560))

(assert (= (and b!1396560 res!935469) b!1396555))

(assert (= (and b!1396555 res!935472) b!1396559))

(assert (= (and b!1396555 (not res!935476)) b!1396557))

(assert (= (and b!1396557 (not res!935474)) b!1396562))

(declare-fun m!1283031 () Bool)

(assert (=> start!119970 m!1283031))

(declare-fun m!1283033 () Bool)

(assert (=> start!119970 m!1283033))

(declare-fun m!1283035 () Bool)

(assert (=> b!1396561 m!1283035))

(assert (=> b!1396561 m!1283035))

(declare-fun m!1283037 () Bool)

(assert (=> b!1396561 m!1283037))

(declare-fun m!1283039 () Bool)

(assert (=> b!1396557 m!1283039))

(assert (=> b!1396557 m!1283039))

(declare-fun m!1283041 () Bool)

(assert (=> b!1396557 m!1283041))

(declare-fun m!1283043 () Bool)

(assert (=> b!1396557 m!1283043))

(declare-fun m!1283045 () Bool)

(assert (=> b!1396557 m!1283045))

(declare-fun m!1283047 () Bool)

(assert (=> b!1396558 m!1283047))

(declare-fun m!1283049 () Bool)

(assert (=> b!1396563 m!1283049))

(assert (=> b!1396563 m!1283049))

(declare-fun m!1283051 () Bool)

(assert (=> b!1396563 m!1283051))

(declare-fun m!1283053 () Bool)

(assert (=> b!1396562 m!1283053))

(assert (=> b!1396555 m!1283035))

(declare-fun m!1283055 () Bool)

(assert (=> b!1396555 m!1283055))

(declare-fun m!1283057 () Bool)

(assert (=> b!1396555 m!1283057))

(assert (=> b!1396555 m!1283035))

(declare-fun m!1283059 () Bool)

(assert (=> b!1396555 m!1283059))

(assert (=> b!1396555 m!1283035))

(declare-fun m!1283061 () Bool)

(assert (=> b!1396555 m!1283061))

(declare-fun m!1283063 () Bool)

(assert (=> b!1396560 m!1283063))

(assert (=> b!1396559 m!1283035))

(assert (=> b!1396559 m!1283035))

(declare-fun m!1283065 () Bool)

(assert (=> b!1396559 m!1283065))

(push 1)

