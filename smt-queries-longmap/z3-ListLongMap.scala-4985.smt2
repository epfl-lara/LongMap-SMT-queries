; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68422 () Bool)

(assert start!68422)

(declare-fun b!795225 () Bool)

(declare-fun res!539749 () Bool)

(declare-fun e!441417 () Bool)

(assert (=> b!795225 (=> (not res!539749) (not e!441417))))

(declare-datatypes ((array!43212 0))(
  ( (array!43213 (arr!20686 (Array (_ BitVec 32) (_ BitVec 64))) (size!21107 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43212)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795225 (= res!539749 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795226 () Bool)

(declare-fun res!539748 () Bool)

(assert (=> b!795226 (=> (not res!539748) (not e!441417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795226 (= res!539748 (validKeyInArray!0 k0!2044))))

(declare-fun b!795227 () Bool)

(declare-fun res!539746 () Bool)

(declare-fun e!441416 () Bool)

(assert (=> b!795227 (=> (not res!539746) (not e!441416))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43212 (_ BitVec 32)) Bool)

(assert (=> b!795227 (= res!539746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795228 () Bool)

(declare-fun res!539753 () Bool)

(assert (=> b!795228 (=> (not res!539753) (not e!441416))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795228 (= res!539753 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21107 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20686 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21107 a!3170)) (= (select (arr!20686 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795229 () Bool)

(assert (=> b!795229 (= e!441417 e!441416)))

(declare-fun res!539750 () Bool)

(assert (=> b!795229 (=> (not res!539750) (not e!441416))))

(declare-datatypes ((SeekEntryResult!8277 0))(
  ( (MissingZero!8277 (index!35476 (_ BitVec 32))) (Found!8277 (index!35477 (_ BitVec 32))) (Intermediate!8277 (undefined!9089 Bool) (index!35478 (_ BitVec 32)) (x!66395 (_ BitVec 32))) (Undefined!8277) (MissingVacant!8277 (index!35479 (_ BitVec 32))) )
))
(declare-fun lt!354466 () SeekEntryResult!8277)

(assert (=> b!795229 (= res!539750 (or (= lt!354466 (MissingZero!8277 i!1163)) (= lt!354466 (MissingVacant!8277 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43212 (_ BitVec 32)) SeekEntryResult!8277)

(assert (=> b!795229 (= lt!354466 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795230 () Bool)

(declare-fun res!539752 () Bool)

(assert (=> b!795230 (=> (not res!539752) (not e!441417))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795230 (= res!539752 (and (= (size!21107 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21107 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21107 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795231 () Bool)

(declare-fun e!441419 () Bool)

(assert (=> b!795231 (= e!441416 e!441419)))

(declare-fun res!539744 () Bool)

(assert (=> b!795231 (=> (not res!539744) (not e!441419))))

(declare-fun lt!354469 () (_ BitVec 64))

(declare-fun lt!354468 () array!43212)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43212 (_ BitVec 32)) SeekEntryResult!8277)

(assert (=> b!795231 (= res!539744 (= (seekEntryOrOpen!0 lt!354469 lt!354468 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354469 lt!354468 mask!3266)))))

(assert (=> b!795231 (= lt!354469 (select (store (arr!20686 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795231 (= lt!354468 (array!43213 (store (arr!20686 a!3170) i!1163 k0!2044) (size!21107 a!3170)))))

(declare-fun b!795232 () Bool)

(declare-fun res!539751 () Bool)

(assert (=> b!795232 (=> (not res!539751) (not e!441417))))

(assert (=> b!795232 (= res!539751 (validKeyInArray!0 (select (arr!20686 a!3170) j!153)))))

(declare-fun res!539747 () Bool)

(assert (=> start!68422 (=> (not res!539747) (not e!441417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68422 (= res!539747 (validMask!0 mask!3266))))

(assert (=> start!68422 e!441417))

(assert (=> start!68422 true))

(declare-fun array_inv!16482 (array!43212) Bool)

(assert (=> start!68422 (array_inv!16482 a!3170)))

(declare-fun b!795233 () Bool)

(declare-fun res!539745 () Bool)

(assert (=> b!795233 (=> (not res!539745) (not e!441416))))

(declare-datatypes ((List!14649 0))(
  ( (Nil!14646) (Cons!14645 (h!15774 (_ BitVec 64)) (t!20964 List!14649)) )
))
(declare-fun arrayNoDuplicates!0 (array!43212 (_ BitVec 32) List!14649) Bool)

(assert (=> b!795233 (= res!539745 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14646))))

(declare-fun b!795234 () Bool)

(assert (=> b!795234 (= e!441419 false)))

(declare-fun lt!354470 () SeekEntryResult!8277)

(assert (=> b!795234 (= lt!354470 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20686 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354467 () SeekEntryResult!8277)

(assert (=> b!795234 (= lt!354467 (seekEntryOrOpen!0 (select (arr!20686 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68422 res!539747) b!795230))

(assert (= (and b!795230 res!539752) b!795232))

(assert (= (and b!795232 res!539751) b!795226))

(assert (= (and b!795226 res!539748) b!795225))

(assert (= (and b!795225 res!539749) b!795229))

(assert (= (and b!795229 res!539750) b!795227))

(assert (= (and b!795227 res!539746) b!795233))

(assert (= (and b!795233 res!539745) b!795228))

(assert (= (and b!795228 res!539753) b!795231))

(assert (= (and b!795231 res!539744) b!795234))

(declare-fun m!735831 () Bool)

(assert (=> b!795228 m!735831))

(declare-fun m!735833 () Bool)

(assert (=> b!795228 m!735833))

(declare-fun m!735835 () Bool)

(assert (=> b!795227 m!735835))

(declare-fun m!735837 () Bool)

(assert (=> b!795229 m!735837))

(declare-fun m!735839 () Bool)

(assert (=> b!795231 m!735839))

(declare-fun m!735841 () Bool)

(assert (=> b!795231 m!735841))

(declare-fun m!735843 () Bool)

(assert (=> b!795231 m!735843))

(declare-fun m!735845 () Bool)

(assert (=> b!795231 m!735845))

(declare-fun m!735847 () Bool)

(assert (=> b!795232 m!735847))

(assert (=> b!795232 m!735847))

(declare-fun m!735849 () Bool)

(assert (=> b!795232 m!735849))

(declare-fun m!735851 () Bool)

(assert (=> b!795226 m!735851))

(declare-fun m!735853 () Bool)

(assert (=> b!795225 m!735853))

(assert (=> b!795234 m!735847))

(assert (=> b!795234 m!735847))

(declare-fun m!735855 () Bool)

(assert (=> b!795234 m!735855))

(assert (=> b!795234 m!735847))

(declare-fun m!735857 () Bool)

(assert (=> b!795234 m!735857))

(declare-fun m!735859 () Bool)

(assert (=> b!795233 m!735859))

(declare-fun m!735861 () Bool)

(assert (=> start!68422 m!735861))

(declare-fun m!735863 () Bool)

(assert (=> start!68422 m!735863))

(check-sat (not b!795233) (not b!795227) (not start!68422) (not b!795232) (not b!795225) (not b!795229) (not b!795226) (not b!795234) (not b!795231))
(check-sat)
