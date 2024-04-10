; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32458 () Bool)

(assert start!32458)

(declare-fun b!324323 () Bool)

(declare-fun res!177655 () Bool)

(declare-fun e!200245 () Bool)

(assert (=> b!324323 (=> (not res!177655) (not e!200245))))

(declare-datatypes ((array!16597 0))(
  ( (array!16598 (arr!7856 (Array (_ BitVec 32) (_ BitVec 64))) (size!8208 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16597)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2987 0))(
  ( (MissingZero!2987 (index!14124 (_ BitVec 32))) (Found!2987 (index!14125 (_ BitVec 32))) (Intermediate!2987 (undefined!3799 Bool) (index!14126 (_ BitVec 32)) (x!32375 (_ BitVec 32))) (Undefined!2987) (MissingVacant!2987 (index!14127 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16597 (_ BitVec 32)) SeekEntryResult!2987)

(assert (=> b!324323 (= res!177655 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2987 i!1250)))))

(declare-fun b!324324 () Bool)

(declare-fun e!200244 () Bool)

(assert (=> b!324324 (= e!200244 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!156780 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324324 (= lt!156780 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324325 () Bool)

(declare-fun res!177657 () Bool)

(assert (=> b!324325 (=> (not res!177657) (not e!200245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16597 (_ BitVec 32)) Bool)

(assert (=> b!324325 (= res!177657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324326 () Bool)

(declare-fun res!177662 () Bool)

(assert (=> b!324326 (=> (not res!177662) (not e!200245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324326 (= res!177662 (validKeyInArray!0 k!2497))))

(declare-fun b!324327 () Bool)

(assert (=> b!324327 (= e!200245 e!200244)))

(declare-fun res!177654 () Bool)

(assert (=> b!324327 (=> (not res!177654) (not e!200244))))

(declare-fun lt!156779 () SeekEntryResult!2987)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16597 (_ BitVec 32)) SeekEntryResult!2987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324327 (= res!177654 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156779))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324327 (= lt!156779 (Intermediate!2987 false resIndex!58 resX!58))))

(declare-fun b!324328 () Bool)

(declare-fun res!177663 () Bool)

(assert (=> b!324328 (=> (not res!177663) (not e!200244))))

(assert (=> b!324328 (= res!177663 (and (= (select (arr!7856 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8208 a!3305))))))

(declare-fun res!177656 () Bool)

(assert (=> start!32458 (=> (not res!177656) (not e!200245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32458 (= res!177656 (validMask!0 mask!3777))))

(assert (=> start!32458 e!200245))

(declare-fun array_inv!5819 (array!16597) Bool)

(assert (=> start!32458 (array_inv!5819 a!3305)))

(assert (=> start!32458 true))

(declare-fun b!324329 () Bool)

(declare-fun res!177659 () Bool)

(assert (=> b!324329 (=> (not res!177659) (not e!200245))))

(declare-fun arrayContainsKey!0 (array!16597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324329 (= res!177659 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324330 () Bool)

(declare-fun res!177661 () Bool)

(assert (=> b!324330 (=> (not res!177661) (not e!200244))))

(assert (=> b!324330 (= res!177661 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156779))))

(declare-fun b!324331 () Bool)

(declare-fun res!177660 () Bool)

(assert (=> b!324331 (=> (not res!177660) (not e!200244))))

(assert (=> b!324331 (= res!177660 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7856 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324332 () Bool)

(declare-fun res!177658 () Bool)

(assert (=> b!324332 (=> (not res!177658) (not e!200245))))

(assert (=> b!324332 (= res!177658 (and (= (size!8208 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8208 a!3305))))))

(assert (= (and start!32458 res!177656) b!324332))

(assert (= (and b!324332 res!177658) b!324326))

(assert (= (and b!324326 res!177662) b!324329))

(assert (= (and b!324329 res!177659) b!324323))

(assert (= (and b!324323 res!177655) b!324325))

(assert (= (and b!324325 res!177657) b!324327))

(assert (= (and b!324327 res!177654) b!324328))

(assert (= (and b!324328 res!177663) b!324330))

(assert (= (and b!324330 res!177661) b!324331))

(assert (= (and b!324331 res!177660) b!324324))

(declare-fun m!331391 () Bool)

(assert (=> start!32458 m!331391))

(declare-fun m!331393 () Bool)

(assert (=> start!32458 m!331393))

(declare-fun m!331395 () Bool)

(assert (=> b!324329 m!331395))

(declare-fun m!331397 () Bool)

(assert (=> b!324330 m!331397))

(declare-fun m!331399 () Bool)

(assert (=> b!324325 m!331399))

(declare-fun m!331401 () Bool)

(assert (=> b!324331 m!331401))

(declare-fun m!331403 () Bool)

(assert (=> b!324324 m!331403))

(declare-fun m!331405 () Bool)

(assert (=> b!324323 m!331405))

(declare-fun m!331407 () Bool)

(assert (=> b!324326 m!331407))

(declare-fun m!331409 () Bool)

(assert (=> b!324328 m!331409))

(declare-fun m!331411 () Bool)

(assert (=> b!324327 m!331411))

(assert (=> b!324327 m!331411))

(declare-fun m!331413 () Bool)

(assert (=> b!324327 m!331413))

(push 1)

