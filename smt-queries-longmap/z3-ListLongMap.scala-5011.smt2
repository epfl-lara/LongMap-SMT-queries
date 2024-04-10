; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68578 () Bool)

(assert start!68578)

(declare-fun b!797800 () Bool)

(declare-fun e!442587 () Bool)

(declare-fun e!442591 () Bool)

(assert (=> b!797800 (= e!442587 e!442591)))

(declare-fun res!542330 () Bool)

(assert (=> b!797800 (=> (not res!542330) (not e!442591))))

(declare-datatypes ((SeekEntryResult!8355 0))(
  ( (MissingZero!8355 (index!35788 (_ BitVec 32))) (Found!8355 (index!35789 (_ BitVec 32))) (Intermediate!8355 (undefined!9167 Bool) (index!35790 (_ BitVec 32)) (x!66681 (_ BitVec 32))) (Undefined!8355) (MissingVacant!8355 (index!35791 (_ BitVec 32))) )
))
(declare-fun lt!356003 () SeekEntryResult!8355)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797800 (= res!542330 (or (= lt!356003 (MissingZero!8355 i!1163)) (= lt!356003 (MissingVacant!8355 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43368 0))(
  ( (array!43369 (arr!20764 (Array (_ BitVec 32) (_ BitVec 64))) (size!21185 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43368)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43368 (_ BitVec 32)) SeekEntryResult!8355)

(assert (=> b!797800 (= lt!356003 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797801 () Bool)

(declare-fun res!542325 () Bool)

(assert (=> b!797801 (=> (not res!542325) (not e!442587))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797801 (= res!542325 (and (= (size!21185 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21185 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21185 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!542327 () Bool)

(assert (=> start!68578 (=> (not res!542327) (not e!442587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68578 (= res!542327 (validMask!0 mask!3266))))

(assert (=> start!68578 e!442587))

(assert (=> start!68578 true))

(declare-fun array_inv!16560 (array!43368) Bool)

(assert (=> start!68578 (array_inv!16560 a!3170)))

(declare-fun e!442592 () Bool)

(declare-fun b!797802 () Bool)

(declare-fun lt!356007 () SeekEntryResult!8355)

(declare-fun lt!356004 () SeekEntryResult!8355)

(assert (=> b!797802 (= e!442592 (not (or (not (= lt!356004 lt!356007)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797802 (= lt!356004 (Found!8355 index!1236))))

(declare-fun b!797803 () Bool)

(declare-fun res!542326 () Bool)

(assert (=> b!797803 (=> (not res!542326) (not e!442591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43368 (_ BitVec 32)) Bool)

(assert (=> b!797803 (= res!542326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797804 () Bool)

(declare-fun e!442589 () Bool)

(assert (=> b!797804 (= e!442589 e!442592)))

(declare-fun res!542319 () Bool)

(assert (=> b!797804 (=> (not res!542319) (not e!442592))))

(declare-fun lt!356006 () SeekEntryResult!8355)

(assert (=> b!797804 (= res!542319 (and (= lt!356006 lt!356007) (= (select (arr!20764 a!3170) index!1236) (select (arr!20764 a!3170) j!153))))))

(assert (=> b!797804 (= lt!356007 (Found!8355 j!153))))

(declare-fun b!797805 () Bool)

(declare-fun res!542328 () Bool)

(assert (=> b!797805 (=> (not res!542328) (not e!442591))))

(declare-datatypes ((List!14727 0))(
  ( (Nil!14724) (Cons!14723 (h!15852 (_ BitVec 64)) (t!21042 List!14727)) )
))
(declare-fun arrayNoDuplicates!0 (array!43368 (_ BitVec 32) List!14727) Bool)

(assert (=> b!797805 (= res!542328 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14724))))

(declare-fun b!797806 () Bool)

(declare-fun res!542322 () Bool)

(assert (=> b!797806 (=> (not res!542322) (not e!442587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797806 (= res!542322 (validKeyInArray!0 k0!2044))))

(declare-fun b!797807 () Bool)

(declare-fun res!542324 () Bool)

(assert (=> b!797807 (=> (not res!542324) (not e!442591))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797807 (= res!542324 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21185 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20764 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21185 a!3170)) (= (select (arr!20764 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797808 () Bool)

(declare-fun e!442590 () Bool)

(assert (=> b!797808 (= e!442590 e!442589)))

(declare-fun res!542320 () Bool)

(assert (=> b!797808 (=> (not res!542320) (not e!442589))))

(declare-fun lt!356008 () SeekEntryResult!8355)

(assert (=> b!797808 (= res!542320 (= lt!356008 lt!356006))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43368 (_ BitVec 32)) SeekEntryResult!8355)

(assert (=> b!797808 (= lt!356006 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20764 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797808 (= lt!356008 (seekEntryOrOpen!0 (select (arr!20764 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797809 () Bool)

(declare-fun res!542321 () Bool)

(assert (=> b!797809 (=> (not res!542321) (not e!442587))))

(declare-fun arrayContainsKey!0 (array!43368 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797809 (= res!542321 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797810 () Bool)

(assert (=> b!797810 (= e!442591 e!442590)))

(declare-fun res!542323 () Bool)

(assert (=> b!797810 (=> (not res!542323) (not e!442590))))

(declare-fun lt!356005 () SeekEntryResult!8355)

(assert (=> b!797810 (= res!542323 (= lt!356005 lt!356004))))

(declare-fun lt!356009 () array!43368)

(declare-fun lt!356002 () (_ BitVec 64))

(assert (=> b!797810 (= lt!356004 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356002 lt!356009 mask!3266))))

(assert (=> b!797810 (= lt!356005 (seekEntryOrOpen!0 lt!356002 lt!356009 mask!3266))))

(assert (=> b!797810 (= lt!356002 (select (store (arr!20764 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797810 (= lt!356009 (array!43369 (store (arr!20764 a!3170) i!1163 k0!2044) (size!21185 a!3170)))))

(declare-fun b!797811 () Bool)

(declare-fun res!542329 () Bool)

(assert (=> b!797811 (=> (not res!542329) (not e!442587))))

(assert (=> b!797811 (= res!542329 (validKeyInArray!0 (select (arr!20764 a!3170) j!153)))))

(assert (= (and start!68578 res!542327) b!797801))

(assert (= (and b!797801 res!542325) b!797811))

(assert (= (and b!797811 res!542329) b!797806))

(assert (= (and b!797806 res!542322) b!797809))

(assert (= (and b!797809 res!542321) b!797800))

(assert (= (and b!797800 res!542330) b!797803))

(assert (= (and b!797803 res!542326) b!797805))

(assert (= (and b!797805 res!542328) b!797807))

(assert (= (and b!797807 res!542324) b!797810))

(assert (= (and b!797810 res!542323) b!797808))

(assert (= (and b!797808 res!542320) b!797804))

(assert (= (and b!797804 res!542319) b!797802))

(declare-fun m!738671 () Bool)

(assert (=> b!797810 m!738671))

(declare-fun m!738673 () Bool)

(assert (=> b!797810 m!738673))

(declare-fun m!738675 () Bool)

(assert (=> b!797810 m!738675))

(declare-fun m!738677 () Bool)

(assert (=> b!797810 m!738677))

(declare-fun m!738679 () Bool)

(assert (=> b!797808 m!738679))

(assert (=> b!797808 m!738679))

(declare-fun m!738681 () Bool)

(assert (=> b!797808 m!738681))

(assert (=> b!797808 m!738679))

(declare-fun m!738683 () Bool)

(assert (=> b!797808 m!738683))

(declare-fun m!738685 () Bool)

(assert (=> b!797807 m!738685))

(declare-fun m!738687 () Bool)

(assert (=> b!797807 m!738687))

(declare-fun m!738689 () Bool)

(assert (=> b!797805 m!738689))

(declare-fun m!738691 () Bool)

(assert (=> b!797800 m!738691))

(declare-fun m!738693 () Bool)

(assert (=> b!797806 m!738693))

(declare-fun m!738695 () Bool)

(assert (=> start!68578 m!738695))

(declare-fun m!738697 () Bool)

(assert (=> start!68578 m!738697))

(declare-fun m!738699 () Bool)

(assert (=> b!797804 m!738699))

(assert (=> b!797804 m!738679))

(declare-fun m!738701 () Bool)

(assert (=> b!797809 m!738701))

(declare-fun m!738703 () Bool)

(assert (=> b!797803 m!738703))

(assert (=> b!797811 m!738679))

(assert (=> b!797811 m!738679))

(declare-fun m!738705 () Bool)

(assert (=> b!797811 m!738705))

(check-sat (not b!797810) (not b!797808) (not b!797809) (not b!797806) (not start!68578) (not b!797800) (not b!797803) (not b!797805) (not b!797811))
(check-sat)
