; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67368 () Bool)

(assert start!67368)

(declare-fun b!779336 () Bool)

(declare-fun res!527318 () Bool)

(declare-fun e!433557 () Bool)

(assert (=> b!779336 (=> (not res!527318) (not e!433557))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42597 0))(
  ( (array!42598 (arr!20391 (Array (_ BitVec 32) (_ BitVec 64))) (size!20812 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42597)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779336 (= res!527318 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20812 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20812 a!3186))))))

(declare-datatypes ((SeekEntryResult!7991 0))(
  ( (MissingZero!7991 (index!34332 (_ BitVec 32))) (Found!7991 (index!34333 (_ BitVec 32))) (Intermediate!7991 (undefined!8803 Bool) (index!34334 (_ BitVec 32)) (x!65280 (_ BitVec 32))) (Undefined!7991) (MissingVacant!7991 (index!34335 (_ BitVec 32))) )
))
(declare-fun lt!347243 () SeekEntryResult!7991)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!433556 () Bool)

(declare-fun b!779337 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42597 (_ BitVec 32)) SeekEntryResult!7991)

(assert (=> b!779337 (= e!433556 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20391 a!3186) j!159) a!3186 mask!3328) lt!347243))))

(declare-fun b!779338 () Bool)

(declare-fun e!433559 () Bool)

(assert (=> b!779338 (= e!433559 e!433557)))

(declare-fun res!527305 () Bool)

(assert (=> b!779338 (=> (not res!527305) (not e!433557))))

