; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68496 () Bool)

(assert start!68496)

(declare-fun b!795106 () Bool)

(declare-fun res!539258 () Bool)

(declare-fun e!441546 () Bool)

(assert (=> b!795106 (=> (not res!539258) (not e!441546))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795106 (= res!539258 (validKeyInArray!0 k0!2044))))

(declare-fun b!795107 () Bool)

(declare-fun res!539256 () Bool)

(declare-fun e!441545 () Bool)

(assert (=> b!795107 (=> (not res!539256) (not e!441545))))

(declare-datatypes ((array!43160 0))(
  ( (array!43161 (arr!20656 (Array (_ BitVec 32) (_ BitVec 64))) (size!21076 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43160)

(declare-datatypes ((List!14526 0))(
  ( (Nil!14523) (Cons!14522 (h!15657 (_ BitVec 64)) (t!20833 List!14526)) )
))
(declare-fun arrayNoDuplicates!0 (array!43160 (_ BitVec 32) List!14526) Bool)

(assert (=> b!795107 (= res!539256 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14523))))

(declare-fun b!795108 () Bool)

(declare-fun res!539251 () Bool)

(assert (=> b!795108 (=> (not res!539251) (not e!441546))))

(declare-fun arrayContainsKey!0 (array!43160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795108 (= res!539251 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795109 () Bool)

(declare-fun res!539252 () Bool)

(assert (=> b!795109 (=> (not res!539252) (not e!441545))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795109 (= res!539252 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21076 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20656 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21076 a!3170)) (= (select (arr!20656 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795110 () Bool)

(declare-fun res!539259 () Bool)

(assert (=> b!795110 (=> (not res!539259) (not e!441546))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795110 (= res!539259 (validKeyInArray!0 (select (arr!20656 a!3170) j!153)))))

(declare-fun b!795111 () Bool)

(declare-fun res!539254 () Bool)

(assert (=> b!795111 (=> (not res!539254) (not e!441545))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43160 (_ BitVec 32)) Bool)

(assert (=> b!795111 (= res!539254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795113 () Bool)

(assert (=> b!795113 (= e!441545 false)))

(declare-fun lt!354418 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8203 0))(
  ( (MissingZero!8203 (index!35180 (_ BitVec 32))) (Found!8203 (index!35181 (_ BitVec 32))) (Intermediate!8203 (undefined!9015 Bool) (index!35182 (_ BitVec 32)) (x!66268 (_ BitVec 32))) (Undefined!8203) (MissingVacant!8203 (index!35183 (_ BitVec 32))) )
))
(declare-fun lt!354420 () SeekEntryResult!8203)

(declare-fun lt!354417 () array!43160)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43160 (_ BitVec 32)) SeekEntryResult!8203)

(assert (=> b!795113 (= lt!354420 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354418 lt!354417 mask!3266))))

(declare-fun lt!354419 () SeekEntryResult!8203)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43160 (_ BitVec 32)) SeekEntryResult!8203)

(assert (=> b!795113 (= lt!354419 (seekEntryOrOpen!0 lt!354418 lt!354417 mask!3266))))

(assert (=> b!795113 (= lt!354418 (select (store (arr!20656 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795113 (= lt!354417 (array!43161 (store (arr!20656 a!3170) i!1163 k0!2044) (size!21076 a!3170)))))

(declare-fun b!795114 () Bool)

(assert (=> b!795114 (= e!441546 e!441545)))

(declare-fun res!539255 () Bool)

(assert (=> b!795114 (=> (not res!539255) (not e!441545))))

(declare-fun lt!354421 () SeekEntryResult!8203)

(assert (=> b!795114 (= res!539255 (or (= lt!354421 (MissingZero!8203 i!1163)) (= lt!354421 (MissingVacant!8203 i!1163))))))

(assert (=> b!795114 (= lt!354421 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!539257 () Bool)

(assert (=> start!68496 (=> (not res!539257) (not e!441546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68496 (= res!539257 (validMask!0 mask!3266))))

(assert (=> start!68496 e!441546))

(assert (=> start!68496 true))

(declare-fun array_inv!16515 (array!43160) Bool)

(assert (=> start!68496 (array_inv!16515 a!3170)))

(declare-fun b!795112 () Bool)

(declare-fun res!539253 () Bool)

(assert (=> b!795112 (=> (not res!539253) (not e!441546))))

(assert (=> b!795112 (= res!539253 (and (= (size!21076 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21076 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21076 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68496 res!539257) b!795112))

(assert (= (and b!795112 res!539253) b!795110))

(assert (= (and b!795110 res!539259) b!795106))

(assert (= (and b!795106 res!539258) b!795108))

(assert (= (and b!795108 res!539251) b!795114))

(assert (= (and b!795114 res!539255) b!795111))

(assert (= (and b!795111 res!539254) b!795107))

(assert (= (and b!795107 res!539256) b!795109))

(assert (= (and b!795109 res!539252) b!795113))

(declare-fun m!736073 () Bool)

(assert (=> b!795108 m!736073))

(declare-fun m!736075 () Bool)

(assert (=> start!68496 m!736075))

(declare-fun m!736077 () Bool)

(assert (=> start!68496 m!736077))

(declare-fun m!736079 () Bool)

(assert (=> b!795110 m!736079))

(assert (=> b!795110 m!736079))

(declare-fun m!736081 () Bool)

(assert (=> b!795110 m!736081))

(declare-fun m!736083 () Bool)

(assert (=> b!795114 m!736083))

(declare-fun m!736085 () Bool)

(assert (=> b!795106 m!736085))

(declare-fun m!736087 () Bool)

(assert (=> b!795113 m!736087))

(declare-fun m!736089 () Bool)

(assert (=> b!795113 m!736089))

(declare-fun m!736091 () Bool)

(assert (=> b!795113 m!736091))

(declare-fun m!736093 () Bool)

(assert (=> b!795113 m!736093))

(declare-fun m!736095 () Bool)

(assert (=> b!795111 m!736095))

(declare-fun m!736097 () Bool)

(assert (=> b!795109 m!736097))

(declare-fun m!736099 () Bool)

(assert (=> b!795109 m!736099))

(declare-fun m!736101 () Bool)

(assert (=> b!795107 m!736101))

(check-sat (not b!795113) (not b!795110) (not b!795111) (not b!795107) (not b!795108) (not start!68496) (not b!795114) (not b!795106))
(check-sat)
