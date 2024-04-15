; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69000 () Bool)

(assert start!69000)

(declare-fun b!804989 () Bool)

(declare-fun res!549654 () Bool)

(declare-fun e!445816 () Bool)

(assert (=> b!804989 (=> (not res!549654) (not e!445816))))

(declare-datatypes ((array!43807 0))(
  ( (array!43808 (arr!20984 (Array (_ BitVec 32) (_ BitVec 64))) (size!21405 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43807)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804989 (= res!549654 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804990 () Bool)

(declare-fun res!549655 () Bool)

(assert (=> b!804990 (=> (not res!549655) (not e!445816))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804990 (= res!549655 (and (= (size!21405 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21405 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21405 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804991 () Bool)

(declare-fun res!549650 () Bool)

(declare-fun e!445815 () Bool)

(assert (=> b!804991 (=> (not res!549650) (not e!445815))))

(declare-datatypes ((List!14986 0))(
  ( (Nil!14983) (Cons!14982 (h!16111 (_ BitVec 64)) (t!21292 List!14986)) )
))
(declare-fun arrayNoDuplicates!0 (array!43807 (_ BitVec 32) List!14986) Bool)

(assert (=> b!804991 (= res!549650 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14983))))

(declare-fun b!804992 () Bool)

(declare-fun res!549656 () Bool)

(assert (=> b!804992 (=> (not res!549656) (not e!445815))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804992 (= res!549656 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21405 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20984 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21405 a!3170)) (= (select (arr!20984 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!549653 () Bool)

(assert (=> start!69000 (=> (not res!549653) (not e!445816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69000 (= res!549653 (validMask!0 mask!3266))))

(assert (=> start!69000 e!445816))

(assert (=> start!69000 true))

(declare-fun array_inv!16867 (array!43807) Bool)

(assert (=> start!69000 (array_inv!16867 a!3170)))

(declare-fun b!804993 () Bool)

(declare-fun res!549651 () Bool)

(assert (=> b!804993 (=> (not res!549651) (not e!445816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804993 (= res!549651 (validKeyInArray!0 k0!2044))))

(declare-fun b!804994 () Bool)

(declare-fun e!445813 () Bool)

(assert (=> b!804994 (= e!445815 e!445813)))

(declare-fun res!549648 () Bool)

(assert (=> b!804994 (=> (not res!549648) (not e!445813))))

(declare-fun lt!360286 () (_ BitVec 64))

(declare-fun lt!360288 () array!43807)

(declare-datatypes ((SeekEntryResult!8572 0))(
  ( (MissingZero!8572 (index!36656 (_ BitVec 32))) (Found!8572 (index!36657 (_ BitVec 32))) (Intermediate!8572 (undefined!9384 Bool) (index!36658 (_ BitVec 32)) (x!67485 (_ BitVec 32))) (Undefined!8572) (MissingVacant!8572 (index!36659 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43807 (_ BitVec 32)) SeekEntryResult!8572)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43807 (_ BitVec 32)) SeekEntryResult!8572)

(assert (=> b!804994 (= res!549648 (= (seekEntryOrOpen!0 lt!360286 lt!360288 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360286 lt!360288 mask!3266)))))

(assert (=> b!804994 (= lt!360286 (select (store (arr!20984 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804994 (= lt!360288 (array!43808 (store (arr!20984 a!3170) i!1163 k0!2044) (size!21405 a!3170)))))

(declare-fun b!804995 () Bool)

(declare-fun res!549657 () Bool)

(assert (=> b!804995 (=> (not res!549657) (not e!445816))))

(assert (=> b!804995 (= res!549657 (validKeyInArray!0 (select (arr!20984 a!3170) j!153)))))

(declare-fun b!804996 () Bool)

(assert (=> b!804996 (= e!445816 e!445815)))

(declare-fun res!549649 () Bool)

(assert (=> b!804996 (=> (not res!549649) (not e!445815))))

(declare-fun lt!360290 () SeekEntryResult!8572)

(assert (=> b!804996 (= res!549649 (or (= lt!360290 (MissingZero!8572 i!1163)) (= lt!360290 (MissingVacant!8572 i!1163))))))

(assert (=> b!804996 (= lt!360290 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804997 () Bool)

(assert (=> b!804997 (= e!445813 false)))

(declare-fun lt!360287 () SeekEntryResult!8572)

(assert (=> b!804997 (= lt!360287 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20984 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360289 () SeekEntryResult!8572)

(assert (=> b!804997 (= lt!360289 (seekEntryOrOpen!0 (select (arr!20984 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804998 () Bool)

(declare-fun res!549652 () Bool)

(assert (=> b!804998 (=> (not res!549652) (not e!445815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43807 (_ BitVec 32)) Bool)

(assert (=> b!804998 (= res!549652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69000 res!549653) b!804990))

(assert (= (and b!804990 res!549655) b!804995))

(assert (= (and b!804995 res!549657) b!804993))

(assert (= (and b!804993 res!549651) b!804989))

(assert (= (and b!804989 res!549654) b!804996))

(assert (= (and b!804996 res!549649) b!804998))

(assert (= (and b!804998 res!549652) b!804991))

(assert (= (and b!804991 res!549650) b!804992))

(assert (= (and b!804992 res!549656) b!804994))

(assert (= (and b!804994 res!549648) b!804997))

(declare-fun m!746419 () Bool)

(assert (=> b!804996 m!746419))

(declare-fun m!746421 () Bool)

(assert (=> b!804993 m!746421))

(declare-fun m!746423 () Bool)

(assert (=> b!804992 m!746423))

(declare-fun m!746425 () Bool)

(assert (=> b!804992 m!746425))

(declare-fun m!746427 () Bool)

(assert (=> b!804991 m!746427))

(declare-fun m!746429 () Bool)

(assert (=> b!804997 m!746429))

(assert (=> b!804997 m!746429))

(declare-fun m!746431 () Bool)

(assert (=> b!804997 m!746431))

(assert (=> b!804997 m!746429))

(declare-fun m!746433 () Bool)

(assert (=> b!804997 m!746433))

(assert (=> b!804995 m!746429))

(assert (=> b!804995 m!746429))

(declare-fun m!746435 () Bool)

(assert (=> b!804995 m!746435))

(declare-fun m!746437 () Bool)

(assert (=> b!804998 m!746437))

(declare-fun m!746439 () Bool)

(assert (=> start!69000 m!746439))

(declare-fun m!746441 () Bool)

(assert (=> start!69000 m!746441))

(declare-fun m!746443 () Bool)

(assert (=> b!804994 m!746443))

(declare-fun m!746445 () Bool)

(assert (=> b!804994 m!746445))

(declare-fun m!746447 () Bool)

(assert (=> b!804994 m!746447))

(declare-fun m!746449 () Bool)

(assert (=> b!804994 m!746449))

(declare-fun m!746451 () Bool)

(assert (=> b!804989 m!746451))

(check-sat (not b!804991) (not b!804997) (not b!804995) (not b!804993) (not b!804994) (not b!804996) (not b!804998) (not b!804989) (not start!69000))
(check-sat)
