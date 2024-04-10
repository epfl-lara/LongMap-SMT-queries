; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30570 () Bool)

(assert start!30570)

(declare-fun b!306334 () Bool)

(declare-fun res!163272 () Bool)

(declare-fun e!192145 () Bool)

(assert (=> b!306334 (=> (not res!163272) (not e!192145))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306334 (= res!163272 (validKeyInArray!0 k!2441))))

(declare-fun b!306335 () Bool)

(declare-fun res!163273 () Bool)

(declare-fun e!192143 () Bool)

(assert (=> b!306335 (=> (not res!163273) (not e!192143))))

(declare-datatypes ((array!15574 0))(
  ( (array!15575 (arr!7372 (Array (_ BitVec 32) (_ BitVec 64))) (size!7724 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15574)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306335 (= res!163273 (and (= (select (arr!7372 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7724 a!3293))))))

(declare-fun b!306336 () Bool)

(assert (=> b!306336 false))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2512 0))(
  ( (MissingZero!2512 (index!12224 (_ BitVec 32))) (Found!2512 (index!12225 (_ BitVec 32))) (Intermediate!2512 (undefined!3324 Bool) (index!12226 (_ BitVec 32)) (x!30475 (_ BitVec 32))) (Undefined!2512) (MissingVacant!2512 (index!12227 (_ BitVec 32))) )
))
(declare-fun lt!150941 () SeekEntryResult!2512)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15574 (_ BitVec 32)) SeekEntryResult!2512)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306336 (= lt!150941 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9501 0))(
  ( (Unit!9502) )
))
(declare-fun e!192142 () Unit!9501)

(declare-fun Unit!9503 () Unit!9501)

(assert (=> b!306336 (= e!192142 Unit!9503)))

(declare-fun b!306337 () Bool)

(assert (=> b!306337 (= e!192143 (not true))))

(assert (=> b!306337 (= index!1781 resIndex!52)))

(declare-fun lt!150940 () Unit!9501)

(declare-fun e!192141 () Unit!9501)

(assert (=> b!306337 (= lt!150940 e!192141)))

(declare-fun c!49133 () Bool)

(assert (=> b!306337 (= c!49133 (not (= resIndex!52 index!1781)))))

(declare-fun b!306338 () Bool)

(declare-fun res!163281 () Bool)

(assert (=> b!306338 (=> (not res!163281) (not e!192145))))

(declare-fun arrayContainsKey!0 (array!15574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306338 (= res!163281 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306339 () Bool)

(declare-fun res!163278 () Bool)

(assert (=> b!306339 (=> (not res!163278) (not e!192143))))

(assert (=> b!306339 (= res!163278 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7372 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306340 () Bool)

(assert (=> b!306340 false))

(declare-fun Unit!9504 () Unit!9501)

(assert (=> b!306340 (= e!192142 Unit!9504)))

(declare-fun res!163277 () Bool)

(assert (=> start!30570 (=> (not res!163277) (not e!192145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30570 (= res!163277 (validMask!0 mask!3709))))

(assert (=> start!30570 e!192145))

(declare-fun array_inv!5335 (array!15574) Bool)

(assert (=> start!30570 (array_inv!5335 a!3293)))

(assert (=> start!30570 true))

(declare-fun b!306341 () Bool)

(assert (=> b!306341 (= e!192141 e!192142)))

(declare-fun c!49134 () Bool)

(assert (=> b!306341 (= c!49134 (or (= (select (arr!7372 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7372 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306342 () Bool)

(declare-fun res!163280 () Bool)

(assert (=> b!306342 (=> (not res!163280) (not e!192145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15574 (_ BitVec 32)) Bool)

(assert (=> b!306342 (= res!163280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306343 () Bool)

(declare-fun res!163274 () Bool)

(assert (=> b!306343 (=> (not res!163274) (not e!192145))))

(assert (=> b!306343 (= res!163274 (and (= (size!7724 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7724 a!3293))))))

(declare-fun b!306344 () Bool)

(declare-fun Unit!9505 () Unit!9501)

(assert (=> b!306344 (= e!192141 Unit!9505)))

(declare-fun b!306345 () Bool)

(declare-fun res!163275 () Bool)

(assert (=> b!306345 (=> (not res!163275) (not e!192143))))

(declare-fun lt!150942 () SeekEntryResult!2512)

(assert (=> b!306345 (= res!163275 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150942))))

(declare-fun b!306346 () Bool)

(assert (=> b!306346 (= e!192145 e!192143)))

(declare-fun res!163279 () Bool)

(assert (=> b!306346 (=> (not res!163279) (not e!192143))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306346 (= res!163279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150942))))

(assert (=> b!306346 (= lt!150942 (Intermediate!2512 false resIndex!52 resX!52))))

(declare-fun b!306347 () Bool)

(declare-fun res!163276 () Bool)

(assert (=> b!306347 (=> (not res!163276) (not e!192145))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15574 (_ BitVec 32)) SeekEntryResult!2512)

(assert (=> b!306347 (= res!163276 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2512 i!1240)))))

(assert (= (and start!30570 res!163277) b!306343))

(assert (= (and b!306343 res!163274) b!306334))

(assert (= (and b!306334 res!163272) b!306338))

(assert (= (and b!306338 res!163281) b!306347))

(assert (= (and b!306347 res!163276) b!306342))

(assert (= (and b!306342 res!163280) b!306346))

(assert (= (and b!306346 res!163279) b!306335))

(assert (= (and b!306335 res!163273) b!306345))

(assert (= (and b!306345 res!163275) b!306339))

(assert (= (and b!306339 res!163278) b!306337))

(assert (= (and b!306337 c!49133) b!306341))

(assert (= (and b!306337 (not c!49133)) b!306344))

(assert (= (and b!306341 c!49134) b!306340))

(assert (= (and b!306341 (not c!49134)) b!306336))

(declare-fun m!316965 () Bool)

(assert (=> b!306334 m!316965))

(declare-fun m!316967 () Bool)

(assert (=> b!306342 m!316967))

(declare-fun m!316969 () Bool)

(assert (=> b!306345 m!316969))

(declare-fun m!316971 () Bool)

(assert (=> b!306336 m!316971))

(assert (=> b!306336 m!316971))

(declare-fun m!316973 () Bool)

(assert (=> b!306336 m!316973))

(declare-fun m!316975 () Bool)

(assert (=> b!306347 m!316975))

(declare-fun m!316977 () Bool)

(assert (=> b!306339 m!316977))

(declare-fun m!316979 () Bool)

(assert (=> b!306338 m!316979))

(declare-fun m!316981 () Bool)

(assert (=> b!306346 m!316981))

(assert (=> b!306346 m!316981))

(declare-fun m!316983 () Bool)

(assert (=> b!306346 m!316983))

(assert (=> b!306341 m!316977))

(declare-fun m!316985 () Bool)

(assert (=> b!306335 m!316985))

(declare-fun m!316987 () Bool)

(assert (=> start!30570 m!316987))

(declare-fun m!316989 () Bool)

(assert (=> start!30570 m!316989))

(push 1)

