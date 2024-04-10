; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30572 () Bool)

(assert start!30572)

(declare-fun b!306376 () Bool)

(declare-datatypes ((Unit!9506 0))(
  ( (Unit!9507) )
))
(declare-fun e!192160 () Unit!9506)

(declare-fun Unit!9508 () Unit!9506)

(assert (=> b!306376 (= e!192160 Unit!9508)))

(declare-fun b!306377 () Bool)

(declare-fun res!163310 () Bool)

(declare-fun e!192156 () Bool)

(assert (=> b!306377 (=> (not res!163310) (not e!192156))))

(declare-datatypes ((array!15576 0))(
  ( (array!15577 (arr!7373 (Array (_ BitVec 32) (_ BitVec 64))) (size!7725 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15576)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2513 0))(
  ( (MissingZero!2513 (index!12228 (_ BitVec 32))) (Found!2513 (index!12229 (_ BitVec 32))) (Intermediate!2513 (undefined!3325 Bool) (index!12230 (_ BitVec 32)) (x!30484 (_ BitVec 32))) (Undefined!2513) (MissingVacant!2513 (index!12231 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15576 (_ BitVec 32)) SeekEntryResult!2513)

(assert (=> b!306377 (= res!163310 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2513 i!1240)))))

(declare-fun e!192158 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!306378 () Bool)

(assert (=> b!306378 (= e!192158 (not (or (not (= (select (arr!7373 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306378 (= index!1781 resIndex!52)))

(declare-fun lt!150951 () Unit!9506)

(assert (=> b!306378 (= lt!150951 e!192160)))

(declare-fun c!49139 () Bool)

(assert (=> b!306378 (= c!49139 (not (= resIndex!52 index!1781)))))

(declare-fun res!163306 () Bool)

(assert (=> start!30572 (=> (not res!163306) (not e!192156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30572 (= res!163306 (validMask!0 mask!3709))))

(assert (=> start!30572 e!192156))

(declare-fun array_inv!5336 (array!15576) Bool)

(assert (=> start!30572 (array_inv!5336 a!3293)))

(assert (=> start!30572 true))

(declare-fun b!306379 () Bool)

(declare-fun res!163307 () Bool)

(assert (=> b!306379 (=> (not res!163307) (not e!192158))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!150949 () SeekEntryResult!2513)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15576 (_ BitVec 32)) SeekEntryResult!2513)

(assert (=> b!306379 (= res!163307 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150949))))

(declare-fun b!306380 () Bool)

(assert (=> b!306380 false))

(declare-fun e!192159 () Unit!9506)

(declare-fun Unit!9509 () Unit!9506)

(assert (=> b!306380 (= e!192159 Unit!9509)))

(declare-fun b!306381 () Bool)

(assert (=> b!306381 (= e!192156 e!192158)))

(declare-fun res!163309 () Bool)

(assert (=> b!306381 (=> (not res!163309) (not e!192158))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306381 (= res!163309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150949))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306381 (= lt!150949 (Intermediate!2513 false resIndex!52 resX!52))))

(declare-fun b!306382 () Bool)

(declare-fun res!163304 () Bool)

(assert (=> b!306382 (=> (not res!163304) (not e!192156))))

(declare-fun arrayContainsKey!0 (array!15576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306382 (= res!163304 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306383 () Bool)

(assert (=> b!306383 (= e!192160 e!192159)))

(declare-fun c!49140 () Bool)

(assert (=> b!306383 (= c!49140 (or (= (select (arr!7373 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7373 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306384 () Bool)

(declare-fun res!163305 () Bool)

(assert (=> b!306384 (=> (not res!163305) (not e!192156))))

(assert (=> b!306384 (= res!163305 (and (= (size!7725 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7725 a!3293))))))

(declare-fun b!306385 () Bool)

(declare-fun res!163308 () Bool)

(assert (=> b!306385 (=> (not res!163308) (not e!192156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15576 (_ BitVec 32)) Bool)

(assert (=> b!306385 (= res!163308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306386 () Bool)

(assert (=> b!306386 false))

(declare-fun lt!150950 () SeekEntryResult!2513)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306386 (= lt!150950 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9510 () Unit!9506)

(assert (=> b!306386 (= e!192159 Unit!9510)))

(declare-fun b!306387 () Bool)

(declare-fun res!163302 () Bool)

(assert (=> b!306387 (=> (not res!163302) (not e!192156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306387 (= res!163302 (validKeyInArray!0 k!2441))))

(declare-fun b!306388 () Bool)

(declare-fun res!163311 () Bool)

(assert (=> b!306388 (=> (not res!163311) (not e!192158))))

(assert (=> b!306388 (= res!163311 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7373 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306389 () Bool)

(declare-fun res!163303 () Bool)

(assert (=> b!306389 (=> (not res!163303) (not e!192158))))

(assert (=> b!306389 (= res!163303 (and (= (select (arr!7373 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7725 a!3293))))))

(assert (= (and start!30572 res!163306) b!306384))

(assert (= (and b!306384 res!163305) b!306387))

(assert (= (and b!306387 res!163302) b!306382))

(assert (= (and b!306382 res!163304) b!306377))

(assert (= (and b!306377 res!163310) b!306385))

(assert (= (and b!306385 res!163308) b!306381))

(assert (= (and b!306381 res!163309) b!306389))

(assert (= (and b!306389 res!163303) b!306379))

(assert (= (and b!306379 res!163307) b!306388))

(assert (= (and b!306388 res!163311) b!306378))

(assert (= (and b!306378 c!49139) b!306383))

(assert (= (and b!306378 (not c!49139)) b!306376))

(assert (= (and b!306383 c!49140) b!306380))

(assert (= (and b!306383 (not c!49140)) b!306386))

(declare-fun m!316991 () Bool)

(assert (=> b!306377 m!316991))

(declare-fun m!316993 () Bool)

(assert (=> b!306389 m!316993))

(declare-fun m!316995 () Bool)

(assert (=> b!306385 m!316995))

(declare-fun m!316997 () Bool)

(assert (=> b!306378 m!316997))

(assert (=> b!306388 m!316997))

(declare-fun m!316999 () Bool)

(assert (=> b!306379 m!316999))

(assert (=> b!306383 m!316997))

(declare-fun m!317001 () Bool)

(assert (=> start!30572 m!317001))

(declare-fun m!317003 () Bool)

(assert (=> start!30572 m!317003))

(declare-fun m!317005 () Bool)

(assert (=> b!306386 m!317005))

(assert (=> b!306386 m!317005))

(declare-fun m!317007 () Bool)

(assert (=> b!306386 m!317007))

(declare-fun m!317009 () Bool)

(assert (=> b!306382 m!317009))

(declare-fun m!317011 () Bool)

(assert (=> b!306381 m!317011))

(assert (=> b!306381 m!317011))

(declare-fun m!317013 () Bool)

(assert (=> b!306381 m!317013))

(declare-fun m!317015 () Bool)

(assert (=> b!306387 m!317015))

(push 1)

