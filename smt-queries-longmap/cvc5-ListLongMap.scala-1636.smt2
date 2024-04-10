; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30596 () Bool)

(assert start!30596)

(declare-fun b!306880 () Bool)

(assert (=> b!306880 false))

(declare-datatypes ((SeekEntryResult!2525 0))(
  ( (MissingZero!2525 (index!12276 (_ BitVec 32))) (Found!2525 (index!12277 (_ BitVec 32))) (Intermediate!2525 (undefined!3337 Bool) (index!12278 (_ BitVec 32)) (x!30528 (_ BitVec 32))) (Undefined!2525) (MissingVacant!2525 (index!12279 (_ BitVec 32))) )
))
(declare-fun lt!151059 () SeekEntryResult!2525)

(declare-datatypes ((array!15600 0))(
  ( (array!15601 (arr!7385 (Array (_ BitVec 32) (_ BitVec 64))) (size!7737 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15600)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15600 (_ BitVec 32)) SeekEntryResult!2525)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306880 (= lt!151059 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9566 0))(
  ( (Unit!9567) )
))
(declare-fun e!192336 () Unit!9566)

(declare-fun Unit!9568 () Unit!9566)

(assert (=> b!306880 (= e!192336 Unit!9568)))

(declare-fun b!306881 () Bool)

(declare-fun res!163669 () Bool)

(declare-fun e!192340 () Bool)

(assert (=> b!306881 (=> (not res!163669) (not e!192340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306881 (= res!163669 (validKeyInArray!0 k!2441))))

(declare-fun b!306882 () Bool)

(declare-fun e!192337 () Unit!9566)

(assert (=> b!306882 (= e!192337 e!192336)))

(declare-fun c!49211 () Bool)

(assert (=> b!306882 (= c!49211 (or (= (select (arr!7385 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7385 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306883 () Bool)

(declare-fun res!163663 () Bool)

(declare-fun e!192338 () Bool)

(assert (=> b!306883 (=> (not res!163663) (not e!192338))))

(declare-fun lt!151057 () SeekEntryResult!2525)

(assert (=> b!306883 (= res!163663 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151057))))

(declare-fun b!306884 () Bool)

(assert (=> b!306884 (= e!192338 (not true))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306884 (= index!1781 resIndex!52)))

(declare-fun lt!151058 () Unit!9566)

(assert (=> b!306884 (= lt!151058 e!192337)))

(declare-fun c!49212 () Bool)

(assert (=> b!306884 (= c!49212 (not (= resIndex!52 index!1781)))))

(declare-fun b!306885 () Bool)

(assert (=> b!306885 false))

(declare-fun Unit!9569 () Unit!9566)

(assert (=> b!306885 (= e!192336 Unit!9569)))

(declare-fun b!306886 () Bool)

(declare-fun res!163671 () Bool)

(assert (=> b!306886 (=> (not res!163671) (not e!192340))))

(declare-fun arrayContainsKey!0 (array!15600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306886 (= res!163671 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!163666 () Bool)

(assert (=> start!30596 (=> (not res!163666) (not e!192340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30596 (= res!163666 (validMask!0 mask!3709))))

(assert (=> start!30596 e!192340))

(declare-fun array_inv!5348 (array!15600) Bool)

(assert (=> start!30596 (array_inv!5348 a!3293)))

(assert (=> start!30596 true))

(declare-fun b!306887 () Bool)

(declare-fun res!163664 () Bool)

(assert (=> b!306887 (=> (not res!163664) (not e!192338))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306887 (= res!163664 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7385 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306888 () Bool)

(declare-fun res!163668 () Bool)

(assert (=> b!306888 (=> (not res!163668) (not e!192338))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306888 (= res!163668 (and (= (select (arr!7385 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7737 a!3293))))))

(declare-fun b!306889 () Bool)

(declare-fun res!163667 () Bool)

(assert (=> b!306889 (=> (not res!163667) (not e!192340))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15600 (_ BitVec 32)) SeekEntryResult!2525)

(assert (=> b!306889 (= res!163667 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2525 i!1240)))))

(declare-fun b!306890 () Bool)

(declare-fun res!163665 () Bool)

(assert (=> b!306890 (=> (not res!163665) (not e!192340))))

(assert (=> b!306890 (= res!163665 (and (= (size!7737 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7737 a!3293))))))

(declare-fun b!306891 () Bool)

(assert (=> b!306891 (= e!192340 e!192338)))

(declare-fun res!163670 () Bool)

(assert (=> b!306891 (=> (not res!163670) (not e!192338))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306891 (= res!163670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151057))))

(assert (=> b!306891 (= lt!151057 (Intermediate!2525 false resIndex!52 resX!52))))

(declare-fun b!306892 () Bool)

(declare-fun res!163662 () Bool)

(assert (=> b!306892 (=> (not res!163662) (not e!192340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15600 (_ BitVec 32)) Bool)

(assert (=> b!306892 (= res!163662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306893 () Bool)

(declare-fun Unit!9570 () Unit!9566)

(assert (=> b!306893 (= e!192337 Unit!9570)))

(assert (= (and start!30596 res!163666) b!306890))

(assert (= (and b!306890 res!163665) b!306881))

(assert (= (and b!306881 res!163669) b!306886))

(assert (= (and b!306886 res!163671) b!306889))

(assert (= (and b!306889 res!163667) b!306892))

(assert (= (and b!306892 res!163662) b!306891))

(assert (= (and b!306891 res!163670) b!306888))

(assert (= (and b!306888 res!163668) b!306883))

(assert (= (and b!306883 res!163663) b!306887))

(assert (= (and b!306887 res!163664) b!306884))

(assert (= (and b!306884 c!49212) b!306882))

(assert (= (and b!306884 (not c!49212)) b!306893))

(assert (= (and b!306882 c!49211) b!306885))

(assert (= (and b!306882 (not c!49211)) b!306880))

(declare-fun m!317303 () Bool)

(assert (=> b!306883 m!317303))

(declare-fun m!317305 () Bool)

(assert (=> b!306891 m!317305))

(assert (=> b!306891 m!317305))

(declare-fun m!317307 () Bool)

(assert (=> b!306891 m!317307))

(declare-fun m!317309 () Bool)

(assert (=> b!306888 m!317309))

(declare-fun m!317311 () Bool)

(assert (=> b!306892 m!317311))

(declare-fun m!317313 () Bool)

(assert (=> b!306886 m!317313))

(declare-fun m!317315 () Bool)

(assert (=> b!306880 m!317315))

(assert (=> b!306880 m!317315))

(declare-fun m!317317 () Bool)

(assert (=> b!306880 m!317317))

(declare-fun m!317319 () Bool)

(assert (=> b!306889 m!317319))

(declare-fun m!317321 () Bool)

(assert (=> b!306887 m!317321))

(declare-fun m!317323 () Bool)

(assert (=> start!30596 m!317323))

(declare-fun m!317325 () Bool)

(assert (=> start!30596 m!317325))

(assert (=> b!306882 m!317321))

(declare-fun m!317327 () Bool)

(assert (=> b!306881 m!317327))

(push 1)

