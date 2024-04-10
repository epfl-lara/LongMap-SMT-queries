; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69210 () Bool)

(assert start!69210)

(declare-fun b!807305 () Bool)

(declare-fun res!551428 () Bool)

(declare-fun e!446990 () Bool)

(assert (=> b!807305 (=> (not res!551428) (not e!446990))))

(declare-datatypes ((array!43910 0))(
  ( (array!43911 (arr!21032 (Array (_ BitVec 32) (_ BitVec 64))) (size!21453 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43910)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807305 (= res!551428 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807306 () Bool)

(declare-fun res!551435 () Bool)

(assert (=> b!807306 (=> (not res!551435) (not e!446990))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!807306 (= res!551435 (and (= (size!21453 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21453 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21453 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807307 () Bool)

(declare-fun res!551431 () Bool)

(declare-fun e!446993 () Bool)

(assert (=> b!807307 (=> (not res!551431) (not e!446993))))

(declare-datatypes ((List!14995 0))(
  ( (Nil!14992) (Cons!14991 (h!16120 (_ BitVec 64)) (t!21310 List!14995)) )
))
(declare-fun arrayNoDuplicates!0 (array!43910 (_ BitVec 32) List!14995) Bool)

(assert (=> b!807307 (= res!551431 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14992))))

(declare-fun b!807308 () Bool)

(declare-fun e!446991 () Bool)

(assert (=> b!807308 (= e!446991 false)))

(declare-fun lt!361660 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807308 (= lt!361660 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807309 () Bool)

(assert (=> b!807309 (= e!446990 e!446993)))

(declare-fun res!551433 () Bool)

(assert (=> b!807309 (=> (not res!551433) (not e!446993))))

(declare-datatypes ((SeekEntryResult!8623 0))(
  ( (MissingZero!8623 (index!36860 (_ BitVec 32))) (Found!8623 (index!36861 (_ BitVec 32))) (Intermediate!8623 (undefined!9435 Bool) (index!36862 (_ BitVec 32)) (x!67667 (_ BitVec 32))) (Undefined!8623) (MissingVacant!8623 (index!36863 (_ BitVec 32))) )
))
(declare-fun lt!361661 () SeekEntryResult!8623)

(assert (=> b!807309 (= res!551433 (or (= lt!361661 (MissingZero!8623 i!1163)) (= lt!361661 (MissingVacant!8623 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43910 (_ BitVec 32)) SeekEntryResult!8623)

(assert (=> b!807309 (= lt!361661 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807310 () Bool)

(declare-fun e!446989 () Bool)

(assert (=> b!807310 (= e!446989 e!446991)))

(declare-fun res!551437 () Bool)

(assert (=> b!807310 (=> (not res!551437) (not e!446991))))

(declare-fun lt!361659 () SeekEntryResult!8623)

(declare-fun lt!361657 () SeekEntryResult!8623)

(assert (=> b!807310 (= res!551437 (and (= lt!361657 lt!361659) (= lt!361659 (Found!8623 j!153)) (not (= (select (arr!21032 a!3170) index!1236) (select (arr!21032 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43910 (_ BitVec 32)) SeekEntryResult!8623)

(assert (=> b!807310 (= lt!361659 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21032 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807310 (= lt!361657 (seekEntryOrOpen!0 (select (arr!21032 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807311 () Bool)

(declare-fun res!551434 () Bool)

(assert (=> b!807311 (=> (not res!551434) (not e!446990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807311 (= res!551434 (validKeyInArray!0 (select (arr!21032 a!3170) j!153)))))

(declare-fun b!807312 () Bool)

(assert (=> b!807312 (= e!446993 e!446989)))

(declare-fun res!551429 () Bool)

(assert (=> b!807312 (=> (not res!551429) (not e!446989))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361656 () array!43910)

(declare-fun lt!361658 () (_ BitVec 64))

(assert (=> b!807312 (= res!551429 (= (seekEntryOrOpen!0 lt!361658 lt!361656 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361658 lt!361656 mask!3266)))))

(assert (=> b!807312 (= lt!361658 (select (store (arr!21032 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807312 (= lt!361656 (array!43911 (store (arr!21032 a!3170) i!1163 k!2044) (size!21453 a!3170)))))

(declare-fun b!807314 () Bool)

(declare-fun res!551432 () Bool)

(assert (=> b!807314 (=> (not res!551432) (not e!446990))))

(assert (=> b!807314 (= res!551432 (validKeyInArray!0 k!2044))))

(declare-fun b!807315 () Bool)

(declare-fun res!551438 () Bool)

(assert (=> b!807315 (=> (not res!551438) (not e!446993))))

(assert (=> b!807315 (= res!551438 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21453 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21032 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21453 a!3170)) (= (select (arr!21032 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!551430 () Bool)

(assert (=> start!69210 (=> (not res!551430) (not e!446990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69210 (= res!551430 (validMask!0 mask!3266))))

(assert (=> start!69210 e!446990))

(assert (=> start!69210 true))

(declare-fun array_inv!16828 (array!43910) Bool)

(assert (=> start!69210 (array_inv!16828 a!3170)))

(declare-fun b!807313 () Bool)

(declare-fun res!551436 () Bool)

(assert (=> b!807313 (=> (not res!551436) (not e!446993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43910 (_ BitVec 32)) Bool)

(assert (=> b!807313 (= res!551436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!69210 res!551430) b!807306))

(assert (= (and b!807306 res!551435) b!807311))

(assert (= (and b!807311 res!551434) b!807314))

(assert (= (and b!807314 res!551432) b!807305))

(assert (= (and b!807305 res!551428) b!807309))

(assert (= (and b!807309 res!551433) b!807313))

(assert (= (and b!807313 res!551436) b!807307))

(assert (= (and b!807307 res!551431) b!807315))

(assert (= (and b!807315 res!551438) b!807312))

(assert (= (and b!807312 res!551429) b!807310))

(assert (= (and b!807310 res!551437) b!807308))

(declare-fun m!749319 () Bool)

(assert (=> b!807311 m!749319))

(assert (=> b!807311 m!749319))

(declare-fun m!749321 () Bool)

(assert (=> b!807311 m!749321))

(declare-fun m!749323 () Bool)

(assert (=> b!807307 m!749323))

(declare-fun m!749325 () Bool)

(assert (=> b!807315 m!749325))

(declare-fun m!749327 () Bool)

(assert (=> b!807315 m!749327))

(declare-fun m!749329 () Bool)

(assert (=> b!807313 m!749329))

(declare-fun m!749331 () Bool)

(assert (=> b!807308 m!749331))

(declare-fun m!749333 () Bool)

(assert (=> b!807314 m!749333))

(declare-fun m!749335 () Bool)

(assert (=> b!807310 m!749335))

(assert (=> b!807310 m!749319))

(assert (=> b!807310 m!749319))

(declare-fun m!749337 () Bool)

(assert (=> b!807310 m!749337))

(assert (=> b!807310 m!749319))

(declare-fun m!749339 () Bool)

(assert (=> b!807310 m!749339))

(declare-fun m!749341 () Bool)

(assert (=> b!807309 m!749341))

(declare-fun m!749343 () Bool)

(assert (=> b!807312 m!749343))

(declare-fun m!749345 () Bool)

(assert (=> b!807312 m!749345))

(declare-fun m!749347 () Bool)

(assert (=> b!807312 m!749347))

(declare-fun m!749349 () Bool)

(assert (=> b!807312 m!749349))

(declare-fun m!749351 () Bool)

(assert (=> start!69210 m!749351))

(declare-fun m!749353 () Bool)

(assert (=> start!69210 m!749353))

(declare-fun m!749355 () Bool)

(assert (=> b!807305 m!749355))

(push 1)

