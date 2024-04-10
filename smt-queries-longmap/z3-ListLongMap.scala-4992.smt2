; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68464 () Bool)

(assert start!68464)

(declare-fun b!795855 () Bool)

(declare-fun res!540377 () Bool)

(declare-fun e!441671 () Bool)

(assert (=> b!795855 (=> (not res!540377) (not e!441671))))

(declare-datatypes ((array!43254 0))(
  ( (array!43255 (arr!20707 (Array (_ BitVec 32) (_ BitVec 64))) (size!21128 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43254)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795855 (= res!540377 (validKeyInArray!0 (select (arr!20707 a!3170) j!153)))))

(declare-fun res!540382 () Bool)

(assert (=> start!68464 (=> (not res!540382) (not e!441671))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68464 (= res!540382 (validMask!0 mask!3266))))

(assert (=> start!68464 e!441671))

(assert (=> start!68464 true))

(declare-fun array_inv!16503 (array!43254) Bool)

(assert (=> start!68464 (array_inv!16503 a!3170)))

(declare-fun b!795856 () Bool)

(declare-fun res!540376 () Bool)

(assert (=> b!795856 (=> (not res!540376) (not e!441671))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!795856 (= res!540376 (validKeyInArray!0 k0!2044))))

(declare-fun b!795857 () Bool)

(declare-fun res!540380 () Bool)

(declare-fun e!441669 () Bool)

(assert (=> b!795857 (=> (not res!540380) (not e!441669))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795857 (= res!540380 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21128 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20707 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21128 a!3170)) (= (select (arr!20707 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795858 () Bool)

(assert (=> b!795858 (= e!441671 e!441669)))

(declare-fun res!540381 () Bool)

(assert (=> b!795858 (=> (not res!540381) (not e!441669))))

(declare-datatypes ((SeekEntryResult!8298 0))(
  ( (MissingZero!8298 (index!35560 (_ BitVec 32))) (Found!8298 (index!35561 (_ BitVec 32))) (Intermediate!8298 (undefined!9110 Bool) (index!35562 (_ BitVec 32)) (x!66472 (_ BitVec 32))) (Undefined!8298) (MissingVacant!8298 (index!35563 (_ BitVec 32))) )
))
(declare-fun lt!354784 () SeekEntryResult!8298)

(assert (=> b!795858 (= res!540381 (or (= lt!354784 (MissingZero!8298 i!1163)) (= lt!354784 (MissingVacant!8298 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43254 (_ BitVec 32)) SeekEntryResult!8298)

(assert (=> b!795858 (= lt!354784 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795859 () Bool)

(declare-fun res!540375 () Bool)

(assert (=> b!795859 (=> (not res!540375) (not e!441671))))

(assert (=> b!795859 (= res!540375 (and (= (size!21128 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21128 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21128 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795860 () Bool)

(declare-fun e!441670 () Bool)

(declare-fun lt!354783 () SeekEntryResult!8298)

(declare-fun lt!354782 () SeekEntryResult!8298)

(assert (=> b!795860 (= e!441670 (and (= lt!354783 lt!354782) (= lt!354782 (Found!8298 j!153)) (= (select (arr!20707 a!3170) index!1236) (select (arr!20707 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20707 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43254 (_ BitVec 32)) SeekEntryResult!8298)

(assert (=> b!795860 (= lt!354782 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20707 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795860 (= lt!354783 (seekEntryOrOpen!0 (select (arr!20707 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795861 () Bool)

(declare-fun res!540374 () Bool)

(assert (=> b!795861 (=> (not res!540374) (not e!441669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43254 (_ BitVec 32)) Bool)

(assert (=> b!795861 (= res!540374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795862 () Bool)

(assert (=> b!795862 (= e!441669 e!441670)))

(declare-fun res!540378 () Bool)

(assert (=> b!795862 (=> (not res!540378) (not e!441670))))

(declare-fun lt!354785 () array!43254)

(declare-fun lt!354781 () (_ BitVec 64))

(assert (=> b!795862 (= res!540378 (= (seekEntryOrOpen!0 lt!354781 lt!354785 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354781 lt!354785 mask!3266)))))

(assert (=> b!795862 (= lt!354781 (select (store (arr!20707 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795862 (= lt!354785 (array!43255 (store (arr!20707 a!3170) i!1163 k0!2044) (size!21128 a!3170)))))

(declare-fun b!795863 () Bool)

(declare-fun res!540383 () Bool)

(assert (=> b!795863 (=> (not res!540383) (not e!441669))))

(declare-datatypes ((List!14670 0))(
  ( (Nil!14667) (Cons!14666 (h!15795 (_ BitVec 64)) (t!20985 List!14670)) )
))
(declare-fun arrayNoDuplicates!0 (array!43254 (_ BitVec 32) List!14670) Bool)

(assert (=> b!795863 (= res!540383 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14667))))

(declare-fun b!795864 () Bool)

(declare-fun res!540379 () Bool)

(assert (=> b!795864 (=> (not res!540379) (not e!441671))))

(declare-fun arrayContainsKey!0 (array!43254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795864 (= res!540379 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68464 res!540382) b!795859))

(assert (= (and b!795859 res!540375) b!795855))

(assert (= (and b!795855 res!540377) b!795856))

(assert (= (and b!795856 res!540376) b!795864))

(assert (= (and b!795864 res!540379) b!795858))

(assert (= (and b!795858 res!540381) b!795861))

(assert (= (and b!795861 res!540374) b!795863))

(assert (= (and b!795863 res!540383) b!795857))

(assert (= (and b!795857 res!540380) b!795862))

(assert (= (and b!795862 res!540378) b!795860))

(declare-fun m!736567 () Bool)

(assert (=> b!795855 m!736567))

(assert (=> b!795855 m!736567))

(declare-fun m!736569 () Bool)

(assert (=> b!795855 m!736569))

(declare-fun m!736571 () Bool)

(assert (=> b!795856 m!736571))

(declare-fun m!736573 () Bool)

(assert (=> b!795864 m!736573))

(declare-fun m!736575 () Bool)

(assert (=> b!795857 m!736575))

(declare-fun m!736577 () Bool)

(assert (=> b!795857 m!736577))

(declare-fun m!736579 () Bool)

(assert (=> start!68464 m!736579))

(declare-fun m!736581 () Bool)

(assert (=> start!68464 m!736581))

(declare-fun m!736583 () Bool)

(assert (=> b!795861 m!736583))

(assert (=> b!795860 m!736567))

(declare-fun m!736585 () Bool)

(assert (=> b!795860 m!736585))

(declare-fun m!736587 () Bool)

(assert (=> b!795860 m!736587))

(assert (=> b!795860 m!736567))

(declare-fun m!736589 () Bool)

(assert (=> b!795860 m!736589))

(assert (=> b!795860 m!736567))

(declare-fun m!736591 () Bool)

(assert (=> b!795860 m!736591))

(declare-fun m!736593 () Bool)

(assert (=> b!795860 m!736593))

(declare-fun m!736595 () Bool)

(assert (=> b!795863 m!736595))

(declare-fun m!736597 () Bool)

(assert (=> b!795862 m!736597))

(declare-fun m!736599 () Bool)

(assert (=> b!795862 m!736599))

(assert (=> b!795862 m!736593))

(declare-fun m!736601 () Bool)

(assert (=> b!795862 m!736601))

(declare-fun m!736603 () Bool)

(assert (=> b!795858 m!736603))

(check-sat (not b!795860) (not b!795864) (not b!795858) (not b!795856) (not b!795861) (not start!68464) (not b!795855) (not b!795863) (not b!795862))
(check-sat)
