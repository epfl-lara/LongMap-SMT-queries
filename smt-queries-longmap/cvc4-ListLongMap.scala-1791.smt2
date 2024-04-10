; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32450 () Bool)

(assert start!32450)

(declare-fun b!324213 () Bool)

(declare-fun res!177552 () Bool)

(declare-fun e!200208 () Bool)

(assert (=> b!324213 (=> (not res!177552) (not e!200208))))

(declare-datatypes ((array!16589 0))(
  ( (array!16590 (arr!7852 (Array (_ BitVec 32) (_ BitVec 64))) (size!8204 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16589)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324213 (= res!177552 (and (= (size!8204 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8204 a!3305))))))

(declare-fun b!324214 () Bool)

(declare-fun res!177548 () Bool)

(assert (=> b!324214 (=> (not res!177548) (not e!200208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16589 (_ BitVec 32)) Bool)

(assert (=> b!324214 (= res!177548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!324215 () Bool)

(declare-fun e!200209 () Bool)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324215 (= e!200209 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7852 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!324216 () Bool)

(declare-fun res!177551 () Bool)

(assert (=> b!324216 (=> (not res!177551) (not e!200208))))

(declare-fun arrayContainsKey!0 (array!16589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324216 (= res!177551 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324217 () Bool)

(declare-fun res!177547 () Bool)

(assert (=> b!324217 (=> (not res!177547) (not e!200208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324217 (= res!177547 (validKeyInArray!0 k!2497))))

(declare-fun b!324218 () Bool)

(declare-fun res!177549 () Bool)

(assert (=> b!324218 (=> (not res!177549) (not e!200209))))

(declare-datatypes ((SeekEntryResult!2983 0))(
  ( (MissingZero!2983 (index!14108 (_ BitVec 32))) (Found!2983 (index!14109 (_ BitVec 32))) (Intermediate!2983 (undefined!3795 Bool) (index!14110 (_ BitVec 32)) (x!32355 (_ BitVec 32))) (Undefined!2983) (MissingVacant!2983 (index!14111 (_ BitVec 32))) )
))
(declare-fun lt!156765 () SeekEntryResult!2983)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16589 (_ BitVec 32)) SeekEntryResult!2983)

(assert (=> b!324218 (= res!177549 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156765))))

(declare-fun res!177544 () Bool)

(assert (=> start!32450 (=> (not res!177544) (not e!200208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32450 (= res!177544 (validMask!0 mask!3777))))

(assert (=> start!32450 e!200208))

(declare-fun array_inv!5815 (array!16589) Bool)

(assert (=> start!32450 (array_inv!5815 a!3305)))

(assert (=> start!32450 true))

(declare-fun b!324219 () Bool)

(declare-fun res!177550 () Bool)

(assert (=> b!324219 (=> (not res!177550) (not e!200209))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324219 (= res!177550 (and (= (select (arr!7852 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8204 a!3305))))))

(declare-fun b!324220 () Bool)

(declare-fun res!177546 () Bool)

(assert (=> b!324220 (=> (not res!177546) (not e!200208))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16589 (_ BitVec 32)) SeekEntryResult!2983)

(assert (=> b!324220 (= res!177546 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2983 i!1250)))))

(declare-fun b!324221 () Bool)

(assert (=> b!324221 (= e!200208 e!200209)))

(declare-fun res!177545 () Bool)

(assert (=> b!324221 (=> (not res!177545) (not e!200209))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324221 (= res!177545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156765))))

(assert (=> b!324221 (= lt!156765 (Intermediate!2983 false resIndex!58 resX!58))))

(assert (= (and start!32450 res!177544) b!324213))

(assert (= (and b!324213 res!177552) b!324217))

(assert (= (and b!324217 res!177547) b!324216))

(assert (= (and b!324216 res!177551) b!324220))

(assert (= (and b!324220 res!177546) b!324214))

(assert (= (and b!324214 res!177548) b!324221))

(assert (= (and b!324221 res!177545) b!324219))

(assert (= (and b!324219 res!177550) b!324218))

(assert (= (and b!324218 res!177549) b!324215))

(declare-fun m!331303 () Bool)

(assert (=> b!324219 m!331303))

(declare-fun m!331305 () Bool)

(assert (=> b!324216 m!331305))

(declare-fun m!331307 () Bool)

(assert (=> start!32450 m!331307))

(declare-fun m!331309 () Bool)

(assert (=> start!32450 m!331309))

(declare-fun m!331311 () Bool)

(assert (=> b!324221 m!331311))

(assert (=> b!324221 m!331311))

(declare-fun m!331313 () Bool)

(assert (=> b!324221 m!331313))

(declare-fun m!331315 () Bool)

(assert (=> b!324215 m!331315))

(declare-fun m!331317 () Bool)

(assert (=> b!324217 m!331317))

(declare-fun m!331319 () Bool)

(assert (=> b!324220 m!331319))

(declare-fun m!331321 () Bool)

(assert (=> b!324214 m!331321))

(declare-fun m!331323 () Bool)

(assert (=> b!324218 m!331323))

(push 1)

(assert (not b!324220))

(assert (not start!32450))

(assert (not b!324218))

(assert (not b!324217))

(assert (not b!324214))

(assert (not b!324216))

(assert (not b!324221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

