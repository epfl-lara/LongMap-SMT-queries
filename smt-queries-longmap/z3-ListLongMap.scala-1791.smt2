; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32432 () Bool)

(assert start!32432)

(declare-fun b!324106 () Bool)

(declare-fun res!177493 () Bool)

(declare-fun e!200155 () Bool)

(assert (=> b!324106 (=> (not res!177493) (not e!200155))))

(declare-datatypes ((array!16584 0))(
  ( (array!16585 (arr!7849 (Array (_ BitVec 32) (_ BitVec 64))) (size!8201 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16584)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16584 (_ BitVec 32)) Bool)

(assert (=> b!324106 (= res!177493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324107 () Bool)

(declare-fun e!200156 () Bool)

(assert (=> b!324107 (= e!200155 e!200156)))

(declare-fun res!177494 () Bool)

(assert (=> b!324107 (=> (not res!177494) (not e!200156))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2945 0))(
  ( (MissingZero!2945 (index!13956 (_ BitVec 32))) (Found!2945 (index!13957 (_ BitVec 32))) (Intermediate!2945 (undefined!3757 Bool) (index!13958 (_ BitVec 32)) (x!32314 (_ BitVec 32))) (Undefined!2945) (MissingVacant!2945 (index!13959 (_ BitVec 32))) )
))
(declare-fun lt!156777 () SeekEntryResult!2945)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16584 (_ BitVec 32)) SeekEntryResult!2945)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324107 (= res!177494 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156777))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324107 (= lt!156777 (Intermediate!2945 false resIndex!58 resX!58))))

(declare-fun b!324108 () Bool)

(declare-fun res!177489 () Bool)

(assert (=> b!324108 (=> (not res!177489) (not e!200156))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324108 (= res!177489 (and (= (select (arr!7849 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8201 a!3305))))))

(declare-fun b!324109 () Bool)

(declare-fun res!177495 () Bool)

(assert (=> b!324109 (=> (not res!177495) (not e!200155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324109 (= res!177495 (validKeyInArray!0 k0!2497))))

(declare-fun b!324110 () Bool)

(declare-fun res!177491 () Bool)

(assert (=> b!324110 (=> (not res!177491) (not e!200155))))

(declare-fun arrayContainsKey!0 (array!16584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324110 (= res!177491 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324111 () Bool)

(declare-fun res!177492 () Bool)

(assert (=> b!324111 (=> (not res!177492) (not e!200155))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16584 (_ BitVec 32)) SeekEntryResult!2945)

(assert (=> b!324111 (= res!177492 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2945 i!1250)))))

(declare-fun b!324112 () Bool)

(assert (=> b!324112 (= e!200156 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7849 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!324113 () Bool)

(declare-fun res!177487 () Bool)

(assert (=> b!324113 (=> (not res!177487) (not e!200156))))

(assert (=> b!324113 (= res!177487 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156777))))

(declare-fun res!177488 () Bool)

(assert (=> start!32432 (=> (not res!177488) (not e!200155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32432 (= res!177488 (validMask!0 mask!3777))))

(assert (=> start!32432 e!200155))

(declare-fun array_inv!5799 (array!16584) Bool)

(assert (=> start!32432 (array_inv!5799 a!3305)))

(assert (=> start!32432 true))

(declare-fun b!324114 () Bool)

(declare-fun res!177490 () Bool)

(assert (=> b!324114 (=> (not res!177490) (not e!200155))))

(assert (=> b!324114 (= res!177490 (and (= (size!8201 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8201 a!3305))))))

(assert (= (and start!32432 res!177488) b!324114))

(assert (= (and b!324114 res!177490) b!324109))

(assert (= (and b!324109 res!177495) b!324110))

(assert (= (and b!324110 res!177491) b!324111))

(assert (= (and b!324111 res!177492) b!324106))

(assert (= (and b!324106 res!177493) b!324107))

(assert (= (and b!324107 res!177494) b!324108))

(assert (= (and b!324108 res!177489) b!324113))

(assert (= (and b!324113 res!177487) b!324112))

(declare-fun m!331441 () Bool)

(assert (=> b!324112 m!331441))

(declare-fun m!331443 () Bool)

(assert (=> start!32432 m!331443))

(declare-fun m!331445 () Bool)

(assert (=> start!32432 m!331445))

(declare-fun m!331447 () Bool)

(assert (=> b!324110 m!331447))

(declare-fun m!331449 () Bool)

(assert (=> b!324106 m!331449))

(declare-fun m!331451 () Bool)

(assert (=> b!324113 m!331451))

(declare-fun m!331453 () Bool)

(assert (=> b!324108 m!331453))

(declare-fun m!331455 () Bool)

(assert (=> b!324111 m!331455))

(declare-fun m!331457 () Bool)

(assert (=> b!324107 m!331457))

(assert (=> b!324107 m!331457))

(declare-fun m!331459 () Bool)

(assert (=> b!324107 m!331459))

(declare-fun m!331461 () Bool)

(assert (=> b!324109 m!331461))

(check-sat (not b!324109) (not start!32432) (not b!324111) (not b!324113) (not b!324106) (not b!324110) (not b!324107))
(check-sat)
