; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31942 () Bool)

(assert start!31942)

(declare-fun res!173650 () Bool)

(declare-fun e!198304 () Bool)

(assert (=> start!31942 (=> (not res!173650) (not e!198304))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31942 (= res!173650 (validMask!0 mask!3709))))

(assert (=> start!31942 e!198304))

(declare-datatypes ((array!16262 0))(
  ( (array!16263 (arr!7695 (Array (_ BitVec 32) (_ BitVec 64))) (size!8047 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16262)

(declare-fun array_inv!5658 (array!16262) Bool)

(assert (=> start!31942 (array_inv!5658 a!3293)))

(assert (=> start!31942 true))

(declare-fun b!319259 () Bool)

(declare-fun res!173651 () Bool)

(assert (=> b!319259 (=> (not res!173651) (not e!198304))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319259 (= res!173651 (validKeyInArray!0 k0!2441))))

(declare-fun b!319260 () Bool)

(declare-fun res!173643 () Bool)

(declare-fun e!198307 () Bool)

(assert (=> b!319260 (=> (not res!173643) (not e!198307))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319260 (= res!173643 (and (= (select (arr!7695 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8047 a!3293))))))

(declare-fun b!319261 () Bool)

(declare-fun res!173652 () Bool)

(assert (=> b!319261 (=> (not res!173652) (not e!198304))))

(declare-datatypes ((SeekEntryResult!2835 0))(
  ( (MissingZero!2835 (index!13516 (_ BitVec 32))) (Found!2835 (index!13517 (_ BitVec 32))) (Intermediate!2835 (undefined!3647 Bool) (index!13518 (_ BitVec 32)) (x!31773 (_ BitVec 32))) (Undefined!2835) (MissingVacant!2835 (index!13519 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16262 (_ BitVec 32)) SeekEntryResult!2835)

(assert (=> b!319261 (= res!173652 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2835 i!1240)))))

(declare-fun b!319262 () Bool)

(declare-fun e!198303 () Bool)

(assert (=> b!319262 (= e!198307 e!198303)))

(declare-fun res!173648 () Bool)

(assert (=> b!319262 (=> (not res!173648) (not e!198303))))

(declare-fun lt!155762 () SeekEntryResult!2835)

(declare-fun lt!155757 () SeekEntryResult!2835)

(assert (=> b!319262 (= res!173648 (and (= lt!155757 lt!155762) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7695 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16262 (_ BitVec 32)) SeekEntryResult!2835)

(assert (=> b!319262 (= lt!155757 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!319263 () Bool)

(declare-fun res!173645 () Bool)

(assert (=> b!319263 (=> (not res!173645) (not e!198304))))

(declare-fun arrayContainsKey!0 (array!16262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319263 (= res!173645 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!319264 () Bool)

(declare-fun res!173649 () Bool)

(assert (=> b!319264 (=> (not res!173649) (not e!198304))))

(assert (=> b!319264 (= res!173649 (and (= (size!8047 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8047 a!3293))))))

(declare-fun b!319265 () Bool)

(declare-fun e!198306 () Bool)

(declare-fun lt!155758 () SeekEntryResult!2835)

(assert (=> b!319265 (= e!198306 (= lt!155758 lt!155757))))

(declare-fun lt!155759 () SeekEntryResult!2835)

(declare-fun lt!155760 () SeekEntryResult!2835)

(assert (=> b!319265 (= lt!155759 lt!155760)))

(declare-fun lt!155756 () (_ BitVec 32))

(declare-datatypes ((Unit!9808 0))(
  ( (Unit!9809) )
))
(declare-fun lt!155761 () Unit!9808)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16262 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9808)

(assert (=> b!319265 (= lt!155761 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155756 resIndex!52 resX!52 mask!3709))))

(declare-fun b!319266 () Bool)

(assert (=> b!319266 (= e!198303 (not e!198306))))

(declare-fun res!173646 () Bool)

(assert (=> b!319266 (=> res!173646 e!198306)))

(assert (=> b!319266 (= res!173646 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155756 #b00000000000000000000000000000000) (bvsge lt!155756 (size!8047 a!3293)) (not (= lt!155760 lt!155762))))))

(assert (=> b!319266 (= lt!155758 lt!155759)))

(declare-fun lt!155763 () array!16262)

(assert (=> b!319266 (= lt!155759 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155756 k0!2441 lt!155763 mask!3709))))

(assert (=> b!319266 (= lt!155758 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155763 mask!3709))))

(assert (=> b!319266 (= lt!155763 (array!16263 (store (arr!7695 a!3293) i!1240 k0!2441) (size!8047 a!3293)))))

(assert (=> b!319266 (= lt!155757 lt!155760)))

(assert (=> b!319266 (= lt!155760 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155756 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319266 (= lt!155756 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!319267 () Bool)

(declare-fun res!173647 () Bool)

(assert (=> b!319267 (=> (not res!173647) (not e!198304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16262 (_ BitVec 32)) Bool)

(assert (=> b!319267 (= res!173647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319268 () Bool)

(assert (=> b!319268 (= e!198304 e!198307)))

(declare-fun res!173644 () Bool)

(assert (=> b!319268 (=> (not res!173644) (not e!198307))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319268 (= res!173644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155762))))

(assert (=> b!319268 (= lt!155762 (Intermediate!2835 false resIndex!52 resX!52))))

(assert (= (and start!31942 res!173650) b!319264))

(assert (= (and b!319264 res!173649) b!319259))

(assert (= (and b!319259 res!173651) b!319263))

(assert (= (and b!319263 res!173645) b!319261))

(assert (= (and b!319261 res!173652) b!319267))

(assert (= (and b!319267 res!173647) b!319268))

(assert (= (and b!319268 res!173644) b!319260))

(assert (= (and b!319260 res!173643) b!319262))

(assert (= (and b!319262 res!173648) b!319266))

(assert (= (and b!319266 (not res!173646)) b!319265))

(declare-fun m!327879 () Bool)

(assert (=> b!319259 m!327879))

(declare-fun m!327881 () Bool)

(assert (=> b!319260 m!327881))

(declare-fun m!327883 () Bool)

(assert (=> b!319265 m!327883))

(declare-fun m!327885 () Bool)

(assert (=> b!319263 m!327885))

(declare-fun m!327887 () Bool)

(assert (=> b!319261 m!327887))

(declare-fun m!327889 () Bool)

(assert (=> b!319266 m!327889))

(declare-fun m!327891 () Bool)

(assert (=> b!319266 m!327891))

(declare-fun m!327893 () Bool)

(assert (=> b!319266 m!327893))

(declare-fun m!327895 () Bool)

(assert (=> b!319266 m!327895))

(declare-fun m!327897 () Bool)

(assert (=> b!319266 m!327897))

(declare-fun m!327899 () Bool)

(assert (=> start!31942 m!327899))

(declare-fun m!327901 () Bool)

(assert (=> start!31942 m!327901))

(declare-fun m!327903 () Bool)

(assert (=> b!319268 m!327903))

(assert (=> b!319268 m!327903))

(declare-fun m!327905 () Bool)

(assert (=> b!319268 m!327905))

(declare-fun m!327907 () Bool)

(assert (=> b!319262 m!327907))

(declare-fun m!327909 () Bool)

(assert (=> b!319262 m!327909))

(declare-fun m!327911 () Bool)

(assert (=> b!319267 m!327911))

(check-sat (not b!319262) (not b!319266) (not b!319268) (not b!319263) (not b!319265) (not b!319261) (not start!31942) (not b!319267) (not b!319259))
(check-sat)
