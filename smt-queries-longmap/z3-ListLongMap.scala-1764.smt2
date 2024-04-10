; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32232 () Bool)

(assert start!32232)

(declare-fun b!321000 () Bool)

(declare-fun res!175123 () Bool)

(declare-fun e!199040 () Bool)

(assert (=> b!321000 (=> (not res!175123) (not e!199040))))

(declare-datatypes ((array!16422 0))(
  ( (array!16423 (arr!7770 (Array (_ BitVec 32) (_ BitVec 64))) (size!8122 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16422)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321000 (= res!175123 (and (= (select (arr!7770 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8122 a!3305))))))

(declare-fun b!321001 () Bool)

(declare-fun res!175120 () Bool)

(assert (=> b!321001 (=> (not res!175120) (not e!199040))))

(declare-datatypes ((SeekEntryResult!2901 0))(
  ( (MissingZero!2901 (index!13780 (_ BitVec 32))) (Found!2901 (index!13781 (_ BitVec 32))) (Intermediate!2901 (undefined!3713 Bool) (index!13782 (_ BitVec 32)) (x!32048 (_ BitVec 32))) (Undefined!2901) (MissingVacant!2901 (index!13783 (_ BitVec 32))) )
))
(declare-fun lt!156144 () SeekEntryResult!2901)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16422 (_ BitVec 32)) SeekEntryResult!2901)

(assert (=> b!321001 (= res!175120 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156144))))

(declare-fun res!175121 () Bool)

(declare-fun e!199042 () Bool)

(assert (=> start!32232 (=> (not res!175121) (not e!199042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32232 (= res!175121 (validMask!0 mask!3777))))

(assert (=> start!32232 e!199042))

(declare-fun array_inv!5733 (array!16422) Bool)

(assert (=> start!32232 (array_inv!5733 a!3305)))

(assert (=> start!32232 true))

(declare-fun b!321002 () Bool)

(declare-fun res!175125 () Bool)

(assert (=> b!321002 (=> (not res!175125) (not e!199042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16422 (_ BitVec 32)) Bool)

(assert (=> b!321002 (= res!175125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321003 () Bool)

(assert (=> b!321003 (= e!199042 e!199040)))

(declare-fun res!175126 () Bool)

(assert (=> b!321003 (=> (not res!175126) (not e!199040))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321003 (= res!175126 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156144))))

(assert (=> b!321003 (= lt!156144 (Intermediate!2901 false resIndex!58 resX!58))))

(declare-fun b!321004 () Bool)

(declare-fun res!175127 () Bool)

(assert (=> b!321004 (=> (not res!175127) (not e!199042))))

(assert (=> b!321004 (= res!175127 (and (= (size!8122 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8122 a!3305))))))

(declare-fun b!321005 () Bool)

(assert (=> b!321005 (= e!199040 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7770 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7770 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7770 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!321006 () Bool)

(declare-fun res!175122 () Bool)

(assert (=> b!321006 (=> (not res!175122) (not e!199042))))

(declare-fun arrayContainsKey!0 (array!16422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321006 (= res!175122 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321007 () Bool)

(declare-fun res!175128 () Bool)

(assert (=> b!321007 (=> (not res!175128) (not e!199042))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16422 (_ BitVec 32)) SeekEntryResult!2901)

(assert (=> b!321007 (= res!175128 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2901 i!1250)))))

(declare-fun b!321008 () Bool)

(declare-fun res!175124 () Bool)

(assert (=> b!321008 (=> (not res!175124) (not e!199042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321008 (= res!175124 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32232 res!175121) b!321004))

(assert (= (and b!321004 res!175127) b!321008))

(assert (= (and b!321008 res!175124) b!321006))

(assert (= (and b!321006 res!175122) b!321007))

(assert (= (and b!321007 res!175128) b!321002))

(assert (= (and b!321002 res!175125) b!321003))

(assert (= (and b!321003 res!175126) b!321000))

(assert (= (and b!321000 res!175123) b!321001))

(assert (= (and b!321001 res!175120) b!321005))

(declare-fun m!329223 () Bool)

(assert (=> b!321006 m!329223))

(declare-fun m!329225 () Bool)

(assert (=> b!321007 m!329225))

(declare-fun m!329227 () Bool)

(assert (=> start!32232 m!329227))

(declare-fun m!329229 () Bool)

(assert (=> start!32232 m!329229))

(declare-fun m!329231 () Bool)

(assert (=> b!321000 m!329231))

(declare-fun m!329233 () Bool)

(assert (=> b!321005 m!329233))

(declare-fun m!329235 () Bool)

(assert (=> b!321001 m!329235))

(declare-fun m!329237 () Bool)

(assert (=> b!321003 m!329237))

(assert (=> b!321003 m!329237))

(declare-fun m!329239 () Bool)

(assert (=> b!321003 m!329239))

(declare-fun m!329241 () Bool)

(assert (=> b!321008 m!329241))

(declare-fun m!329243 () Bool)

(assert (=> b!321002 m!329243))

(check-sat (not b!321008) (not b!321001) (not b!321006) (not b!321007) (not b!321002) (not b!321003) (not start!32232))
(check-sat)
