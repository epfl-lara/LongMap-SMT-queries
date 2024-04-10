; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68932 () Bool)

(assert start!68932)

(declare-fun b!804134 () Bool)

(declare-fun res!548660 () Bool)

(declare-fun e!445524 () Bool)

(assert (=> b!804134 (=> (not res!548660) (not e!445524))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804134 (= res!548660 (validKeyInArray!0 k0!2044))))

(declare-fun b!804135 () Bool)

(declare-fun e!445526 () Bool)

(assert (=> b!804135 (= e!445524 e!445526)))

(declare-fun res!548659 () Bool)

(assert (=> b!804135 (=> (not res!548659) (not e!445526))))

(declare-datatypes ((SeekEntryResult!8532 0))(
  ( (MissingZero!8532 (index!36496 (_ BitVec 32))) (Found!8532 (index!36497 (_ BitVec 32))) (Intermediate!8532 (undefined!9344 Bool) (index!36498 (_ BitVec 32)) (x!67330 (_ BitVec 32))) (Undefined!8532) (MissingVacant!8532 (index!36499 (_ BitVec 32))) )
))
(declare-fun lt!360071 () SeekEntryResult!8532)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804135 (= res!548659 (or (= lt!360071 (MissingZero!8532 i!1163)) (= lt!360071 (MissingVacant!8532 i!1163))))))

(declare-datatypes ((array!43722 0))(
  ( (array!43723 (arr!20941 (Array (_ BitVec 32) (_ BitVec 64))) (size!21362 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43722)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43722 (_ BitVec 32)) SeekEntryResult!8532)

(assert (=> b!804135 (= lt!360071 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804136 () Bool)

(declare-fun res!548656 () Bool)

(assert (=> b!804136 (=> (not res!548656) (not e!445524))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804136 (= res!548656 (validKeyInArray!0 (select (arr!20941 a!3170) j!153)))))

(declare-fun b!804137 () Bool)

(declare-fun res!548653 () Bool)

(assert (=> b!804137 (=> (not res!548653) (not e!445526))))

(declare-datatypes ((List!14904 0))(
  ( (Nil!14901) (Cons!14900 (h!16029 (_ BitVec 64)) (t!21219 List!14904)) )
))
(declare-fun arrayNoDuplicates!0 (array!43722 (_ BitVec 32) List!14904) Bool)

(assert (=> b!804137 (= res!548653 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14901))))

(declare-fun b!804139 () Bool)

(declare-fun res!548654 () Bool)

(assert (=> b!804139 (=> (not res!548654) (not e!445524))))

(declare-fun arrayContainsKey!0 (array!43722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804139 (= res!548654 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804140 () Bool)

(declare-fun res!548658 () Bool)

(assert (=> b!804140 (=> (not res!548658) (not e!445524))))

(assert (=> b!804140 (= res!548658 (and (= (size!21362 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21362 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21362 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804141 () Bool)

(declare-fun res!548657 () Bool)

(assert (=> b!804141 (=> (not res!548657) (not e!445526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43722 (_ BitVec 32)) Bool)

(assert (=> b!804141 (= res!548657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!804138 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804138 (= e!445526 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21362 a!3170)) (= vacantBefore!23 i!1163) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (size!21362 a!3170)))))))

(declare-fun res!548655 () Bool)

(assert (=> start!68932 (=> (not res!548655) (not e!445524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68932 (= res!548655 (validMask!0 mask!3266))))

(assert (=> start!68932 e!445524))

(assert (=> start!68932 true))

(declare-fun array_inv!16737 (array!43722) Bool)

(assert (=> start!68932 (array_inv!16737 a!3170)))

(assert (= (and start!68932 res!548655) b!804140))

(assert (= (and b!804140 res!548658) b!804136))

(assert (= (and b!804136 res!548656) b!804134))

(assert (= (and b!804134 res!548660) b!804139))

(assert (= (and b!804139 res!548654) b!804135))

(assert (= (and b!804135 res!548659) b!804141))

(assert (= (and b!804141 res!548657) b!804137))

(assert (= (and b!804137 res!548653) b!804138))

(declare-fun m!746057 () Bool)

(assert (=> start!68932 m!746057))

(declare-fun m!746059 () Bool)

(assert (=> start!68932 m!746059))

(declare-fun m!746061 () Bool)

(assert (=> b!804135 m!746061))

(declare-fun m!746063 () Bool)

(assert (=> b!804134 m!746063))

(declare-fun m!746065 () Bool)

(assert (=> b!804139 m!746065))

(declare-fun m!746067 () Bool)

(assert (=> b!804141 m!746067))

(declare-fun m!746069 () Bool)

(assert (=> b!804136 m!746069))

(assert (=> b!804136 m!746069))

(declare-fun m!746071 () Bool)

(assert (=> b!804136 m!746071))

(declare-fun m!746073 () Bool)

(assert (=> b!804137 m!746073))

(check-sat (not b!804139) (not start!68932) (not b!804135) (not b!804136) (not b!804137) (not b!804134) (not b!804141))
(check-sat)
