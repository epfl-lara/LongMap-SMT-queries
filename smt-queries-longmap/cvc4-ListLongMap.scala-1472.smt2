; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28222 () Bool)

(assert start!28222)

(declare-fun b!289022 () Bool)

(declare-fun e!182992 () Bool)

(declare-fun e!182989 () Bool)

(assert (=> b!289022 (= e!182992 e!182989)))

(declare-fun res!150651 () Bool)

(assert (=> b!289022 (=> (not res!150651) (not e!182989))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142519 () Bool)

(declare-datatypes ((SeekEntryResult!2044 0))(
  ( (MissingZero!2044 (index!10346 (_ BitVec 32))) (Found!2044 (index!10347 (_ BitVec 32))) (Intermediate!2044 (undefined!2856 Bool) (index!10348 (_ BitVec 32)) (x!28553 (_ BitVec 32))) (Undefined!2044) (MissingVacant!2044 (index!10349 (_ BitVec 32))) )
))
(declare-fun lt!142520 () SeekEntryResult!2044)

(assert (=> b!289022 (= res!150651 (or lt!142519 (= lt!142520 (MissingVacant!2044 i!1256))))))

(assert (=> b!289022 (= lt!142519 (= lt!142520 (MissingZero!2044 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((array!14536 0))(
  ( (array!14537 (arr!6895 (Array (_ BitVec 32) (_ BitVec 64))) (size!7247 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14536)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14536 (_ BitVec 32)) SeekEntryResult!2044)

(assert (=> b!289022 (= lt!142520 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289023 () Bool)

(declare-fun res!150648 () Bool)

(assert (=> b!289023 (=> (not res!150648) (not e!182992))))

(declare-fun arrayContainsKey!0 (array!14536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289023 (= res!150648 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289024 () Bool)

(declare-fun res!150646 () Bool)

(assert (=> b!289024 (=> (not res!150646) (not e!182992))))

(assert (=> b!289024 (= res!150646 (and (= (size!7247 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7247 a!3312))))))

(declare-fun b!289025 () Bool)

(declare-fun e!182990 () Bool)

(assert (=> b!289025 (= e!182990 (not true))))

(declare-fun lt!142521 () SeekEntryResult!2044)

(assert (=> b!289025 (and (= (select (arr!6895 a!3312) (index!10348 lt!142521)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10348 lt!142521) i!1256))))

(declare-fun b!289026 () Bool)

(declare-fun e!182993 () Bool)

(assert (=> b!289026 (= e!182993 e!182990)))

(declare-fun res!150647 () Bool)

(assert (=> b!289026 (=> (not res!150647) (not e!182990))))

(declare-fun lt!142522 () Bool)

(assert (=> b!289026 (= res!150647 (and (or lt!142522 (not (undefined!2856 lt!142521))) (or lt!142522 (not (= (select (arr!6895 a!3312) (index!10348 lt!142521)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142522 (not (= (select (arr!6895 a!3312) (index!10348 lt!142521)) k!2524))) (not lt!142522)))))

(assert (=> b!289026 (= lt!142522 (not (is-Intermediate!2044 lt!142521)))))

(declare-fun b!289027 () Bool)

(assert (=> b!289027 (= e!182989 e!182993)))

(declare-fun res!150650 () Bool)

(assert (=> b!289027 (=> (not res!150650) (not e!182993))))

(assert (=> b!289027 (= res!150650 lt!142519)))

(declare-fun lt!142517 () (_ BitVec 32))

(declare-fun lt!142518 () SeekEntryResult!2044)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14536 (_ BitVec 32)) SeekEntryResult!2044)

(assert (=> b!289027 (= lt!142518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142517 k!2524 (array!14537 (store (arr!6895 a!3312) i!1256 k!2524) (size!7247 a!3312)) mask!3809))))

(assert (=> b!289027 (= lt!142521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142517 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289027 (= lt!142517 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289028 () Bool)

(declare-fun res!150649 () Bool)

(assert (=> b!289028 (=> (not res!150649) (not e!182992))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289028 (= res!150649 (validKeyInArray!0 k!2524))))

(declare-fun b!289021 () Bool)

(declare-fun res!150645 () Bool)

(assert (=> b!289021 (=> (not res!150645) (not e!182989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14536 (_ BitVec 32)) Bool)

(assert (=> b!289021 (= res!150645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150644 () Bool)

(assert (=> start!28222 (=> (not res!150644) (not e!182992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28222 (= res!150644 (validMask!0 mask!3809))))

(assert (=> start!28222 e!182992))

(assert (=> start!28222 true))

(declare-fun array_inv!4858 (array!14536) Bool)

(assert (=> start!28222 (array_inv!4858 a!3312)))

(assert (= (and start!28222 res!150644) b!289024))

(assert (= (and b!289024 res!150646) b!289028))

(assert (= (and b!289028 res!150649) b!289023))

(assert (= (and b!289023 res!150648) b!289022))

(assert (= (and b!289022 res!150651) b!289021))

(assert (= (and b!289021 res!150645) b!289027))

(assert (= (and b!289027 res!150650) b!289026))

(assert (= (and b!289026 res!150647) b!289025))

(declare-fun m!303203 () Bool)

(assert (=> b!289025 m!303203))

(declare-fun m!303205 () Bool)

(assert (=> b!289023 m!303205))

(declare-fun m!303207 () Bool)

(assert (=> start!28222 m!303207))

(declare-fun m!303209 () Bool)

(assert (=> start!28222 m!303209))

(declare-fun m!303211 () Bool)

(assert (=> b!289027 m!303211))

(declare-fun m!303213 () Bool)

(assert (=> b!289027 m!303213))

(declare-fun m!303215 () Bool)

(assert (=> b!289027 m!303215))

(declare-fun m!303217 () Bool)

(assert (=> b!289027 m!303217))

(declare-fun m!303219 () Bool)

(assert (=> b!289028 m!303219))

(declare-fun m!303221 () Bool)

(assert (=> b!289021 m!303221))

(declare-fun m!303223 () Bool)

(assert (=> b!289022 m!303223))

(assert (=> b!289026 m!303203))

(push 1)

