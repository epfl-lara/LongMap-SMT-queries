; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68420 () Bool)

(assert start!68420)

(declare-fun b!795196 () Bool)

(declare-fun res!539715 () Bool)

(declare-fun e!441407 () Bool)

(assert (=> b!795196 (=> (not res!539715) (not e!441407))))

(declare-datatypes ((array!43210 0))(
  ( (array!43211 (arr!20685 (Array (_ BitVec 32) (_ BitVec 64))) (size!21106 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43210)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43210 (_ BitVec 32)) Bool)

(assert (=> b!795196 (= res!539715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795197 () Bool)

(declare-fun e!441405 () Bool)

(assert (=> b!795197 (= e!441405 false)))

(declare-datatypes ((SeekEntryResult!8276 0))(
  ( (MissingZero!8276 (index!35472 (_ BitVec 32))) (Found!8276 (index!35473 (_ BitVec 32))) (Intermediate!8276 (undefined!9088 Bool) (index!35474 (_ BitVec 32)) (x!66394 (_ BitVec 32))) (Undefined!8276) (MissingVacant!8276 (index!35475 (_ BitVec 32))) )
))
(declare-fun lt!354452 () SeekEntryResult!8276)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43210 (_ BitVec 32)) SeekEntryResult!8276)

(assert (=> b!795197 (= lt!354452 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20685 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354453 () SeekEntryResult!8276)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43210 (_ BitVec 32)) SeekEntryResult!8276)

(assert (=> b!795197 (= lt!354453 (seekEntryOrOpen!0 (select (arr!20685 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795198 () Bool)

(declare-fun res!539720 () Bool)

(declare-fun e!441404 () Bool)

(assert (=> b!795198 (=> (not res!539720) (not e!441404))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795198 (= res!539720 (validKeyInArray!0 k!2044))))

(declare-fun b!795199 () Bool)

(assert (=> b!795199 (= e!441407 e!441405)))

(declare-fun res!539718 () Bool)

(assert (=> b!795199 (=> (not res!539718) (not e!441405))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354451 () array!43210)

(declare-fun lt!354455 () (_ BitVec 64))

(assert (=> b!795199 (= res!539718 (= (seekEntryOrOpen!0 lt!354455 lt!354451 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354455 lt!354451 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795199 (= lt!354455 (select (store (arr!20685 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795199 (= lt!354451 (array!43211 (store (arr!20685 a!3170) i!1163 k!2044) (size!21106 a!3170)))))

(declare-fun b!795200 () Bool)

(declare-fun res!539722 () Bool)

(assert (=> b!795200 (=> (not res!539722) (not e!441404))))

(assert (=> b!795200 (= res!539722 (validKeyInArray!0 (select (arr!20685 a!3170) j!153)))))

(declare-fun b!795201 () Bool)

(declare-fun res!539723 () Bool)

(assert (=> b!795201 (=> (not res!539723) (not e!441407))))

(assert (=> b!795201 (= res!539723 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21106 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20685 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21106 a!3170)) (= (select (arr!20685 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795202 () Bool)

(declare-fun res!539716 () Bool)

(assert (=> b!795202 (=> (not res!539716) (not e!441407))))

(declare-datatypes ((List!14648 0))(
  ( (Nil!14645) (Cons!14644 (h!15773 (_ BitVec 64)) (t!20963 List!14648)) )
))
(declare-fun arrayNoDuplicates!0 (array!43210 (_ BitVec 32) List!14648) Bool)

(assert (=> b!795202 (= res!539716 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14645))))

(declare-fun b!795203 () Bool)

(declare-fun res!539717 () Bool)

(assert (=> b!795203 (=> (not res!539717) (not e!441404))))

(assert (=> b!795203 (= res!539717 (and (= (size!21106 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21106 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21106 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795204 () Bool)

(declare-fun res!539721 () Bool)

(assert (=> b!795204 (=> (not res!539721) (not e!441404))))

(declare-fun arrayContainsKey!0 (array!43210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795204 (= res!539721 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795195 () Bool)

(assert (=> b!795195 (= e!441404 e!441407)))

(declare-fun res!539714 () Bool)

(assert (=> b!795195 (=> (not res!539714) (not e!441407))))

(declare-fun lt!354454 () SeekEntryResult!8276)

(assert (=> b!795195 (= res!539714 (or (= lt!354454 (MissingZero!8276 i!1163)) (= lt!354454 (MissingVacant!8276 i!1163))))))

(assert (=> b!795195 (= lt!354454 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!539719 () Bool)

(assert (=> start!68420 (=> (not res!539719) (not e!441404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68420 (= res!539719 (validMask!0 mask!3266))))

(assert (=> start!68420 e!441404))

(assert (=> start!68420 true))

(declare-fun array_inv!16481 (array!43210) Bool)

(assert (=> start!68420 (array_inv!16481 a!3170)))

(assert (= (and start!68420 res!539719) b!795203))

(assert (= (and b!795203 res!539717) b!795200))

(assert (= (and b!795200 res!539722) b!795198))

(assert (= (and b!795198 res!539720) b!795204))

(assert (= (and b!795204 res!539721) b!795195))

(assert (= (and b!795195 res!539714) b!795196))

(assert (= (and b!795196 res!539715) b!795202))

(assert (= (and b!795202 res!539716) b!795201))

(assert (= (and b!795201 res!539723) b!795199))

(assert (= (and b!795199 res!539718) b!795197))

(declare-fun m!735797 () Bool)

(assert (=> b!795199 m!735797))

(declare-fun m!735799 () Bool)

(assert (=> b!795199 m!735799))

(declare-fun m!735801 () Bool)

(assert (=> b!795199 m!735801))

(declare-fun m!735803 () Bool)

(assert (=> b!795199 m!735803))

(declare-fun m!735805 () Bool)

(assert (=> b!795195 m!735805))

(declare-fun m!735807 () Bool)

(assert (=> b!795196 m!735807))

(declare-fun m!735809 () Bool)

(assert (=> b!795204 m!735809))

(declare-fun m!735811 () Bool)

(assert (=> b!795202 m!735811))

(declare-fun m!735813 () Bool)

(assert (=> b!795201 m!735813))

(declare-fun m!735815 () Bool)

(assert (=> b!795201 m!735815))

(declare-fun m!735817 () Bool)

(assert (=> b!795198 m!735817))

(declare-fun m!735819 () Bool)

(assert (=> start!68420 m!735819))

(declare-fun m!735821 () Bool)

(assert (=> start!68420 m!735821))

(declare-fun m!735823 () Bool)

(assert (=> b!795200 m!735823))

(assert (=> b!795200 m!735823))

(declare-fun m!735825 () Bool)

(assert (=> b!795200 m!735825))

(assert (=> b!795197 m!735823))

(assert (=> b!795197 m!735823))

(declare-fun m!735827 () Bool)

(assert (=> b!795197 m!735827))

(assert (=> b!795197 m!735823))

(declare-fun m!735829 () Bool)

(assert (=> b!795197 m!735829))

(push 1)

