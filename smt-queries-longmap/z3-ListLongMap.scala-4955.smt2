; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68220 () Bool)

(assert start!68220)

(declare-fun b!792502 () Bool)

(declare-fun res!537163 () Bool)

(declare-fun e!440340 () Bool)

(assert (=> b!792502 (=> (not res!537163) (not e!440340))))

(declare-datatypes ((array!43027 0))(
  ( (array!43028 (arr!20594 (Array (_ BitVec 32) (_ BitVec 64))) (size!21015 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43027)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792502 (= res!537163 (and (= (size!21015 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21015 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21015 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792503 () Bool)

(declare-fun res!537164 () Bool)

(assert (=> b!792503 (=> (not res!537164) (not e!440340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792503 (= res!537164 (validKeyInArray!0 (select (arr!20594 a!3170) j!153)))))

(declare-fun b!792504 () Bool)

(declare-fun res!537162 () Bool)

(declare-fun e!440341 () Bool)

(assert (=> b!792504 (=> (not res!537162) (not e!440341))))

(declare-datatypes ((List!14596 0))(
  ( (Nil!14593) (Cons!14592 (h!15721 (_ BitVec 64)) (t!20902 List!14596)) )
))
(declare-fun arrayNoDuplicates!0 (array!43027 (_ BitVec 32) List!14596) Bool)

(assert (=> b!792504 (= res!537162 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14593))))

(declare-fun b!792505 () Bool)

(declare-fun res!537166 () Bool)

(assert (=> b!792505 (=> (not res!537166) (not e!440341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43027 (_ BitVec 32)) Bool)

(assert (=> b!792505 (= res!537166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537167 () Bool)

(assert (=> start!68220 (=> (not res!537167) (not e!440340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68220 (= res!537167 (validMask!0 mask!3266))))

(assert (=> start!68220 e!440340))

(assert (=> start!68220 true))

(declare-fun array_inv!16477 (array!43027) Bool)

(assert (=> start!68220 (array_inv!16477 a!3170)))

(declare-fun b!792506 () Bool)

(declare-fun res!537168 () Bool)

(assert (=> b!792506 (=> (not res!537168) (not e!440340))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!792506 (= res!537168 (validKeyInArray!0 k0!2044))))

(declare-fun b!792507 () Bool)

(declare-fun res!537165 () Bool)

(assert (=> b!792507 (=> (not res!537165) (not e!440340))))

(declare-fun arrayContainsKey!0 (array!43027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792507 (= res!537165 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792508 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792508 (= e!440341 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21015 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20594 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21015 a!3170)) (= (select (arr!20594 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!792509 () Bool)

(assert (=> b!792509 (= e!440340 e!440341)))

(declare-fun res!537161 () Bool)

(assert (=> b!792509 (=> (not res!537161) (not e!440341))))

(declare-datatypes ((SeekEntryResult!8182 0))(
  ( (MissingZero!8182 (index!35096 (_ BitVec 32))) (Found!8182 (index!35097 (_ BitVec 32))) (Intermediate!8182 (undefined!8994 Bool) (index!35098 (_ BitVec 32)) (x!66055 (_ BitVec 32))) (Undefined!8182) (MissingVacant!8182 (index!35099 (_ BitVec 32))) )
))
(declare-fun lt!353339 () SeekEntryResult!8182)

(assert (=> b!792509 (= res!537161 (or (= lt!353339 (MissingZero!8182 i!1163)) (= lt!353339 (MissingVacant!8182 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43027 (_ BitVec 32)) SeekEntryResult!8182)

(assert (=> b!792509 (= lt!353339 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68220 res!537167) b!792502))

(assert (= (and b!792502 res!537163) b!792503))

(assert (= (and b!792503 res!537164) b!792506))

(assert (= (and b!792506 res!537168) b!792507))

(assert (= (and b!792507 res!537165) b!792509))

(assert (= (and b!792509 res!537161) b!792505))

(assert (= (and b!792505 res!537166) b!792504))

(assert (= (and b!792504 res!537162) b!792508))

(declare-fun m!732529 () Bool)

(assert (=> b!792508 m!732529))

(declare-fun m!732531 () Bool)

(assert (=> b!792508 m!732531))

(declare-fun m!732533 () Bool)

(assert (=> b!792506 m!732533))

(declare-fun m!732535 () Bool)

(assert (=> start!68220 m!732535))

(declare-fun m!732537 () Bool)

(assert (=> start!68220 m!732537))

(declare-fun m!732539 () Bool)

(assert (=> b!792507 m!732539))

(declare-fun m!732541 () Bool)

(assert (=> b!792509 m!732541))

(declare-fun m!732543 () Bool)

(assert (=> b!792503 m!732543))

(assert (=> b!792503 m!732543))

(declare-fun m!732545 () Bool)

(assert (=> b!792503 m!732545))

(declare-fun m!732547 () Bool)

(assert (=> b!792505 m!732547))

(declare-fun m!732549 () Bool)

(assert (=> b!792504 m!732549))

(check-sat (not b!792505) (not b!792509) (not b!792506) (not b!792504) (not start!68220) (not b!792503) (not b!792507))
(check-sat)
