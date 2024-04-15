; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30552 () Bool)

(assert start!30552)

(declare-fun b!305975 () Bool)

(assert (=> b!305975 false))

(declare-datatypes ((Unit!9451 0))(
  ( (Unit!9452) )
))
(declare-fun e!191938 () Unit!9451)

(declare-fun Unit!9453 () Unit!9451)

(assert (=> b!305975 (= e!191938 Unit!9453)))

(declare-fun b!305976 () Bool)

(declare-fun res!163089 () Bool)

(declare-fun e!191937 () Bool)

(assert (=> b!305976 (=> (not res!163089) (not e!191937))))

(declare-datatypes ((array!15560 0))(
  ( (array!15561 (arr!7365 (Array (_ BitVec 32) (_ BitVec 64))) (size!7718 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15560)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305976 (= res!163089 (and (= (select (arr!7365 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7718 a!3293))))))

(declare-fun b!305977 () Bool)

(declare-fun res!163084 () Bool)

(declare-fun e!191939 () Bool)

(assert (=> b!305977 (=> (not res!163084) (not e!191939))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305977 (= res!163084 (validKeyInArray!0 k0!2441))))

(declare-fun b!305978 () Bool)

(declare-fun res!163091 () Bool)

(assert (=> b!305978 (=> (not res!163091) (not e!191937))))

(assert (=> b!305978 (= res!163091 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7365 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun res!163086 () Bool)

(assert (=> start!30552 (=> (not res!163086) (not e!191939))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30552 (= res!163086 (validMask!0 mask!3709))))

(assert (=> start!30552 e!191939))

(declare-fun array_inv!5337 (array!15560) Bool)

(assert (=> start!30552 (array_inv!5337 a!3293)))

(assert (=> start!30552 true))

(declare-fun b!305979 () Bool)

(assert (=> b!305979 (= e!191937 (not true))))

(assert (=> b!305979 (= index!1781 resIndex!52)))

(declare-fun lt!150688 () Unit!9451)

(declare-fun e!191935 () Unit!9451)

(assert (=> b!305979 (= lt!150688 e!191935)))

(declare-fun c!49048 () Bool)

(assert (=> b!305979 (= c!49048 (not (= resIndex!52 index!1781)))))

(declare-fun b!305980 () Bool)

(declare-fun res!163092 () Bool)

(assert (=> b!305980 (=> (not res!163092) (not e!191939))))

(assert (=> b!305980 (= res!163092 (and (= (size!7718 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7718 a!3293))))))

(declare-fun b!305981 () Bool)

(declare-fun res!163085 () Bool)

(assert (=> b!305981 (=> (not res!163085) (not e!191939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15560 (_ BitVec 32)) Bool)

(assert (=> b!305981 (= res!163085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305982 () Bool)

(assert (=> b!305982 (= e!191935 e!191938)))

(declare-fun c!49049 () Bool)

(assert (=> b!305982 (= c!49049 (or (= (select (arr!7365 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7365 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305983 () Bool)

(declare-fun Unit!9454 () Unit!9451)

(assert (=> b!305983 (= e!191935 Unit!9454)))

(declare-fun b!305984 () Bool)

(assert (=> b!305984 (= e!191939 e!191937)))

(declare-fun res!163090 () Bool)

(assert (=> b!305984 (=> (not res!163090) (not e!191937))))

(declare-datatypes ((SeekEntryResult!2504 0))(
  ( (MissingZero!2504 (index!12192 (_ BitVec 32))) (Found!2504 (index!12193 (_ BitVec 32))) (Intermediate!2504 (undefined!3316 Bool) (index!12194 (_ BitVec 32)) (x!30462 (_ BitVec 32))) (Undefined!2504) (MissingVacant!2504 (index!12195 (_ BitVec 32))) )
))
(declare-fun lt!150689 () SeekEntryResult!2504)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15560 (_ BitVec 32)) SeekEntryResult!2504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305984 (= res!163090 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150689))))

(assert (=> b!305984 (= lt!150689 (Intermediate!2504 false resIndex!52 resX!52))))

(declare-fun b!305985 () Bool)

(declare-fun res!163087 () Bool)

(assert (=> b!305985 (=> (not res!163087) (not e!191939))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15560 (_ BitVec 32)) SeekEntryResult!2504)

(assert (=> b!305985 (= res!163087 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2504 i!1240)))))

(declare-fun b!305986 () Bool)

(declare-fun res!163083 () Bool)

(assert (=> b!305986 (=> (not res!163083) (not e!191939))))

(declare-fun arrayContainsKey!0 (array!15560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305986 (= res!163083 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305987 () Bool)

(declare-fun res!163088 () Bool)

(assert (=> b!305987 (=> (not res!163088) (not e!191937))))

(assert (=> b!305987 (= res!163088 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150689))))

(declare-fun b!305988 () Bool)

(assert (=> b!305988 false))

(declare-fun lt!150687 () SeekEntryResult!2504)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305988 (= lt!150687 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9455 () Unit!9451)

(assert (=> b!305988 (= e!191938 Unit!9455)))

(assert (= (and start!30552 res!163086) b!305980))

(assert (= (and b!305980 res!163092) b!305977))

(assert (= (and b!305977 res!163084) b!305986))

(assert (= (and b!305986 res!163083) b!305985))

(assert (= (and b!305985 res!163087) b!305981))

(assert (= (and b!305981 res!163085) b!305984))

(assert (= (and b!305984 res!163090) b!305976))

(assert (= (and b!305976 res!163089) b!305987))

(assert (= (and b!305987 res!163088) b!305978))

(assert (= (and b!305978 res!163091) b!305979))

(assert (= (and b!305979 c!49048) b!305982))

(assert (= (and b!305979 (not c!49048)) b!305983))

(assert (= (and b!305982 c!49049) b!305975))

(assert (= (and b!305982 (not c!49049)) b!305988))

(declare-fun m!316183 () Bool)

(assert (=> b!305985 m!316183))

(declare-fun m!316185 () Bool)

(assert (=> b!305987 m!316185))

(declare-fun m!316187 () Bool)

(assert (=> start!30552 m!316187))

(declare-fun m!316189 () Bool)

(assert (=> start!30552 m!316189))

(declare-fun m!316191 () Bool)

(assert (=> b!305984 m!316191))

(assert (=> b!305984 m!316191))

(declare-fun m!316193 () Bool)

(assert (=> b!305984 m!316193))

(declare-fun m!316195 () Bool)

(assert (=> b!305981 m!316195))

(declare-fun m!316197 () Bool)

(assert (=> b!305988 m!316197))

(assert (=> b!305988 m!316197))

(declare-fun m!316199 () Bool)

(assert (=> b!305988 m!316199))

(declare-fun m!316201 () Bool)

(assert (=> b!305986 m!316201))

(declare-fun m!316203 () Bool)

(assert (=> b!305982 m!316203))

(declare-fun m!316205 () Bool)

(assert (=> b!305976 m!316205))

(declare-fun m!316207 () Bool)

(assert (=> b!305977 m!316207))

(assert (=> b!305978 m!316203))

(check-sat (not b!305984) (not b!305988) (not b!305987) (not b!305981) (not b!305986) (not b!305977) (not start!30552) (not b!305985))
(check-sat)
