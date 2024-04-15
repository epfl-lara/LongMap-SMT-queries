; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68370 () Bool)

(assert start!68370)

(declare-fun b!794477 () Bool)

(declare-fun res!539145 () Bool)

(declare-fun e!441070 () Bool)

(assert (=> b!794477 (=> (not res!539145) (not e!441070))))

(declare-datatypes ((array!43177 0))(
  ( (array!43178 (arr!20669 (Array (_ BitVec 32) (_ BitVec 64))) (size!21090 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43177)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794477 (= res!539145 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794478 () Bool)

(declare-fun res!539137 () Bool)

(assert (=> b!794478 (=> (not res!539137) (not e!441070))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794478 (= res!539137 (and (= (size!21090 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21090 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21090 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794479 () Bool)

(declare-fun e!441072 () Bool)

(assert (=> b!794479 (= e!441070 e!441072)))

(declare-fun res!539142 () Bool)

(assert (=> b!794479 (=> (not res!539142) (not e!441072))))

(declare-datatypes ((SeekEntryResult!8257 0))(
  ( (MissingZero!8257 (index!35396 (_ BitVec 32))) (Found!8257 (index!35397 (_ BitVec 32))) (Intermediate!8257 (undefined!9069 Bool) (index!35398 (_ BitVec 32)) (x!66330 (_ BitVec 32))) (Undefined!8257) (MissingVacant!8257 (index!35399 (_ BitVec 32))) )
))
(declare-fun lt!354022 () SeekEntryResult!8257)

(assert (=> b!794479 (= res!539142 (or (= lt!354022 (MissingZero!8257 i!1163)) (= lt!354022 (MissingVacant!8257 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43177 (_ BitVec 32)) SeekEntryResult!8257)

(assert (=> b!794479 (= lt!354022 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794480 () Bool)

(declare-fun res!539143 () Bool)

(assert (=> b!794480 (=> (not res!539143) (not e!441072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43177 (_ BitVec 32)) Bool)

(assert (=> b!794480 (= res!539143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794481 () Bool)

(declare-fun e!441071 () Bool)

(assert (=> b!794481 (= e!441072 e!441071)))

(declare-fun res!539138 () Bool)

(assert (=> b!794481 (=> (not res!539138) (not e!441071))))

(declare-fun lt!354025 () array!43177)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354023 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43177 (_ BitVec 32)) SeekEntryResult!8257)

(assert (=> b!794481 (= res!539138 (= (seekEntryOrOpen!0 lt!354023 lt!354025 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354023 lt!354025 mask!3266)))))

(assert (=> b!794481 (= lt!354023 (select (store (arr!20669 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794481 (= lt!354025 (array!43178 (store (arr!20669 a!3170) i!1163 k0!2044) (size!21090 a!3170)))))

(declare-fun res!539136 () Bool)

(assert (=> start!68370 (=> (not res!539136) (not e!441070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68370 (= res!539136 (validMask!0 mask!3266))))

(assert (=> start!68370 e!441070))

(assert (=> start!68370 true))

(declare-fun array_inv!16552 (array!43177) Bool)

(assert (=> start!68370 (array_inv!16552 a!3170)))

(declare-fun b!794482 () Bool)

(assert (=> b!794482 (= e!441071 false)))

(declare-fun lt!354024 () SeekEntryResult!8257)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794482 (= lt!354024 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20669 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354026 () SeekEntryResult!8257)

(assert (=> b!794482 (= lt!354026 (seekEntryOrOpen!0 (select (arr!20669 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794483 () Bool)

(declare-fun res!539140 () Bool)

(assert (=> b!794483 (=> (not res!539140) (not e!441070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794483 (= res!539140 (validKeyInArray!0 (select (arr!20669 a!3170) j!153)))))

(declare-fun b!794484 () Bool)

(declare-fun res!539144 () Bool)

(assert (=> b!794484 (=> (not res!539144) (not e!441072))))

(assert (=> b!794484 (= res!539144 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21090 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20669 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21090 a!3170)) (= (select (arr!20669 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794485 () Bool)

(declare-fun res!539141 () Bool)

(assert (=> b!794485 (=> (not res!539141) (not e!441072))))

(declare-datatypes ((List!14671 0))(
  ( (Nil!14668) (Cons!14667 (h!15796 (_ BitVec 64)) (t!20977 List!14671)) )
))
(declare-fun arrayNoDuplicates!0 (array!43177 (_ BitVec 32) List!14671) Bool)

(assert (=> b!794485 (= res!539141 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14668))))

(declare-fun b!794486 () Bool)

(declare-fun res!539139 () Bool)

(assert (=> b!794486 (=> (not res!539139) (not e!441070))))

(assert (=> b!794486 (= res!539139 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68370 res!539136) b!794478))

(assert (= (and b!794478 res!539137) b!794483))

(assert (= (and b!794483 res!539140) b!794486))

(assert (= (and b!794486 res!539139) b!794477))

(assert (= (and b!794477 res!539145) b!794479))

(assert (= (and b!794479 res!539142) b!794480))

(assert (= (and b!794480 res!539143) b!794485))

(assert (= (and b!794485 res!539141) b!794484))

(assert (= (and b!794484 res!539144) b!794481))

(assert (= (and b!794481 res!539138) b!794482))

(declare-fun m!734545 () Bool)

(assert (=> b!794485 m!734545))

(declare-fun m!734547 () Bool)

(assert (=> start!68370 m!734547))

(declare-fun m!734549 () Bool)

(assert (=> start!68370 m!734549))

(declare-fun m!734551 () Bool)

(assert (=> b!794479 m!734551))

(declare-fun m!734553 () Bool)

(assert (=> b!794483 m!734553))

(assert (=> b!794483 m!734553))

(declare-fun m!734555 () Bool)

(assert (=> b!794483 m!734555))

(declare-fun m!734557 () Bool)

(assert (=> b!794481 m!734557))

(declare-fun m!734559 () Bool)

(assert (=> b!794481 m!734559))

(declare-fun m!734561 () Bool)

(assert (=> b!794481 m!734561))

(declare-fun m!734563 () Bool)

(assert (=> b!794481 m!734563))

(declare-fun m!734565 () Bool)

(assert (=> b!794480 m!734565))

(declare-fun m!734567 () Bool)

(assert (=> b!794484 m!734567))

(declare-fun m!734569 () Bool)

(assert (=> b!794484 m!734569))

(assert (=> b!794482 m!734553))

(assert (=> b!794482 m!734553))

(declare-fun m!734571 () Bool)

(assert (=> b!794482 m!734571))

(assert (=> b!794482 m!734553))

(declare-fun m!734573 () Bool)

(assert (=> b!794482 m!734573))

(declare-fun m!734575 () Bool)

(assert (=> b!794477 m!734575))

(declare-fun m!734577 () Bool)

(assert (=> b!794486 m!734577))

(check-sat (not b!794480) (not b!794481) (not b!794485) (not b!794482) (not b!794486) (not b!794479) (not b!794483) (not start!68370) (not b!794477))
(check-sat)
