; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31366 () Bool)

(assert start!31366)

(declare-fun b!314459 () Bool)

(declare-fun res!170264 () Bool)

(declare-fun e!195830 () Bool)

(assert (=> b!314459 (=> (not res!170264) (not e!195830))))

(declare-datatypes ((array!16050 0))(
  ( (array!16051 (arr!7599 (Array (_ BitVec 32) (_ BitVec 64))) (size!7951 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16050)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314459 (= res!170264 (and (= (select (arr!7599 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7951 a!3293))))))

(declare-fun b!314460 () Bool)

(declare-fun res!170260 () Bool)

(assert (=> b!314460 (=> (not res!170260) (not e!195830))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314460 (= res!170260 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314461 () Bool)

(declare-fun res!170259 () Bool)

(assert (=> b!314461 (=> (not res!170259) (not e!195830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314461 (= res!170259 (validKeyInArray!0 k!2441))))

(declare-fun res!170258 () Bool)

(assert (=> start!31366 (=> (not res!170258) (not e!195830))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31366 (= res!170258 (validMask!0 mask!3709))))

(assert (=> start!31366 e!195830))

(declare-fun array_inv!5549 (array!16050) Bool)

(assert (=> start!31366 (array_inv!5549 a!3293)))

(assert (=> start!31366 true))

(declare-fun b!314462 () Bool)

(declare-fun res!170263 () Bool)

(assert (=> b!314462 (=> (not res!170263) (not e!195830))))

(declare-datatypes ((SeekEntryResult!2704 0))(
  ( (MissingZero!2704 (index!12992 (_ BitVec 32))) (Found!2704 (index!12993 (_ BitVec 32))) (Intermediate!2704 (undefined!3516 Bool) (index!12994 (_ BitVec 32)) (x!31323 (_ BitVec 32))) (Undefined!2704) (MissingVacant!2704 (index!12995 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16050 (_ BitVec 32)) SeekEntryResult!2704)

(assert (=> b!314462 (= res!170263 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2704 i!1240)))))

(declare-fun b!314463 () Bool)

(assert (=> b!314463 (= e!195830 false)))

(declare-fun lt!153933 () SeekEntryResult!2704)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16050 (_ BitVec 32)) SeekEntryResult!2704)

(assert (=> b!314463 (= lt!153933 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314464 () Bool)

(declare-fun res!170261 () Bool)

(assert (=> b!314464 (=> (not res!170261) (not e!195830))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314464 (= res!170261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2704 false resIndex!52 resX!52)))))

(declare-fun b!314465 () Bool)

(declare-fun res!170262 () Bool)

(assert (=> b!314465 (=> (not res!170262) (not e!195830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16050 (_ BitVec 32)) Bool)

(assert (=> b!314465 (= res!170262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314466 () Bool)

(declare-fun res!170265 () Bool)

(assert (=> b!314466 (=> (not res!170265) (not e!195830))))

(assert (=> b!314466 (= res!170265 (and (= (size!7951 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7951 a!3293))))))

(assert (= (and start!31366 res!170258) b!314466))

(assert (= (and b!314466 res!170265) b!314461))

(assert (= (and b!314461 res!170259) b!314460))

(assert (= (and b!314460 res!170260) b!314462))

(assert (= (and b!314462 res!170263) b!314465))

(assert (= (and b!314465 res!170262) b!314464))

(assert (= (and b!314464 res!170261) b!314459))

(assert (= (and b!314459 res!170264) b!314463))

(declare-fun m!324197 () Bool)

(assert (=> b!314461 m!324197))

(declare-fun m!324199 () Bool)

(assert (=> start!31366 m!324199))

(declare-fun m!324201 () Bool)

(assert (=> start!31366 m!324201))

(declare-fun m!324203 () Bool)

(assert (=> b!314465 m!324203))

(declare-fun m!324205 () Bool)

(assert (=> b!314463 m!324205))

(declare-fun m!324207 () Bool)

(assert (=> b!314464 m!324207))

(assert (=> b!314464 m!324207))

(declare-fun m!324209 () Bool)

(assert (=> b!314464 m!324209))

(declare-fun m!324211 () Bool)

(assert (=> b!314462 m!324211))

(declare-fun m!324213 () Bool)

(assert (=> b!314460 m!324213))

(declare-fun m!324215 () Bool)

(assert (=> b!314459 m!324215))

(push 1)

(assert (not b!314463))

(assert (not b!314465))

(assert (not start!31366))

(assert (not b!314460))

(assert (not b!314464))

(assert (not b!314461))

(assert (not b!314462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

