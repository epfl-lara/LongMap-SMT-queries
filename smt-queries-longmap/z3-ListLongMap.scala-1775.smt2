; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32336 () Bool)

(assert start!32336)

(declare-fun b!321825 () Bool)

(declare-fun res!175952 () Bool)

(declare-fun e!199268 () Bool)

(assert (=> b!321825 (=> (not res!175952) (not e!199268))))

(declare-datatypes ((array!16479 0))(
  ( (array!16480 (arr!7797 (Array (_ BitVec 32) (_ BitVec 64))) (size!8150 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16479)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321825 (= res!175952 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321826 () Bool)

(declare-fun res!175954 () Bool)

(assert (=> b!321826 (=> (not res!175954) (not e!199268))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2927 0))(
  ( (MissingZero!2927 (index!13884 (_ BitVec 32))) (Found!2927 (index!13885 (_ BitVec 32))) (Intermediate!2927 (undefined!3739 Bool) (index!13886 (_ BitVec 32)) (x!32166 (_ BitVec 32))) (Undefined!2927) (MissingVacant!2927 (index!13887 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16479 (_ BitVec 32)) SeekEntryResult!2927)

(assert (=> b!321826 (= res!175954 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2927 i!1250)))))

(declare-fun b!321827 () Bool)

(declare-fun res!175950 () Bool)

(declare-fun e!199266 () Bool)

(assert (=> b!321827 (=> (not res!175950) (not e!199266))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!321827 (= res!175950 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7797 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7797 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7797 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321828 () Bool)

(declare-fun res!175955 () Bool)

(assert (=> b!321828 (=> (not res!175955) (not e!199268))))

(assert (=> b!321828 (= res!175955 (and (= (size!8150 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8150 a!3305))))))

(declare-fun b!321829 () Bool)

(declare-fun res!175958 () Bool)

(assert (=> b!321829 (=> (not res!175958) (not e!199268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321829 (= res!175958 (validKeyInArray!0 k0!2497))))

(declare-fun res!175959 () Bool)

(assert (=> start!32336 (=> (not res!175959) (not e!199268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32336 (= res!175959 (validMask!0 mask!3777))))

(assert (=> start!32336 e!199268))

(declare-fun array_inv!5769 (array!16479) Bool)

(assert (=> start!32336 (array_inv!5769 a!3305)))

(assert (=> start!32336 true))

(declare-fun b!321830 () Bool)

(declare-fun res!175957 () Bool)

(assert (=> b!321830 (=> (not res!175957) (not e!199268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16479 (_ BitVec 32)) Bool)

(assert (=> b!321830 (= res!175957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321831 () Bool)

(assert (=> b!321831 (= e!199268 e!199266)))

(declare-fun res!175951 () Bool)

(assert (=> b!321831 (=> (not res!175951) (not e!199266))))

(declare-fun lt!156148 () SeekEntryResult!2927)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16479 (_ BitVec 32)) SeekEntryResult!2927)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321831 (= res!175951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156148))))

(assert (=> b!321831 (= lt!156148 (Intermediate!2927 false resIndex!58 resX!58))))

(declare-fun b!321832 () Bool)

(declare-fun res!175953 () Bool)

(assert (=> b!321832 (=> (not res!175953) (not e!199266))))

(assert (=> b!321832 (= res!175953 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156148))))

(declare-fun b!321833 () Bool)

(declare-fun res!175956 () Bool)

(assert (=> b!321833 (=> (not res!175956) (not e!199266))))

(assert (=> b!321833 (= res!175956 (and (= (select (arr!7797 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8150 a!3305))))))

(declare-fun lt!156149 () (_ BitVec 32))

(declare-fun b!321834 () Bool)

(assert (=> b!321834 (= e!199266 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge lt!156149 #b00000000000000000000000000000000) (bvslt lt!156149 (bvadd #b00000000000000000000000000000001 mask!3777)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321834 (= lt!156149 (nextIndex!0 index!1840 x!1490 mask!3777))))

(assert (= (and start!32336 res!175959) b!321828))

(assert (= (and b!321828 res!175955) b!321829))

(assert (= (and b!321829 res!175958) b!321825))

(assert (= (and b!321825 res!175952) b!321826))

(assert (= (and b!321826 res!175954) b!321830))

(assert (= (and b!321830 res!175957) b!321831))

(assert (= (and b!321831 res!175951) b!321833))

(assert (= (and b!321833 res!175956) b!321832))

(assert (= (and b!321832 res!175953) b!321827))

(assert (= (and b!321827 res!175950) b!321834))

(declare-fun m!329323 () Bool)

(assert (=> b!321834 m!329323))

(declare-fun m!329325 () Bool)

(assert (=> b!321826 m!329325))

(declare-fun m!329327 () Bool)

(assert (=> b!321830 m!329327))

(declare-fun m!329329 () Bool)

(assert (=> start!32336 m!329329))

(declare-fun m!329331 () Bool)

(assert (=> start!32336 m!329331))

(declare-fun m!329333 () Bool)

(assert (=> b!321829 m!329333))

(declare-fun m!329335 () Bool)

(assert (=> b!321832 m!329335))

(declare-fun m!329337 () Bool)

(assert (=> b!321833 m!329337))

(declare-fun m!329339 () Bool)

(assert (=> b!321825 m!329339))

(declare-fun m!329341 () Bool)

(assert (=> b!321827 m!329341))

(declare-fun m!329343 () Bool)

(assert (=> b!321831 m!329343))

(assert (=> b!321831 m!329343))

(declare-fun m!329345 () Bool)

(assert (=> b!321831 m!329345))

(check-sat (not b!321831) (not b!321832) (not b!321830) (not b!321829) (not b!321834) (not b!321826) (not b!321825) (not start!32336))
(check-sat)
