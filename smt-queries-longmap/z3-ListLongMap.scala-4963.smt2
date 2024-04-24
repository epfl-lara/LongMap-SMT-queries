; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68412 () Bool)

(assert start!68412)

(declare-fun b!793952 () Bool)

(declare-fun res!538100 () Bool)

(declare-fun e!441133 () Bool)

(assert (=> b!793952 (=> (not res!538100) (not e!441133))))

(declare-datatypes ((array!43076 0))(
  ( (array!43077 (arr!20614 (Array (_ BitVec 32) (_ BitVec 64))) (size!21034 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43076)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793952 (= res!538100 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793953 () Bool)

(declare-fun res!538102 () Bool)

(assert (=> b!793953 (=> (not res!538102) (not e!441133))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793953 (= res!538102 (and (= (size!21034 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21034 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21034 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793954 () Bool)

(declare-fun e!441132 () Bool)

(assert (=> b!793954 (= e!441133 e!441132)))

(declare-fun res!538101 () Bool)

(assert (=> b!793954 (=> (not res!538101) (not e!441132))))

(declare-datatypes ((SeekEntryResult!8161 0))(
  ( (MissingZero!8161 (index!35012 (_ BitVec 32))) (Found!8161 (index!35013 (_ BitVec 32))) (Intermediate!8161 (undefined!8973 Bool) (index!35014 (_ BitVec 32)) (x!66114 (_ BitVec 32))) (Undefined!8161) (MissingVacant!8161 (index!35015 (_ BitVec 32))) )
))
(declare-fun lt!353959 () SeekEntryResult!8161)

(assert (=> b!793954 (= res!538101 (or (= lt!353959 (MissingZero!8161 i!1163)) (= lt!353959 (MissingVacant!8161 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43076 (_ BitVec 32)) SeekEntryResult!8161)

(assert (=> b!793954 (= lt!353959 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793955 () Bool)

(declare-fun res!538098 () Bool)

(assert (=> b!793955 (=> (not res!538098) (not e!441132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43076 (_ BitVec 32)) Bool)

(assert (=> b!793955 (= res!538098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793956 () Bool)

(declare-fun res!538103 () Bool)

(assert (=> b!793956 (=> (not res!538103) (not e!441133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793956 (= res!538103 (validKeyInArray!0 k0!2044))))

(declare-fun b!793957 () Bool)

(declare-fun res!538097 () Bool)

(assert (=> b!793957 (=> (not res!538097) (not e!441133))))

(assert (=> b!793957 (= res!538097 (validKeyInArray!0 (select (arr!20614 a!3170) j!153)))))

(declare-fun res!538099 () Bool)

(assert (=> start!68412 (=> (not res!538099) (not e!441133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68412 (= res!538099 (validMask!0 mask!3266))))

(assert (=> start!68412 e!441133))

(assert (=> start!68412 true))

(declare-fun array_inv!16473 (array!43076) Bool)

(assert (=> start!68412 (array_inv!16473 a!3170)))

(declare-fun b!793958 () Bool)

(declare-fun res!538104 () Bool)

(assert (=> b!793958 (=> (not res!538104) (not e!441132))))

(declare-datatypes ((List!14484 0))(
  ( (Nil!14481) (Cons!14480 (h!15615 (_ BitVec 64)) (t!20791 List!14484)) )
))
(declare-fun arrayNoDuplicates!0 (array!43076 (_ BitVec 32) List!14484) Bool)

(assert (=> b!793958 (= res!538104 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14481))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!793959 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793959 (= e!441132 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21034 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20614 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21034 a!3170)) (= (select (arr!20614 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (= (and start!68412 res!538099) b!793953))

(assert (= (and b!793953 res!538102) b!793957))

(assert (= (and b!793957 res!538097) b!793956))

(assert (= (and b!793956 res!538103) b!793952))

(assert (= (and b!793952 res!538100) b!793954))

(assert (= (and b!793954 res!538101) b!793955))

(assert (= (and b!793955 res!538098) b!793958))

(assert (= (and b!793958 res!538104) b!793959))

(declare-fun m!734849 () Bool)

(assert (=> b!793955 m!734849))

(declare-fun m!734851 () Bool)

(assert (=> b!793959 m!734851))

(declare-fun m!734853 () Bool)

(assert (=> b!793959 m!734853))

(declare-fun m!734855 () Bool)

(assert (=> b!793957 m!734855))

(assert (=> b!793957 m!734855))

(declare-fun m!734857 () Bool)

(assert (=> b!793957 m!734857))

(declare-fun m!734859 () Bool)

(assert (=> b!793954 m!734859))

(declare-fun m!734861 () Bool)

(assert (=> start!68412 m!734861))

(declare-fun m!734863 () Bool)

(assert (=> start!68412 m!734863))

(declare-fun m!734865 () Bool)

(assert (=> b!793956 m!734865))

(declare-fun m!734867 () Bool)

(assert (=> b!793958 m!734867))

(declare-fun m!734869 () Bool)

(assert (=> b!793952 m!734869))

(check-sat (not start!68412) (not b!793954) (not b!793952) (not b!793956) (not b!793957) (not b!793958) (not b!793955))
(check-sat)
