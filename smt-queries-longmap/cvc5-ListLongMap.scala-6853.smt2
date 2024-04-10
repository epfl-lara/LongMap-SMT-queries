; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86372 () Bool)

(assert start!86372)

(declare-fun b!999490 () Bool)

(declare-fun res!668970 () Bool)

(declare-fun e!563559 () Bool)

(assert (=> b!999490 (=> (not res!668970) (not e!563559))))

(declare-datatypes ((array!63173 0))(
  ( (array!63174 (arr!30412 (Array (_ BitVec 32) (_ BitVec 64))) (size!30914 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63173)

(declare-datatypes ((List!21088 0))(
  ( (Nil!21085) (Cons!21084 (h!22261 (_ BitVec 64)) (t!30089 List!21088)) )
))
(declare-fun arrayNoDuplicates!0 (array!63173 (_ BitVec 32) List!21088) Bool)

(assert (=> b!999490 (= res!668970 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21085))))

(declare-fun b!999491 () Bool)

(declare-fun res!668972 () Bool)

(declare-fun e!563560 () Bool)

(assert (=> b!999491 (=> (not res!668972) (not e!563560))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999491 (= res!668972 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999492 () Bool)

(declare-fun res!668974 () Bool)

(declare-fun e!563556 () Bool)

(assert (=> b!999492 (=> (not res!668974) (not e!563556))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9344 0))(
  ( (MissingZero!9344 (index!39747 (_ BitVec 32))) (Found!9344 (index!39748 (_ BitVec 32))) (Intermediate!9344 (undefined!10156 Bool) (index!39749 (_ BitVec 32)) (x!87188 (_ BitVec 32))) (Undefined!9344) (MissingVacant!9344 (index!39750 (_ BitVec 32))) )
))
(declare-fun lt!442043 () SeekEntryResult!9344)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63173 (_ BitVec 32)) SeekEntryResult!9344)

(assert (=> b!999492 (= res!668974 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30412 a!3219) j!170) a!3219 mask!3464) lt!442043))))

(declare-fun b!999493 () Bool)

(declare-fun res!668977 () Bool)

