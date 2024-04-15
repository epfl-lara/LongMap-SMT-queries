; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69162 () Bool)

(assert start!69162)

(declare-fun b!806587 () Bool)

(declare-fun res!550852 () Bool)

(declare-fun e!446622 () Bool)

(assert (=> b!806587 (=> (not res!550852) (not e!446622))))

(declare-datatypes ((array!43879 0))(
  ( (array!43880 (arr!21017 (Array (_ BitVec 32) (_ BitVec 64))) (size!21438 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43879)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43879 (_ BitVec 32)) Bool)

(assert (=> b!806587 (= res!550852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806588 () Bool)

(declare-fun e!446620 () Bool)

(assert (=> b!806588 (= e!446620 e!446622)))

(declare-fun res!550857 () Bool)

(assert (=> b!806588 (=> (not res!550857) (not e!446622))))

(declare-datatypes ((SeekEntryResult!8605 0))(
  ( (MissingZero!8605 (index!36788 (_ BitVec 32))) (Found!8605 (index!36789 (_ BitVec 32))) (Intermediate!8605 (undefined!9417 Bool) (index!36790 (_ BitVec 32)) (x!67612 (_ BitVec 32))) (Undefined!8605) (MissingVacant!8605 (index!36791 (_ BitVec 32))) )
))
(declare-fun lt!361152 () SeekEntryResult!8605)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806588 (= res!550857 (or (= lt!361152 (MissingZero!8605 i!1163)) (= lt!361152 (MissingVacant!8605 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43879 (_ BitVec 32)) SeekEntryResult!8605)

(assert (=> b!806588 (= lt!361152 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806589 () Bool)

(declare-fun res!550850 () Bool)

(assert (=> b!806589 (=> (not res!550850) (not e!446620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806589 (= res!550850 (validKeyInArray!0 k0!2044))))

(declare-fun b!806590 () Bool)

(declare-fun res!550858 () Bool)

(assert (=> b!806590 (=> (not res!550858) (not e!446620))))

(declare-fun arrayContainsKey!0 (array!43879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806590 (= res!550858 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806591 () Bool)

(declare-fun e!446621 () Bool)

(declare-fun e!446618 () Bool)

(assert (=> b!806591 (= e!446621 e!446618)))

(declare-fun res!550856 () Bool)

(assert (=> b!806591 (=> (not res!550856) (not e!446618))))

(declare-fun lt!361156 () SeekEntryResult!8605)

(declare-fun lt!361154 () SeekEntryResult!8605)

(assert (=> b!806591 (= res!550856 (= lt!361156 lt!361154))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43879 (_ BitVec 32)) SeekEntryResult!8605)

(assert (=> b!806591 (= lt!361154 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21017 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806591 (= lt!361156 (seekEntryOrOpen!0 (select (arr!21017 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!361150 () SeekEntryResult!8605)

(declare-fun b!806592 () Bool)

(declare-fun e!446619 () Bool)

(declare-fun lt!361157 () SeekEntryResult!8605)

(assert (=> b!806592 (= e!446619 (not (or (not (= lt!361157 lt!361150)) (= lt!361157 lt!361154))))))

(assert (=> b!806592 (= lt!361157 (Found!8605 index!1236))))

(declare-fun b!806593 () Bool)

(declare-fun res!550849 () Bool)

(assert (=> b!806593 (=> (not res!550849) (not e!446622))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!806593 (= res!550849 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21438 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21017 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21438 a!3170)) (= (select (arr!21017 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806586 () Bool)

(assert (=> b!806586 (= e!446618 e!446619)))

(declare-fun res!550854 () Bool)

(assert (=> b!806586 (=> (not res!550854) (not e!446619))))

(assert (=> b!806586 (= res!550854 (and (= lt!361154 lt!361150) (= (select (arr!21017 a!3170) index!1236) (select (arr!21017 a!3170) j!153))))))

(assert (=> b!806586 (= lt!361150 (Found!8605 j!153))))

(declare-fun res!550860 () Bool)

(assert (=> start!69162 (=> (not res!550860) (not e!446620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69162 (= res!550860 (validMask!0 mask!3266))))

(assert (=> start!69162 e!446620))

(assert (=> start!69162 true))

(declare-fun array_inv!16900 (array!43879) Bool)

(assert (=> start!69162 (array_inv!16900 a!3170)))

(declare-fun b!806594 () Bool)

(declare-fun res!550853 () Bool)

(assert (=> b!806594 (=> (not res!550853) (not e!446620))))

(assert (=> b!806594 (= res!550853 (validKeyInArray!0 (select (arr!21017 a!3170) j!153)))))

(declare-fun b!806595 () Bool)

(assert (=> b!806595 (= e!446622 e!446621)))

(declare-fun res!550859 () Bool)

(assert (=> b!806595 (=> (not res!550859) (not e!446621))))

(declare-fun lt!361155 () SeekEntryResult!8605)

(assert (=> b!806595 (= res!550859 (= lt!361155 lt!361157))))

(declare-fun lt!361153 () (_ BitVec 64))

(declare-fun lt!361151 () array!43879)

(assert (=> b!806595 (= lt!361157 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361153 lt!361151 mask!3266))))

(assert (=> b!806595 (= lt!361155 (seekEntryOrOpen!0 lt!361153 lt!361151 mask!3266))))

(assert (=> b!806595 (= lt!361153 (select (store (arr!21017 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806595 (= lt!361151 (array!43880 (store (arr!21017 a!3170) i!1163 k0!2044) (size!21438 a!3170)))))

(declare-fun b!806596 () Bool)

(declare-fun res!550851 () Bool)

(assert (=> b!806596 (=> (not res!550851) (not e!446620))))

(assert (=> b!806596 (= res!550851 (and (= (size!21438 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21438 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21438 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806597 () Bool)

(declare-fun res!550855 () Bool)

(assert (=> b!806597 (=> (not res!550855) (not e!446622))))

(declare-datatypes ((List!15019 0))(
  ( (Nil!15016) (Cons!15015 (h!16144 (_ BitVec 64)) (t!21325 List!15019)) )
))
(declare-fun arrayNoDuplicates!0 (array!43879 (_ BitVec 32) List!15019) Bool)

(assert (=> b!806597 (= res!550855 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15016))))

(assert (= (and start!69162 res!550860) b!806596))

(assert (= (and b!806596 res!550851) b!806594))

(assert (= (and b!806594 res!550853) b!806589))

(assert (= (and b!806589 res!550850) b!806590))

(assert (= (and b!806590 res!550858) b!806588))

(assert (= (and b!806588 res!550857) b!806587))

(assert (= (and b!806587 res!550852) b!806597))

(assert (= (and b!806597 res!550855) b!806593))

(assert (= (and b!806593 res!550849) b!806595))

(assert (= (and b!806595 res!550859) b!806591))

(assert (= (and b!806591 res!550856) b!806586))

(assert (= (and b!806586 res!550854) b!806592))

(declare-fun m!748051 () Bool)

(assert (=> b!806597 m!748051))

(declare-fun m!748053 () Bool)

(assert (=> b!806595 m!748053))

(declare-fun m!748055 () Bool)

(assert (=> b!806595 m!748055))

(declare-fun m!748057 () Bool)

(assert (=> b!806595 m!748057))

(declare-fun m!748059 () Bool)

(assert (=> b!806595 m!748059))

(declare-fun m!748061 () Bool)

(assert (=> b!806589 m!748061))

(declare-fun m!748063 () Bool)

(assert (=> b!806591 m!748063))

(assert (=> b!806591 m!748063))

(declare-fun m!748065 () Bool)

(assert (=> b!806591 m!748065))

(assert (=> b!806591 m!748063))

(declare-fun m!748067 () Bool)

(assert (=> b!806591 m!748067))

(declare-fun m!748069 () Bool)

(assert (=> b!806586 m!748069))

(assert (=> b!806586 m!748063))

(declare-fun m!748071 () Bool)

(assert (=> start!69162 m!748071))

(declare-fun m!748073 () Bool)

(assert (=> start!69162 m!748073))

(assert (=> b!806594 m!748063))

(assert (=> b!806594 m!748063))

(declare-fun m!748075 () Bool)

(assert (=> b!806594 m!748075))

(declare-fun m!748077 () Bool)

(assert (=> b!806590 m!748077))

(declare-fun m!748079 () Bool)

(assert (=> b!806593 m!748079))

(declare-fun m!748081 () Bool)

(assert (=> b!806593 m!748081))

(declare-fun m!748083 () Bool)

(assert (=> b!806588 m!748083))

(declare-fun m!748085 () Bool)

(assert (=> b!806587 m!748085))

(check-sat (not b!806590) (not b!806594) (not b!806597) (not b!806595) (not b!806587) (not b!806591) (not start!69162) (not b!806588) (not b!806589))
(check-sat)
