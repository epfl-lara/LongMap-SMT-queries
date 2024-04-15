; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32360 () Bool)

(assert start!32360)

(declare-fun b!322306 () Bool)

(declare-datatypes ((Unit!9842 0))(
  ( (Unit!9843) )
))
(declare-fun e!199436 () Unit!9842)

(declare-fun Unit!9844 () Unit!9842)

(assert (=> b!322306 (= e!199436 Unit!9844)))

(assert (=> b!322306 false))

(declare-fun b!322307 () Bool)

(declare-fun res!176315 () Bool)

(declare-fun e!199434 () Bool)

(assert (=> b!322307 (=> (not res!176315) (not e!199434))))

(declare-datatypes ((array!16503 0))(
  ( (array!16504 (arr!7809 (Array (_ BitVec 32) (_ BitVec 64))) (size!8162 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16503)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!322307 (= res!176315 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7809 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322308 () Bool)

(assert (=> b!322308 (= e!199434 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322308 (= index!1840 resIndex!58)))

(declare-fun lt!156242 () Unit!9842)

(declare-fun e!199438 () Unit!9842)

(assert (=> b!322308 (= lt!156242 e!199438)))

(declare-fun c!50625 () Bool)

(assert (=> b!322308 (= c!50625 (not (= resIndex!58 index!1840)))))

(declare-fun b!322309 () Bool)

(declare-fun e!199439 () Bool)

(assert (=> b!322309 (= e!199439 e!199434)))

(declare-fun res!176312 () Bool)

(assert (=> b!322309 (=> (not res!176312) (not e!199434))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2939 0))(
  ( (MissingZero!2939 (index!13932 (_ BitVec 32))) (Found!2939 (index!13933 (_ BitVec 32))) (Intermediate!2939 (undefined!3751 Bool) (index!13934 (_ BitVec 32)) (x!32210 (_ BitVec 32))) (Undefined!2939) (MissingVacant!2939 (index!13935 (_ BitVec 32))) )
))
(declare-fun lt!156241 () SeekEntryResult!2939)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16503 (_ BitVec 32)) SeekEntryResult!2939)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322309 (= res!176312 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156241))))

(assert (=> b!322309 (= lt!156241 (Intermediate!2939 false resIndex!58 resX!58))))

(declare-fun b!322310 () Bool)

(declare-fun res!176319 () Bool)

