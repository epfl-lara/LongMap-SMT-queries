; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68400 () Bool)

(assert start!68400)

(declare-fun b!793817 () Bool)

(declare-fun res!537962 () Bool)

(declare-fun e!441078 () Bool)

(assert (=> b!793817 (=> (not res!537962) (not e!441078))))

(declare-datatypes ((array!43064 0))(
  ( (array!43065 (arr!20608 (Array (_ BitVec 32) (_ BitVec 64))) (size!21028 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43064)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793817 (= res!537962 (validKeyInArray!0 (select (arr!20608 a!3170) j!153)))))

(declare-fun b!793818 () Bool)

(declare-fun res!537963 () Bool)

(assert (=> b!793818 (=> (not res!537963) (not e!441078))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793818 (= res!537963 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793819 () Bool)

(declare-fun res!537966 () Bool)

(declare-fun e!441077 () Bool)

(assert (=> b!793819 (=> (not res!537966) (not e!441077))))

(declare-datatypes ((List!14478 0))(
  ( (Nil!14475) (Cons!14474 (h!15609 (_ BitVec 64)) (t!20785 List!14478)) )
))
(declare-fun arrayNoDuplicates!0 (array!43064 (_ BitVec 32) List!14478) Bool)

(assert (=> b!793819 (= res!537966 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14475))))

(declare-fun b!793820 () Bool)

(declare-fun res!537969 () Bool)

(assert (=> b!793820 (=> (not res!537969) (not e!441078))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793820 (= res!537969 (and (= (size!21028 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21028 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21028 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793821 () Bool)

(assert (=> b!793821 (= e!441078 e!441077)))

(declare-fun res!537967 () Bool)

(assert (=> b!793821 (=> (not res!537967) (not e!441077))))

(declare-datatypes ((SeekEntryResult!8155 0))(
  ( (MissingZero!8155 (index!34988 (_ BitVec 32))) (Found!8155 (index!34989 (_ BitVec 32))) (Intermediate!8155 (undefined!8967 Bool) (index!34990 (_ BitVec 32)) (x!66092 (_ BitVec 32))) (Undefined!8155) (MissingVacant!8155 (index!34991 (_ BitVec 32))) )
))
(declare-fun lt!353932 () SeekEntryResult!8155)

(assert (=> b!793821 (= res!537967 (or (= lt!353932 (MissingZero!8155 i!1163)) (= lt!353932 (MissingVacant!8155 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43064 (_ BitVec 32)) SeekEntryResult!8155)

(assert (=> b!793821 (= lt!353932 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!537964 () Bool)

(assert (=> start!68400 (=> (not res!537964) (not e!441078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68400 (= res!537964 (validMask!0 mask!3266))))

(assert (=> start!68400 e!441078))

(assert (=> start!68400 true))

(declare-fun array_inv!16467 (array!43064) Bool)

(assert (=> start!68400 (array_inv!16467 a!3170)))

(declare-fun b!793822 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793822 (= e!441077 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21028 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20608 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21028 a!3170)) (= (select (arr!20608 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!793823 () Bool)

(declare-fun res!537965 () Bool)

(assert (=> b!793823 (=> (not res!537965) (not e!441077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43064 (_ BitVec 32)) Bool)

(assert (=> b!793823 (= res!537965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793824 () Bool)

(declare-fun res!537968 () Bool)

(assert (=> b!793824 (=> (not res!537968) (not e!441078))))

(assert (=> b!793824 (= res!537968 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68400 res!537964) b!793820))

(assert (= (and b!793820 res!537969) b!793817))

(assert (= (and b!793817 res!537962) b!793824))

(assert (= (and b!793824 res!537968) b!793818))

(assert (= (and b!793818 res!537963) b!793821))

(assert (= (and b!793821 res!537967) b!793823))

(assert (= (and b!793823 res!537965) b!793819))

(assert (= (and b!793819 res!537966) b!793822))

(declare-fun m!734729 () Bool)

(assert (=> b!793817 m!734729))

(assert (=> b!793817 m!734729))

(declare-fun m!734731 () Bool)

(assert (=> b!793817 m!734731))

(declare-fun m!734733 () Bool)

(assert (=> b!793824 m!734733))

(declare-fun m!734735 () Bool)

(assert (=> b!793819 m!734735))

(declare-fun m!734737 () Bool)

(assert (=> start!68400 m!734737))

(declare-fun m!734739 () Bool)

(assert (=> start!68400 m!734739))

(declare-fun m!734741 () Bool)

(assert (=> b!793821 m!734741))

(declare-fun m!734743 () Bool)

(assert (=> b!793822 m!734743))

(declare-fun m!734745 () Bool)

(assert (=> b!793822 m!734745))

(declare-fun m!734747 () Bool)

(assert (=> b!793818 m!734747))

(declare-fun m!734749 () Bool)

(assert (=> b!793823 m!734749))

(check-sat (not b!793817) (not b!793819) (not b!793823) (not b!793821) (not start!68400) (not b!793818) (not b!793824))
(check-sat)
