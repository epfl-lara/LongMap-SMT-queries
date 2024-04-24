; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32348 () Bool)

(assert start!32348)

(declare-fun b!322240 () Bool)

(declare-fun res!176259 () Bool)

(declare-fun e!199471 () Bool)

(assert (=> b!322240 (=> (not res!176259) (not e!199471))))

(declare-datatypes ((array!16500 0))(
  ( (array!16501 (arr!7807 (Array (_ BitVec 32) (_ BitVec 64))) (size!8159 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16500)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322240 (= res!176259 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322241 () Bool)

(declare-fun res!176262 () Bool)

(assert (=> b!322241 (=> (not res!176262) (not e!199471))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2903 0))(
  ( (MissingZero!2903 (index!13788 (_ BitVec 32))) (Found!2903 (index!13789 (_ BitVec 32))) (Intermediate!2903 (undefined!3715 Bool) (index!13790 (_ BitVec 32)) (x!32160 (_ BitVec 32))) (Undefined!2903) (MissingVacant!2903 (index!13791 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16500 (_ BitVec 32)) SeekEntryResult!2903)

(assert (=> b!322241 (= res!176262 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2903 i!1250)))))

(declare-fun b!322242 () Bool)

(assert (=> b!322242 false))

(declare-datatypes ((Unit!9798 0))(
  ( (Unit!9799) )
))
(declare-fun e!199470 () Unit!9798)

(declare-fun Unit!9800 () Unit!9798)

(assert (=> b!322242 (= e!199470 Unit!9800)))

(declare-fun b!322243 () Bool)

(declare-fun e!199472 () Bool)

(assert (=> b!322243 (= e!199472 (not true))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322243 (= index!1840 resIndex!58)))

(declare-fun lt!156439 () Unit!9798)

(declare-fun e!199468 () Unit!9798)

(assert (=> b!322243 (= lt!156439 e!199468)))

(declare-fun c!50621 () Bool)

(assert (=> b!322243 (= c!50621 (not (= resIndex!58 index!1840)))))

(declare-fun b!322244 () Bool)

(declare-fun res!176260 () Bool)

(assert (=> b!322244 (=> (not res!176260) (not e!199472))))

(declare-fun lt!156441 () SeekEntryResult!2903)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16500 (_ BitVec 32)) SeekEntryResult!2903)

(assert (=> b!322244 (= res!176260 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156441))))

(declare-fun b!322245 () Bool)

(assert (=> b!322245 (= e!199468 e!199470)))

(declare-fun c!50619 () Bool)

(assert (=> b!322245 (= c!50619 (or (= (select (arr!7807 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7807 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322246 () Bool)

(declare-fun res!176261 () Bool)

(assert (=> b!322246 (=> (not res!176261) (not e!199471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322246 (= res!176261 (validKeyInArray!0 k0!2497))))

(declare-fun b!322247 () Bool)

(assert (=> b!322247 false))

(declare-fun lt!156440 () Unit!9798)

(declare-fun e!199469 () Unit!9798)

(assert (=> b!322247 (= lt!156440 e!199469)))

(declare-fun c!50620 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322247 (= c!50620 ((_ is Intermediate!2903) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9801 () Unit!9798)

(assert (=> b!322247 (= e!199470 Unit!9801)))

(declare-fun b!322248 () Bool)

(declare-fun res!176263 () Bool)

(assert (=> b!322248 (=> (not res!176263) (not e!199472))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322248 (= res!176263 (and (= (select (arr!7807 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8159 a!3305))))))

(declare-fun b!322249 () Bool)

(declare-fun Unit!9802 () Unit!9798)

(assert (=> b!322249 (= e!199469 Unit!9802)))

(assert (=> b!322249 false))

(declare-fun res!176258 () Bool)

(assert (=> start!32348 (=> (not res!176258) (not e!199471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32348 (= res!176258 (validMask!0 mask!3777))))

(assert (=> start!32348 e!199471))

(declare-fun array_inv!5757 (array!16500) Bool)

(assert (=> start!32348 (array_inv!5757 a!3305)))

(assert (=> start!32348 true))

(declare-fun b!322239 () Bool)

(declare-fun res!176265 () Bool)

(assert (=> b!322239 (=> (not res!176265) (not e!199471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16500 (_ BitVec 32)) Bool)

(assert (=> b!322239 (= res!176265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322250 () Bool)

(declare-fun res!176256 () Bool)

(assert (=> b!322250 (=> (not res!176256) (not e!199471))))

(assert (=> b!322250 (= res!176256 (and (= (size!8159 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8159 a!3305))))))

(declare-fun b!322251 () Bool)

(declare-fun res!176257 () Bool)

(assert (=> b!322251 (=> (not res!176257) (not e!199472))))

(assert (=> b!322251 (= res!176257 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7807 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322252 () Bool)

(declare-fun Unit!9803 () Unit!9798)

(assert (=> b!322252 (= e!199468 Unit!9803)))

(declare-fun b!322253 () Bool)

(declare-fun Unit!9804 () Unit!9798)

(assert (=> b!322253 (= e!199469 Unit!9804)))

(declare-fun b!322254 () Bool)

(assert (=> b!322254 (= e!199471 e!199472)))

(declare-fun res!176264 () Bool)

(assert (=> b!322254 (=> (not res!176264) (not e!199472))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322254 (= res!176264 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156441))))

(assert (=> b!322254 (= lt!156441 (Intermediate!2903 false resIndex!58 resX!58))))

(assert (= (and start!32348 res!176258) b!322250))

(assert (= (and b!322250 res!176256) b!322246))

(assert (= (and b!322246 res!176261) b!322240))

(assert (= (and b!322240 res!176259) b!322241))

(assert (= (and b!322241 res!176262) b!322239))

(assert (= (and b!322239 res!176265) b!322254))

(assert (= (and b!322254 res!176264) b!322248))

(assert (= (and b!322248 res!176263) b!322244))

(assert (= (and b!322244 res!176260) b!322251))

(assert (= (and b!322251 res!176257) b!322243))

(assert (= (and b!322243 c!50621) b!322245))

(assert (= (and b!322243 (not c!50621)) b!322252))

(assert (= (and b!322245 c!50619) b!322242))

(assert (= (and b!322245 (not c!50619)) b!322247))

(assert (= (and b!322247 c!50620) b!322253))

(assert (= (and b!322247 (not c!50620)) b!322249))

(declare-fun m!330379 () Bool)

(assert (=> b!322246 m!330379))

(declare-fun m!330381 () Bool)

(assert (=> start!32348 m!330381))

(declare-fun m!330383 () Bool)

(assert (=> start!32348 m!330383))

(declare-fun m!330385 () Bool)

(assert (=> b!322248 m!330385))

(declare-fun m!330387 () Bool)

(assert (=> b!322240 m!330387))

(declare-fun m!330389 () Bool)

(assert (=> b!322244 m!330389))

(declare-fun m!330391 () Bool)

(assert (=> b!322254 m!330391))

(assert (=> b!322254 m!330391))

(declare-fun m!330393 () Bool)

(assert (=> b!322254 m!330393))

(declare-fun m!330395 () Bool)

(assert (=> b!322247 m!330395))

(assert (=> b!322247 m!330395))

(declare-fun m!330397 () Bool)

(assert (=> b!322247 m!330397))

(declare-fun m!330399 () Bool)

(assert (=> b!322241 m!330399))

(declare-fun m!330401 () Bool)

(assert (=> b!322239 m!330401))

(declare-fun m!330403 () Bool)

(assert (=> b!322251 m!330403))

(assert (=> b!322245 m!330403))

(check-sat (not b!322244) (not start!32348) (not b!322247) (not b!322254) (not b!322239) (not b!322241) (not b!322246) (not b!322240))
(check-sat)
