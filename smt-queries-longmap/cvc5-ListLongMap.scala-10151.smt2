; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119670 () Bool)

(assert start!119670)

(declare-fun b!1393979 () Bool)

(declare-fun res!933391 () Bool)

(declare-fun e!789287 () Bool)

(assert (=> b!1393979 (=> (not res!933391) (not e!789287))))

(declare-datatypes ((array!95352 0))(
  ( (array!95353 (arr!46034 (Array (_ BitVec 32) (_ BitVec 64))) (size!46584 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95352)

(declare-datatypes ((List!32553 0))(
  ( (Nil!32550) (Cons!32549 (h!33782 (_ BitVec 64)) (t!47247 List!32553)) )
))
(declare-fun arrayNoDuplicates!0 (array!95352 (_ BitVec 32) List!32553) Bool)

(assert (=> b!1393979 (= res!933391 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32550))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1393980 () Bool)

(declare-fun e!789288 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10351 0))(
  ( (MissingZero!10351 (index!43775 (_ BitVec 32))) (Found!10351 (index!43776 (_ BitVec 32))) (Intermediate!10351 (undefined!11163 Bool) (index!43777 (_ BitVec 32)) (x!125451 (_ BitVec 32))) (Undefined!10351) (MissingVacant!10351 (index!43778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95352 (_ BitVec 32)) SeekEntryResult!10351)

(assert (=> b!1393980 (= e!789288 (= (seekEntryOrOpen!0 (select (arr!46034 a!2901) j!112) a!2901 mask!2840) (Found!10351 j!112)))))

(declare-fun res!933394 () Bool)

(assert (=> start!119670 (=> (not res!933394) (not e!789287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119670 (= res!933394 (validMask!0 mask!2840))))

(assert (=> start!119670 e!789287))

(assert (=> start!119670 true))

(declare-fun array_inv!35062 (array!95352) Bool)

(assert (=> start!119670 (array_inv!35062 a!2901)))

(declare-fun b!1393981 () Bool)

(declare-fun e!789290 () Bool)

(assert (=> b!1393981 (= e!789290 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612195 () SeekEntryResult!10351)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95352 (_ BitVec 32)) SeekEntryResult!10351)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393981 (= lt!612195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46034 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46034 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95353 (store (arr!46034 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46584 a!2901)) mask!2840))))

(declare-fun b!1393982 () Bool)

(declare-fun res!933390 () Bool)

(assert (=> b!1393982 (=> (not res!933390) (not e!789287))))

(assert (=> b!1393982 (= res!933390 (and (= (size!46584 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46584 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46584 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393983 () Bool)

(declare-fun res!933392 () Bool)

(assert (=> b!1393983 (=> (not res!933392) (not e!789287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393983 (= res!933392 (validKeyInArray!0 (select (arr!46034 a!2901) i!1037)))))

(declare-fun b!1393984 () Bool)

(declare-fun res!933388 () Bool)

(assert (=> b!1393984 (=> (not res!933388) (not e!789287))))

(assert (=> b!1393984 (= res!933388 (validKeyInArray!0 (select (arr!46034 a!2901) j!112)))))

(declare-fun b!1393985 () Bool)

(assert (=> b!1393985 (= e!789287 (not e!789290))))

(declare-fun res!933387 () Bool)

(assert (=> b!1393985 (=> res!933387 e!789290)))

(declare-fun lt!612194 () SeekEntryResult!10351)

(assert (=> b!1393985 (= res!933387 (or (not (is-Intermediate!10351 lt!612194)) (undefined!11163 lt!612194)))))

(assert (=> b!1393985 e!789288))

(declare-fun res!933389 () Bool)

(assert (=> b!1393985 (=> (not res!933389) (not e!789288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95352 (_ BitVec 32)) Bool)

(assert (=> b!1393985 (= res!933389 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46706 0))(
  ( (Unit!46707) )
))
(declare-fun lt!612193 () Unit!46706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46706)

(assert (=> b!1393985 (= lt!612193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393985 (= lt!612194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46034 a!2901) j!112) mask!2840) (select (arr!46034 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393986 () Bool)

(declare-fun res!933393 () Bool)

(assert (=> b!1393986 (=> (not res!933393) (not e!789287))))

(assert (=> b!1393986 (= res!933393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119670 res!933394) b!1393982))

(assert (= (and b!1393982 res!933390) b!1393983))

(assert (= (and b!1393983 res!933392) b!1393984))

(assert (= (and b!1393984 res!933388) b!1393986))

(assert (= (and b!1393986 res!933393) b!1393979))

(assert (= (and b!1393979 res!933391) b!1393985))

(assert (= (and b!1393985 res!933389) b!1393980))

(assert (= (and b!1393985 (not res!933387)) b!1393981))

(declare-fun m!1280115 () Bool)

(assert (=> b!1393981 m!1280115))

(declare-fun m!1280117 () Bool)

(assert (=> b!1393981 m!1280117))

(assert (=> b!1393981 m!1280117))

(declare-fun m!1280119 () Bool)

(assert (=> b!1393981 m!1280119))

(assert (=> b!1393981 m!1280119))

(assert (=> b!1393981 m!1280117))

(declare-fun m!1280121 () Bool)

(assert (=> b!1393981 m!1280121))

(declare-fun m!1280123 () Bool)

(assert (=> b!1393986 m!1280123))

(declare-fun m!1280125 () Bool)

(assert (=> b!1393983 m!1280125))

(assert (=> b!1393983 m!1280125))

(declare-fun m!1280127 () Bool)

(assert (=> b!1393983 m!1280127))

(declare-fun m!1280129 () Bool)

(assert (=> b!1393985 m!1280129))

(declare-fun m!1280131 () Bool)

(assert (=> b!1393985 m!1280131))

(assert (=> b!1393985 m!1280129))

(declare-fun m!1280133 () Bool)

(assert (=> b!1393985 m!1280133))

(assert (=> b!1393985 m!1280131))

(assert (=> b!1393985 m!1280129))

(declare-fun m!1280135 () Bool)

(assert (=> b!1393985 m!1280135))

(declare-fun m!1280137 () Bool)

(assert (=> b!1393985 m!1280137))

(assert (=> b!1393980 m!1280129))

(assert (=> b!1393980 m!1280129))

(declare-fun m!1280139 () Bool)

(assert (=> b!1393980 m!1280139))

(declare-fun m!1280141 () Bool)

(assert (=> start!119670 m!1280141))

(declare-fun m!1280143 () Bool)

(assert (=> start!119670 m!1280143))

(declare-fun m!1280145 () Bool)

(assert (=> b!1393979 m!1280145))

(assert (=> b!1393984 m!1280129))

(assert (=> b!1393984 m!1280129))

(declare-fun m!1280147 () Bool)

(assert (=> b!1393984 m!1280147))

(push 1)

(assert (not b!1393981))

(assert (not b!1393984))

(assert (not start!119670))

(assert (not b!1393983))

(assert (not b!1393985))

(assert (not b!1393979))

(assert (not b!1393986))

(assert (not b!1393980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

