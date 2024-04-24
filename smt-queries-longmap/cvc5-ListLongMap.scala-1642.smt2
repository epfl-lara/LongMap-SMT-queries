; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30622 () Bool)

(assert start!30622)

(declare-fun b!307376 () Bool)

(declare-fun res!164186 () Bool)

(declare-fun e!192471 () Bool)

(assert (=> b!307376 (=> (not res!164186) (not e!192471))))

(declare-datatypes ((array!15639 0))(
  ( (array!15640 (arr!7404 (Array (_ BitVec 32) (_ BitVec 64))) (size!7756 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15639)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307376 (= res!164186 (and (= (select (arr!7404 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7756 a!3293))))))

(declare-fun b!307377 () Bool)

(declare-fun res!164184 () Bool)

(assert (=> b!307377 (=> (not res!164184) (not e!192471))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2509 0))(
  ( (MissingZero!2509 (index!12212 (_ BitVec 32))) (Found!2509 (index!12213 (_ BitVec 32))) (Intermediate!2509 (undefined!3321 Bool) (index!12214 (_ BitVec 32)) (x!30557 (_ BitVec 32))) (Undefined!2509) (MissingVacant!2509 (index!12215 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15639 (_ BitVec 32)) SeekEntryResult!2509)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307377 (= res!164184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2509 false resIndex!52 resX!52)))))

(declare-fun b!307378 () Bool)

(declare-fun res!164182 () Bool)

(assert (=> b!307378 (=> (not res!164182) (not e!192471))))

(assert (=> b!307378 (= res!164182 (and (= (size!7756 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7756 a!3293))))))

(declare-fun b!307379 () Bool)

(declare-fun res!164183 () Bool)

(assert (=> b!307379 (=> (not res!164183) (not e!192471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15639 (_ BitVec 32)) Bool)

(assert (=> b!307379 (= res!164183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307380 () Bool)

(declare-fun res!164187 () Bool)

(assert (=> b!307380 (=> (not res!164187) (not e!192471))))

(declare-fun arrayContainsKey!0 (array!15639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307380 (= res!164187 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164180 () Bool)

(assert (=> start!30622 (=> (not res!164180) (not e!192471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30622 (= res!164180 (validMask!0 mask!3709))))

(assert (=> start!30622 e!192471))

(declare-fun array_inv!5354 (array!15639) Bool)

(assert (=> start!30622 (array_inv!5354 a!3293)))

(assert (=> start!30622 true))

(declare-fun b!307381 () Bool)

(declare-fun res!164181 () Bool)

(assert (=> b!307381 (=> (not res!164181) (not e!192471))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15639 (_ BitVec 32)) SeekEntryResult!2509)

(assert (=> b!307381 (= res!164181 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2509 i!1240)))))

(declare-fun b!307382 () Bool)

(assert (=> b!307382 (= e!192471 false)))

(declare-fun lt!151149 () SeekEntryResult!2509)

(assert (=> b!307382 (= lt!151149 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!307383 () Bool)

(declare-fun res!164185 () Bool)

(assert (=> b!307383 (=> (not res!164185) (not e!192471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307383 (= res!164185 (validKeyInArray!0 k!2441))))

(assert (= (and start!30622 res!164180) b!307378))

(assert (= (and b!307378 res!164182) b!307383))

(assert (= (and b!307383 res!164185) b!307380))

(assert (= (and b!307380 res!164187) b!307381))

(assert (= (and b!307381 res!164181) b!307379))

(assert (= (and b!307379 res!164183) b!307377))

(assert (= (and b!307377 res!164184) b!307376))

(assert (= (and b!307376 res!164186) b!307382))

(declare-fun m!317861 () Bool)

(assert (=> b!307377 m!317861))

(assert (=> b!307377 m!317861))

(declare-fun m!317863 () Bool)

(assert (=> b!307377 m!317863))

(declare-fun m!317865 () Bool)

(assert (=> start!30622 m!317865))

(declare-fun m!317867 () Bool)

(assert (=> start!30622 m!317867))

(declare-fun m!317869 () Bool)

(assert (=> b!307383 m!317869))

(declare-fun m!317871 () Bool)

(assert (=> b!307379 m!317871))

(declare-fun m!317873 () Bool)

(assert (=> b!307382 m!317873))

(declare-fun m!317875 () Bool)

(assert (=> b!307381 m!317875))

(declare-fun m!317877 () Bool)

(assert (=> b!307380 m!317877))

(declare-fun m!317879 () Bool)

(assert (=> b!307376 m!317879))

(push 1)

(assert (not b!307383))

(assert (not b!307381))

(assert (not b!307379))

(assert (not b!307382))

(assert (not start!30622))

(assert (not b!307380))

(assert (not b!307377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

