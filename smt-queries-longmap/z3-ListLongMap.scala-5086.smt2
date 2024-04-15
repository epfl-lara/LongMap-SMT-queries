; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69006 () Bool)

(assert start!69006)

(declare-fun b!805079 () Bool)

(declare-fun e!445851 () Bool)

(assert (=> b!805079 (= e!445851 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43813 0))(
  ( (array!43814 (arr!20987 (Array (_ BitVec 32) (_ BitVec 64))) (size!21408 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43813)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8575 0))(
  ( (MissingZero!8575 (index!36668 (_ BitVec 32))) (Found!8575 (index!36669 (_ BitVec 32))) (Intermediate!8575 (undefined!9387 Bool) (index!36670 (_ BitVec 32)) (x!67496 (_ BitVec 32))) (Undefined!8575) (MissingVacant!8575 (index!36671 (_ BitVec 32))) )
))
(declare-fun lt!360331 () SeekEntryResult!8575)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43813 (_ BitVec 32)) SeekEntryResult!8575)

(assert (=> b!805079 (= lt!360331 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20987 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360332 () SeekEntryResult!8575)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43813 (_ BitVec 32)) SeekEntryResult!8575)

(assert (=> b!805079 (= lt!360332 (seekEntryOrOpen!0 (select (arr!20987 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805080 () Bool)

(declare-fun res!549738 () Bool)

(declare-fun e!445849 () Bool)

(assert (=> b!805080 (=> (not res!549738) (not e!445849))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805080 (= res!549738 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805081 () Bool)

(declare-fun res!549743 () Bool)

(declare-fun e!445852 () Bool)

(assert (=> b!805081 (=> (not res!549743) (not e!445852))))

(declare-datatypes ((List!14989 0))(
  ( (Nil!14986) (Cons!14985 (h!16114 (_ BitVec 64)) (t!21295 List!14989)) )
))
(declare-fun arrayNoDuplicates!0 (array!43813 (_ BitVec 32) List!14989) Bool)

(assert (=> b!805081 (= res!549743 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14986))))

(declare-fun b!805082 () Bool)

(declare-fun res!549745 () Bool)

(assert (=> b!805082 (=> (not res!549745) (not e!445849))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805082 (= res!549745 (and (= (size!21408 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21408 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21408 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805083 () Bool)

(declare-fun res!549740 () Bool)

(assert (=> b!805083 (=> (not res!549740) (not e!445852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43813 (_ BitVec 32)) Bool)

(assert (=> b!805083 (= res!549740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!549746 () Bool)

(assert (=> start!69006 (=> (not res!549746) (not e!445849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69006 (= res!549746 (validMask!0 mask!3266))))

(assert (=> start!69006 e!445849))

(assert (=> start!69006 true))

(declare-fun array_inv!16870 (array!43813) Bool)

(assert (=> start!69006 (array_inv!16870 a!3170)))

(declare-fun b!805084 () Bool)

(assert (=> b!805084 (= e!445849 e!445852)))

(declare-fun res!549739 () Bool)

(assert (=> b!805084 (=> (not res!549739) (not e!445852))))

(declare-fun lt!360333 () SeekEntryResult!8575)

(assert (=> b!805084 (= res!549739 (or (= lt!360333 (MissingZero!8575 i!1163)) (= lt!360333 (MissingVacant!8575 i!1163))))))

(assert (=> b!805084 (= lt!360333 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805085 () Bool)

(declare-fun res!549744 () Bool)

(assert (=> b!805085 (=> (not res!549744) (not e!445849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805085 (= res!549744 (validKeyInArray!0 k0!2044))))

(declare-fun b!805086 () Bool)

(declare-fun res!549741 () Bool)

(assert (=> b!805086 (=> (not res!549741) (not e!445849))))

(assert (=> b!805086 (= res!549741 (validKeyInArray!0 (select (arr!20987 a!3170) j!153)))))

(declare-fun b!805087 () Bool)

(assert (=> b!805087 (= e!445852 e!445851)))

(declare-fun res!549747 () Bool)

(assert (=> b!805087 (=> (not res!549747) (not e!445851))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360334 () array!43813)

(declare-fun lt!360335 () (_ BitVec 64))

(assert (=> b!805087 (= res!549747 (= (seekEntryOrOpen!0 lt!360335 lt!360334 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360335 lt!360334 mask!3266)))))

(assert (=> b!805087 (= lt!360335 (select (store (arr!20987 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805087 (= lt!360334 (array!43814 (store (arr!20987 a!3170) i!1163 k0!2044) (size!21408 a!3170)))))

(declare-fun b!805088 () Bool)

(declare-fun res!549742 () Bool)

(assert (=> b!805088 (=> (not res!549742) (not e!445852))))

(assert (=> b!805088 (= res!549742 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21408 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20987 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21408 a!3170)) (= (select (arr!20987 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69006 res!549746) b!805082))

(assert (= (and b!805082 res!549745) b!805086))

(assert (= (and b!805086 res!549741) b!805085))

(assert (= (and b!805085 res!549744) b!805080))

(assert (= (and b!805080 res!549738) b!805084))

(assert (= (and b!805084 res!549739) b!805083))

(assert (= (and b!805083 res!549740) b!805081))

(assert (= (and b!805081 res!549743) b!805088))

(assert (= (and b!805088 res!549742) b!805087))

(assert (= (and b!805087 res!549747) b!805079))

(declare-fun m!746521 () Bool)

(assert (=> b!805087 m!746521))

(declare-fun m!746523 () Bool)

(assert (=> b!805087 m!746523))

(declare-fun m!746525 () Bool)

(assert (=> b!805087 m!746525))

(declare-fun m!746527 () Bool)

(assert (=> b!805087 m!746527))

(declare-fun m!746529 () Bool)

(assert (=> b!805083 m!746529))

(declare-fun m!746531 () Bool)

(assert (=> b!805084 m!746531))

(declare-fun m!746533 () Bool)

(assert (=> b!805085 m!746533))

(declare-fun m!746535 () Bool)

(assert (=> b!805086 m!746535))

(assert (=> b!805086 m!746535))

(declare-fun m!746537 () Bool)

(assert (=> b!805086 m!746537))

(declare-fun m!746539 () Bool)

(assert (=> b!805081 m!746539))

(declare-fun m!746541 () Bool)

(assert (=> start!69006 m!746541))

(declare-fun m!746543 () Bool)

(assert (=> start!69006 m!746543))

(declare-fun m!746545 () Bool)

(assert (=> b!805080 m!746545))

(declare-fun m!746547 () Bool)

(assert (=> b!805088 m!746547))

(declare-fun m!746549 () Bool)

(assert (=> b!805088 m!746549))

(assert (=> b!805079 m!746535))

(assert (=> b!805079 m!746535))

(declare-fun m!746551 () Bool)

(assert (=> b!805079 m!746551))

(assert (=> b!805079 m!746535))

(declare-fun m!746553 () Bool)

(assert (=> b!805079 m!746553))

(check-sat (not b!805087) (not b!805084) (not b!805085) (not b!805086) (not b!805079) (not start!69006) (not b!805081) (not b!805080) (not b!805083))
(check-sat)
