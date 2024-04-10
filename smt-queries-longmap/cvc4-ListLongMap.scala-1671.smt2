; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30918 () Bool)

(assert start!30918)

(declare-fun b!310307 () Bool)

(declare-fun res!166770 () Bool)

(declare-fun e!193754 () Bool)

(assert (=> b!310307 (=> (not res!166770) (not e!193754))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310307 (= res!166770 (validKeyInArray!0 k!2441))))

(declare-fun b!310308 () Bool)

(declare-fun e!193755 () Bool)

(assert (=> b!310308 (= e!193754 e!193755)))

(declare-fun res!166766 () Bool)

(assert (=> b!310308 (=> (not res!166766) (not e!193755))))

(declare-datatypes ((array!15820 0))(
  ( (array!15821 (arr!7492 (Array (_ BitVec 32) (_ BitVec 64))) (size!7844 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15820)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2632 0))(
  ( (MissingZero!2632 (index!12704 (_ BitVec 32))) (Found!2632 (index!12705 (_ BitVec 32))) (Intermediate!2632 (undefined!3444 Bool) (index!12706 (_ BitVec 32)) (x!30933 (_ BitVec 32))) (Undefined!2632) (MissingVacant!2632 (index!12707 (_ BitVec 32))) )
))
(declare-fun lt!151903 () SeekEntryResult!2632)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15820 (_ BitVec 32)) SeekEntryResult!2632)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310308 (= res!166766 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151903))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310308 (= lt!151903 (Intermediate!2632 false resIndex!52 resX!52))))

(declare-fun b!310309 () Bool)

(declare-fun res!166762 () Bool)

(assert (=> b!310309 (=> (not res!166762) (not e!193755))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310309 (= res!166762 (and (= (select (arr!7492 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7844 a!3293))))))

(declare-fun res!166769 () Bool)

(assert (=> start!30918 (=> (not res!166769) (not e!193754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30918 (= res!166769 (validMask!0 mask!3709))))

(assert (=> start!30918 e!193754))

(declare-fun array_inv!5455 (array!15820) Bool)

(assert (=> start!30918 (array_inv!5455 a!3293)))

(assert (=> start!30918 true))

(declare-fun b!310310 () Bool)

(declare-fun e!193752 () Bool)

(assert (=> b!310310 (= e!193755 e!193752)))

(declare-fun res!166768 () Bool)

(assert (=> b!310310 (=> (not res!166768) (not e!193752))))

(declare-fun lt!151905 () SeekEntryResult!2632)

(assert (=> b!310310 (= res!166768 (and (= lt!151905 lt!151903) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7492 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310310 (= lt!151905 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310311 () Bool)

(declare-fun res!166761 () Bool)

(assert (=> b!310311 (=> (not res!166761) (not e!193754))))

(assert (=> b!310311 (= res!166761 (and (= (size!7844 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7844 a!3293))))))

(declare-fun b!310312 () Bool)

(declare-fun res!166764 () Bool)

(assert (=> b!310312 (=> (not res!166764) (not e!193754))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15820 (_ BitVec 32)) SeekEntryResult!2632)

(assert (=> b!310312 (= res!166764 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2632 i!1240)))))

(declare-fun b!310313 () Bool)

(assert (=> b!310313 (= e!193752 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun e!193753 () Bool)

(assert (=> b!310313 e!193753))

(declare-fun res!166763 () Bool)

(assert (=> b!310313 (=> (not res!166763) (not e!193753))))

(declare-fun lt!151904 () (_ BitVec 32))

(assert (=> b!310313 (= res!166763 (= lt!151905 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151904 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310313 (= lt!151904 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310314 () Bool)

(declare-fun res!166765 () Bool)

(assert (=> b!310314 (=> (not res!166765) (not e!193754))))

(declare-fun arrayContainsKey!0 (array!15820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310314 (= res!166765 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310315 () Bool)

(declare-fun res!166767 () Bool)

(assert (=> b!310315 (=> (not res!166767) (not e!193754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15820 (_ BitVec 32)) Bool)

(assert (=> b!310315 (= res!166767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310316 () Bool)

(declare-fun lt!151902 () array!15820)

(assert (=> b!310316 (= e!193753 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151902 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151904 k!2441 lt!151902 mask!3709)))))

(assert (=> b!310316 (= lt!151902 (array!15821 (store (arr!7492 a!3293) i!1240 k!2441) (size!7844 a!3293)))))

(assert (= (and start!30918 res!166769) b!310311))

(assert (= (and b!310311 res!166761) b!310307))

(assert (= (and b!310307 res!166770) b!310314))

(assert (= (and b!310314 res!166765) b!310312))

(assert (= (and b!310312 res!166764) b!310315))

(assert (= (and b!310315 res!166767) b!310308))

(assert (= (and b!310308 res!166766) b!310309))

(assert (= (and b!310309 res!166762) b!310310))

(assert (= (and b!310310 res!166768) b!310313))

(assert (= (and b!310313 res!166763) b!310316))

(declare-fun m!320205 () Bool)

(assert (=> b!310307 m!320205))

(declare-fun m!320207 () Bool)

(assert (=> b!310309 m!320207))

(declare-fun m!320209 () Bool)

(assert (=> b!310316 m!320209))

(declare-fun m!320211 () Bool)

(assert (=> b!310316 m!320211))

(declare-fun m!320213 () Bool)

(assert (=> b!310316 m!320213))

(declare-fun m!320215 () Bool)

(assert (=> b!310308 m!320215))

(assert (=> b!310308 m!320215))

(declare-fun m!320217 () Bool)

(assert (=> b!310308 m!320217))

(declare-fun m!320219 () Bool)

(assert (=> b!310312 m!320219))

(declare-fun m!320221 () Bool)

(assert (=> b!310314 m!320221))

(declare-fun m!320223 () Bool)

(assert (=> b!310310 m!320223))

(declare-fun m!320225 () Bool)

(assert (=> b!310310 m!320225))

(declare-fun m!320227 () Bool)

(assert (=> b!310315 m!320227))

(declare-fun m!320229 () Bool)

(assert (=> start!30918 m!320229))

(declare-fun m!320231 () Bool)

(assert (=> start!30918 m!320231))

(declare-fun m!320233 () Bool)

(assert (=> b!310313 m!320233))

(declare-fun m!320235 () Bool)

(assert (=> b!310313 m!320235))

(push 1)

(assert (not b!310307))

(assert (not start!30918))

(assert (not b!310312))

(assert (not b!310316))

(assert (not b!310313))

(assert (not b!310315))

(assert (not b!310314))

(assert (not b!310308))

(assert (not b!310310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

