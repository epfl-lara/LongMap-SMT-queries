; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119708 () Bool)

(assert start!119708)

(declare-fun b!1394467 () Bool)

(declare-fun e!789516 () Bool)

(assert (=> b!1394467 (= e!789516 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!612494 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10370 0))(
  ( (MissingZero!10370 (index!43851 (_ BitVec 32))) (Found!10370 (index!43852 (_ BitVec 32))) (Intermediate!10370 (undefined!11182 Bool) (index!43853 (_ BitVec 32)) (x!125518 (_ BitVec 32))) (Undefined!10370) (MissingVacant!10370 (index!43854 (_ BitVec 32))) )
))
(declare-fun lt!612498 () SeekEntryResult!10370)

(declare-datatypes ((array!95390 0))(
  ( (array!95391 (arr!46053 (Array (_ BitVec 32) (_ BitVec 64))) (size!46603 (_ BitVec 32))) )
))
(declare-fun lt!612496 () array!95390)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95390 (_ BitVec 32)) SeekEntryResult!10370)

(assert (=> b!1394467 (= lt!612498 (seekEntryOrOpen!0 lt!612494 lt!612496 mask!2840))))

(declare-fun a!2901 () array!95390)

(declare-datatypes ((Unit!46744 0))(
  ( (Unit!46745) )
))
(declare-fun lt!612493 () Unit!46744)

(declare-fun lt!612497 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612495 () SeekEntryResult!10370)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46744)

(assert (=> b!1394467 (= lt!612493 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612497 (x!125518 lt!612495) (index!43853 lt!612495) mask!2840))))

(declare-fun b!1394468 () Bool)

(declare-fun res!933875 () Bool)

(declare-fun e!789515 () Bool)

