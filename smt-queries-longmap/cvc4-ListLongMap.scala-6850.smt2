; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86304 () Bool)

(assert start!86304)

(declare-fun b!998996 () Bool)

(declare-fun res!668639 () Bool)

(declare-fun e!563305 () Bool)

(assert (=> b!998996 (=> (not res!668639) (not e!563305))))

(declare-datatypes ((array!63156 0))(
  ( (array!63157 (arr!30405 (Array (_ BitVec 32) (_ BitVec 64))) (size!30907 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63156)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998996 (= res!668639 (and (= (size!30907 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30907 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30907 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998997 () Bool)

(declare-fun res!668638 () Bool)

(assert (=> b!998997 (=> (not res!668638) (not e!563305))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998997 (= res!668638 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998998 () Bool)

(declare-fun res!668635 () Bool)

(declare-fun e!563304 () Bool)

(assert (=> b!998998 (=> (not res!668635) (not e!563304))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9337 0))(
  ( (MissingZero!9337 (index!39719 (_ BitVec 32))) (Found!9337 (index!39720 (_ BitVec 32))) (Intermediate!9337 (undefined!10149 Bool) (index!39721 (_ BitVec 32)) (x!87151 (_ BitVec 32))) (Undefined!9337) (MissingVacant!9337 (index!39722 (_ BitVec 32))) )
))
(declare-fun lt!441876 () SeekEntryResult!9337)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63156 (_ BitVec 32)) SeekEntryResult!9337)

(assert (=> b!998998 (= res!668635 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30405 a!3219) j!170) a!3219 mask!3464) lt!441876))))

(declare-fun b!998999 () Bool)

(declare-fun res!668633 () Bool)

(declare-fun e!563302 () Bool)

(assert (=> b!998999 (=> (not res!668633) (not e!563302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63156 (_ BitVec 32)) Bool)

(assert (=> b!998999 (= res!668633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999000 () Bool)

(declare-fun res!668640 () Bool)

(assert (=> b!999000 (=> (not res!668640) (not e!563302))))

(declare-datatypes ((List!21081 0))(
  ( (Nil!21078) (Cons!21077 (h!22251 (_ BitVec 64)) (t!30082 List!21081)) )
))
(declare-fun arrayNoDuplicates!0 (array!63156 (_ BitVec 32) List!21081) Bool)

(assert (=> b!999000 (= res!668640 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21078))))

(declare-fun b!999001 () Bool)

(declare-fun res!668642 () Bool)

(assert (=> b!999001 (=> (not res!668642) (not e!563302))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999001 (= res!668642 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30907 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30907 a!3219))))))

(declare-fun res!668641 () Bool)

(assert (=> start!86304 (=> (not res!668641) (not e!563305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86304 (= res!668641 (validMask!0 mask!3464))))

(assert (=> start!86304 e!563305))

(declare-fun array_inv!23529 (array!63156) Bool)

(assert (=> start!86304 (array_inv!23529 a!3219)))

(assert (=> start!86304 true))

(declare-fun b!999002 () Bool)

(declare-fun res!668637 () Bool)

(assert (=> b!999002 (=> (not res!668637) (not e!563305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999002 (= res!668637 (validKeyInArray!0 k!2224))))

(declare-fun b!999003 () Bool)

(declare-fun res!668634 () Bool)

(assert (=> b!999003 (=> (not res!668634) (not e!563305))))

(assert (=> b!999003 (= res!668634 (validKeyInArray!0 (select (arr!30405 a!3219) j!170)))))

(declare-fun b!999004 () Bool)

(assert (=> b!999004 (= e!563302 e!563304)))

(declare-fun res!668643 () Bool)

(assert (=> b!999004 (=> (not res!668643) (not e!563304))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999004 (= res!668643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30405 a!3219) j!170) mask!3464) (select (arr!30405 a!3219) j!170) a!3219 mask!3464) lt!441876))))

(assert (=> b!999004 (= lt!441876 (Intermediate!9337 false resIndex!38 resX!38))))

(declare-fun b!999005 () Bool)

(assert (=> b!999005 (= e!563305 e!563302)))

(declare-fun res!668636 () Bool)

(assert (=> b!999005 (=> (not res!668636) (not e!563302))))

(declare-fun lt!441878 () SeekEntryResult!9337)

(assert (=> b!999005 (= res!668636 (or (= lt!441878 (MissingVacant!9337 i!1194)) (= lt!441878 (MissingZero!9337 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63156 (_ BitVec 32)) SeekEntryResult!9337)

(assert (=> b!999005 (= lt!441878 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999006 () Bool)

(assert (=> b!999006 (= e!563304 false)))

(declare-fun lt!441877 () (_ BitVec 32))

(assert (=> b!999006 (= lt!441877 (toIndex!0 (select (store (arr!30405 a!3219) i!1194 k!2224) j!170) mask!3464))))

(assert (= (and start!86304 res!668641) b!998996))

(assert (= (and b!998996 res!668639) b!999003))

(assert (= (and b!999003 res!668634) b!999002))

(assert (= (and b!999002 res!668637) b!998997))

(assert (= (and b!998997 res!668638) b!999005))

(assert (= (and b!999005 res!668636) b!998999))

(assert (= (and b!998999 res!668633) b!999000))

(assert (= (and b!999000 res!668640) b!999001))

(assert (= (and b!999001 res!668642) b!999004))

(assert (= (and b!999004 res!668643) b!998998))

(assert (= (and b!998998 res!668635) b!999006))

(declare-fun m!925373 () Bool)

(assert (=> b!998997 m!925373))

(declare-fun m!925375 () Bool)

(assert (=> b!998998 m!925375))

(assert (=> b!998998 m!925375))

(declare-fun m!925377 () Bool)

(assert (=> b!998998 m!925377))

(assert (=> b!999004 m!925375))

(assert (=> b!999004 m!925375))

(declare-fun m!925379 () Bool)

(assert (=> b!999004 m!925379))

(assert (=> b!999004 m!925379))

(assert (=> b!999004 m!925375))

(declare-fun m!925381 () Bool)

(assert (=> b!999004 m!925381))

(declare-fun m!925383 () Bool)

(assert (=> b!999005 m!925383))

(declare-fun m!925385 () Bool)

(assert (=> b!998999 m!925385))

(declare-fun m!925387 () Bool)

(assert (=> b!999006 m!925387))

(declare-fun m!925389 () Bool)

(assert (=> b!999006 m!925389))

(assert (=> b!999006 m!925389))

(declare-fun m!925391 () Bool)

(assert (=> b!999006 m!925391))

(assert (=> b!999003 m!925375))

(assert (=> b!999003 m!925375))

(declare-fun m!925393 () Bool)

(assert (=> b!999003 m!925393))

(declare-fun m!925395 () Bool)

(assert (=> start!86304 m!925395))

(declare-fun m!925397 () Bool)

(assert (=> start!86304 m!925397))

(declare-fun m!925399 () Bool)

(assert (=> b!999002 m!925399))

(declare-fun m!925401 () Bool)

(assert (=> b!999000 m!925401))

(push 1)

(assert (not b!998998))

(assert (not b!999000))

(assert (not b!998999))

(assert (not start!86304))

(assert (not b!998997))

(assert (not b!999005))

(assert (not b!999003))

(assert (not b!999004))

(assert (not b!999006))

(assert (not b!999002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