(declare-fun lt!347249 () SeekEntryResult!7991)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779338 (= res!527305 (or (= lt!347249 (MissingZero!7991 i!1173)) (= lt!347249 (MissingVacant!7991 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42597 (_ BitVec 32)) SeekEntryResult!7991)

(assert (=> b!779338 (= lt!347249 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!779339 () Bool)

(declare-fun res!527314 () Bool)

(assert (=> b!779339 (=> (not res!527314) (not e!433559))))

(assert (=> b!779339 (= res!527314 (and (= (size!20812 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20812 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20812 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779340 () Bool)

(declare-fun res!527317 () Bool)

(assert (=> b!779340 (=> (not res!527317) (not e!433559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779340 (= res!527317 (validKeyInArray!0 (select (arr!20391 a!3186) j!159)))))

(declare-fun b!779341 () Bool)

(declare-fun res!527312 () Bool)

(assert (=> b!779341 (=> (not res!527312) (not e!433559))))

(declare-fun arrayContainsKey!0 (array!42597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779341 (= res!527312 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779342 () Bool)

(declare-fun res!527306 () Bool)

(declare-fun e!433558 () Bool)

(assert (=> b!779342 (=> (not res!527306) (not e!433558))))

(assert (=> b!779342 (= res!527306 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20391 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779343 () Bool)

(declare-fun lt!347241 () SeekEntryResult!7991)

(declare-fun e!433560 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42597 (_ BitVec 32)) SeekEntryResult!7991)

(assert (=> b!779343 (= e!433560 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20391 a!3186) j!159) a!3186 mask!3328) lt!347241))))

(declare-fun b!779344 () Bool)

(declare-fun res!527308 () Bool)

(assert (=> b!779344 (=> (not res!527308) (not e!433557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42597 (_ BitVec 32)) Bool)

(assert (=> b!779344 (= res!527308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779346 () Bool)

(declare-fun res!527316 () Bool)

(assert (=> b!779346 (=> (not res!527316) (not e!433559))))

(assert (=> b!779346 (= res!527316 (validKeyInArray!0 k!2102))))

(declare-fun lt!347246 () SeekEntryResult!7991)

(declare-fun b!779347 () Bool)

(declare-fun lt!347248 () SeekEntryResult!7991)

(declare-fun e!433555 () Bool)

(declare-fun lt!347240 () (_ BitVec 64))

(assert (=> b!779347 (= e!433555 (or (not (= lt!347246 lt!347243)) (= (select (store (arr!20391 a!3186) i!1173 k!2102) index!1321) lt!347240) (not (= (select (store (arr!20391 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!347248 lt!347246)))))

(assert (=> b!779347 (= lt!347246 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20391 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779348 () Bool)

(declare-fun e!433561 () Bool)

(assert (=> b!779348 (= e!433558 e!433561)))

(declare-fun res!527304 () Bool)

(assert (=> b!779348 (=> (not res!527304) (not e!433561))))

(declare-fun lt!347245 () SeekEntryResult!7991)

(declare-fun lt!347247 () SeekEntryResult!7991)

(assert (=> b!779348 (= res!527304 (= lt!347245 lt!347247))))

(declare-fun lt!347244 () array!42597)

(assert (=> b!779348 (= lt!347247 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347240 lt!347244 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779348 (= lt!347245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347240 mask!3328) lt!347240 lt!347244 mask!3328))))

(assert (=> b!779348 (= lt!347240 (select (store (arr!20391 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779348 (= lt!347244 (array!42598 (store (arr!20391 a!3186) i!1173 k!2102) (size!20812 a!3186)))))

(declare-fun b!779349 () Bool)

(declare-fun res!527307 () Bool)

(assert (=> b!779349 (=> (not res!527307) (not e!433557))))

(declare-datatypes ((List!14393 0))(
  ( (Nil!14390) (Cons!14389 (h!15503 (_ BitVec 64)) (t!20708 List!14393)) )
))
(declare-fun arrayNoDuplicates!0 (array!42597 (_ BitVec 32) List!14393) Bool)

(assert (=> b!779349 (= res!527307 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14390))))

(declare-fun b!779350 () Bool)

(assert (=> b!779350 (= e!433561 (not e!433555))))

(declare-fun res!527311 () Bool)

(assert (=> b!779350 (=> res!527311 e!433555)))

(assert (=> b!779350 (= res!527311 (or (not (is-Intermediate!7991 lt!347247)) (bvslt x!1131 (x!65280 lt!347247)) (not (= x!1131 (x!65280 lt!347247))) (not (= index!1321 (index!34334 lt!347247)))))))

(assert (=> b!779350 e!433556))

(declare-fun res!527315 () Bool)

(assert (=> b!779350 (=> (not res!527315) (not e!433556))))

(assert (=> b!779350 (= res!527315 (= lt!347248 lt!347243))))

(assert (=> b!779350 (= lt!347243 (Found!7991 j!159))))

(assert (=> b!779350 (= lt!347248 (seekEntryOrOpen!0 (select (arr!20391 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!779350 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26876 0))(
  ( (Unit!26877) )
))
(declare-fun lt!347242 () Unit!26876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26876)

(assert (=> b!779350 (= lt!347242 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779351 () Bool)

(assert (=> b!779351 (= e!433560 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20391 a!3186) j!159) a!3186 mask!3328) (Found!7991 j!159)))))

(declare-fun b!779352 () Bool)

(declare-fun res!527313 () Bool)

(assert (=> b!779352 (=> (not res!527313) (not e!433558))))

(assert (=> b!779352 (= res!527313 e!433560)))

(declare-fun c!86419 () Bool)

(assert (=> b!779352 (= c!86419 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!527310 () Bool)

(assert (=> start!67368 (=> (not res!527310) (not e!433559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67368 (= res!527310 (validMask!0 mask!3328))))

(assert (=> start!67368 e!433559))

(assert (=> start!67368 true))

(declare-fun array_inv!16187 (array!42597) Bool)

(assert (=> start!67368 (array_inv!16187 a!3186)))

(declare-fun b!779345 () Bool)

(assert (=> b!779345 (= e!433557 e!433558)))

(declare-fun res!527309 () Bool)

(assert (=> b!779345 (=> (not res!527309) (not e!433558))))

(assert (=> b!779345 (= res!527309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20391 a!3186) j!159) mask!3328) (select (arr!20391 a!3186) j!159) a!3186 mask!3328) lt!347241))))

(assert (=> b!779345 (= lt!347241 (Intermediate!7991 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67368 res!527310) b!779339))

(assert (= (and b!779339 res!527314) b!779340))

(assert (= (and b!779340 res!527317) b!779346))

(assert (= (and b!779346 res!527316) b!779341))

(assert (= (and b!779341 res!527312) b!779338))

(assert (= (and b!779338 res!527305) b!779344))

(assert (= (and b!779344 res!527308) b!779349))

(assert (= (and b!779349 res!527307) b!779336))

(assert (= (and b!779336 res!527318) b!779345))

(assert (= (and b!779345 res!527309) b!779342))

(assert (= (and b!779342 res!527306) b!779352))

(assert (= (and b!779352 c!86419) b!779343))

(assert (= (and b!779352 (not c!86419)) b!779351))

(assert (= (and b!779352 res!527313) b!779348))

(assert (= (and b!779348 res!527304) b!779350))

(assert (= (and b!779350 res!527315) b!779337))

(assert (= (and b!779350 (not res!527311)) b!779347))

(declare-fun m!722855 () Bool)

(assert (=> b!779338 m!722855))

(declare-fun m!722857 () Bool)

(assert (=> b!779337 m!722857))

(assert (=> b!779337 m!722857))

(declare-fun m!722859 () Bool)

(assert (=> b!779337 m!722859))

(assert (=> b!779351 m!722857))

(assert (=> b!779351 m!722857))

(declare-fun m!722861 () Bool)

(assert (=> b!779351 m!722861))

(declare-fun m!722863 () Bool)

(assert (=> b!779349 m!722863))

(declare-fun m!722865 () Bool)

(assert (=> b!779346 m!722865))

(declare-fun m!722867 () Bool)

(assert (=> b!779347 m!722867))

(declare-fun m!722869 () Bool)

(assert (=> b!779347 m!722869))

(assert (=> b!779347 m!722857))

(assert (=> b!779347 m!722857))

(assert (=> b!779347 m!722861))

(declare-fun m!722871 () Bool)

(assert (=> b!779348 m!722871))

(declare-fun m!722873 () Bool)

(assert (=> b!779348 m!722873))

(assert (=> b!779348 m!722867))

(declare-fun m!722875 () Bool)

(assert (=> b!779348 m!722875))

(assert (=> b!779348 m!722873))

(declare-fun m!722877 () Bool)

(assert (=> b!779348 m!722877))

(declare-fun m!722879 () Bool)

(assert (=> start!67368 m!722879))

(declare-fun m!722881 () Bool)

(assert (=> start!67368 m!722881))

(assert (=> b!779345 m!722857))

(assert (=> b!779345 m!722857))

(declare-fun m!722883 () Bool)

(assert (=> b!779345 m!722883))

(assert (=> b!779345 m!722883))

(assert (=> b!779345 m!722857))

(declare-fun m!722885 () Bool)

(assert (=> b!779345 m!722885))

(assert (=> b!779350 m!722857))

(assert (=> b!779350 m!722857))

(declare-fun m!722887 () Bool)

(assert (=> b!779350 m!722887))

(declare-fun m!722889 () Bool)

(assert (=> b!779350 m!722889))

(declare-fun m!722891 () Bool)

(assert (=> b!779350 m!722891))

(assert (=> b!779343 m!722857))

(assert (=> b!779343 m!722857))

(declare-fun m!722893 () Bool)

(assert (=> b!779343 m!722893))

(declare-fun m!722895 () Bool)

(assert (=> b!779342 m!722895))

(declare-fun m!722897 () Bool)

(assert (=> b!779341 m!722897))

(assert (=> b!779340 m!722857))

(assert (=> b!779340 m!722857))

(declare-fun m!722899 () Bool)

(assert (=> b!779340 m!722899))

(declare-fun m!722901 () Bool)

(assert (=> b!779344 m!722901))

(push 1)

