; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32438 () Bool)

(assert start!32438)

(declare-fun b!324187 () Bool)

(declare-fun res!177576 () Bool)

(declare-fun e!200183 () Bool)

(assert (=> b!324187 (=> (not res!177576) (not e!200183))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324187 (= res!177576 (validKeyInArray!0 k0!2497))))

(declare-datatypes ((array!16590 0))(
  ( (array!16591 (arr!7852 (Array (_ BitVec 32) (_ BitVec 64))) (size!8204 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16590)

(declare-fun e!200182 () Bool)

(declare-fun b!324188 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!324188 (= e!200182 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7852 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000))))))

(declare-fun b!324189 () Bool)

(declare-fun res!177574 () Bool)

(assert (=> b!324189 (=> (not res!177574) (not e!200183))))

(declare-fun arrayContainsKey!0 (array!16590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324189 (= res!177574 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!177571 () Bool)

(assert (=> start!32438 (=> (not res!177571) (not e!200183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32438 (= res!177571 (validMask!0 mask!3777))))

(assert (=> start!32438 e!200183))

(declare-fun array_inv!5802 (array!16590) Bool)

(assert (=> start!32438 (array_inv!5802 a!3305)))

(assert (=> start!32438 true))

(declare-fun b!324190 () Bool)

(declare-fun res!177568 () Bool)

(assert (=> b!324190 (=> (not res!177568) (not e!200183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16590 (_ BitVec 32)) Bool)

(assert (=> b!324190 (= res!177568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324191 () Bool)

(declare-fun res!177573 () Bool)

(assert (=> b!324191 (=> (not res!177573) (not e!200183))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324191 (= res!177573 (and (= (size!8204 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8204 a!3305))))))

(declare-fun b!324192 () Bool)

(declare-fun res!177569 () Bool)

(assert (=> b!324192 (=> (not res!177569) (not e!200182))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324192 (= res!177569 (and (= (select (arr!7852 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8204 a!3305))))))

(declare-fun b!324193 () Bool)

(declare-fun res!177572 () Bool)

(assert (=> b!324193 (=> (not res!177572) (not e!200183))))

(declare-datatypes ((SeekEntryResult!2948 0))(
  ( (MissingZero!2948 (index!13968 (_ BitVec 32))) (Found!2948 (index!13969 (_ BitVec 32))) (Intermediate!2948 (undefined!3760 Bool) (index!13970 (_ BitVec 32)) (x!32325 (_ BitVec 32))) (Undefined!2948) (MissingVacant!2948 (index!13971 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16590 (_ BitVec 32)) SeekEntryResult!2948)

(assert (=> b!324193 (= res!177572 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2948 i!1250)))))

(declare-fun b!324194 () Bool)

(declare-fun res!177570 () Bool)

(assert (=> b!324194 (=> (not res!177570) (not e!200182))))

(declare-fun lt!156786 () SeekEntryResult!2948)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16590 (_ BitVec 32)) SeekEntryResult!2948)

(assert (=> b!324194 (= res!177570 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156786))))

(declare-fun b!324195 () Bool)

(assert (=> b!324195 (= e!200183 e!200182)))

(declare-fun res!177575 () Bool)

(assert (=> b!324195 (=> (not res!177575) (not e!200182))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324195 (= res!177575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156786))))

(assert (=> b!324195 (= lt!156786 (Intermediate!2948 false resIndex!58 resX!58))))

(assert (= (and start!32438 res!177571) b!324191))

(assert (= (and b!324191 res!177573) b!324187))

(assert (= (and b!324187 res!177576) b!324189))

(assert (= (and b!324189 res!177574) b!324193))

(assert (= (and b!324193 res!177572) b!324190))

(assert (= (and b!324190 res!177568) b!324195))

(assert (= (and b!324195 res!177575) b!324192))

(assert (= (and b!324192 res!177569) b!324194))

(assert (= (and b!324194 res!177570) b!324188))

(declare-fun m!331507 () Bool)

(assert (=> start!32438 m!331507))

(declare-fun m!331509 () Bool)

(assert (=> start!32438 m!331509))

(declare-fun m!331511 () Bool)

(assert (=> b!324195 m!331511))

(assert (=> b!324195 m!331511))

(declare-fun m!331513 () Bool)

(assert (=> b!324195 m!331513))

(declare-fun m!331515 () Bool)

(assert (=> b!324194 m!331515))

(declare-fun m!331517 () Bool)

(assert (=> b!324192 m!331517))

(declare-fun m!331519 () Bool)

(assert (=> b!324189 m!331519))

(declare-fun m!331521 () Bool)

(assert (=> b!324187 m!331521))

(declare-fun m!331523 () Bool)

(assert (=> b!324190 m!331523))

(declare-fun m!331525 () Bool)

(assert (=> b!324188 m!331525))

(declare-fun m!331527 () Bool)

(assert (=> b!324193 m!331527))

(check-sat (not b!324190) (not b!324189) (not b!324193) (not b!324194) (not b!324195) (not start!32438) (not b!324187))
(check-sat)
