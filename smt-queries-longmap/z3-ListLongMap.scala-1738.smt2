; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31920 () Bool)

(assert start!31920)

(declare-fun b!319086 () Bool)

(declare-fun res!173524 () Bool)

(declare-fun e!198210 () Bool)

(assert (=> b!319086 (=> (not res!173524) (not e!198210))))

(declare-datatypes ((array!16253 0))(
  ( (array!16254 (arr!7690 (Array (_ BitVec 32) (_ BitVec 64))) (size!8042 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16253)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319086 (= res!173524 (and (= (select (arr!7690 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8042 a!3293))))))

(declare-fun b!319087 () Bool)

(declare-fun e!198213 () Bool)

(assert (=> b!319087 (= e!198213 true)))

(declare-datatypes ((SeekEntryResult!2795 0))(
  ( (MissingZero!2795 (index!13356 (_ BitVec 32))) (Found!2795 (index!13357 (_ BitVec 32))) (Intermediate!2795 (undefined!3607 Bool) (index!13358 (_ BitVec 32)) (x!31722 (_ BitVec 32))) (Undefined!2795) (MissingVacant!2795 (index!13359 (_ BitVec 32))) )
))
(declare-fun lt!155679 () SeekEntryResult!2795)

(declare-fun lt!155683 () SeekEntryResult!2795)

(assert (=> b!319087 (= lt!155679 lt!155683)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((Unit!9762 0))(
  ( (Unit!9763) )
))
(declare-fun lt!155678 () Unit!9762)

(declare-fun lt!155684 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16253 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9762)

(assert (=> b!319087 (= lt!155678 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155684 resIndex!52 resX!52 mask!3709))))

(declare-fun res!173525 () Bool)

(declare-fun e!198212 () Bool)

(assert (=> start!31920 (=> (not res!173525) (not e!198212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31920 (= res!173525 (validMask!0 mask!3709))))

(assert (=> start!31920 e!198212))

(declare-fun array_inv!5640 (array!16253) Bool)

(assert (=> start!31920 (array_inv!5640 a!3293)))

(assert (=> start!31920 true))

(declare-fun b!319088 () Bool)

(declare-fun res!173528 () Bool)

(assert (=> b!319088 (=> (not res!173528) (not e!198212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16253 (_ BitVec 32)) Bool)

(assert (=> b!319088 (= res!173528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319089 () Bool)

(declare-fun res!173522 () Bool)

(assert (=> b!319089 (=> (not res!173522) (not e!198212))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16253 (_ BitVec 32)) SeekEntryResult!2795)

(assert (=> b!319089 (= res!173522 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2795 i!1240)))))

(declare-fun b!319090 () Bool)

(assert (=> b!319090 (= e!198212 e!198210)))

(declare-fun res!173521 () Bool)

(assert (=> b!319090 (=> (not res!173521) (not e!198210))))

(declare-fun lt!155680 () SeekEntryResult!2795)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16253 (_ BitVec 32)) SeekEntryResult!2795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319090 (= res!173521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155680))))

(assert (=> b!319090 (= lt!155680 (Intermediate!2795 false resIndex!52 resX!52))))

(declare-fun b!319091 () Bool)

(declare-fun e!198211 () Bool)

(assert (=> b!319091 (= e!198210 e!198211)))

(declare-fun res!173520 () Bool)

(assert (=> b!319091 (=> (not res!173520) (not e!198211))))

(declare-fun lt!155685 () SeekEntryResult!2795)

(assert (=> b!319091 (= res!173520 (and (= lt!155685 lt!155680) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7690 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!319091 (= lt!155685 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!319092 () Bool)

(declare-fun res!173526 () Bool)

(assert (=> b!319092 (=> (not res!173526) (not e!198212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319092 (= res!173526 (validKeyInArray!0 k0!2441))))

(declare-fun b!319093 () Bool)

(declare-fun res!173523 () Bool)

(assert (=> b!319093 (=> (not res!173523) (not e!198212))))

(assert (=> b!319093 (= res!173523 (and (= (size!8042 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8042 a!3293))))))

(declare-fun b!319094 () Bool)

(assert (=> b!319094 (= e!198211 (not e!198213))))

(declare-fun res!173527 () Bool)

(assert (=> b!319094 (=> res!173527 e!198213)))

(assert (=> b!319094 (= res!173527 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155684 #b00000000000000000000000000000000) (bvsge lt!155684 (size!8042 a!3293)) (not (= lt!155683 lt!155680))))))

(declare-fun lt!155682 () SeekEntryResult!2795)

(assert (=> b!319094 (= lt!155682 lt!155679)))

(declare-fun lt!155681 () array!16253)

(assert (=> b!319094 (= lt!155679 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155684 k0!2441 lt!155681 mask!3709))))

(assert (=> b!319094 (= lt!155682 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155681 mask!3709))))

(assert (=> b!319094 (= lt!155681 (array!16254 (store (arr!7690 a!3293) i!1240 k0!2441) (size!8042 a!3293)))))

(assert (=> b!319094 (= lt!155685 lt!155683)))

(assert (=> b!319094 (= lt!155683 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155684 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319094 (= lt!155684 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!319095 () Bool)

(declare-fun res!173529 () Bool)

(assert (=> b!319095 (=> (not res!173529) (not e!198212))))

(declare-fun arrayContainsKey!0 (array!16253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319095 (= res!173529 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31920 res!173525) b!319093))

(assert (= (and b!319093 res!173523) b!319092))

(assert (= (and b!319092 res!173526) b!319095))

(assert (= (and b!319095 res!173529) b!319089))

(assert (= (and b!319089 res!173522) b!319088))

(assert (= (and b!319088 res!173528) b!319090))

(assert (= (and b!319090 res!173521) b!319086))

(assert (= (and b!319086 res!173524) b!319091))

(assert (= (and b!319091 res!173520) b!319094))

(assert (= (and b!319094 (not res!173527)) b!319087))

(declare-fun m!327919 () Bool)

(assert (=> start!31920 m!327919))

(declare-fun m!327921 () Bool)

(assert (=> start!31920 m!327921))

(declare-fun m!327923 () Bool)

(assert (=> b!319095 m!327923))

(declare-fun m!327925 () Bool)

(assert (=> b!319088 m!327925))

(declare-fun m!327927 () Bool)

(assert (=> b!319089 m!327927))

(declare-fun m!327929 () Bool)

(assert (=> b!319090 m!327929))

(assert (=> b!319090 m!327929))

(declare-fun m!327931 () Bool)

(assert (=> b!319090 m!327931))

(declare-fun m!327933 () Bool)

(assert (=> b!319094 m!327933))

(declare-fun m!327935 () Bool)

(assert (=> b!319094 m!327935))

(declare-fun m!327937 () Bool)

(assert (=> b!319094 m!327937))

(declare-fun m!327939 () Bool)

(assert (=> b!319094 m!327939))

(declare-fun m!327941 () Bool)

(assert (=> b!319094 m!327941))

(declare-fun m!327943 () Bool)

(assert (=> b!319087 m!327943))

(declare-fun m!327945 () Bool)

(assert (=> b!319086 m!327945))

(declare-fun m!327947 () Bool)

(assert (=> b!319092 m!327947))

(declare-fun m!327949 () Bool)

(assert (=> b!319091 m!327949))

(declare-fun m!327951 () Bool)

(assert (=> b!319091 m!327951))

(check-sat (not b!319091) (not b!319092) (not b!319089) (not b!319095) (not b!319090) (not b!319088) (not start!31920) (not b!319087) (not b!319094))
(check-sat)
