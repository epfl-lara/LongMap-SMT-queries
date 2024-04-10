; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121084 () Bool)

(assert start!121084)

(declare-fun b!1407808 () Bool)

(declare-fun res!945537 () Bool)

(declare-fun e!796803 () Bool)

(assert (=> b!1407808 (=> (not res!945537) (not e!796803))))

(declare-datatypes ((array!96238 0))(
  ( (array!96239 (arr!46462 (Array (_ BitVec 32) (_ BitVec 64))) (size!47012 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96238)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96238 (_ BitVec 32)) Bool)

(assert (=> b!1407808 (= res!945537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407809 () Bool)

(declare-fun e!796802 () Bool)

(assert (=> b!1407809 (= e!796803 (not e!796802))))

(declare-fun res!945538 () Bool)

(assert (=> b!1407809 (=> res!945538 e!796802)))

(declare-datatypes ((SeekEntryResult!10773 0))(
  ( (MissingZero!10773 (index!45469 (_ BitVec 32))) (Found!10773 (index!45470 (_ BitVec 32))) (Intermediate!10773 (undefined!11585 Bool) (index!45471 (_ BitVec 32)) (x!127078 (_ BitVec 32))) (Undefined!10773) (MissingVacant!10773 (index!45472 (_ BitVec 32))) )
))
(declare-fun lt!619950 () SeekEntryResult!10773)

(assert (=> b!1407809 (= res!945538 (or (not (is-Intermediate!10773 lt!619950)) (undefined!11585 lt!619950)))))

(declare-fun e!796805 () Bool)

(assert (=> b!1407809 e!796805))

(declare-fun res!945535 () Bool)

(assert (=> b!1407809 (=> (not res!945535) (not e!796805))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1407809 (= res!945535 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47520 0))(
  ( (Unit!47521) )
))
(declare-fun lt!619948 () Unit!47520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47520)

(assert (=> b!1407809 (= lt!619948 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619949 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96238 (_ BitVec 32)) SeekEntryResult!10773)

(assert (=> b!1407809 (= lt!619950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619949 (select (arr!46462 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407809 (= lt!619949 (toIndex!0 (select (arr!46462 a!2901) j!112) mask!2840))))

(declare-fun b!1407810 () Bool)

(declare-fun res!945531 () Bool)

(assert (=> b!1407810 (=> (not res!945531) (not e!796803))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407810 (= res!945531 (and (= (size!47012 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47012 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47012 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!945533 () Bool)

(assert (=> start!121084 (=> (not res!945533) (not e!796803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121084 (= res!945533 (validMask!0 mask!2840))))

(assert (=> start!121084 e!796803))

(assert (=> start!121084 true))

(declare-fun array_inv!35490 (array!96238) Bool)

(assert (=> start!121084 (array_inv!35490 a!2901)))

(declare-fun b!1407811 () Bool)

(declare-fun res!945532 () Bool)

(assert (=> b!1407811 (=> (not res!945532) (not e!796803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407811 (= res!945532 (validKeyInArray!0 (select (arr!46462 a!2901) i!1037)))))

(declare-fun b!1407812 () Bool)

(declare-fun res!945534 () Bool)

(assert (=> b!1407812 (=> (not res!945534) (not e!796803))))

(declare-datatypes ((List!32981 0))(
  ( (Nil!32978) (Cons!32977 (h!34240 (_ BitVec 64)) (t!47675 List!32981)) )
))
(declare-fun arrayNoDuplicates!0 (array!96238 (_ BitVec 32) List!32981) Bool)

(assert (=> b!1407812 (= res!945534 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32978))))

(declare-fun b!1407813 () Bool)

(assert (=> b!1407813 (= e!796802 (or (bvslt (x!127078 lt!619950) #b00000000000000000000000000000000) (bvsgt (x!127078 lt!619950) #b01111111111111111111111111111110) (bvslt lt!619949 #b00000000000000000000000000000000) (bvsge lt!619949 (size!47012 a!2901)) (bvslt (index!45471 lt!619950) #b00000000000000000000000000000000) (bvsge (index!45471 lt!619950) (size!47012 a!2901)) (= lt!619950 (Intermediate!10773 false (index!45471 lt!619950) (x!127078 lt!619950)))))))

(declare-fun b!1407814 () Bool)

(declare-fun res!945530 () Bool)

(assert (=> b!1407814 (=> (not res!945530) (not e!796803))))

(assert (=> b!1407814 (= res!945530 (validKeyInArray!0 (select (arr!46462 a!2901) j!112)))))

(declare-fun b!1407815 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96238 (_ BitVec 32)) SeekEntryResult!10773)

(assert (=> b!1407815 (= e!796805 (= (seekEntryOrOpen!0 (select (arr!46462 a!2901) j!112) a!2901 mask!2840) (Found!10773 j!112)))))

(declare-fun b!1407816 () Bool)

(declare-fun res!945536 () Bool)

(assert (=> b!1407816 (=> res!945536 e!796802)))

(assert (=> b!1407816 (= res!945536 (not (= lt!619950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46462 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46462 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96239 (store (arr!46462 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47012 a!2901)) mask!2840))))))

(assert (= (and start!121084 res!945533) b!1407810))

(assert (= (and b!1407810 res!945531) b!1407811))

(assert (= (and b!1407811 res!945532) b!1407814))

(assert (= (and b!1407814 res!945530) b!1407808))

(assert (= (and b!1407808 res!945537) b!1407812))

(assert (= (and b!1407812 res!945534) b!1407809))

(assert (= (and b!1407809 res!945535) b!1407815))

(assert (= (and b!1407809 (not res!945538)) b!1407816))

(assert (= (and b!1407816 (not res!945536)) b!1407813))

(declare-fun m!1296851 () Bool)

(assert (=> b!1407809 m!1296851))

(declare-fun m!1296853 () Bool)

(assert (=> b!1407809 m!1296853))

(assert (=> b!1407809 m!1296851))

(declare-fun m!1296855 () Bool)

(assert (=> b!1407809 m!1296855))

(assert (=> b!1407809 m!1296851))

(declare-fun m!1296857 () Bool)

(assert (=> b!1407809 m!1296857))

(declare-fun m!1296859 () Bool)

(assert (=> b!1407809 m!1296859))

(declare-fun m!1296861 () Bool)

(assert (=> b!1407808 m!1296861))

(declare-fun m!1296863 () Bool)

(assert (=> b!1407812 m!1296863))

(declare-fun m!1296865 () Bool)

(assert (=> b!1407811 m!1296865))

(assert (=> b!1407811 m!1296865))

(declare-fun m!1296867 () Bool)

(assert (=> b!1407811 m!1296867))

(assert (=> b!1407814 m!1296851))

(assert (=> b!1407814 m!1296851))

(declare-fun m!1296869 () Bool)

(assert (=> b!1407814 m!1296869))

(assert (=> b!1407815 m!1296851))

(assert (=> b!1407815 m!1296851))

(declare-fun m!1296871 () Bool)

(assert (=> b!1407815 m!1296871))

(declare-fun m!1296873 () Bool)

(assert (=> b!1407816 m!1296873))

(declare-fun m!1296875 () Bool)

(assert (=> b!1407816 m!1296875))

(assert (=> b!1407816 m!1296875))

(declare-fun m!1296877 () Bool)

(assert (=> b!1407816 m!1296877))

(assert (=> b!1407816 m!1296877))

(assert (=> b!1407816 m!1296875))

(declare-fun m!1296879 () Bool)

(assert (=> b!1407816 m!1296879))

(declare-fun m!1296881 () Bool)

(assert (=> start!121084 m!1296881))

(declare-fun m!1296883 () Bool)

(assert (=> start!121084 m!1296883))

(push 1)

(assert (not start!121084))