(assert (=> b!1394468 (=> (not res!933875) (not e!789515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394468 (= res!933875 (validKeyInArray!0 (select (arr!46053 a!2901) i!1037)))))

(declare-fun b!1394469 () Bool)

(declare-fun res!933882 () Bool)

(assert (=> b!1394469 (=> (not res!933882) (not e!789515))))

(assert (=> b!1394469 (= res!933882 (validKeyInArray!0 (select (arr!46053 a!2901) j!112)))))

(declare-fun b!1394470 () Bool)

(declare-fun e!789517 () Bool)

(assert (=> b!1394470 (= e!789515 (not e!789517))))

(declare-fun res!933879 () Bool)

(assert (=> b!1394470 (=> res!933879 e!789517)))

(get-info :version)

(assert (=> b!1394470 (= res!933879 (or (not ((_ is Intermediate!10370) lt!612495)) (undefined!11182 lt!612495)))))

(assert (=> b!1394470 (= lt!612498 (Found!10370 j!112))))

(assert (=> b!1394470 (= lt!612498 (seekEntryOrOpen!0 (select (arr!46053 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95390 (_ BitVec 32)) Bool)

(assert (=> b!1394470 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612492 () Unit!46744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46744)

(assert (=> b!1394470 (= lt!612492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95390 (_ BitVec 32)) SeekEntryResult!10370)

(assert (=> b!1394470 (= lt!612495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612497 (select (arr!46053 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394470 (= lt!612497 (toIndex!0 (select (arr!46053 a!2901) j!112) mask!2840))))

(declare-fun b!1394471 () Bool)

(assert (=> b!1394471 (= e!789517 e!789516)))

(declare-fun res!933883 () Bool)

(assert (=> b!1394471 (=> res!933883 e!789516)))

(assert (=> b!1394471 (= res!933883 (not (= lt!612495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612494 mask!2840) lt!612494 lt!612496 mask!2840))))))

(assert (=> b!1394471 (= lt!612494 (select (store (arr!46053 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394471 (= lt!612496 (array!95391 (store (arr!46053 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46603 a!2901)))))

(declare-fun b!1394472 () Bool)

(declare-fun res!933880 () Bool)

(assert (=> b!1394472 (=> (not res!933880) (not e!789515))))

(assert (=> b!1394472 (= res!933880 (and (= (size!46603 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46603 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46603 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394473 () Bool)

(declare-fun res!933876 () Bool)

(assert (=> b!1394473 (=> res!933876 e!789516)))

(assert (=> b!1394473 (= res!933876 (or (bvslt (x!125518 lt!612495) #b00000000000000000000000000000000) (bvsgt (x!125518 lt!612495) #b01111111111111111111111111111110) (bvslt lt!612497 #b00000000000000000000000000000000) (bvsge lt!612497 (size!46603 a!2901)) (bvslt (index!43853 lt!612495) #b00000000000000000000000000000000) (bvsge (index!43853 lt!612495) (size!46603 a!2901)) (not (= lt!612495 (Intermediate!10370 false (index!43853 lt!612495) (x!125518 lt!612495))))))))

(declare-fun b!1394475 () Bool)

(declare-fun res!933877 () Bool)

(assert (=> b!1394475 (=> (not res!933877) (not e!789515))))

(assert (=> b!1394475 (= res!933877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!933881 () Bool)

(assert (=> start!119708 (=> (not res!933881) (not e!789515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119708 (= res!933881 (validMask!0 mask!2840))))

(assert (=> start!119708 e!789515))

(assert (=> start!119708 true))

(declare-fun array_inv!35081 (array!95390) Bool)

(assert (=> start!119708 (array_inv!35081 a!2901)))

(declare-fun b!1394474 () Bool)

(declare-fun res!933878 () Bool)

(assert (=> b!1394474 (=> (not res!933878) (not e!789515))))

(declare-datatypes ((List!32572 0))(
  ( (Nil!32569) (Cons!32568 (h!33801 (_ BitVec 64)) (t!47266 List!32572)) )
))
(declare-fun arrayNoDuplicates!0 (array!95390 (_ BitVec 32) List!32572) Bool)

(assert (=> b!1394474 (= res!933878 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32569))))

(assert (= (and start!119708 res!933881) b!1394472))

(assert (= (and b!1394472 res!933880) b!1394468))

(assert (= (and b!1394468 res!933875) b!1394469))

(assert (= (and b!1394469 res!933882) b!1394475))

(assert (= (and b!1394475 res!933877) b!1394474))

(assert (= (and b!1394474 res!933878) b!1394470))

(assert (= (and b!1394470 (not res!933879)) b!1394471))

(assert (= (and b!1394471 (not res!933883)) b!1394473))

(assert (= (and b!1394473 (not res!933876)) b!1394467))

(declare-fun m!1280801 () Bool)

(assert (=> b!1394471 m!1280801))

(assert (=> b!1394471 m!1280801))

(declare-fun m!1280803 () Bool)

(assert (=> b!1394471 m!1280803))

(declare-fun m!1280805 () Bool)

(assert (=> b!1394471 m!1280805))

(declare-fun m!1280807 () Bool)

(assert (=> b!1394471 m!1280807))

(declare-fun m!1280809 () Bool)

(assert (=> b!1394470 m!1280809))

(declare-fun m!1280811 () Bool)

(assert (=> b!1394470 m!1280811))

(assert (=> b!1394470 m!1280809))

(declare-fun m!1280813 () Bool)

(assert (=> b!1394470 m!1280813))

(assert (=> b!1394470 m!1280809))

(declare-fun m!1280815 () Bool)

(assert (=> b!1394470 m!1280815))

(assert (=> b!1394470 m!1280809))

(declare-fun m!1280817 () Bool)

(assert (=> b!1394470 m!1280817))

(declare-fun m!1280819 () Bool)

(assert (=> b!1394470 m!1280819))

(declare-fun m!1280821 () Bool)

(assert (=> b!1394467 m!1280821))

(declare-fun m!1280823 () Bool)

(assert (=> b!1394467 m!1280823))

(declare-fun m!1280825 () Bool)

(assert (=> b!1394475 m!1280825))

(assert (=> b!1394469 m!1280809))

(assert (=> b!1394469 m!1280809))

(declare-fun m!1280827 () Bool)

(assert (=> b!1394469 m!1280827))

(declare-fun m!1280829 () Bool)

(assert (=> start!119708 m!1280829))

(declare-fun m!1280831 () Bool)

(assert (=> start!119708 m!1280831))

(declare-fun m!1280833 () Bool)

(assert (=> b!1394474 m!1280833))

(declare-fun m!1280835 () Bool)

(assert (=> b!1394468 m!1280835))

(assert (=> b!1394468 m!1280835))

(declare-fun m!1280837 () Bool)

(assert (=> b!1394468 m!1280837))

(check-sat (not b!1394475) (not b!1394471) (not b!1394470) (not b!1394474) (not b!1394468) (not b!1394469) (not start!119708) (not b!1394467))
(check-sat)
