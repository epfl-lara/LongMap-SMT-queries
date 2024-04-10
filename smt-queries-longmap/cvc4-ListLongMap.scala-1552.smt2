; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29390 () Bool)

(assert start!29390)

(declare-fun b!297556 () Bool)

(assert (=> b!297556 false))

(declare-datatypes ((Unit!9272 0))(
  ( (Unit!9273) )
))
(declare-fun e!188033 () Unit!9272)

(declare-fun Unit!9274 () Unit!9272)

(assert (=> b!297556 (= e!188033 Unit!9274)))

(declare-fun res!156914 () Bool)

(declare-fun e!188035 () Bool)

(assert (=> start!29390 (=> (not res!156914) (not e!188035))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29390 (= res!156914 (validMask!0 mask!3809))))

(assert (=> start!29390 e!188035))

(assert (=> start!29390 true))

(declare-datatypes ((array!15058 0))(
  ( (array!15059 (arr!7135 (Array (_ BitVec 32) (_ BitVec 64))) (size!7487 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15058)

(declare-fun array_inv!5098 (array!15058) Bool)

(assert (=> start!29390 (array_inv!5098 a!3312)))

(declare-fun b!297557 () Bool)

(declare-fun e!188036 () Bool)

(declare-datatypes ((SeekEntryResult!2284 0))(
  ( (MissingZero!2284 (index!11306 (_ BitVec 32))) (Found!2284 (index!11307 (_ BitVec 32))) (Intermediate!2284 (undefined!3096 Bool) (index!11308 (_ BitVec 32)) (x!29522 (_ BitVec 32))) (Undefined!2284) (MissingVacant!2284 (index!11309 (_ BitVec 32))) )
))
(declare-fun lt!147881 () SeekEntryResult!2284)

(declare-fun lt!147878 () SeekEntryResult!2284)

(assert (=> b!297557 (= e!188036 (not (= lt!147881 lt!147878)))))

(declare-fun lt!147877 () Unit!9272)

(declare-fun e!188034 () Unit!9272)

(assert (=> b!297557 (= lt!147877 e!188034)))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun c!47907 () Bool)

(assert (=> b!297557 (= c!47907 (or (and (is-Intermediate!2284 lt!147878) (undefined!3096 lt!147878)) (and (is-Intermediate!2284 lt!147878) (= (select (arr!7135 a!3312) (index!11308 lt!147878)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2284 lt!147878) (= (select (arr!7135 a!3312) (index!11308 lt!147878)) k!2524))))))

(declare-fun b!297558 () Bool)

(declare-fun Unit!9275 () Unit!9272)

(assert (=> b!297558 (= e!188034 Unit!9275)))

(assert (=> b!297558 false))

(declare-fun b!297559 () Bool)

(declare-fun res!156911 () Bool)

(assert (=> b!297559 (=> (not res!156911) (not e!188035))))

(declare-fun arrayContainsKey!0 (array!15058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297559 (= res!156911 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297560 () Bool)

(declare-fun res!156909 () Bool)

(assert (=> b!297560 (=> (not res!156909) (not e!188035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297560 (= res!156909 (validKeyInArray!0 k!2524))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun b!297561 () Bool)

(assert (=> b!297561 (and (= lt!147881 lt!147878) (= (select (store (arr!7135 a!3312) i!1256 k!2524) (index!11308 lt!147878)) k!2524))))

(declare-fun lt!147882 () (_ BitVec 32))

(declare-fun lt!147876 () Unit!9272)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15058 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9272)

(assert (=> b!297561 (= lt!147876 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147882 (index!11308 lt!147878) (x!29522 lt!147878) mask!3809))))

(assert (=> b!297561 (and (= (select (arr!7135 a!3312) (index!11308 lt!147878)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11308 lt!147878) i!1256))))

(declare-fun Unit!9276 () Unit!9272)

(assert (=> b!297561 (= e!188033 Unit!9276)))

(declare-fun b!297562 () Bool)

(declare-fun res!156910 () Bool)

(declare-fun e!188038 () Bool)

(assert (=> b!297562 (=> (not res!156910) (not e!188038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15058 (_ BitVec 32)) Bool)

(assert (=> b!297562 (= res!156910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297563 () Bool)

(assert (=> b!297563 (= e!188034 e!188033)))

(declare-fun c!47906 () Bool)

(assert (=> b!297563 (= c!47906 (is-Intermediate!2284 lt!147878))))

(declare-fun b!297564 () Bool)

(assert (=> b!297564 (= e!188035 e!188038)))

(declare-fun res!156915 () Bool)

(assert (=> b!297564 (=> (not res!156915) (not e!188038))))

(declare-fun lt!147880 () SeekEntryResult!2284)

(declare-fun lt!147879 () Bool)

(assert (=> b!297564 (= res!156915 (or lt!147879 (= lt!147880 (MissingVacant!2284 i!1256))))))

(assert (=> b!297564 (= lt!147879 (= lt!147880 (MissingZero!2284 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15058 (_ BitVec 32)) SeekEntryResult!2284)

(assert (=> b!297564 (= lt!147880 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297565 () Bool)

(declare-fun res!156913 () Bool)

(assert (=> b!297565 (=> (not res!156913) (not e!188035))))

(assert (=> b!297565 (= res!156913 (and (= (size!7487 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7487 a!3312))))))

(declare-fun b!297566 () Bool)

(assert (=> b!297566 (= e!188038 e!188036)))

(declare-fun res!156912 () Bool)

(assert (=> b!297566 (=> (not res!156912) (not e!188036))))

(assert (=> b!297566 (= res!156912 lt!147879)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15058 (_ BitVec 32)) SeekEntryResult!2284)

(assert (=> b!297566 (= lt!147881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147882 k!2524 (array!15059 (store (arr!7135 a!3312) i!1256 k!2524) (size!7487 a!3312)) mask!3809))))

(assert (=> b!297566 (= lt!147878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147882 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297566 (= lt!147882 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!29390 res!156914) b!297565))

(assert (= (and b!297565 res!156913) b!297560))

(assert (= (and b!297560 res!156909) b!297559))

(assert (= (and b!297559 res!156911) b!297564))

(assert (= (and b!297564 res!156915) b!297562))

(assert (= (and b!297562 res!156910) b!297566))

(assert (= (and b!297566 res!156912) b!297557))

(assert (= (and b!297557 c!47907) b!297558))

(assert (= (and b!297557 (not c!47907)) b!297563))

(assert (= (and b!297563 c!47906) b!297561))

(assert (= (and b!297563 (not c!47906)) b!297556))

(declare-fun m!310273 () Bool)

(assert (=> b!297557 m!310273))

(declare-fun m!310275 () Bool)

(assert (=> b!297560 m!310275))

(declare-fun m!310277 () Bool)

(assert (=> b!297559 m!310277))

(declare-fun m!310279 () Bool)

(assert (=> start!29390 m!310279))

(declare-fun m!310281 () Bool)

(assert (=> start!29390 m!310281))

(declare-fun m!310283 () Bool)

(assert (=> b!297562 m!310283))

(declare-fun m!310285 () Bool)

(assert (=> b!297564 m!310285))

(declare-fun m!310287 () Bool)

(assert (=> b!297566 m!310287))

(declare-fun m!310289 () Bool)

(assert (=> b!297566 m!310289))

(declare-fun m!310291 () Bool)

(assert (=> b!297566 m!310291))

(declare-fun m!310293 () Bool)

(assert (=> b!297566 m!310293))

(assert (=> b!297561 m!310287))

(declare-fun m!310295 () Bool)

(assert (=> b!297561 m!310295))

(declare-fun m!310297 () Bool)

(assert (=> b!297561 m!310297))

(assert (=> b!297561 m!310273))

(push 1)

