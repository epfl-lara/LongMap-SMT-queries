; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69380 () Bool)

(assert start!69380)

(declare-fun b!808226 () Bool)

(declare-fun res!551811 () Bool)

(declare-fun e!447577 () Bool)

(assert (=> b!808226 (=> (not res!551811) (not e!447577))))

(declare-datatypes ((array!43912 0))(
  ( (array!43913 (arr!21028 (Array (_ BitVec 32) (_ BitVec 64))) (size!21448 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43912)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43912 (_ BitVec 32)) Bool)

(assert (=> b!808226 (= res!551811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808227 () Bool)

(declare-fun res!551801 () Bool)

(declare-fun e!447576 () Bool)

(assert (=> b!808227 (=> (not res!551801) (not e!447576))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808227 (= res!551801 (and (= (size!21448 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21448 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21448 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808229 () Bool)

(declare-fun e!447579 () Bool)

(assert (=> b!808229 (= e!447579 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362032 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808229 (= lt!362032 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!808230 () Bool)

(declare-fun res!551808 () Bool)

(assert (=> b!808230 (=> (not res!551808) (not e!447576))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808230 (= res!551808 (validKeyInArray!0 k0!2044))))

(declare-fun b!808231 () Bool)

(declare-fun res!551803 () Bool)

(assert (=> b!808231 (=> (not res!551803) (not e!447577))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808231 (= res!551803 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21448 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21028 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21448 a!3170)) (= (select (arr!21028 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808232 () Bool)

(declare-fun res!551804 () Bool)

(assert (=> b!808232 (=> (not res!551804) (not e!447576))))

(declare-fun arrayContainsKey!0 (array!43912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808232 (= res!551804 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808233 () Bool)

(declare-fun e!447578 () Bool)

(assert (=> b!808233 (= e!447578 e!447579)))

(declare-fun res!551805 () Bool)

(assert (=> b!808233 (=> (not res!551805) (not e!447579))))

(declare-datatypes ((SeekEntryResult!8575 0))(
  ( (MissingZero!8575 (index!36668 (_ BitVec 32))) (Found!8575 (index!36669 (_ BitVec 32))) (Intermediate!8575 (undefined!9387 Bool) (index!36670 (_ BitVec 32)) (x!67641 (_ BitVec 32))) (Undefined!8575) (MissingVacant!8575 (index!36671 (_ BitVec 32))) )
))
(declare-fun lt!362034 () SeekEntryResult!8575)

(declare-fun lt!362033 () SeekEntryResult!8575)

(assert (=> b!808233 (= res!551805 (and (= lt!362033 lt!362034) (= lt!362034 (Found!8575 j!153)) (not (= (select (arr!21028 a!3170) index!1236) (select (arr!21028 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43912 (_ BitVec 32)) SeekEntryResult!8575)

(assert (=> b!808233 (= lt!362034 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21028 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43912 (_ BitVec 32)) SeekEntryResult!8575)

(assert (=> b!808233 (= lt!362033 (seekEntryOrOpen!0 (select (arr!21028 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808234 () Bool)

(declare-fun res!551810 () Bool)

(assert (=> b!808234 (=> (not res!551810) (not e!447576))))

(assert (=> b!808234 (= res!551810 (validKeyInArray!0 (select (arr!21028 a!3170) j!153)))))

(declare-fun b!808235 () Bool)

(declare-fun res!551809 () Bool)

(assert (=> b!808235 (=> (not res!551809) (not e!447577))))

(declare-datatypes ((List!14898 0))(
  ( (Nil!14895) (Cons!14894 (h!16029 (_ BitVec 64)) (t!21205 List!14898)) )
))
(declare-fun arrayNoDuplicates!0 (array!43912 (_ BitVec 32) List!14898) Bool)

(assert (=> b!808235 (= res!551809 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14895))))

(declare-fun b!808236 () Bool)

(assert (=> b!808236 (= e!447577 e!447578)))

(declare-fun res!551802 () Bool)

(assert (=> b!808236 (=> (not res!551802) (not e!447578))))

(declare-fun lt!362031 () array!43912)

(declare-fun lt!362035 () (_ BitVec 64))

(assert (=> b!808236 (= res!551802 (= (seekEntryOrOpen!0 lt!362035 lt!362031 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362035 lt!362031 mask!3266)))))

(assert (=> b!808236 (= lt!362035 (select (store (arr!21028 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808236 (= lt!362031 (array!43913 (store (arr!21028 a!3170) i!1163 k0!2044) (size!21448 a!3170)))))

(declare-fun res!551807 () Bool)

(assert (=> start!69380 (=> (not res!551807) (not e!447576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69380 (= res!551807 (validMask!0 mask!3266))))

(assert (=> start!69380 e!447576))

(assert (=> start!69380 true))

(declare-fun array_inv!16887 (array!43912) Bool)

(assert (=> start!69380 (array_inv!16887 a!3170)))

(declare-fun b!808228 () Bool)

(assert (=> b!808228 (= e!447576 e!447577)))

(declare-fun res!551806 () Bool)

(assert (=> b!808228 (=> (not res!551806) (not e!447577))))

(declare-fun lt!362036 () SeekEntryResult!8575)

(assert (=> b!808228 (= res!551806 (or (= lt!362036 (MissingZero!8575 i!1163)) (= lt!362036 (MissingVacant!8575 i!1163))))))

(assert (=> b!808228 (= lt!362036 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69380 res!551807) b!808227))

(assert (= (and b!808227 res!551801) b!808234))

(assert (= (and b!808234 res!551810) b!808230))

(assert (= (and b!808230 res!551808) b!808232))

(assert (= (and b!808232 res!551804) b!808228))

(assert (= (and b!808228 res!551806) b!808226))

(assert (= (and b!808226 res!551811) b!808235))

(assert (= (and b!808235 res!551809) b!808231))

(assert (= (and b!808231 res!551803) b!808236))

(assert (= (and b!808236 res!551802) b!808233))

(assert (= (and b!808233 res!551805) b!808229))

(declare-fun m!750613 () Bool)

(assert (=> b!808234 m!750613))

(assert (=> b!808234 m!750613))

(declare-fun m!750615 () Bool)

(assert (=> b!808234 m!750615))

(declare-fun m!750617 () Bool)

(assert (=> b!808233 m!750617))

(assert (=> b!808233 m!750613))

(assert (=> b!808233 m!750613))

(declare-fun m!750619 () Bool)

(assert (=> b!808233 m!750619))

(assert (=> b!808233 m!750613))

(declare-fun m!750621 () Bool)

(assert (=> b!808233 m!750621))

(declare-fun m!750623 () Bool)

(assert (=> b!808236 m!750623))

(declare-fun m!750625 () Bool)

(assert (=> b!808236 m!750625))

(declare-fun m!750627 () Bool)

(assert (=> b!808236 m!750627))

(declare-fun m!750629 () Bool)

(assert (=> b!808236 m!750629))

(declare-fun m!750631 () Bool)

(assert (=> b!808232 m!750631))

(declare-fun m!750633 () Bool)

(assert (=> b!808235 m!750633))

(declare-fun m!750635 () Bool)

(assert (=> b!808229 m!750635))

(declare-fun m!750637 () Bool)

(assert (=> start!69380 m!750637))

(declare-fun m!750639 () Bool)

(assert (=> start!69380 m!750639))

(declare-fun m!750641 () Bool)

(assert (=> b!808226 m!750641))

(declare-fun m!750643 () Bool)

(assert (=> b!808230 m!750643))

(declare-fun m!750645 () Bool)

(assert (=> b!808228 m!750645))

(declare-fun m!750647 () Bool)

(assert (=> b!808231 m!750647))

(declare-fun m!750649 () Bool)

(assert (=> b!808231 m!750649))

(check-sat (not b!808230) (not b!808229) (not b!808235) (not b!808234) (not b!808233) (not b!808226) (not b!808228) (not start!69380) (not b!808232) (not b!808236))
(check-sat)
