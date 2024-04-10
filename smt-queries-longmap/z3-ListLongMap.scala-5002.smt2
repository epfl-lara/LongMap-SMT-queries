; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68524 () Bool)

(assert start!68524)

(declare-fun b!796850 () Bool)

(declare-fun e!442124 () Bool)

(declare-fun e!442126 () Bool)

(assert (=> b!796850 (= e!442124 e!442126)))

(declare-fun res!541370 () Bool)

(assert (=> b!796850 (=> (not res!541370) (not e!442126))))

(declare-datatypes ((SeekEntryResult!8328 0))(
  ( (MissingZero!8328 (index!35680 (_ BitVec 32))) (Found!8328 (index!35681 (_ BitVec 32))) (Intermediate!8328 (undefined!9140 Bool) (index!35682 (_ BitVec 32)) (x!66582 (_ BitVec 32))) (Undefined!8328) (MissingVacant!8328 (index!35683 (_ BitVec 32))) )
))
(declare-fun lt!355385 () SeekEntryResult!8328)

(declare-fun lt!355390 () SeekEntryResult!8328)

(assert (=> b!796850 (= res!541370 (= lt!355385 lt!355390))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355386 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((array!43314 0))(
  ( (array!43315 (arr!20737 (Array (_ BitVec 32) (_ BitVec 64))) (size!21158 (_ BitVec 32))) )
))
(declare-fun lt!355387 () array!43314)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43314 (_ BitVec 32)) SeekEntryResult!8328)

