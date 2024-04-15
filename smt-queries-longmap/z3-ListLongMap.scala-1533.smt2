; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29114 () Bool)

(assert start!29114)

(declare-fun b!295239 () Bool)

(declare-fun e!186605 () Bool)

(assert (=> b!295239 (= e!186605 (not true))))

(declare-datatypes ((array!14920 0))(
  ( (array!14921 (arr!7071 (Array (_ BitVec 32) (_ BitVec 64))) (size!7424 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14920)

(declare-datatypes ((SeekEntryResult!2219 0))(
  ( (MissingZero!2219 (index!11046 (_ BitVec 32))) (Found!2219 (index!11047 (_ BitVec 32))) (Intermediate!2219 (undefined!3031 Bool) (index!11048 (_ BitVec 32)) (x!29283 (_ BitVec 32))) (Undefined!2219) (MissingVacant!2219 (index!11049 (_ BitVec 32))) )
))
(declare-fun lt!146283 () SeekEntryResult!2219)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295239 (and (= (select (arr!7071 a!3312) (index!11048 lt!146283)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11048 lt!146283) i!1256))))

(declare-fun b!295240 () Bool)

(declare-fun res!155175 () Bool)

(declare-fun e!186606 () Bool)

(assert (=> b!295240 (=> (not res!155175) (not e!186606))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14920 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295240 (= res!155175 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295241 () Bool)

(declare-fun res!155176 () Bool)

(assert (=> b!295241 (=> (not res!155176) (not e!186606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295241 (= res!155176 (validKeyInArray!0 k0!2524))))

(declare-fun b!295242 () Bool)

(declare-fun e!186607 () Bool)

(assert (=> b!295242 (= e!186607 e!186605)))

(declare-fun res!155179 () Bool)

(assert (=> b!295242 (=> (not res!155179) (not e!186605))))

(declare-fun lt!146278 () Bool)

(assert (=> b!295242 (= res!155179 (and (or lt!146278 (not (undefined!3031 lt!146283))) (or lt!146278 (not (= (select (arr!7071 a!3312) (index!11048 lt!146283)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146278 (not (= (select (arr!7071 a!3312) (index!11048 lt!146283)) k0!2524))) (not lt!146278)))))

(get-info :version)

(assert (=> b!295242 (= lt!146278 (not ((_ is Intermediate!2219) lt!146283)))))

(declare-fun b!295243 () Bool)

(declare-fun e!186603 () Bool)

(assert (=> b!295243 (= e!186606 e!186603)))

(declare-fun res!155181 () Bool)

(assert (=> b!295243 (=> (not res!155181) (not e!186603))))

(declare-fun lt!146280 () SeekEntryResult!2219)

(declare-fun lt!146279 () Bool)

(assert (=> b!295243 (= res!155181 (or lt!146279 (= lt!146280 (MissingVacant!2219 i!1256))))))

(assert (=> b!295243 (= lt!146279 (= lt!146280 (MissingZero!2219 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14920 (_ BitVec 32)) SeekEntryResult!2219)

(assert (=> b!295243 (= lt!146280 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!155177 () Bool)

(assert (=> start!29114 (=> (not res!155177) (not e!186606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29114 (= res!155177 (validMask!0 mask!3809))))

(assert (=> start!29114 e!186606))

(assert (=> start!29114 true))

(declare-fun array_inv!5043 (array!14920) Bool)

(assert (=> start!29114 (array_inv!5043 a!3312)))

(declare-fun b!295244 () Bool)

(declare-fun res!155182 () Bool)

(assert (=> b!295244 (=> (not res!155182) (not e!186603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14920 (_ BitVec 32)) Bool)

(assert (=> b!295244 (= res!155182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295245 () Bool)

(assert (=> b!295245 (= e!186603 e!186607)))

(declare-fun res!155180 () Bool)

(assert (=> b!295245 (=> (not res!155180) (not e!186607))))

(assert (=> b!295245 (= res!155180 lt!146279)))

(declare-fun lt!146282 () (_ BitVec 32))

(declare-fun lt!146281 () SeekEntryResult!2219)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14920 (_ BitVec 32)) SeekEntryResult!2219)

(assert (=> b!295245 (= lt!146281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146282 k0!2524 (array!14921 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7424 a!3312)) mask!3809))))

(assert (=> b!295245 (= lt!146283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146282 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295245 (= lt!146282 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295246 () Bool)

(declare-fun res!155178 () Bool)

(assert (=> b!295246 (=> (not res!155178) (not e!186606))))

(assert (=> b!295246 (= res!155178 (and (= (size!7424 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7424 a!3312))))))

(assert (= (and start!29114 res!155177) b!295246))

(assert (= (and b!295246 res!155178) b!295241))

(assert (= (and b!295241 res!155176) b!295240))

(assert (= (and b!295240 res!155175) b!295243))

(assert (= (and b!295243 res!155181) b!295244))

(assert (= (and b!295244 res!155182) b!295245))

(assert (= (and b!295245 res!155180) b!295242))

(assert (= (and b!295242 res!155179) b!295239))

(declare-fun m!307893 () Bool)

(assert (=> b!295243 m!307893))

(declare-fun m!307895 () Bool)

(assert (=> b!295244 m!307895))

(declare-fun m!307897 () Bool)

(assert (=> b!295245 m!307897))

(declare-fun m!307899 () Bool)

(assert (=> b!295245 m!307899))

(declare-fun m!307901 () Bool)

(assert (=> b!295245 m!307901))

(declare-fun m!307903 () Bool)

(assert (=> b!295245 m!307903))

(declare-fun m!307905 () Bool)

(assert (=> b!295242 m!307905))

(declare-fun m!307907 () Bool)

(assert (=> b!295241 m!307907))

(assert (=> b!295239 m!307905))

(declare-fun m!307909 () Bool)

(assert (=> start!29114 m!307909))

(declare-fun m!307911 () Bool)

(assert (=> start!29114 m!307911))

(declare-fun m!307913 () Bool)

(assert (=> b!295240 m!307913))

(check-sat (not b!295244) (not b!295243) (not b!295241) (not b!295240) (not b!295245) (not start!29114))
(check-sat)
