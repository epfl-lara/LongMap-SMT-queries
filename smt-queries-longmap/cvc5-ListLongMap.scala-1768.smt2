; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32254 () Bool)

(assert start!32254)

(declare-fun b!321279 () Bool)

(declare-fun res!175405 () Bool)

(declare-fun e!199123 () Bool)

(assert (=> b!321279 (=> (not res!175405) (not e!199123))))

(declare-datatypes ((array!16444 0))(
  ( (array!16445 (arr!7781 (Array (_ BitVec 32) (_ BitVec 64))) (size!8133 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16444)

(declare-datatypes ((SeekEntryResult!2912 0))(
  ( (MissingZero!2912 (index!13824 (_ BitVec 32))) (Found!2912 (index!13825 (_ BitVec 32))) (Intermediate!2912 (undefined!3724 Bool) (index!13826 (_ BitVec 32)) (x!32091 (_ BitVec 32))) (Undefined!2912) (MissingVacant!2912 (index!13827 (_ BitVec 32))) )
))
(declare-fun lt!156177 () SeekEntryResult!2912)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16444 (_ BitVec 32)) SeekEntryResult!2912)

(assert (=> b!321279 (= res!175405 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156177))))

(declare-fun b!321280 () Bool)

(declare-fun res!175401 () Bool)

(declare-fun e!199122 () Bool)

(assert (=> b!321280 (=> (not res!175401) (not e!199122))))

(declare-fun arrayContainsKey!0 (array!16444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321280 (= res!175401 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321281 () Bool)

(declare-fun res!175402 () Bool)

(assert (=> b!321281 (=> (not res!175402) (not e!199122))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16444 (_ BitVec 32)) SeekEntryResult!2912)

(assert (=> b!321281 (= res!175402 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2912 i!1250)))))

(declare-fun b!321282 () Bool)

(assert (=> b!321282 (= e!199122 e!199123)))

(declare-fun res!175406 () Bool)

(assert (=> b!321282 (=> (not res!175406) (not e!199123))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321282 (= res!175406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156177))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321282 (= lt!156177 (Intermediate!2912 false resIndex!58 resX!58))))

(declare-fun b!321283 () Bool)

(declare-fun res!175404 () Bool)

(assert (=> b!321283 (=> (not res!175404) (not e!199123))))

(assert (=> b!321283 (= res!175404 (and (= (select (arr!7781 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8133 a!3305))))))

(declare-fun b!321284 () Bool)

(declare-fun res!175403 () Bool)

(assert (=> b!321284 (=> (not res!175403) (not e!199122))))

(assert (=> b!321284 (= res!175403 (and (= (size!8133 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8133 a!3305))))))

(declare-fun b!321285 () Bool)

(assert (=> b!321285 (= e!199123 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7781 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7781 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7781 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!321286 () Bool)

(declare-fun res!175399 () Bool)

(assert (=> b!321286 (=> (not res!175399) (not e!199122))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321286 (= res!175399 (validKeyInArray!0 k!2497))))

(declare-fun res!175407 () Bool)

(assert (=> start!32254 (=> (not res!175407) (not e!199122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32254 (= res!175407 (validMask!0 mask!3777))))

(assert (=> start!32254 e!199122))

(declare-fun array_inv!5744 (array!16444) Bool)

(assert (=> start!32254 (array_inv!5744 a!3305)))

(assert (=> start!32254 true))

(declare-fun b!321287 () Bool)

(declare-fun res!175400 () Bool)

(assert (=> b!321287 (=> (not res!175400) (not e!199122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16444 (_ BitVec 32)) Bool)

(assert (=> b!321287 (= res!175400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32254 res!175407) b!321284))

(assert (= (and b!321284 res!175403) b!321286))

(assert (= (and b!321286 res!175399) b!321280))

(assert (= (and b!321280 res!175401) b!321281))

(assert (= (and b!321281 res!175402) b!321287))

(assert (= (and b!321287 res!175400) b!321282))

(assert (= (and b!321282 res!175406) b!321283))

(assert (= (and b!321283 res!175404) b!321279))

(assert (= (and b!321279 res!175405) b!321285))

(declare-fun m!329453 () Bool)

(assert (=> b!321280 m!329453))

(declare-fun m!329455 () Bool)

(assert (=> b!321282 m!329455))

(assert (=> b!321282 m!329455))

(declare-fun m!329457 () Bool)

(assert (=> b!321282 m!329457))

(declare-fun m!329459 () Bool)

(assert (=> b!321283 m!329459))

(declare-fun m!329461 () Bool)

(assert (=> start!32254 m!329461))

(declare-fun m!329463 () Bool)

(assert (=> start!32254 m!329463))

(declare-fun m!329465 () Bool)

(assert (=> b!321287 m!329465))

(declare-fun m!329467 () Bool)

(assert (=> b!321286 m!329467))

(declare-fun m!329469 () Bool)

(assert (=> b!321281 m!329469))

(declare-fun m!329471 () Bool)

(assert (=> b!321279 m!329471))

(declare-fun m!329473 () Bool)

(assert (=> b!321285 m!329473))

(push 1)

(assert (not b!321282))

(assert (not b!321279))

(assert (not start!32254))

