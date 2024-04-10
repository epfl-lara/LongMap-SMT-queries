; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69212 () Bool)

(assert start!69212)

(declare-fun b!807338 () Bool)

(declare-fun res!551464 () Bool)

(declare-fun e!447005 () Bool)

(assert (=> b!807338 (=> (not res!551464) (not e!447005))))

(declare-datatypes ((array!43912 0))(
  ( (array!43913 (arr!21033 (Array (_ BitVec 32) (_ BitVec 64))) (size!21454 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43912)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807338 (= res!551464 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807339 () Bool)

(declare-fun res!551465 () Bool)

(declare-fun e!447004 () Bool)

(assert (=> b!807339 (=> (not res!551465) (not e!447004))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807339 (= res!551465 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21454 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21033 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21454 a!3170)) (= (select (arr!21033 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807340 () Bool)

(declare-fun res!551461 () Bool)

(assert (=> b!807340 (=> (not res!551461) (not e!447005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807340 (= res!551461 (validKeyInArray!0 k!2044))))

(declare-fun b!807341 () Bool)

(declare-fun res!551462 () Bool)

(assert (=> b!807341 (=> (not res!551462) (not e!447004))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43912 (_ BitVec 32)) Bool)

(assert (=> b!807341 (= res!551462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807342 () Bool)

(declare-fun e!447007 () Bool)

(assert (=> b!807342 (= e!447007 false)))

(declare-fun lt!361678 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807342 (= lt!361678 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807343 () Bool)

(declare-fun res!551468 () Bool)

(assert (=> b!807343 (=> (not res!551468) (not e!447004))))

(declare-datatypes ((List!14996 0))(
  ( (Nil!14993) (Cons!14992 (h!16121 (_ BitVec 64)) (t!21311 List!14996)) )
))
(declare-fun arrayNoDuplicates!0 (array!43912 (_ BitVec 32) List!14996) Bool)

(assert (=> b!807343 (= res!551468 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14993))))

(declare-fun b!807344 () Bool)

(declare-fun e!447008 () Bool)

(assert (=> b!807344 (= e!447008 e!447007)))

(declare-fun res!551470 () Bool)

(assert (=> b!807344 (=> (not res!551470) (not e!447007))))

(declare-datatypes ((SeekEntryResult!8624 0))(
  ( (MissingZero!8624 (index!36864 (_ BitVec 32))) (Found!8624 (index!36865 (_ BitVec 32))) (Intermediate!8624 (undefined!9436 Bool) (index!36866 (_ BitVec 32)) (x!67676 (_ BitVec 32))) (Undefined!8624) (MissingVacant!8624 (index!36867 (_ BitVec 32))) )
))
(declare-fun lt!361679 () SeekEntryResult!8624)

(declare-fun lt!361677 () SeekEntryResult!8624)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807344 (= res!551470 (and (= lt!361677 lt!361679) (= lt!361679 (Found!8624 j!153)) (not (= (select (arr!21033 a!3170) index!1236) (select (arr!21033 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43912 (_ BitVec 32)) SeekEntryResult!8624)

(assert (=> b!807344 (= lt!361679 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21033 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43912 (_ BitVec 32)) SeekEntryResult!8624)

(assert (=> b!807344 (= lt!361677 (seekEntryOrOpen!0 (select (arr!21033 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807345 () Bool)

(declare-fun res!551467 () Bool)

(assert (=> b!807345 (=> (not res!551467) (not e!447005))))

(assert (=> b!807345 (= res!551467 (validKeyInArray!0 (select (arr!21033 a!3170) j!153)))))

(declare-fun res!551469 () Bool)

(assert (=> start!69212 (=> (not res!551469) (not e!447005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69212 (= res!551469 (validMask!0 mask!3266))))

(assert (=> start!69212 e!447005))

(assert (=> start!69212 true))

(declare-fun array_inv!16829 (array!43912) Bool)

(assert (=> start!69212 (array_inv!16829 a!3170)))

(declare-fun b!807346 () Bool)

(declare-fun res!551471 () Bool)

(assert (=> b!807346 (=> (not res!551471) (not e!447005))))

(assert (=> b!807346 (= res!551471 (and (= (size!21454 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21454 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21454 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807347 () Bool)

(assert (=> b!807347 (= e!447004 e!447008)))

(declare-fun res!551466 () Bool)

(assert (=> b!807347 (=> (not res!551466) (not e!447008))))

(declare-fun lt!361675 () (_ BitVec 64))

(declare-fun lt!361674 () array!43912)

(assert (=> b!807347 (= res!551466 (= (seekEntryOrOpen!0 lt!361675 lt!361674 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361675 lt!361674 mask!3266)))))

(assert (=> b!807347 (= lt!361675 (select (store (arr!21033 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807347 (= lt!361674 (array!43913 (store (arr!21033 a!3170) i!1163 k!2044) (size!21454 a!3170)))))

(declare-fun b!807348 () Bool)

(assert (=> b!807348 (= e!447005 e!447004)))

(declare-fun res!551463 () Bool)

(assert (=> b!807348 (=> (not res!551463) (not e!447004))))

(declare-fun lt!361676 () SeekEntryResult!8624)

(assert (=> b!807348 (= res!551463 (or (= lt!361676 (MissingZero!8624 i!1163)) (= lt!361676 (MissingVacant!8624 i!1163))))))

(assert (=> b!807348 (= lt!361676 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69212 res!551469) b!807346))

(assert (= (and b!807346 res!551471) b!807345))

(assert (= (and b!807345 res!551467) b!807340))

(assert (= (and b!807340 res!551461) b!807338))

(assert (= (and b!807338 res!551464) b!807348))

(assert (= (and b!807348 res!551463) b!807341))

(assert (= (and b!807341 res!551462) b!807343))

(assert (= (and b!807343 res!551468) b!807339))

(assert (= (and b!807339 res!551465) b!807347))

(assert (= (and b!807347 res!551466) b!807344))

(assert (= (and b!807344 res!551470) b!807342))

(declare-fun m!749357 () Bool)

(assert (=> b!807343 m!749357))

(declare-fun m!749359 () Bool)

(assert (=> b!807348 m!749359))

(declare-fun m!749361 () Bool)

(assert (=> b!807340 m!749361))

(declare-fun m!749363 () Bool)

(assert (=> b!807341 m!749363))

(declare-fun m!749365 () Bool)

(assert (=> b!807339 m!749365))

(declare-fun m!749367 () Bool)

(assert (=> b!807339 m!749367))

(declare-fun m!749369 () Bool)

(assert (=> b!807342 m!749369))

(declare-fun m!749371 () Bool)

(assert (=> b!807344 m!749371))

(declare-fun m!749373 () Bool)

(assert (=> b!807344 m!749373))

(assert (=> b!807344 m!749373))

(declare-fun m!749375 () Bool)

(assert (=> b!807344 m!749375))

(assert (=> b!807344 m!749373))

(declare-fun m!749377 () Bool)

(assert (=> b!807344 m!749377))

(declare-fun m!749379 () Bool)

(assert (=> start!69212 m!749379))

(declare-fun m!749381 () Bool)

(assert (=> start!69212 m!749381))

(declare-fun m!749383 () Bool)

(assert (=> b!807347 m!749383))

(declare-fun m!749385 () Bool)

(assert (=> b!807347 m!749385))

(declare-fun m!749387 () Bool)

(assert (=> b!807347 m!749387))

(declare-fun m!749389 () Bool)

(assert (=> b!807347 m!749389))

(assert (=> b!807345 m!749373))

(assert (=> b!807345 m!749373))

(declare-fun m!749391 () Bool)

(assert (=> b!807345 m!749391))

(declare-fun m!749393 () Bool)

(assert (=> b!807338 m!749393))

(push 1)

