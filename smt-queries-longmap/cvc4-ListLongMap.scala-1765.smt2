; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32240 () Bool)

(assert start!32240)

(declare-fun b!321108 () Bool)

(declare-fun res!175229 () Bool)

(declare-fun e!199076 () Bool)

(assert (=> b!321108 (=> (not res!175229) (not e!199076))))

(declare-datatypes ((array!16430 0))(
  ( (array!16431 (arr!7774 (Array (_ BitVec 32) (_ BitVec 64))) (size!8126 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16430)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321108 (= res!175229 (and (= (select (arr!7774 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8126 a!3305))))))

(declare-fun b!321109 () Bool)

(declare-fun res!175233 () Bool)

(declare-fun e!199078 () Bool)

(assert (=> b!321109 (=> (not res!175233) (not e!199078))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321109 (= res!175233 (validKeyInArray!0 k!2497))))

(declare-fun b!321110 () Bool)

(declare-fun res!175231 () Bool)

(assert (=> b!321110 (=> (not res!175231) (not e!199078))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16430 (_ BitVec 32)) Bool)

(assert (=> b!321110 (= res!175231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321111 () Bool)

(assert (=> b!321111 (= e!199078 e!199076)))

(declare-fun res!175228 () Bool)

(assert (=> b!321111 (=> (not res!175228) (not e!199076))))

(declare-datatypes ((SeekEntryResult!2905 0))(
  ( (MissingZero!2905 (index!13796 (_ BitVec 32))) (Found!2905 (index!13797 (_ BitVec 32))) (Intermediate!2905 (undefined!3717 Bool) (index!13798 (_ BitVec 32)) (x!32060 (_ BitVec 32))) (Undefined!2905) (MissingVacant!2905 (index!13799 (_ BitVec 32))) )
))
(declare-fun lt!156156 () SeekEntryResult!2905)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16430 (_ BitVec 32)) SeekEntryResult!2905)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321111 (= res!175228 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156156))))

(assert (=> b!321111 (= lt!156156 (Intermediate!2905 false resIndex!58 resX!58))))

(declare-fun b!321112 () Bool)

(declare-fun res!175236 () Bool)

(assert (=> b!321112 (=> (not res!175236) (not e!199078))))

(declare-fun arrayContainsKey!0 (array!16430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321112 (= res!175236 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321114 () Bool)

(declare-fun res!175230 () Bool)

(assert (=> b!321114 (=> (not res!175230) (not e!199078))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16430 (_ BitVec 32)) SeekEntryResult!2905)

(assert (=> b!321114 (= res!175230 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2905 i!1250)))))

(declare-fun b!321115 () Bool)

(declare-fun res!175235 () Bool)

(assert (=> b!321115 (=> (not res!175235) (not e!199076))))

(assert (=> b!321115 (= res!175235 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156156))))

(declare-fun b!321116 () Bool)

(declare-fun res!175232 () Bool)

(assert (=> b!321116 (=> (not res!175232) (not e!199078))))

(assert (=> b!321116 (= res!175232 (and (= (size!8126 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8126 a!3305))))))

(declare-fun res!175234 () Bool)

(assert (=> start!32240 (=> (not res!175234) (not e!199078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32240 (= res!175234 (validMask!0 mask!3777))))

(assert (=> start!32240 e!199078))

(declare-fun array_inv!5737 (array!16430) Bool)

(assert (=> start!32240 (array_inv!5737 a!3305)))

(assert (=> start!32240 true))

(declare-fun b!321113 () Bool)

(assert (=> b!321113 (= e!199076 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7774 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7774 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7774 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(assert (= (and start!32240 res!175234) b!321116))

(assert (= (and b!321116 res!175232) b!321109))

(assert (= (and b!321109 res!175233) b!321112))

(assert (= (and b!321112 res!175236) b!321114))

(assert (= (and b!321114 res!175230) b!321110))

(assert (= (and b!321110 res!175231) b!321111))

(assert (= (and b!321111 res!175228) b!321108))

(assert (= (and b!321108 res!175229) b!321115))

(assert (= (and b!321115 res!175235) b!321113))

(declare-fun m!329311 () Bool)

(assert (=> b!321113 m!329311))

(declare-fun m!329313 () Bool)

(assert (=> b!321112 m!329313))

(declare-fun m!329315 () Bool)

(assert (=> b!321110 m!329315))

(declare-fun m!329317 () Bool)

(assert (=> start!32240 m!329317))

(declare-fun m!329319 () Bool)

(assert (=> start!32240 m!329319))

(declare-fun m!329321 () Bool)

(assert (=> b!321111 m!329321))

(assert (=> b!321111 m!329321))

(declare-fun m!329323 () Bool)

(assert (=> b!321111 m!329323))

(declare-fun m!329325 () Bool)

(assert (=> b!321109 m!329325))

(declare-fun m!329327 () Bool)

(assert (=> b!321108 m!329327))

(declare-fun m!329329 () Bool)

(assert (=> b!321115 m!329329))

(declare-fun m!329331 () Bool)

(assert (=> b!321114 m!329331))

(push 1)

(assert (not b!321114))

(assert (not b!321112))

(assert (not b!321111))

(assert (not b!321115))

(assert (not b!321110))

(assert (not b!321109))

(assert (not start!32240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

