; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68550 () Bool)

(assert start!68550)

(declare-fun b!797414 () Bool)

(declare-fun res!542074 () Bool)

(declare-fun e!442368 () Bool)

(assert (=> b!797414 (=> (not res!542074) (not e!442368))))

(declare-datatypes ((array!43357 0))(
  ( (array!43358 (arr!20759 (Array (_ BitVec 32) (_ BitVec 64))) (size!21180 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43357)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797414 (= res!542074 (validKeyInArray!0 (select (arr!20759 a!3170) j!153)))))

(declare-fun b!797415 () Bool)

(declare-fun res!542072 () Bool)

(declare-fun e!442369 () Bool)

(assert (=> b!797415 (=> (not res!542072) (not e!442369))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797415 (= res!542072 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21180 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20759 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21180 a!3170)) (= (select (arr!20759 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797416 () Bool)

(declare-fun e!442370 () Bool)

(assert (=> b!797416 (= e!442369 e!442370)))

(declare-fun res!542077 () Bool)

(assert (=> b!797416 (=> (not res!542077) (not e!442370))))

(declare-datatypes ((SeekEntryResult!8347 0))(
  ( (MissingZero!8347 (index!35756 (_ BitVec 32))) (Found!8347 (index!35757 (_ BitVec 32))) (Intermediate!8347 (undefined!9159 Bool) (index!35758 (_ BitVec 32)) (x!66660 (_ BitVec 32))) (Undefined!8347) (MissingVacant!8347 (index!35759 (_ BitVec 32))) )
))
(declare-fun lt!355674 () SeekEntryResult!8347)

(declare-fun lt!355673 () SeekEntryResult!8347)

(assert (=> b!797416 (= res!542077 (= lt!355674 lt!355673))))

(declare-fun lt!355676 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!355675 () array!43357)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43357 (_ BitVec 32)) SeekEntryResult!8347)

(assert (=> b!797416 (= lt!355673 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355676 lt!355675 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43357 (_ BitVec 32)) SeekEntryResult!8347)

(assert (=> b!797416 (= lt!355674 (seekEntryOrOpen!0 lt!355676 lt!355675 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!797416 (= lt!355676 (select (store (arr!20759 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797416 (= lt!355675 (array!43358 (store (arr!20759 a!3170) i!1163 k0!2044) (size!21180 a!3170)))))

(declare-fun b!797417 () Bool)

(declare-fun res!542075 () Bool)

(assert (=> b!797417 (=> (not res!542075) (not e!442369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43357 (_ BitVec 32)) Bool)

(assert (=> b!797417 (= res!542075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797418 () Bool)

(declare-fun e!442371 () Bool)

(assert (=> b!797418 (= e!442371 (not true))))

(assert (=> b!797418 (= lt!355673 (Found!8347 index!1236))))

(declare-fun b!797419 () Bool)

(declare-fun res!542078 () Bool)

(assert (=> b!797419 (=> (not res!542078) (not e!442368))))

(declare-fun arrayContainsKey!0 (array!43357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797419 (= res!542078 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797420 () Bool)

(declare-fun res!542076 () Bool)

(assert (=> b!797420 (=> (not res!542076) (not e!442368))))

(assert (=> b!797420 (= res!542076 (validKeyInArray!0 k0!2044))))

(declare-fun b!797421 () Bool)

(declare-fun res!542073 () Bool)

(assert (=> b!797421 (=> (not res!542073) (not e!442368))))

(assert (=> b!797421 (= res!542073 (and (= (size!21180 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21180 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21180 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797422 () Bool)

(assert (=> b!797422 (= e!442368 e!442369)))

(declare-fun res!542079 () Bool)

(assert (=> b!797422 (=> (not res!542079) (not e!442369))))

(declare-fun lt!355679 () SeekEntryResult!8347)

(assert (=> b!797422 (= res!542079 (or (= lt!355679 (MissingZero!8347 i!1163)) (= lt!355679 (MissingVacant!8347 i!1163))))))

(assert (=> b!797422 (= lt!355679 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797423 () Bool)

(declare-fun res!542082 () Bool)

(assert (=> b!797423 (=> (not res!542082) (not e!442369))))

(declare-datatypes ((List!14761 0))(
  ( (Nil!14758) (Cons!14757 (h!15886 (_ BitVec 64)) (t!21067 List!14761)) )
))
(declare-fun arrayNoDuplicates!0 (array!43357 (_ BitVec 32) List!14761) Bool)

(assert (=> b!797423 (= res!542082 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14758))))

(declare-fun b!797413 () Bool)

(assert (=> b!797413 (= e!442370 e!442371)))

(declare-fun res!542080 () Bool)

(assert (=> b!797413 (=> (not res!542080) (not e!442371))))

(declare-fun lt!355677 () SeekEntryResult!8347)

(declare-fun lt!355678 () SeekEntryResult!8347)

(assert (=> b!797413 (= res!542080 (and (= lt!355678 lt!355677) (= lt!355677 (Found!8347 j!153)) (= (select (arr!20759 a!3170) index!1236) (select (arr!20759 a!3170) j!153))))))

(assert (=> b!797413 (= lt!355677 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20759 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797413 (= lt!355678 (seekEntryOrOpen!0 (select (arr!20759 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!542081 () Bool)

(assert (=> start!68550 (=> (not res!542081) (not e!442368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68550 (= res!542081 (validMask!0 mask!3266))))

(assert (=> start!68550 e!442368))

(assert (=> start!68550 true))

(declare-fun array_inv!16642 (array!43357) Bool)

(assert (=> start!68550 (array_inv!16642 a!3170)))

(assert (= (and start!68550 res!542081) b!797421))

(assert (= (and b!797421 res!542073) b!797414))

(assert (= (and b!797414 res!542074) b!797420))

(assert (= (and b!797420 res!542076) b!797419))

(assert (= (and b!797419 res!542078) b!797422))

(assert (= (and b!797422 res!542079) b!797417))

(assert (= (and b!797417 res!542075) b!797423))

(assert (= (and b!797423 res!542082) b!797415))

(assert (= (and b!797415 res!542072) b!797416))

(assert (= (and b!797416 res!542077) b!797413))

(assert (= (and b!797413 res!542080) b!797418))

(declare-fun m!737785 () Bool)

(assert (=> b!797422 m!737785))

(declare-fun m!737787 () Bool)

(assert (=> b!797420 m!737787))

(declare-fun m!737789 () Bool)

(assert (=> b!797414 m!737789))

(assert (=> b!797414 m!737789))

(declare-fun m!737791 () Bool)

(assert (=> b!797414 m!737791))

(declare-fun m!737793 () Bool)

(assert (=> b!797416 m!737793))

(declare-fun m!737795 () Bool)

(assert (=> b!797416 m!737795))

(declare-fun m!737797 () Bool)

(assert (=> b!797416 m!737797))

(declare-fun m!737799 () Bool)

(assert (=> b!797416 m!737799))

(declare-fun m!737801 () Bool)

(assert (=> b!797413 m!737801))

(assert (=> b!797413 m!737789))

(assert (=> b!797413 m!737789))

(declare-fun m!737803 () Bool)

(assert (=> b!797413 m!737803))

(assert (=> b!797413 m!737789))

(declare-fun m!737805 () Bool)

(assert (=> b!797413 m!737805))

(declare-fun m!737807 () Bool)

(assert (=> b!797415 m!737807))

(declare-fun m!737809 () Bool)

(assert (=> b!797415 m!737809))

(declare-fun m!737811 () Bool)

(assert (=> b!797423 m!737811))

(declare-fun m!737813 () Bool)

(assert (=> b!797419 m!737813))

(declare-fun m!737815 () Bool)

(assert (=> start!68550 m!737815))

(declare-fun m!737817 () Bool)

(assert (=> start!68550 m!737817))

(declare-fun m!737819 () Bool)

(assert (=> b!797417 m!737819))

(check-sat (not b!797417) (not start!68550) (not b!797416) (not b!797423) (not b!797414) (not b!797413) (not b!797419) (not b!797422) (not b!797420))
(check-sat)
