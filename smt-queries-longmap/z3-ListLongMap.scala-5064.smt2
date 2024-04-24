; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69062 () Bool)

(assert start!69062)

(declare-fun b!804392 () Bool)

(declare-fun res!548370 () Bool)

(declare-fun e!445804 () Bool)

(assert (=> b!804392 (=> (not res!548370) (not e!445804))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43684 0))(
  ( (array!43685 (arr!20917 (Array (_ BitVec 32) (_ BitVec 64))) (size!21337 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43684)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!804392 (= res!548370 (and (= (size!21337 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21337 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21337 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!548367 () Bool)

(assert (=> start!69062 (=> (not res!548367) (not e!445804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69062 (= res!548367 (validMask!0 mask!3266))))

(assert (=> start!69062 e!445804))

(assert (=> start!69062 true))

(declare-fun array_inv!16776 (array!43684) Bool)

(assert (=> start!69062 (array_inv!16776 a!3170)))

(declare-fun b!804393 () Bool)

(declare-fun res!548364 () Bool)

(declare-fun e!445806 () Bool)

(assert (=> b!804393 (=> (not res!548364) (not e!445806))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804393 (= res!548364 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21337 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20917 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21337 a!3170)) (= (select (arr!20917 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804394 () Bool)

(declare-fun res!548371 () Bool)

(assert (=> b!804394 (=> (not res!548371) (not e!445806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43684 (_ BitVec 32)) Bool)

(assert (=> b!804394 (= res!548371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804395 () Bool)

(declare-fun res!548368 () Bool)

(assert (=> b!804395 (=> (not res!548368) (not e!445804))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804395 (= res!548368 (validKeyInArray!0 k0!2044))))

(declare-fun b!804396 () Bool)

(declare-fun res!548365 () Bool)

(assert (=> b!804396 (=> (not res!548365) (not e!445804))))

(assert (=> b!804396 (= res!548365 (validKeyInArray!0 (select (arr!20917 a!3170) j!153)))))

(declare-fun b!804397 () Bool)

(declare-fun res!548369 () Bool)

(assert (=> b!804397 (=> (not res!548369) (not e!445804))))

(declare-fun arrayContainsKey!0 (array!43684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804397 (= res!548369 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804398 () Bool)

(declare-fun e!445807 () Bool)

(assert (=> b!804398 (= e!445806 e!445807)))

(declare-fun res!548372 () Bool)

(assert (=> b!804398 (=> (not res!548372) (not e!445807))))

(declare-fun lt!360011 () array!43684)

(declare-fun lt!360005 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8464 0))(
  ( (MissingZero!8464 (index!36224 (_ BitVec 32))) (Found!8464 (index!36225 (_ BitVec 32))) (Intermediate!8464 (undefined!9276 Bool) (index!36226 (_ BitVec 32)) (x!67228 (_ BitVec 32))) (Undefined!8464) (MissingVacant!8464 (index!36227 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43684 (_ BitVec 32)) SeekEntryResult!8464)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43684 (_ BitVec 32)) SeekEntryResult!8464)

(assert (=> b!804398 (= res!548372 (= (seekEntryOrOpen!0 lt!360005 lt!360011 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360005 lt!360011 mask!3266)))))

(assert (=> b!804398 (= lt!360005 (select (store (arr!20917 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804398 (= lt!360011 (array!43685 (store (arr!20917 a!3170) i!1163 k0!2044) (size!21337 a!3170)))))

(declare-fun b!804399 () Bool)

(declare-fun res!548363 () Bool)

(assert (=> b!804399 (=> (not res!548363) (not e!445806))))

(declare-datatypes ((List!14787 0))(
  ( (Nil!14784) (Cons!14783 (h!15918 (_ BitVec 64)) (t!21094 List!14787)) )
))
(declare-fun arrayNoDuplicates!0 (array!43684 (_ BitVec 32) List!14787) Bool)

(assert (=> b!804399 (= res!548363 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14784))))

(declare-fun b!804400 () Bool)

(declare-fun e!445803 () Bool)

(assert (=> b!804400 (= e!445803 (not true))))

(declare-fun lt!360009 () (_ BitVec 32))

(assert (=> b!804400 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360009 vacantAfter!23 lt!360005 lt!360011 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360009 vacantBefore!23 (select (arr!20917 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27553 0))(
  ( (Unit!27554) )
))
(declare-fun lt!360006 () Unit!27553)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43684 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27553)

(assert (=> b!804400 (= lt!360006 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!360009 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804400 (= lt!360009 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!804401 () Bool)

(assert (=> b!804401 (= e!445804 e!445806)))

(declare-fun res!548366 () Bool)

(assert (=> b!804401 (=> (not res!548366) (not e!445806))))

(declare-fun lt!360008 () SeekEntryResult!8464)

(assert (=> b!804401 (= res!548366 (or (= lt!360008 (MissingZero!8464 i!1163)) (= lt!360008 (MissingVacant!8464 i!1163))))))

(assert (=> b!804401 (= lt!360008 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804402 () Bool)

(assert (=> b!804402 (= e!445807 e!445803)))

(declare-fun res!548373 () Bool)

(assert (=> b!804402 (=> (not res!548373) (not e!445803))))

(declare-fun lt!360007 () SeekEntryResult!8464)

(declare-fun lt!360010 () SeekEntryResult!8464)

(assert (=> b!804402 (= res!548373 (and (= lt!360007 lt!360010) (= lt!360010 (Found!8464 j!153)) (not (= (select (arr!20917 a!3170) index!1236) (select (arr!20917 a!3170) j!153)))))))

(assert (=> b!804402 (= lt!360010 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20917 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!804402 (= lt!360007 (seekEntryOrOpen!0 (select (arr!20917 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69062 res!548367) b!804392))

(assert (= (and b!804392 res!548370) b!804396))

(assert (= (and b!804396 res!548365) b!804395))

(assert (= (and b!804395 res!548368) b!804397))

(assert (= (and b!804397 res!548369) b!804401))

(assert (= (and b!804401 res!548366) b!804394))

(assert (= (and b!804394 res!548371) b!804399))

(assert (= (and b!804399 res!548363) b!804393))

(assert (= (and b!804393 res!548364) b!804398))

(assert (= (and b!804398 res!548372) b!804402))

(assert (= (and b!804402 res!548373) b!804400))

(declare-fun m!746503 () Bool)

(assert (=> b!804398 m!746503))

(declare-fun m!746505 () Bool)

(assert (=> b!804398 m!746505))

(declare-fun m!746507 () Bool)

(assert (=> b!804398 m!746507))

(declare-fun m!746509 () Bool)

(assert (=> b!804398 m!746509))

(declare-fun m!746511 () Bool)

(assert (=> b!804397 m!746511))

(declare-fun m!746513 () Bool)

(assert (=> start!69062 m!746513))

(declare-fun m!746515 () Bool)

(assert (=> start!69062 m!746515))

(declare-fun m!746517 () Bool)

(assert (=> b!804400 m!746517))

(declare-fun m!746519 () Bool)

(assert (=> b!804400 m!746519))

(declare-fun m!746521 () Bool)

(assert (=> b!804400 m!746521))

(assert (=> b!804400 m!746517))

(declare-fun m!746523 () Bool)

(assert (=> b!804400 m!746523))

(declare-fun m!746525 () Bool)

(assert (=> b!804400 m!746525))

(declare-fun m!746527 () Bool)

(assert (=> b!804395 m!746527))

(declare-fun m!746529 () Bool)

(assert (=> b!804401 m!746529))

(declare-fun m!746531 () Bool)

(assert (=> b!804393 m!746531))

(declare-fun m!746533 () Bool)

(assert (=> b!804393 m!746533))

(declare-fun m!746535 () Bool)

(assert (=> b!804402 m!746535))

(assert (=> b!804402 m!746517))

(assert (=> b!804402 m!746517))

(declare-fun m!746537 () Bool)

(assert (=> b!804402 m!746537))

(assert (=> b!804402 m!746517))

(declare-fun m!746539 () Bool)

(assert (=> b!804402 m!746539))

(assert (=> b!804396 m!746517))

(assert (=> b!804396 m!746517))

(declare-fun m!746541 () Bool)

(assert (=> b!804396 m!746541))

(declare-fun m!746543 () Bool)

(assert (=> b!804394 m!746543))

(declare-fun m!746545 () Bool)

(assert (=> b!804399 m!746545))

(check-sat (not start!69062) (not b!804401) (not b!804399) (not b!804395) (not b!804396) (not b!804402) (not b!804397) (not b!804394) (not b!804400) (not b!804398))
(check-sat)
