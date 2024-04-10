; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119662 () Bool)

(assert start!119662)

(declare-fun res!933292 () Bool)

(declare-fun e!789239 () Bool)

(assert (=> start!119662 (=> (not res!933292) (not e!789239))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119662 (= res!933292 (validMask!0 mask!2840))))

(assert (=> start!119662 e!789239))

(assert (=> start!119662 true))

(declare-datatypes ((array!95344 0))(
  ( (array!95345 (arr!46030 (Array (_ BitVec 32) (_ BitVec 64))) (size!46580 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95344)

(declare-fun array_inv!35058 (array!95344) Bool)

(assert (=> start!119662 (array_inv!35058 a!2901)))

(declare-fun e!789241 () Bool)

(declare-fun b!1393883 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10347 0))(
  ( (MissingZero!10347 (index!43759 (_ BitVec 32))) (Found!10347 (index!43760 (_ BitVec 32))) (Intermediate!10347 (undefined!11159 Bool) (index!43761 (_ BitVec 32)) (x!125431 (_ BitVec 32))) (Undefined!10347) (MissingVacant!10347 (index!43762 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95344 (_ BitVec 32)) SeekEntryResult!10347)

(assert (=> b!1393883 (= e!789241 (= (seekEntryOrOpen!0 (select (arr!46030 a!2901) j!112) a!2901 mask!2840) (Found!10347 j!112)))))

(declare-fun b!1393884 () Bool)

(declare-fun res!933291 () Bool)

(assert (=> b!1393884 (=> (not res!933291) (not e!789239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95344 (_ BitVec 32)) Bool)

(assert (=> b!1393884 (= res!933291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393885 () Bool)

(declare-fun e!789240 () Bool)

(assert (=> b!1393885 (= e!789239 (not e!789240))))

(declare-fun res!933297 () Bool)

(assert (=> b!1393885 (=> res!933297 e!789240)))

(declare-fun lt!612158 () SeekEntryResult!10347)

(assert (=> b!1393885 (= res!933297 (or (not (is-Intermediate!10347 lt!612158)) (undefined!11159 lt!612158)))))

(assert (=> b!1393885 e!789241))

(declare-fun res!933295 () Bool)

(assert (=> b!1393885 (=> (not res!933295) (not e!789241))))

(assert (=> b!1393885 (= res!933295 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46698 0))(
  ( (Unit!46699) )
))
(declare-fun lt!612157 () Unit!46698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46698)

(assert (=> b!1393885 (= lt!612157 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95344 (_ BitVec 32)) SeekEntryResult!10347)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393885 (= lt!612158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46030 a!2901) j!112) mask!2840) (select (arr!46030 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393886 () Bool)

(declare-fun res!933296 () Bool)

(assert (=> b!1393886 (=> (not res!933296) (not e!789239))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393886 (= res!933296 (and (= (size!46580 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46580 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46580 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393887 () Bool)

(declare-fun res!933293 () Bool)

(assert (=> b!1393887 (=> (not res!933293) (not e!789239))))

(declare-datatypes ((List!32549 0))(
  ( (Nil!32546) (Cons!32545 (h!33778 (_ BitVec 64)) (t!47243 List!32549)) )
))
(declare-fun arrayNoDuplicates!0 (array!95344 (_ BitVec 32) List!32549) Bool)

(assert (=> b!1393887 (= res!933293 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32546))))

(declare-fun b!1393888 () Bool)

(declare-fun res!933298 () Bool)

(assert (=> b!1393888 (=> (not res!933298) (not e!789239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393888 (= res!933298 (validKeyInArray!0 (select (arr!46030 a!2901) j!112)))))

(declare-fun b!1393889 () Bool)

(assert (=> b!1393889 (= e!789240 true)))

(declare-fun lt!612159 () SeekEntryResult!10347)

(assert (=> b!1393889 (= lt!612159 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46030 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46030 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95345 (store (arr!46030 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46580 a!2901)) mask!2840))))

(declare-fun b!1393890 () Bool)

(declare-fun res!933294 () Bool)

(assert (=> b!1393890 (=> (not res!933294) (not e!789239))))

(assert (=> b!1393890 (= res!933294 (validKeyInArray!0 (select (arr!46030 a!2901) i!1037)))))

(assert (= (and start!119662 res!933292) b!1393886))

(assert (= (and b!1393886 res!933296) b!1393890))

(assert (= (and b!1393890 res!933294) b!1393888))

(assert (= (and b!1393888 res!933298) b!1393884))

(assert (= (and b!1393884 res!933291) b!1393887))

(assert (= (and b!1393887 res!933293) b!1393885))

(assert (= (and b!1393885 res!933295) b!1393883))

(assert (= (and b!1393885 (not res!933297)) b!1393889))

(declare-fun m!1279979 () Bool)

(assert (=> b!1393890 m!1279979))

(assert (=> b!1393890 m!1279979))

(declare-fun m!1279981 () Bool)

(assert (=> b!1393890 m!1279981))

(declare-fun m!1279983 () Bool)

(assert (=> b!1393883 m!1279983))

(assert (=> b!1393883 m!1279983))

(declare-fun m!1279985 () Bool)

(assert (=> b!1393883 m!1279985))

(declare-fun m!1279987 () Bool)

(assert (=> b!1393889 m!1279987))

(declare-fun m!1279989 () Bool)

(assert (=> b!1393889 m!1279989))

(assert (=> b!1393889 m!1279989))

(declare-fun m!1279991 () Bool)

(assert (=> b!1393889 m!1279991))

(assert (=> b!1393889 m!1279991))

(assert (=> b!1393889 m!1279989))

(declare-fun m!1279993 () Bool)

(assert (=> b!1393889 m!1279993))

(assert (=> b!1393885 m!1279983))

(declare-fun m!1279995 () Bool)

(assert (=> b!1393885 m!1279995))

(assert (=> b!1393885 m!1279983))

(declare-fun m!1279997 () Bool)

(assert (=> b!1393885 m!1279997))

(assert (=> b!1393885 m!1279995))

(assert (=> b!1393885 m!1279983))

(declare-fun m!1279999 () Bool)

(assert (=> b!1393885 m!1279999))

(declare-fun m!1280001 () Bool)

(assert (=> b!1393885 m!1280001))

(assert (=> b!1393888 m!1279983))

(assert (=> b!1393888 m!1279983))

(declare-fun m!1280003 () Bool)

(assert (=> b!1393888 m!1280003))

(declare-fun m!1280005 () Bool)

(assert (=> b!1393884 m!1280005))

(declare-fun m!1280007 () Bool)

(assert (=> start!119662 m!1280007))

(declare-fun m!1280009 () Bool)

(assert (=> start!119662 m!1280009))

(declare-fun m!1280011 () Bool)

(assert (=> b!1393887 m!1280011))

(push 1)

(assert (not b!1393888))

(assert (not b!1393887))

(assert (not b!1393890))

(assert (not b!1393883))

(assert (not b!1393889))

(assert (not b!1393885))

(assert (not b!1393884))

(assert (not start!119662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

