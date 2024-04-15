; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68436 () Bool)

(assert start!68436)

(declare-fun b!795485 () Bool)

(declare-fun e!441468 () Bool)

(declare-fun e!441469 () Bool)

(assert (=> b!795485 (= e!441468 e!441469)))

(declare-fun res!540147 () Bool)

(assert (=> b!795485 (=> (not res!540147) (not e!441469))))

(declare-datatypes ((SeekEntryResult!8290 0))(
  ( (MissingZero!8290 (index!35528 (_ BitVec 32))) (Found!8290 (index!35529 (_ BitVec 32))) (Intermediate!8290 (undefined!9102 Bool) (index!35530 (_ BitVec 32)) (x!66451 (_ BitVec 32))) (Undefined!8290) (MissingVacant!8290 (index!35531 (_ BitVec 32))) )
))
(declare-fun lt!354482 () SeekEntryResult!8290)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795485 (= res!540147 (or (= lt!354482 (MissingZero!8290 i!1163)) (= lt!354482 (MissingVacant!8290 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43243 0))(
  ( (array!43244 (arr!20702 (Array (_ BitVec 32) (_ BitVec 64))) (size!21123 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43243)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43243 (_ BitVec 32)) SeekEntryResult!8290)

(assert (=> b!795485 (= lt!354482 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795486 () Bool)

(declare-fun res!540146 () Bool)

(assert (=> b!795486 (=> (not res!540146) (not e!441469))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795486 (= res!540146 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21123 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20702 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21123 a!3170)) (= (select (arr!20702 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795487 () Bool)

(declare-fun res!540153 () Bool)

(assert (=> b!795487 (=> (not res!540153) (not e!441468))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795487 (= res!540153 (validKeyInArray!0 (select (arr!20702 a!3170) j!153)))))

(declare-fun res!540148 () Bool)

(assert (=> start!68436 (=> (not res!540148) (not e!441468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68436 (= res!540148 (validMask!0 mask!3266))))

(assert (=> start!68436 e!441468))

(assert (=> start!68436 true))

(declare-fun array_inv!16585 (array!43243) Bool)

(assert (=> start!68436 (array_inv!16585 a!3170)))

(declare-fun b!795488 () Bool)

(declare-fun res!540151 () Bool)

(assert (=> b!795488 (=> (not res!540151) (not e!441469))))

(declare-datatypes ((List!14704 0))(
  ( (Nil!14701) (Cons!14700 (h!15829 (_ BitVec 64)) (t!21010 List!14704)) )
))
(declare-fun arrayNoDuplicates!0 (array!43243 (_ BitVec 32) List!14704) Bool)

(assert (=> b!795488 (= res!540151 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14701))))

(declare-fun b!795489 () Bool)

(declare-fun res!540152 () Bool)

(assert (=> b!795489 (=> (not res!540152) (not e!441468))))

(assert (=> b!795489 (= res!540152 (validKeyInArray!0 k0!2044))))

(declare-fun lt!354484 () SeekEntryResult!8290)

(declare-fun lt!354485 () SeekEntryResult!8290)

(declare-fun e!441466 () Bool)

(declare-fun b!795490 () Bool)

(assert (=> b!795490 (= e!441466 (and (= lt!354485 lt!354484) (= lt!354484 (Found!8290 j!153)) (= (select (arr!20702 a!3170) index!1236) (select (arr!20702 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43243 (_ BitVec 32)) SeekEntryResult!8290)

(assert (=> b!795490 (= lt!354484 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20702 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795490 (= lt!354485 (seekEntryOrOpen!0 (select (arr!20702 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795491 () Bool)

(declare-fun res!540150 () Bool)

(assert (=> b!795491 (=> (not res!540150) (not e!441468))))

(declare-fun arrayContainsKey!0 (array!43243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795491 (= res!540150 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795492 () Bool)

(declare-fun res!540145 () Bool)

(assert (=> b!795492 (=> (not res!540145) (not e!441469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43243 (_ BitVec 32)) Bool)

(assert (=> b!795492 (= res!540145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795493 () Bool)

(declare-fun res!540144 () Bool)

(assert (=> b!795493 (=> (not res!540144) (not e!441468))))

(assert (=> b!795493 (= res!540144 (and (= (size!21123 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21123 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21123 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795494 () Bool)

(assert (=> b!795494 (= e!441469 e!441466)))

(declare-fun res!540149 () Bool)

(assert (=> b!795494 (=> (not res!540149) (not e!441466))))

(declare-fun lt!354483 () (_ BitVec 64))

(declare-fun lt!354481 () array!43243)

(assert (=> b!795494 (= res!540149 (= (seekEntryOrOpen!0 lt!354483 lt!354481 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354483 lt!354481 mask!3266)))))

(assert (=> b!795494 (= lt!354483 (select (store (arr!20702 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795494 (= lt!354481 (array!43244 (store (arr!20702 a!3170) i!1163 k0!2044) (size!21123 a!3170)))))

(assert (= (and start!68436 res!540148) b!795493))

(assert (= (and b!795493 res!540144) b!795487))

(assert (= (and b!795487 res!540153) b!795489))

(assert (= (and b!795489 res!540152) b!795491))

(assert (= (and b!795491 res!540150) b!795485))

(assert (= (and b!795485 res!540147) b!795492))

(assert (= (and b!795492 res!540145) b!795488))

(assert (= (and b!795488 res!540151) b!795486))

(assert (= (and b!795486 res!540146) b!795494))

(assert (= (and b!795494 res!540149) b!795490))

(declare-fun m!735679 () Bool)

(assert (=> b!795489 m!735679))

(declare-fun m!735681 () Bool)

(assert (=> b!795487 m!735681))

(assert (=> b!795487 m!735681))

(declare-fun m!735683 () Bool)

(assert (=> b!795487 m!735683))

(declare-fun m!735685 () Bool)

(assert (=> b!795494 m!735685))

(declare-fun m!735687 () Bool)

(assert (=> b!795494 m!735687))

(declare-fun m!735689 () Bool)

(assert (=> b!795494 m!735689))

(declare-fun m!735691 () Bool)

(assert (=> b!795494 m!735691))

(declare-fun m!735693 () Bool)

(assert (=> b!795486 m!735693))

(declare-fun m!735695 () Bool)

(assert (=> b!795486 m!735695))

(declare-fun m!735697 () Bool)

(assert (=> start!68436 m!735697))

(declare-fun m!735699 () Bool)

(assert (=> start!68436 m!735699))

(declare-fun m!735701 () Bool)

(assert (=> b!795490 m!735701))

(assert (=> b!795490 m!735681))

(assert (=> b!795490 m!735681))

(declare-fun m!735703 () Bool)

(assert (=> b!795490 m!735703))

(assert (=> b!795490 m!735681))

(declare-fun m!735705 () Bool)

(assert (=> b!795490 m!735705))

(declare-fun m!735707 () Bool)

(assert (=> b!795492 m!735707))

(declare-fun m!735709 () Bool)

(assert (=> b!795488 m!735709))

(declare-fun m!735711 () Bool)

(assert (=> b!795491 m!735711))

(declare-fun m!735713 () Bool)

(assert (=> b!795485 m!735713))

(check-sat (not start!68436) (not b!795489) (not b!795490) (not b!795494) (not b!795488) (not b!795491) (not b!795487) (not b!795485) (not b!795492))
(check-sat)
