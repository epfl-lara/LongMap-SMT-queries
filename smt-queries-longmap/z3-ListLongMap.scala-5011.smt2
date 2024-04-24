; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68700 () Bool)

(assert start!68700)

(declare-fun b!798415 () Bool)

(declare-fun res!542567 () Bool)

(declare-fun e!442992 () Bool)

(assert (=> b!798415 (=> (not res!542567) (not e!442992))))

(declare-datatypes ((array!43364 0))(
  ( (array!43365 (arr!20758 (Array (_ BitVec 32) (_ BitVec 64))) (size!21178 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43364)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798415 (= res!542567 (validKeyInArray!0 (select (arr!20758 a!3170) j!153)))))

(declare-fun b!798416 () Bool)

(declare-fun res!542568 () Bool)

(declare-fun e!442995 () Bool)

(assert (=> b!798416 (=> (not res!542568) (not e!442995))))

(declare-datatypes ((List!14628 0))(
  ( (Nil!14625) (Cons!14624 (h!15759 (_ BitVec 64)) (t!20935 List!14628)) )
))
(declare-fun arrayNoDuplicates!0 (array!43364 (_ BitVec 32) List!14628) Bool)

(assert (=> b!798416 (= res!542568 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14625))))

(declare-fun b!798417 () Bool)

(declare-fun res!542561 () Bool)

(assert (=> b!798417 (=> (not res!542561) (not e!442992))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!798417 (= res!542561 (validKeyInArray!0 k0!2044))))

(declare-fun b!798418 () Bool)

(declare-datatypes ((SeekEntryResult!8305 0))(
  ( (MissingZero!8305 (index!35588 (_ BitVec 32))) (Found!8305 (index!35589 (_ BitVec 32))) (Intermediate!8305 (undefined!9117 Bool) (index!35590 (_ BitVec 32)) (x!66642 (_ BitVec 32))) (Undefined!8305) (MissingVacant!8305 (index!35591 (_ BitVec 32))) )
))
(declare-fun lt!356252 () SeekEntryResult!8305)

(declare-fun lt!356257 () SeekEntryResult!8305)

(declare-fun e!442996 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!798418 (= e!442996 (not (or (not (= lt!356252 lt!356257)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798418 (= lt!356252 (Found!8305 index!1236))))

(declare-fun res!542570 () Bool)

(assert (=> start!68700 (=> (not res!542570) (not e!442992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68700 (= res!542570 (validMask!0 mask!3266))))

(assert (=> start!68700 e!442992))

(assert (=> start!68700 true))

(declare-fun array_inv!16617 (array!43364) Bool)

(assert (=> start!68700 (array_inv!16617 a!3170)))

(declare-fun b!798419 () Bool)

(declare-fun res!542563 () Bool)

(assert (=> b!798419 (=> (not res!542563) (not e!442995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43364 (_ BitVec 32)) Bool)

(assert (=> b!798419 (= res!542563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798420 () Bool)

(declare-fun res!542560 () Bool)

(assert (=> b!798420 (=> (not res!542560) (not e!442992))))

(declare-fun arrayContainsKey!0 (array!43364 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798420 (= res!542560 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798421 () Bool)

(declare-fun res!542562 () Bool)

(assert (=> b!798421 (=> (not res!542562) (not e!442995))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798421 (= res!542562 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21178 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20758 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21178 a!3170)) (= (select (arr!20758 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798422 () Bool)

(declare-fun e!442994 () Bool)

(assert (=> b!798422 (= e!442994 e!442996)))

(declare-fun res!542565 () Bool)

(assert (=> b!798422 (=> (not res!542565) (not e!442996))))

(declare-fun lt!356255 () SeekEntryResult!8305)

(assert (=> b!798422 (= res!542565 (and (= lt!356255 lt!356257) (= (select (arr!20758 a!3170) index!1236) (select (arr!20758 a!3170) j!153))))))

(assert (=> b!798422 (= lt!356257 (Found!8305 j!153))))

(declare-fun b!798423 () Bool)

(declare-fun e!442993 () Bool)

(assert (=> b!798423 (= e!442995 e!442993)))

(declare-fun res!542566 () Bool)

(assert (=> b!798423 (=> (not res!542566) (not e!442993))))

(declare-fun lt!356250 () SeekEntryResult!8305)

(assert (=> b!798423 (= res!542566 (= lt!356250 lt!356252))))

(declare-fun lt!356251 () (_ BitVec 64))

(declare-fun lt!356256 () array!43364)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43364 (_ BitVec 32)) SeekEntryResult!8305)

(assert (=> b!798423 (= lt!356252 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356251 lt!356256 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43364 (_ BitVec 32)) SeekEntryResult!8305)

(assert (=> b!798423 (= lt!356250 (seekEntryOrOpen!0 lt!356251 lt!356256 mask!3266))))

(assert (=> b!798423 (= lt!356251 (select (store (arr!20758 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798423 (= lt!356256 (array!43365 (store (arr!20758 a!3170) i!1163 k0!2044) (size!21178 a!3170)))))

(declare-fun b!798424 () Bool)

(assert (=> b!798424 (= e!442992 e!442995)))

(declare-fun res!542569 () Bool)

(assert (=> b!798424 (=> (not res!542569) (not e!442995))))

(declare-fun lt!356253 () SeekEntryResult!8305)

(assert (=> b!798424 (= res!542569 (or (= lt!356253 (MissingZero!8305 i!1163)) (= lt!356253 (MissingVacant!8305 i!1163))))))

(assert (=> b!798424 (= lt!356253 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798425 () Bool)

(assert (=> b!798425 (= e!442993 e!442994)))

(declare-fun res!542571 () Bool)

(assert (=> b!798425 (=> (not res!542571) (not e!442994))))

(declare-fun lt!356254 () SeekEntryResult!8305)

(assert (=> b!798425 (= res!542571 (= lt!356254 lt!356255))))

(assert (=> b!798425 (= lt!356255 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20758 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798425 (= lt!356254 (seekEntryOrOpen!0 (select (arr!20758 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798426 () Bool)

(declare-fun res!542564 () Bool)

(assert (=> b!798426 (=> (not res!542564) (not e!442992))))

(assert (=> b!798426 (= res!542564 (and (= (size!21178 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21178 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21178 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68700 res!542570) b!798426))

(assert (= (and b!798426 res!542564) b!798415))

(assert (= (and b!798415 res!542567) b!798417))

(assert (= (and b!798417 res!542561) b!798420))

(assert (= (and b!798420 res!542560) b!798424))

(assert (= (and b!798424 res!542569) b!798419))

(assert (= (and b!798419 res!542563) b!798416))

(assert (= (and b!798416 res!542568) b!798421))

(assert (= (and b!798421 res!542562) b!798423))

(assert (= (and b!798423 res!542566) b!798425))

(assert (= (and b!798425 res!542571) b!798422))

(assert (= (and b!798422 res!542565) b!798418))

(declare-fun m!739715 () Bool)

(assert (=> b!798420 m!739715))

(declare-fun m!739717 () Bool)

(assert (=> b!798422 m!739717))

(declare-fun m!739719 () Bool)

(assert (=> b!798422 m!739719))

(declare-fun m!739721 () Bool)

(assert (=> start!68700 m!739721))

(declare-fun m!739723 () Bool)

(assert (=> start!68700 m!739723))

(declare-fun m!739725 () Bool)

(assert (=> b!798416 m!739725))

(assert (=> b!798425 m!739719))

(assert (=> b!798425 m!739719))

(declare-fun m!739727 () Bool)

(assert (=> b!798425 m!739727))

(assert (=> b!798425 m!739719))

(declare-fun m!739729 () Bool)

(assert (=> b!798425 m!739729))

(declare-fun m!739731 () Bool)

(assert (=> b!798423 m!739731))

(declare-fun m!739733 () Bool)

(assert (=> b!798423 m!739733))

(declare-fun m!739735 () Bool)

(assert (=> b!798423 m!739735))

(declare-fun m!739737 () Bool)

(assert (=> b!798423 m!739737))

(declare-fun m!739739 () Bool)

(assert (=> b!798421 m!739739))

(declare-fun m!739741 () Bool)

(assert (=> b!798421 m!739741))

(declare-fun m!739743 () Bool)

(assert (=> b!798417 m!739743))

(declare-fun m!739745 () Bool)

(assert (=> b!798424 m!739745))

(declare-fun m!739747 () Bool)

(assert (=> b!798419 m!739747))

(assert (=> b!798415 m!739719))

(assert (=> b!798415 m!739719))

(declare-fun m!739749 () Bool)

(assert (=> b!798415 m!739749))

(check-sat (not b!798419) (not b!798415) (not start!68700) (not b!798425) (not b!798420) (not b!798417) (not b!798424) (not b!798416) (not b!798423))
(check-sat)
