; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30954 () Bool)

(assert start!30954)

(declare-fun b!310847 () Bool)

(declare-fun res!167310 () Bool)

(declare-fun e!194024 () Bool)

(assert (=> b!310847 (=> (not res!167310) (not e!194024))))

(declare-datatypes ((array!15856 0))(
  ( (array!15857 (arr!7510 (Array (_ BitVec 32) (_ BitVec 64))) (size!7862 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15856)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310847 (= res!167310 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310848 () Bool)

(declare-fun res!167303 () Bool)

(assert (=> b!310848 (=> (not res!167303) (not e!194024))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2650 0))(
  ( (MissingZero!2650 (index!12776 (_ BitVec 32))) (Found!2650 (index!12777 (_ BitVec 32))) (Intermediate!2650 (undefined!3462 Bool) (index!12778 (_ BitVec 32)) (x!30999 (_ BitVec 32))) (Undefined!2650) (MissingVacant!2650 (index!12779 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15856 (_ BitVec 32)) SeekEntryResult!2650)

(assert (=> b!310848 (= res!167303 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2650 i!1240)))))

(declare-fun b!310849 () Bool)

(declare-fun res!167305 () Bool)

(declare-fun e!194026 () Bool)

(assert (=> b!310849 (=> (not res!167305) (not e!194026))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310849 (= res!167305 (and (= (select (arr!7510 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7862 a!3293))))))

(declare-fun res!167304 () Bool)

(assert (=> start!30954 (=> (not res!167304) (not e!194024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30954 (= res!167304 (validMask!0 mask!3709))))

(assert (=> start!30954 e!194024))

(declare-fun array_inv!5473 (array!15856) Bool)

(assert (=> start!30954 (array_inv!5473 a!3293)))

(assert (=> start!30954 true))

(declare-fun b!310850 () Bool)

(declare-fun res!167301 () Bool)

(assert (=> b!310850 (=> (not res!167301) (not e!194024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310850 (= res!167301 (validKeyInArray!0 k!2441))))

(declare-fun b!310851 () Bool)

(declare-fun res!167307 () Bool)

(assert (=> b!310851 (=> (not res!167307) (not e!194024))))

(assert (=> b!310851 (= res!167307 (and (= (size!7862 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7862 a!3293))))))

(declare-fun b!310852 () Bool)

(declare-fun e!194025 () Bool)

(assert (=> b!310852 (= e!194026 e!194025)))

(declare-fun res!167306 () Bool)

(assert (=> b!310852 (=> (not res!167306) (not e!194025))))

(declare-fun lt!152118 () SeekEntryResult!2650)

(declare-fun lt!152119 () SeekEntryResult!2650)

(assert (=> b!310852 (= res!167306 (and (= lt!152118 lt!152119) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7510 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15856 (_ BitVec 32)) SeekEntryResult!2650)

(assert (=> b!310852 (= lt!152118 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310853 () Bool)

(assert (=> b!310853 (= e!194025 (not true))))

(declare-fun e!194023 () Bool)

(assert (=> b!310853 e!194023))

(declare-fun res!167308 () Bool)

(assert (=> b!310853 (=> (not res!167308) (not e!194023))))

(declare-fun lt!152121 () (_ BitVec 32))

(assert (=> b!310853 (= res!167308 (= lt!152118 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152121 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310853 (= lt!152121 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310854 () Bool)

(assert (=> b!310854 (= e!194024 e!194026)))

(declare-fun res!167309 () Bool)

(assert (=> b!310854 (=> (not res!167309) (not e!194026))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310854 (= res!167309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152119))))

(assert (=> b!310854 (= lt!152119 (Intermediate!2650 false resIndex!52 resX!52))))

(declare-fun b!310855 () Bool)

(declare-fun lt!152120 () array!15856)

(assert (=> b!310855 (= e!194023 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152120 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152121 k!2441 lt!152120 mask!3709)))))

(assert (=> b!310855 (= lt!152120 (array!15857 (store (arr!7510 a!3293) i!1240 k!2441) (size!7862 a!3293)))))

(declare-fun b!310856 () Bool)

(declare-fun res!167302 () Bool)

(assert (=> b!310856 (=> (not res!167302) (not e!194024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15856 (_ BitVec 32)) Bool)

(assert (=> b!310856 (= res!167302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30954 res!167304) b!310851))

(assert (= (and b!310851 res!167307) b!310850))

(assert (= (and b!310850 res!167301) b!310847))

(assert (= (and b!310847 res!167310) b!310848))

(assert (= (and b!310848 res!167303) b!310856))

(assert (= (and b!310856 res!167302) b!310854))

(assert (= (and b!310854 res!167309) b!310849))

(assert (= (and b!310849 res!167305) b!310852))

(assert (= (and b!310852 res!167306) b!310853))

(assert (= (and b!310853 res!167308) b!310855))

(declare-fun m!320781 () Bool)

(assert (=> b!310848 m!320781))

(declare-fun m!320783 () Bool)

(assert (=> start!30954 m!320783))

(declare-fun m!320785 () Bool)

(assert (=> start!30954 m!320785))

(declare-fun m!320787 () Bool)

(assert (=> b!310852 m!320787))

(declare-fun m!320789 () Bool)

(assert (=> b!310852 m!320789))

(declare-fun m!320791 () Bool)

(assert (=> b!310854 m!320791))

(assert (=> b!310854 m!320791))

(declare-fun m!320793 () Bool)

(assert (=> b!310854 m!320793))

(declare-fun m!320795 () Bool)

(assert (=> b!310847 m!320795))

(declare-fun m!320797 () Bool)

(assert (=> b!310855 m!320797))

(declare-fun m!320799 () Bool)

(assert (=> b!310855 m!320799))

(declare-fun m!320801 () Bool)

(assert (=> b!310855 m!320801))

(declare-fun m!320803 () Bool)

(assert (=> b!310850 m!320803))

(declare-fun m!320805 () Bool)

(assert (=> b!310853 m!320805))

(declare-fun m!320807 () Bool)

(assert (=> b!310853 m!320807))

(declare-fun m!320809 () Bool)

(assert (=> b!310849 m!320809))

(declare-fun m!320811 () Bool)

(assert (=> b!310856 m!320811))

(push 1)

(assert (not start!30954))

