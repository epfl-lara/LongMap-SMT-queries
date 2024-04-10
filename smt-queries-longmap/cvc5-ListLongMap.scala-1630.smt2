; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30560 () Bool)

(assert start!30560)

(declare-fun b!306124 () Bool)

(declare-fun res!163128 () Bool)

(declare-fun e!192067 () Bool)

(assert (=> b!306124 (=> (not res!163128) (not e!192067))))

(declare-datatypes ((array!15564 0))(
  ( (array!15565 (arr!7367 (Array (_ BitVec 32) (_ BitVec 64))) (size!7719 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15564)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306124 (= res!163128 (and (= (size!7719 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7719 a!3293))))))

(declare-fun b!306125 () Bool)

(declare-fun res!163130 () Bool)

(declare-fun e!192066 () Bool)

(assert (=> b!306125 (=> (not res!163130) (not e!192066))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!306125 (= res!163130 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7367 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306126 () Bool)

(declare-fun res!163131 () Bool)

(assert (=> b!306126 (=> (not res!163131) (not e!192066))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306126 (= res!163131 (and (= (select (arr!7367 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7719 a!3293))))))

(declare-fun b!306127 () Bool)

(assert (=> b!306127 (= e!192066 (not true))))

(assert (=> b!306127 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9476 0))(
  ( (Unit!9477) )
))
(declare-fun lt!150896 () Unit!9476)

(declare-fun e!192070 () Unit!9476)

(assert (=> b!306127 (= lt!150896 e!192070)))

(declare-fun c!49103 () Bool)

(assert (=> b!306127 (= c!49103 (not (= resIndex!52 index!1781)))))

(declare-fun b!306128 () Bool)

(declare-fun e!192069 () Unit!9476)

(assert (=> b!306128 (= e!192070 e!192069)))

(declare-fun c!49104 () Bool)

(assert (=> b!306128 (= c!49104 (or (= (select (arr!7367 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7367 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306129 () Bool)

(declare-fun res!163127 () Bool)

(assert (=> b!306129 (=> (not res!163127) (not e!192067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15564 (_ BitVec 32)) Bool)

(assert (=> b!306129 (= res!163127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306130 () Bool)

(assert (=> b!306130 false))

(declare-datatypes ((SeekEntryResult!2507 0))(
  ( (MissingZero!2507 (index!12204 (_ BitVec 32))) (Found!2507 (index!12205 (_ BitVec 32))) (Intermediate!2507 (undefined!3319 Bool) (index!12206 (_ BitVec 32)) (x!30462 (_ BitVec 32))) (Undefined!2507) (MissingVacant!2507 (index!12207 (_ BitVec 32))) )
))
(declare-fun lt!150895 () SeekEntryResult!2507)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15564 (_ BitVec 32)) SeekEntryResult!2507)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306130 (= lt!150895 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9478 () Unit!9476)

(assert (=> b!306130 (= e!192069 Unit!9478)))

(declare-fun b!306131 () Bool)

(assert (=> b!306131 false))

(declare-fun Unit!9479 () Unit!9476)

(assert (=> b!306131 (= e!192069 Unit!9479)))

(declare-fun b!306132 () Bool)

(declare-fun res!163125 () Bool)

(assert (=> b!306132 (=> (not res!163125) (not e!192067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306132 (= res!163125 (validKeyInArray!0 k!2441))))

(declare-fun res!163123 () Bool)

(assert (=> start!30560 (=> (not res!163123) (not e!192067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30560 (= res!163123 (validMask!0 mask!3709))))

(assert (=> start!30560 e!192067))

(declare-fun array_inv!5330 (array!15564) Bool)

(assert (=> start!30560 (array_inv!5330 a!3293)))

(assert (=> start!30560 true))

(declare-fun b!306133 () Bool)

(declare-fun Unit!9480 () Unit!9476)

(assert (=> b!306133 (= e!192070 Unit!9480)))

(declare-fun b!306134 () Bool)

(declare-fun res!163126 () Bool)

(assert (=> b!306134 (=> (not res!163126) (not e!192066))))

(declare-fun lt!150897 () SeekEntryResult!2507)

(assert (=> b!306134 (= res!163126 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150897))))

(declare-fun b!306135 () Bool)

(assert (=> b!306135 (= e!192067 e!192066)))

(declare-fun res!163122 () Bool)

(assert (=> b!306135 (=> (not res!163122) (not e!192066))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306135 (= res!163122 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150897))))

(assert (=> b!306135 (= lt!150897 (Intermediate!2507 false resIndex!52 resX!52))))

(declare-fun b!306136 () Bool)

(declare-fun res!163124 () Bool)

(assert (=> b!306136 (=> (not res!163124) (not e!192067))))

(declare-fun arrayContainsKey!0 (array!15564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306136 (= res!163124 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306137 () Bool)

(declare-fun res!163129 () Bool)

(assert (=> b!306137 (=> (not res!163129) (not e!192067))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15564 (_ BitVec 32)) SeekEntryResult!2507)

(assert (=> b!306137 (= res!163129 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2507 i!1240)))))

(assert (= (and start!30560 res!163123) b!306124))

(assert (= (and b!306124 res!163128) b!306132))

(assert (= (and b!306132 res!163125) b!306136))

(assert (= (and b!306136 res!163124) b!306137))

(assert (= (and b!306137 res!163129) b!306129))

(assert (= (and b!306129 res!163127) b!306135))

(assert (= (and b!306135 res!163122) b!306126))

(assert (= (and b!306126 res!163131) b!306134))

(assert (= (and b!306134 res!163126) b!306125))

(assert (= (and b!306125 res!163130) b!306127))

(assert (= (and b!306127 c!49103) b!306128))

(assert (= (and b!306127 (not c!49103)) b!306133))

(assert (= (and b!306128 c!49104) b!306131))

(assert (= (and b!306128 (not c!49104)) b!306130))

(declare-fun m!316835 () Bool)

(assert (=> b!306132 m!316835))

(declare-fun m!316837 () Bool)

(assert (=> b!306135 m!316837))

(assert (=> b!306135 m!316837))

(declare-fun m!316839 () Bool)

(assert (=> b!306135 m!316839))

(declare-fun m!316841 () Bool)

(assert (=> b!306136 m!316841))

(declare-fun m!316843 () Bool)

(assert (=> b!306125 m!316843))

(declare-fun m!316845 () Bool)

(assert (=> b!306134 m!316845))

(declare-fun m!316847 () Bool)

(assert (=> b!306129 m!316847))

(declare-fun m!316849 () Bool)

(assert (=> b!306130 m!316849))

(assert (=> b!306130 m!316849))

(declare-fun m!316851 () Bool)

(assert (=> b!306130 m!316851))

(declare-fun m!316853 () Bool)

(assert (=> b!306126 m!316853))

(declare-fun m!316855 () Bool)

(assert (=> b!306137 m!316855))

(declare-fun m!316857 () Bool)

(assert (=> start!30560 m!316857))

(declare-fun m!316859 () Bool)

(assert (=> start!30560 m!316859))

(assert (=> b!306128 m!316843))

(push 1)