(assert (=> b!322310 (=> (not res!176319) (not e!199439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16503 (_ BitVec 32)) Bool)

(assert (=> b!322310 (= res!176319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322311 () Bool)

(assert (=> b!322311 false))

(declare-fun lt!156240 () Unit!9842)

(assert (=> b!322311 (= lt!156240 e!199436)))

(declare-fun c!50626 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322311 (= c!50626 ((_ is Intermediate!2939) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!199437 () Unit!9842)

(declare-fun Unit!9845 () Unit!9842)

(assert (=> b!322311 (= e!199437 Unit!9845)))

(declare-fun b!322305 () Bool)

(declare-fun Unit!9846 () Unit!9842)

(assert (=> b!322305 (= e!199438 Unit!9846)))

(declare-fun res!176318 () Bool)

(assert (=> start!32360 (=> (not res!176318) (not e!199439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32360 (= res!176318 (validMask!0 mask!3777))))

(assert (=> start!32360 e!199439))

(declare-fun array_inv!5781 (array!16503) Bool)

(assert (=> start!32360 (array_inv!5781 a!3305)))

(assert (=> start!32360 true))

(declare-fun b!322312 () Bool)

(declare-fun res!176314 () Bool)

(assert (=> b!322312 (=> (not res!176314) (not e!199439))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16503 (_ BitVec 32)) SeekEntryResult!2939)

(assert (=> b!322312 (= res!176314 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2939 i!1250)))))

(declare-fun b!322313 () Bool)

(declare-fun res!176316 () Bool)

(assert (=> b!322313 (=> (not res!176316) (not e!199434))))

(assert (=> b!322313 (= res!176316 (and (= (select (arr!7809 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8162 a!3305))))))

(declare-fun b!322314 () Bool)

(declare-fun res!176310 () Bool)

(assert (=> b!322314 (=> (not res!176310) (not e!199439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322314 (= res!176310 (validKeyInArray!0 k0!2497))))

(declare-fun b!322315 () Bool)

(declare-fun res!176311 () Bool)

(assert (=> b!322315 (=> (not res!176311) (not e!199439))))

(declare-fun arrayContainsKey!0 (array!16503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322315 (= res!176311 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322316 () Bool)

(assert (=> b!322316 (= e!199438 e!199437)))

(declare-fun c!50627 () Bool)

(assert (=> b!322316 (= c!50627 (or (= (select (arr!7809 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7809 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322317 () Bool)

(assert (=> b!322317 false))

(declare-fun Unit!9847 () Unit!9842)

(assert (=> b!322317 (= e!199437 Unit!9847)))

(declare-fun b!322318 () Bool)

(declare-fun Unit!9848 () Unit!9842)

(assert (=> b!322318 (= e!199436 Unit!9848)))

(declare-fun b!322319 () Bool)

(declare-fun res!176317 () Bool)

(assert (=> b!322319 (=> (not res!176317) (not e!199439))))

(assert (=> b!322319 (= res!176317 (and (= (size!8162 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8162 a!3305))))))

(declare-fun b!322320 () Bool)

(declare-fun res!176313 () Bool)

(assert (=> b!322320 (=> (not res!176313) (not e!199434))))

(assert (=> b!322320 (= res!176313 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156241))))

(assert (= (and start!32360 res!176318) b!322319))

(assert (= (and b!322319 res!176317) b!322314))

(assert (= (and b!322314 res!176310) b!322315))

(assert (= (and b!322315 res!176311) b!322312))

(assert (= (and b!322312 res!176314) b!322310))

(assert (= (and b!322310 res!176319) b!322309))

(assert (= (and b!322309 res!176312) b!322313))

(assert (= (and b!322313 res!176316) b!322320))

(assert (= (and b!322320 res!176313) b!322307))

(assert (= (and b!322307 res!176315) b!322308))

(assert (= (and b!322308 c!50625) b!322316))

(assert (= (and b!322308 (not c!50625)) b!322305))

(assert (= (and b!322316 c!50627) b!322317))

(assert (= (and b!322316 (not c!50627)) b!322311))

(assert (= (and b!322311 c!50626) b!322318))

(assert (= (and b!322311 (not c!50626)) b!322306))

(declare-fun m!329623 () Bool)

(assert (=> b!322320 m!329623))

(declare-fun m!329625 () Bool)

(assert (=> b!322309 m!329625))

(assert (=> b!322309 m!329625))

(declare-fun m!329627 () Bool)

(assert (=> b!322309 m!329627))

(declare-fun m!329629 () Bool)

(assert (=> b!322316 m!329629))

(declare-fun m!329631 () Bool)

(assert (=> start!32360 m!329631))

(declare-fun m!329633 () Bool)

(assert (=> start!32360 m!329633))

(declare-fun m!329635 () Bool)

(assert (=> b!322315 m!329635))

(declare-fun m!329637 () Bool)

(assert (=> b!322310 m!329637))

(declare-fun m!329639 () Bool)

(assert (=> b!322313 m!329639))

(declare-fun m!329641 () Bool)

(assert (=> b!322311 m!329641))

(assert (=> b!322311 m!329641))

(declare-fun m!329643 () Bool)

(assert (=> b!322311 m!329643))

(declare-fun m!329645 () Bool)

(assert (=> b!322312 m!329645))

(assert (=> b!322307 m!329629))

(declare-fun m!329647 () Bool)

(assert (=> b!322314 m!329647))

(check-sat (not b!322311) (not b!322312) (not b!322320) (not b!322314) (not b!322310) (not start!32360) (not b!322309) (not b!322315))
(check-sat)
