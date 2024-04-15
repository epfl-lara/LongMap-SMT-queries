; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68862 () Bool)

(assert start!68862)

(declare-fun b!803047 () Bool)

(declare-fun e!444978 () Bool)

(declare-fun e!444980 () Bool)

(assert (=> b!803047 (= e!444978 e!444980)))

(declare-fun res!547707 () Bool)

(assert (=> b!803047 (=> (not res!547707) (not e!444980))))

(declare-datatypes ((SeekEntryResult!8503 0))(
  ( (MissingZero!8503 (index!36380 (_ BitVec 32))) (Found!8503 (index!36381 (_ BitVec 32))) (Intermediate!8503 (undefined!9315 Bool) (index!36382 (_ BitVec 32)) (x!67232 (_ BitVec 32))) (Undefined!8503) (MissingVacant!8503 (index!36383 (_ BitVec 32))) )
))
(declare-fun lt!359258 () SeekEntryResult!8503)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803047 (= res!547707 (or (= lt!359258 (MissingZero!8503 i!1163)) (= lt!359258 (MissingVacant!8503 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43669 0))(
  ( (array!43670 (arr!20915 (Array (_ BitVec 32) (_ BitVec 64))) (size!21336 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43669)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43669 (_ BitVec 32)) SeekEntryResult!8503)

(assert (=> b!803047 (= lt!359258 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803048 () Bool)

(declare-fun e!444981 () Bool)

(declare-fun e!444982 () Bool)

(assert (=> b!803048 (= e!444981 e!444982)))

(declare-fun res!547706 () Bool)

(assert (=> b!803048 (=> (not res!547706) (not e!444982))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!359261 () SeekEntryResult!8503)

(declare-fun lt!359256 () SeekEntryResult!8503)

(assert (=> b!803048 (= res!547706 (and (= lt!359256 lt!359261) (= lt!359261 (Found!8503 j!153)) (not (= (select (arr!20915 a!3170) index!1236) (select (arr!20915 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43669 (_ BitVec 32)) SeekEntryResult!8503)

(assert (=> b!803048 (= lt!359261 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20915 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803048 (= lt!359256 (seekEntryOrOpen!0 (select (arr!20915 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803049 () Bool)

(declare-fun res!547709 () Bool)

(assert (=> b!803049 (=> (not res!547709) (not e!444980))))

(declare-datatypes ((List!14917 0))(
  ( (Nil!14914) (Cons!14913 (h!16042 (_ BitVec 64)) (t!21223 List!14917)) )
))
(declare-fun arrayNoDuplicates!0 (array!43669 (_ BitVec 32) List!14917) Bool)

(assert (=> b!803049 (= res!547709 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14914))))

(declare-fun b!803050 () Bool)

(declare-fun res!547715 () Bool)

(assert (=> b!803050 (=> (not res!547715) (not e!444978))))

(declare-fun arrayContainsKey!0 (array!43669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803050 (= res!547715 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803051 () Bool)

(assert (=> b!803051 (= e!444982 (not true))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359255 () (_ BitVec 32))

(declare-fun lt!359260 () array!43669)

(declare-fun lt!359257 () (_ BitVec 64))

(assert (=> b!803051 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359255 vacantAfter!23 lt!359257 lt!359260 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359255 vacantBefore!23 (select (arr!20915 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27520 0))(
  ( (Unit!27521) )
))
(declare-fun lt!359259 () Unit!27520)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43669 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27520)

(assert (=> b!803051 (= lt!359259 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359255 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803051 (= lt!359255 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803052 () Bool)

(declare-fun res!547713 () Bool)

(assert (=> b!803052 (=> (not res!547713) (not e!444978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803052 (= res!547713 (validKeyInArray!0 k0!2044))))

(declare-fun res!547712 () Bool)

(assert (=> start!68862 (=> (not res!547712) (not e!444978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68862 (= res!547712 (validMask!0 mask!3266))))

(assert (=> start!68862 e!444978))

(assert (=> start!68862 true))

(declare-fun array_inv!16798 (array!43669) Bool)

(assert (=> start!68862 (array_inv!16798 a!3170)))

(declare-fun b!803053 () Bool)

(declare-fun res!547714 () Bool)

(assert (=> b!803053 (=> (not res!547714) (not e!444980))))

(assert (=> b!803053 (= res!547714 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21336 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20915 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21336 a!3170)) (= (select (arr!20915 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803054 () Bool)

(declare-fun res!547711 () Bool)

(assert (=> b!803054 (=> (not res!547711) (not e!444978))))

(assert (=> b!803054 (= res!547711 (validKeyInArray!0 (select (arr!20915 a!3170) j!153)))))

(declare-fun b!803055 () Bool)

(declare-fun res!547716 () Bool)

(assert (=> b!803055 (=> (not res!547716) (not e!444980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43669 (_ BitVec 32)) Bool)

(assert (=> b!803055 (= res!547716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803056 () Bool)

(assert (=> b!803056 (= e!444980 e!444981)))

(declare-fun res!547708 () Bool)

(assert (=> b!803056 (=> (not res!547708) (not e!444981))))

(assert (=> b!803056 (= res!547708 (= (seekEntryOrOpen!0 lt!359257 lt!359260 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359257 lt!359260 mask!3266)))))

(assert (=> b!803056 (= lt!359257 (select (store (arr!20915 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803056 (= lt!359260 (array!43670 (store (arr!20915 a!3170) i!1163 k0!2044) (size!21336 a!3170)))))

(declare-fun b!803057 () Bool)

(declare-fun res!547710 () Bool)

(assert (=> b!803057 (=> (not res!547710) (not e!444978))))

(assert (=> b!803057 (= res!547710 (and (= (size!21336 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21336 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21336 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68862 res!547712) b!803057))

(assert (= (and b!803057 res!547710) b!803054))

(assert (= (and b!803054 res!547711) b!803052))

(assert (= (and b!803052 res!547713) b!803050))

(assert (= (and b!803050 res!547715) b!803047))

(assert (= (and b!803047 res!547707) b!803055))

(assert (= (and b!803055 res!547716) b!803049))

(assert (= (and b!803049 res!547709) b!803053))

(assert (= (and b!803053 res!547714) b!803056))

(assert (= (and b!803056 res!547708) b!803048))

(assert (= (and b!803048 res!547706) b!803051))

(declare-fun m!744241 () Bool)

(assert (=> b!803049 m!744241))

(declare-fun m!744243 () Bool)

(assert (=> b!803055 m!744243))

(declare-fun m!744245 () Bool)

(assert (=> b!803048 m!744245))

(declare-fun m!744247 () Bool)

(assert (=> b!803048 m!744247))

(assert (=> b!803048 m!744247))

(declare-fun m!744249 () Bool)

(assert (=> b!803048 m!744249))

(assert (=> b!803048 m!744247))

(declare-fun m!744251 () Bool)

(assert (=> b!803048 m!744251))

(declare-fun m!744253 () Bool)

(assert (=> b!803052 m!744253))

(declare-fun m!744255 () Bool)

(assert (=> b!803047 m!744255))

(assert (=> b!803051 m!744247))

(declare-fun m!744257 () Bool)

(assert (=> b!803051 m!744257))

(assert (=> b!803051 m!744247))

(declare-fun m!744259 () Bool)

(assert (=> b!803051 m!744259))

(declare-fun m!744261 () Bool)

(assert (=> b!803051 m!744261))

(declare-fun m!744263 () Bool)

(assert (=> b!803051 m!744263))

(declare-fun m!744265 () Bool)

(assert (=> b!803053 m!744265))

(declare-fun m!744267 () Bool)

(assert (=> b!803053 m!744267))

(assert (=> b!803054 m!744247))

(assert (=> b!803054 m!744247))

(declare-fun m!744269 () Bool)

(assert (=> b!803054 m!744269))

(declare-fun m!744271 () Bool)

(assert (=> b!803056 m!744271))

(declare-fun m!744273 () Bool)

(assert (=> b!803056 m!744273))

(declare-fun m!744275 () Bool)

(assert (=> b!803056 m!744275))

(declare-fun m!744277 () Bool)

(assert (=> b!803056 m!744277))

(declare-fun m!744279 () Bool)

(assert (=> start!68862 m!744279))

(declare-fun m!744281 () Bool)

(assert (=> start!68862 m!744281))

(declare-fun m!744283 () Bool)

(assert (=> b!803050 m!744283))

(check-sat (not b!803050) (not b!803054) (not b!803049) (not b!803047) (not start!68862) (not b!803048) (not b!803055) (not b!803052) (not b!803051) (not b!803056))
(check-sat)
