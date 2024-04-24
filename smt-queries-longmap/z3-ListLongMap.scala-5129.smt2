; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69824 () Bool)

(assert start!69824)

(declare-fun b!812493 () Bool)

(declare-fun res!554990 () Bool)

(declare-fun e!449764 () Bool)

(assert (=> b!812493 (=> (not res!554990) (not e!449764))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44095 0))(
  ( (array!44096 (arr!21112 (Array (_ BitVec 32) (_ BitVec 64))) (size!21532 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44095)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!812493 (= res!554990 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21532 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21112 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21532 a!3170)) (= (select (arr!21112 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!812494 () Bool)

(declare-fun e!449763 () Bool)

(assert (=> b!812494 (= e!449763 e!449764)))

(declare-fun res!554994 () Bool)

(assert (=> b!812494 (=> (not res!554994) (not e!449764))))

(declare-datatypes ((SeekEntryResult!8659 0))(
  ( (MissingZero!8659 (index!37007 (_ BitVec 32))) (Found!8659 (index!37008 (_ BitVec 32))) (Intermediate!8659 (undefined!9471 Bool) (index!37009 (_ BitVec 32)) (x!67982 (_ BitVec 32))) (Undefined!8659) (MissingVacant!8659 (index!37010 (_ BitVec 32))) )
))
(declare-fun lt!364272 () SeekEntryResult!8659)

(assert (=> b!812494 (= res!554994 (or (= lt!364272 (MissingZero!8659 i!1163)) (= lt!364272 (MissingVacant!8659 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44095 (_ BitVec 32)) SeekEntryResult!8659)

(assert (=> b!812494 (= lt!364272 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!812495 () Bool)

(declare-fun e!449766 () Bool)

(assert (=> b!812495 (= e!449766 (not true))))

(declare-fun lt!364276 () array!44095)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!364275 () (_ BitVec 64))

(declare-fun lt!364277 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44095 (_ BitVec 32)) SeekEntryResult!8659)

(assert (=> b!812495 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364277 vacantAfter!23 lt!364275 lt!364276 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!364277 vacantBefore!23 (select (arr!21112 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27663 0))(
  ( (Unit!27664) )
))
(declare-fun lt!364273 () Unit!27663)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44095 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27663)

(assert (=> b!812495 (= lt!364273 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!364277 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!812495 (= lt!364277 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!812496 () Bool)

(declare-fun res!554995 () Bool)

(assert (=> b!812496 (=> (not res!554995) (not e!449763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!812496 (= res!554995 (validKeyInArray!0 (select (arr!21112 a!3170) j!153)))))

(declare-fun b!812497 () Bool)

(declare-fun res!554997 () Bool)

(assert (=> b!812497 (=> (not res!554997) (not e!449763))))

(assert (=> b!812497 (= res!554997 (validKeyInArray!0 k0!2044))))

(declare-fun b!812498 () Bool)

(declare-fun res!554991 () Bool)

(assert (=> b!812498 (=> (not res!554991) (not e!449763))))

(declare-fun arrayContainsKey!0 (array!44095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!812498 (= res!554991 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!812499 () Bool)

(declare-fun e!449767 () Bool)

(assert (=> b!812499 (= e!449764 e!449767)))

(declare-fun res!554989 () Bool)

(assert (=> b!812499 (=> (not res!554989) (not e!449767))))

(assert (=> b!812499 (= res!554989 (= (seekEntryOrOpen!0 lt!364275 lt!364276 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!364275 lt!364276 mask!3266)))))

(assert (=> b!812499 (= lt!364275 (select (store (arr!21112 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!812499 (= lt!364276 (array!44096 (store (arr!21112 a!3170) i!1163 k0!2044) (size!21532 a!3170)))))

(declare-fun b!812500 () Bool)

(declare-fun res!554987 () Bool)

(assert (=> b!812500 (=> (not res!554987) (not e!449763))))

(assert (=> b!812500 (= res!554987 (and (= (size!21532 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21532 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21532 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!554988 () Bool)

(assert (=> start!69824 (=> (not res!554988) (not e!449763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69824 (= res!554988 (validMask!0 mask!3266))))

(assert (=> start!69824 e!449763))

(assert (=> start!69824 true))

(declare-fun array_inv!16971 (array!44095) Bool)

(assert (=> start!69824 (array_inv!16971 a!3170)))

(declare-fun b!812492 () Bool)

(declare-fun res!554993 () Bool)

(assert (=> b!812492 (=> (not res!554993) (not e!449764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44095 (_ BitVec 32)) Bool)

(assert (=> b!812492 (= res!554993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!812501 () Bool)

(assert (=> b!812501 (= e!449767 e!449766)))

(declare-fun res!554992 () Bool)

(assert (=> b!812501 (=> (not res!554992) (not e!449766))))

(declare-fun lt!364274 () SeekEntryResult!8659)

(declare-fun lt!364271 () SeekEntryResult!8659)

(assert (=> b!812501 (= res!554992 (and (= lt!364274 lt!364271) (= lt!364271 (Found!8659 j!153)) (not (= (select (arr!21112 a!3170) index!1236) (select (arr!21112 a!3170) j!153)))))))

(assert (=> b!812501 (= lt!364271 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21112 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!812501 (= lt!364274 (seekEntryOrOpen!0 (select (arr!21112 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!812502 () Bool)

(declare-fun res!554996 () Bool)

(assert (=> b!812502 (=> (not res!554996) (not e!449764))))

(declare-datatypes ((List!14982 0))(
  ( (Nil!14979) (Cons!14978 (h!16113 (_ BitVec 64)) (t!21289 List!14982)) )
))
(declare-fun arrayNoDuplicates!0 (array!44095 (_ BitVec 32) List!14982) Bool)

(assert (=> b!812502 (= res!554996 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14979))))

(assert (= (and start!69824 res!554988) b!812500))

(assert (= (and b!812500 res!554987) b!812496))

(assert (= (and b!812496 res!554995) b!812497))

(assert (= (and b!812497 res!554997) b!812498))

(assert (= (and b!812498 res!554991) b!812494))

(assert (= (and b!812494 res!554994) b!812492))

(assert (= (and b!812492 res!554993) b!812502))

(assert (= (and b!812502 res!554996) b!812493))

(assert (= (and b!812493 res!554990) b!812499))

(assert (= (and b!812499 res!554989) b!812501))

(assert (= (and b!812501 res!554992) b!812495))

(declare-fun m!755293 () Bool)

(assert (=> b!812492 m!755293))

(declare-fun m!755295 () Bool)

(assert (=> start!69824 m!755295))

(declare-fun m!755297 () Bool)

(assert (=> start!69824 m!755297))

(declare-fun m!755299 () Bool)

(assert (=> b!812495 m!755299))

(declare-fun m!755301 () Bool)

(assert (=> b!812495 m!755301))

(declare-fun m!755303 () Bool)

(assert (=> b!812495 m!755303))

(assert (=> b!812495 m!755299))

(declare-fun m!755305 () Bool)

(assert (=> b!812495 m!755305))

(declare-fun m!755307 () Bool)

(assert (=> b!812495 m!755307))

(declare-fun m!755309 () Bool)

(assert (=> b!812493 m!755309))

(declare-fun m!755311 () Bool)

(assert (=> b!812493 m!755311))

(declare-fun m!755313 () Bool)

(assert (=> b!812501 m!755313))

(assert (=> b!812501 m!755299))

(assert (=> b!812501 m!755299))

(declare-fun m!755315 () Bool)

(assert (=> b!812501 m!755315))

(assert (=> b!812501 m!755299))

(declare-fun m!755317 () Bool)

(assert (=> b!812501 m!755317))

(declare-fun m!755319 () Bool)

(assert (=> b!812497 m!755319))

(declare-fun m!755321 () Bool)

(assert (=> b!812498 m!755321))

(declare-fun m!755323 () Bool)

(assert (=> b!812494 m!755323))

(declare-fun m!755325 () Bool)

(assert (=> b!812499 m!755325))

(declare-fun m!755327 () Bool)

(assert (=> b!812499 m!755327))

(declare-fun m!755329 () Bool)

(assert (=> b!812499 m!755329))

(declare-fun m!755331 () Bool)

(assert (=> b!812499 m!755331))

(assert (=> b!812496 m!755299))

(assert (=> b!812496 m!755299))

(declare-fun m!755333 () Bool)

(assert (=> b!812496 m!755333))

(declare-fun m!755335 () Bool)

(assert (=> b!812502 m!755335))

(check-sat (not b!812494) (not b!812492) (not b!812502) (not start!69824) (not b!812498) (not b!812496) (not b!812495) (not b!812497) (not b!812501) (not b!812499))
(check-sat)
