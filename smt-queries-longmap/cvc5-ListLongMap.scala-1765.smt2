; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32236 () Bool)

(assert start!32236)

(declare-fun b!321054 () Bool)

(declare-fun res!175176 () Bool)

(declare-fun e!199059 () Bool)

(assert (=> b!321054 (=> (not res!175176) (not e!199059))))

(declare-datatypes ((array!16426 0))(
  ( (array!16427 (arr!7772 (Array (_ BitVec 32) (_ BitVec 64))) (size!8124 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16426)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2903 0))(
  ( (MissingZero!2903 (index!13788 (_ BitVec 32))) (Found!2903 (index!13789 (_ BitVec 32))) (Intermediate!2903 (undefined!3715 Bool) (index!13790 (_ BitVec 32)) (x!32058 (_ BitVec 32))) (Undefined!2903) (MissingVacant!2903 (index!13791 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16426 (_ BitVec 32)) SeekEntryResult!2903)

(assert (=> b!321054 (= res!175176 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2903 i!1250)))))

(declare-fun b!321055 () Bool)

(declare-fun res!175181 () Bool)

(assert (=> b!321055 (=> (not res!175181) (not e!199059))))

(assert (=> b!321055 (= res!175181 (and (= (size!8124 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8124 a!3305))))))

(declare-fun b!321056 () Bool)

(declare-fun res!175182 () Bool)

(assert (=> b!321056 (=> (not res!175182) (not e!199059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321056 (= res!175182 (validKeyInArray!0 k!2497))))

(declare-fun b!321057 () Bool)

(declare-fun e!199058 () Bool)

(assert (=> b!321057 (= e!199059 e!199058)))

(declare-fun res!175178 () Bool)

(assert (=> b!321057 (=> (not res!175178) (not e!199058))))

(declare-fun lt!156150 () SeekEntryResult!2903)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16426 (_ BitVec 32)) SeekEntryResult!2903)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321057 (= res!175178 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156150))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321057 (= lt!156150 (Intermediate!2903 false resIndex!58 resX!58))))

(declare-fun b!321058 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321058 (= e!199058 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7772 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7772 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7772 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!321059 () Bool)

(declare-fun res!175179 () Bool)

(assert (=> b!321059 (=> (not res!175179) (not e!199058))))

(assert (=> b!321059 (= res!175179 (and (= (select (arr!7772 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8124 a!3305))))))

(declare-fun b!321060 () Bool)

(declare-fun res!175175 () Bool)

(assert (=> b!321060 (=> (not res!175175) (not e!199059))))

(declare-fun arrayContainsKey!0 (array!16426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321060 (= res!175175 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321061 () Bool)

(declare-fun res!175180 () Bool)

(assert (=> b!321061 (=> (not res!175180) (not e!199059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16426 (_ BitVec 32)) Bool)

(assert (=> b!321061 (= res!175180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321062 () Bool)

(declare-fun res!175174 () Bool)

(assert (=> b!321062 (=> (not res!175174) (not e!199058))))

(assert (=> b!321062 (= res!175174 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156150))))

(declare-fun res!175177 () Bool)

(assert (=> start!32236 (=> (not res!175177) (not e!199059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32236 (= res!175177 (validMask!0 mask!3777))))

(assert (=> start!32236 e!199059))

(declare-fun array_inv!5735 (array!16426) Bool)

(assert (=> start!32236 (array_inv!5735 a!3305)))

(assert (=> start!32236 true))

(assert (= (and start!32236 res!175177) b!321055))

(assert (= (and b!321055 res!175181) b!321056))

(assert (= (and b!321056 res!175182) b!321060))

(assert (= (and b!321060 res!175175) b!321054))

(assert (= (and b!321054 res!175176) b!321061))

(assert (= (and b!321061 res!175180) b!321057))

(assert (= (and b!321057 res!175178) b!321059))

(assert (= (and b!321059 res!175179) b!321062))

(assert (= (and b!321062 res!175174) b!321058))

(declare-fun m!329267 () Bool)

(assert (=> b!321061 m!329267))

(declare-fun m!329269 () Bool)

(assert (=> start!32236 m!329269))

(declare-fun m!329271 () Bool)

(assert (=> start!32236 m!329271))

(declare-fun m!329273 () Bool)

(assert (=> b!321062 m!329273))

(declare-fun m!329275 () Bool)

(assert (=> b!321058 m!329275))

(declare-fun m!329277 () Bool)

(assert (=> b!321060 m!329277))

(declare-fun m!329279 () Bool)

(assert (=> b!321054 m!329279))

(declare-fun m!329281 () Bool)

(assert (=> b!321059 m!329281))

(declare-fun m!329283 () Bool)

(assert (=> b!321057 m!329283))

(assert (=> b!321057 m!329283))

(declare-fun m!329285 () Bool)

(assert (=> b!321057 m!329285))

(declare-fun m!329287 () Bool)

(assert (=> b!321056 m!329287))

(push 1)

(assert (not b!321060))

(assert (not b!321061))

(assert (not b!321056))

(assert (not b!321062))

(assert (not start!32236))

(assert (not b!321057))

(assert (not b!321054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

