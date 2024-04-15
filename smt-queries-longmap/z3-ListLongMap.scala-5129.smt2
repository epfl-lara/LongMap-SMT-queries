; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69636 () Bool)

(assert start!69636)

(declare-fun b!811354 () Bool)

(declare-fun e!449041 () Bool)

(declare-fun e!449038 () Bool)

(assert (=> b!811354 (= e!449041 e!449038)))

(declare-fun res!554540 () Bool)

(assert (=> b!811354 (=> (not res!554540) (not e!449038))))

(declare-datatypes ((array!44092 0))(
  ( (array!44093 (arr!21116 (Array (_ BitVec 32) (_ BitVec 64))) (size!21537 (_ BitVec 32))) )
))
(declare-fun lt!363675 () array!44092)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!363676 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8704 0))(
  ( (MissingZero!8704 (index!37187 (_ BitVec 32))) (Found!8704 (index!37188 (_ BitVec 32))) (Intermediate!8704 (undefined!9516 Bool) (index!37189 (_ BitVec 32)) (x!68008 (_ BitVec 32))) (Undefined!8704) (MissingVacant!8704 (index!37190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44092 (_ BitVec 32)) SeekEntryResult!8704)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44092 (_ BitVec 32)) SeekEntryResult!8704)

(assert (=> b!811354 (= res!554540 (= (seekEntryOrOpen!0 lt!363676 lt!363675 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363676 lt!363675 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!44092)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!811354 (= lt!363676 (select (store (arr!21116 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!811354 (= lt!363675 (array!44093 (store (arr!21116 a!3170) i!1163 k0!2044) (size!21537 a!3170)))))

(declare-fun b!811355 () Bool)

(declare-fun e!449037 () Bool)

(assert (=> b!811355 (= e!449038 e!449037)))

(declare-fun res!554545 () Bool)

(assert (=> b!811355 (=> (not res!554545) (not e!449037))))

(declare-fun lt!363679 () SeekEntryResult!8704)

(declare-fun lt!363674 () SeekEntryResult!8704)

(assert (=> b!811355 (= res!554545 (and (= lt!363674 lt!363679) (= lt!363679 (Found!8704 j!153)) (not (= (select (arr!21116 a!3170) index!1236) (select (arr!21116 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!811355 (= lt!363679 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21116 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!811355 (= lt!363674 (seekEntryOrOpen!0 (select (arr!21116 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811356 () Bool)

(declare-fun e!449039 () Bool)

(assert (=> b!811356 (= e!449039 e!449041)))

(declare-fun res!554543 () Bool)

(assert (=> b!811356 (=> (not res!554543) (not e!449041))))

(declare-fun lt!363678 () SeekEntryResult!8704)

(assert (=> b!811356 (= res!554543 (or (= lt!363678 (MissingZero!8704 i!1163)) (= lt!363678 (MissingVacant!8704 i!1163))))))

(assert (=> b!811356 (= lt!363678 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!811357 () Bool)

(declare-fun res!554537 () Bool)

(assert (=> b!811357 (=> (not res!554537) (not e!449039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811357 (= res!554537 (validKeyInArray!0 k0!2044))))

(declare-fun b!811358 () Bool)

(declare-fun res!554547 () Bool)

(assert (=> b!811358 (=> (not res!554547) (not e!449039))))

(assert (=> b!811358 (= res!554547 (and (= (size!21537 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21537 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21537 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!811360 () Bool)

(declare-fun res!554539 () Bool)

(assert (=> b!811360 (=> (not res!554539) (not e!449039))))

(assert (=> b!811360 (= res!554539 (validKeyInArray!0 (select (arr!21116 a!3170) j!153)))))

(declare-fun b!811361 () Bool)

(declare-fun res!554542 () Bool)

(assert (=> b!811361 (=> (not res!554542) (not e!449039))))

(declare-fun arrayContainsKey!0 (array!44092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811361 (= res!554542 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!811362 () Bool)

(declare-fun res!554546 () Bool)

(assert (=> b!811362 (=> (not res!554546) (not e!449041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44092 (_ BitVec 32)) Bool)

(assert (=> b!811362 (= res!554546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!811363 () Bool)

(declare-fun res!554538 () Bool)

(assert (=> b!811363 (=> (not res!554538) (not e!449041))))

(declare-datatypes ((List!15118 0))(
  ( (Nil!15115) (Cons!15114 (h!16243 (_ BitVec 64)) (t!21424 List!15118)) )
))
(declare-fun arrayNoDuplicates!0 (array!44092 (_ BitVec 32) List!15118) Bool)

(assert (=> b!811363 (= res!554538 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15115))))

(declare-fun b!811364 () Bool)

(assert (=> b!811364 (= e!449037 (not true))))

(declare-fun lt!363677 () (_ BitVec 32))

(assert (=> b!811364 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363677 vacantAfter!23 lt!363676 lt!363675 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363677 vacantBefore!23 (select (arr!21116 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27636 0))(
  ( (Unit!27637) )
))
(declare-fun lt!363680 () Unit!27636)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!44092 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27636)

(assert (=> b!811364 (= lt!363680 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!363677 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!811364 (= lt!363677 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!811359 () Bool)

(declare-fun res!554544 () Bool)

(assert (=> b!811359 (=> (not res!554544) (not e!449041))))

(assert (=> b!811359 (= res!554544 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21537 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21116 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21537 a!3170)) (= (select (arr!21116 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!554541 () Bool)

(assert (=> start!69636 (=> (not res!554541) (not e!449039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69636 (= res!554541 (validMask!0 mask!3266))))

(assert (=> start!69636 e!449039))

(assert (=> start!69636 true))

(declare-fun array_inv!16999 (array!44092) Bool)

(assert (=> start!69636 (array_inv!16999 a!3170)))

(assert (= (and start!69636 res!554541) b!811358))

(assert (= (and b!811358 res!554547) b!811360))

(assert (= (and b!811360 res!554539) b!811357))

(assert (= (and b!811357 res!554537) b!811361))

(assert (= (and b!811361 res!554542) b!811356))

(assert (= (and b!811356 res!554543) b!811362))

(assert (= (and b!811362 res!554546) b!811363))

(assert (= (and b!811363 res!554538) b!811359))

(assert (= (and b!811359 res!554544) b!811354))

(assert (= (and b!811354 res!554540) b!811355))

(assert (= (and b!811355 res!554545) b!811364))

(declare-fun m!753265 () Bool)

(assert (=> b!811363 m!753265))

(declare-fun m!753267 () Bool)

(assert (=> b!811355 m!753267))

(declare-fun m!753269 () Bool)

(assert (=> b!811355 m!753269))

(assert (=> b!811355 m!753269))

(declare-fun m!753271 () Bool)

(assert (=> b!811355 m!753271))

(assert (=> b!811355 m!753269))

(declare-fun m!753273 () Bool)

(assert (=> b!811355 m!753273))

(declare-fun m!753275 () Bool)

(assert (=> b!811354 m!753275))

(declare-fun m!753277 () Bool)

(assert (=> b!811354 m!753277))

(declare-fun m!753279 () Bool)

(assert (=> b!811354 m!753279))

(declare-fun m!753281 () Bool)

(assert (=> b!811354 m!753281))

(declare-fun m!753283 () Bool)

(assert (=> b!811357 m!753283))

(assert (=> b!811360 m!753269))

(assert (=> b!811360 m!753269))

(declare-fun m!753285 () Bool)

(assert (=> b!811360 m!753285))

(assert (=> b!811364 m!753269))

(declare-fun m!753287 () Bool)

(assert (=> b!811364 m!753287))

(declare-fun m!753289 () Bool)

(assert (=> b!811364 m!753289))

(declare-fun m!753291 () Bool)

(assert (=> b!811364 m!753291))

(assert (=> b!811364 m!753269))

(declare-fun m!753293 () Bool)

(assert (=> b!811364 m!753293))

(declare-fun m!753295 () Bool)

(assert (=> b!811359 m!753295))

(declare-fun m!753297 () Bool)

(assert (=> b!811359 m!753297))

(declare-fun m!753299 () Bool)

(assert (=> b!811361 m!753299))

(declare-fun m!753301 () Bool)

(assert (=> b!811362 m!753301))

(declare-fun m!753303 () Bool)

(assert (=> start!69636 m!753303))

(declare-fun m!753305 () Bool)

(assert (=> start!69636 m!753305))

(declare-fun m!753307 () Bool)

(assert (=> b!811356 m!753307))

(check-sat (not b!811363) (not b!811354) (not b!811360) (not b!811356) (not b!811362) (not b!811357) (not b!811364) (not b!811355) (not start!69636) (not b!811361))
(check-sat)
