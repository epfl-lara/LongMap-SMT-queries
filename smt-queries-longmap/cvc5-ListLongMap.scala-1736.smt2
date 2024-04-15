; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31912 () Bool)

(assert start!31912)

(declare-fun b!318744 () Bool)

(declare-fun e!198011 () Bool)

(declare-fun e!198008 () Bool)

(assert (=> b!318744 (= e!198011 e!198008)))

(declare-fun res!173275 () Bool)

(assert (=> b!318744 (=> (not res!173275) (not e!198008))))

(declare-datatypes ((array!16236 0))(
  ( (array!16237 (arr!7682 (Array (_ BitVec 32) (_ BitVec 64))) (size!8035 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16236)

(declare-datatypes ((SeekEntryResult!2821 0))(
  ( (MissingZero!2821 (index!13460 (_ BitVec 32))) (Found!2821 (index!13461 (_ BitVec 32))) (Intermediate!2821 (undefined!3633 Bool) (index!13462 (_ BitVec 32)) (x!31730 (_ BitVec 32))) (Undefined!2821) (MissingVacant!2821 (index!13463 (_ BitVec 32))) )
))
(declare-fun lt!155363 () SeekEntryResult!2821)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16236 (_ BitVec 32)) SeekEntryResult!2821)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318744 (= res!173275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155363))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318744 (= lt!155363 (Intermediate!2821 false resIndex!52 resX!52))))

(declare-fun b!318745 () Bool)

(declare-fun res!173276 () Bool)

(assert (=> b!318745 (=> (not res!173276) (not e!198011))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16236 (_ BitVec 32)) SeekEntryResult!2821)

(assert (=> b!318745 (= res!173276 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2821 i!1240)))))

(declare-fun b!318746 () Bool)

(declare-fun e!198007 () Bool)

(assert (=> b!318746 (= e!198008 e!198007)))

(declare-fun res!173278 () Bool)

(assert (=> b!318746 (=> (not res!173278) (not e!198007))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155362 () SeekEntryResult!2821)

(assert (=> b!318746 (= res!173278 (and (= lt!155362 lt!155363) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7682 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318746 (= lt!155362 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318747 () Bool)

(declare-fun res!173281 () Bool)

(assert (=> b!318747 (=> (not res!173281) (not e!198011))))

(declare-fun arrayContainsKey!0 (array!16236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318747 (= res!173281 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318748 () Bool)

(declare-fun res!173282 () Bool)

(assert (=> b!318748 (=> (not res!173282) (not e!198011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16236 (_ BitVec 32)) Bool)

(assert (=> b!318748 (= res!173282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318749 () Bool)

(declare-fun e!198010 () Bool)

(declare-fun lt!155359 () (_ BitVec 32))

(declare-fun lt!155361 () array!16236)

(assert (=> b!318749 (= e!198010 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155361 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155359 k!2441 lt!155361 mask!3709)))))

(assert (=> b!318749 (= lt!155361 (array!16237 (store (arr!7682 a!3293) i!1240 k!2441) (size!8035 a!3293)))))

(declare-fun res!173280 () Bool)

(assert (=> start!31912 (=> (not res!173280) (not e!198011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31912 (= res!173280 (validMask!0 mask!3709))))

(assert (=> start!31912 e!198011))

(declare-fun array_inv!5654 (array!16236) Bool)

(assert (=> start!31912 (array_inv!5654 a!3293)))

(assert (=> start!31912 true))

(declare-fun b!318750 () Bool)

(declare-fun lt!155360 () SeekEntryResult!2821)

(assert (=> b!318750 (= e!198007 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155359 #b00000000000000000000000000000000) (bvsge lt!155359 (size!8035 a!3293)) (= lt!155360 lt!155363))))))

(assert (=> b!318750 e!198010))

(declare-fun res!173277 () Bool)

(assert (=> b!318750 (=> (not res!173277) (not e!198010))))

(assert (=> b!318750 (= res!173277 (= lt!155362 lt!155360))))

(assert (=> b!318750 (= lt!155360 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155359 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318750 (= lt!155359 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318751 () Bool)

(declare-fun res!173283 () Bool)

(assert (=> b!318751 (=> (not res!173283) (not e!198011))))

(assert (=> b!318751 (= res!173283 (and (= (size!8035 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8035 a!3293))))))

(declare-fun b!318752 () Bool)

(declare-fun res!173279 () Bool)

(assert (=> b!318752 (=> (not res!173279) (not e!198011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318752 (= res!173279 (validKeyInArray!0 k!2441))))

(declare-fun b!318753 () Bool)

(declare-fun res!173274 () Bool)

(assert (=> b!318753 (=> (not res!173274) (not e!198008))))

(assert (=> b!318753 (= res!173274 (and (= (select (arr!7682 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8035 a!3293))))))

(assert (= (and start!31912 res!173280) b!318751))

(assert (= (and b!318751 res!173283) b!318752))

(assert (= (and b!318752 res!173279) b!318747))

(assert (= (and b!318747 res!173281) b!318745))

(assert (= (and b!318745 res!173276) b!318748))

(assert (= (and b!318748 res!173282) b!318744))

(assert (= (and b!318744 res!173275) b!318753))

(assert (= (and b!318753 res!173274) b!318746))

(assert (= (and b!318746 res!173278) b!318750))

(assert (= (and b!318750 res!173277) b!318749))

(declare-fun m!326885 () Bool)

(assert (=> b!318744 m!326885))

(assert (=> b!318744 m!326885))

(declare-fun m!326887 () Bool)

(assert (=> b!318744 m!326887))

(declare-fun m!326889 () Bool)

(assert (=> b!318746 m!326889))

(declare-fun m!326891 () Bool)

(assert (=> b!318746 m!326891))

(declare-fun m!326893 () Bool)

(assert (=> b!318748 m!326893))

(declare-fun m!326895 () Bool)

(assert (=> b!318753 m!326895))

(declare-fun m!326897 () Bool)

(assert (=> b!318750 m!326897))

(declare-fun m!326899 () Bool)

(assert (=> b!318750 m!326899))

(declare-fun m!326901 () Bool)

(assert (=> b!318747 m!326901))

(declare-fun m!326903 () Bool)

(assert (=> start!31912 m!326903))

(declare-fun m!326905 () Bool)

(assert (=> start!31912 m!326905))

(declare-fun m!326907 () Bool)

(assert (=> b!318749 m!326907))

(declare-fun m!326909 () Bool)

(assert (=> b!318749 m!326909))

(declare-fun m!326911 () Bool)

(assert (=> b!318749 m!326911))

(declare-fun m!326913 () Bool)

(assert (=> b!318752 m!326913))

(declare-fun m!326915 () Bool)

(assert (=> b!318745 m!326915))

(push 1)

(assert (not b!318749))

(assert (not b!318747))

(assert (not b!318744))

(assert (not b!318746))

(assert (not b!318748))

(assert (not start!31912))

(assert (not b!318750))

(assert (not b!318745))

(assert (not b!318752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

