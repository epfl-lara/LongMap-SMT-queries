; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30944 () Bool)

(assert start!30944)

(declare-fun b!310697 () Bool)

(declare-fun e!193950 () Bool)

(declare-fun e!193949 () Bool)

(assert (=> b!310697 (= e!193950 e!193949)))

(declare-fun res!167153 () Bool)

(assert (=> b!310697 (=> (not res!167153) (not e!193949))))

(declare-datatypes ((array!15846 0))(
  ( (array!15847 (arr!7505 (Array (_ BitVec 32) (_ BitVec 64))) (size!7857 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15846)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2645 0))(
  ( (MissingZero!2645 (index!12756 (_ BitVec 32))) (Found!2645 (index!12757 (_ BitVec 32))) (Intermediate!2645 (undefined!3457 Bool) (index!12758 (_ BitVec 32)) (x!30986 (_ BitVec 32))) (Undefined!2645) (MissingVacant!2645 (index!12759 (_ BitVec 32))) )
))
(declare-fun lt!152059 () SeekEntryResult!2645)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15846 (_ BitVec 32)) SeekEntryResult!2645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310697 (= res!167153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152059))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310697 (= lt!152059 (Intermediate!2645 false resIndex!52 resX!52))))

(declare-fun res!167152 () Bool)

(assert (=> start!30944 (=> (not res!167152) (not e!193950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30944 (= res!167152 (validMask!0 mask!3709))))

(assert (=> start!30944 e!193950))

(declare-fun array_inv!5468 (array!15846) Bool)

(assert (=> start!30944 (array_inv!5468 a!3293)))

(assert (=> start!30944 true))

(declare-fun b!310698 () Bool)

(declare-fun res!167151 () Bool)

(assert (=> b!310698 (=> (not res!167151) (not e!193949))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310698 (= res!167151 (and (= (select (arr!7505 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7857 a!3293))))))

(declare-fun lt!152060 () array!15846)

(declare-fun e!193951 () Bool)

(declare-fun lt!152061 () (_ BitVec 32))

(declare-fun b!310699 () Bool)

(assert (=> b!310699 (= e!193951 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152060 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152061 k!2441 lt!152060 mask!3709)))))

(assert (=> b!310699 (= lt!152060 (array!15847 (store (arr!7505 a!3293) i!1240 k!2441) (size!7857 a!3293)))))

(declare-fun b!310700 () Bool)

(declare-fun res!167158 () Bool)

(assert (=> b!310700 (=> (not res!167158) (not e!193950))))

(declare-fun arrayContainsKey!0 (array!15846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310700 (= res!167158 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310701 () Bool)

(declare-fun res!167157 () Bool)

(assert (=> b!310701 (=> (not res!167157) (not e!193950))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15846 (_ BitVec 32)) SeekEntryResult!2645)

(assert (=> b!310701 (= res!167157 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2645 i!1240)))))

(declare-fun b!310702 () Bool)

(declare-fun res!167154 () Bool)

(assert (=> b!310702 (=> (not res!167154) (not e!193950))))

(assert (=> b!310702 (= res!167154 (and (= (size!7857 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7857 a!3293))))))

(declare-fun b!310703 () Bool)

(declare-fun e!193948 () Bool)

(assert (=> b!310703 (= e!193948 (not true))))

(assert (=> b!310703 e!193951))

(declare-fun res!167159 () Bool)

(assert (=> b!310703 (=> (not res!167159) (not e!193951))))

(declare-fun lt!152058 () SeekEntryResult!2645)

(assert (=> b!310703 (= res!167159 (= lt!152058 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152061 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310703 (= lt!152061 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310704 () Bool)

(assert (=> b!310704 (= e!193949 e!193948)))

(declare-fun res!167160 () Bool)

(assert (=> b!310704 (=> (not res!167160) (not e!193948))))

(assert (=> b!310704 (= res!167160 (and (= lt!152058 lt!152059) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7505 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310704 (= lt!152058 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310705 () Bool)

(declare-fun res!167155 () Bool)

(assert (=> b!310705 (=> (not res!167155) (not e!193950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15846 (_ BitVec 32)) Bool)

(assert (=> b!310705 (= res!167155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310706 () Bool)

(declare-fun res!167156 () Bool)

(assert (=> b!310706 (=> (not res!167156) (not e!193950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310706 (= res!167156 (validKeyInArray!0 k!2441))))

(assert (= (and start!30944 res!167152) b!310702))

(assert (= (and b!310702 res!167154) b!310706))

(assert (= (and b!310706 res!167156) b!310700))

(assert (= (and b!310700 res!167158) b!310701))

(assert (= (and b!310701 res!167157) b!310705))

(assert (= (and b!310705 res!167155) b!310697))

(assert (= (and b!310697 res!167153) b!310698))

(assert (= (and b!310698 res!167151) b!310704))

(assert (= (and b!310704 res!167160) b!310703))

(assert (= (and b!310703 res!167159) b!310699))

(declare-fun m!320621 () Bool)

(assert (=> start!30944 m!320621))

(declare-fun m!320623 () Bool)

(assert (=> start!30944 m!320623))

(declare-fun m!320625 () Bool)

(assert (=> b!310701 m!320625))

(declare-fun m!320627 () Bool)

(assert (=> b!310705 m!320627))

(declare-fun m!320629 () Bool)

(assert (=> b!310699 m!320629))

(declare-fun m!320631 () Bool)

(assert (=> b!310699 m!320631))

(declare-fun m!320633 () Bool)

(assert (=> b!310699 m!320633))

(declare-fun m!320635 () Bool)

(assert (=> b!310700 m!320635))

(declare-fun m!320637 () Bool)

(assert (=> b!310704 m!320637))

(declare-fun m!320639 () Bool)

(assert (=> b!310704 m!320639))

(declare-fun m!320641 () Bool)

(assert (=> b!310706 m!320641))

(declare-fun m!320643 () Bool)

(assert (=> b!310697 m!320643))

(assert (=> b!310697 m!320643))

(declare-fun m!320645 () Bool)

(assert (=> b!310697 m!320645))

(declare-fun m!320647 () Bool)

(assert (=> b!310698 m!320647))

(declare-fun m!320649 () Bool)

(assert (=> b!310703 m!320649))

(declare-fun m!320651 () Bool)

(assert (=> b!310703 m!320651))

(push 1)

