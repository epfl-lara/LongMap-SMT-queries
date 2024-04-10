; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30568 () Bool)

(assert start!30568)

(declare-fun b!306292 () Bool)

(assert (=> b!306292 false))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2511 0))(
  ( (MissingZero!2511 (index!12220 (_ BitVec 32))) (Found!2511 (index!12221 (_ BitVec 32))) (Intermediate!2511 (undefined!3323 Bool) (index!12222 (_ BitVec 32)) (x!30474 (_ BitVec 32))) (Undefined!2511) (MissingVacant!2511 (index!12223 (_ BitVec 32))) )
))
(declare-fun lt!150932 () SeekEntryResult!2511)

(declare-datatypes ((array!15572 0))(
  ( (array!15573 (arr!7371 (Array (_ BitVec 32) (_ BitVec 64))) (size!7723 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15572)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15572 (_ BitVec 32)) SeekEntryResult!2511)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306292 (= lt!150932 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9496 0))(
  ( (Unit!9497) )
))
(declare-fun e!192129 () Unit!9496)

(declare-fun Unit!9498 () Unit!9496)

(assert (=> b!306292 (= e!192129 Unit!9498)))

(declare-fun b!306294 () Bool)

(assert (=> b!306294 false))

(declare-fun Unit!9499 () Unit!9496)

(assert (=> b!306294 (= e!192129 Unit!9499)))

(declare-fun b!306295 () Bool)

(declare-fun e!192128 () Unit!9496)

(assert (=> b!306295 (= e!192128 e!192129)))

(declare-fun c!49128 () Bool)

(assert (=> b!306295 (= c!49128 (or (= (select (arr!7371 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7371 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306296 () Bool)

(declare-fun res!163242 () Bool)

(declare-fun e!192127 () Bool)

(assert (=> b!306296 (=> (not res!163242) (not e!192127))))

(declare-fun arrayContainsKey!0 (array!15572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306296 (= res!163242 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306297 () Bool)

(declare-fun res!163247 () Bool)

(assert (=> b!306297 (=> (not res!163247) (not e!192127))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15572 (_ BitVec 32)) SeekEntryResult!2511)

(assert (=> b!306297 (= res!163247 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2511 i!1240)))))

(declare-fun b!306298 () Bool)

(declare-fun e!192130 () Bool)

(assert (=> b!306298 (= e!192130 (not true))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306298 (= index!1781 resIndex!52)))

(declare-fun lt!150931 () Unit!9496)

(assert (=> b!306298 (= lt!150931 e!192128)))

(declare-fun c!49127 () Bool)

(assert (=> b!306298 (= c!49127 (not (= resIndex!52 index!1781)))))

(declare-fun b!306293 () Bool)

(declare-fun res!163248 () Bool)

(assert (=> b!306293 (=> (not res!163248) (not e!192127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15572 (_ BitVec 32)) Bool)

(assert (=> b!306293 (= res!163248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!163251 () Bool)

(assert (=> start!30568 (=> (not res!163251) (not e!192127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30568 (= res!163251 (validMask!0 mask!3709))))

(assert (=> start!30568 e!192127))

(declare-fun array_inv!5334 (array!15572) Bool)

(assert (=> start!30568 (array_inv!5334 a!3293)))

(assert (=> start!30568 true))

(declare-fun b!306299 () Bool)

(declare-fun Unit!9500 () Unit!9496)

(assert (=> b!306299 (= e!192128 Unit!9500)))

(declare-fun b!306300 () Bool)

(declare-fun res!163246 () Bool)

(assert (=> b!306300 (=> (not res!163246) (not e!192130))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306300 (= res!163246 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7371 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306301 () Bool)

(declare-fun res!163244 () Bool)

(assert (=> b!306301 (=> (not res!163244) (not e!192127))))

(assert (=> b!306301 (= res!163244 (and (= (size!7723 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7723 a!3293))))))

(declare-fun b!306302 () Bool)

(declare-fun res!163250 () Bool)

(assert (=> b!306302 (=> (not res!163250) (not e!192130))))

(declare-fun lt!150933 () SeekEntryResult!2511)

(assert (=> b!306302 (= res!163250 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150933))))

(declare-fun b!306303 () Bool)

(assert (=> b!306303 (= e!192127 e!192130)))

(declare-fun res!163245 () Bool)

(assert (=> b!306303 (=> (not res!163245) (not e!192130))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306303 (= res!163245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150933))))

(assert (=> b!306303 (= lt!150933 (Intermediate!2511 false resIndex!52 resX!52))))

(declare-fun b!306304 () Bool)

(declare-fun res!163249 () Bool)

(assert (=> b!306304 (=> (not res!163249) (not e!192130))))

(assert (=> b!306304 (= res!163249 (and (= (select (arr!7371 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7723 a!3293))))))

(declare-fun b!306305 () Bool)

(declare-fun res!163243 () Bool)

(assert (=> b!306305 (=> (not res!163243) (not e!192127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306305 (= res!163243 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30568 res!163251) b!306301))

(assert (= (and b!306301 res!163244) b!306305))

(assert (= (and b!306305 res!163243) b!306296))

(assert (= (and b!306296 res!163242) b!306297))

(assert (= (and b!306297 res!163247) b!306293))

(assert (= (and b!306293 res!163248) b!306303))

(assert (= (and b!306303 res!163245) b!306304))

(assert (= (and b!306304 res!163249) b!306302))

(assert (= (and b!306302 res!163250) b!306300))

(assert (= (and b!306300 res!163246) b!306298))

(assert (= (and b!306298 c!49127) b!306295))

(assert (= (and b!306298 (not c!49127)) b!306299))

(assert (= (and b!306295 c!49128) b!306294))

(assert (= (and b!306295 (not c!49128)) b!306292))

(declare-fun m!316939 () Bool)

(assert (=> b!306292 m!316939))

(assert (=> b!306292 m!316939))

(declare-fun m!316941 () Bool)

(assert (=> b!306292 m!316941))

(declare-fun m!316943 () Bool)

(assert (=> b!306302 m!316943))

(declare-fun m!316945 () Bool)

(assert (=> b!306293 m!316945))

(declare-fun m!316947 () Bool)

(assert (=> b!306295 m!316947))

(declare-fun m!316949 () Bool)

(assert (=> start!30568 m!316949))

(declare-fun m!316951 () Bool)

(assert (=> start!30568 m!316951))

(declare-fun m!316953 () Bool)

(assert (=> b!306303 m!316953))

(assert (=> b!306303 m!316953))

(declare-fun m!316955 () Bool)

(assert (=> b!306303 m!316955))

(declare-fun m!316957 () Bool)

(assert (=> b!306296 m!316957))

(assert (=> b!306300 m!316947))

(declare-fun m!316959 () Bool)

(assert (=> b!306297 m!316959))

(declare-fun m!316961 () Bool)

(assert (=> b!306305 m!316961))

(declare-fun m!316963 () Bool)

(assert (=> b!306304 m!316963))

(check-sat (not b!306303) (not b!306305) (not start!30568) (not b!306297) (not b!306293) (not b!306302) (not b!306296) (not b!306292))
(check-sat)
