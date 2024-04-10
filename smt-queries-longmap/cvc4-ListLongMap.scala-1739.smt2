; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31944 () Bool)

(assert start!31944)

(declare-fun b!319289 () Bool)

(declare-fun res!173679 () Bool)

(declare-fun e!198321 () Bool)

(assert (=> b!319289 (=> (not res!173679) (not e!198321))))

(declare-datatypes ((array!16264 0))(
  ( (array!16265 (arr!7696 (Array (_ BitVec 32) (_ BitVec 64))) (size!8048 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16264)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16264 (_ BitVec 32)) Bool)

(assert (=> b!319289 (= res!173679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319290 () Bool)

(declare-fun e!198320 () Bool)

(declare-fun e!198318 () Bool)

(assert (=> b!319290 (= e!198320 (not e!198318))))

(declare-fun res!173682 () Bool)

(assert (=> b!319290 (=> res!173682 e!198318)))

(declare-datatypes ((SeekEntryResult!2836 0))(
  ( (MissingZero!2836 (index!13520 (_ BitVec 32))) (Found!2836 (index!13521 (_ BitVec 32))) (Intermediate!2836 (undefined!3648 Bool) (index!13522 (_ BitVec 32)) (x!31774 (_ BitVec 32))) (Undefined!2836) (MissingVacant!2836 (index!13523 (_ BitVec 32))) )
))
(declare-fun lt!155787 () SeekEntryResult!2836)

(declare-fun lt!155783 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!155782 () SeekEntryResult!2836)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!319290 (= res!173682 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155783 #b00000000000000000000000000000000) (bvsge lt!155783 (size!8048 a!3293)) (not (= lt!155787 lt!155782))))))

(declare-fun lt!155781 () SeekEntryResult!2836)

(declare-fun lt!155786 () SeekEntryResult!2836)

(assert (=> b!319290 (= lt!155781 lt!155786)))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun lt!155780 () array!16264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16264 (_ BitVec 32)) SeekEntryResult!2836)

(assert (=> b!319290 (= lt!155786 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155783 k!2441 lt!155780 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319290 (= lt!155781 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155780 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!319290 (= lt!155780 (array!16265 (store (arr!7696 a!3293) i!1240 k!2441) (size!8048 a!3293)))))

(declare-fun lt!155784 () SeekEntryResult!2836)

(assert (=> b!319290 (= lt!155784 lt!155787)))

(assert (=> b!319290 (= lt!155787 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155783 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319290 (= lt!155783 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!319291 () Bool)

(declare-fun res!173676 () Bool)

(assert (=> b!319291 (=> (not res!173676) (not e!198321))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16264 (_ BitVec 32)) SeekEntryResult!2836)

(assert (=> b!319291 (= res!173676 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2836 i!1240)))))

(declare-fun b!319292 () Bool)

(assert (=> b!319292 (= e!198318 (= lt!155781 lt!155784))))

(assert (=> b!319292 (= lt!155786 lt!155787)))

(declare-datatypes ((Unit!9810 0))(
  ( (Unit!9811) )
))
(declare-fun lt!155785 () Unit!9810)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16264 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9810)

(assert (=> b!319292 (= lt!155785 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155783 resIndex!52 resX!52 mask!3709))))

(declare-fun b!319293 () Bool)

(declare-fun res!173677 () Bool)

(declare-fun e!198319 () Bool)

(assert (=> b!319293 (=> (not res!173677) (not e!198319))))

(assert (=> b!319293 (= res!173677 (and (= (select (arr!7696 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8048 a!3293))))))

(declare-fun b!319294 () Bool)

(declare-fun res!173680 () Bool)

(assert (=> b!319294 (=> (not res!173680) (not e!198321))))

(declare-fun arrayContainsKey!0 (array!16264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319294 (= res!173680 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!319295 () Bool)

(assert (=> b!319295 (= e!198321 e!198319)))

(declare-fun res!173674 () Bool)

(assert (=> b!319295 (=> (not res!173674) (not e!198319))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319295 (= res!173674 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155782))))

(assert (=> b!319295 (= lt!155782 (Intermediate!2836 false resIndex!52 resX!52))))

(declare-fun b!319296 () Bool)

(declare-fun res!173675 () Bool)

(assert (=> b!319296 (=> (not res!173675) (not e!198321))))

(assert (=> b!319296 (= res!173675 (and (= (size!8048 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8048 a!3293))))))

(declare-fun res!173673 () Bool)

(assert (=> start!31944 (=> (not res!173673) (not e!198321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31944 (= res!173673 (validMask!0 mask!3709))))

(assert (=> start!31944 e!198321))

(declare-fun array_inv!5659 (array!16264) Bool)

(assert (=> start!31944 (array_inv!5659 a!3293)))

(assert (=> start!31944 true))

(declare-fun b!319297 () Bool)

(declare-fun res!173681 () Bool)

(assert (=> b!319297 (=> (not res!173681) (not e!198321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319297 (= res!173681 (validKeyInArray!0 k!2441))))

(declare-fun b!319298 () Bool)

(assert (=> b!319298 (= e!198319 e!198320)))

(declare-fun res!173678 () Bool)

(assert (=> b!319298 (=> (not res!173678) (not e!198320))))

(assert (=> b!319298 (= res!173678 (and (= lt!155784 lt!155782) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7696 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!319298 (= lt!155784 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31944 res!173673) b!319296))

(assert (= (and b!319296 res!173675) b!319297))

(assert (= (and b!319297 res!173681) b!319294))

(assert (= (and b!319294 res!173680) b!319291))

(assert (= (and b!319291 res!173676) b!319289))

(assert (= (and b!319289 res!173679) b!319295))

(assert (= (and b!319295 res!173674) b!319293))

(assert (= (and b!319293 res!173677) b!319298))

(assert (= (and b!319298 res!173678) b!319290))

(assert (= (and b!319290 (not res!173682)) b!319292))

(declare-fun m!327913 () Bool)

(assert (=> b!319293 m!327913))

(declare-fun m!327915 () Bool)

(assert (=> b!319289 m!327915))

(declare-fun m!327917 () Bool)

(assert (=> b!319290 m!327917))

(declare-fun m!327919 () Bool)

(assert (=> b!319290 m!327919))

(declare-fun m!327921 () Bool)

(assert (=> b!319290 m!327921))

(declare-fun m!327923 () Bool)

(assert (=> b!319290 m!327923))

(declare-fun m!327925 () Bool)

(assert (=> b!319290 m!327925))

(declare-fun m!327927 () Bool)

(assert (=> b!319295 m!327927))

(assert (=> b!319295 m!327927))

(declare-fun m!327929 () Bool)

(assert (=> b!319295 m!327929))

(declare-fun m!327931 () Bool)

(assert (=> b!319294 m!327931))

(declare-fun m!327933 () Bool)

(assert (=> b!319297 m!327933))

(declare-fun m!327935 () Bool)

(assert (=> b!319298 m!327935))

(declare-fun m!327937 () Bool)

(assert (=> b!319298 m!327937))

(declare-fun m!327939 () Bool)

(assert (=> start!31944 m!327939))

(declare-fun m!327941 () Bool)

(assert (=> start!31944 m!327941))

(declare-fun m!327943 () Bool)

(assert (=> b!319292 m!327943))

(declare-fun m!327945 () Bool)

(assert (=> b!319291 m!327945))

(push 1)

(assert (not b!319290))

(assert (not b!319292))

(assert (not b!319297))

(assert (not b!319294))

(assert (not b!319295))

(assert (not start!31944))

