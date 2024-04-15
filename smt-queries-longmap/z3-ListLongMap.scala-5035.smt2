; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68700 () Bool)

(assert start!68700)

(declare-fun b!800117 () Bool)

(declare-fun res!544777 () Bool)

(declare-fun e!443606 () Bool)

(assert (=> b!800117 (=> (not res!544777) (not e!443606))))

(declare-datatypes ((array!43507 0))(
  ( (array!43508 (arr!20834 (Array (_ BitVec 32) (_ BitVec 64))) (size!21255 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43507)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800117 (= res!544777 (validKeyInArray!0 (select (arr!20834 a!3170) j!153)))))

(declare-fun b!800118 () Bool)

(declare-fun res!544776 () Bool)

(declare-fun e!443608 () Bool)

(assert (=> b!800118 (=> (not res!544776) (not e!443608))))

(declare-datatypes ((List!14836 0))(
  ( (Nil!14833) (Cons!14832 (h!15961 (_ BitVec 64)) (t!21142 List!14836)) )
))
(declare-fun arrayNoDuplicates!0 (array!43507 (_ BitVec 32) List!14836) Bool)

(assert (=> b!800118 (= res!544776 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14833))))

(declare-fun b!800119 () Bool)

(declare-fun e!443604 () Bool)

(assert (=> b!800119 (= e!443608 e!443604)))

(declare-fun res!544787 () Bool)

(assert (=> b!800119 (=> (not res!544787) (not e!443604))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357329 () array!43507)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357328 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8422 0))(
  ( (MissingZero!8422 (index!36056 (_ BitVec 32))) (Found!8422 (index!36057 (_ BitVec 32))) (Intermediate!8422 (undefined!9234 Bool) (index!36058 (_ BitVec 32)) (x!66935 (_ BitVec 32))) (Undefined!8422) (MissingVacant!8422 (index!36059 (_ BitVec 32))) )
))
(declare-fun lt!357325 () SeekEntryResult!8422)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43507 (_ BitVec 32)) SeekEntryResult!8422)