(assert (=> b!999493 (=> (not res!668977) (not e!563560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999493 (= res!668977 (validKeyInArray!0 k!2224))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun e!563558 () Bool)

(declare-fun b!999494 () Bool)

(assert (=> b!999494 (= e!563558 (not (validKeyInArray!0 (select (store (arr!30412 a!3219) i!1194 k!2224) j!170))))))

(declare-fun b!999495 () Bool)

(declare-fun res!668979 () Bool)

(assert (=> b!999495 (=> (not res!668979) (not e!563560))))

(assert (=> b!999495 (= res!668979 (validKeyInArray!0 (select (arr!30412 a!3219) j!170)))))

(declare-fun b!999496 () Bool)

(assert (=> b!999496 (= e!563556 e!563558)))

(declare-fun res!668971 () Bool)

(assert (=> b!999496 (=> (not res!668971) (not e!563558))))

(declare-fun lt!442042 () (_ BitVec 32))

(assert (=> b!999496 (= res!668971 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge lt!442042 #b00000000000000000000000000000000) (bvslt lt!442042 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999496 (= lt!442042 (toIndex!0 (select (store (arr!30412 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!999498 () Bool)

(declare-fun res!668968 () Bool)

(assert (=> b!999498 (=> (not res!668968) (not e!563560))))

(assert (=> b!999498 (= res!668968 (and (= (size!30914 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30914 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30914 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999499 () Bool)

(declare-fun res!668978 () Bool)

(assert (=> b!999499 (=> (not res!668978) (not e!563559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63173 (_ BitVec 32)) Bool)

(assert (=> b!999499 (= res!668978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999500 () Bool)

(declare-fun res!668973 () Bool)

(assert (=> b!999500 (=> (not res!668973) (not e!563559))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999500 (= res!668973 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30914 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30914 a!3219))))))

(declare-fun b!999501 () Bool)

(assert (=> b!999501 (= e!563560 e!563559)))

(declare-fun res!668976 () Bool)

(assert (=> b!999501 (=> (not res!668976) (not e!563559))))

(declare-fun lt!442041 () SeekEntryResult!9344)

(assert (=> b!999501 (= res!668976 (or (= lt!442041 (MissingVacant!9344 i!1194)) (= lt!442041 (MissingZero!9344 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63173 (_ BitVec 32)) SeekEntryResult!9344)

(assert (=> b!999501 (= lt!442041 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999497 () Bool)

(assert (=> b!999497 (= e!563559 e!563556)))

(declare-fun res!668969 () Bool)

(assert (=> b!999497 (=> (not res!668969) (not e!563556))))

(assert (=> b!999497 (= res!668969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30412 a!3219) j!170) mask!3464) (select (arr!30412 a!3219) j!170) a!3219 mask!3464) lt!442043))))

(assert (=> b!999497 (= lt!442043 (Intermediate!9344 false resIndex!38 resX!38))))

(declare-fun res!668975 () Bool)

(assert (=> start!86372 (=> (not res!668975) (not e!563560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86372 (= res!668975 (validMask!0 mask!3464))))

(assert (=> start!86372 e!563560))

(declare-fun array_inv!23536 (array!63173) Bool)

(assert (=> start!86372 (array_inv!23536 a!3219)))

(assert (=> start!86372 true))

(assert (= (and start!86372 res!668975) b!999498))

(assert (= (and b!999498 res!668968) b!999495))

(assert (= (and b!999495 res!668979) b!999493))

(assert (= (and b!999493 res!668977) b!999491))

(assert (= (and b!999491 res!668972) b!999501))

(assert (= (and b!999501 res!668976) b!999499))

(assert (= (and b!999499 res!668978) b!999490))

(assert (= (and b!999490 res!668970) b!999500))

(assert (= (and b!999500 res!668973) b!999497))

(assert (= (and b!999497 res!668969) b!999492))

(assert (= (and b!999492 res!668974) b!999496))

(assert (= (and b!999496 res!668971) b!999494))

(declare-fun m!925727 () Bool)

(assert (=> b!999495 m!925727))

(assert (=> b!999495 m!925727))

(declare-fun m!925729 () Bool)

(assert (=> b!999495 m!925729))

(declare-fun m!925731 () Bool)

(assert (=> b!999490 m!925731))

(declare-fun m!925733 () Bool)

(assert (=> b!999501 m!925733))

(declare-fun m!925735 () Bool)

(assert (=> start!86372 m!925735))

(declare-fun m!925737 () Bool)

(assert (=> start!86372 m!925737))

(assert (=> b!999497 m!925727))

(assert (=> b!999497 m!925727))

(declare-fun m!925739 () Bool)

(assert (=> b!999497 m!925739))

(assert (=> b!999497 m!925739))

(assert (=> b!999497 m!925727))

(declare-fun m!925741 () Bool)

(assert (=> b!999497 m!925741))

(declare-fun m!925743 () Bool)

(assert (=> b!999491 m!925743))

(declare-fun m!925745 () Bool)

(assert (=> b!999496 m!925745))

(declare-fun m!925747 () Bool)

(assert (=> b!999496 m!925747))

(assert (=> b!999496 m!925747))

(declare-fun m!925749 () Bool)

(assert (=> b!999496 m!925749))

(assert (=> b!999492 m!925727))

(assert (=> b!999492 m!925727))

(declare-fun m!925751 () Bool)

(assert (=> b!999492 m!925751))

(assert (=> b!999494 m!925745))

(assert (=> b!999494 m!925747))

(assert (=> b!999494 m!925747))

(declare-fun m!925753 () Bool)

(assert (=> b!999494 m!925753))

(declare-fun m!925755 () Bool)

(assert (=> b!999499 m!925755))

(declare-fun m!925757 () Bool)

(assert (=> b!999493 m!925757))

(push 1)

