; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32504 () Bool)

(assert start!32504)

(declare-fun b!325013 () Bool)

(declare-fun res!178348 () Bool)

(declare-fun e!200452 () Bool)

(assert (=> b!325013 (=> (not res!178348) (not e!200452))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3010 0))(
  ( (MissingZero!3010 (index!14216 (_ BitVec 32))) (Found!3010 (index!14217 (_ BitVec 32))) (Intermediate!3010 (undefined!3822 Bool) (index!14218 (_ BitVec 32)) (x!32454 (_ BitVec 32))) (Undefined!3010) (MissingVacant!3010 (index!14219 (_ BitVec 32))) )
))
(declare-fun lt!156918 () SeekEntryResult!3010)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((array!16643 0))(
  ( (array!16644 (arr!7879 (Array (_ BitVec 32) (_ BitVec 64))) (size!8231 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16643)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16643 (_ BitVec 32)) SeekEntryResult!3010)

(assert (=> b!325013 (= res!178348 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156918))))

(declare-fun b!325014 () Bool)

(declare-fun e!200450 () Bool)

(assert (=> b!325014 (= e!200450 e!200452)))

(declare-fun res!178344 () Bool)

(assert (=> b!325014 (=> (not res!178344) (not e!200452))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325014 (= res!178344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156918))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325014 (= lt!156918 (Intermediate!3010 false resIndex!58 resX!58))))

(declare-fun b!325015 () Bool)

(declare-fun res!178350 () Bool)

(assert (=> b!325015 (=> (not res!178350) (not e!200450))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16643 (_ BitVec 32)) SeekEntryResult!3010)

(assert (=> b!325015 (= res!178350 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3010 i!1250)))))

(declare-fun b!325016 () Bool)

(declare-fun res!178353 () Bool)

(assert (=> b!325016 (=> (not res!178353) (not e!200450))))

(assert (=> b!325016 (= res!178353 (and (= (size!8231 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8231 a!3305))))))

(declare-fun b!325017 () Bool)

(declare-fun res!178345 () Bool)

(assert (=> b!325017 (=> (not res!178345) (not e!200450))))

(declare-fun arrayContainsKey!0 (array!16643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325017 (= res!178345 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!178346 () Bool)

(assert (=> start!32504 (=> (not res!178346) (not e!200450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32504 (= res!178346 (validMask!0 mask!3777))))

(assert (=> start!32504 e!200450))

(declare-fun array_inv!5842 (array!16643) Bool)

(assert (=> start!32504 (array_inv!5842 a!3305)))

(assert (=> start!32504 true))

(declare-fun b!325018 () Bool)

(declare-fun res!178351 () Bool)

(assert (=> b!325018 (=> (not res!178351) (not e!200450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325018 (= res!178351 (validKeyInArray!0 k!2497))))

(declare-fun b!325019 () Bool)

(declare-fun res!178347 () Bool)

(assert (=> b!325019 (=> (not res!178347) (not e!200452))))

(assert (=> b!325019 (= res!178347 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7879 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325020 () Bool)

(assert (=> b!325020 (= e!200452 false)))

(declare-fun lt!156917 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325020 (= lt!156917 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325021 () Bool)

(declare-fun res!178352 () Bool)

(assert (=> b!325021 (=> (not res!178352) (not e!200452))))

(assert (=> b!325021 (= res!178352 (and (= (select (arr!7879 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8231 a!3305))))))

(declare-fun b!325022 () Bool)

(declare-fun res!178349 () Bool)

(assert (=> b!325022 (=> (not res!178349) (not e!200450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16643 (_ BitVec 32)) Bool)

(assert (=> b!325022 (= res!178349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32504 res!178346) b!325016))

(assert (= (and b!325016 res!178353) b!325018))

(assert (= (and b!325018 res!178351) b!325017))

(assert (= (and b!325017 res!178345) b!325015))

(assert (= (and b!325015 res!178350) b!325022))

(assert (= (and b!325022 res!178349) b!325014))

(assert (= (and b!325014 res!178344) b!325021))

(assert (= (and b!325021 res!178352) b!325013))

(assert (= (and b!325013 res!178348) b!325019))

(assert (= (and b!325019 res!178347) b!325020))

(declare-fun m!331943 () Bool)

(assert (=> b!325019 m!331943))

(declare-fun m!331945 () Bool)

(assert (=> b!325018 m!331945))

(declare-fun m!331947 () Bool)

(assert (=> b!325015 m!331947))

(declare-fun m!331949 () Bool)

(assert (=> b!325020 m!331949))

(declare-fun m!331951 () Bool)

(assert (=> start!32504 m!331951))

(declare-fun m!331953 () Bool)

(assert (=> start!32504 m!331953))

(declare-fun m!331955 () Bool)

(assert (=> b!325022 m!331955))

(declare-fun m!331957 () Bool)

(assert (=> b!325021 m!331957))

(declare-fun m!331959 () Bool)

(assert (=> b!325014 m!331959))

(assert (=> b!325014 m!331959))

(declare-fun m!331961 () Bool)

(assert (=> b!325014 m!331961))

(declare-fun m!331963 () Bool)

(assert (=> b!325013 m!331963))

(declare-fun m!331965 () Bool)

(assert (=> b!325017 m!331965))

(push 1)

(assert (not b!325018))

(assert (not b!325020))

(assert (not b!325014))

(assert (not b!325015))

(assert (not b!325013))

(assert (not b!325017))

(assert (not b!325022))

(assert (not start!32504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

