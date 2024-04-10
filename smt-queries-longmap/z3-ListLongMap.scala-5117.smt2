; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69418 () Bool)

(assert start!69418)

(declare-fun b!809477 () Bool)

(declare-fun e!448064 () Bool)

(declare-fun e!448063 () Bool)

(assert (=> b!809477 (= e!448064 e!448063)))

(declare-fun res!553209 () Bool)

(assert (=> b!809477 (=> (not res!553209) (not e!448063))))

(declare-datatypes ((SeekEntryResult!8673 0))(
  ( (MissingZero!8673 (index!37060 (_ BitVec 32))) (Found!8673 (index!37061 (_ BitVec 32))) (Intermediate!8673 (undefined!9485 Bool) (index!37062 (_ BitVec 32)) (x!67865 (_ BitVec 32))) (Undefined!8673) (MissingVacant!8673 (index!37063 (_ BitVec 32))) )
))
(declare-fun lt!362766 () SeekEntryResult!8673)

(declare-datatypes ((array!44016 0))(
  ( (array!44017 (arr!21082 (Array (_ BitVec 32) (_ BitVec 64))) (size!21503 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44016)

(declare-fun lt!362767 () SeekEntryResult!8673)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809477 (= res!553209 (and (= lt!362767 lt!362766) (= lt!362766 (Found!8673 j!153)) (not (= (select (arr!21082 a!3170) index!1236) (select (arr!21082 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44016 (_ BitVec 32)) SeekEntryResult!8673)

(assert (=> b!809477 (= lt!362766 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21082 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44016 (_ BitVec 32)) SeekEntryResult!8673)

(assert (=> b!809477 (= lt!362767 (seekEntryOrOpen!0 (select (arr!21082 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809478 () Bool)

(declare-fun res!553206 () Bool)

(declare-fun e!448065 () Bool)

(assert (=> b!809478 (=> (not res!553206) (not e!448065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44016 (_ BitVec 32)) Bool)

(assert (=> b!809478 (= res!553206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809479 () Bool)

(assert (=> b!809479 (= e!448065 e!448064)))

(declare-fun res!553212 () Bool)

(assert (=> b!809479 (=> (not res!553212) (not e!448064))))

(declare-fun lt!362770 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362769 () array!44016)

(assert (=> b!809479 (= res!553212 (= (seekEntryOrOpen!0 lt!362770 lt!362769 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362770 lt!362769 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809479 (= lt!362770 (select (store (arr!21082 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809479 (= lt!362769 (array!44017 (store (arr!21082 a!3170) i!1163 k0!2044) (size!21503 a!3170)))))

(declare-fun b!809480 () Bool)

(declare-fun res!553213 () Bool)

(declare-fun e!448066 () Bool)

(assert (=> b!809480 (=> (not res!553213) (not e!448066))))

(declare-fun arrayContainsKey!0 (array!44016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809480 (= res!553213 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809481 () Bool)

(declare-fun res!553210 () Bool)

(assert (=> b!809481 (=> (not res!553210) (not e!448066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809481 (= res!553210 (validKeyInArray!0 k0!2044))))

(declare-fun res!553211 () Bool)

(assert (=> start!69418 (=> (not res!553211) (not e!448066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69418 (= res!553211 (validMask!0 mask!3266))))

(assert (=> start!69418 e!448066))

(assert (=> start!69418 true))

(declare-fun array_inv!16878 (array!44016) Bool)

(assert (=> start!69418 (array_inv!16878 a!3170)))

(declare-fun b!809482 () Bool)

(declare-fun res!553208 () Bool)

(assert (=> b!809482 (=> (not res!553208) (not e!448065))))

(assert (=> b!809482 (= res!553208 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21503 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21082 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21503 a!3170)) (= (select (arr!21082 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809483 () Bool)

(declare-fun res!553214 () Bool)

(assert (=> b!809483 (=> (not res!553214) (not e!448065))))

(declare-datatypes ((List!15045 0))(
  ( (Nil!15042) (Cons!15041 (h!16170 (_ BitVec 64)) (t!21360 List!15045)) )
))
(declare-fun arrayNoDuplicates!0 (array!44016 (_ BitVec 32) List!15045) Bool)

(assert (=> b!809483 (= res!553214 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15042))))

(declare-fun b!809484 () Bool)

(declare-fun res!553204 () Bool)

(assert (=> b!809484 (=> (not res!553204) (not e!448066))))

(assert (=> b!809484 (= res!553204 (and (= (size!21503 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21503 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21503 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809485 () Bool)

(assert (=> b!809485 (= e!448063 false)))

(declare-fun lt!362768 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809485 (= lt!362768 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809486 () Bool)

(assert (=> b!809486 (= e!448066 e!448065)))

(declare-fun res!553205 () Bool)

(assert (=> b!809486 (=> (not res!553205) (not e!448065))))

(declare-fun lt!362771 () SeekEntryResult!8673)

(assert (=> b!809486 (= res!553205 (or (= lt!362771 (MissingZero!8673 i!1163)) (= lt!362771 (MissingVacant!8673 i!1163))))))

(assert (=> b!809486 (= lt!362771 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809487 () Bool)

(declare-fun res!553207 () Bool)

(assert (=> b!809487 (=> (not res!553207) (not e!448066))))

(assert (=> b!809487 (= res!553207 (validKeyInArray!0 (select (arr!21082 a!3170) j!153)))))

(assert (= (and start!69418 res!553211) b!809484))

(assert (= (and b!809484 res!553204) b!809487))

(assert (= (and b!809487 res!553207) b!809481))

(assert (= (and b!809481 res!553210) b!809480))

(assert (= (and b!809480 res!553213) b!809486))

(assert (= (and b!809486 res!553205) b!809478))

(assert (= (and b!809478 res!553206) b!809483))

(assert (= (and b!809483 res!553214) b!809482))

(assert (= (and b!809482 res!553208) b!809479))

(assert (= (and b!809479 res!553212) b!809477))

(assert (= (and b!809477 res!553209) b!809485))

(declare-fun m!751675 () Bool)

(assert (=> b!809482 m!751675))

(declare-fun m!751677 () Bool)

(assert (=> b!809482 m!751677))

(declare-fun m!751679 () Bool)

(assert (=> b!809480 m!751679))

(declare-fun m!751681 () Bool)

(assert (=> start!69418 m!751681))

(declare-fun m!751683 () Bool)

(assert (=> start!69418 m!751683))

(declare-fun m!751685 () Bool)

(assert (=> b!809485 m!751685))

(declare-fun m!751687 () Bool)

(assert (=> b!809487 m!751687))

(assert (=> b!809487 m!751687))

(declare-fun m!751689 () Bool)

(assert (=> b!809487 m!751689))

(declare-fun m!751691 () Bool)

(assert (=> b!809483 m!751691))

(declare-fun m!751693 () Bool)

(assert (=> b!809486 m!751693))

(declare-fun m!751695 () Bool)

(assert (=> b!809478 m!751695))

(declare-fun m!751697 () Bool)

(assert (=> b!809481 m!751697))

(declare-fun m!751699 () Bool)

(assert (=> b!809477 m!751699))

(assert (=> b!809477 m!751687))

(assert (=> b!809477 m!751687))

(declare-fun m!751701 () Bool)

(assert (=> b!809477 m!751701))

(assert (=> b!809477 m!751687))

(declare-fun m!751703 () Bool)

(assert (=> b!809477 m!751703))

(declare-fun m!751705 () Bool)

(assert (=> b!809479 m!751705))

(declare-fun m!751707 () Bool)

(assert (=> b!809479 m!751707))

(declare-fun m!751709 () Bool)

(assert (=> b!809479 m!751709))

(declare-fun m!751711 () Bool)

(assert (=> b!809479 m!751711))

(check-sat (not b!809487) (not b!809485) (not b!809483) (not b!809478) (not b!809486) (not b!809477) (not b!809480) (not b!809481) (not start!69418) (not b!809479))
(check-sat)
