; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68852 () Bool)

(assert start!68852)

(declare-fun res!547288 () Bool)

(declare-fun e!444867 () Bool)

(assert (=> start!68852 (=> (not res!547288) (not e!444867))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68852 (= res!547288 (validMask!0 mask!3266))))

(assert (=> start!68852 e!444867))

(assert (=> start!68852 true))

(declare-datatypes ((array!43642 0))(
  ( (array!43643 (arr!20901 (Array (_ BitVec 32) (_ BitVec 64))) (size!21322 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43642)

(declare-fun array_inv!16697 (array!43642) Bool)

(assert (=> start!68852 (array_inv!16697 a!3170)))

(declare-fun b!802759 () Bool)

(declare-fun res!547287 () Bool)

(declare-fun e!444868 () Bool)

(assert (=> b!802759 (=> (not res!547287) (not e!444868))))

(declare-datatypes ((List!14864 0))(
  ( (Nil!14861) (Cons!14860 (h!15989 (_ BitVec 64)) (t!21179 List!14864)) )
))
(declare-fun arrayNoDuplicates!0 (array!43642 (_ BitVec 32) List!14864) Bool)

(assert (=> b!802759 (= res!547287 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14861))))

(declare-fun b!802760 () Bool)

(declare-fun e!444866 () Bool)

(assert (=> b!802760 (= e!444868 e!444866)))

(declare-fun res!547278 () Bool)

(assert (=> b!802760 (=> (not res!547278) (not e!444866))))

(declare-datatypes ((SeekEntryResult!8492 0))(
  ( (MissingZero!8492 (index!36336 (_ BitVec 32))) (Found!8492 (index!36337 (_ BitVec 32))) (Intermediate!8492 (undefined!9304 Bool) (index!36338 (_ BitVec 32)) (x!67186 (_ BitVec 32))) (Undefined!8492) (MissingVacant!8492 (index!36339 (_ BitVec 32))) )
))
(declare-fun lt!359087 () SeekEntryResult!8492)

(declare-fun lt!359086 () SeekEntryResult!8492)

(assert (=> b!802760 (= res!547278 (= lt!359087 lt!359086))))

(declare-fun lt!359083 () array!43642)

(declare-fun lt!359082 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43642 (_ BitVec 32)) SeekEntryResult!8492)

(assert (=> b!802760 (= lt!359086 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359082 lt!359083 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43642 (_ BitVec 32)) SeekEntryResult!8492)

(assert (=> b!802760 (= lt!359087 (seekEntryOrOpen!0 lt!359082 lt!359083 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802760 (= lt!359082 (select (store (arr!20901 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802760 (= lt!359083 (array!43643 (store (arr!20901 a!3170) i!1163 k!2044) (size!21322 a!3170)))))

(declare-fun b!802761 () Bool)

(declare-fun e!444864 () Bool)

(declare-fun e!444869 () Bool)

(assert (=> b!802761 (= e!444864 e!444869)))

(declare-fun res!547280 () Bool)

(assert (=> b!802761 (=> (not res!547280) (not e!444869))))

(declare-fun lt!359085 () SeekEntryResult!8492)

(declare-fun lt!359080 () SeekEntryResult!8492)

(assert (=> b!802761 (= res!547280 (and (= lt!359085 lt!359080) (not (= (select (arr!20901 a!3170) index!1236) (select (arr!20901 a!3170) j!153)))))))

(assert (=> b!802761 (= lt!359080 (Found!8492 j!153))))

(declare-fun b!802762 () Bool)

(declare-fun res!547283 () Bool)

(assert (=> b!802762 (=> (not res!547283) (not e!444868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43642 (_ BitVec 32)) Bool)

(assert (=> b!802762 (= res!547283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802763 () Bool)

(declare-fun res!547289 () Bool)

(assert (=> b!802763 (=> (not res!547289) (not e!444867))))

(declare-fun arrayContainsKey!0 (array!43642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802763 (= res!547289 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802764 () Bool)

(declare-fun res!547286 () Bool)

(assert (=> b!802764 (=> (not res!547286) (not e!444867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802764 (= res!547286 (validKeyInArray!0 (select (arr!20901 a!3170) j!153)))))

(declare-fun b!802765 () Bool)

(declare-fun res!547285 () Bool)

(assert (=> b!802765 (=> (not res!547285) (not e!444867))))

(assert (=> b!802765 (= res!547285 (and (= (size!21322 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21322 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21322 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802766 () Bool)

(assert (=> b!802766 (= e!444866 e!444864)))

(declare-fun res!547281 () Bool)

(assert (=> b!802766 (=> (not res!547281) (not e!444864))))

(declare-fun lt!359078 () SeekEntryResult!8492)

(assert (=> b!802766 (= res!547281 (= lt!359078 lt!359085))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802766 (= lt!359085 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20901 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802766 (= lt!359078 (seekEntryOrOpen!0 (select (arr!20901 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802767 () Bool)

(declare-fun res!547282 () Bool)

(assert (=> b!802767 (=> (not res!547282) (not e!444867))))

(assert (=> b!802767 (= res!547282 (validKeyInArray!0 k!2044))))

(declare-fun b!802768 () Bool)

(assert (=> b!802768 (= e!444867 e!444868)))

(declare-fun res!547279 () Bool)

(assert (=> b!802768 (=> (not res!547279) (not e!444868))))

(declare-fun lt!359084 () SeekEntryResult!8492)

(assert (=> b!802768 (= res!547279 (or (= lt!359084 (MissingZero!8492 i!1163)) (= lt!359084 (MissingVacant!8492 i!1163))))))

(assert (=> b!802768 (= lt!359084 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802769 () Bool)

(assert (=> b!802769 (= e!444869 (not (or (not (= lt!359086 lt!359080)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359079 () (_ BitVec 32))

(assert (=> b!802769 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359079 vacantAfter!23 lt!359082 lt!359083 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359079 vacantBefore!23 (select (arr!20901 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27524 0))(
  ( (Unit!27525) )
))
(declare-fun lt!359081 () Unit!27524)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43642 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27524)

(assert (=> b!802769 (= lt!359081 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359079 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802769 (= lt!359079 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802770 () Bool)

(declare-fun res!547284 () Bool)

(assert (=> b!802770 (=> (not res!547284) (not e!444868))))

(assert (=> b!802770 (= res!547284 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21322 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20901 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21322 a!3170)) (= (select (arr!20901 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68852 res!547288) b!802765))

(assert (= (and b!802765 res!547285) b!802764))

(assert (= (and b!802764 res!547286) b!802767))

(assert (= (and b!802767 res!547282) b!802763))

(assert (= (and b!802763 res!547289) b!802768))

(assert (= (and b!802768 res!547279) b!802762))

(assert (= (and b!802762 res!547283) b!802759))

(assert (= (and b!802759 res!547287) b!802770))

(assert (= (and b!802770 res!547284) b!802760))

(assert (= (and b!802760 res!547278) b!802766))

(assert (= (and b!802766 res!547281) b!802761))

(assert (= (and b!802761 res!547280) b!802769))

(declare-fun m!744305 () Bool)

(assert (=> b!802770 m!744305))

(declare-fun m!744307 () Bool)

(assert (=> b!802770 m!744307))

(declare-fun m!744309 () Bool)

(assert (=> b!802764 m!744309))

(assert (=> b!802764 m!744309))

(declare-fun m!744311 () Bool)

(assert (=> b!802764 m!744311))

(declare-fun m!744313 () Bool)

(assert (=> b!802761 m!744313))

(assert (=> b!802761 m!744309))

(declare-fun m!744315 () Bool)

(assert (=> start!68852 m!744315))

(declare-fun m!744317 () Bool)

(assert (=> start!68852 m!744317))

(declare-fun m!744319 () Bool)

(assert (=> b!802768 m!744319))

(assert (=> b!802766 m!744309))

(assert (=> b!802766 m!744309))

(declare-fun m!744321 () Bool)

(assert (=> b!802766 m!744321))

(assert (=> b!802766 m!744309))

(declare-fun m!744323 () Bool)

(assert (=> b!802766 m!744323))

(declare-fun m!744325 () Bool)

(assert (=> b!802762 m!744325))

(declare-fun m!744327 () Bool)

(assert (=> b!802759 m!744327))

(declare-fun m!744329 () Bool)

(assert (=> b!802760 m!744329))

(declare-fun m!744331 () Bool)

(assert (=> b!802760 m!744331))

(declare-fun m!744333 () Bool)

(assert (=> b!802760 m!744333))

(declare-fun m!744335 () Bool)

(assert (=> b!802760 m!744335))

(declare-fun m!744337 () Bool)

(assert (=> b!802767 m!744337))

(declare-fun m!744339 () Bool)

(assert (=> b!802763 m!744339))

(assert (=> b!802769 m!744309))

(declare-fun m!744341 () Bool)

(assert (=> b!802769 m!744341))

(declare-fun m!744343 () Bool)

(assert (=> b!802769 m!744343))

(declare-fun m!744345 () Bool)

(assert (=> b!802769 m!744345))

(assert (=> b!802769 m!744309))

(declare-fun m!744347 () Bool)

(assert (=> b!802769 m!744347))

(push 1)

(assert (not b!802768))

(assert (not b!802762))

(assert (not b!802759))

(assert (not start!68852))

(assert (not b!802760))

(assert (not b!802764))

(assert (not b!802769))

(assert (not b!802767))

(assert (not b!802766))

(assert (not b!802763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

