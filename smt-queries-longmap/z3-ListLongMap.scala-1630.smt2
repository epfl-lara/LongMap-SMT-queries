; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30562 () Bool)

(assert start!30562)

(declare-fun b!306166 () Bool)

(declare-fun e!192084 () Bool)

(declare-fun e!192083 () Bool)

(assert (=> b!306166 (= e!192084 e!192083)))

(declare-fun res!163156 () Bool)

(assert (=> b!306166 (=> (not res!163156) (not e!192083))))

(declare-datatypes ((array!15566 0))(
  ( (array!15567 (arr!7368 (Array (_ BitVec 32) (_ BitVec 64))) (size!7720 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15566)

(declare-datatypes ((SeekEntryResult!2508 0))(
  ( (MissingZero!2508 (index!12208 (_ BitVec 32))) (Found!2508 (index!12209 (_ BitVec 32))) (Intermediate!2508 (undefined!3320 Bool) (index!12210 (_ BitVec 32)) (x!30463 (_ BitVec 32))) (Undefined!2508) (MissingVacant!2508 (index!12211 (_ BitVec 32))) )
))
(declare-fun lt!150906 () SeekEntryResult!2508)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15566 (_ BitVec 32)) SeekEntryResult!2508)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306166 (= res!163156 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150906))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306166 (= lt!150906 (Intermediate!2508 false resIndex!52 resX!52))))

(declare-fun b!306167 () Bool)

(declare-fun res!163161 () Bool)

(assert (=> b!306167 (=> (not res!163161) (not e!192084))))

(declare-fun arrayContainsKey!0 (array!15566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306167 (= res!163161 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306168 () Bool)

(declare-fun res!163159 () Bool)

(assert (=> b!306168 (=> (not res!163159) (not e!192083))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306168 (= res!163159 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150906))))

(declare-fun b!306169 () Bool)

(declare-fun res!163154 () Bool)

(assert (=> b!306169 (=> (not res!163154) (not e!192083))))

(assert (=> b!306169 (= res!163154 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7368 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun res!163155 () Bool)

(assert (=> start!30562 (=> (not res!163155) (not e!192084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30562 (= res!163155 (validMask!0 mask!3709))))

(assert (=> start!30562 e!192084))

(declare-fun array_inv!5331 (array!15566) Bool)

(assert (=> start!30562 (array_inv!5331 a!3293)))

(assert (=> start!30562 true))

(declare-fun b!306170 () Bool)

(declare-fun res!163158 () Bool)

(assert (=> b!306170 (=> (not res!163158) (not e!192084))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306170 (= res!163158 (and (= (size!7720 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7720 a!3293))))))

(declare-fun b!306171 () Bool)

(assert (=> b!306171 false))

(declare-fun lt!150905 () SeekEntryResult!2508)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306171 (= lt!150905 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9481 0))(
  ( (Unit!9482) )
))
(declare-fun e!192082 () Unit!9481)

(declare-fun Unit!9483 () Unit!9481)

(assert (=> b!306171 (= e!192082 Unit!9483)))

(declare-fun b!306172 () Bool)

(declare-fun res!163152 () Bool)

(assert (=> b!306172 (=> (not res!163152) (not e!192084))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15566 (_ BitVec 32)) SeekEntryResult!2508)

(assert (=> b!306172 (= res!163152 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2508 i!1240)))))

(declare-fun b!306173 () Bool)

(declare-fun res!163160 () Bool)

(assert (=> b!306173 (=> (not res!163160) (not e!192083))))

(assert (=> b!306173 (= res!163160 (and (= (select (arr!7368 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7720 a!3293))))))

(declare-fun b!306174 () Bool)

(declare-fun e!192081 () Unit!9481)

(declare-fun Unit!9484 () Unit!9481)

(assert (=> b!306174 (= e!192081 Unit!9484)))

(declare-fun b!306175 () Bool)

(assert (=> b!306175 false))

(declare-fun Unit!9485 () Unit!9481)

(assert (=> b!306175 (= e!192082 Unit!9485)))

(declare-fun b!306176 () Bool)

(assert (=> b!306176 (= e!192081 e!192082)))

(declare-fun c!49109 () Bool)

(assert (=> b!306176 (= c!49109 (or (= (select (arr!7368 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7368 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306177 () Bool)

(declare-fun res!163153 () Bool)

(assert (=> b!306177 (=> (not res!163153) (not e!192084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306177 (= res!163153 (validKeyInArray!0 k0!2441))))

(declare-fun b!306178 () Bool)

(declare-fun res!163157 () Bool)

(assert (=> b!306178 (=> (not res!163157) (not e!192084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15566 (_ BitVec 32)) Bool)

(assert (=> b!306178 (= res!163157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306179 () Bool)

(assert (=> b!306179 (= e!192083 (not true))))

(assert (=> b!306179 (= index!1781 resIndex!52)))

(declare-fun lt!150904 () Unit!9481)

(assert (=> b!306179 (= lt!150904 e!192081)))

(declare-fun c!49110 () Bool)

(assert (=> b!306179 (= c!49110 (not (= resIndex!52 index!1781)))))

(assert (= (and start!30562 res!163155) b!306170))

(assert (= (and b!306170 res!163158) b!306177))

(assert (= (and b!306177 res!163153) b!306167))

(assert (= (and b!306167 res!163161) b!306172))

(assert (= (and b!306172 res!163152) b!306178))

(assert (= (and b!306178 res!163157) b!306166))

(assert (= (and b!306166 res!163156) b!306173))

(assert (= (and b!306173 res!163160) b!306168))

(assert (= (and b!306168 res!163159) b!306169))

(assert (= (and b!306169 res!163154) b!306179))

(assert (= (and b!306179 c!49110) b!306176))

(assert (= (and b!306179 (not c!49110)) b!306174))

(assert (= (and b!306176 c!49109) b!306175))

(assert (= (and b!306176 (not c!49109)) b!306171))

(declare-fun m!316861 () Bool)

(assert (=> b!306166 m!316861))

(assert (=> b!306166 m!316861))

(declare-fun m!316863 () Bool)

(assert (=> b!306166 m!316863))

(declare-fun m!316865 () Bool)

(assert (=> start!30562 m!316865))

(declare-fun m!316867 () Bool)

(assert (=> start!30562 m!316867))

(declare-fun m!316869 () Bool)

(assert (=> b!306168 m!316869))

(declare-fun m!316871 () Bool)

(assert (=> b!306178 m!316871))

(declare-fun m!316873 () Bool)

(assert (=> b!306177 m!316873))

(declare-fun m!316875 () Bool)

(assert (=> b!306176 m!316875))

(declare-fun m!316877 () Bool)

(assert (=> b!306172 m!316877))

(declare-fun m!316879 () Bool)

(assert (=> b!306171 m!316879))

(assert (=> b!306171 m!316879))

(declare-fun m!316881 () Bool)

(assert (=> b!306171 m!316881))

(declare-fun m!316883 () Bool)

(assert (=> b!306173 m!316883))

(assert (=> b!306169 m!316875))

(declare-fun m!316885 () Bool)

(assert (=> b!306167 m!316885))

(check-sat (not b!306166) (not b!306177) (not b!306172) (not b!306178) (not b!306167) (not b!306171) (not start!30562) (not b!306168))
(check-sat)
