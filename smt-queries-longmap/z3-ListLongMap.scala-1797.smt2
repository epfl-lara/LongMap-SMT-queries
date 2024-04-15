; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32468 () Bool)

(assert start!32468)

(declare-fun b!324408 () Bool)

(declare-fun res!177886 () Bool)

(declare-fun e!200175 () Bool)

(assert (=> b!324408 (=> (not res!177886) (not e!200175))))

(declare-datatypes ((array!16611 0))(
  ( (array!16612 (arr!7863 (Array (_ BitVec 32) (_ BitVec 64))) (size!8216 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16611)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16611 (_ BitVec 32)) Bool)

(assert (=> b!324408 (= res!177886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324409 () Bool)

(declare-fun e!200177 () Bool)

(assert (=> b!324409 (= e!200177 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!156616 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324409 (= lt!156616 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun res!177893 () Bool)

(assert (=> start!32468 (=> (not res!177893) (not e!200175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32468 (= res!177893 (validMask!0 mask!3777))))

(assert (=> start!32468 e!200175))

(declare-fun array_inv!5835 (array!16611) Bool)

(assert (=> start!32468 (array_inv!5835 a!3305)))

(assert (=> start!32468 true))

(declare-fun b!324410 () Bool)

(assert (=> b!324410 (= e!200175 e!200177)))

(declare-fun res!177888 () Bool)

(assert (=> b!324410 (=> (not res!177888) (not e!200177))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2993 0))(
  ( (MissingZero!2993 (index!14148 (_ BitVec 32))) (Found!2993 (index!14149 (_ BitVec 32))) (Intermediate!2993 (undefined!3805 Bool) (index!14150 (_ BitVec 32)) (x!32408 (_ BitVec 32))) (Undefined!2993) (MissingVacant!2993 (index!14151 (_ BitVec 32))) )
))
(declare-fun lt!156617 () SeekEntryResult!2993)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16611 (_ BitVec 32)) SeekEntryResult!2993)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324410 (= res!177888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156617))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324410 (= lt!156617 (Intermediate!2993 false resIndex!58 resX!58))))

(declare-fun b!324411 () Bool)

(declare-fun res!177887 () Bool)

(assert (=> b!324411 (=> (not res!177887) (not e!200177))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324411 (= res!177887 (and (= (select (arr!7863 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8216 a!3305))))))

(declare-fun b!324412 () Bool)

(declare-fun res!177885 () Bool)

(assert (=> b!324412 (=> (not res!177885) (not e!200175))))

(declare-fun arrayContainsKey!0 (array!16611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324412 (= res!177885 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324413 () Bool)

(declare-fun res!177890 () Bool)

(assert (=> b!324413 (=> (not res!177890) (not e!200175))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16611 (_ BitVec 32)) SeekEntryResult!2993)

(assert (=> b!324413 (= res!177890 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2993 i!1250)))))

(declare-fun b!324414 () Bool)

(declare-fun res!177892 () Bool)

(assert (=> b!324414 (=> (not res!177892) (not e!200177))))

(assert (=> b!324414 (= res!177892 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7863 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324415 () Bool)

(declare-fun res!177889 () Bool)

(assert (=> b!324415 (=> (not res!177889) (not e!200177))))

(assert (=> b!324415 (= res!177889 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156617))))

(declare-fun b!324416 () Bool)

(declare-fun res!177894 () Bool)

(assert (=> b!324416 (=> (not res!177894) (not e!200175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324416 (= res!177894 (validKeyInArray!0 k0!2497))))

(declare-fun b!324417 () Bool)

(declare-fun res!177891 () Bool)

(assert (=> b!324417 (=> (not res!177891) (not e!200175))))

(assert (=> b!324417 (= res!177891 (and (= (size!8216 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8216 a!3305))))))

(assert (= (and start!32468 res!177893) b!324417))

(assert (= (and b!324417 res!177891) b!324416))

(assert (= (and b!324416 res!177894) b!324412))

(assert (= (and b!324412 res!177885) b!324413))

(assert (= (and b!324413 res!177890) b!324408))

(assert (= (and b!324408 res!177886) b!324410))

(assert (= (and b!324410 res!177888) b!324411))

(assert (= (and b!324411 res!177887) b!324415))

(assert (= (and b!324415 res!177889) b!324414))

(assert (= (and b!324414 res!177892) b!324409))

(declare-fun m!330949 () Bool)

(assert (=> b!324408 m!330949))

(declare-fun m!330951 () Bool)

(assert (=> b!324409 m!330951))

(declare-fun m!330953 () Bool)

(assert (=> b!324412 m!330953))

(declare-fun m!330955 () Bool)

(assert (=> b!324415 m!330955))

(declare-fun m!330957 () Bool)

(assert (=> b!324411 m!330957))

(declare-fun m!330959 () Bool)

(assert (=> b!324416 m!330959))

(declare-fun m!330961 () Bool)

(assert (=> start!32468 m!330961))

(declare-fun m!330963 () Bool)

(assert (=> start!32468 m!330963))

(declare-fun m!330965 () Bool)

(assert (=> b!324414 m!330965))

(declare-fun m!330967 () Bool)

(assert (=> b!324413 m!330967))

(declare-fun m!330969 () Bool)

(assert (=> b!324410 m!330969))

(assert (=> b!324410 m!330969))

(declare-fun m!330971 () Bool)

(assert (=> b!324410 m!330971))

(check-sat (not b!324413) (not start!32468) (not b!324408) (not b!324416) (not b!324410) (not b!324415) (not b!324412) (not b!324409))
(check-sat)
