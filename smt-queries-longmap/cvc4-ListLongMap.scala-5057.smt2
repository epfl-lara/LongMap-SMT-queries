; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68856 () Bool)

(assert start!68856)

(declare-fun b!802831 () Bool)

(declare-fun res!547361 () Bool)

(declare-fun e!444900 () Bool)

(assert (=> b!802831 (=> (not res!547361) (not e!444900))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43646 0))(
  ( (array!43647 (arr!20903 (Array (_ BitVec 32) (_ BitVec 64))) (size!21324 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43646)

(assert (=> b!802831 (= res!547361 (and (= (size!21324 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21324 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21324 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802833 () Bool)

(declare-fun res!547352 () Bool)

(assert (=> b!802833 (=> (not res!547352) (not e!444900))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802833 (= res!547352 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802834 () Bool)

(declare-fun res!547350 () Bool)

(declare-fun e!444903 () Bool)

(assert (=> b!802834 (=> (not res!547350) (not e!444903))))

(declare-datatypes ((List!14866 0))(
  ( (Nil!14863) (Cons!14862 (h!15991 (_ BitVec 64)) (t!21181 List!14866)) )
))
(declare-fun arrayNoDuplicates!0 (array!43646 (_ BitVec 32) List!14866) Bool)

(assert (=> b!802834 (= res!547350 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14863))))

(declare-fun b!802835 () Bool)

(declare-fun e!444902 () Bool)

(declare-fun e!444905 () Bool)

(assert (=> b!802835 (= e!444902 e!444905)))

(declare-fun res!547355 () Bool)

(assert (=> b!802835 (=> (not res!547355) (not e!444905))))

(declare-datatypes ((SeekEntryResult!8494 0))(
  ( (MissingZero!8494 (index!36344 (_ BitVec 32))) (Found!8494 (index!36345 (_ BitVec 32))) (Intermediate!8494 (undefined!9306 Bool) (index!36346 (_ BitVec 32)) (x!67188 (_ BitVec 32))) (Undefined!8494) (MissingVacant!8494 (index!36347 (_ BitVec 32))) )
))
(declare-fun lt!359143 () SeekEntryResult!8494)

(declare-fun lt!359146 () SeekEntryResult!8494)

(assert (=> b!802835 (= res!547355 (= lt!359143 lt!359146))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43646 (_ BitVec 32)) SeekEntryResult!8494)

(assert (=> b!802835 (= lt!359146 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20903 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43646 (_ BitVec 32)) SeekEntryResult!8494)

(assert (=> b!802835 (= lt!359143 (seekEntryOrOpen!0 (select (arr!20903 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802836 () Bool)

(declare-fun res!547358 () Bool)

(assert (=> b!802836 (=> (not res!547358) (not e!444903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43646 (_ BitVec 32)) Bool)

(assert (=> b!802836 (= res!547358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802837 () Bool)

(declare-fun e!444901 () Bool)

(assert (=> b!802837 (= e!444905 e!444901)))

(declare-fun res!547354 () Bool)

(assert (=> b!802837 (=> (not res!547354) (not e!444901))))

(declare-fun lt!359141 () SeekEntryResult!8494)

(assert (=> b!802837 (= res!547354 (and (= lt!359146 lt!359141) (not (= (select (arr!20903 a!3170) index!1236) (select (arr!20903 a!3170) j!153)))))))

(assert (=> b!802837 (= lt!359141 (Found!8494 j!153))))

(declare-fun b!802838 () Bool)

(assert (=> b!802838 (= e!444903 e!444902)))

(declare-fun res!547353 () Bool)

(assert (=> b!802838 (=> (not res!547353) (not e!444902))))

(declare-fun lt!359147 () SeekEntryResult!8494)

(declare-fun lt!359139 () SeekEntryResult!8494)

(assert (=> b!802838 (= res!547353 (= lt!359147 lt!359139))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359138 () (_ BitVec 64))

(declare-fun lt!359144 () array!43646)

(assert (=> b!802838 (= lt!359139 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359138 lt!359144 mask!3266))))

(assert (=> b!802838 (= lt!359147 (seekEntryOrOpen!0 lt!359138 lt!359144 mask!3266))))

(assert (=> b!802838 (= lt!359138 (select (store (arr!20903 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802838 (= lt!359144 (array!43647 (store (arr!20903 a!3170) i!1163 k!2044) (size!21324 a!3170)))))

(declare-fun b!802839 () Bool)

(declare-fun res!547357 () Bool)

(assert (=> b!802839 (=> (not res!547357) (not e!444900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802839 (= res!547357 (validKeyInArray!0 k!2044))))

(declare-fun b!802840 () Bool)

(assert (=> b!802840 (= e!444900 e!444903)))

(declare-fun res!547356 () Bool)

(assert (=> b!802840 (=> (not res!547356) (not e!444903))))

(declare-fun lt!359140 () SeekEntryResult!8494)

(assert (=> b!802840 (= res!547356 (or (= lt!359140 (MissingZero!8494 i!1163)) (= lt!359140 (MissingVacant!8494 i!1163))))))

(assert (=> b!802840 (= lt!359140 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802841 () Bool)

(declare-fun res!547360 () Bool)

(assert (=> b!802841 (=> (not res!547360) (not e!444900))))

(assert (=> b!802841 (= res!547360 (validKeyInArray!0 (select (arr!20903 a!3170) j!153)))))

(declare-fun b!802842 () Bool)

(declare-fun res!547359 () Bool)

(assert (=> b!802842 (=> (not res!547359) (not e!444903))))

(assert (=> b!802842 (= res!547359 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21324 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20903 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21324 a!3170)) (= (select (arr!20903 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802832 () Bool)

(assert (=> b!802832 (= e!444901 (not (or (not (= lt!359139 lt!359141)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359142 () (_ BitVec 32))

(assert (=> b!802832 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359142 vacantAfter!23 lt!359138 lt!359144 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359142 vacantBefore!23 (select (arr!20903 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27528 0))(
  ( (Unit!27529) )
))
(declare-fun lt!359145 () Unit!27528)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43646 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27528)

(assert (=> b!802832 (= lt!359145 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359142 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802832 (= lt!359142 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!547351 () Bool)

(assert (=> start!68856 (=> (not res!547351) (not e!444900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68856 (= res!547351 (validMask!0 mask!3266))))

(assert (=> start!68856 e!444900))

(assert (=> start!68856 true))

(declare-fun array_inv!16699 (array!43646) Bool)

(assert (=> start!68856 (array_inv!16699 a!3170)))

(assert (= (and start!68856 res!547351) b!802831))

(assert (= (and b!802831 res!547361) b!802841))

(assert (= (and b!802841 res!547360) b!802839))

(assert (= (and b!802839 res!547357) b!802833))

(assert (= (and b!802833 res!547352) b!802840))

(assert (= (and b!802840 res!547356) b!802836))

(assert (= (and b!802836 res!547358) b!802834))

(assert (= (and b!802834 res!547350) b!802842))

(assert (= (and b!802842 res!547359) b!802838))

(assert (= (and b!802838 res!547353) b!802835))

(assert (= (and b!802835 res!547355) b!802837))

(assert (= (and b!802837 res!547354) b!802832))

(declare-fun m!744393 () Bool)

(assert (=> start!68856 m!744393))

(declare-fun m!744395 () Bool)

(assert (=> start!68856 m!744395))

(declare-fun m!744397 () Bool)

(assert (=> b!802832 m!744397))

(declare-fun m!744399 () Bool)

(assert (=> b!802832 m!744399))

(declare-fun m!744401 () Bool)

(assert (=> b!802832 m!744401))

(declare-fun m!744403 () Bool)

(assert (=> b!802832 m!744403))

(assert (=> b!802832 m!744397))

(declare-fun m!744405 () Bool)

(assert (=> b!802832 m!744405))

(declare-fun m!744407 () Bool)

(assert (=> b!802840 m!744407))

(assert (=> b!802841 m!744397))

(assert (=> b!802841 m!744397))

(declare-fun m!744409 () Bool)

(assert (=> b!802841 m!744409))

(assert (=> b!802835 m!744397))

(assert (=> b!802835 m!744397))

(declare-fun m!744411 () Bool)

(assert (=> b!802835 m!744411))

(assert (=> b!802835 m!744397))

(declare-fun m!744413 () Bool)

(assert (=> b!802835 m!744413))

(declare-fun m!744415 () Bool)

(assert (=> b!802837 m!744415))

(assert (=> b!802837 m!744397))

(declare-fun m!744417 () Bool)

(assert (=> b!802834 m!744417))

(declare-fun m!744419 () Bool)

(assert (=> b!802833 m!744419))

(declare-fun m!744421 () Bool)

(assert (=> b!802836 m!744421))

(declare-fun m!744423 () Bool)

(assert (=> b!802839 m!744423))

(declare-fun m!744425 () Bool)

(assert (=> b!802838 m!744425))

(declare-fun m!744427 () Bool)

(assert (=> b!802838 m!744427))

(declare-fun m!744429 () Bool)

(assert (=> b!802838 m!744429))

(declare-fun m!744431 () Bool)

(assert (=> b!802838 m!744431))

(declare-fun m!744433 () Bool)

(assert (=> b!802842 m!744433))

(declare-fun m!744435 () Bool)

(assert (=> b!802842 m!744435))

(push 1)

(assert (not b!802835))

(assert (not b!802836))

(assert (not b!802834))

(assert (not b!802840))

(assert (not start!68856))

(assert (not b!802833))

(assert (not b!802841))

(assert (not b!802839))

(assert (not b!802838))

(assert (not b!802832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

