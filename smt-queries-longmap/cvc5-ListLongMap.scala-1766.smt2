; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32242 () Bool)

(assert start!32242)

(declare-fun b!321133 () Bool)

(declare-fun res!175254 () Bool)

(declare-fun e!199083 () Bool)

(assert (=> b!321133 (=> (not res!175254) (not e!199083))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-datatypes ((array!16432 0))(
  ( (array!16433 (arr!7775 (Array (_ BitVec 32) (_ BitVec 64))) (size!8127 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16432)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2906 0))(
  ( (MissingZero!2906 (index!13800 (_ BitVec 32))) (Found!2906 (index!13801 (_ BitVec 32))) (Intermediate!2906 (undefined!3718 Bool) (index!13802 (_ BitVec 32)) (x!32069 (_ BitVec 32))) (Undefined!2906) (MissingVacant!2906 (index!13803 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16432 (_ BitVec 32)) SeekEntryResult!2906)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321133 (= res!175254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2906 false resIndex!58 resX!58)))))

(declare-fun res!175256 () Bool)

(assert (=> start!32242 (=> (not res!175256) (not e!199083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32242 (= res!175256 (validMask!0 mask!3777))))

(assert (=> start!32242 e!199083))

(declare-fun array_inv!5738 (array!16432) Bool)

(assert (=> start!32242 (array_inv!5738 a!3305)))

(assert (=> start!32242 true))

(declare-fun b!321134 () Bool)

(declare-fun res!175257 () Bool)

(assert (=> b!321134 (=> (not res!175257) (not e!199083))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321134 (= res!175257 (and (= (size!8127 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8127 a!3305))))))

(declare-fun b!321135 () Bool)

(declare-fun res!175259 () Bool)

(assert (=> b!321135 (=> (not res!175259) (not e!199083))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321135 (= res!175259 (and (= (select (arr!7775 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8127 a!3305))))))

(declare-fun b!321136 () Bool)

(declare-fun res!175258 () Bool)

(assert (=> b!321136 (=> (not res!175258) (not e!199083))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16432 (_ BitVec 32)) SeekEntryResult!2906)

(assert (=> b!321136 (= res!175258 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2906 i!1250)))))

(declare-fun b!321137 () Bool)

(declare-fun res!175255 () Bool)

(assert (=> b!321137 (=> (not res!175255) (not e!199083))))

(declare-fun arrayContainsKey!0 (array!16432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321137 (= res!175255 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321138 () Bool)

(assert (=> b!321138 (= e!199083 false)))

(declare-fun lt!156159 () SeekEntryResult!2906)

(assert (=> b!321138 (= lt!156159 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!321139 () Bool)

(declare-fun res!175253 () Bool)

(assert (=> b!321139 (=> (not res!175253) (not e!199083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321139 (= res!175253 (validKeyInArray!0 k!2497))))

(declare-fun b!321140 () Bool)

(declare-fun res!175260 () Bool)

(assert (=> b!321140 (=> (not res!175260) (not e!199083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16432 (_ BitVec 32)) Bool)

(assert (=> b!321140 (= res!175260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32242 res!175256) b!321134))

(assert (= (and b!321134 res!175257) b!321139))

(assert (= (and b!321139 res!175253) b!321137))

(assert (= (and b!321137 res!175255) b!321136))

(assert (= (and b!321136 res!175258) b!321140))

(assert (= (and b!321140 res!175260) b!321133))

(assert (= (and b!321133 res!175254) b!321135))

(assert (= (and b!321135 res!175259) b!321138))

(declare-fun m!329333 () Bool)

(assert (=> b!321135 m!329333))

(declare-fun m!329335 () Bool)

(assert (=> b!321136 m!329335))

(declare-fun m!329337 () Bool)

(assert (=> b!321133 m!329337))

(assert (=> b!321133 m!329337))

(declare-fun m!329339 () Bool)

(assert (=> b!321133 m!329339))

(declare-fun m!329341 () Bool)

(assert (=> b!321139 m!329341))

(declare-fun m!329343 () Bool)

(assert (=> start!32242 m!329343))

(declare-fun m!329345 () Bool)

(assert (=> start!32242 m!329345))

(declare-fun m!329347 () Bool)

(assert (=> b!321137 m!329347))

(declare-fun m!329349 () Bool)

(assert (=> b!321140 m!329349))

(declare-fun m!329351 () Bool)

(assert (=> b!321138 m!329351))

(push 1)

(assert (not b!321140))

(assert (not b!321136))

(assert (not start!32242))

(assert (not b!321137))

(assert (not b!321138))

(assert (not b!321139))

(assert (not b!321133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

