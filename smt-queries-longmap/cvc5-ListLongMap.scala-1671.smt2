; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30914 () Bool)

(assert start!30914)

(declare-fun b!310247 () Bool)

(declare-fun res!166703 () Bool)

(declare-fun e!193722 () Bool)

(assert (=> b!310247 (=> (not res!166703) (not e!193722))))

(declare-datatypes ((array!15816 0))(
  ( (array!15817 (arr!7490 (Array (_ BitVec 32) (_ BitVec 64))) (size!7842 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15816)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15816 (_ BitVec 32)) Bool)

(assert (=> b!310247 (= res!166703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310248 () Bool)

(declare-fun res!166708 () Bool)

(assert (=> b!310248 (=> (not res!166708) (not e!193722))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310248 (= res!166708 (validKeyInArray!0 k!2441))))

(declare-fun res!166709 () Bool)

(assert (=> start!30914 (=> (not res!166709) (not e!193722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30914 (= res!166709 (validMask!0 mask!3709))))

(assert (=> start!30914 e!193722))

(declare-fun array_inv!5453 (array!15816) Bool)

(assert (=> start!30914 (array_inv!5453 a!3293)))

(assert (=> start!30914 true))

(declare-fun b!310249 () Bool)

(declare-fun res!166705 () Bool)

(assert (=> b!310249 (=> (not res!166705) (not e!193722))))

(declare-fun arrayContainsKey!0 (array!15816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310249 (= res!166705 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310250 () Bool)

(declare-fun e!193726 () Bool)

(assert (=> b!310250 (= e!193722 e!193726)))

(declare-fun res!166701 () Bool)

(assert (=> b!310250 (=> (not res!166701) (not e!193726))))

(declare-datatypes ((SeekEntryResult!2630 0))(
  ( (MissingZero!2630 (index!12696 (_ BitVec 32))) (Found!2630 (index!12697 (_ BitVec 32))) (Intermediate!2630 (undefined!3442 Bool) (index!12698 (_ BitVec 32)) (x!30931 (_ BitVec 32))) (Undefined!2630) (MissingVacant!2630 (index!12699 (_ BitVec 32))) )
))
(declare-fun lt!151879 () SeekEntryResult!2630)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15816 (_ BitVec 32)) SeekEntryResult!2630)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310250 (= res!166701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151879))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310250 (= lt!151879 (Intermediate!2630 false resIndex!52 resX!52))))

(declare-fun b!310251 () Bool)

(declare-fun res!166704 () Bool)

(assert (=> b!310251 (=> (not res!166704) (not e!193722))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15816 (_ BitVec 32)) SeekEntryResult!2630)

(assert (=> b!310251 (= res!166704 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2630 i!1240)))))

(declare-fun b!310252 () Bool)

(declare-fun res!166706 () Bool)

(assert (=> b!310252 (=> (not res!166706) (not e!193722))))

(assert (=> b!310252 (= res!166706 (and (= (size!7842 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7842 a!3293))))))

(declare-fun b!310253 () Bool)

(declare-fun e!193723 () Bool)

(assert (=> b!310253 (= e!193726 e!193723)))

(declare-fun res!166702 () Bool)

(assert (=> b!310253 (=> (not res!166702) (not e!193723))))

(declare-fun lt!151881 () SeekEntryResult!2630)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310253 (= res!166702 (and (= lt!151881 lt!151879) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7490 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310253 (= lt!151881 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310254 () Bool)

(declare-fun res!166707 () Bool)

(assert (=> b!310254 (=> (not res!166707) (not e!193726))))

(assert (=> b!310254 (= res!166707 (and (= (select (arr!7490 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7842 a!3293))))))

(declare-fun lt!151878 () array!15816)

(declare-fun lt!151880 () (_ BitVec 32))

(declare-fun b!310255 () Bool)

(declare-fun e!193724 () Bool)

(assert (=> b!310255 (= e!193724 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151878 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151880 k!2441 lt!151878 mask!3709)))))

(assert (=> b!310255 (= lt!151878 (array!15817 (store (arr!7490 a!3293) i!1240 k!2441) (size!7842 a!3293)))))

(declare-fun b!310256 () Bool)

(assert (=> b!310256 (= e!193723 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!310256 e!193724))

(declare-fun res!166710 () Bool)

(assert (=> b!310256 (=> (not res!166710) (not e!193724))))

(assert (=> b!310256 (= res!166710 (= lt!151881 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151880 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310256 (= lt!151880 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30914 res!166709) b!310252))

(assert (= (and b!310252 res!166706) b!310248))

(assert (= (and b!310248 res!166708) b!310249))

(assert (= (and b!310249 res!166705) b!310251))

(assert (= (and b!310251 res!166704) b!310247))

(assert (= (and b!310247 res!166703) b!310250))

(assert (= (and b!310250 res!166701) b!310254))

(assert (= (and b!310254 res!166707) b!310253))

(assert (= (and b!310253 res!166702) b!310256))

(assert (= (and b!310256 res!166710) b!310255))

(declare-fun m!320141 () Bool)

(assert (=> b!310253 m!320141))

(declare-fun m!320143 () Bool)

(assert (=> b!310253 m!320143))

(declare-fun m!320145 () Bool)

(assert (=> b!310249 m!320145))

(declare-fun m!320147 () Bool)

(assert (=> b!310254 m!320147))

(declare-fun m!320149 () Bool)

(assert (=> b!310250 m!320149))

(assert (=> b!310250 m!320149))

(declare-fun m!320151 () Bool)

(assert (=> b!310250 m!320151))

(declare-fun m!320153 () Bool)

(assert (=> start!30914 m!320153))

(declare-fun m!320155 () Bool)

(assert (=> start!30914 m!320155))

(declare-fun m!320157 () Bool)

(assert (=> b!310255 m!320157))

(declare-fun m!320159 () Bool)

(assert (=> b!310255 m!320159))

(declare-fun m!320161 () Bool)

(assert (=> b!310255 m!320161))

(declare-fun m!320163 () Bool)

(assert (=> b!310247 m!320163))

(declare-fun m!320165 () Bool)

(assert (=> b!310248 m!320165))

(declare-fun m!320167 () Bool)

(assert (=> b!310256 m!320167))

(declare-fun m!320169 () Bool)

(assert (=> b!310256 m!320169))

(declare-fun m!320171 () Bool)

(assert (=> b!310251 m!320171))

(push 1)

(assert (not b!310251))

(assert (not b!310253))

(assert (not b!310249))

(assert (not b!310255))

(assert (not b!310248))

(assert (not start!30914))

(assert (not b!310250))

(assert (not b!310247))

(assert (not b!310256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

