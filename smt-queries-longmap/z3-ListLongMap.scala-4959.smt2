; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68266 () Bool)

(assert start!68266)

(declare-fun res!537578 () Bool)

(declare-fun e!440612 () Bool)

(assert (=> start!68266 (=> (not res!537578) (not e!440612))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68266 (= res!537578 (validMask!0 mask!3266))))

(assert (=> start!68266 e!440612))

(assert (=> start!68266 true))

(declare-datatypes ((array!43056 0))(
  ( (array!43057 (arr!20608 (Array (_ BitVec 32) (_ BitVec 64))) (size!21029 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43056)

(declare-fun array_inv!16404 (array!43056) Bool)

(assert (=> start!68266 (array_inv!16404 a!3170)))

(declare-fun b!793055 () Bool)

(declare-fun res!537575 () Bool)

(declare-fun e!440610 () Bool)

(assert (=> b!793055 (=> (not res!537575) (not e!440610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43056 (_ BitVec 32)) Bool)

(assert (=> b!793055 (= res!537575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793056 () Bool)

(declare-fun res!537574 () Bool)

(assert (=> b!793056 (=> (not res!537574) (not e!440612))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793056 (= res!537574 (validKeyInArray!0 (select (arr!20608 a!3170) j!153)))))

(declare-fun b!793057 () Bool)

(assert (=> b!793057 (= e!440612 e!440610)))

(declare-fun res!537580 () Bool)

(assert (=> b!793057 (=> (not res!537580) (not e!440610))))

(declare-datatypes ((SeekEntryResult!8199 0))(
  ( (MissingZero!8199 (index!35164 (_ BitVec 32))) (Found!8199 (index!35165 (_ BitVec 32))) (Intermediate!8199 (undefined!9011 Bool) (index!35166 (_ BitVec 32)) (x!66109 (_ BitVec 32))) (Undefined!8199) (MissingVacant!8199 (index!35167 (_ BitVec 32))) )
))
(declare-fun lt!353636 () SeekEntryResult!8199)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793057 (= res!537580 (or (= lt!353636 (MissingZero!8199 i!1163)) (= lt!353636 (MissingVacant!8199 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43056 (_ BitVec 32)) SeekEntryResult!8199)

(assert (=> b!793057 (= lt!353636 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793058 () Bool)

(declare-fun res!537581 () Bool)

(assert (=> b!793058 (=> (not res!537581) (not e!440612))))

(declare-fun arrayContainsKey!0 (array!43056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793058 (= res!537581 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793059 () Bool)

(declare-fun res!537579 () Bool)

(assert (=> b!793059 (=> (not res!537579) (not e!440612))))

(assert (=> b!793059 (= res!537579 (validKeyInArray!0 k0!2044))))

(declare-fun b!793060 () Bool)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793060 (= e!440610 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21029 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20608 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21029 a!3170)) (= (select (arr!20608 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!793061 () Bool)

(declare-fun res!537577 () Bool)

(assert (=> b!793061 (=> (not res!537577) (not e!440612))))

(assert (=> b!793061 (= res!537577 (and (= (size!21029 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21029 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21029 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793062 () Bool)

(declare-fun res!537576 () Bool)

(assert (=> b!793062 (=> (not res!537576) (not e!440610))))

(declare-datatypes ((List!14571 0))(
  ( (Nil!14568) (Cons!14567 (h!15696 (_ BitVec 64)) (t!20886 List!14571)) )
))
(declare-fun arrayNoDuplicates!0 (array!43056 (_ BitVec 32) List!14571) Bool)

(assert (=> b!793062 (= res!537576 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14568))))

(assert (= (and start!68266 res!537578) b!793061))

(assert (= (and b!793061 res!537577) b!793056))

(assert (= (and b!793056 res!537574) b!793059))

(assert (= (and b!793059 res!537579) b!793058))

(assert (= (and b!793058 res!537581) b!793057))

(assert (= (and b!793057 res!537580) b!793055))

(assert (= (and b!793055 res!537575) b!793062))

(assert (= (and b!793062 res!537576) b!793060))

(declare-fun m!733551 () Bool)

(assert (=> b!793055 m!733551))

(declare-fun m!733553 () Bool)

(assert (=> b!793056 m!733553))

(assert (=> b!793056 m!733553))

(declare-fun m!733555 () Bool)

(assert (=> b!793056 m!733555))

(declare-fun m!733557 () Bool)

(assert (=> start!68266 m!733557))

(declare-fun m!733559 () Bool)

(assert (=> start!68266 m!733559))

(declare-fun m!733561 () Bool)

(assert (=> b!793059 m!733561))

(declare-fun m!733563 () Bool)

(assert (=> b!793058 m!733563))

(declare-fun m!733565 () Bool)

(assert (=> b!793060 m!733565))

(declare-fun m!733567 () Bool)

(assert (=> b!793060 m!733567))

(declare-fun m!733569 () Bool)

(assert (=> b!793057 m!733569))

(declare-fun m!733571 () Bool)

(assert (=> b!793062 m!733571))

(check-sat (not start!68266) (not b!793057) (not b!793058) (not b!793055) (not b!793062) (not b!793056) (not b!793059))
(check-sat)
