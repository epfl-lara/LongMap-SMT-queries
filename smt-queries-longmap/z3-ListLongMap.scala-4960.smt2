; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68394 () Bool)

(assert start!68394)

(declare-fun b!793752 () Bool)

(declare-fun res!537897 () Bool)

(declare-fun e!441050 () Bool)

(assert (=> b!793752 (=> (not res!537897) (not e!441050))))

(declare-datatypes ((array!43058 0))(
  ( (array!43059 (arr!20605 (Array (_ BitVec 32) (_ BitVec 64))) (size!21025 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43058)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43058 (_ BitVec 32)) Bool)

(assert (=> b!793752 (= res!537897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793753 () Bool)

(declare-fun res!537898 () Bool)

(declare-fun e!441051 () Bool)

(assert (=> b!793753 (=> (not res!537898) (not e!441051))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793753 (= res!537898 (validKeyInArray!0 (select (arr!20605 a!3170) j!153)))))

(declare-fun b!793755 () Bool)

(assert (=> b!793755 (= e!441050 false)))

(declare-fun lt!353917 () Bool)

(declare-datatypes ((List!14475 0))(
  ( (Nil!14472) (Cons!14471 (h!15606 (_ BitVec 64)) (t!20782 List!14475)) )
))
(declare-fun arrayNoDuplicates!0 (array!43058 (_ BitVec 32) List!14475) Bool)

(assert (=> b!793755 (= lt!353917 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14472))))

(declare-fun b!793756 () Bool)

(assert (=> b!793756 (= e!441051 e!441050)))

(declare-fun res!537902 () Bool)

(assert (=> b!793756 (=> (not res!537902) (not e!441050))))

(declare-datatypes ((SeekEntryResult!8152 0))(
  ( (MissingZero!8152 (index!34976 (_ BitVec 32))) (Found!8152 (index!34977 (_ BitVec 32))) (Intermediate!8152 (undefined!8964 Bool) (index!34978 (_ BitVec 32)) (x!66081 (_ BitVec 32))) (Undefined!8152) (MissingVacant!8152 (index!34979 (_ BitVec 32))) )
))
(declare-fun lt!353916 () SeekEntryResult!8152)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793756 (= res!537902 (or (= lt!353916 (MissingZero!8152 i!1163)) (= lt!353916 (MissingVacant!8152 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43058 (_ BitVec 32)) SeekEntryResult!8152)

(assert (=> b!793756 (= lt!353916 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793757 () Bool)

(declare-fun res!537901 () Bool)

(assert (=> b!793757 (=> (not res!537901) (not e!441051))))

(declare-fun arrayContainsKey!0 (array!43058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793757 (= res!537901 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793758 () Bool)

(declare-fun res!537899 () Bool)

(assert (=> b!793758 (=> (not res!537899) (not e!441051))))

(assert (=> b!793758 (= res!537899 (and (= (size!21025 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21025 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21025 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793754 () Bool)

(declare-fun res!537900 () Bool)

(assert (=> b!793754 (=> (not res!537900) (not e!441051))))

(assert (=> b!793754 (= res!537900 (validKeyInArray!0 k0!2044))))

(declare-fun res!537903 () Bool)

(assert (=> start!68394 (=> (not res!537903) (not e!441051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68394 (= res!537903 (validMask!0 mask!3266))))

(assert (=> start!68394 e!441051))

(assert (=> start!68394 true))

(declare-fun array_inv!16464 (array!43058) Bool)

(assert (=> start!68394 (array_inv!16464 a!3170)))

(assert (= (and start!68394 res!537903) b!793758))

(assert (= (and b!793758 res!537899) b!793753))

(assert (= (and b!793753 res!537898) b!793754))

(assert (= (and b!793754 res!537900) b!793757))

(assert (= (and b!793757 res!537901) b!793756))

(assert (= (and b!793756 res!537902) b!793752))

(assert (= (and b!793752 res!537897) b!793755))

(declare-fun m!734675 () Bool)

(assert (=> b!793757 m!734675))

(declare-fun m!734677 () Bool)

(assert (=> b!793754 m!734677))

(declare-fun m!734679 () Bool)

(assert (=> b!793755 m!734679))

(declare-fun m!734681 () Bool)

(assert (=> b!793752 m!734681))

(declare-fun m!734683 () Bool)

(assert (=> b!793756 m!734683))

(declare-fun m!734685 () Bool)

(assert (=> b!793753 m!734685))

(assert (=> b!793753 m!734685))

(declare-fun m!734687 () Bool)

(assert (=> b!793753 m!734687))

(declare-fun m!734689 () Bool)

(assert (=> start!68394 m!734689))

(declare-fun m!734691 () Bool)

(assert (=> start!68394 m!734691))

(check-sat (not b!793754) (not b!793755) (not b!793753) (not b!793752) (not b!793756) (not start!68394) (not b!793757))
(check-sat)
