; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68278 () Bool)

(assert start!68278)

(declare-fun b!793190 () Bool)

(declare-fun res!537712 () Bool)

(declare-fun e!440666 () Bool)

(assert (=> b!793190 (=> (not res!537712) (not e!440666))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43068 0))(
  ( (array!43069 (arr!20614 (Array (_ BitVec 32) (_ BitVec 64))) (size!21035 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43068)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793190 (= res!537712 (and (= (size!21035 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21035 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21035 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793191 () Bool)

(declare-fun res!537711 () Bool)

(assert (=> b!793191 (=> (not res!537711) (not e!440666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793191 (= res!537711 (validKeyInArray!0 (select (arr!20614 a!3170) j!153)))))

(declare-fun b!793192 () Bool)

(declare-fun res!537710 () Bool)

(assert (=> b!793192 (=> (not res!537710) (not e!440666))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793192 (= res!537710 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793193 () Bool)

(declare-fun e!440665 () Bool)

(assert (=> b!793193 (= e!440666 e!440665)))

(declare-fun res!537714 () Bool)

(assert (=> b!793193 (=> (not res!537714) (not e!440665))))

(declare-datatypes ((SeekEntryResult!8205 0))(
  ( (MissingZero!8205 (index!35188 (_ BitVec 32))) (Found!8205 (index!35189 (_ BitVec 32))) (Intermediate!8205 (undefined!9017 Bool) (index!35190 (_ BitVec 32)) (x!66131 (_ BitVec 32))) (Undefined!8205) (MissingVacant!8205 (index!35191 (_ BitVec 32))) )
))
(declare-fun lt!353663 () SeekEntryResult!8205)

(assert (=> b!793193 (= res!537714 (or (= lt!353663 (MissingZero!8205 i!1163)) (= lt!353663 (MissingVacant!8205 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43068 (_ BitVec 32)) SeekEntryResult!8205)

(assert (=> b!793193 (= lt!353663 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!537716 () Bool)

(assert (=> start!68278 (=> (not res!537716) (not e!440666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68278 (= res!537716 (validMask!0 mask!3266))))

(assert (=> start!68278 e!440666))

(assert (=> start!68278 true))

(declare-fun array_inv!16410 (array!43068) Bool)

(assert (=> start!68278 (array_inv!16410 a!3170)))

(declare-fun b!793194 () Bool)

(declare-fun res!537709 () Bool)

(assert (=> b!793194 (=> (not res!537709) (not e!440665))))

(declare-datatypes ((List!14577 0))(
  ( (Nil!14574) (Cons!14573 (h!15702 (_ BitVec 64)) (t!20892 List!14577)) )
))
(declare-fun arrayNoDuplicates!0 (array!43068 (_ BitVec 32) List!14577) Bool)

(assert (=> b!793194 (= res!537709 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14574))))

(declare-fun b!793195 () Bool)

(declare-fun res!537715 () Bool)

(assert (=> b!793195 (=> (not res!537715) (not e!440665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43068 (_ BitVec 32)) Bool)

(assert (=> b!793195 (= res!537715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!793196 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793196 (= e!440665 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21035 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20614 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21035 a!3170)) (= (select (arr!20614 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!793197 () Bool)

(declare-fun res!537713 () Bool)

(assert (=> b!793197 (=> (not res!537713) (not e!440666))))

(assert (=> b!793197 (= res!537713 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68278 res!537716) b!793190))

(assert (= (and b!793190 res!537712) b!793191))

(assert (= (and b!793191 res!537711) b!793197))

(assert (= (and b!793197 res!537713) b!793192))

(assert (= (and b!793192 res!537710) b!793193))

(assert (= (and b!793193 res!537714) b!793195))

(assert (= (and b!793195 res!537715) b!793194))

(assert (= (and b!793194 res!537709) b!793196))

(declare-fun m!733671 () Bool)

(assert (=> b!793195 m!733671))

(declare-fun m!733673 () Bool)

(assert (=> b!793197 m!733673))

(declare-fun m!733675 () Bool)

(assert (=> b!793196 m!733675))

(declare-fun m!733677 () Bool)

(assert (=> b!793196 m!733677))

(declare-fun m!733679 () Bool)

(assert (=> b!793192 m!733679))

(declare-fun m!733681 () Bool)

(assert (=> start!68278 m!733681))

(declare-fun m!733683 () Bool)

(assert (=> start!68278 m!733683))

(declare-fun m!733685 () Bool)

(assert (=> b!793193 m!733685))

(declare-fun m!733687 () Bool)

(assert (=> b!793191 m!733687))

(assert (=> b!793191 m!733687))

(declare-fun m!733689 () Bool)

(assert (=> b!793191 m!733689))

(declare-fun m!733691 () Bool)

(assert (=> b!793194 m!733691))

(check-sat (not b!793192) (not b!793195) (not b!793191) (not b!793197) (not start!68278) (not b!793194) (not b!793193))
(check-sat)
