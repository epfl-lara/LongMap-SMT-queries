; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68380 () Bool)

(assert start!68380)

(declare-fun b!794568 () Bool)

(declare-fun res!539093 () Bool)

(declare-fun e!441165 () Bool)

(assert (=> b!794568 (=> (not res!539093) (not e!441165))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43170 0))(
  ( (array!43171 (arr!20665 (Array (_ BitVec 32) (_ BitVec 64))) (size!21086 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43170)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794568 (= res!539093 (and (= (size!21086 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21086 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21086 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794569 () Bool)

(declare-fun res!539091 () Bool)

(assert (=> b!794569 (=> (not res!539091) (not e!441165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794569 (= res!539091 (validKeyInArray!0 (select (arr!20665 a!3170) j!153)))))

(declare-fun b!794570 () Bool)

(declare-fun res!539087 () Bool)

(declare-fun e!441164 () Bool)

(assert (=> b!794570 (=> (not res!539087) (not e!441164))))

(declare-datatypes ((List!14628 0))(
  ( (Nil!14625) (Cons!14624 (h!15753 (_ BitVec 64)) (t!20943 List!14628)) )
))
(declare-fun arrayNoDuplicates!0 (array!43170 (_ BitVec 32) List!14628) Bool)

(assert (=> b!794570 (= res!539087 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14625))))

(declare-fun b!794571 () Bool)

(declare-fun e!441166 () Bool)

(assert (=> b!794571 (= e!441164 e!441166)))

(declare-fun res!539092 () Bool)

(assert (=> b!794571 (=> (not res!539092) (not e!441166))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354208 () array!43170)

(declare-fun lt!354207 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8256 0))(
  ( (MissingZero!8256 (index!35392 (_ BitVec 32))) (Found!8256 (index!35393 (_ BitVec 32))) (Intermediate!8256 (undefined!9068 Bool) (index!35394 (_ BitVec 32)) (x!66318 (_ BitVec 32))) (Undefined!8256) (MissingVacant!8256 (index!35395 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43170 (_ BitVec 32)) SeekEntryResult!8256)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43170 (_ BitVec 32)) SeekEntryResult!8256)

(assert (=> b!794571 (= res!539092 (= (seekEntryOrOpen!0 lt!354207 lt!354208 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354207 lt!354208 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!794571 (= lt!354207 (select (store (arr!20665 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794571 (= lt!354208 (array!43171 (store (arr!20665 a!3170) i!1163 k0!2044) (size!21086 a!3170)))))

(declare-fun b!794572 () Bool)

(declare-fun res!539096 () Bool)

(assert (=> b!794572 (=> (not res!539096) (not e!441164))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794572 (= res!539096 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21086 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20665 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21086 a!3170)) (= (select (arr!20665 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794573 () Bool)

(declare-fun res!539095 () Bool)

(assert (=> b!794573 (=> (not res!539095) (not e!441164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43170 (_ BitVec 32)) Bool)

(assert (=> b!794573 (= res!539095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794574 () Bool)

(assert (=> b!794574 (= e!441165 e!441164)))

(declare-fun res!539090 () Bool)

(assert (=> b!794574 (=> (not res!539090) (not e!441164))))

(declare-fun lt!354209 () SeekEntryResult!8256)

(assert (=> b!794574 (= res!539090 (or (= lt!354209 (MissingZero!8256 i!1163)) (= lt!354209 (MissingVacant!8256 i!1163))))))

(assert (=> b!794574 (= lt!354209 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!539089 () Bool)

(assert (=> start!68380 (=> (not res!539089) (not e!441165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68380 (= res!539089 (validMask!0 mask!3266))))

(assert (=> start!68380 e!441165))

(assert (=> start!68380 true))

(declare-fun array_inv!16461 (array!43170) Bool)

(assert (=> start!68380 (array_inv!16461 a!3170)))

(declare-fun b!794575 () Bool)

(declare-fun res!539094 () Bool)

(assert (=> b!794575 (=> (not res!539094) (not e!441165))))

(declare-fun arrayContainsKey!0 (array!43170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794575 (= res!539094 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794576 () Bool)

(declare-fun res!539088 () Bool)

(assert (=> b!794576 (=> (not res!539088) (not e!441165))))

(assert (=> b!794576 (= res!539088 (validKeyInArray!0 k0!2044))))

(declare-fun b!794577 () Bool)

(assert (=> b!794577 (= e!441166 false)))

(declare-fun lt!354205 () SeekEntryResult!8256)

(assert (=> b!794577 (= lt!354205 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20665 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354206 () SeekEntryResult!8256)

(assert (=> b!794577 (= lt!354206 (seekEntryOrOpen!0 (select (arr!20665 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68380 res!539089) b!794568))

(assert (= (and b!794568 res!539093) b!794569))

(assert (= (and b!794569 res!539091) b!794576))

(assert (= (and b!794576 res!539088) b!794575))

(assert (= (and b!794575 res!539094) b!794574))

(assert (= (and b!794574 res!539090) b!794573))

(assert (= (and b!794573 res!539095) b!794570))

(assert (= (and b!794570 res!539087) b!794572))

(assert (= (and b!794572 res!539096) b!794571))

(assert (= (and b!794571 res!539092) b!794577))

(declare-fun m!735117 () Bool)

(assert (=> b!794571 m!735117))

(declare-fun m!735119 () Bool)

(assert (=> b!794571 m!735119))

(declare-fun m!735121 () Bool)

(assert (=> b!794571 m!735121))

(declare-fun m!735123 () Bool)

(assert (=> b!794571 m!735123))

(declare-fun m!735125 () Bool)

(assert (=> b!794570 m!735125))

(declare-fun m!735127 () Bool)

(assert (=> b!794574 m!735127))

(declare-fun m!735129 () Bool)

(assert (=> b!794569 m!735129))

(assert (=> b!794569 m!735129))

(declare-fun m!735131 () Bool)

(assert (=> b!794569 m!735131))

(declare-fun m!735133 () Bool)

(assert (=> b!794575 m!735133))

(declare-fun m!735135 () Bool)

(assert (=> b!794576 m!735135))

(declare-fun m!735137 () Bool)

(assert (=> start!68380 m!735137))

(declare-fun m!735139 () Bool)

(assert (=> start!68380 m!735139))

(declare-fun m!735141 () Bool)

(assert (=> b!794572 m!735141))

(declare-fun m!735143 () Bool)

(assert (=> b!794572 m!735143))

(assert (=> b!794577 m!735129))

(assert (=> b!794577 m!735129))

(declare-fun m!735145 () Bool)

(assert (=> b!794577 m!735145))

(assert (=> b!794577 m!735129))

(declare-fun m!735147 () Bool)

(assert (=> b!794577 m!735147))

(declare-fun m!735149 () Bool)

(assert (=> b!794573 m!735149))

(check-sat (not b!794570) (not start!68380) (not b!794574) (not b!794577) (not b!794576) (not b!794569) (not b!794571) (not b!794575) (not b!794573))
(check-sat)
