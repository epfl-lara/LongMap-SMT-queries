; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32424 () Bool)

(assert start!32424)

(declare-fun b!323999 () Bool)

(declare-fun res!177386 () Bool)

(declare-fun e!200120 () Bool)

(assert (=> b!323999 (=> (not res!177386) (not e!200120))))

(declare-datatypes ((array!16576 0))(
  ( (array!16577 (arr!7845 (Array (_ BitVec 32) (_ BitVec 64))) (size!8197 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16576)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323999 (= res!177386 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324000 () Bool)

(declare-fun res!177385 () Bool)

(assert (=> b!324000 (=> (not res!177385) (not e!200120))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324000 (= res!177385 (and (= (select (arr!7845 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8197 a!3305))))))

(declare-fun b!324001 () Bool)

(declare-fun res!177381 () Bool)

(assert (=> b!324001 (=> (not res!177381) (not e!200120))))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!324001 (= res!177381 (and (= (size!8197 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8197 a!3305))))))

(declare-fun b!324002 () Bool)

(declare-fun res!177380 () Bool)

(assert (=> b!324002 (=> (not res!177380) (not e!200120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324002 (= res!177380 (validKeyInArray!0 k!2497))))

(declare-fun b!324003 () Bool)

(declare-fun res!177387 () Bool)

(assert (=> b!324003 (=> (not res!177387) (not e!200120))))

(declare-datatypes ((SeekEntryResult!2941 0))(
  ( (MissingZero!2941 (index!13940 (_ BitVec 32))) (Found!2941 (index!13941 (_ BitVec 32))) (Intermediate!2941 (undefined!3753 Bool) (index!13942 (_ BitVec 32)) (x!32294 (_ BitVec 32))) (Undefined!2941) (MissingVacant!2941 (index!13943 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16576 (_ BitVec 32)) SeekEntryResult!2941)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324003 (= res!177387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2941 false resIndex!58 resX!58)))))

(declare-fun b!324004 () Bool)

(declare-fun res!177383 () Bool)

(assert (=> b!324004 (=> (not res!177383) (not e!200120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16576 (_ BitVec 32)) Bool)

(assert (=> b!324004 (= res!177383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324005 () Bool)

(declare-fun res!177382 () Bool)

(assert (=> b!324005 (=> (not res!177382) (not e!200120))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16576 (_ BitVec 32)) SeekEntryResult!2941)

(assert (=> b!324005 (= res!177382 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2941 i!1250)))))

(declare-fun res!177384 () Bool)

(assert (=> start!32424 (=> (not res!177384) (not e!200120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32424 (= res!177384 (validMask!0 mask!3777))))

(assert (=> start!32424 e!200120))

(declare-fun array_inv!5795 (array!16576) Bool)

(assert (=> start!32424 (array_inv!5795 a!3305)))

(assert (=> start!32424 true))

(declare-fun b!324006 () Bool)

(assert (=> b!324006 (= e!200120 false)))

(declare-fun lt!156765 () SeekEntryResult!2941)

(assert (=> b!324006 (= lt!156765 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(assert (= (and start!32424 res!177384) b!324001))

(assert (= (and b!324001 res!177381) b!324002))

(assert (= (and b!324002 res!177380) b!323999))

(assert (= (and b!323999 res!177386) b!324005))

(assert (= (and b!324005 res!177382) b!324004))

(assert (= (and b!324004 res!177383) b!324003))

(assert (= (and b!324003 res!177387) b!324000))

(assert (= (and b!324000 res!177385) b!324006))

(declare-fun m!331355 () Bool)

(assert (=> b!324000 m!331355))

(declare-fun m!331357 () Bool)

(assert (=> b!324004 m!331357))

(declare-fun m!331359 () Bool)

(assert (=> b!324002 m!331359))

(declare-fun m!331361 () Bool)

(assert (=> b!324003 m!331361))

(assert (=> b!324003 m!331361))

(declare-fun m!331363 () Bool)

(assert (=> b!324003 m!331363))

(declare-fun m!331365 () Bool)

(assert (=> start!32424 m!331365))

(declare-fun m!331367 () Bool)

(assert (=> start!32424 m!331367))

(declare-fun m!331369 () Bool)

(assert (=> b!324006 m!331369))

(declare-fun m!331371 () Bool)

(assert (=> b!324005 m!331371))

(declare-fun m!331373 () Bool)

(assert (=> b!323999 m!331373))

(push 1)

(assert (not b!324003))

(assert (not b!324005))

(assert (not b!324002))

(assert (not b!324004))

(assert (not b!324006))

(assert (not b!323999))

(assert (not start!32424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

