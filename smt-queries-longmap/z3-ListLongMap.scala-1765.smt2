; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32238 () Bool)

(assert start!32238)

(declare-fun b!321081 () Bool)

(declare-fun res!175201 () Bool)

(declare-fun e!199069 () Bool)

(assert (=> b!321081 (=> (not res!175201) (not e!199069))))

(declare-datatypes ((array!16428 0))(
  ( (array!16429 (arr!7773 (Array (_ BitVec 32) (_ BitVec 64))) (size!8125 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16428)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16428 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321081 (= res!175201 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321082 () Bool)

(declare-fun res!175207 () Bool)

(declare-fun e!199067 () Bool)

(assert (=> b!321082 (=> (not res!175207) (not e!199067))))

(declare-datatypes ((SeekEntryResult!2904 0))(
  ( (MissingZero!2904 (index!13792 (_ BitVec 32))) (Found!2904 (index!13793 (_ BitVec 32))) (Intermediate!2904 (undefined!3716 Bool) (index!13794 (_ BitVec 32)) (x!32059 (_ BitVec 32))) (Undefined!2904) (MissingVacant!2904 (index!13795 (_ BitVec 32))) )
))
(declare-fun lt!156153 () SeekEntryResult!2904)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16428 (_ BitVec 32)) SeekEntryResult!2904)

(assert (=> b!321082 (= res!175207 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156153))))

(declare-fun b!321083 () Bool)

(assert (=> b!321083 (= e!199069 e!199067)))

(declare-fun res!175204 () Bool)

(assert (=> b!321083 (=> (not res!175204) (not e!199067))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321083 (= res!175204 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156153))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321083 (= lt!156153 (Intermediate!2904 false resIndex!58 resX!58))))

(declare-fun b!321084 () Bool)

(declare-fun res!175203 () Bool)

(assert (=> b!321084 (=> (not res!175203) (not e!199069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16428 (_ BitVec 32)) Bool)

(assert (=> b!321084 (= res!175203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321085 () Bool)

(assert (=> b!321085 (= e!199067 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7773 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7773 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7773 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun res!175202 () Bool)

(assert (=> start!32238 (=> (not res!175202) (not e!199069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32238 (= res!175202 (validMask!0 mask!3777))))

(assert (=> start!32238 e!199069))

(declare-fun array_inv!5736 (array!16428) Bool)

(assert (=> start!32238 (array_inv!5736 a!3305)))

(assert (=> start!32238 true))

(declare-fun b!321086 () Bool)

(declare-fun res!175205 () Bool)

(assert (=> b!321086 (=> (not res!175205) (not e!199069))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16428 (_ BitVec 32)) SeekEntryResult!2904)

(assert (=> b!321086 (= res!175205 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2904 i!1250)))))

(declare-fun b!321087 () Bool)

(declare-fun res!175209 () Bool)

(assert (=> b!321087 (=> (not res!175209) (not e!199069))))

(assert (=> b!321087 (= res!175209 (and (= (size!8125 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8125 a!3305))))))

(declare-fun b!321088 () Bool)

(declare-fun res!175206 () Bool)

(assert (=> b!321088 (=> (not res!175206) (not e!199069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321088 (= res!175206 (validKeyInArray!0 k0!2497))))

(declare-fun b!321089 () Bool)

(declare-fun res!175208 () Bool)

(assert (=> b!321089 (=> (not res!175208) (not e!199067))))

(assert (=> b!321089 (= res!175208 (and (= (select (arr!7773 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8125 a!3305))))))

(assert (= (and start!32238 res!175202) b!321087))

(assert (= (and b!321087 res!175209) b!321088))

(assert (= (and b!321088 res!175206) b!321081))

(assert (= (and b!321081 res!175201) b!321086))

(assert (= (and b!321086 res!175205) b!321084))

(assert (= (and b!321084 res!175203) b!321083))

(assert (= (and b!321083 res!175204) b!321089))

(assert (= (and b!321089 res!175208) b!321082))

(assert (= (and b!321082 res!175207) b!321085))

(declare-fun m!329289 () Bool)

(assert (=> b!321088 m!329289))

(declare-fun m!329291 () Bool)

(assert (=> b!321084 m!329291))

(declare-fun m!329293 () Bool)

(assert (=> b!321081 m!329293))

(declare-fun m!329295 () Bool)

(assert (=> b!321083 m!329295))

(assert (=> b!321083 m!329295))

(declare-fun m!329297 () Bool)

(assert (=> b!321083 m!329297))

(declare-fun m!329299 () Bool)

(assert (=> b!321085 m!329299))

(declare-fun m!329301 () Bool)

(assert (=> b!321082 m!329301))

(declare-fun m!329303 () Bool)

(assert (=> start!32238 m!329303))

(declare-fun m!329305 () Bool)

(assert (=> start!32238 m!329305))

(declare-fun m!329307 () Bool)

(assert (=> b!321086 m!329307))

(declare-fun m!329309 () Bool)

(assert (=> b!321089 m!329309))

(check-sat (not b!321082) (not b!321088) (not start!32238) (not b!321083) (not b!321084) (not b!321081) (not b!321086))
(check-sat)
