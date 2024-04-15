; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69372 () Bool)

(assert start!69372)

(declare-fun res!552670 () Bool)

(declare-fun e!447714 () Bool)

(assert (=> start!69372 (=> (not res!552670) (not e!447714))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69372 (= res!552670 (validMask!0 mask!3266))))

(assert (=> start!69372 e!447714))

(assert (=> start!69372 true))

(declare-datatypes ((array!43987 0))(
  ( (array!43988 (arr!21068 (Array (_ BitVec 32) (_ BitVec 64))) (size!21489 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43987)

(declare-fun array_inv!16951 (array!43987) Bool)

(assert (=> start!69372 (array_inv!16951 a!3170)))

(declare-fun b!808798 () Bool)

(declare-fun res!552667 () Bool)

(declare-fun e!447715 () Bool)

(assert (=> b!808798 (=> (not res!552667) (not e!447715))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!808798 (= res!552667 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21489 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21068 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21489 a!3170)) (= (select (arr!21068 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808799 () Bool)

(declare-fun res!552674 () Bool)

(assert (=> b!808799 (=> (not res!552674) (not e!447715))))

(declare-datatypes ((List!15070 0))(
  ( (Nil!15067) (Cons!15066 (h!16195 (_ BitVec 64)) (t!21376 List!15070)) )
))
(declare-fun arrayNoDuplicates!0 (array!43987 (_ BitVec 32) List!15070) Bool)

(assert (=> b!808799 (= res!552674 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15067))))

(declare-fun b!808800 () Bool)

(assert (=> b!808800 (= e!447714 e!447715)))

(declare-fun res!552672 () Bool)

(assert (=> b!808800 (=> (not res!552672) (not e!447715))))

(declare-datatypes ((SeekEntryResult!8656 0))(
  ( (MissingZero!8656 (index!36992 (_ BitVec 32))) (Found!8656 (index!36993 (_ BitVec 32))) (Intermediate!8656 (undefined!9468 Bool) (index!36994 (_ BitVec 32)) (x!67811 (_ BitVec 32))) (Undefined!8656) (MissingVacant!8656 (index!36995 (_ BitVec 32))) )
))
(declare-fun lt!362295 () SeekEntryResult!8656)

(assert (=> b!808800 (= res!552672 (or (= lt!362295 (MissingZero!8656 i!1163)) (= lt!362295 (MissingVacant!8656 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43987 (_ BitVec 32)) SeekEntryResult!8656)

(assert (=> b!808800 (= lt!362295 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808801 () Bool)

(declare-fun e!447717 () Bool)

(assert (=> b!808801 (= e!447717 false)))

(declare-fun lt!362292 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808801 (= lt!362292 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!808802 () Bool)

(declare-fun res!552666 () Bool)

(assert (=> b!808802 (=> (not res!552666) (not e!447714))))

(declare-fun arrayContainsKey!0 (array!43987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808802 (= res!552666 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808803 () Bool)

(declare-fun res!552675 () Bool)

(assert (=> b!808803 (=> (not res!552675) (not e!447714))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808803 (= res!552675 (and (= (size!21489 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21489 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21489 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808804 () Bool)

(declare-fun e!447718 () Bool)

(assert (=> b!808804 (= e!447715 e!447718)))

(declare-fun res!552671 () Bool)

(assert (=> b!808804 (=> (not res!552671) (not e!447718))))

(declare-fun lt!362297 () (_ BitVec 64))

(declare-fun lt!362294 () array!43987)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43987 (_ BitVec 32)) SeekEntryResult!8656)

(assert (=> b!808804 (= res!552671 (= (seekEntryOrOpen!0 lt!362297 lt!362294 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362297 lt!362294 mask!3266)))))

(assert (=> b!808804 (= lt!362297 (select (store (arr!21068 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808804 (= lt!362294 (array!43988 (store (arr!21068 a!3170) i!1163 k0!2044) (size!21489 a!3170)))))

(declare-fun b!808805 () Bool)

(declare-fun res!552669 () Bool)

(assert (=> b!808805 (=> (not res!552669) (not e!447715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43987 (_ BitVec 32)) Bool)

(assert (=> b!808805 (= res!552669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808806 () Bool)

(declare-fun res!552665 () Bool)

(assert (=> b!808806 (=> (not res!552665) (not e!447714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808806 (= res!552665 (validKeyInArray!0 (select (arr!21068 a!3170) j!153)))))

(declare-fun b!808807 () Bool)

(assert (=> b!808807 (= e!447718 e!447717)))

(declare-fun res!552668 () Bool)

(assert (=> b!808807 (=> (not res!552668) (not e!447717))))

(declare-fun lt!362296 () SeekEntryResult!8656)

(declare-fun lt!362293 () SeekEntryResult!8656)

(assert (=> b!808807 (= res!552668 (and (= lt!362293 lt!362296) (= lt!362296 (Found!8656 j!153)) (not (= (select (arr!21068 a!3170) index!1236) (select (arr!21068 a!3170) j!153)))))))

(assert (=> b!808807 (= lt!362296 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21068 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808807 (= lt!362293 (seekEntryOrOpen!0 (select (arr!21068 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808808 () Bool)

(declare-fun res!552673 () Bool)

(assert (=> b!808808 (=> (not res!552673) (not e!447714))))

(assert (=> b!808808 (= res!552673 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69372 res!552670) b!808803))

(assert (= (and b!808803 res!552675) b!808806))

(assert (= (and b!808806 res!552665) b!808808))

(assert (= (and b!808808 res!552673) b!808802))

(assert (= (and b!808802 res!552666) b!808800))

(assert (= (and b!808800 res!552672) b!808805))

(assert (= (and b!808805 res!552669) b!808799))

(assert (= (and b!808799 res!552674) b!808798))

(assert (= (and b!808798 res!552667) b!808804))

(assert (= (and b!808804 res!552671) b!808807))

(assert (= (and b!808807 res!552668) b!808801))

(declare-fun m!750439 () Bool)

(assert (=> b!808808 m!750439))

(declare-fun m!750441 () Bool)

(assert (=> b!808805 m!750441))

(declare-fun m!750443 () Bool)

(assert (=> b!808806 m!750443))

(assert (=> b!808806 m!750443))

(declare-fun m!750445 () Bool)

(assert (=> b!808806 m!750445))

(declare-fun m!750447 () Bool)

(assert (=> b!808800 m!750447))

(declare-fun m!750449 () Bool)

(assert (=> b!808802 m!750449))

(declare-fun m!750451 () Bool)

(assert (=> b!808799 m!750451))

(declare-fun m!750453 () Bool)

(assert (=> start!69372 m!750453))

(declare-fun m!750455 () Bool)

(assert (=> start!69372 m!750455))

(declare-fun m!750457 () Bool)

(assert (=> b!808807 m!750457))

(assert (=> b!808807 m!750443))

(assert (=> b!808807 m!750443))

(declare-fun m!750459 () Bool)

(assert (=> b!808807 m!750459))

(assert (=> b!808807 m!750443))

(declare-fun m!750461 () Bool)

(assert (=> b!808807 m!750461))

(declare-fun m!750463 () Bool)

(assert (=> b!808798 m!750463))

(declare-fun m!750465 () Bool)

(assert (=> b!808798 m!750465))

(declare-fun m!750467 () Bool)

(assert (=> b!808801 m!750467))

(declare-fun m!750469 () Bool)

(assert (=> b!808804 m!750469))

(declare-fun m!750471 () Bool)

(assert (=> b!808804 m!750471))

(declare-fun m!750473 () Bool)

(assert (=> b!808804 m!750473))

(declare-fun m!750475 () Bool)

(assert (=> b!808804 m!750475))

(check-sat (not b!808800) (not b!808806) (not b!808808) (not b!808807) (not b!808805) (not b!808804) (not start!69372) (not b!808802) (not b!808801) (not b!808799))
(check-sat)