(assert (=> b!796850 (= lt!355390 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355386 lt!355387 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43314 (_ BitVec 32)) SeekEntryResult!8328)

(assert (=> b!796850 (= lt!355385 (seekEntryOrOpen!0 lt!355386 lt!355387 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43314)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796850 (= lt!355386 (select (store (arr!20737 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796850 (= lt!355387 (array!43315 (store (arr!20737 a!3170) i!1163 k0!2044) (size!21158 a!3170)))))

(declare-fun b!796851 () Bool)

(declare-fun res!541378 () Bool)

(declare-fun e!442127 () Bool)

(assert (=> b!796851 (=> (not res!541378) (not e!442127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796851 (= res!541378 (validKeyInArray!0 k0!2044))))

(declare-fun res!541374 () Bool)

(assert (=> start!68524 (=> (not res!541374) (not e!442127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68524 (= res!541374 (validMask!0 mask!3266))))

(assert (=> start!68524 e!442127))

(assert (=> start!68524 true))

(declare-fun array_inv!16533 (array!43314) Bool)

(assert (=> start!68524 (array_inv!16533 a!3170)))

(declare-fun b!796852 () Bool)

(declare-fun e!442125 () Bool)

(assert (=> b!796852 (= e!442125 (not true))))

(assert (=> b!796852 (= lt!355390 (Found!8328 index!1236))))

(declare-fun b!796853 () Bool)

(declare-fun res!541372 () Bool)

(assert (=> b!796853 (=> (not res!541372) (not e!442127))))

(declare-fun arrayContainsKey!0 (array!43314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796853 (= res!541372 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796854 () Bool)

(assert (=> b!796854 (= e!442127 e!442124)))

(declare-fun res!541376 () Bool)

(assert (=> b!796854 (=> (not res!541376) (not e!442124))))

(declare-fun lt!355388 () SeekEntryResult!8328)

(assert (=> b!796854 (= res!541376 (or (= lt!355388 (MissingZero!8328 i!1163)) (= lt!355388 (MissingVacant!8328 i!1163))))))

(assert (=> b!796854 (= lt!355388 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796855 () Bool)

(declare-fun res!541375 () Bool)

(assert (=> b!796855 (=> (not res!541375) (not e!442124))))

(declare-datatypes ((List!14700 0))(
  ( (Nil!14697) (Cons!14696 (h!15825 (_ BitVec 64)) (t!21015 List!14700)) )
))
(declare-fun arrayNoDuplicates!0 (array!43314 (_ BitVec 32) List!14700) Bool)

(assert (=> b!796855 (= res!541375 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14697))))

(declare-fun b!796856 () Bool)

(assert (=> b!796856 (= e!442126 e!442125)))

(declare-fun res!541371 () Bool)

(assert (=> b!796856 (=> (not res!541371) (not e!442125))))

(declare-fun lt!355389 () SeekEntryResult!8328)

(declare-fun lt!355391 () SeekEntryResult!8328)

(assert (=> b!796856 (= res!541371 (and (= lt!355391 lt!355389) (= lt!355389 (Found!8328 j!153)) (= (select (arr!20737 a!3170) index!1236) (select (arr!20737 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796856 (= lt!355389 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20737 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796856 (= lt!355391 (seekEntryOrOpen!0 (select (arr!20737 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796857 () Bool)

(declare-fun res!541369 () Bool)

(assert (=> b!796857 (=> (not res!541369) (not e!442127))))

(assert (=> b!796857 (= res!541369 (and (= (size!21158 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21158 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21158 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796858 () Bool)

(declare-fun res!541377 () Bool)

(assert (=> b!796858 (=> (not res!541377) (not e!442124))))

(assert (=> b!796858 (= res!541377 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21158 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20737 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21158 a!3170)) (= (select (arr!20737 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796859 () Bool)

(declare-fun res!541379 () Bool)

(assert (=> b!796859 (=> (not res!541379) (not e!442127))))

(assert (=> b!796859 (= res!541379 (validKeyInArray!0 (select (arr!20737 a!3170) j!153)))))

(declare-fun b!796860 () Bool)

(declare-fun res!541373 () Bool)

(assert (=> b!796860 (=> (not res!541373) (not e!442124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43314 (_ BitVec 32)) Bool)

(assert (=> b!796860 (= res!541373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68524 res!541374) b!796857))

(assert (= (and b!796857 res!541369) b!796859))

(assert (= (and b!796859 res!541379) b!796851))

(assert (= (and b!796851 res!541378) b!796853))

(assert (= (and b!796853 res!541372) b!796854))

(assert (= (and b!796854 res!541376) b!796860))

(assert (= (and b!796860 res!541373) b!796855))

(assert (= (and b!796855 res!541375) b!796858))

(assert (= (and b!796858 res!541377) b!796850))

(assert (= (and b!796850 res!541370) b!796856))

(assert (= (and b!796856 res!541371) b!796852))

(declare-fun m!737681 () Bool)

(assert (=> start!68524 m!737681))

(declare-fun m!737683 () Bool)

(assert (=> start!68524 m!737683))

(declare-fun m!737685 () Bool)

(assert (=> b!796850 m!737685))

(declare-fun m!737687 () Bool)

(assert (=> b!796850 m!737687))

(declare-fun m!737689 () Bool)

(assert (=> b!796850 m!737689))

(declare-fun m!737691 () Bool)

(assert (=> b!796850 m!737691))

(declare-fun m!737693 () Bool)

(assert (=> b!796860 m!737693))

(declare-fun m!737695 () Bool)

(assert (=> b!796854 m!737695))

(declare-fun m!737697 () Bool)

(assert (=> b!796856 m!737697))

(declare-fun m!737699 () Bool)

(assert (=> b!796856 m!737699))

(assert (=> b!796856 m!737699))

(declare-fun m!737701 () Bool)

(assert (=> b!796856 m!737701))

(assert (=> b!796856 m!737699))

(declare-fun m!737703 () Bool)

(assert (=> b!796856 m!737703))

(declare-fun m!737705 () Bool)

(assert (=> b!796855 m!737705))

(declare-fun m!737707 () Bool)

(assert (=> b!796853 m!737707))

(assert (=> b!796859 m!737699))

(assert (=> b!796859 m!737699))

(declare-fun m!737709 () Bool)

(assert (=> b!796859 m!737709))

(declare-fun m!737711 () Bool)

(assert (=> b!796858 m!737711))

(declare-fun m!737713 () Bool)

(assert (=> b!796858 m!737713))

(declare-fun m!737715 () Bool)

(assert (=> b!796851 m!737715))

(check-sat (not b!796851) (not b!796855) (not b!796853) (not b!796856) (not start!68524) (not b!796859) (not b!796860) (not b!796854) (not b!796850))
(check-sat)
