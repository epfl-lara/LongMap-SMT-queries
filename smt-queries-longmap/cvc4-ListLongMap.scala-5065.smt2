; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68904 () Bool)

(assert start!68904)

(declare-fun b!803677 () Bool)

(declare-fun res!548203 () Bool)

(declare-fun e!445319 () Bool)

(assert (=> b!803677 (=> (not res!548203) (not e!445319))))

(declare-datatypes ((array!43694 0))(
  ( (array!43695 (arr!20927 (Array (_ BitVec 32) (_ BitVec 64))) (size!21348 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43694)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43694 (_ BitVec 32)) Bool)

(assert (=> b!803677 (= res!548203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun e!445315 () Bool)

(declare-datatypes ((SeekEntryResult!8518 0))(
  ( (MissingZero!8518 (index!36440 (_ BitVec 32))) (Found!8518 (index!36441 (_ BitVec 32))) (Intermediate!8518 (undefined!9330 Bool) (index!36442 (_ BitVec 32)) (x!67276 (_ BitVec 32))) (Undefined!8518) (MissingVacant!8518 (index!36443 (_ BitVec 32))) )
))
(declare-fun lt!359778 () SeekEntryResult!8518)

(declare-fun b!803678 () Bool)

(declare-fun lt!359781 () SeekEntryResult!8518)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803678 (= e!445315 (not (or (not (= lt!359781 lt!359778)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359786 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359783 () array!43694)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359782 () (_ BitVec 64))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43694 (_ BitVec 32)) SeekEntryResult!8518)

(assert (=> b!803678 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359786 vacantAfter!23 lt!359782 lt!359783 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359786 vacantBefore!23 (select (arr!20927 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((Unit!27576 0))(
  ( (Unit!27577) )
))
(declare-fun lt!359780 () Unit!27576)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43694 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27576)

(assert (=> b!803678 (= lt!359780 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359786 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803678 (= lt!359786 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803679 () Bool)

(declare-fun res!548202 () Bool)

(declare-fun e!445316 () Bool)

(assert (=> b!803679 (=> (not res!548202) (not e!445316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803679 (= res!548202 (validKeyInArray!0 (select (arr!20927 a!3170) j!153)))))

(declare-fun b!803680 () Bool)

(declare-fun res!548205 () Bool)

(assert (=> b!803680 (=> (not res!548205) (not e!445316))))

(declare-fun arrayContainsKey!0 (array!43694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803680 (= res!548205 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803681 () Bool)

(declare-fun e!445317 () Bool)

(assert (=> b!803681 (= e!445317 e!445315)))

(declare-fun res!548200 () Bool)

(assert (=> b!803681 (=> (not res!548200) (not e!445315))))

(declare-fun lt!359784 () SeekEntryResult!8518)

(assert (=> b!803681 (= res!548200 (and (= lt!359784 lt!359778) (not (= (select (arr!20927 a!3170) index!1236) (select (arr!20927 a!3170) j!153)))))))

(assert (=> b!803681 (= lt!359778 (Found!8518 j!153))))

(declare-fun b!803682 () Bool)

(declare-fun res!548197 () Bool)

(assert (=> b!803682 (=> (not res!548197) (not e!445319))))

(assert (=> b!803682 (= res!548197 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21348 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20927 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21348 a!3170)) (= (select (arr!20927 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803683 () Bool)

(declare-fun res!548206 () Bool)

(assert (=> b!803683 (=> (not res!548206) (not e!445316))))

(assert (=> b!803683 (= res!548206 (and (= (size!21348 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21348 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21348 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803684 () Bool)

(declare-fun res!548198 () Bool)

(assert (=> b!803684 (=> (not res!548198) (not e!445319))))

(declare-datatypes ((List!14890 0))(
  ( (Nil!14887) (Cons!14886 (h!16015 (_ BitVec 64)) (t!21205 List!14890)) )
))
(declare-fun arrayNoDuplicates!0 (array!43694 (_ BitVec 32) List!14890) Bool)

(assert (=> b!803684 (= res!548198 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14887))))

(declare-fun b!803685 () Bool)

(declare-fun e!445318 () Bool)

(assert (=> b!803685 (= e!445318 e!445317)))

(declare-fun res!548199 () Bool)

(assert (=> b!803685 (=> (not res!548199) (not e!445317))))

(declare-fun lt!359785 () SeekEntryResult!8518)

(assert (=> b!803685 (= res!548199 (= lt!359785 lt!359784))))

(assert (=> b!803685 (= lt!359784 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20927 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43694 (_ BitVec 32)) SeekEntryResult!8518)

(assert (=> b!803685 (= lt!359785 (seekEntryOrOpen!0 (select (arr!20927 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803686 () Bool)

(assert (=> b!803686 (= e!445319 e!445318)))

(declare-fun res!548207 () Bool)

(assert (=> b!803686 (=> (not res!548207) (not e!445318))))

(declare-fun lt!359777 () SeekEntryResult!8518)

(assert (=> b!803686 (= res!548207 (= lt!359777 lt!359781))))

(assert (=> b!803686 (= lt!359781 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359782 lt!359783 mask!3266))))

(assert (=> b!803686 (= lt!359777 (seekEntryOrOpen!0 lt!359782 lt!359783 mask!3266))))

(assert (=> b!803686 (= lt!359782 (select (store (arr!20927 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803686 (= lt!359783 (array!43695 (store (arr!20927 a!3170) i!1163 k!2044) (size!21348 a!3170)))))

(declare-fun b!803687 () Bool)

(declare-fun res!548201 () Bool)

(assert (=> b!803687 (=> (not res!548201) (not e!445316))))

(assert (=> b!803687 (= res!548201 (validKeyInArray!0 k!2044))))

(declare-fun res!548196 () Bool)

(assert (=> start!68904 (=> (not res!548196) (not e!445316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68904 (= res!548196 (validMask!0 mask!3266))))

(assert (=> start!68904 e!445316))

(assert (=> start!68904 true))

(declare-fun array_inv!16723 (array!43694) Bool)

(assert (=> start!68904 (array_inv!16723 a!3170)))

(declare-fun b!803688 () Bool)

(assert (=> b!803688 (= e!445316 e!445319)))

(declare-fun res!548204 () Bool)

(assert (=> b!803688 (=> (not res!548204) (not e!445319))))

(declare-fun lt!359779 () SeekEntryResult!8518)

(assert (=> b!803688 (= res!548204 (or (= lt!359779 (MissingZero!8518 i!1163)) (= lt!359779 (MissingVacant!8518 i!1163))))))

(assert (=> b!803688 (= lt!359779 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68904 res!548196) b!803683))

(assert (= (and b!803683 res!548206) b!803679))

(assert (= (and b!803679 res!548202) b!803687))

(assert (= (and b!803687 res!548201) b!803680))

(assert (= (and b!803680 res!548205) b!803688))

(assert (= (and b!803688 res!548204) b!803677))

(assert (= (and b!803677 res!548203) b!803684))

(assert (= (and b!803684 res!548198) b!803682))

(assert (= (and b!803682 res!548197) b!803686))

(assert (= (and b!803686 res!548207) b!803685))

(assert (= (and b!803685 res!548199) b!803681))

(assert (= (and b!803681 res!548200) b!803678))

(declare-fun m!745467 () Bool)

(assert (=> b!803685 m!745467))

(assert (=> b!803685 m!745467))

(declare-fun m!745469 () Bool)

(assert (=> b!803685 m!745469))

(assert (=> b!803685 m!745467))

(declare-fun m!745471 () Bool)

(assert (=> b!803685 m!745471))

(declare-fun m!745473 () Bool)

(assert (=> b!803682 m!745473))

(declare-fun m!745475 () Bool)

(assert (=> b!803682 m!745475))

(declare-fun m!745477 () Bool)

(assert (=> b!803684 m!745477))

(declare-fun m!745479 () Bool)

(assert (=> b!803687 m!745479))

(declare-fun m!745481 () Bool)

(assert (=> b!803686 m!745481))

(declare-fun m!745483 () Bool)

(assert (=> b!803686 m!745483))

(declare-fun m!745485 () Bool)

(assert (=> b!803686 m!745485))

(declare-fun m!745487 () Bool)

(assert (=> b!803686 m!745487))

(declare-fun m!745489 () Bool)

(assert (=> start!68904 m!745489))

(declare-fun m!745491 () Bool)

(assert (=> start!68904 m!745491))

(assert (=> b!803678 m!745467))

(assert (=> b!803678 m!745467))

(declare-fun m!745493 () Bool)

(assert (=> b!803678 m!745493))

(declare-fun m!745495 () Bool)

(assert (=> b!803678 m!745495))

(declare-fun m!745497 () Bool)

(assert (=> b!803678 m!745497))

(declare-fun m!745499 () Bool)

(assert (=> b!803678 m!745499))

(declare-fun m!745501 () Bool)

(assert (=> b!803688 m!745501))

(assert (=> b!803679 m!745467))

(assert (=> b!803679 m!745467))

(declare-fun m!745503 () Bool)

(assert (=> b!803679 m!745503))

(declare-fun m!745505 () Bool)

(assert (=> b!803680 m!745505))

(declare-fun m!745507 () Bool)

(assert (=> b!803677 m!745507))

(declare-fun m!745509 () Bool)

(assert (=> b!803681 m!745509))

(assert (=> b!803681 m!745467))

(push 1)

(assert (not b!803684))

(assert (not b!803679))

(assert (not b!803680))

(assert (not b!803678))

(assert (not b!803687))

(assert (not b!803686))

(assert (not b!803685))

(assert (not b!803677))

(assert (not b!803688))

(assert (not start!68904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

