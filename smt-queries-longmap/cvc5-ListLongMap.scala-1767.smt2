; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32248 () Bool)

(assert start!32248)

(declare-fun b!321205 () Bool)

(declare-fun res!175329 () Bool)

(declare-fun e!199102 () Bool)

(assert (=> b!321205 (=> (not res!175329) (not e!199102))))

(declare-datatypes ((array!16438 0))(
  ( (array!16439 (arr!7778 (Array (_ BitVec 32) (_ BitVec 64))) (size!8130 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16438)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321205 (= res!175329 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!175332 () Bool)

(assert (=> start!32248 (=> (not res!175332) (not e!199102))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32248 (= res!175332 (validMask!0 mask!3777))))

(assert (=> start!32248 e!199102))

(declare-fun array_inv!5741 (array!16438) Bool)

(assert (=> start!32248 (array_inv!5741 a!3305)))

(assert (=> start!32248 true))

(declare-fun b!321206 () Bool)

(declare-fun res!175328 () Bool)

(assert (=> b!321206 (=> (not res!175328) (not e!199102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321206 (= res!175328 (validKeyInArray!0 k!2497))))

(declare-fun b!321207 () Bool)

(declare-fun res!175327 () Bool)

(assert (=> b!321207 (=> (not res!175327) (not e!199102))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321207 (= res!175327 (and (= (select (arr!7778 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8130 a!3305))))))

(declare-fun b!321208 () Bool)

(declare-fun res!175331 () Bool)

(assert (=> b!321208 (=> (not res!175331) (not e!199102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16438 (_ BitVec 32)) Bool)

(assert (=> b!321208 (= res!175331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321209 () Bool)

(declare-fun res!175326 () Bool)

(assert (=> b!321209 (=> (not res!175326) (not e!199102))))

(assert (=> b!321209 (= res!175326 (and (= (size!8130 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8130 a!3305))))))

(declare-fun b!321210 () Bool)

(declare-fun res!175330 () Bool)

(assert (=> b!321210 (=> (not res!175330) (not e!199102))))

(declare-datatypes ((SeekEntryResult!2909 0))(
  ( (MissingZero!2909 (index!13812 (_ BitVec 32))) (Found!2909 (index!13813 (_ BitVec 32))) (Intermediate!2909 (undefined!3721 Bool) (index!13814 (_ BitVec 32)) (x!32080 (_ BitVec 32))) (Undefined!2909) (MissingVacant!2909 (index!13815 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16438 (_ BitVec 32)) SeekEntryResult!2909)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321210 (= res!175330 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2909 false resIndex!58 resX!58)))))

(declare-fun b!321211 () Bool)

(assert (=> b!321211 (= e!199102 false)))

(declare-fun lt!156168 () SeekEntryResult!2909)

(assert (=> b!321211 (= lt!156168 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!321212 () Bool)

(declare-fun res!175325 () Bool)

(assert (=> b!321212 (=> (not res!175325) (not e!199102))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16438 (_ BitVec 32)) SeekEntryResult!2909)

(assert (=> b!321212 (= res!175325 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2909 i!1250)))))

(assert (= (and start!32248 res!175332) b!321209))

(assert (= (and b!321209 res!175326) b!321206))

(assert (= (and b!321206 res!175328) b!321205))

(assert (= (and b!321205 res!175329) b!321212))

(assert (= (and b!321212 res!175325) b!321208))

(assert (= (and b!321208 res!175331) b!321210))

(assert (= (and b!321210 res!175330) b!321207))

(assert (= (and b!321207 res!175327) b!321211))

(declare-fun m!329393 () Bool)

(assert (=> b!321205 m!329393))

(declare-fun m!329395 () Bool)

(assert (=> b!321210 m!329395))

(assert (=> b!321210 m!329395))

(declare-fun m!329397 () Bool)

(assert (=> b!321210 m!329397))

(declare-fun m!329399 () Bool)

(assert (=> b!321206 m!329399))

(declare-fun m!329401 () Bool)

(assert (=> b!321211 m!329401))

(declare-fun m!329403 () Bool)

(assert (=> b!321208 m!329403))

(declare-fun m!329405 () Bool)

(assert (=> start!32248 m!329405))

(declare-fun m!329407 () Bool)

(assert (=> start!32248 m!329407))

(declare-fun m!329409 () Bool)

(assert (=> b!321212 m!329409))

(declare-fun m!329411 () Bool)

(assert (=> b!321207 m!329411))

(push 1)

(assert (not b!321206))

(assert (not b!321205))

(assert (not b!321211))

(assert (not start!32248))

(assert (not b!321210))

(assert (not b!321208))

(assert (not b!321212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

