; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86294 () Bool)

(assert start!86294)

(declare-fun b!998831 () Bool)

(declare-fun res!668478 () Bool)

(declare-fun e!563244 () Bool)

(assert (=> b!998831 (=> (not res!668478) (not e!563244))))

(declare-datatypes ((array!63146 0))(
  ( (array!63147 (arr!30400 (Array (_ BitVec 32) (_ BitVec 64))) (size!30902 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63146)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9332 0))(
  ( (MissingZero!9332 (index!39699 (_ BitVec 32))) (Found!9332 (index!39700 (_ BitVec 32))) (Intermediate!9332 (undefined!10144 Bool) (index!39701 (_ BitVec 32)) (x!87138 (_ BitVec 32))) (Undefined!9332) (MissingVacant!9332 (index!39702 (_ BitVec 32))) )
))
(declare-fun lt!441832 () SeekEntryResult!9332)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63146 (_ BitVec 32)) SeekEntryResult!9332)

(assert (=> b!998831 (= res!668478 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30400 a!3219) j!170) a!3219 mask!3464) lt!441832))))

(declare-fun b!998832 () Bool)

(declare-fun res!668475 () Bool)

(declare-fun e!563242 () Bool)

(assert (=> b!998832 (=> (not res!668475) (not e!563242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998832 (= res!668475 (validKeyInArray!0 (select (arr!30400 a!3219) j!170)))))

(declare-fun b!998833 () Bool)

(declare-fun res!668469 () Bool)

(assert (=> b!998833 (=> (not res!668469) (not e!563242))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998833 (= res!668469 (and (= (size!30902 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30902 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30902 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!668470 () Bool)

(assert (=> start!86294 (=> (not res!668470) (not e!563242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86294 (= res!668470 (validMask!0 mask!3464))))

(assert (=> start!86294 e!563242))

(declare-fun array_inv!23524 (array!63146) Bool)

(assert (=> start!86294 (array_inv!23524 a!3219)))

(assert (=> start!86294 true))

(declare-fun b!998834 () Bool)

(declare-fun res!668477 () Bool)

(assert (=> b!998834 (=> (not res!668477) (not e!563242))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998834 (= res!668477 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998835 () Bool)

(declare-fun res!668472 () Bool)

(assert (=> b!998835 (=> (not res!668472) (not e!563242))))

(assert (=> b!998835 (= res!668472 (validKeyInArray!0 k!2224))))

(declare-fun b!998836 () Bool)

(declare-fun res!668474 () Bool)

(declare-fun e!563243 () Bool)

(assert (=> b!998836 (=> (not res!668474) (not e!563243))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998836 (= res!668474 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30902 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30902 a!3219))))))

(declare-fun b!998837 () Bool)

(assert (=> b!998837 (= e!563244 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun lt!441833 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998837 (= lt!441833 (toIndex!0 (select (store (arr!30400 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!998838 () Bool)

(assert (=> b!998838 (= e!563242 e!563243)))

(declare-fun res!668473 () Bool)

(assert (=> b!998838 (=> (not res!668473) (not e!563243))))

(declare-fun lt!441831 () SeekEntryResult!9332)

(assert (=> b!998838 (= res!668473 (or (= lt!441831 (MissingVacant!9332 i!1194)) (= lt!441831 (MissingZero!9332 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63146 (_ BitVec 32)) SeekEntryResult!9332)

(assert (=> b!998838 (= lt!441831 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!998839 () Bool)

(assert (=> b!998839 (= e!563243 e!563244)))

(declare-fun res!668468 () Bool)

(assert (=> b!998839 (=> (not res!668468) (not e!563244))))

(assert (=> b!998839 (= res!668468 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30400 a!3219) j!170) mask!3464) (select (arr!30400 a!3219) j!170) a!3219 mask!3464) lt!441832))))

(assert (=> b!998839 (= lt!441832 (Intermediate!9332 false resIndex!38 resX!38))))

(declare-fun b!998840 () Bool)

(declare-fun res!668476 () Bool)

(assert (=> b!998840 (=> (not res!668476) (not e!563243))))

(declare-datatypes ((List!21076 0))(
  ( (Nil!21073) (Cons!21072 (h!22246 (_ BitVec 64)) (t!30077 List!21076)) )
))
(declare-fun arrayNoDuplicates!0 (array!63146 (_ BitVec 32) List!21076) Bool)

(assert (=> b!998840 (= res!668476 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21073))))

(declare-fun b!998841 () Bool)

(declare-fun res!668471 () Bool)

(assert (=> b!998841 (=> (not res!668471) (not e!563243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63146 (_ BitVec 32)) Bool)

(assert (=> b!998841 (= res!668471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86294 res!668470) b!998833))

(assert (= (and b!998833 res!668469) b!998832))

(assert (= (and b!998832 res!668475) b!998835))

(assert (= (and b!998835 res!668472) b!998834))

(assert (= (and b!998834 res!668477) b!998838))

(assert (= (and b!998838 res!668473) b!998841))

(assert (= (and b!998841 res!668471) b!998840))

(assert (= (and b!998840 res!668476) b!998836))

(assert (= (and b!998836 res!668474) b!998839))

(assert (= (and b!998839 res!668468) b!998831))

(assert (= (and b!998831 res!668478) b!998837))

(declare-fun m!925223 () Bool)

(assert (=> start!86294 m!925223))

(declare-fun m!925225 () Bool)

(assert (=> start!86294 m!925225))

(declare-fun m!925227 () Bool)

(assert (=> b!998838 m!925227))

(declare-fun m!925229 () Bool)

(assert (=> b!998839 m!925229))

(assert (=> b!998839 m!925229))

(declare-fun m!925231 () Bool)

(assert (=> b!998839 m!925231))

(assert (=> b!998839 m!925231))

(assert (=> b!998839 m!925229))

(declare-fun m!925233 () Bool)

(assert (=> b!998839 m!925233))

(declare-fun m!925235 () Bool)

(assert (=> b!998834 m!925235))

(assert (=> b!998831 m!925229))

(assert (=> b!998831 m!925229))

(declare-fun m!925237 () Bool)

(assert (=> b!998831 m!925237))

(declare-fun m!925239 () Bool)

(assert (=> b!998840 m!925239))

(declare-fun m!925241 () Bool)

(assert (=> b!998837 m!925241))

(declare-fun m!925243 () Bool)

(assert (=> b!998837 m!925243))

(assert (=> b!998837 m!925243))

(declare-fun m!925245 () Bool)

(assert (=> b!998837 m!925245))

(declare-fun m!925247 () Bool)

(assert (=> b!998841 m!925247))

(assert (=> b!998832 m!925229))

(assert (=> b!998832 m!925229))

(declare-fun m!925249 () Bool)

(assert (=> b!998832 m!925249))

(declare-fun m!925251 () Bool)

(assert (=> b!998835 m!925251))

(push 1)

