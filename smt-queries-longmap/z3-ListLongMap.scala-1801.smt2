; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32492 () Bool)

(assert start!32492)

(declare-fun b!324768 () Bool)

(declare-fun e!200283 () Bool)

(assert (=> b!324768 (= e!200283 false)))

(declare-fun lt!156688 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324768 (= lt!156688 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324769 () Bool)

(declare-fun res!178246 () Bool)

(assert (=> b!324769 (=> (not res!178246) (not e!200283))))

(declare-datatypes ((array!16635 0))(
  ( (array!16636 (arr!7875 (Array (_ BitVec 32) (_ BitVec 64))) (size!8228 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16635)

(declare-datatypes ((SeekEntryResult!3005 0))(
  ( (MissingZero!3005 (index!14196 (_ BitVec 32))) (Found!3005 (index!14197 (_ BitVec 32))) (Intermediate!3005 (undefined!3817 Bool) (index!14198 (_ BitVec 32)) (x!32452 (_ BitVec 32))) (Undefined!3005) (MissingVacant!3005 (index!14199 (_ BitVec 32))) )
))
(declare-fun lt!156689 () SeekEntryResult!3005)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16635 (_ BitVec 32)) SeekEntryResult!3005)

(assert (=> b!324769 (= res!178246 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156689))))

(declare-fun b!324770 () Bool)

(declare-fun res!178245 () Bool)

(declare-fun e!200285 () Bool)

(assert (=> b!324770 (=> (not res!178245) (not e!200285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16635 (_ BitVec 32)) Bool)

(assert (=> b!324770 (= res!178245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324771 () Bool)

(declare-fun res!178253 () Bool)

(assert (=> b!324771 (=> (not res!178253) (not e!200285))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16635 (_ BitVec 32)) SeekEntryResult!3005)

(assert (=> b!324771 (= res!178253 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3005 i!1250)))))

(declare-fun b!324772 () Bool)

(declare-fun res!178248 () Bool)

(assert (=> b!324772 (=> (not res!178248) (not e!200285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324772 (= res!178248 (validKeyInArray!0 k0!2497))))

(declare-fun b!324773 () Bool)

(declare-fun res!178251 () Bool)

(assert (=> b!324773 (=> (not res!178251) (not e!200285))))

(assert (=> b!324773 (= res!178251 (and (= (size!8228 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8228 a!3305))))))

(declare-fun b!324774 () Bool)

(declare-fun res!178249 () Bool)

(assert (=> b!324774 (=> (not res!178249) (not e!200283))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324774 (= res!178249 (and (= (select (arr!7875 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8228 a!3305))))))

(declare-fun b!324775 () Bool)

(declare-fun res!178254 () Bool)

(assert (=> b!324775 (=> (not res!178254) (not e!200285))))

(declare-fun arrayContainsKey!0 (array!16635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324775 (= res!178254 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324776 () Bool)

(declare-fun res!178247 () Bool)

(assert (=> b!324776 (=> (not res!178247) (not e!200283))))

(assert (=> b!324776 (= res!178247 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7875 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324777 () Bool)

(assert (=> b!324777 (= e!200285 e!200283)))

(declare-fun res!178252 () Bool)

(assert (=> b!324777 (=> (not res!178252) (not e!200283))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324777 (= res!178252 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156689))))

(assert (=> b!324777 (= lt!156689 (Intermediate!3005 false resIndex!58 resX!58))))

(declare-fun res!178250 () Bool)

(assert (=> start!32492 (=> (not res!178250) (not e!200285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32492 (= res!178250 (validMask!0 mask!3777))))

(assert (=> start!32492 e!200285))

(declare-fun array_inv!5847 (array!16635) Bool)

(assert (=> start!32492 (array_inv!5847 a!3305)))

(assert (=> start!32492 true))

(assert (= (and start!32492 res!178250) b!324773))

(assert (= (and b!324773 res!178251) b!324772))

(assert (= (and b!324772 res!178248) b!324775))

(assert (= (and b!324775 res!178254) b!324771))

(assert (= (and b!324771 res!178253) b!324770))

(assert (= (and b!324770 res!178245) b!324777))

(assert (= (and b!324777 res!178252) b!324774))

(assert (= (and b!324774 res!178249) b!324769))

(assert (= (and b!324769 res!178246) b!324776))

(assert (= (and b!324776 res!178247) b!324768))

(declare-fun m!331237 () Bool)

(assert (=> start!32492 m!331237))

(declare-fun m!331239 () Bool)

(assert (=> start!32492 m!331239))

(declare-fun m!331241 () Bool)

(assert (=> b!324776 m!331241))

(declare-fun m!331243 () Bool)

(assert (=> b!324775 m!331243))

(declare-fun m!331245 () Bool)

(assert (=> b!324774 m!331245))

(declare-fun m!331247 () Bool)

(assert (=> b!324777 m!331247))

(assert (=> b!324777 m!331247))

(declare-fun m!331249 () Bool)

(assert (=> b!324777 m!331249))

(declare-fun m!331251 () Bool)

(assert (=> b!324771 m!331251))

(declare-fun m!331253 () Bool)

(assert (=> b!324770 m!331253))

(declare-fun m!331255 () Bool)

(assert (=> b!324769 m!331255))

(declare-fun m!331257 () Bool)

(assert (=> b!324768 m!331257))

(declare-fun m!331259 () Bool)

(assert (=> b!324772 m!331259))

(check-sat (not b!324775) (not b!324771) (not b!324768) (not b!324772) (not b!324769) (not b!324777) (not start!32492) (not b!324770))
(check-sat)
