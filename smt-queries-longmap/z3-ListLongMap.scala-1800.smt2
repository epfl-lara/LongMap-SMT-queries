; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32486 () Bool)

(assert start!32486)

(declare-fun b!324900 () Bool)

(declare-fun res!178285 () Bool)

(declare-fun e!200398 () Bool)

(assert (=> b!324900 (=> (not res!178285) (not e!200398))))

(declare-datatypes ((array!16638 0))(
  ( (array!16639 (arr!7876 (Array (_ BitVec 32) (_ BitVec 64))) (size!8228 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16638)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324900 (= res!178285 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324901 () Bool)

(declare-fun res!178288 () Bool)

(declare-fun e!200399 () Bool)

(assert (=> b!324901 (=> (not res!178288) (not e!200399))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2972 0))(
  ( (MissingZero!2972 (index!14064 (_ BitVec 32))) (Found!2972 (index!14065 (_ BitVec 32))) (Intermediate!2972 (undefined!3784 Bool) (index!14066 (_ BitVec 32)) (x!32413 (_ BitVec 32))) (Undefined!2972) (MissingVacant!2972 (index!14067 (_ BitVec 32))) )
))
(declare-fun lt!156924 () SeekEntryResult!2972)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16638 (_ BitVec 32)) SeekEntryResult!2972)

(assert (=> b!324901 (= res!178288 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156924))))

(declare-fun b!324902 () Bool)

(assert (=> b!324902 (= e!200398 e!200399)))

(declare-fun res!178290 () Bool)

(assert (=> b!324902 (=> (not res!178290) (not e!200399))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324902 (= res!178290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156924))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324902 (= lt!156924 (Intermediate!2972 false resIndex!58 resX!58))))

(declare-fun res!178281 () Bool)

(assert (=> start!32486 (=> (not res!178281) (not e!200398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32486 (= res!178281 (validMask!0 mask!3777))))

(assert (=> start!32486 e!200398))

(declare-fun array_inv!5826 (array!16638) Bool)

(assert (=> start!32486 (array_inv!5826 a!3305)))

(assert (=> start!32486 true))

(declare-fun b!324903 () Bool)

(declare-fun res!178289 () Bool)

(assert (=> b!324903 (=> (not res!178289) (not e!200398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324903 (= res!178289 (validKeyInArray!0 k0!2497))))

(declare-fun b!324904 () Bool)

(declare-fun res!178286 () Bool)

(assert (=> b!324904 (=> (not res!178286) (not e!200399))))

(assert (=> b!324904 (= res!178286 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7876 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324905 () Bool)

(declare-fun res!178284 () Bool)

(assert (=> b!324905 (=> (not res!178284) (not e!200398))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324905 (= res!178284 (and (= (size!8228 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8228 a!3305))))))

(declare-fun b!324906 () Bool)

(declare-fun res!178282 () Bool)

(assert (=> b!324906 (=> (not res!178282) (not e!200398))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16638 (_ BitVec 32)) SeekEntryResult!2972)

(assert (=> b!324906 (= res!178282 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2972 i!1250)))))

(declare-fun b!324907 () Bool)

(declare-fun res!178283 () Bool)

(assert (=> b!324907 (=> (not res!178283) (not e!200398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16638 (_ BitVec 32)) Bool)

(assert (=> b!324907 (= res!178283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324908 () Bool)

(assert (=> b!324908 (= e!200399 false)))

(declare-fun lt!156923 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324908 (= lt!156923 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!324909 () Bool)

(declare-fun res!178287 () Bool)

(assert (=> b!324909 (=> (not res!178287) (not e!200399))))

(assert (=> b!324909 (= res!178287 (and (= (select (arr!7876 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8228 a!3305))))))

(assert (= (and start!32486 res!178281) b!324905))

(assert (= (and b!324905 res!178284) b!324903))

(assert (= (and b!324903 res!178289) b!324900))

(assert (= (and b!324900 res!178285) b!324906))

(assert (= (and b!324906 res!178282) b!324907))

(assert (= (and b!324907 res!178283) b!324902))

(assert (= (and b!324902 res!178290) b!324909))

(assert (= (and b!324909 res!178287) b!324901))

(assert (= (and b!324901 res!178288) b!324904))

(assert (= (and b!324904 res!178286) b!324908))

(declare-fun m!332077 () Bool)

(assert (=> b!324902 m!332077))

(assert (=> b!324902 m!332077))

(declare-fun m!332079 () Bool)

(assert (=> b!324902 m!332079))

(declare-fun m!332081 () Bool)

(assert (=> b!324907 m!332081))

(declare-fun m!332083 () Bool)

(assert (=> b!324904 m!332083))

(declare-fun m!332085 () Bool)

(assert (=> b!324903 m!332085))

(declare-fun m!332087 () Bool)

(assert (=> b!324901 m!332087))

(declare-fun m!332089 () Bool)

(assert (=> b!324900 m!332089))

(declare-fun m!332091 () Bool)

(assert (=> b!324908 m!332091))

(declare-fun m!332093 () Bool)

(assert (=> start!32486 m!332093))

(declare-fun m!332095 () Bool)

(assert (=> start!32486 m!332095))

(declare-fun m!332097 () Bool)

(assert (=> b!324906 m!332097))

(declare-fun m!332099 () Bool)

(assert (=> b!324909 m!332099))

(check-sat (not b!324900) (not b!324902) (not b!324907) (not b!324906) (not start!32486) (not b!324901) (not b!324908) (not b!324903))
(check-sat)
