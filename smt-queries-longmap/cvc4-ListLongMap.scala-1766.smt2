; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32246 () Bool)

(assert start!32246)

(declare-fun b!321181 () Bool)

(declare-fun res!175307 () Bool)

(declare-fun e!199095 () Bool)

(assert (=> b!321181 (=> (not res!175307) (not e!199095))))

(declare-datatypes ((array!16436 0))(
  ( (array!16437 (arr!7777 (Array (_ BitVec 32) (_ BitVec 64))) (size!8129 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16436)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321181 (= res!175307 (and (= (size!8129 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8129 a!3305))))))

(declare-fun b!321182 () Bool)

(declare-fun res!175301 () Bool)

(assert (=> b!321182 (=> (not res!175301) (not e!199095))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2908 0))(
  ( (MissingZero!2908 (index!13808 (_ BitVec 32))) (Found!2908 (index!13809 (_ BitVec 32))) (Intermediate!2908 (undefined!3720 Bool) (index!13810 (_ BitVec 32)) (x!32071 (_ BitVec 32))) (Undefined!2908) (MissingVacant!2908 (index!13811 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16436 (_ BitVec 32)) SeekEntryResult!2908)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321182 (= res!175301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2908 false resIndex!58 resX!58)))))

(declare-fun res!175306 () Bool)

(assert (=> start!32246 (=> (not res!175306) (not e!199095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32246 (= res!175306 (validMask!0 mask!3777))))

(assert (=> start!32246 e!199095))

(declare-fun array_inv!5740 (array!16436) Bool)

(assert (=> start!32246 (array_inv!5740 a!3305)))

(assert (=> start!32246 true))

(declare-fun b!321183 () Bool)

(declare-fun res!175303 () Bool)

(assert (=> b!321183 (=> (not res!175303) (not e!199095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321183 (= res!175303 (validKeyInArray!0 k!2497))))

(declare-fun b!321184 () Bool)

(declare-fun res!175304 () Bool)

(assert (=> b!321184 (=> (not res!175304) (not e!199095))))

(declare-fun arrayContainsKey!0 (array!16436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321184 (= res!175304 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321185 () Bool)

(declare-fun res!175308 () Bool)

(assert (=> b!321185 (=> (not res!175308) (not e!199095))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321185 (= res!175308 (and (= (select (arr!7777 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8129 a!3305))))))

(declare-fun b!321186 () Bool)

(declare-fun res!175305 () Bool)

(assert (=> b!321186 (=> (not res!175305) (not e!199095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16436 (_ BitVec 32)) Bool)

(assert (=> b!321186 (= res!175305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321187 () Bool)

(declare-fun res!175302 () Bool)

(assert (=> b!321187 (=> (not res!175302) (not e!199095))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16436 (_ BitVec 32)) SeekEntryResult!2908)

(assert (=> b!321187 (= res!175302 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2908 i!1250)))))

(declare-fun b!321188 () Bool)

(assert (=> b!321188 (= e!199095 false)))

(declare-fun lt!156165 () SeekEntryResult!2908)

(assert (=> b!321188 (= lt!156165 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(assert (= (and start!32246 res!175306) b!321181))

(assert (= (and b!321181 res!175307) b!321183))

(assert (= (and b!321183 res!175303) b!321184))

(assert (= (and b!321184 res!175304) b!321187))

(assert (= (and b!321187 res!175302) b!321186))

(assert (= (and b!321186 res!175305) b!321182))

(assert (= (and b!321182 res!175301) b!321185))

(assert (= (and b!321185 res!175308) b!321188))

(declare-fun m!329373 () Bool)

(assert (=> b!321188 m!329373))

(declare-fun m!329375 () Bool)

(assert (=> b!321187 m!329375))

(declare-fun m!329377 () Bool)

(assert (=> b!321183 m!329377))

(declare-fun m!329379 () Bool)

(assert (=> b!321185 m!329379))

(declare-fun m!329381 () Bool)

(assert (=> b!321186 m!329381))

(declare-fun m!329383 () Bool)

(assert (=> b!321182 m!329383))

(assert (=> b!321182 m!329383))

(declare-fun m!329385 () Bool)

(assert (=> b!321182 m!329385))

(declare-fun m!329387 () Bool)

(assert (=> start!32246 m!329387))

(declare-fun m!329389 () Bool)

(assert (=> start!32246 m!329389))

(declare-fun m!329391 () Bool)

(assert (=> b!321184 m!329391))

(push 1)

(assert (not b!321186))

(assert (not b!321182))

(assert (not b!321188))

(assert (not b!321183))

(assert (not b!321187))

(assert (not start!32246))

(assert (not b!321184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

