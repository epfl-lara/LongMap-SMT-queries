; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69410 () Bool)

(assert start!69410)

(declare-fun b!809345 () Bool)

(declare-fun res!553072 () Bool)

(declare-fun e!448005 () Bool)

(assert (=> b!809345 (=> (not res!553072) (not e!448005))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809345 (= res!553072 (validKeyInArray!0 k!2044))))

(declare-fun b!809347 () Bool)

(declare-fun res!553079 () Bool)

(assert (=> b!809347 (=> (not res!553079) (not e!448005))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44008 0))(
  ( (array!44009 (arr!21078 (Array (_ BitVec 32) (_ BitVec 64))) (size!21499 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44008)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!809347 (= res!553079 (and (= (size!21499 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21499 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21499 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809348 () Bool)

(declare-fun e!448003 () Bool)

(declare-fun e!448007 () Bool)

(assert (=> b!809348 (= e!448003 e!448007)))

(declare-fun res!553081 () Bool)

(assert (=> b!809348 (=> (not res!553081) (not e!448007))))

(declare-fun lt!362699 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!362698 () array!44008)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8669 0))(
  ( (MissingZero!8669 (index!37044 (_ BitVec 32))) (Found!8669 (index!37045 (_ BitVec 32))) (Intermediate!8669 (undefined!9481 Bool) (index!37046 (_ BitVec 32)) (x!67853 (_ BitVec 32))) (Undefined!8669) (MissingVacant!8669 (index!37047 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44008 (_ BitVec 32)) SeekEntryResult!8669)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44008 (_ BitVec 32)) SeekEntryResult!8669)

(assert (=> b!809348 (= res!553081 (= (seekEntryOrOpen!0 lt!362699 lt!362698 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362699 lt!362698 mask!3266)))))

(assert (=> b!809348 (= lt!362699 (select (store (arr!21078 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809348 (= lt!362698 (array!44009 (store (arr!21078 a!3170) i!1163 k!2044) (size!21499 a!3170)))))

(declare-fun b!809349 () Bool)

(declare-fun res!553074 () Bool)

(assert (=> b!809349 (=> (not res!553074) (not e!448003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44008 (_ BitVec 32)) Bool)

(assert (=> b!809349 (= res!553074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809350 () Bool)

(assert (=> b!809350 (= e!448005 e!448003)))

(declare-fun res!553080 () Bool)

(assert (=> b!809350 (=> (not res!553080) (not e!448003))))

(declare-fun lt!362697 () SeekEntryResult!8669)

(assert (=> b!809350 (= res!553080 (or (= lt!362697 (MissingZero!8669 i!1163)) (= lt!362697 (MissingVacant!8669 i!1163))))))

(assert (=> b!809350 (= lt!362697 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809351 () Bool)

(declare-fun res!553073 () Bool)

(assert (=> b!809351 (=> (not res!553073) (not e!448003))))

(declare-datatypes ((List!15041 0))(
  ( (Nil!15038) (Cons!15037 (h!16166 (_ BitVec 64)) (t!21356 List!15041)) )
))
(declare-fun arrayNoDuplicates!0 (array!44008 (_ BitVec 32) List!15041) Bool)

(assert (=> b!809351 (= res!553073 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15038))))

(declare-fun b!809352 () Bool)

(declare-fun res!553076 () Bool)

(assert (=> b!809352 (=> (not res!553076) (not e!448005))))

(declare-fun arrayContainsKey!0 (array!44008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809352 (= res!553076 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809353 () Bool)

(declare-fun e!448004 () Bool)

(assert (=> b!809353 (= e!448004 false)))

(declare-fun lt!362696 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809353 (= lt!362696 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809354 () Bool)

(declare-fun res!553077 () Bool)

(assert (=> b!809354 (=> (not res!553077) (not e!448003))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!809354 (= res!553077 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21499 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21078 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21499 a!3170)) (= (select (arr!21078 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809355 () Bool)

(declare-fun res!553078 () Bool)

(assert (=> b!809355 (=> (not res!553078) (not e!448005))))

(assert (=> b!809355 (= res!553078 (validKeyInArray!0 (select (arr!21078 a!3170) j!153)))))

(declare-fun res!553075 () Bool)

(assert (=> start!69410 (=> (not res!553075) (not e!448005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69410 (= res!553075 (validMask!0 mask!3266))))

(assert (=> start!69410 e!448005))

(assert (=> start!69410 true))

(declare-fun array_inv!16874 (array!44008) Bool)

(assert (=> start!69410 (array_inv!16874 a!3170)))

(declare-fun b!809346 () Bool)

(assert (=> b!809346 (= e!448007 e!448004)))

(declare-fun res!553082 () Bool)

(assert (=> b!809346 (=> (not res!553082) (not e!448004))))

(declare-fun lt!362694 () SeekEntryResult!8669)

(declare-fun lt!362695 () SeekEntryResult!8669)

(assert (=> b!809346 (= res!553082 (and (= lt!362694 lt!362695) (= lt!362695 (Found!8669 j!153)) (not (= (select (arr!21078 a!3170) index!1236) (select (arr!21078 a!3170) j!153)))))))

(assert (=> b!809346 (= lt!362695 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21078 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809346 (= lt!362694 (seekEntryOrOpen!0 (select (arr!21078 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69410 res!553075) b!809347))

(assert (= (and b!809347 res!553079) b!809355))

(assert (= (and b!809355 res!553078) b!809345))

(assert (= (and b!809345 res!553072) b!809352))

(assert (= (and b!809352 res!553076) b!809350))

(assert (= (and b!809350 res!553080) b!809349))

(assert (= (and b!809349 res!553074) b!809351))

(assert (= (and b!809351 res!553073) b!809354))

(assert (= (and b!809354 res!553077) b!809348))

(assert (= (and b!809348 res!553081) b!809346))

(assert (= (and b!809346 res!553082) b!809353))

(declare-fun m!751523 () Bool)

(assert (=> start!69410 m!751523))

(declare-fun m!751525 () Bool)

(assert (=> start!69410 m!751525))

(declare-fun m!751527 () Bool)

(assert (=> b!809351 m!751527))

(declare-fun m!751529 () Bool)

(assert (=> b!809348 m!751529))

(declare-fun m!751531 () Bool)

(assert (=> b!809348 m!751531))

(declare-fun m!751533 () Bool)

(assert (=> b!809348 m!751533))

(declare-fun m!751535 () Bool)

(assert (=> b!809348 m!751535))

(declare-fun m!751537 () Bool)

(assert (=> b!809355 m!751537))

(assert (=> b!809355 m!751537))

(declare-fun m!751539 () Bool)

(assert (=> b!809355 m!751539))

(declare-fun m!751541 () Bool)

(assert (=> b!809349 m!751541))

(declare-fun m!751543 () Bool)

(assert (=> b!809346 m!751543))

(assert (=> b!809346 m!751537))

(assert (=> b!809346 m!751537))

(declare-fun m!751545 () Bool)

(assert (=> b!809346 m!751545))

(assert (=> b!809346 m!751537))

(declare-fun m!751547 () Bool)

(assert (=> b!809346 m!751547))

(declare-fun m!751549 () Bool)

(assert (=> b!809354 m!751549))

(declare-fun m!751551 () Bool)

(assert (=> b!809354 m!751551))

(declare-fun m!751553 () Bool)

(assert (=> b!809352 m!751553))

(declare-fun m!751555 () Bool)

(assert (=> b!809345 m!751555))

(declare-fun m!751557 () Bool)

(assert (=> b!809353 m!751557))

(declare-fun m!751559 () Bool)

(assert (=> b!809350 m!751559))

(push 1)

