; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32508 () Bool)

(assert start!32508)

(declare-fun b!325073 () Bool)

(declare-fun res!178413 () Bool)

(declare-fun e!200469 () Bool)

(assert (=> b!325073 (=> (not res!178413) (not e!200469))))

(declare-datatypes ((array!16647 0))(
  ( (array!16648 (arr!7881 (Array (_ BitVec 32) (_ BitVec 64))) (size!8233 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16647)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325073 (= res!178413 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!178409 () Bool)

(assert (=> start!32508 (=> (not res!178409) (not e!200469))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32508 (= res!178409 (validMask!0 mask!3777))))

(assert (=> start!32508 e!200469))

(declare-fun array_inv!5844 (array!16647) Bool)

(assert (=> start!32508 (array_inv!5844 a!3305)))

(assert (=> start!32508 true))

(declare-fun b!325074 () Bool)

(declare-fun e!200470 () Bool)

(assert (=> b!325074 (= e!200470 false)))

(declare-fun lt!156929 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325074 (= lt!156929 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325075 () Bool)

(declare-fun res!178408 () Bool)

(assert (=> b!325075 (=> (not res!178408) (not e!200469))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3012 0))(
  ( (MissingZero!3012 (index!14224 (_ BitVec 32))) (Found!3012 (index!14225 (_ BitVec 32))) (Intermediate!3012 (undefined!3824 Bool) (index!14226 (_ BitVec 32)) (x!32464 (_ BitVec 32))) (Undefined!3012) (MissingVacant!3012 (index!14227 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16647 (_ BitVec 32)) SeekEntryResult!3012)

(assert (=> b!325075 (= res!178408 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3012 i!1250)))))

(declare-fun b!325076 () Bool)

(declare-fun res!178411 () Bool)

(assert (=> b!325076 (=> (not res!178411) (not e!200469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16647 (_ BitVec 32)) Bool)

(assert (=> b!325076 (= res!178411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325077 () Bool)

(declare-fun res!178407 () Bool)

(assert (=> b!325077 (=> (not res!178407) (not e!200470))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325077 (= res!178407 (and (= (select (arr!7881 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8233 a!3305))))))

(declare-fun b!325078 () Bool)

(assert (=> b!325078 (= e!200469 e!200470)))

(declare-fun res!178405 () Bool)

(assert (=> b!325078 (=> (not res!178405) (not e!200470))))

(declare-fun lt!156930 () SeekEntryResult!3012)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16647 (_ BitVec 32)) SeekEntryResult!3012)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325078 (= res!178405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156930))))

(assert (=> b!325078 (= lt!156930 (Intermediate!3012 false resIndex!58 resX!58))))

(declare-fun b!325079 () Bool)

(declare-fun res!178406 () Bool)

(assert (=> b!325079 (=> (not res!178406) (not e!200470))))

(assert (=> b!325079 (= res!178406 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156930))))

(declare-fun b!325080 () Bool)

(declare-fun res!178404 () Bool)

(assert (=> b!325080 (=> (not res!178404) (not e!200470))))

(assert (=> b!325080 (= res!178404 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7881 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325081 () Bool)

(declare-fun res!178410 () Bool)

(assert (=> b!325081 (=> (not res!178410) (not e!200469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325081 (= res!178410 (validKeyInArray!0 k0!2497))))

(declare-fun b!325082 () Bool)

(declare-fun res!178412 () Bool)

(assert (=> b!325082 (=> (not res!178412) (not e!200469))))

(assert (=> b!325082 (= res!178412 (and (= (size!8233 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8233 a!3305))))))

(assert (= (and start!32508 res!178409) b!325082))

(assert (= (and b!325082 res!178412) b!325081))

(assert (= (and b!325081 res!178410) b!325073))

(assert (= (and b!325073 res!178413) b!325075))

(assert (= (and b!325075 res!178408) b!325076))

(assert (= (and b!325076 res!178411) b!325078))

(assert (= (and b!325078 res!178405) b!325077))

(assert (= (and b!325077 res!178407) b!325079))

(assert (= (and b!325079 res!178406) b!325080))

(assert (= (and b!325080 res!178404) b!325074))

(declare-fun m!331991 () Bool)

(assert (=> b!325076 m!331991))

(declare-fun m!331993 () Bool)

(assert (=> b!325081 m!331993))

(declare-fun m!331995 () Bool)

(assert (=> start!32508 m!331995))

(declare-fun m!331997 () Bool)

(assert (=> start!32508 m!331997))

(declare-fun m!331999 () Bool)

(assert (=> b!325078 m!331999))

(assert (=> b!325078 m!331999))

(declare-fun m!332001 () Bool)

(assert (=> b!325078 m!332001))

(declare-fun m!332003 () Bool)

(assert (=> b!325075 m!332003))

(declare-fun m!332005 () Bool)

(assert (=> b!325079 m!332005))

(declare-fun m!332007 () Bool)

(assert (=> b!325077 m!332007))

(declare-fun m!332009 () Bool)

(assert (=> b!325074 m!332009))

(declare-fun m!332011 () Bool)

(assert (=> b!325080 m!332011))

(declare-fun m!332013 () Bool)

(assert (=> b!325073 m!332013))

(check-sat (not b!325073) (not start!32508) (not b!325074) (not b!325076) (not b!325081) (not b!325075) (not b!325079) (not b!325078))
(check-sat)
