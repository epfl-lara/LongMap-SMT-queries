; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68426 () Bool)

(assert start!68426)

(declare-fun b!795285 () Bool)

(declare-fun res!539804 () Bool)

(declare-fun e!441442 () Bool)

(assert (=> b!795285 (=> (not res!539804) (not e!441442))))

(declare-datatypes ((array!43216 0))(
  ( (array!43217 (arr!20688 (Array (_ BitVec 32) (_ BitVec 64))) (size!21109 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43216)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795285 (= res!539804 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795286 () Bool)

(declare-fun e!441441 () Bool)

(assert (=> b!795286 (= e!441442 e!441441)))

(declare-fun res!539805 () Bool)

(assert (=> b!795286 (=> (not res!539805) (not e!441441))))

(declare-datatypes ((SeekEntryResult!8279 0))(
  ( (MissingZero!8279 (index!35484 (_ BitVec 32))) (Found!8279 (index!35485 (_ BitVec 32))) (Intermediate!8279 (undefined!9091 Bool) (index!35486 (_ BitVec 32)) (x!66405 (_ BitVec 32))) (Undefined!8279) (MissingVacant!8279 (index!35487 (_ BitVec 32))) )
))
(declare-fun lt!354499 () SeekEntryResult!8279)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795286 (= res!539805 (or (= lt!354499 (MissingZero!8279 i!1163)) (= lt!354499 (MissingVacant!8279 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43216 (_ BitVec 32)) SeekEntryResult!8279)

(assert (=> b!795286 (= lt!354499 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795287 () Bool)

(declare-fun res!539812 () Bool)

(assert (=> b!795287 (=> (not res!539812) (not e!441441))))

(declare-datatypes ((List!14651 0))(
  ( (Nil!14648) (Cons!14647 (h!15776 (_ BitVec 64)) (t!20966 List!14651)) )
))
(declare-fun arrayNoDuplicates!0 (array!43216 (_ BitVec 32) List!14651) Bool)

(assert (=> b!795287 (= res!539812 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14648))))

(declare-fun b!795288 () Bool)

(declare-fun e!441443 () Bool)

(assert (=> b!795288 (= e!441441 e!441443)))

(declare-fun res!539811 () Bool)

(assert (=> b!795288 (=> (not res!539811) (not e!441443))))

(declare-fun lt!354497 () array!43216)

(declare-fun lt!354496 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43216 (_ BitVec 32)) SeekEntryResult!8279)

(assert (=> b!795288 (= res!539811 (= (seekEntryOrOpen!0 lt!354496 lt!354497 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354496 lt!354497 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795288 (= lt!354496 (select (store (arr!20688 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795288 (= lt!354497 (array!43217 (store (arr!20688 a!3170) i!1163 k!2044) (size!21109 a!3170)))))

(declare-fun b!795289 () Bool)

(declare-fun res!539813 () Bool)

(assert (=> b!795289 (=> (not res!539813) (not e!441442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795289 (= res!539813 (validKeyInArray!0 (select (arr!20688 a!3170) j!153)))))

(declare-fun b!795290 () Bool)

(declare-fun res!539808 () Bool)

(assert (=> b!795290 (=> (not res!539808) (not e!441441))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795290 (= res!539808 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21109 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20688 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21109 a!3170)) (= (select (arr!20688 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795291 () Bool)

(assert (=> b!795291 (= e!441443 false)))

(declare-fun lt!354500 () SeekEntryResult!8279)

(assert (=> b!795291 (= lt!354500 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20688 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354498 () SeekEntryResult!8279)

(assert (=> b!795291 (= lt!354498 (seekEntryOrOpen!0 (select (arr!20688 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!539810 () Bool)

(assert (=> start!68426 (=> (not res!539810) (not e!441442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68426 (= res!539810 (validMask!0 mask!3266))))

(assert (=> start!68426 e!441442))

(assert (=> start!68426 true))

(declare-fun array_inv!16484 (array!43216) Bool)

(assert (=> start!68426 (array_inv!16484 a!3170)))

(declare-fun b!795292 () Bool)

(declare-fun res!539807 () Bool)

(assert (=> b!795292 (=> (not res!539807) (not e!441442))))

(assert (=> b!795292 (= res!539807 (validKeyInArray!0 k!2044))))

(declare-fun b!795293 () Bool)

(declare-fun res!539809 () Bool)

(assert (=> b!795293 (=> (not res!539809) (not e!441441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43216 (_ BitVec 32)) Bool)

(assert (=> b!795293 (= res!539809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795294 () Bool)

(declare-fun res!539806 () Bool)

(assert (=> b!795294 (=> (not res!539806) (not e!441442))))

(assert (=> b!795294 (= res!539806 (and (= (size!21109 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21109 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21109 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68426 res!539810) b!795294))

(assert (= (and b!795294 res!539806) b!795289))

(assert (= (and b!795289 res!539813) b!795292))

(assert (= (and b!795292 res!539807) b!795285))

(assert (= (and b!795285 res!539804) b!795286))

(assert (= (and b!795286 res!539805) b!795293))

(assert (= (and b!795293 res!539809) b!795287))

(assert (= (and b!795287 res!539812) b!795290))

(assert (= (and b!795290 res!539808) b!795288))

(assert (= (and b!795288 res!539811) b!795291))

(declare-fun m!735899 () Bool)

(assert (=> b!795287 m!735899))

(declare-fun m!735901 () Bool)

(assert (=> start!68426 m!735901))

(declare-fun m!735903 () Bool)

(assert (=> start!68426 m!735903))

(declare-fun m!735905 () Bool)

(assert (=> b!795290 m!735905))

(declare-fun m!735907 () Bool)

(assert (=> b!795290 m!735907))

(declare-fun m!735909 () Bool)

(assert (=> b!795293 m!735909))

(declare-fun m!735911 () Bool)

(assert (=> b!795285 m!735911))

(declare-fun m!735913 () Bool)

(assert (=> b!795292 m!735913))

(declare-fun m!735915 () Bool)

(assert (=> b!795286 m!735915))

(declare-fun m!735917 () Bool)

(assert (=> b!795288 m!735917))

(declare-fun m!735919 () Bool)

(assert (=> b!795288 m!735919))

(declare-fun m!735921 () Bool)

(assert (=> b!795288 m!735921))

(declare-fun m!735923 () Bool)

(assert (=> b!795288 m!735923))

(declare-fun m!735925 () Bool)

(assert (=> b!795289 m!735925))

(assert (=> b!795289 m!735925))

(declare-fun m!735927 () Bool)

(assert (=> b!795289 m!735927))

(assert (=> b!795291 m!735925))

(assert (=> b!795291 m!735925))

(declare-fun m!735929 () Bool)

(assert (=> b!795291 m!735929))

(assert (=> b!795291 m!735925))

(declare-fun m!735931 () Bool)

(assert (=> b!795291 m!735931))

(push 1)

(assert (not b!795289))

(assert (not b!795291))

(assert (not b!795287))

(assert (not b!795293))

(assert (not start!68426))

(assert (not b!795288))

(assert (not b!795285))

(assert (not b!795286))

