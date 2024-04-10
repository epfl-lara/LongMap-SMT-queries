; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28438 () Bool)

(assert start!28438)

(declare-fun b!291217 () Bool)

(declare-fun res!152562 () Bool)

(declare-fun e!184275 () Bool)

(assert (=> b!291217 (=> (not res!152562) (not e!184275))))

(declare-datatypes ((array!14707 0))(
  ( (array!14708 (arr!6979 (Array (_ BitVec 32) (_ BitVec 64))) (size!7331 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14707)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291217 (= res!152562 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291218 () Bool)

(declare-fun e!184276 () Bool)

(declare-fun e!184274 () Bool)

(assert (=> b!291218 (= e!184276 e!184274)))

(declare-fun res!152559 () Bool)

(assert (=> b!291218 (=> (not res!152559) (not e!184274))))

(declare-datatypes ((SeekEntryResult!2128 0))(
  ( (MissingZero!2128 (index!10682 (_ BitVec 32))) (Found!2128 (index!10683 (_ BitVec 32))) (Intermediate!2128 (undefined!2940 Bool) (index!10684 (_ BitVec 32)) (x!28867 (_ BitVec 32))) (Undefined!2128) (MissingVacant!2128 (index!10685 (_ BitVec 32))) )
))
(declare-fun lt!144028 () SeekEntryResult!2128)

(declare-fun lt!144031 () Bool)

(assert (=> b!291218 (= res!152559 (and (or lt!144031 (not (undefined!2940 lt!144028))) (not lt!144031) (= (select (arr!6979 a!3312) (index!10684 lt!144028)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291218 (= lt!144031 (not (is-Intermediate!2128 lt!144028)))))

(declare-fun b!291219 () Bool)

(declare-fun res!152558 () Bool)

(declare-fun e!184277 () Bool)

(assert (=> b!291219 (=> (not res!152558) (not e!184277))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14707 (_ BitVec 32)) Bool)

(assert (=> b!291219 (= res!152558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291221 () Bool)

(assert (=> b!291221 (= e!184277 e!184276)))

(declare-fun res!152560 () Bool)

(assert (=> b!291221 (=> (not res!152560) (not e!184276))))

(declare-fun lt!144030 () SeekEntryResult!2128)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!144026 () Bool)

(assert (=> b!291221 (= res!152560 (and (not lt!144026) (= lt!144030 (MissingVacant!2128 i!1256))))))

(declare-fun lt!144029 () SeekEntryResult!2128)

(declare-fun lt!144027 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14707 (_ BitVec 32)) SeekEntryResult!2128)

(assert (=> b!291221 (= lt!144029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144027 k!2524 (array!14708 (store (arr!6979 a!3312) i!1256 k!2524) (size!7331 a!3312)) mask!3809))))

(assert (=> b!291221 (= lt!144028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144027 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291221 (= lt!144027 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!291222 () Bool)

(assert (=> b!291222 (= e!184274 (not (= lt!144028 (Intermediate!2128 false (index!10684 lt!144028) (x!28867 lt!144028)))))))

(assert (=> b!291222 (= (index!10684 lt!144028) i!1256)))

(declare-fun b!291223 () Bool)

(declare-fun res!152556 () Bool)

(assert (=> b!291223 (=> (not res!152556) (not e!184275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291223 (= res!152556 (validKeyInArray!0 k!2524))))

(declare-fun b!291224 () Bool)

(declare-fun res!152557 () Bool)

(assert (=> b!291224 (=> (not res!152557) (not e!184275))))

(assert (=> b!291224 (= res!152557 (and (= (size!7331 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7331 a!3312))))))

(declare-fun res!152555 () Bool)

(assert (=> start!28438 (=> (not res!152555) (not e!184275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28438 (= res!152555 (validMask!0 mask!3809))))

(assert (=> start!28438 e!184275))

(assert (=> start!28438 true))

(declare-fun array_inv!4942 (array!14707) Bool)

(assert (=> start!28438 (array_inv!4942 a!3312)))

(declare-fun b!291220 () Bool)

(assert (=> b!291220 (= e!184275 e!184277)))

(declare-fun res!152561 () Bool)

(assert (=> b!291220 (=> (not res!152561) (not e!184277))))

(assert (=> b!291220 (= res!152561 (or lt!144026 (= lt!144030 (MissingVacant!2128 i!1256))))))

(assert (=> b!291220 (= lt!144026 (= lt!144030 (MissingZero!2128 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14707 (_ BitVec 32)) SeekEntryResult!2128)

(assert (=> b!291220 (= lt!144030 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!28438 res!152555) b!291224))

(assert (= (and b!291224 res!152557) b!291223))

(assert (= (and b!291223 res!152556) b!291217))

(assert (= (and b!291217 res!152562) b!291220))

(assert (= (and b!291220 res!152561) b!291219))

(assert (= (and b!291219 res!152558) b!291221))

(assert (= (and b!291221 res!152560) b!291218))

(assert (= (and b!291218 res!152559) b!291222))

(declare-fun m!305171 () Bool)

(assert (=> b!291221 m!305171))

(declare-fun m!305173 () Bool)

(assert (=> b!291221 m!305173))

(declare-fun m!305175 () Bool)

(assert (=> b!291221 m!305175))

(declare-fun m!305177 () Bool)

(assert (=> b!291221 m!305177))

(declare-fun m!305179 () Bool)

(assert (=> b!291220 m!305179))

(declare-fun m!305181 () Bool)

(assert (=> b!291219 m!305181))

(declare-fun m!305183 () Bool)

(assert (=> b!291223 m!305183))

(declare-fun m!305185 () Bool)

(assert (=> b!291217 m!305185))

(declare-fun m!305187 () Bool)

(assert (=> start!28438 m!305187))

(declare-fun m!305189 () Bool)

(assert (=> start!28438 m!305189))

(declare-fun m!305191 () Bool)

(assert (=> b!291218 m!305191))

(push 1)

