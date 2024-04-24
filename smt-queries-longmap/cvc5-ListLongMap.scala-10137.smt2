; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119778 () Bool)

(assert start!119778)

(declare-fun b!1394159 () Bool)

(declare-fun res!932883 () Bool)

(declare-fun e!789546 () Bool)

(assert (=> b!1394159 (=> (not res!932883) (not e!789546))))

(declare-datatypes ((array!95382 0))(
  ( (array!95383 (arr!46047 (Array (_ BitVec 32) (_ BitVec 64))) (size!46598 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95382)

(declare-datatypes ((List!32553 0))(
  ( (Nil!32550) (Cons!32549 (h!33790 (_ BitVec 64)) (t!47239 List!32553)) )
))
(declare-fun arrayNoDuplicates!0 (array!95382 (_ BitVec 32) List!32553) Bool)

(assert (=> b!1394159 (= res!932883 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32550))))

(declare-fun b!1394160 () Bool)

(declare-fun res!932888 () Bool)

(assert (=> b!1394160 (=> (not res!932888) (not e!789546))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394160 (= res!932888 (and (= (size!46598 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46598 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46598 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!789545 () Bool)

(declare-fun b!1394161 () Bool)

(declare-datatypes ((SeekEntryResult!10267 0))(
  ( (MissingZero!10267 (index!43439 (_ BitVec 32))) (Found!10267 (index!43440 (_ BitVec 32))) (Intermediate!10267 (undefined!11079 Bool) (index!43441 (_ BitVec 32)) (x!125274 (_ BitVec 32))) (Undefined!10267) (MissingVacant!10267 (index!43442 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95382 (_ BitVec 32)) SeekEntryResult!10267)

(assert (=> b!1394161 (= e!789545 (= (seekEntryOrOpen!0 (select (arr!46047 a!2901) j!112) a!2901 mask!2840) (Found!10267 j!112)))))

(declare-fun b!1394162 () Bool)

(declare-fun e!789547 () Bool)

(assert (=> b!1394162 (= e!789547 true)))

(declare-fun lt!612233 () SeekEntryResult!10267)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95382 (_ BitVec 32)) SeekEntryResult!10267)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394162 (= lt!612233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46047 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46047 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95383 (store (arr!46047 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46598 a!2901)) mask!2840))))

(declare-fun b!1394163 () Bool)

(assert (=> b!1394163 (= e!789546 (not e!789547))))

(declare-fun res!932887 () Bool)

(assert (=> b!1394163 (=> res!932887 e!789547)))

(declare-fun lt!612231 () SeekEntryResult!10267)

(assert (=> b!1394163 (= res!932887 (or (not (is-Intermediate!10267 lt!612231)) (undefined!11079 lt!612231)))))

(assert (=> b!1394163 e!789545))

(declare-fun res!932886 () Bool)

(assert (=> b!1394163 (=> (not res!932886) (not e!789545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95382 (_ BitVec 32)) Bool)

(assert (=> b!1394163 (= res!932886 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46565 0))(
  ( (Unit!46566) )
))
(declare-fun lt!612232 () Unit!46565)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46565)

(assert (=> b!1394163 (= lt!612232 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394163 (= lt!612231 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46047 a!2901) j!112) mask!2840) (select (arr!46047 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394165 () Bool)

(declare-fun res!932889 () Bool)

(assert (=> b!1394165 (=> (not res!932889) (not e!789546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394165 (= res!932889 (validKeyInArray!0 (select (arr!46047 a!2901) i!1037)))))

(declare-fun b!1394166 () Bool)

(declare-fun res!932885 () Bool)

(assert (=> b!1394166 (=> (not res!932885) (not e!789546))))

(assert (=> b!1394166 (= res!932885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394164 () Bool)

(declare-fun res!932884 () Bool)

(assert (=> b!1394164 (=> (not res!932884) (not e!789546))))

(assert (=> b!1394164 (= res!932884 (validKeyInArray!0 (select (arr!46047 a!2901) j!112)))))

(declare-fun res!932890 () Bool)

(assert (=> start!119778 (=> (not res!932890) (not e!789546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119778 (= res!932890 (validMask!0 mask!2840))))

(assert (=> start!119778 e!789546))

(assert (=> start!119778 true))

(declare-fun array_inv!35328 (array!95382) Bool)

(assert (=> start!119778 (array_inv!35328 a!2901)))

(assert (= (and start!119778 res!932890) b!1394160))

(assert (= (and b!1394160 res!932888) b!1394165))

(assert (= (and b!1394165 res!932889) b!1394164))

(assert (= (and b!1394164 res!932884) b!1394166))

(assert (= (and b!1394166 res!932885) b!1394159))

(assert (= (and b!1394159 res!932883) b!1394163))

(assert (= (and b!1394163 res!932886) b!1394161))

(assert (= (and b!1394163 (not res!932887)) b!1394162))

(declare-fun m!1280127 () Bool)

(assert (=> b!1394161 m!1280127))

(assert (=> b!1394161 m!1280127))

(declare-fun m!1280129 () Bool)

(assert (=> b!1394161 m!1280129))

(declare-fun m!1280131 () Bool)

(assert (=> b!1394165 m!1280131))

(assert (=> b!1394165 m!1280131))

(declare-fun m!1280133 () Bool)

(assert (=> b!1394165 m!1280133))

(assert (=> b!1394163 m!1280127))

(declare-fun m!1280135 () Bool)

(assert (=> b!1394163 m!1280135))

(assert (=> b!1394163 m!1280127))

(declare-fun m!1280137 () Bool)

(assert (=> b!1394163 m!1280137))

(assert (=> b!1394163 m!1280135))

(assert (=> b!1394163 m!1280127))

(declare-fun m!1280139 () Bool)

(assert (=> b!1394163 m!1280139))

(declare-fun m!1280141 () Bool)

(assert (=> b!1394163 m!1280141))

(declare-fun m!1280143 () Bool)

(assert (=> b!1394166 m!1280143))

(declare-fun m!1280145 () Bool)

(assert (=> b!1394162 m!1280145))

(declare-fun m!1280147 () Bool)

(assert (=> b!1394162 m!1280147))

(assert (=> b!1394162 m!1280147))

(declare-fun m!1280149 () Bool)

(assert (=> b!1394162 m!1280149))

(assert (=> b!1394162 m!1280149))

(assert (=> b!1394162 m!1280147))

(declare-fun m!1280151 () Bool)

(assert (=> b!1394162 m!1280151))

(assert (=> b!1394164 m!1280127))

(assert (=> b!1394164 m!1280127))

(declare-fun m!1280153 () Bool)

(assert (=> b!1394164 m!1280153))

(declare-fun m!1280155 () Bool)

(assert (=> b!1394159 m!1280155))

(declare-fun m!1280157 () Bool)

(assert (=> start!119778 m!1280157))

(declare-fun m!1280159 () Bool)

(assert (=> start!119778 m!1280159))

(push 1)

(assert (not b!1394163))

(assert (not b!1394161))

(assert (not b!1394165))

(assert (not b!1394162))

(assert (not b!1394159))

(assert (not b!1394164))

(assert (not start!119778))

(assert (not b!1394166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

