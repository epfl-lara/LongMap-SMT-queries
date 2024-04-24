; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69194 () Bool)

(assert start!69194)

(declare-fun b!806217 () Bool)

(declare-fun res!550190 () Bool)

(declare-fun e!446577 () Bool)

(assert (=> b!806217 (=> (not res!550190) (not e!446577))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43816 0))(
  ( (array!43817 (arr!20983 (Array (_ BitVec 32) (_ BitVec 64))) (size!21403 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43816)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!806217 (= res!550190 (and (= (size!21403 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21403 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21403 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806218 () Bool)

(declare-fun res!550194 () Bool)

(declare-fun e!446578 () Bool)

(assert (=> b!806218 (=> (not res!550194) (not e!446578))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806218 (= res!550194 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21403 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20983 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21403 a!3170)) (= (select (arr!20983 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806219 () Bool)

(declare-fun res!550188 () Bool)

(assert (=> b!806219 (=> (not res!550188) (not e!446577))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806219 (= res!550188 (validKeyInArray!0 k0!2044))))

(declare-fun b!806220 () Bool)

(declare-fun res!550192 () Bool)

(assert (=> b!806220 (=> (not res!550192) (not e!446578))))

(declare-datatypes ((List!14853 0))(
  ( (Nil!14850) (Cons!14849 (h!15984 (_ BitVec 64)) (t!21160 List!14853)) )
))
(declare-fun arrayNoDuplicates!0 (array!43816 (_ BitVec 32) List!14853) Bool)

(assert (=> b!806220 (= res!550192 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14850))))

(declare-fun b!806221 () Bool)

(declare-fun res!550193 () Bool)

(assert (=> b!806221 (=> (not res!550193) (not e!446578))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43816 (_ BitVec 32)) Bool)

(assert (=> b!806221 (= res!550193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806222 () Bool)

(declare-fun res!550196 () Bool)

(assert (=> b!806222 (=> (not res!550196) (not e!446577))))

(assert (=> b!806222 (= res!550196 (validKeyInArray!0 (select (arr!20983 a!3170) j!153)))))

(declare-fun res!550189 () Bool)

(assert (=> start!69194 (=> (not res!550189) (not e!446577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69194 (= res!550189 (validMask!0 mask!3266))))

(assert (=> start!69194 e!446577))

(assert (=> start!69194 true))

(declare-fun array_inv!16842 (array!43816) Bool)

(assert (=> start!69194 (array_inv!16842 a!3170)))

(declare-fun b!806223 () Bool)

(assert (=> b!806223 (= e!446577 e!446578)))

(declare-fun res!550191 () Bool)

(assert (=> b!806223 (=> (not res!550191) (not e!446578))))

(declare-datatypes ((SeekEntryResult!8530 0))(
  ( (MissingZero!8530 (index!36488 (_ BitVec 32))) (Found!8530 (index!36489 (_ BitVec 32))) (Intermediate!8530 (undefined!9342 Bool) (index!36490 (_ BitVec 32)) (x!67470 (_ BitVec 32))) (Undefined!8530) (MissingVacant!8530 (index!36491 (_ BitVec 32))) )
))
(declare-fun lt!360930 () SeekEntryResult!8530)

(assert (=> b!806223 (= res!550191 (or (= lt!360930 (MissingZero!8530 i!1163)) (= lt!360930 (MissingVacant!8530 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43816 (_ BitVec 32)) SeekEntryResult!8530)

(assert (=> b!806223 (= lt!360930 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806224 () Bool)

(declare-fun e!446575 () Bool)

(assert (=> b!806224 (= e!446575 false)))

(declare-fun lt!360929 () SeekEntryResult!8530)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43816 (_ BitVec 32)) SeekEntryResult!8530)

(assert (=> b!806224 (= lt!360929 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20983 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360928 () SeekEntryResult!8530)

(assert (=> b!806224 (= lt!360928 (seekEntryOrOpen!0 (select (arr!20983 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806225 () Bool)

(declare-fun res!550197 () Bool)

(assert (=> b!806225 (=> (not res!550197) (not e!446577))))

(declare-fun arrayContainsKey!0 (array!43816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806225 (= res!550197 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806226 () Bool)

(assert (=> b!806226 (= e!446578 e!446575)))

(declare-fun res!550195 () Bool)

(assert (=> b!806226 (=> (not res!550195) (not e!446575))))

(declare-fun lt!360932 () array!43816)

(declare-fun lt!360931 () (_ BitVec 64))

(assert (=> b!806226 (= res!550195 (= (seekEntryOrOpen!0 lt!360931 lt!360932 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360931 lt!360932 mask!3266)))))

(assert (=> b!806226 (= lt!360931 (select (store (arr!20983 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806226 (= lt!360932 (array!43817 (store (arr!20983 a!3170) i!1163 k0!2044) (size!21403 a!3170)))))

(assert (= (and start!69194 res!550189) b!806217))

(assert (= (and b!806217 res!550190) b!806222))

(assert (= (and b!806222 res!550196) b!806219))

(assert (= (and b!806219 res!550188) b!806225))

(assert (= (and b!806225 res!550197) b!806223))

(assert (= (and b!806223 res!550191) b!806221))

(assert (= (and b!806221 res!550193) b!806220))

(assert (= (and b!806220 res!550192) b!806218))

(assert (= (and b!806218 res!550194) b!806226))

(assert (= (and b!806226 res!550195) b!806224))

(declare-fun m!748519 () Bool)

(assert (=> b!806226 m!748519))

(declare-fun m!748521 () Bool)

(assert (=> b!806226 m!748521))

(declare-fun m!748523 () Bool)

(assert (=> b!806226 m!748523))

(declare-fun m!748525 () Bool)

(assert (=> b!806226 m!748525))

(declare-fun m!748527 () Bool)

(assert (=> b!806224 m!748527))

(assert (=> b!806224 m!748527))

(declare-fun m!748529 () Bool)

(assert (=> b!806224 m!748529))

(assert (=> b!806224 m!748527))

(declare-fun m!748531 () Bool)

(assert (=> b!806224 m!748531))

(declare-fun m!748533 () Bool)

(assert (=> b!806223 m!748533))

(declare-fun m!748535 () Bool)

(assert (=> b!806220 m!748535))

(declare-fun m!748537 () Bool)

(assert (=> b!806221 m!748537))

(declare-fun m!748539 () Bool)

(assert (=> b!806218 m!748539))

(declare-fun m!748541 () Bool)

(assert (=> b!806218 m!748541))

(assert (=> b!806222 m!748527))

(assert (=> b!806222 m!748527))

(declare-fun m!748543 () Bool)

(assert (=> b!806222 m!748543))

(declare-fun m!748545 () Bool)

(assert (=> b!806225 m!748545))

(declare-fun m!748547 () Bool)

(assert (=> b!806219 m!748547))

(declare-fun m!748549 () Bool)

(assert (=> start!69194 m!748549))

(declare-fun m!748551 () Bool)

(assert (=> start!69194 m!748551))

(check-sat (not b!806221) (not b!806223) (not b!806222) (not b!806219) (not b!806225) (not b!806226) (not b!806220) (not b!806224) (not start!69194))
(check-sat)
