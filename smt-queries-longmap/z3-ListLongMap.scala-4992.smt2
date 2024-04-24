; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68586 () Bool)

(assert start!68586)

(declare-fun b!796476 () Bool)

(declare-fun e!442078 () Bool)

(declare-fun e!442080 () Bool)

(assert (=> b!796476 (= e!442078 e!442080)))

(declare-fun res!540621 () Bool)

(assert (=> b!796476 (=> (not res!540621) (not e!442080))))

(declare-datatypes ((SeekEntryResult!8248 0))(
  ( (MissingZero!8248 (index!35360 (_ BitVec 32))) (Found!8248 (index!35361 (_ BitVec 32))) (Intermediate!8248 (undefined!9060 Bool) (index!35362 (_ BitVec 32)) (x!66433 (_ BitVec 32))) (Undefined!8248) (MissingVacant!8248 (index!35363 (_ BitVec 32))) )
))
(declare-fun lt!355042 () SeekEntryResult!8248)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796476 (= res!540621 (or (= lt!355042 (MissingZero!8248 i!1163)) (= lt!355042 (MissingVacant!8248 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43250 0))(
  ( (array!43251 (arr!20701 (Array (_ BitVec 32) (_ BitVec 64))) (size!21121 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43250)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43250 (_ BitVec 32)) SeekEntryResult!8248)

(assert (=> b!796476 (= lt!355042 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796477 () Bool)

(declare-fun res!540629 () Bool)

(assert (=> b!796477 (=> (not res!540629) (not e!442078))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796477 (= res!540629 (validKeyInArray!0 (select (arr!20701 a!3170) j!153)))))

(declare-fun b!796478 () Bool)

(declare-fun res!540624 () Bool)

(assert (=> b!796478 (=> (not res!540624) (not e!442078))))

(declare-fun arrayContainsKey!0 (array!43250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796478 (= res!540624 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796479 () Bool)

(declare-fun res!540622 () Bool)

(assert (=> b!796479 (=> (not res!540622) (not e!442078))))

(assert (=> b!796479 (= res!540622 (and (= (size!21121 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21121 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21121 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796480 () Bool)

(declare-fun res!540627 () Bool)

(assert (=> b!796480 (=> (not res!540627) (not e!442080))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796480 (= res!540627 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21121 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20701 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21121 a!3170)) (= (select (arr!20701 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796481 () Bool)

(declare-fun e!442081 () Bool)

(assert (=> b!796481 (= e!442080 e!442081)))

(declare-fun res!540630 () Bool)

(assert (=> b!796481 (=> (not res!540630) (not e!442081))))

(declare-fun lt!355040 () (_ BitVec 64))

(declare-fun lt!355041 () array!43250)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43250 (_ BitVec 32)) SeekEntryResult!8248)

(assert (=> b!796481 (= res!540630 (= (seekEntryOrOpen!0 lt!355040 lt!355041 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355040 lt!355041 mask!3266)))))

(assert (=> b!796481 (= lt!355040 (select (store (arr!20701 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796481 (= lt!355041 (array!43251 (store (arr!20701 a!3170) i!1163 k0!2044) (size!21121 a!3170)))))

(declare-fun lt!355039 () SeekEntryResult!8248)

(declare-fun lt!355038 () SeekEntryResult!8248)

(declare-fun b!796482 () Bool)

(assert (=> b!796482 (= e!442081 (and (= lt!355038 lt!355039) (= lt!355039 (Found!8248 j!153)) (= (select (arr!20701 a!3170) index!1236) (select (arr!20701 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20701 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!796482 (= lt!355039 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20701 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796482 (= lt!355038 (seekEntryOrOpen!0 (select (arr!20701 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796483 () Bool)

(declare-fun res!540626 () Bool)

(assert (=> b!796483 (=> (not res!540626) (not e!442080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43250 (_ BitVec 32)) Bool)

(assert (=> b!796483 (= res!540626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796484 () Bool)

(declare-fun res!540625 () Bool)

(assert (=> b!796484 (=> (not res!540625) (not e!442080))))

(declare-datatypes ((List!14571 0))(
  ( (Nil!14568) (Cons!14567 (h!15702 (_ BitVec 64)) (t!20878 List!14571)) )
))
(declare-fun arrayNoDuplicates!0 (array!43250 (_ BitVec 32) List!14571) Bool)

(assert (=> b!796484 (= res!540625 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14568))))

(declare-fun res!540628 () Bool)

(assert (=> start!68586 (=> (not res!540628) (not e!442078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68586 (= res!540628 (validMask!0 mask!3266))))

(assert (=> start!68586 e!442078))

(assert (=> start!68586 true))

(declare-fun array_inv!16560 (array!43250) Bool)

(assert (=> start!68586 (array_inv!16560 a!3170)))

(declare-fun b!796485 () Bool)

(declare-fun res!540623 () Bool)

(assert (=> b!796485 (=> (not res!540623) (not e!442078))))

(assert (=> b!796485 (= res!540623 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68586 res!540628) b!796479))

(assert (= (and b!796479 res!540622) b!796477))

(assert (= (and b!796477 res!540629) b!796485))

(assert (= (and b!796485 res!540623) b!796478))

(assert (= (and b!796478 res!540624) b!796476))

(assert (= (and b!796476 res!540621) b!796483))

(assert (= (and b!796483 res!540626) b!796484))

(assert (= (and b!796484 res!540625) b!796480))

(assert (= (and b!796480 res!540627) b!796481))

(assert (= (and b!796481 res!540630) b!796482))

(declare-fun m!737609 () Bool)

(assert (=> b!796482 m!737609))

(declare-fun m!737611 () Bool)

(assert (=> b!796482 m!737611))

(declare-fun m!737613 () Bool)

(assert (=> b!796482 m!737613))

(assert (=> b!796482 m!737609))

(declare-fun m!737615 () Bool)

(assert (=> b!796482 m!737615))

(assert (=> b!796482 m!737609))

(declare-fun m!737617 () Bool)

(assert (=> b!796482 m!737617))

(declare-fun m!737619 () Bool)

(assert (=> b!796482 m!737619))

(declare-fun m!737621 () Bool)

(assert (=> start!68586 m!737621))

(declare-fun m!737623 () Bool)

(assert (=> start!68586 m!737623))

(assert (=> b!796477 m!737609))

(assert (=> b!796477 m!737609))

(declare-fun m!737625 () Bool)

(assert (=> b!796477 m!737625))

(declare-fun m!737627 () Bool)

(assert (=> b!796483 m!737627))

(declare-fun m!737629 () Bool)

(assert (=> b!796476 m!737629))

(declare-fun m!737631 () Bool)

(assert (=> b!796484 m!737631))

(declare-fun m!737633 () Bool)

(assert (=> b!796478 m!737633))

(declare-fun m!737635 () Bool)

(assert (=> b!796480 m!737635))

(declare-fun m!737637 () Bool)

(assert (=> b!796480 m!737637))

(declare-fun m!737639 () Bool)

(assert (=> b!796481 m!737639))

(declare-fun m!737641 () Bool)

(assert (=> b!796481 m!737641))

(assert (=> b!796481 m!737619))

(declare-fun m!737643 () Bool)

(assert (=> b!796481 m!737643))

(declare-fun m!737645 () Bool)

(assert (=> b!796485 m!737645))

(check-sat (not b!796478) (not start!68586) (not b!796483) (not b!796485) (not b!796476) (not b!796484) (not b!796477) (not b!796481) (not b!796482))
(check-sat)