(assert (=> b!800119 (= res!544787 (= lt!357325 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357328 lt!357329 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43507 (_ BitVec 32)) SeekEntryResult!8422)

(assert (=> b!800119 (= lt!357325 (seekEntryOrOpen!0 lt!357328 lt!357329 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800119 (= lt!357328 (select (store (arr!20834 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800119 (= lt!357329 (array!43508 (store (arr!20834 a!3170) i!1163 k0!2044) (size!21255 a!3170)))))

(declare-fun b!800120 () Bool)

(assert (=> b!800120 (= e!443606 e!443608)))

(declare-fun res!544784 () Bool)

(assert (=> b!800120 (=> (not res!544784) (not e!443608))))

(declare-fun lt!357326 () SeekEntryResult!8422)

(assert (=> b!800120 (= res!544784 (or (= lt!357326 (MissingZero!8422 i!1163)) (= lt!357326 (MissingVacant!8422 i!1163))))))

(assert (=> b!800120 (= lt!357326 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800121 () Bool)

(declare-fun res!544785 () Bool)

(assert (=> b!800121 (=> (not res!544785) (not e!443608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43507 (_ BitVec 32)) Bool)

(assert (=> b!800121 (= res!544785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800122 () Bool)

(declare-fun e!443603 () Bool)

(declare-fun e!443607 () Bool)

(assert (=> b!800122 (= e!443603 e!443607)))

(declare-fun res!544782 () Bool)

(assert (=> b!800122 (=> (not res!544782) (not e!443607))))

(declare-fun lt!357322 () (_ BitVec 32))

(assert (=> b!800122 (= res!544782 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357322 #b00000000000000000000000000000000) (bvslt lt!357322 (size!21255 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800122 (= lt!357322 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800123 () Bool)

(assert (=> b!800123 (= e!443604 e!443603)))

(declare-fun res!544783 () Bool)

(assert (=> b!800123 (=> (not res!544783) (not e!443603))))

(declare-fun lt!357327 () SeekEntryResult!8422)

(declare-fun lt!357323 () SeekEntryResult!8422)

(assert (=> b!800123 (= res!544783 (and (= lt!357323 lt!357327) (= lt!357327 (Found!8422 j!153)) (not (= (select (arr!20834 a!3170) index!1236) (select (arr!20834 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800123 (= lt!357327 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20834 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800123 (= lt!357323 (seekEntryOrOpen!0 (select (arr!20834 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800124 () Bool)

(declare-fun res!544779 () Bool)

(assert (=> b!800124 (=> (not res!544779) (not e!443606))))

(declare-fun arrayContainsKey!0 (array!43507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800124 (= res!544779 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800125 () Bool)

(declare-fun res!544778 () Bool)

(assert (=> b!800125 (=> (not res!544778) (not e!443606))))

(assert (=> b!800125 (= res!544778 (and (= (size!21255 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21255 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21255 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800126 () Bool)

(declare-fun res!544781 () Bool)

(assert (=> b!800126 (=> (not res!544781) (not e!443608))))

(assert (=> b!800126 (= res!544781 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21255 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20834 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21255 a!3170)) (= (select (arr!20834 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800127 () Bool)

(declare-fun res!544786 () Bool)

(assert (=> b!800127 (=> (not res!544786) (not e!443606))))

(assert (=> b!800127 (= res!544786 (validKeyInArray!0 k0!2044))))

(declare-fun b!800128 () Bool)

(declare-fun res!544788 () Bool)

(assert (=> b!800128 (=> (not res!544788) (not e!443607))))

(assert (=> b!800128 (= res!544788 (= lt!357325 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357322 vacantAfter!23 lt!357328 lt!357329 mask!3266)))))

(declare-fun b!800129 () Bool)

(assert (=> b!800129 (= e!443607 false)))

(declare-fun lt!357324 () SeekEntryResult!8422)

(assert (=> b!800129 (= lt!357324 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357322 vacantBefore!23 (select (arr!20834 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!544780 () Bool)

(assert (=> start!68700 (=> (not res!544780) (not e!443606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68700 (= res!544780 (validMask!0 mask!3266))))

(assert (=> start!68700 e!443606))

(assert (=> start!68700 true))

(declare-fun array_inv!16717 (array!43507) Bool)

(assert (=> start!68700 (array_inv!16717 a!3170)))

(assert (= (and start!68700 res!544780) b!800125))

(assert (= (and b!800125 res!544778) b!800117))

(assert (= (and b!800117 res!544777) b!800127))

(assert (= (and b!800127 res!544786) b!800124))

(assert (= (and b!800124 res!544779) b!800120))

(assert (= (and b!800120 res!544784) b!800121))

(assert (= (and b!800121 res!544785) b!800118))

(assert (= (and b!800118 res!544776) b!800126))

(assert (= (and b!800126 res!544781) b!800119))

(assert (= (and b!800119 res!544787) b!800123))

(assert (= (and b!800123 res!544783) b!800122))

(assert (= (and b!800122 res!544782) b!800128))

(assert (= (and b!800128 res!544788) b!800129))

(declare-fun m!740707 () Bool)

(assert (=> b!800117 m!740707))

(assert (=> b!800117 m!740707))

(declare-fun m!740709 () Bool)

(assert (=> b!800117 m!740709))

(declare-fun m!740711 () Bool)

(assert (=> b!800121 m!740711))

(declare-fun m!740713 () Bool)

(assert (=> b!800119 m!740713))

(declare-fun m!740715 () Bool)

(assert (=> b!800119 m!740715))

(declare-fun m!740717 () Bool)

(assert (=> b!800119 m!740717))

(declare-fun m!740719 () Bool)

(assert (=> b!800119 m!740719))

(declare-fun m!740721 () Bool)

(assert (=> b!800118 m!740721))

(declare-fun m!740723 () Bool)

(assert (=> b!800123 m!740723))

(assert (=> b!800123 m!740707))

(assert (=> b!800123 m!740707))

(declare-fun m!740725 () Bool)

(assert (=> b!800123 m!740725))

(assert (=> b!800123 m!740707))

(declare-fun m!740727 () Bool)

(assert (=> b!800123 m!740727))

(declare-fun m!740729 () Bool)

(assert (=> b!800120 m!740729))

(assert (=> b!800129 m!740707))

(assert (=> b!800129 m!740707))

(declare-fun m!740731 () Bool)

(assert (=> b!800129 m!740731))

(declare-fun m!740733 () Bool)

(assert (=> b!800126 m!740733))

(declare-fun m!740735 () Bool)

(assert (=> b!800126 m!740735))

(declare-fun m!740737 () Bool)

(assert (=> b!800122 m!740737))

(declare-fun m!740739 () Bool)

(assert (=> b!800128 m!740739))

(declare-fun m!740741 () Bool)

(assert (=> b!800127 m!740741))

(declare-fun m!740743 () Bool)

(assert (=> start!68700 m!740743))

(declare-fun m!740745 () Bool)

(assert (=> start!68700 m!740745))

(declare-fun m!740747 () Bool)

(assert (=> b!800124 m!740747))

(check-sat (not b!800128) (not b!800129) (not b!800117) (not b!800124) (not b!800118) (not b!800127) (not b!800121) (not b!800120) (not b!800123) (not b!800119) (not start!68700) (not b!800122))
(check-sat)
