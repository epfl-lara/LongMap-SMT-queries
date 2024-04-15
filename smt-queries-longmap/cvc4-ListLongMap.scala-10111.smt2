; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119158 () Bool)

(assert start!119158)

(declare-fun res!930213 () Bool)

(declare-fun e!787224 () Bool)

(assert (=> start!119158 (=> (not res!930213) (not e!787224))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119158 (= res!930213 (validMask!0 mask!2840))))

(assert (=> start!119158 e!787224))

(assert (=> start!119158 true))

(declare-datatypes ((array!95048 0))(
  ( (array!95049 (arr!45890 (Array (_ BitVec 32) (_ BitVec 64))) (size!46442 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95048)

(declare-fun array_inv!35123 (array!95048) Bool)

(assert (=> start!119158 (array_inv!35123 a!2901)))

(declare-fun b!1389996 () Bool)

(declare-fun res!930211 () Bool)

(assert (=> b!1389996 (=> (not res!930211) (not e!787224))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389996 (= res!930211 (validKeyInArray!0 (select (arr!45890 a!2901) i!1037)))))

(declare-fun b!1389997 () Bool)

(declare-fun res!930212 () Bool)

(assert (=> b!1389997 (=> (not res!930212) (not e!787224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95048 (_ BitVec 32)) Bool)

(assert (=> b!1389997 (= res!930212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389998 () Bool)

(declare-fun res!930208 () Bool)

(assert (=> b!1389998 (=> (not res!930208) (not e!787224))))

(declare-datatypes ((List!32487 0))(
  ( (Nil!32484) (Cons!32483 (h!33701 (_ BitVec 64)) (t!47173 List!32487)) )
))
(declare-fun arrayNoDuplicates!0 (array!95048 (_ BitVec 32) List!32487) Bool)

(assert (=> b!1389998 (= res!930208 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32484))))

(declare-fun b!1389999 () Bool)

(assert (=> b!1389999 (= e!787224 (not true))))

(declare-fun e!787225 () Bool)

(assert (=> b!1389999 e!787225))

(declare-fun res!930210 () Bool)

(assert (=> b!1389999 (=> (not res!930210) (not e!787225))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389999 (= res!930210 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46313 0))(
  ( (Unit!46314) )
))
(declare-fun lt!610531 () Unit!46313)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46313)

(assert (=> b!1389999 (= lt!610531 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10233 0))(
  ( (MissingZero!10233 (index!43303 (_ BitVec 32))) (Found!10233 (index!43304 (_ BitVec 32))) (Intermediate!10233 (undefined!11045 Bool) (index!43305 (_ BitVec 32)) (x!124980 (_ BitVec 32))) (Undefined!10233) (MissingVacant!10233 (index!43306 (_ BitVec 32))) )
))
(declare-fun lt!610532 () SeekEntryResult!10233)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95048 (_ BitVec 32)) SeekEntryResult!10233)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389999 (= lt!610532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45890 a!2901) j!112) mask!2840) (select (arr!45890 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390000 () Bool)

(declare-fun res!930214 () Bool)

(assert (=> b!1390000 (=> (not res!930214) (not e!787224))))

(assert (=> b!1390000 (= res!930214 (validKeyInArray!0 (select (arr!45890 a!2901) j!112)))))

(declare-fun b!1390001 () Bool)

(declare-fun res!930209 () Bool)

(assert (=> b!1390001 (=> (not res!930209) (not e!787224))))

(assert (=> b!1390001 (= res!930209 (and (= (size!46442 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46442 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46442 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390002 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95048 (_ BitVec 32)) SeekEntryResult!10233)

(assert (=> b!1390002 (= e!787225 (= (seekEntryOrOpen!0 (select (arr!45890 a!2901) j!112) a!2901 mask!2840) (Found!10233 j!112)))))

(assert (= (and start!119158 res!930213) b!1390001))

(assert (= (and b!1390001 res!930209) b!1389996))

(assert (= (and b!1389996 res!930211) b!1390000))

(assert (= (and b!1390000 res!930214) b!1389997))

(assert (= (and b!1389997 res!930212) b!1389998))

(assert (= (and b!1389998 res!930208) b!1389999))

(assert (= (and b!1389999 res!930210) b!1390002))

(declare-fun m!1275303 () Bool)

(assert (=> start!119158 m!1275303))

(declare-fun m!1275305 () Bool)

(assert (=> start!119158 m!1275305))

(declare-fun m!1275307 () Bool)

(assert (=> b!1389996 m!1275307))

(assert (=> b!1389996 m!1275307))

(declare-fun m!1275309 () Bool)

(assert (=> b!1389996 m!1275309))

(declare-fun m!1275311 () Bool)

(assert (=> b!1389998 m!1275311))

(declare-fun m!1275313 () Bool)

(assert (=> b!1390000 m!1275313))

(assert (=> b!1390000 m!1275313))

(declare-fun m!1275315 () Bool)

(assert (=> b!1390000 m!1275315))

(declare-fun m!1275317 () Bool)

(assert (=> b!1389997 m!1275317))

(assert (=> b!1390002 m!1275313))

(assert (=> b!1390002 m!1275313))

(declare-fun m!1275319 () Bool)

(assert (=> b!1390002 m!1275319))

(assert (=> b!1389999 m!1275313))

(declare-fun m!1275321 () Bool)

(assert (=> b!1389999 m!1275321))

(assert (=> b!1389999 m!1275313))

(declare-fun m!1275323 () Bool)

(assert (=> b!1389999 m!1275323))

(assert (=> b!1389999 m!1275321))

(assert (=> b!1389999 m!1275313))

(declare-fun m!1275325 () Bool)

(assert (=> b!1389999 m!1275325))

(declare-fun m!1275327 () Bool)

(assert (=> b!1389999 m!1275327))

(push 1)

(assert (not b!1389996))

(assert (not b!1389998))

(assert (not b!1389999))

(assert (not b!1390002))

(assert (not b!1390000))

(assert (not start!119158))

(assert (not b!1389997))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

