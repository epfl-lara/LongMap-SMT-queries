; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30958 () Bool)

(assert start!30958)

(declare-fun b!310907 () Bool)

(declare-fun e!194055 () Bool)

(declare-fun e!194053 () Bool)

(assert (=> b!310907 (= e!194055 e!194053)))

(declare-fun res!167365 () Bool)

(assert (=> b!310907 (=> (not res!167365) (not e!194053))))

(declare-datatypes ((array!15860 0))(
  ( (array!15861 (arr!7512 (Array (_ BitVec 32) (_ BitVec 64))) (size!7864 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15860)

(declare-datatypes ((SeekEntryResult!2652 0))(
  ( (MissingZero!2652 (index!12784 (_ BitVec 32))) (Found!2652 (index!12785 (_ BitVec 32))) (Intermediate!2652 (undefined!3464 Bool) (index!12786 (_ BitVec 32)) (x!31009 (_ BitVec 32))) (Undefined!2652) (MissingVacant!2652 (index!12787 (_ BitVec 32))) )
))
(declare-fun lt!152142 () SeekEntryResult!2652)

(declare-fun lt!152144 () SeekEntryResult!2652)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310907 (= res!167365 (and (= lt!152144 lt!152142) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7512 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15860 (_ BitVec 32)) SeekEntryResult!2652)

(assert (=> b!310907 (= lt!152144 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310908 () Bool)

(declare-fun res!167368 () Bool)

(assert (=> b!310908 (=> (not res!167368) (not e!194055))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310908 (= res!167368 (and (= (select (arr!7512 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7864 a!3293))))))

(declare-fun b!310909 () Bool)

(assert (=> b!310909 (= e!194053 (not true))))

(declare-fun e!194054 () Bool)

(assert (=> b!310909 e!194054))

(declare-fun res!167369 () Bool)

(assert (=> b!310909 (=> (not res!167369) (not e!194054))))

(declare-fun lt!152145 () (_ BitVec 32))

(assert (=> b!310909 (= res!167369 (= lt!152144 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152145 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310909 (= lt!152145 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310910 () Bool)

(declare-fun e!194052 () Bool)

(assert (=> b!310910 (= e!194052 e!194055)))

(declare-fun res!167366 () Bool)

(assert (=> b!310910 (=> (not res!167366) (not e!194055))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310910 (= res!167366 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152142))))

(assert (=> b!310910 (= lt!152142 (Intermediate!2652 false resIndex!52 resX!52))))

(declare-fun b!310911 () Bool)

(declare-fun res!167370 () Bool)

(assert (=> b!310911 (=> (not res!167370) (not e!194052))))

(declare-fun arrayContainsKey!0 (array!15860 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310911 (= res!167370 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310912 () Bool)

(declare-fun res!167367 () Bool)

(assert (=> b!310912 (=> (not res!167367) (not e!194052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310912 (= res!167367 (validKeyInArray!0 k0!2441))))

(declare-fun b!310913 () Bool)

(declare-fun res!167361 () Bool)

(assert (=> b!310913 (=> (not res!167361) (not e!194052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15860 (_ BitVec 32)) Bool)

(assert (=> b!310913 (= res!167361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310914 () Bool)

(declare-fun res!167363 () Bool)

(assert (=> b!310914 (=> (not res!167363) (not e!194052))))

(assert (=> b!310914 (= res!167363 (and (= (size!7864 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7864 a!3293))))))

(declare-fun b!310915 () Bool)

(declare-fun res!167362 () Bool)

(assert (=> b!310915 (=> (not res!167362) (not e!194052))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15860 (_ BitVec 32)) SeekEntryResult!2652)

(assert (=> b!310915 (= res!167362 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2652 i!1240)))))

(declare-fun res!167364 () Bool)

(assert (=> start!30958 (=> (not res!167364) (not e!194052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30958 (= res!167364 (validMask!0 mask!3709))))

(assert (=> start!30958 e!194052))

(declare-fun array_inv!5475 (array!15860) Bool)

(assert (=> start!30958 (array_inv!5475 a!3293)))

(assert (=> start!30958 true))

(declare-fun lt!152143 () array!15860)

(declare-fun b!310916 () Bool)

(assert (=> b!310916 (= e!194054 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152143 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152145 k0!2441 lt!152143 mask!3709)))))

(assert (=> b!310916 (= lt!152143 (array!15861 (store (arr!7512 a!3293) i!1240 k0!2441) (size!7864 a!3293)))))

(assert (= (and start!30958 res!167364) b!310914))

(assert (= (and b!310914 res!167363) b!310912))

(assert (= (and b!310912 res!167367) b!310911))

(assert (= (and b!310911 res!167370) b!310915))

(assert (= (and b!310915 res!167362) b!310913))

(assert (= (and b!310913 res!167361) b!310910))

(assert (= (and b!310910 res!167366) b!310908))

(assert (= (and b!310908 res!167368) b!310907))

(assert (= (and b!310907 res!167365) b!310909))

(assert (= (and b!310909 res!167369) b!310916))

(declare-fun m!320845 () Bool)

(assert (=> b!310908 m!320845))

(declare-fun m!320847 () Bool)

(assert (=> b!310913 m!320847))

(declare-fun m!320849 () Bool)

(assert (=> b!310912 m!320849))

(declare-fun m!320851 () Bool)

(assert (=> b!310915 m!320851))

(declare-fun m!320853 () Bool)

(assert (=> b!310909 m!320853))

(declare-fun m!320855 () Bool)

(assert (=> b!310909 m!320855))

(declare-fun m!320857 () Bool)

(assert (=> b!310916 m!320857))

(declare-fun m!320859 () Bool)

(assert (=> b!310916 m!320859))

(declare-fun m!320861 () Bool)

(assert (=> b!310916 m!320861))

(declare-fun m!320863 () Bool)

(assert (=> b!310910 m!320863))

(assert (=> b!310910 m!320863))

(declare-fun m!320865 () Bool)

(assert (=> b!310910 m!320865))

(declare-fun m!320867 () Bool)

(assert (=> b!310911 m!320867))

(declare-fun m!320869 () Bool)

(assert (=> start!30958 m!320869))

(declare-fun m!320871 () Bool)

(assert (=> start!30958 m!320871))

(declare-fun m!320873 () Bool)

(assert (=> b!310907 m!320873))

(declare-fun m!320875 () Bool)

(assert (=> b!310907 m!320875))

(check-sat (not start!30958) (not b!310911) (not b!310907) (not b!310915) (not b!310909) (not b!310916) (not b!310913) (not b!310912) (not b!310910))
(check-sat)
