; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51560 () Bool)

(assert start!51560)

(declare-fun b!564058 () Bool)

(declare-fun res!355354 () Bool)

(declare-fun e!324902 () Bool)

(assert (=> b!564058 (=> (not res!355354) (not e!324902))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564058 (= res!355354 (validKeyInArray!0 k0!1914))))

(declare-fun b!564059 () Bool)

(declare-fun e!324903 () Bool)

(assert (=> b!564059 (= e!324902 e!324903)))

(declare-fun res!355352 () Bool)

(assert (=> b!564059 (=> (not res!355352) (not e!324903))))

(declare-datatypes ((SeekEntryResult!5464 0))(
  ( (MissingZero!5464 (index!24083 (_ BitVec 32))) (Found!5464 (index!24084 (_ BitVec 32))) (Intermediate!5464 (undefined!6276 Bool) (index!24085 (_ BitVec 32)) (x!52970 (_ BitVec 32))) (Undefined!5464) (MissingVacant!5464 (index!24086 (_ BitVec 32))) )
))
(declare-fun lt!257269 () SeekEntryResult!5464)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564059 (= res!355352 (or (= lt!257269 (MissingZero!5464 i!1132)) (= lt!257269 (MissingVacant!5464 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35434 0))(
  ( (array!35435 (arr!17018 (Array (_ BitVec 32) (_ BitVec 64))) (size!17383 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35434)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35434 (_ BitVec 32)) SeekEntryResult!5464)

(assert (=> b!564059 (= lt!257269 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564060 () Bool)

(declare-fun res!355358 () Bool)

(assert (=> b!564060 (=> (not res!355358) (not e!324902))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564060 (= res!355358 (and (= (size!17383 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17383 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17383 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!355356 () Bool)

(assert (=> start!51560 (=> (not res!355356) (not e!324902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51560 (= res!355356 (validMask!0 mask!3119))))

(assert (=> start!51560 e!324902))

(assert (=> start!51560 true))

(declare-fun array_inv!12901 (array!35434) Bool)

(assert (=> start!51560 (array_inv!12901 a!3118)))

(declare-fun b!564061 () Bool)

(declare-fun res!355357 () Bool)

(assert (=> b!564061 (=> (not res!355357) (not e!324902))))

(declare-fun arrayContainsKey!0 (array!35434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564061 (= res!355357 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564062 () Bool)

(assert (=> b!564062 (= e!324903 false)))

(declare-fun lt!257268 () Bool)

(declare-datatypes ((List!11137 0))(
  ( (Nil!11134) (Cons!11133 (h!12136 (_ BitVec 64)) (t!17356 List!11137)) )
))
(declare-fun arrayNoDuplicates!0 (array!35434 (_ BitVec 32) List!11137) Bool)

(assert (=> b!564062 (= lt!257268 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11134))))

(declare-fun b!564063 () Bool)

(declare-fun res!355353 () Bool)

(assert (=> b!564063 (=> (not res!355353) (not e!324903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35434 (_ BitVec 32)) Bool)

(assert (=> b!564063 (= res!355353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564064 () Bool)

(declare-fun res!355355 () Bool)

(assert (=> b!564064 (=> (not res!355355) (not e!324902))))

(assert (=> b!564064 (= res!355355 (validKeyInArray!0 (select (arr!17018 a!3118) j!142)))))

(assert (= (and start!51560 res!355356) b!564060))

(assert (= (and b!564060 res!355358) b!564064))

(assert (= (and b!564064 res!355355) b!564058))

(assert (= (and b!564058 res!355354) b!564061))

(assert (= (and b!564061 res!355357) b!564059))

(assert (= (and b!564059 res!355352) b!564063))

(assert (= (and b!564063 res!355353) b!564062))

(declare-fun m!541991 () Bool)

(assert (=> start!51560 m!541991))

(declare-fun m!541993 () Bool)

(assert (=> start!51560 m!541993))

(declare-fun m!541995 () Bool)

(assert (=> b!564058 m!541995))

(declare-fun m!541997 () Bool)

(assert (=> b!564064 m!541997))

(assert (=> b!564064 m!541997))

(declare-fun m!541999 () Bool)

(assert (=> b!564064 m!541999))

(declare-fun m!542001 () Bool)

(assert (=> b!564061 m!542001))

(declare-fun m!542003 () Bool)

(assert (=> b!564059 m!542003))

(declare-fun m!542005 () Bool)

(assert (=> b!564062 m!542005))

(declare-fun m!542007 () Bool)

(assert (=> b!564063 m!542007))

(check-sat (not b!564058) (not b!564064) (not b!564063) (not b!564062) (not b!564061) (not start!51560) (not b!564059))
(check-sat)
