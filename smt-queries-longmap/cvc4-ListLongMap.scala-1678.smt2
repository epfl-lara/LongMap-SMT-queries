; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30960 () Bool)

(assert start!30960)

(declare-fun b!310937 () Bool)

(declare-fun res!167400 () Bool)

(declare-fun e!194070 () Bool)

(assert (=> b!310937 (=> (not res!167400) (not e!194070))))

(declare-datatypes ((array!15862 0))(
  ( (array!15863 (arr!7513 (Array (_ BitVec 32) (_ BitVec 64))) (size!7865 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15862)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310937 (= res!167400 (and (= (select (arr!7513 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7865 a!3293))))))

(declare-fun b!310938 () Bool)

(declare-fun e!194069 () Bool)

(assert (=> b!310938 (= e!194070 e!194069)))

(declare-fun res!167396 () Bool)

(assert (=> b!310938 (=> (not res!167396) (not e!194069))))

(declare-datatypes ((SeekEntryResult!2653 0))(
  ( (MissingZero!2653 (index!12788 (_ BitVec 32))) (Found!2653 (index!12789 (_ BitVec 32))) (Intermediate!2653 (undefined!3465 Bool) (index!12790 (_ BitVec 32)) (x!31010 (_ BitVec 32))) (Undefined!2653) (MissingVacant!2653 (index!12791 (_ BitVec 32))) )
))
(declare-fun lt!152155 () SeekEntryResult!2653)

(declare-fun lt!152157 () SeekEntryResult!2653)

(declare-fun k!2441 () (_ BitVec 64))

(assert (=> b!310938 (= res!167396 (and (= lt!152157 lt!152155) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7513 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15862 (_ BitVec 32)) SeekEntryResult!2653)

(assert (=> b!310938 (= lt!152157 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310939 () Bool)

(declare-fun res!167397 () Bool)

(declare-fun e!194067 () Bool)

(assert (=> b!310939 (=> (not res!167397) (not e!194067))))

(assert (=> b!310939 (= res!167397 (and (= (size!7865 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7865 a!3293))))))

(declare-fun b!310940 () Bool)

(declare-fun res!167391 () Bool)

(assert (=> b!310940 (=> (not res!167391) (not e!194067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310940 (= res!167391 (validKeyInArray!0 k!2441))))

(declare-fun lt!152154 () (_ BitVec 32))

(declare-fun lt!152156 () array!15862)

(declare-fun b!310941 () Bool)

(declare-fun e!194068 () Bool)

(assert (=> b!310941 (= e!194068 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152156 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152154 k!2441 lt!152156 mask!3709)))))

(assert (=> b!310941 (= lt!152156 (array!15863 (store (arr!7513 a!3293) i!1240 k!2441) (size!7865 a!3293)))))

(declare-fun b!310942 () Bool)

(declare-fun res!167395 () Bool)

(assert (=> b!310942 (=> (not res!167395) (not e!194067))))

(declare-fun arrayContainsKey!0 (array!15862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310942 (= res!167395 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310943 () Bool)

(declare-fun res!167393 () Bool)

(assert (=> b!310943 (=> (not res!167393) (not e!194067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15862 (_ BitVec 32)) Bool)

(assert (=> b!310943 (= res!167393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!167392 () Bool)

(assert (=> start!30960 (=> (not res!167392) (not e!194067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30960 (= res!167392 (validMask!0 mask!3709))))

(assert (=> start!30960 e!194067))

(declare-fun array_inv!5476 (array!15862) Bool)

(assert (=> start!30960 (array_inv!5476 a!3293)))

(assert (=> start!30960 true))

(declare-fun b!310944 () Bool)

(assert (=> b!310944 (= e!194069 (not true))))

(assert (=> b!310944 e!194068))

(declare-fun res!167394 () Bool)

(assert (=> b!310944 (=> (not res!167394) (not e!194068))))

(assert (=> b!310944 (= res!167394 (= lt!152157 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152154 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310944 (= lt!152154 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310945 () Bool)

(assert (=> b!310945 (= e!194067 e!194070)))

(declare-fun res!167399 () Bool)

(assert (=> b!310945 (=> (not res!167399) (not e!194070))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310945 (= res!167399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152155))))

(assert (=> b!310945 (= lt!152155 (Intermediate!2653 false resIndex!52 resX!52))))

(declare-fun b!310946 () Bool)

(declare-fun res!167398 () Bool)

(assert (=> b!310946 (=> (not res!167398) (not e!194067))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15862 (_ BitVec 32)) SeekEntryResult!2653)

(assert (=> b!310946 (= res!167398 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2653 i!1240)))))

(assert (= (and start!30960 res!167392) b!310939))

(assert (= (and b!310939 res!167397) b!310940))

(assert (= (and b!310940 res!167391) b!310942))

(assert (= (and b!310942 res!167395) b!310946))

(assert (= (and b!310946 res!167398) b!310943))

(assert (= (and b!310943 res!167393) b!310945))

(assert (= (and b!310945 res!167399) b!310937))

(assert (= (and b!310937 res!167400) b!310938))

(assert (= (and b!310938 res!167396) b!310944))

(assert (= (and b!310944 res!167394) b!310941))

(declare-fun m!320877 () Bool)

(assert (=> b!310944 m!320877))

(declare-fun m!320879 () Bool)

(assert (=> b!310944 m!320879))

(declare-fun m!320881 () Bool)

(assert (=> b!310943 m!320881))

(declare-fun m!320883 () Bool)

(assert (=> b!310946 m!320883))

(declare-fun m!320885 () Bool)

(assert (=> b!310937 m!320885))

(declare-fun m!320887 () Bool)

(assert (=> b!310941 m!320887))

(declare-fun m!320889 () Bool)

(assert (=> b!310941 m!320889))

(declare-fun m!320891 () Bool)

(assert (=> b!310941 m!320891))

(declare-fun m!320893 () Bool)

(assert (=> b!310945 m!320893))

(assert (=> b!310945 m!320893))

(declare-fun m!320895 () Bool)

(assert (=> b!310945 m!320895))

(declare-fun m!320897 () Bool)

(assert (=> b!310938 m!320897))

(declare-fun m!320899 () Bool)

(assert (=> b!310938 m!320899))

(declare-fun m!320901 () Bool)

(assert (=> b!310942 m!320901))

(declare-fun m!320903 () Bool)

(assert (=> b!310940 m!320903))

(declare-fun m!320905 () Bool)

(assert (=> start!30960 m!320905))

(declare-fun m!320907 () Bool)

(assert (=> start!30960 m!320907))

(push 1)

(assert (not start!30960))

(assert (not b!310938))

(assert (not b!310943))

(assert (not b!310941))

(assert (not b!310944))

