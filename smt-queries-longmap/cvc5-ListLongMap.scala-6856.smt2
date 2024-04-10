; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86390 () Bool)

(assert start!86390)

(declare-fun b!999803 () Bool)

(declare-fun e!563674 () Bool)

(declare-fun e!563672 () Bool)

(assert (=> b!999803 (= e!563674 e!563672)))

(declare-fun res!669287 () Bool)

(assert (=> b!999803 (=> (not res!669287) (not e!563672))))

(declare-datatypes ((SeekEntryResult!9353 0))(
  ( (MissingZero!9353 (index!39783 (_ BitVec 32))) (Found!9353 (index!39784 (_ BitVec 32))) (Intermediate!9353 (undefined!10165 Bool) (index!39785 (_ BitVec 32)) (x!87221 (_ BitVec 32))) (Undefined!9353) (MissingVacant!9353 (index!39786 (_ BitVec 32))) )
))
(declare-fun lt!442124 () SeekEntryResult!9353)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999803 (= res!669287 (or (= lt!442124 (MissingVacant!9353 i!1194)) (= lt!442124 (MissingZero!9353 i!1194))))))

(declare-datatypes ((array!63191 0))(
  ( (array!63192 (arr!30421 (Array (_ BitVec 32) (_ BitVec 64))) (size!30923 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63191)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63191 (_ BitVec 32)) SeekEntryResult!9353)

(assert (=> b!999803 (= lt!442124 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999804 () Bool)

(declare-fun e!563673 () Bool)

(assert (=> b!999804 (= e!563673 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!442122 () SeekEntryResult!9353)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63191 (_ BitVec 32)) SeekEntryResult!9353)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999804 (= lt!442122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30421 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30421 a!3219) i!1194 k!2224) j!170) (array!63192 (store (arr!30421 a!3219) i!1194 k!2224) (size!30923 a!3219)) mask!3464))))

(declare-fun res!669290 () Bool)

(assert (=> start!86390 (=> (not res!669290) (not e!563674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86390 (= res!669290 (validMask!0 mask!3464))))

(assert (=> start!86390 e!563674))

(declare-fun array_inv!23545 (array!63191) Bool)

(assert (=> start!86390 (array_inv!23545 a!3219)))

(assert (=> start!86390 true))

(declare-fun b!999805 () Bool)

(declare-fun res!669286 () Bool)

(assert (=> b!999805 (=> (not res!669286) (not e!563674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999805 (= res!669286 (validKeyInArray!0 (select (arr!30421 a!3219) j!170)))))

(declare-fun b!999806 () Bool)

(declare-fun res!669283 () Bool)

(assert (=> b!999806 (=> (not res!669283) (not e!563673))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!442123 () SeekEntryResult!9353)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999806 (= res!669283 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30421 a!3219) j!170) a!3219 mask!3464) lt!442123))))

(declare-fun b!999807 () Bool)

(declare-fun res!669281 () Bool)

(assert (=> b!999807 (=> (not res!669281) (not e!563674))))

(assert (=> b!999807 (= res!669281 (validKeyInArray!0 k!2224))))

(declare-fun b!999808 () Bool)

(declare-fun res!669285 () Bool)

(assert (=> b!999808 (=> (not res!669285) (not e!563674))))

(declare-fun arrayContainsKey!0 (array!63191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999808 (= res!669285 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999809 () Bool)

(declare-fun res!669284 () Bool)

(assert (=> b!999809 (=> (not res!669284) (not e!563672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63191 (_ BitVec 32)) Bool)

(assert (=> b!999809 (= res!669284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999810 () Bool)

(declare-fun res!669288 () Bool)

(assert (=> b!999810 (=> (not res!669288) (not e!563674))))

(assert (=> b!999810 (= res!669288 (and (= (size!30923 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30923 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30923 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999811 () Bool)

(declare-fun res!669289 () Bool)

(assert (=> b!999811 (=> (not res!669289) (not e!563672))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999811 (= res!669289 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30923 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30923 a!3219))))))

(declare-fun b!999812 () Bool)

(assert (=> b!999812 (= e!563672 e!563673)))

(declare-fun res!669282 () Bool)

(assert (=> b!999812 (=> (not res!669282) (not e!563673))))

(assert (=> b!999812 (= res!669282 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30421 a!3219) j!170) mask!3464) (select (arr!30421 a!3219) j!170) a!3219 mask!3464) lt!442123))))

(assert (=> b!999812 (= lt!442123 (Intermediate!9353 false resIndex!38 resX!38))))

(declare-fun b!999813 () Bool)

(declare-fun res!669291 () Bool)

(assert (=> b!999813 (=> (not res!669291) (not e!563672))))

(declare-datatypes ((List!21097 0))(
  ( (Nil!21094) (Cons!21093 (h!22270 (_ BitVec 64)) (t!30098 List!21097)) )
))
(declare-fun arrayNoDuplicates!0 (array!63191 (_ BitVec 32) List!21097) Bool)

(assert (=> b!999813 (= res!669291 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21094))))

(assert (= (and start!86390 res!669290) b!999810))

(assert (= (and b!999810 res!669288) b!999805))

(assert (= (and b!999805 res!669286) b!999807))

(assert (= (and b!999807 res!669281) b!999808))

(assert (= (and b!999808 res!669285) b!999803))

(assert (= (and b!999803 res!669287) b!999809))

(assert (= (and b!999809 res!669284) b!999813))

(assert (= (and b!999813 res!669291) b!999811))

(assert (= (and b!999811 res!669289) b!999812))

(assert (= (and b!999812 res!669282) b!999806))

(assert (= (and b!999806 res!669283) b!999804))

(declare-fun m!926015 () Bool)

(assert (=> b!999808 m!926015))

(declare-fun m!926017 () Bool)

(assert (=> start!86390 m!926017))

(declare-fun m!926019 () Bool)

(assert (=> start!86390 m!926019))

(declare-fun m!926021 () Bool)

(assert (=> b!999813 m!926021))

(declare-fun m!926023 () Bool)

(assert (=> b!999812 m!926023))

(assert (=> b!999812 m!926023))

(declare-fun m!926025 () Bool)

(assert (=> b!999812 m!926025))

(assert (=> b!999812 m!926025))

(assert (=> b!999812 m!926023))

(declare-fun m!926027 () Bool)

(assert (=> b!999812 m!926027))

(assert (=> b!999806 m!926023))

(assert (=> b!999806 m!926023))

(declare-fun m!926029 () Bool)

(assert (=> b!999806 m!926029))

(declare-fun m!926031 () Bool)

(assert (=> b!999804 m!926031))

(declare-fun m!926033 () Bool)

(assert (=> b!999804 m!926033))

(assert (=> b!999804 m!926033))

(declare-fun m!926035 () Bool)

(assert (=> b!999804 m!926035))

(assert (=> b!999804 m!926035))

(assert (=> b!999804 m!926033))

(declare-fun m!926037 () Bool)

(assert (=> b!999804 m!926037))

(declare-fun m!926039 () Bool)

(assert (=> b!999807 m!926039))

(declare-fun m!926041 () Bool)

(assert (=> b!999809 m!926041))

(declare-fun m!926043 () Bool)

(assert (=> b!999803 m!926043))

(assert (=> b!999805 m!926023))

(assert (=> b!999805 m!926023))

(declare-fun m!926045 () Bool)

(assert (=> b!999805 m!926045))

(push 1)

