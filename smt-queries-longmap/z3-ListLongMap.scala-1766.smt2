; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32244 () Bool)

(assert start!32244)

(declare-fun b!321157 () Bool)

(declare-fun res!175279 () Bool)

(declare-fun e!199090 () Bool)

(assert (=> b!321157 (=> (not res!175279) (not e!199090))))

(declare-datatypes ((array!16434 0))(
  ( (array!16435 (arr!7776 (Array (_ BitVec 32) (_ BitVec 64))) (size!8128 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16434)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16434 (_ BitVec 32)) Bool)

(assert (=> b!321157 (= res!175279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321158 () Bool)

(declare-fun res!175284 () Bool)

(assert (=> b!321158 (=> (not res!175284) (not e!199090))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321158 (= res!175284 (and (= (size!8128 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8128 a!3305))))))

(declare-fun b!321159 () Bool)

(declare-fun res!175280 () Bool)

(assert (=> b!321159 (=> (not res!175280) (not e!199090))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321159 (= res!175280 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321160 () Bool)

(declare-fun res!175281 () Bool)

(assert (=> b!321160 (=> (not res!175281) (not e!199090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321160 (= res!175281 (validKeyInArray!0 k0!2497))))

(declare-fun b!321161 () Bool)

(declare-fun res!175277 () Bool)

(assert (=> b!321161 (=> (not res!175277) (not e!199090))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321161 (= res!175277 (and (= (select (arr!7776 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8128 a!3305))))))

(declare-fun b!321162 () Bool)

(assert (=> b!321162 (= e!199090 false)))

(declare-datatypes ((SeekEntryResult!2907 0))(
  ( (MissingZero!2907 (index!13804 (_ BitVec 32))) (Found!2907 (index!13805 (_ BitVec 32))) (Intermediate!2907 (undefined!3719 Bool) (index!13806 (_ BitVec 32)) (x!32070 (_ BitVec 32))) (Undefined!2907) (MissingVacant!2907 (index!13807 (_ BitVec 32))) )
))
(declare-fun lt!156162 () SeekEntryResult!2907)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16434 (_ BitVec 32)) SeekEntryResult!2907)

(assert (=> b!321162 (= lt!156162 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun res!175283 () Bool)

(assert (=> start!32244 (=> (not res!175283) (not e!199090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32244 (= res!175283 (validMask!0 mask!3777))))

(assert (=> start!32244 e!199090))

(declare-fun array_inv!5739 (array!16434) Bool)

(assert (=> start!32244 (array_inv!5739 a!3305)))

(assert (=> start!32244 true))

(declare-fun b!321163 () Bool)

(declare-fun res!175282 () Bool)

(assert (=> b!321163 (=> (not res!175282) (not e!199090))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321163 (= res!175282 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2907 false resIndex!58 resX!58)))))

(declare-fun b!321164 () Bool)

(declare-fun res!175278 () Bool)

(assert (=> b!321164 (=> (not res!175278) (not e!199090))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16434 (_ BitVec 32)) SeekEntryResult!2907)

(assert (=> b!321164 (= res!175278 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2907 i!1250)))))

(assert (= (and start!32244 res!175283) b!321158))

(assert (= (and b!321158 res!175284) b!321160))

(assert (= (and b!321160 res!175281) b!321159))

(assert (= (and b!321159 res!175280) b!321164))

(assert (= (and b!321164 res!175278) b!321157))

(assert (= (and b!321157 res!175279) b!321163))

(assert (= (and b!321163 res!175282) b!321161))

(assert (= (and b!321161 res!175277) b!321162))

(declare-fun m!329353 () Bool)

(assert (=> b!321161 m!329353))

(declare-fun m!329355 () Bool)

(assert (=> b!321164 m!329355))

(declare-fun m!329357 () Bool)

(assert (=> b!321163 m!329357))

(assert (=> b!321163 m!329357))

(declare-fun m!329359 () Bool)

(assert (=> b!321163 m!329359))

(declare-fun m!329361 () Bool)

(assert (=> b!321162 m!329361))

(declare-fun m!329363 () Bool)

(assert (=> b!321159 m!329363))

(declare-fun m!329365 () Bool)

(assert (=> b!321160 m!329365))

(declare-fun m!329367 () Bool)

(assert (=> b!321157 m!329367))

(declare-fun m!329369 () Bool)

(assert (=> start!32244 m!329369))

(declare-fun m!329371 () Bool)

(assert (=> start!32244 m!329371))

(check-sat (not start!32244) (not b!321162) (not b!321163) (not b!321157) (not b!321164) (not b!321159) (not b!321160))
