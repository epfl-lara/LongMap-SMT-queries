; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32250 () Bool)

(assert start!32250)

(declare-fun b!321361 () Bool)

(declare-fun res!175539 () Bool)

(declare-fun e!199134 () Bool)

(assert (=> b!321361 (=> (not res!175539) (not e!199134))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321361 (= res!175539 (validKeyInArray!0 k!2497))))

(declare-fun b!321362 () Bool)

(declare-fun res!175533 () Bool)

(declare-fun e!199132 () Bool)

(assert (=> b!321362 (=> (not res!175533) (not e!199132))))

(declare-datatypes ((array!16453 0))(
  ( (array!16454 (arr!7785 (Array (_ BitVec 32) (_ BitVec 64))) (size!8137 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16453)

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2881 0))(
  ( (MissingZero!2881 (index!13700 (_ BitVec 32))) (Found!2881 (index!13701 (_ BitVec 32))) (Intermediate!2881 (undefined!3693 Bool) (index!13702 (_ BitVec 32)) (x!32065 (_ BitVec 32))) (Undefined!2881) (MissingVacant!2881 (index!13703 (_ BitVec 32))) )
))
(declare-fun lt!156210 () SeekEntryResult!2881)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16453 (_ BitVec 32)) SeekEntryResult!2881)

(assert (=> b!321362 (= res!175533 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156210))))

(declare-fun b!321363 () Bool)

(declare-fun res!175532 () Bool)

(assert (=> b!321363 (=> (not res!175532) (not e!199134))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321363 (= res!175532 (and (= (size!8137 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8137 a!3305))))))

(declare-fun b!321364 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321364 (= e!199132 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7785 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7785 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7785 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!321366 () Bool)

(assert (=> b!321366 (= e!199134 e!199132)))

(declare-fun res!175535 () Bool)

(assert (=> b!321366 (=> (not res!175535) (not e!199132))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321366 (= res!175535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156210))))

(assert (=> b!321366 (= lt!156210 (Intermediate!2881 false resIndex!58 resX!58))))

(declare-fun b!321367 () Bool)

(declare-fun res!175537 () Bool)

(assert (=> b!321367 (=> (not res!175537) (not e!199134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16453 (_ BitVec 32)) Bool)

(assert (=> b!321367 (= res!175537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321368 () Bool)

(declare-fun res!175538 () Bool)

(assert (=> b!321368 (=> (not res!175538) (not e!199132))))

(assert (=> b!321368 (= res!175538 (and (= (select (arr!7785 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8137 a!3305))))))

(declare-fun b!321369 () Bool)

(declare-fun res!175531 () Bool)

(assert (=> b!321369 (=> (not res!175531) (not e!199134))))

(declare-fun arrayContainsKey!0 (array!16453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321369 (= res!175531 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!175534 () Bool)

(assert (=> start!32250 (=> (not res!175534) (not e!199134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32250 (= res!175534 (validMask!0 mask!3777))))

(assert (=> start!32250 e!199134))

(declare-fun array_inv!5735 (array!16453) Bool)

(assert (=> start!32250 (array_inv!5735 a!3305)))

(assert (=> start!32250 true))

(declare-fun b!321365 () Bool)

(declare-fun res!175536 () Bool)

(assert (=> b!321365 (=> (not res!175536) (not e!199134))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16453 (_ BitVec 32)) SeekEntryResult!2881)

(assert (=> b!321365 (= res!175536 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2881 i!1250)))))

(assert (= (and start!32250 res!175534) b!321363))

(assert (= (and b!321363 res!175532) b!321361))

(assert (= (and b!321361 res!175539) b!321369))

(assert (= (and b!321369 res!175531) b!321365))

(assert (= (and b!321365 res!175536) b!321367))

(assert (= (and b!321367 res!175537) b!321366))

(assert (= (and b!321366 res!175535) b!321368))

(assert (= (and b!321368 res!175538) b!321362))

(assert (= (and b!321362 res!175533) b!321364))

(declare-fun m!329739 () Bool)

(assert (=> b!321365 m!329739))

(declare-fun m!329741 () Bool)

(assert (=> b!321361 m!329741))

(declare-fun m!329743 () Bool)

(assert (=> b!321364 m!329743))

(declare-fun m!329745 () Bool)

(assert (=> b!321368 m!329745))

(declare-fun m!329747 () Bool)

(assert (=> b!321367 m!329747))

(declare-fun m!329749 () Bool)

(assert (=> b!321362 m!329749))

(declare-fun m!329751 () Bool)

(assert (=> start!32250 m!329751))

(declare-fun m!329753 () Bool)

(assert (=> start!32250 m!329753))

(declare-fun m!329755 () Bool)

(assert (=> b!321369 m!329755))

(declare-fun m!329757 () Bool)

(assert (=> b!321366 m!329757))

(assert (=> b!321366 m!329757))

(declare-fun m!329759 () Bool)

(assert (=> b!321366 m!329759))

(push 1)

(assert (not b!321362))

(assert (not b!321365))

(assert (not b!321369))

(assert (not b!321367))

(assert (not b!321361))

(assert (not b!321366))

(assert (not start!32250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

