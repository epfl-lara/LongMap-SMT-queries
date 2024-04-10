; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69408 () Bool)

(assert start!69408)

(declare-fun b!809312 () Bool)

(declare-fun e!447989 () Bool)

(declare-fun e!447991 () Bool)

(assert (=> b!809312 (= e!447989 e!447991)))

(declare-fun res!553046 () Bool)

(assert (=> b!809312 (=> (not res!553046) (not e!447991))))

(declare-datatypes ((SeekEntryResult!8668 0))(
  ( (MissingZero!8668 (index!37040 (_ BitVec 32))) (Found!8668 (index!37041 (_ BitVec 32))) (Intermediate!8668 (undefined!9480 Bool) (index!37042 (_ BitVec 32)) (x!67844 (_ BitVec 32))) (Undefined!8668) (MissingVacant!8668 (index!37043 (_ BitVec 32))) )
))
(declare-fun lt!362679 () SeekEntryResult!8668)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809312 (= res!553046 (or (= lt!362679 (MissingZero!8668 i!1163)) (= lt!362679 (MissingVacant!8668 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!44006 0))(
  ( (array!44007 (arr!21077 (Array (_ BitVec 32) (_ BitVec 64))) (size!21498 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44006)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44006 (_ BitVec 32)) SeekEntryResult!8668)

(assert (=> b!809312 (= lt!362679 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809313 () Bool)

(declare-fun res!553044 () Bool)

(assert (=> b!809313 (=> (not res!553044) (not e!447991))))

(declare-datatypes ((List!15040 0))(
  ( (Nil!15037) (Cons!15036 (h!16165 (_ BitVec 64)) (t!21355 List!15040)) )
))
(declare-fun arrayNoDuplicates!0 (array!44006 (_ BitVec 32) List!15040) Bool)

(assert (=> b!809313 (= res!553044 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15037))))

(declare-fun b!809314 () Bool)

(declare-fun res!553042 () Bool)

(assert (=> b!809314 (=> (not res!553042) (not e!447991))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809314 (= res!553042 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21498 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21077 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21498 a!3170)) (= (select (arr!21077 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809315 () Bool)

(declare-fun e!447992 () Bool)

(assert (=> b!809315 (= e!447992 false)))

(declare-fun lt!362676 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809315 (= lt!362676 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809316 () Bool)

(declare-fun res!553047 () Bool)

(assert (=> b!809316 (=> (not res!553047) (not e!447991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44006 (_ BitVec 32)) Bool)

(assert (=> b!809316 (= res!553047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809318 () Bool)

(declare-fun e!447990 () Bool)

(assert (=> b!809318 (= e!447990 e!447992)))

(declare-fun res!553045 () Bool)

(assert (=> b!809318 (=> (not res!553045) (not e!447992))))

(declare-fun lt!362681 () SeekEntryResult!8668)

(declare-fun lt!362680 () SeekEntryResult!8668)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!809318 (= res!553045 (and (= lt!362681 lt!362680) (= lt!362680 (Found!8668 j!153)) (not (= (select (arr!21077 a!3170) index!1236) (select (arr!21077 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44006 (_ BitVec 32)) SeekEntryResult!8668)

(assert (=> b!809318 (= lt!362680 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21077 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809318 (= lt!362681 (seekEntryOrOpen!0 (select (arr!21077 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809319 () Bool)

(assert (=> b!809319 (= e!447991 e!447990)))

(declare-fun res!553043 () Bool)

(assert (=> b!809319 (=> (not res!553043) (not e!447990))))

(declare-fun lt!362677 () (_ BitVec 64))

(declare-fun lt!362678 () array!44006)

(assert (=> b!809319 (= res!553043 (= (seekEntryOrOpen!0 lt!362677 lt!362678 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362677 lt!362678 mask!3266)))))

(assert (=> b!809319 (= lt!362677 (select (store (arr!21077 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809319 (= lt!362678 (array!44007 (store (arr!21077 a!3170) i!1163 k!2044) (size!21498 a!3170)))))

(declare-fun b!809320 () Bool)

(declare-fun res!553041 () Bool)

(assert (=> b!809320 (=> (not res!553041) (not e!447989))))

(assert (=> b!809320 (= res!553041 (and (= (size!21498 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21498 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21498 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809321 () Bool)

(declare-fun res!553039 () Bool)

(assert (=> b!809321 (=> (not res!553039) (not e!447989))))

(declare-fun arrayContainsKey!0 (array!44006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809321 (= res!553039 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809322 () Bool)

(declare-fun res!553048 () Bool)

(assert (=> b!809322 (=> (not res!553048) (not e!447989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809322 (= res!553048 (validKeyInArray!0 k!2044))))

(declare-fun res!553049 () Bool)

(assert (=> start!69408 (=> (not res!553049) (not e!447989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69408 (= res!553049 (validMask!0 mask!3266))))

(assert (=> start!69408 e!447989))

(assert (=> start!69408 true))

(declare-fun array_inv!16873 (array!44006) Bool)

(assert (=> start!69408 (array_inv!16873 a!3170)))

(declare-fun b!809317 () Bool)

(declare-fun res!553040 () Bool)

(assert (=> b!809317 (=> (not res!553040) (not e!447989))))

(assert (=> b!809317 (= res!553040 (validKeyInArray!0 (select (arr!21077 a!3170) j!153)))))

(assert (= (and start!69408 res!553049) b!809320))

(assert (= (and b!809320 res!553041) b!809317))

(assert (= (and b!809317 res!553040) b!809322))

(assert (= (and b!809322 res!553048) b!809321))

(assert (= (and b!809321 res!553039) b!809312))

(assert (= (and b!809312 res!553046) b!809316))

(assert (= (and b!809316 res!553047) b!809313))

(assert (= (and b!809313 res!553044) b!809314))

(assert (= (and b!809314 res!553042) b!809319))

(assert (= (and b!809319 res!553043) b!809318))

(assert (= (and b!809318 res!553045) b!809315))

(declare-fun m!751485 () Bool)

(assert (=> b!809315 m!751485))

(declare-fun m!751487 () Bool)

(assert (=> start!69408 m!751487))

(declare-fun m!751489 () Bool)

(assert (=> start!69408 m!751489))

(declare-fun m!751491 () Bool)

(assert (=> b!809313 m!751491))

(declare-fun m!751493 () Bool)

(assert (=> b!809316 m!751493))

(declare-fun m!751495 () Bool)

(assert (=> b!809319 m!751495))

(declare-fun m!751497 () Bool)

(assert (=> b!809319 m!751497))

(declare-fun m!751499 () Bool)

(assert (=> b!809319 m!751499))

(declare-fun m!751501 () Bool)

(assert (=> b!809319 m!751501))

(declare-fun m!751503 () Bool)

(assert (=> b!809322 m!751503))

(declare-fun m!751505 () Bool)

(assert (=> b!809312 m!751505))

(declare-fun m!751507 () Bool)

(assert (=> b!809318 m!751507))

(declare-fun m!751509 () Bool)

(assert (=> b!809318 m!751509))

(assert (=> b!809318 m!751509))

(declare-fun m!751511 () Bool)

(assert (=> b!809318 m!751511))

(assert (=> b!809318 m!751509))

(declare-fun m!751513 () Bool)

(assert (=> b!809318 m!751513))

(declare-fun m!751515 () Bool)

(assert (=> b!809321 m!751515))

(declare-fun m!751517 () Bool)

(assert (=> b!809314 m!751517))

(declare-fun m!751519 () Bool)

(assert (=> b!809314 m!751519))

(assert (=> b!809317 m!751509))

(assert (=> b!809317 m!751509))

(declare-fun m!751521 () Bool)

(assert (=> b!809317 m!751521))

(push 1)

