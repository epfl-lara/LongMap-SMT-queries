; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32492 () Bool)

(assert start!32492)

(declare-fun b!324990 () Bool)

(declare-fun res!178373 () Bool)

(declare-fun e!200426 () Bool)

(assert (=> b!324990 (=> (not res!178373) (not e!200426))))

(declare-datatypes ((array!16644 0))(
  ( (array!16645 (arr!7879 (Array (_ BitVec 32) (_ BitVec 64))) (size!8231 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16644)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324990 (= res!178373 (and (= (size!8231 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8231 a!3305))))))

(declare-fun b!324991 () Bool)

(declare-fun res!178374 () Bool)

(declare-fun e!200425 () Bool)

(assert (=> b!324991 (=> (not res!178374) (not e!200425))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2975 0))(
  ( (MissingZero!2975 (index!14076 (_ BitVec 32))) (Found!2975 (index!14077 (_ BitVec 32))) (Intermediate!2975 (undefined!3787 Bool) (index!14078 (_ BitVec 32)) (x!32424 (_ BitVec 32))) (Undefined!2975) (MissingVacant!2975 (index!14079 (_ BitVec 32))) )
))
(declare-fun lt!156941 () SeekEntryResult!2975)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16644 (_ BitVec 32)) SeekEntryResult!2975)

(assert (=> b!324991 (= res!178374 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156941))))

(declare-fun b!324992 () Bool)

(declare-fun res!178375 () Bool)

(assert (=> b!324992 (=> (not res!178375) (not e!200426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16644 (_ BitVec 32)) Bool)

(assert (=> b!324992 (= res!178375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324993 () Bool)

(declare-fun res!178371 () Bool)

(assert (=> b!324993 (=> (not res!178371) (not e!200426))))

(declare-fun arrayContainsKey!0 (array!16644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324993 (= res!178371 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324994 () Bool)

(declare-fun res!178372 () Bool)

(assert (=> b!324994 (=> (not res!178372) (not e!200425))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324994 (= res!178372 (and (= (select (arr!7879 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8231 a!3305))))))

(declare-fun b!324995 () Bool)

(declare-fun res!178380 () Bool)

(assert (=> b!324995 (=> (not res!178380) (not e!200425))))

(assert (=> b!324995 (= res!178380 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7879 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324996 () Bool)

(assert (=> b!324996 (= e!200425 false)))

(declare-fun lt!156942 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324996 (= lt!156942 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!324997 () Bool)

(declare-fun res!178379 () Bool)

(assert (=> b!324997 (=> (not res!178379) (not e!200426))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16644 (_ BitVec 32)) SeekEntryResult!2975)

(assert (=> b!324997 (= res!178379 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2975 i!1250)))))

(declare-fun b!324998 () Bool)

(declare-fun res!178378 () Bool)

(assert (=> b!324998 (=> (not res!178378) (not e!200426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324998 (= res!178378 (validKeyInArray!0 k0!2497))))

(declare-fun b!324999 () Bool)

(assert (=> b!324999 (= e!200426 e!200425)))

(declare-fun res!178377 () Bool)

(assert (=> b!324999 (=> (not res!178377) (not e!200425))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324999 (= res!178377 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156941))))

(assert (=> b!324999 (= lt!156941 (Intermediate!2975 false resIndex!58 resX!58))))

(declare-fun res!178376 () Bool)

(assert (=> start!32492 (=> (not res!178376) (not e!200426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32492 (= res!178376 (validMask!0 mask!3777))))

(assert (=> start!32492 e!200426))

(declare-fun array_inv!5829 (array!16644) Bool)

(assert (=> start!32492 (array_inv!5829 a!3305)))

(assert (=> start!32492 true))

(assert (= (and start!32492 res!178376) b!324990))

(assert (= (and b!324990 res!178373) b!324998))

(assert (= (and b!324998 res!178378) b!324993))

(assert (= (and b!324993 res!178371) b!324997))

(assert (= (and b!324997 res!178379) b!324992))

(assert (= (and b!324992 res!178375) b!324999))

(assert (= (and b!324999 res!178377) b!324994))

(assert (= (and b!324994 res!178372) b!324991))

(assert (= (and b!324991 res!178374) b!324995))

(assert (= (and b!324995 res!178380) b!324996))

(declare-fun m!332149 () Bool)

(assert (=> b!324991 m!332149))

(declare-fun m!332151 () Bool)

(assert (=> b!324996 m!332151))

(declare-fun m!332153 () Bool)

(assert (=> start!32492 m!332153))

(declare-fun m!332155 () Bool)

(assert (=> start!32492 m!332155))

(declare-fun m!332157 () Bool)

(assert (=> b!324998 m!332157))

(declare-fun m!332159 () Bool)

(assert (=> b!324997 m!332159))

(declare-fun m!332161 () Bool)

(assert (=> b!324992 m!332161))

(declare-fun m!332163 () Bool)

(assert (=> b!324995 m!332163))

(declare-fun m!332165 () Bool)

(assert (=> b!324993 m!332165))

(declare-fun m!332167 () Bool)

(assert (=> b!324994 m!332167))

(declare-fun m!332169 () Bool)

(assert (=> b!324999 m!332169))

(assert (=> b!324999 m!332169))

(declare-fun m!332171 () Bool)

(assert (=> b!324999 m!332171))

(check-sat (not b!324999) (not b!324996) (not start!32492) (not b!324998) (not b!324993) (not b!324991) (not b!324997) (not b!324992))
(check-sat)
