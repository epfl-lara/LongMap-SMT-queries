; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68388 () Bool)

(assert start!68388)

(declare-fun b!793682 () Bool)

(declare-fun res!537834 () Bool)

(declare-fun e!441024 () Bool)

(assert (=> b!793682 (=> (not res!537834) (not e!441024))))

(declare-datatypes ((array!43052 0))(
  ( (array!43053 (arr!20602 (Array (_ BitVec 32) (_ BitVec 64))) (size!21022 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43052)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793682 (= res!537834 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793683 () Bool)

(declare-fun res!537827 () Bool)

(assert (=> b!793683 (=> (not res!537827) (not e!441024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793683 (= res!537827 (validKeyInArray!0 k0!2044))))

(declare-fun res!537828 () Bool)

(assert (=> start!68388 (=> (not res!537828) (not e!441024))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68388 (= res!537828 (validMask!0 mask!3266))))

(assert (=> start!68388 e!441024))

(assert (=> start!68388 true))

(declare-fun array_inv!16461 (array!43052) Bool)

(assert (=> start!68388 (array_inv!16461 a!3170)))

(declare-fun b!793684 () Bool)

(declare-fun e!441025 () Bool)

(assert (=> b!793684 (= e!441024 e!441025)))

(declare-fun res!537832 () Bool)

(assert (=> b!793684 (=> (not res!537832) (not e!441025))))

(declare-datatypes ((SeekEntryResult!8149 0))(
  ( (MissingZero!8149 (index!34964 (_ BitVec 32))) (Found!8149 (index!34965 (_ BitVec 32))) (Intermediate!8149 (undefined!8961 Bool) (index!34966 (_ BitVec 32)) (x!66070 (_ BitVec 32))) (Undefined!8149) (MissingVacant!8149 (index!34967 (_ BitVec 32))) )
))
(declare-fun lt!353905 () SeekEntryResult!8149)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793684 (= res!537832 (or (= lt!353905 (MissingZero!8149 i!1163)) (= lt!353905 (MissingVacant!8149 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43052 (_ BitVec 32)) SeekEntryResult!8149)

(assert (=> b!793684 (= lt!353905 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793685 () Bool)

(declare-fun res!537833 () Bool)

(assert (=> b!793685 (=> (not res!537833) (not e!441024))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793685 (= res!537833 (and (= (size!21022 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21022 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21022 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793686 () Bool)

(declare-fun res!537829 () Bool)

(assert (=> b!793686 (=> (not res!537829) (not e!441024))))

(assert (=> b!793686 (= res!537829 (validKeyInArray!0 (select (arr!20602 a!3170) j!153)))))

(declare-fun b!793687 () Bool)

(declare-fun res!537831 () Bool)

(assert (=> b!793687 (=> (not res!537831) (not e!441025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43052 (_ BitVec 32)) Bool)

(assert (=> b!793687 (= res!537831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!793688 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793688 (= e!441025 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21022 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20602 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21022 a!3170)) (= (select (arr!20602 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!793689 () Bool)

(declare-fun res!537830 () Bool)

(assert (=> b!793689 (=> (not res!537830) (not e!441025))))

(declare-datatypes ((List!14472 0))(
  ( (Nil!14469) (Cons!14468 (h!15603 (_ BitVec 64)) (t!20779 List!14472)) )
))
(declare-fun arrayNoDuplicates!0 (array!43052 (_ BitVec 32) List!14472) Bool)

(assert (=> b!793689 (= res!537830 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14469))))

(assert (= (and start!68388 res!537828) b!793685))

(assert (= (and b!793685 res!537833) b!793686))

(assert (= (and b!793686 res!537829) b!793683))

(assert (= (and b!793683 res!537827) b!793682))

(assert (= (and b!793682 res!537834) b!793684))

(assert (= (and b!793684 res!537832) b!793687))

(assert (= (and b!793687 res!537831) b!793689))

(assert (= (and b!793689 res!537830) b!793688))

(declare-fun m!734609 () Bool)

(assert (=> b!793684 m!734609))

(declare-fun m!734611 () Bool)

(assert (=> b!793683 m!734611))

(declare-fun m!734613 () Bool)

(assert (=> b!793686 m!734613))

(assert (=> b!793686 m!734613))

(declare-fun m!734615 () Bool)

(assert (=> b!793686 m!734615))

(declare-fun m!734617 () Bool)

(assert (=> start!68388 m!734617))

(declare-fun m!734619 () Bool)

(assert (=> start!68388 m!734619))

(declare-fun m!734621 () Bool)

(assert (=> b!793682 m!734621))

(declare-fun m!734623 () Bool)

(assert (=> b!793689 m!734623))

(declare-fun m!734625 () Bool)

(assert (=> b!793687 m!734625))

(declare-fun m!734627 () Bool)

(assert (=> b!793688 m!734627))

(declare-fun m!734629 () Bool)

(assert (=> b!793688 m!734629))

(check-sat (not b!793687) (not b!793689) (not b!793683) (not b!793682) (not b!793684) (not start!68388) (not b!793686))
(check-sat)
