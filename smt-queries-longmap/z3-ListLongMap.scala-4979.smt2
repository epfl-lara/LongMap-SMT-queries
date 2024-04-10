; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68386 () Bool)

(assert start!68386)

(declare-fun b!794663 () Bool)

(declare-fun e!441200 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794663 (= e!441200 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!794664 () Bool)

(declare-fun res!539182 () Bool)

(declare-fun e!441203 () Bool)

(assert (=> b!794664 (=> (not res!539182) (not e!441203))))

(declare-datatypes ((array!43176 0))(
  ( (array!43177 (arr!20668 (Array (_ BitVec 32) (_ BitVec 64))) (size!21089 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43176)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43176 (_ BitVec 32)) Bool)

(assert (=> b!794664 (= res!539182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794665 () Bool)

(assert (=> b!794665 (= e!441203 e!441200)))

(declare-fun res!539186 () Bool)

(assert (=> b!794665 (=> (not res!539186) (not e!441200))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354241 () (_ BitVec 64))

(declare-fun lt!354242 () array!43176)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8259 0))(
  ( (MissingZero!8259 (index!35404 (_ BitVec 32))) (Found!8259 (index!35405 (_ BitVec 32))) (Intermediate!8259 (undefined!9071 Bool) (index!35406 (_ BitVec 32)) (x!66329 (_ BitVec 32))) (Undefined!8259) (MissingVacant!8259 (index!35407 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43176 (_ BitVec 32)) SeekEntryResult!8259)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43176 (_ BitVec 32)) SeekEntryResult!8259)

(assert (=> b!794665 (= res!539186 (= (seekEntryOrOpen!0 lt!354241 lt!354242 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354241 lt!354242 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794665 (= lt!354241 (select (store (arr!20668 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794665 (= lt!354242 (array!43177 (store (arr!20668 a!3170) i!1163 k0!2044) (size!21089 a!3170)))))

(declare-fun b!794666 () Bool)

(declare-fun res!539187 () Bool)

(declare-fun e!441201 () Bool)

(assert (=> b!794666 (=> (not res!539187) (not e!441201))))

(declare-fun arrayContainsKey!0 (array!43176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794666 (= res!539187 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794667 () Bool)

(declare-fun res!539184 () Bool)

(assert (=> b!794667 (=> (not res!539184) (not e!441201))))

(assert (=> b!794667 (= res!539184 (and (= (size!21089 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21089 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21089 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794668 () Bool)

(declare-fun res!539192 () Bool)

(assert (=> b!794668 (=> (not res!539192) (not e!441201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794668 (= res!539192 (validKeyInArray!0 (select (arr!20668 a!3170) j!153)))))

(declare-fun b!794669 () Bool)

(assert (=> b!794669 (= e!441201 e!441203)))

(declare-fun res!539190 () Bool)

(assert (=> b!794669 (=> (not res!539190) (not e!441203))))

(declare-fun lt!354240 () SeekEntryResult!8259)

(assert (=> b!794669 (= res!539190 (or (= lt!354240 (MissingZero!8259 i!1163)) (= lt!354240 (MissingVacant!8259 i!1163))))))

(assert (=> b!794669 (= lt!354240 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794670 () Bool)

(declare-fun res!539188 () Bool)

(assert (=> b!794670 (=> (not res!539188) (not e!441201))))

(assert (=> b!794670 (= res!539188 (validKeyInArray!0 k0!2044))))

(declare-fun b!794672 () Bool)

(declare-fun res!539183 () Bool)

(assert (=> b!794672 (=> (not res!539183) (not e!441203))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794672 (= res!539183 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21089 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20668 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21089 a!3170)) (= (select (arr!20668 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794673 () Bool)

(declare-fun res!539189 () Bool)

(assert (=> b!794673 (=> (not res!539189) (not e!441200))))

(assert (=> b!794673 (= res!539189 (= (seekEntryOrOpen!0 (select (arr!20668 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20668 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!794671 () Bool)

(declare-fun res!539185 () Bool)

(assert (=> b!794671 (=> (not res!539185) (not e!441203))))

(declare-datatypes ((List!14631 0))(
  ( (Nil!14628) (Cons!14627 (h!15756 (_ BitVec 64)) (t!20946 List!14631)) )
))
(declare-fun arrayNoDuplicates!0 (array!43176 (_ BitVec 32) List!14631) Bool)

(assert (=> b!794671 (= res!539185 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14628))))

(declare-fun res!539191 () Bool)

(assert (=> start!68386 (=> (not res!539191) (not e!441201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68386 (= res!539191 (validMask!0 mask!3266))))

(assert (=> start!68386 e!441201))

(assert (=> start!68386 true))

(declare-fun array_inv!16464 (array!43176) Bool)

(assert (=> start!68386 (array_inv!16464 a!3170)))

(assert (= (and start!68386 res!539191) b!794667))

(assert (= (and b!794667 res!539184) b!794668))

(assert (= (and b!794668 res!539192) b!794670))

(assert (= (and b!794670 res!539188) b!794666))

(assert (= (and b!794666 res!539187) b!794669))

(assert (= (and b!794669 res!539190) b!794664))

(assert (= (and b!794664 res!539182) b!794671))

(assert (= (and b!794671 res!539185) b!794672))

(assert (= (and b!794672 res!539183) b!794665))

(assert (= (and b!794665 res!539186) b!794673))

(assert (= (and b!794673 res!539189) b!794663))

(declare-fun m!735219 () Bool)

(assert (=> b!794666 m!735219))

(declare-fun m!735221 () Bool)

(assert (=> b!794672 m!735221))

(declare-fun m!735223 () Bool)

(assert (=> b!794672 m!735223))

(declare-fun m!735225 () Bool)

(assert (=> b!794665 m!735225))

(declare-fun m!735227 () Bool)

(assert (=> b!794665 m!735227))

(declare-fun m!735229 () Bool)

(assert (=> b!794665 m!735229))

(declare-fun m!735231 () Bool)

(assert (=> b!794665 m!735231))

(declare-fun m!735233 () Bool)

(assert (=> b!794670 m!735233))

(declare-fun m!735235 () Bool)

(assert (=> b!794673 m!735235))

(assert (=> b!794673 m!735235))

(declare-fun m!735237 () Bool)

(assert (=> b!794673 m!735237))

(assert (=> b!794673 m!735235))

(declare-fun m!735239 () Bool)

(assert (=> b!794673 m!735239))

(declare-fun m!735241 () Bool)

(assert (=> b!794664 m!735241))

(declare-fun m!735243 () Bool)

(assert (=> b!794669 m!735243))

(declare-fun m!735245 () Bool)

(assert (=> b!794671 m!735245))

(assert (=> b!794668 m!735235))

(assert (=> b!794668 m!735235))

(declare-fun m!735247 () Bool)

(assert (=> b!794668 m!735247))

(declare-fun m!735249 () Bool)

(assert (=> start!68386 m!735249))

(declare-fun m!735251 () Bool)

(assert (=> start!68386 m!735251))

(check-sat (not start!68386) (not b!794668) (not b!794665) (not b!794671) (not b!794673) (not b!794670) (not b!794666) (not b!794669) (not b!794664))
(check-sat)
