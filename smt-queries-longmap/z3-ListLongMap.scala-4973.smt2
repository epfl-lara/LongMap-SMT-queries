; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68472 () Bool)

(assert start!68472)

(declare-fun b!794766 () Bool)

(declare-fun res!538918 () Bool)

(declare-fun e!441423 () Bool)

(assert (=> b!794766 (=> (not res!538918) (not e!441423))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43136 0))(
  ( (array!43137 (arr!20644 (Array (_ BitVec 32) (_ BitVec 64))) (size!21064 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43136)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794766 (= res!538918 (and (= (size!21064 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21064 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21064 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794768 () Bool)

(declare-fun res!538916 () Bool)

(declare-fun e!441424 () Bool)

(assert (=> b!794768 (=> (not res!538916) (not e!441424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43136 (_ BitVec 32)) Bool)

(assert (=> b!794768 (= res!538916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794769 () Bool)

(declare-fun res!538913 () Bool)

(assert (=> b!794769 (=> (not res!538913) (not e!441423))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794769 (= res!538913 (validKeyInArray!0 k0!2044))))

(declare-fun b!794770 () Bool)

(assert (=> b!794770 (= e!441423 e!441424)))

(declare-fun res!538919 () Bool)

(assert (=> b!794770 (=> (not res!538919) (not e!441424))))

(declare-datatypes ((SeekEntryResult!8191 0))(
  ( (MissingZero!8191 (index!35132 (_ BitVec 32))) (Found!8191 (index!35133 (_ BitVec 32))) (Intermediate!8191 (undefined!9003 Bool) (index!35134 (_ BitVec 32)) (x!66224 (_ BitVec 32))) (Undefined!8191) (MissingVacant!8191 (index!35135 (_ BitVec 32))) )
))
(declare-fun lt!354270 () SeekEntryResult!8191)

(assert (=> b!794770 (= res!538919 (or (= lt!354270 (MissingZero!8191 i!1163)) (= lt!354270 (MissingVacant!8191 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43136 (_ BitVec 32)) SeekEntryResult!8191)

(assert (=> b!794770 (= lt!354270 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794771 () Bool)

(declare-fun res!538915 () Bool)

(assert (=> b!794771 (=> (not res!538915) (not e!441423))))

(assert (=> b!794771 (= res!538915 (validKeyInArray!0 (select (arr!20644 a!3170) j!153)))))

(declare-fun b!794772 () Bool)

(declare-fun res!538920 () Bool)

(assert (=> b!794772 (=> (not res!538920) (not e!441423))))

(declare-fun arrayContainsKey!0 (array!43136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794772 (= res!538920 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794773 () Bool)

(declare-fun res!538914 () Bool)

(assert (=> b!794773 (=> (not res!538914) (not e!441424))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794773 (= res!538914 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21064 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20644 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21064 a!3170)) (= (select (arr!20644 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794767 () Bool)

(declare-fun e!441422 () Bool)

(assert (=> b!794767 (= e!441424 e!441422)))

(declare-fun res!538911 () Bool)

(assert (=> b!794767 (=> (not res!538911) (not e!441422))))

(declare-fun lt!354269 () array!43136)

(declare-fun lt!354271 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43136 (_ BitVec 32)) SeekEntryResult!8191)

(assert (=> b!794767 (= res!538911 (= (seekEntryOrOpen!0 lt!354271 lt!354269 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354271 lt!354269 mask!3266)))))

(assert (=> b!794767 (= lt!354271 (select (store (arr!20644 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794767 (= lt!354269 (array!43137 (store (arr!20644 a!3170) i!1163 k0!2044) (size!21064 a!3170)))))

(declare-fun res!538917 () Bool)

(assert (=> start!68472 (=> (not res!538917) (not e!441423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68472 (= res!538917 (validMask!0 mask!3266))))

(assert (=> start!68472 e!441423))

(assert (=> start!68472 true))

(declare-fun array_inv!16503 (array!43136) Bool)

(assert (=> start!68472 (array_inv!16503 a!3170)))

(declare-fun b!794774 () Bool)

(declare-fun res!538912 () Bool)

(assert (=> b!794774 (=> (not res!538912) (not e!441424))))

(declare-datatypes ((List!14514 0))(
  ( (Nil!14511) (Cons!14510 (h!15645 (_ BitVec 64)) (t!20821 List!14514)) )
))
(declare-fun arrayNoDuplicates!0 (array!43136 (_ BitVec 32) List!14514) Bool)

(assert (=> b!794774 (= res!538912 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14511))))

(declare-fun b!794775 () Bool)

(assert (=> b!794775 (= e!441422 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (= (and start!68472 res!538917) b!794766))

(assert (= (and b!794766 res!538918) b!794771))

(assert (= (and b!794771 res!538915) b!794769))

(assert (= (and b!794769 res!538913) b!794772))

(assert (= (and b!794772 res!538920) b!794770))

(assert (= (and b!794770 res!538919) b!794768))

(assert (= (and b!794768 res!538916) b!794774))

(assert (= (and b!794774 res!538912) b!794773))

(assert (= (and b!794773 res!538914) b!794767))

(assert (= (and b!794767 res!538911) b!794775))

(declare-fun m!735713 () Bool)

(assert (=> b!794774 m!735713))

(declare-fun m!735715 () Bool)

(assert (=> b!794768 m!735715))

(declare-fun m!735717 () Bool)

(assert (=> b!794767 m!735717))

(declare-fun m!735719 () Bool)

(assert (=> b!794767 m!735719))

(declare-fun m!735721 () Bool)

(assert (=> b!794767 m!735721))

(declare-fun m!735723 () Bool)

(assert (=> b!794767 m!735723))

(declare-fun m!735725 () Bool)

(assert (=> b!794772 m!735725))

(declare-fun m!735727 () Bool)

(assert (=> b!794770 m!735727))

(declare-fun m!735729 () Bool)

(assert (=> b!794773 m!735729))

(declare-fun m!735731 () Bool)

(assert (=> b!794773 m!735731))

(declare-fun m!735733 () Bool)

(assert (=> b!794771 m!735733))

(assert (=> b!794771 m!735733))

(declare-fun m!735735 () Bool)

(assert (=> b!794771 m!735735))

(declare-fun m!735737 () Bool)

(assert (=> start!68472 m!735737))

(declare-fun m!735739 () Bool)

(assert (=> start!68472 m!735739))

(declare-fun m!735741 () Bool)

(assert (=> b!794769 m!735741))

(check-sat (not start!68472) (not b!794770) (not b!794772) (not b!794768) (not b!794769) (not b!794771) (not b!794767) (not b!794774))
(check-sat)
