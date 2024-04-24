; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32498 () Bool)

(assert start!32498)

(declare-fun b!325080 () Bool)

(declare-fun res!178464 () Bool)

(declare-fun e!200453 () Bool)

(assert (=> b!325080 (=> (not res!178464) (not e!200453))))

(declare-datatypes ((array!16650 0))(
  ( (array!16651 (arr!7882 (Array (_ BitVec 32) (_ BitVec 64))) (size!8234 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16650)

(declare-datatypes ((SeekEntryResult!2978 0))(
  ( (MissingZero!2978 (index!14088 (_ BitVec 32))) (Found!2978 (index!14089 (_ BitVec 32))) (Intermediate!2978 (undefined!3790 Bool) (index!14090 (_ BitVec 32)) (x!32435 (_ BitVec 32))) (Undefined!2978) (MissingVacant!2978 (index!14091 (_ BitVec 32))) )
))
(declare-fun lt!156959 () SeekEntryResult!2978)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16650 (_ BitVec 32)) SeekEntryResult!2978)

(assert (=> b!325080 (= res!178464 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156959))))

(declare-fun res!178462 () Bool)

(declare-fun e!200454 () Bool)

(assert (=> start!32498 (=> (not res!178462) (not e!200454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32498 (= res!178462 (validMask!0 mask!3777))))

(assert (=> start!32498 e!200454))

(declare-fun array_inv!5832 (array!16650) Bool)

(assert (=> start!32498 (array_inv!5832 a!3305)))

(assert (=> start!32498 true))

(declare-fun b!325081 () Bool)

(declare-fun res!178463 () Bool)

(assert (=> b!325081 (=> (not res!178463) (not e!200454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325081 (= res!178463 (validKeyInArray!0 k0!2497))))

(declare-fun b!325082 () Bool)

(declare-fun res!178467 () Bool)

(assert (=> b!325082 (=> (not res!178467) (not e!200454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16650 (_ BitVec 32)) Bool)

(assert (=> b!325082 (= res!178467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325083 () Bool)

(declare-fun res!178470 () Bool)

(assert (=> b!325083 (=> (not res!178470) (not e!200454))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16650 (_ BitVec 32)) SeekEntryResult!2978)

(assert (=> b!325083 (= res!178470 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2978 i!1250)))))

(declare-fun b!325084 () Bool)

(declare-fun res!178469 () Bool)

(assert (=> b!325084 (=> (not res!178469) (not e!200454))))

(assert (=> b!325084 (= res!178469 (and (= (size!8234 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8234 a!3305))))))

(declare-fun b!325085 () Bool)

(declare-fun res!178468 () Bool)

(assert (=> b!325085 (=> (not res!178468) (not e!200453))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325085 (= res!178468 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7882 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325086 () Bool)

(declare-fun res!178461 () Bool)

(assert (=> b!325086 (=> (not res!178461) (not e!200453))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325086 (= res!178461 (and (= (select (arr!7882 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8234 a!3305))))))

(declare-fun b!325087 () Bool)

(declare-fun res!178466 () Bool)

(assert (=> b!325087 (=> (not res!178466) (not e!200454))))

(declare-fun arrayContainsKey!0 (array!16650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325087 (= res!178466 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325088 () Bool)

(assert (=> b!325088 (= e!200453 false)))

(declare-fun lt!156960 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325088 (= lt!156960 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!325089 () Bool)

(assert (=> b!325089 (= e!200454 e!200453)))

(declare-fun res!178465 () Bool)

(assert (=> b!325089 (=> (not res!178465) (not e!200453))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325089 (= res!178465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156959))))

(assert (=> b!325089 (= lt!156959 (Intermediate!2978 false resIndex!58 resX!58))))

(assert (= (and start!32498 res!178462) b!325084))

(assert (= (and b!325084 res!178469) b!325081))

(assert (= (and b!325081 res!178463) b!325087))

(assert (= (and b!325087 res!178466) b!325083))

(assert (= (and b!325083 res!178470) b!325082))

(assert (= (and b!325082 res!178467) b!325089))

(assert (= (and b!325089 res!178465) b!325086))

(assert (= (and b!325086 res!178461) b!325080))

(assert (= (and b!325080 res!178464) b!325085))

(assert (= (and b!325085 res!178468) b!325088))

(declare-fun m!332221 () Bool)

(assert (=> b!325085 m!332221))

(declare-fun m!332223 () Bool)

(assert (=> b!325081 m!332223))

(declare-fun m!332225 () Bool)

(assert (=> b!325083 m!332225))

(declare-fun m!332227 () Bool)

(assert (=> b!325088 m!332227))

(declare-fun m!332229 () Bool)

(assert (=> b!325082 m!332229))

(declare-fun m!332231 () Bool)

(assert (=> start!32498 m!332231))

(declare-fun m!332233 () Bool)

(assert (=> start!32498 m!332233))

(declare-fun m!332235 () Bool)

(assert (=> b!325080 m!332235))

(declare-fun m!332237 () Bool)

(assert (=> b!325087 m!332237))

(declare-fun m!332239 () Bool)

(assert (=> b!325089 m!332239))

(assert (=> b!325089 m!332239))

(declare-fun m!332241 () Bool)

(assert (=> b!325089 m!332241))

(declare-fun m!332243 () Bool)

(assert (=> b!325086 m!332243))

(check-sat (not b!325082) (not b!325081) (not b!325083) (not b!325088) (not b!325089) (not b!325087) (not start!32498) (not b!325080))
(check-sat)
