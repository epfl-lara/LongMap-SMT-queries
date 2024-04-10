; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68850 () Bool)

(assert start!68850)

(declare-fun b!802724 () Bool)

(declare-fun e!444850 () Bool)

(declare-fun e!444851 () Bool)

(assert (=> b!802724 (= e!444850 e!444851)))

(declare-fun res!547250 () Bool)

(assert (=> b!802724 (=> (not res!547250) (not e!444851))))

(declare-datatypes ((SeekEntryResult!8491 0))(
  ( (MissingZero!8491 (index!36332 (_ BitVec 32))) (Found!8491 (index!36333 (_ BitVec 32))) (Intermediate!8491 (undefined!9303 Bool) (index!36334 (_ BitVec 32)) (x!67177 (_ BitVec 32))) (Undefined!8491) (MissingVacant!8491 (index!36335 (_ BitVec 32))) )
))
(declare-fun lt!359052 () SeekEntryResult!8491)

(declare-datatypes ((array!43640 0))(
  ( (array!43641 (arr!20900 (Array (_ BitVec 32) (_ BitVec 64))) (size!21321 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43640)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359056 () SeekEntryResult!8491)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802724 (= res!547250 (and (= lt!359056 lt!359052) (= lt!359052 (Found!8491 j!153)) (not (= (select (arr!20900 a!3170) index!1236) (select (arr!20900 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43640 (_ BitVec 32)) SeekEntryResult!8491)

(assert (=> b!802724 (= lt!359052 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20900 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43640 (_ BitVec 32)) SeekEntryResult!8491)

(assert (=> b!802724 (= lt!359056 (seekEntryOrOpen!0 (select (arr!20900 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802725 () Bool)

(declare-fun res!547248 () Bool)

(declare-fun e!444848 () Bool)

(assert (=> b!802725 (=> (not res!547248) (not e!444848))))

(declare-datatypes ((List!14863 0))(
  ( (Nil!14860) (Cons!14859 (h!15988 (_ BitVec 64)) (t!21178 List!14863)) )
))
(declare-fun arrayNoDuplicates!0 (array!43640 (_ BitVec 32) List!14863) Bool)

(assert (=> b!802725 (= res!547248 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14860))))

(declare-fun b!802726 () Bool)

(declare-fun res!547246 () Bool)

(assert (=> b!802726 (=> (not res!547246) (not e!444848))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802726 (= res!547246 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21321 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20900 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21321 a!3170)) (= (select (arr!20900 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802727 () Bool)

(declare-fun res!547244 () Bool)

(declare-fun e!444847 () Bool)

(assert (=> b!802727 (=> (not res!547244) (not e!444847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802727 (= res!547244 (validKeyInArray!0 (select (arr!20900 a!3170) j!153)))))

(declare-fun b!802728 () Bool)

(assert (=> b!802728 (= e!444848 e!444850)))

(declare-fun res!547251 () Bool)

(assert (=> b!802728 (=> (not res!547251) (not e!444850))))

(declare-fun lt!359057 () array!43640)

(declare-fun lt!359053 () (_ BitVec 64))

(assert (=> b!802728 (= res!547251 (= (seekEntryOrOpen!0 lt!359053 lt!359057 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359053 lt!359057 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!802728 (= lt!359053 (select (store (arr!20900 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802728 (= lt!359057 (array!43641 (store (arr!20900 a!3170) i!1163 k!2044) (size!21321 a!3170)))))

(declare-fun b!802729 () Bool)

(declare-fun res!547247 () Bool)

(assert (=> b!802729 (=> (not res!547247) (not e!444847))))

(declare-fun arrayContainsKey!0 (array!43640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802729 (= res!547247 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802730 () Bool)

(assert (=> b!802730 (= e!444851 (not true))))

(declare-fun lt!359051 () (_ BitVec 32))

(assert (=> b!802730 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359051 vacantAfter!23 lt!359053 lt!359057 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359051 vacantBefore!23 (select (arr!20900 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27522 0))(
  ( (Unit!27523) )
))
(declare-fun lt!359055 () Unit!27522)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43640 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27522)

(assert (=> b!802730 (= lt!359055 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359051 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802730 (= lt!359051 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802731 () Bool)

(assert (=> b!802731 (= e!444847 e!444848)))

(declare-fun res!547249 () Bool)

(assert (=> b!802731 (=> (not res!547249) (not e!444848))))

(declare-fun lt!359054 () SeekEntryResult!8491)

(assert (=> b!802731 (= res!547249 (or (= lt!359054 (MissingZero!8491 i!1163)) (= lt!359054 (MissingVacant!8491 i!1163))))))

(assert (=> b!802731 (= lt!359054 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802732 () Bool)

(declare-fun res!547253 () Bool)

(assert (=> b!802732 (=> (not res!547253) (not e!444847))))

(assert (=> b!802732 (= res!547253 (and (= (size!21321 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21321 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21321 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802734 () Bool)

(declare-fun res!547243 () Bool)

(assert (=> b!802734 (=> (not res!547243) (not e!444848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43640 (_ BitVec 32)) Bool)

(assert (=> b!802734 (= res!547243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!547252 () Bool)

(assert (=> start!68850 (=> (not res!547252) (not e!444847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68850 (= res!547252 (validMask!0 mask!3266))))

(assert (=> start!68850 e!444847))

(assert (=> start!68850 true))

(declare-fun array_inv!16696 (array!43640) Bool)

(assert (=> start!68850 (array_inv!16696 a!3170)))

(declare-fun b!802733 () Bool)

(declare-fun res!547245 () Bool)

(assert (=> b!802733 (=> (not res!547245) (not e!444847))))

(assert (=> b!802733 (= res!547245 (validKeyInArray!0 k!2044))))

(assert (= (and start!68850 res!547252) b!802732))

(assert (= (and b!802732 res!547253) b!802727))

(assert (= (and b!802727 res!547244) b!802733))

(assert (= (and b!802733 res!547245) b!802729))

(assert (= (and b!802729 res!547247) b!802731))

(assert (= (and b!802731 res!547249) b!802734))

(assert (= (and b!802734 res!547243) b!802725))

(assert (= (and b!802725 res!547248) b!802726))

(assert (= (and b!802726 res!547246) b!802728))

(assert (= (and b!802728 res!547251) b!802724))

(assert (= (and b!802724 res!547250) b!802730))

(declare-fun m!744261 () Bool)

(assert (=> b!802733 m!744261))

(declare-fun m!744263 () Bool)

(assert (=> b!802724 m!744263))

(declare-fun m!744265 () Bool)

(assert (=> b!802724 m!744265))

(assert (=> b!802724 m!744265))

(declare-fun m!744267 () Bool)

(assert (=> b!802724 m!744267))

(assert (=> b!802724 m!744265))

(declare-fun m!744269 () Bool)

(assert (=> b!802724 m!744269))

(assert (=> b!802727 m!744265))

(assert (=> b!802727 m!744265))

(declare-fun m!744271 () Bool)

(assert (=> b!802727 m!744271))

(declare-fun m!744273 () Bool)

(assert (=> b!802725 m!744273))

(declare-fun m!744275 () Bool)

(assert (=> b!802734 m!744275))

(declare-fun m!744277 () Bool)

(assert (=> start!68850 m!744277))

(declare-fun m!744279 () Bool)

(assert (=> start!68850 m!744279))

(declare-fun m!744281 () Bool)

(assert (=> b!802731 m!744281))

(declare-fun m!744283 () Bool)

(assert (=> b!802729 m!744283))

(assert (=> b!802730 m!744265))

(declare-fun m!744285 () Bool)

(assert (=> b!802730 m!744285))

(declare-fun m!744287 () Bool)

(assert (=> b!802730 m!744287))

(assert (=> b!802730 m!744265))

(declare-fun m!744289 () Bool)

(assert (=> b!802730 m!744289))

(declare-fun m!744291 () Bool)

(assert (=> b!802730 m!744291))

(declare-fun m!744293 () Bool)

(assert (=> b!802726 m!744293))

(declare-fun m!744295 () Bool)

(assert (=> b!802726 m!744295))

(declare-fun m!744297 () Bool)

(assert (=> b!802728 m!744297))

(declare-fun m!744299 () Bool)

(assert (=> b!802728 m!744299))

(declare-fun m!744301 () Bool)

(assert (=> b!802728 m!744301))

(declare-fun m!744303 () Bool)

(assert (=> b!802728 m!744303))

(push 1)

(assert (not b!802729))

(assert (not start!68850))

(assert (not b!802728))

