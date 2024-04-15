; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119154 () Bool)

(assert start!119154)

(declare-fun b!1389954 () Bool)

(declare-fun e!787207 () Bool)

(assert (=> b!1389954 (= e!787207 (not true))))

(declare-fun e!787208 () Bool)

(assert (=> b!1389954 e!787208))

(declare-fun res!930170 () Bool)

(assert (=> b!1389954 (=> (not res!930170) (not e!787208))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95044 0))(
  ( (array!95045 (arr!45888 (Array (_ BitVec 32) (_ BitVec 64))) (size!46440 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95044)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95044 (_ BitVec 32)) Bool)

(assert (=> b!1389954 (= res!930170 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46309 0))(
  ( (Unit!46310) )
))
(declare-fun lt!610520 () Unit!46309)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46309)

(assert (=> b!1389954 (= lt!610520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10231 0))(
  ( (MissingZero!10231 (index!43295 (_ BitVec 32))) (Found!10231 (index!43296 (_ BitVec 32))) (Intermediate!10231 (undefined!11043 Bool) (index!43297 (_ BitVec 32)) (x!124970 (_ BitVec 32))) (Undefined!10231) (MissingVacant!10231 (index!43298 (_ BitVec 32))) )
))
(declare-fun lt!610519 () SeekEntryResult!10231)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95044 (_ BitVec 32)) SeekEntryResult!10231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389954 (= lt!610519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45888 a!2901) j!112) mask!2840) (select (arr!45888 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389955 () Bool)

(declare-fun res!930171 () Bool)

(assert (=> b!1389955 (=> (not res!930171) (not e!787207))))

(declare-datatypes ((List!32485 0))(
  ( (Nil!32482) (Cons!32481 (h!33699 (_ BitVec 64)) (t!47171 List!32485)) )
))
(declare-fun arrayNoDuplicates!0 (array!95044 (_ BitVec 32) List!32485) Bool)

(assert (=> b!1389955 (= res!930171 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32482))))

(declare-fun b!1389956 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95044 (_ BitVec 32)) SeekEntryResult!10231)

(assert (=> b!1389956 (= e!787208 (= (seekEntryOrOpen!0 (select (arr!45888 a!2901) j!112) a!2901 mask!2840) (Found!10231 j!112)))))

(declare-fun res!930169 () Bool)

(assert (=> start!119154 (=> (not res!930169) (not e!787207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119154 (= res!930169 (validMask!0 mask!2840))))

(assert (=> start!119154 e!787207))

(assert (=> start!119154 true))

(declare-fun array_inv!35121 (array!95044) Bool)

(assert (=> start!119154 (array_inv!35121 a!2901)))

(declare-fun b!1389957 () Bool)

(declare-fun res!930168 () Bool)

(assert (=> b!1389957 (=> (not res!930168) (not e!787207))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389957 (= res!930168 (and (= (size!46440 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46440 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46440 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389958 () Bool)

(declare-fun res!930167 () Bool)

(assert (=> b!1389958 (=> (not res!930167) (not e!787207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389958 (= res!930167 (validKeyInArray!0 (select (arr!45888 a!2901) j!112)))))

(declare-fun b!1389959 () Bool)

(declare-fun res!930172 () Bool)

(assert (=> b!1389959 (=> (not res!930172) (not e!787207))))

(assert (=> b!1389959 (= res!930172 (validKeyInArray!0 (select (arr!45888 a!2901) i!1037)))))

(declare-fun b!1389960 () Bool)

(declare-fun res!930166 () Bool)

(assert (=> b!1389960 (=> (not res!930166) (not e!787207))))

(assert (=> b!1389960 (= res!930166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119154 res!930169) b!1389957))

(assert (= (and b!1389957 res!930168) b!1389959))

(assert (= (and b!1389959 res!930172) b!1389958))

(assert (= (and b!1389958 res!930167) b!1389960))

(assert (= (and b!1389960 res!930166) b!1389955))

(assert (= (and b!1389955 res!930171) b!1389954))

(assert (= (and b!1389954 res!930170) b!1389956))

(declare-fun m!1275251 () Bool)

(assert (=> b!1389954 m!1275251))

(declare-fun m!1275253 () Bool)

(assert (=> b!1389954 m!1275253))

(assert (=> b!1389954 m!1275251))

(declare-fun m!1275255 () Bool)

(assert (=> b!1389954 m!1275255))

(assert (=> b!1389954 m!1275253))

(assert (=> b!1389954 m!1275251))

(declare-fun m!1275257 () Bool)

(assert (=> b!1389954 m!1275257))

(declare-fun m!1275259 () Bool)

(assert (=> b!1389954 m!1275259))

(declare-fun m!1275261 () Bool)

(assert (=> b!1389960 m!1275261))

(declare-fun m!1275263 () Bool)

(assert (=> start!119154 m!1275263))

(declare-fun m!1275265 () Bool)

(assert (=> start!119154 m!1275265))

(assert (=> b!1389956 m!1275251))

(assert (=> b!1389956 m!1275251))

(declare-fun m!1275267 () Bool)

(assert (=> b!1389956 m!1275267))

(declare-fun m!1275269 () Bool)

(assert (=> b!1389955 m!1275269))

(declare-fun m!1275271 () Bool)

(assert (=> b!1389959 m!1275271))

(assert (=> b!1389959 m!1275271))

(declare-fun m!1275273 () Bool)

(assert (=> b!1389959 m!1275273))

(assert (=> b!1389958 m!1275251))

(assert (=> b!1389958 m!1275251))

(declare-fun m!1275275 () Bool)

(assert (=> b!1389958 m!1275275))

(push 1)

(assert (not b!1389956))

(assert (not b!1389959))

(assert (not start!119154))

(assert (not b!1389954))

(assert (not b!1389960))

(assert (not b!1389958))

(assert (not b!1389955))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

