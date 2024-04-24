; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30552 () Bool)

(assert start!30552)

(declare-fun b!306197 () Bool)

(declare-datatypes ((Unit!9453 0))(
  ( (Unit!9454) )
))
(declare-fun e!192080 () Unit!9453)

(declare-fun e!192079 () Unit!9453)

(assert (=> b!306197 (= e!192080 e!192079)))

(declare-fun c!49097 () Bool)

(declare-datatypes ((array!15569 0))(
  ( (array!15570 (arr!7369 (Array (_ BitVec 32) (_ BitVec 64))) (size!7721 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15569)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306197 (= c!49097 (or (= (select (arr!7369 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7369 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306198 () Bool)

(declare-fun Unit!9455 () Unit!9453)

(assert (=> b!306198 (= e!192080 Unit!9455)))

(declare-fun b!306199 () Bool)

(assert (=> b!306199 false))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2474 0))(
  ( (MissingZero!2474 (index!12072 (_ BitVec 32))) (Found!2474 (index!12073 (_ BitVec 32))) (Intermediate!2474 (undefined!3286 Bool) (index!12074 (_ BitVec 32)) (x!30434 (_ BitVec 32))) (Undefined!2474) (MissingVacant!2474 (index!12075 (_ BitVec 32))) )
))
(declare-fun lt!150942 () SeekEntryResult!2474)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15569 (_ BitVec 32)) SeekEntryResult!2474)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306199 (= lt!150942 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9456 () Unit!9453)

(assert (=> b!306199 (= e!192079 Unit!9456)))

(declare-fun b!306200 () Bool)

(declare-fun res!163211 () Bool)

(declare-fun e!192077 () Bool)

(assert (=> b!306200 (=> (not res!163211) (not e!192077))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306200 (= res!163211 (and (= (size!7721 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7721 a!3293))))))

(declare-fun b!306201 () Bool)

(declare-fun res!163216 () Bool)

(assert (=> b!306201 (=> (not res!163216) (not e!192077))))

(declare-fun arrayContainsKey!0 (array!15569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306201 (= res!163216 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306202 () Bool)

(declare-fun e!192081 () Bool)

(assert (=> b!306202 (= e!192081 (not true))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306202 (= index!1781 resIndex!52)))

(declare-fun lt!150941 () Unit!9453)

(assert (=> b!306202 (= lt!150941 e!192080)))

(declare-fun c!49096 () Bool)

(assert (=> b!306202 (= c!49096 (not (= resIndex!52 index!1781)))))

(declare-fun b!306203 () Bool)

(assert (=> b!306203 false))

(declare-fun Unit!9457 () Unit!9453)

(assert (=> b!306203 (= e!192079 Unit!9457)))

(declare-fun b!306204 () Bool)

(declare-fun res!163214 () Bool)

(assert (=> b!306204 (=> (not res!163214) (not e!192077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15569 (_ BitVec 32)) Bool)

(assert (=> b!306204 (= res!163214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306205 () Bool)

(declare-fun res!163209 () Bool)

(assert (=> b!306205 (=> (not res!163209) (not e!192081))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306205 (= res!163209 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7369 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306206 () Bool)

(declare-fun res!163212 () Bool)

(assert (=> b!306206 (=> (not res!163212) (not e!192081))))

(assert (=> b!306206 (= res!163212 (and (= (select (arr!7369 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7721 a!3293))))))

(declare-fun b!306207 () Bool)

(declare-fun res!163215 () Bool)

(assert (=> b!306207 (=> (not res!163215) (not e!192077))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15569 (_ BitVec 32)) SeekEntryResult!2474)

(assert (=> b!306207 (= res!163215 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2474 i!1240)))))

(declare-fun b!306208 () Bool)

(declare-fun res!163218 () Bool)

(assert (=> b!306208 (=> (not res!163218) (not e!192081))))

(declare-fun lt!150940 () SeekEntryResult!2474)

(assert (=> b!306208 (= res!163218 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150940))))

(declare-fun res!163210 () Bool)

(assert (=> start!30552 (=> (not res!163210) (not e!192077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30552 (= res!163210 (validMask!0 mask!3709))))

(assert (=> start!30552 e!192077))

(declare-fun array_inv!5319 (array!15569) Bool)

(assert (=> start!30552 (array_inv!5319 a!3293)))

(assert (=> start!30552 true))

(declare-fun b!306209 () Bool)

(declare-fun res!163217 () Bool)

(assert (=> b!306209 (=> (not res!163217) (not e!192077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306209 (= res!163217 (validKeyInArray!0 k0!2441))))

(declare-fun b!306210 () Bool)

(assert (=> b!306210 (= e!192077 e!192081)))

(declare-fun res!163213 () Bool)

(assert (=> b!306210 (=> (not res!163213) (not e!192081))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306210 (= res!163213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150940))))

(assert (=> b!306210 (= lt!150940 (Intermediate!2474 false resIndex!52 resX!52))))

(assert (= (and start!30552 res!163210) b!306200))

(assert (= (and b!306200 res!163211) b!306209))

(assert (= (and b!306209 res!163217) b!306201))

(assert (= (and b!306201 res!163216) b!306207))

(assert (= (and b!306207 res!163215) b!306204))

(assert (= (and b!306204 res!163214) b!306210))

(assert (= (and b!306210 res!163213) b!306206))

(assert (= (and b!306206 res!163212) b!306208))

(assert (= (and b!306208 res!163218) b!306205))

(assert (= (and b!306205 res!163209) b!306202))

(assert (= (and b!306202 c!49096) b!306197))

(assert (= (and b!306202 (not c!49096)) b!306198))

(assert (= (and b!306197 c!49097) b!306203))

(assert (= (and b!306197 (not c!49097)) b!306199))

(declare-fun m!317035 () Bool)

(assert (=> b!306209 m!317035))

(declare-fun m!317037 () Bool)

(assert (=> b!306204 m!317037))

(declare-fun m!317039 () Bool)

(assert (=> b!306199 m!317039))

(assert (=> b!306199 m!317039))

(declare-fun m!317041 () Bool)

(assert (=> b!306199 m!317041))

(declare-fun m!317043 () Bool)

(assert (=> b!306201 m!317043))

(declare-fun m!317045 () Bool)

(assert (=> b!306207 m!317045))

(declare-fun m!317047 () Bool)

(assert (=> b!306210 m!317047))

(assert (=> b!306210 m!317047))

(declare-fun m!317049 () Bool)

(assert (=> b!306210 m!317049))

(declare-fun m!317051 () Bool)

(assert (=> b!306197 m!317051))

(declare-fun m!317053 () Bool)

(assert (=> b!306208 m!317053))

(declare-fun m!317055 () Bool)

(assert (=> b!306206 m!317055))

(assert (=> b!306205 m!317051))

(declare-fun m!317057 () Bool)

(assert (=> start!30552 m!317057))

(declare-fun m!317059 () Bool)

(assert (=> start!30552 m!317059))

(check-sat (not start!30552) (not b!306201) (not b!306207) (not b!306209) (not b!306204) (not b!306208) (not b!306210) (not b!306199))
(check-sat)
