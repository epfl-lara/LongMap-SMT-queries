; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32252 () Bool)

(assert start!32252)

(declare-fun b!321166 () Bool)

(declare-fun res!175436 () Bool)

(declare-fun e!198999 () Bool)

(assert (=> b!321166 (=> (not res!175436) (not e!198999))))

(declare-datatypes ((array!16446 0))(
  ( (array!16447 (arr!7782 (Array (_ BitVec 32) (_ BitVec 64))) (size!8135 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16446)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321166 (= res!175436 (and (= (size!8135 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8135 a!3305))))))

(declare-fun b!321167 () Bool)

(declare-fun res!175440 () Bool)

(assert (=> b!321167 (=> (not res!175440) (not e!198999))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321167 (= res!175440 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321168 () Bool)

(declare-fun res!175434 () Bool)

(declare-fun e!199001 () Bool)

(assert (=> b!321168 (=> (not res!175434) (not e!199001))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321168 (= res!175434 (and (= (select (arr!7782 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8135 a!3305))))))

(declare-fun b!321169 () Bool)

(declare-fun res!175435 () Bool)

(assert (=> b!321169 (=> (not res!175435) (not e!198999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321169 (= res!175435 (validKeyInArray!0 k0!2497))))

(declare-fun b!321171 () Bool)

(assert (=> b!321171 (= e!198999 e!199001)))

(declare-fun res!175437 () Bool)

(assert (=> b!321171 (=> (not res!175437) (not e!199001))))

(declare-datatypes ((SeekEntryResult!2912 0))(
  ( (MissingZero!2912 (index!13824 (_ BitVec 32))) (Found!2912 (index!13825 (_ BitVec 32))) (Intermediate!2912 (undefined!3724 Bool) (index!13826 (_ BitVec 32)) (x!32102 (_ BitVec 32))) (Undefined!2912) (MissingVacant!2912 (index!13827 (_ BitVec 32))) )
))
(declare-fun lt!155960 () SeekEntryResult!2912)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16446 (_ BitVec 32)) SeekEntryResult!2912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321171 (= res!175437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!155960))))

(assert (=> b!321171 (= lt!155960 (Intermediate!2912 false resIndex!58 resX!58))))

(declare-fun b!321172 () Bool)

(declare-fun res!175439 () Bool)

(assert (=> b!321172 (=> (not res!175439) (not e!199001))))

(assert (=> b!321172 (= res!175439 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!155960))))

(declare-fun b!321173 () Bool)

(declare-fun res!175433 () Bool)

(assert (=> b!321173 (=> (not res!175433) (not e!198999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16446 (_ BitVec 32)) Bool)

(assert (=> b!321173 (= res!175433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321174 () Bool)

(assert (=> b!321174 (= e!199001 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7782 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7782 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7782 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun res!175438 () Bool)

(assert (=> start!32252 (=> (not res!175438) (not e!198999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32252 (= res!175438 (validMask!0 mask!3777))))

(assert (=> start!32252 e!198999))

(declare-fun array_inv!5754 (array!16446) Bool)

(assert (=> start!32252 (array_inv!5754 a!3305)))

(assert (=> start!32252 true))

(declare-fun b!321170 () Bool)

(declare-fun res!175432 () Bool)

(assert (=> b!321170 (=> (not res!175432) (not e!198999))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16446 (_ BitVec 32)) SeekEntryResult!2912)

(assert (=> b!321170 (= res!175432 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2912 i!1250)))))

(assert (= (and start!32252 res!175438) b!321166))

(assert (= (and b!321166 res!175436) b!321169))

(assert (= (and b!321169 res!175435) b!321167))

(assert (= (and b!321167 res!175440) b!321170))

(assert (= (and b!321170 res!175432) b!321173))

(assert (= (and b!321173 res!175433) b!321171))

(assert (= (and b!321171 res!175437) b!321168))

(assert (= (and b!321168 res!175434) b!321172))

(assert (= (and b!321172 res!175439) b!321174))

(declare-fun m!328855 () Bool)

(assert (=> b!321168 m!328855))

(declare-fun m!328857 () Bool)

(assert (=> b!321172 m!328857))

(declare-fun m!328859 () Bool)

(assert (=> b!321173 m!328859))

(declare-fun m!328861 () Bool)

(assert (=> b!321170 m!328861))

(declare-fun m!328863 () Bool)

(assert (=> start!32252 m!328863))

(declare-fun m!328865 () Bool)

(assert (=> start!32252 m!328865))

(declare-fun m!328867 () Bool)

(assert (=> b!321174 m!328867))

(declare-fun m!328869 () Bool)

(assert (=> b!321167 m!328869))

(declare-fun m!328871 () Bool)

(assert (=> b!321171 m!328871))

(assert (=> b!321171 m!328871))

(declare-fun m!328873 () Bool)

(assert (=> b!321171 m!328873))

(declare-fun m!328875 () Bool)

(assert (=> b!321169 m!328875))

(check-sat (not start!32252) (not b!321173) (not b!321169) (not b!321170) (not b!321172) (not b!321171) (not b!321167))
(check-sat)
