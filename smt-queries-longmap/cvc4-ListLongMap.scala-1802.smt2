; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32516 () Bool)

(assert start!32516)

(declare-fun b!325193 () Bool)

(declare-fun res!178533 () Bool)

(declare-fun e!200505 () Bool)

(assert (=> b!325193 (=> (not res!178533) (not e!200505))))

(declare-datatypes ((array!16655 0))(
  ( (array!16656 (arr!7885 (Array (_ BitVec 32) (_ BitVec 64))) (size!8237 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16655)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325193 (= res!178533 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325195 () Bool)

(declare-fun res!178525 () Bool)

(assert (=> b!325195 (=> (not res!178525) (not e!200505))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16655 (_ BitVec 32)) Bool)

(assert (=> b!325195 (= res!178525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325196 () Bool)

(declare-fun e!200504 () Bool)

(assert (=> b!325196 (= e!200504 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!156954 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325196 (= lt!156954 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325197 () Bool)

(assert (=> b!325197 (= e!200505 e!200504)))

(declare-fun res!178530 () Bool)

(assert (=> b!325197 (=> (not res!178530) (not e!200504))))

(declare-datatypes ((SeekEntryResult!3016 0))(
  ( (MissingZero!3016 (index!14240 (_ BitVec 32))) (Found!3016 (index!14241 (_ BitVec 32))) (Intermediate!3016 (undefined!3828 Bool) (index!14242 (_ BitVec 32)) (x!32476 (_ BitVec 32))) (Undefined!3016) (MissingVacant!3016 (index!14243 (_ BitVec 32))) )
))
(declare-fun lt!156953 () SeekEntryResult!3016)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16655 (_ BitVec 32)) SeekEntryResult!3016)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325197 (= res!178530 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156953))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325197 (= lt!156953 (Intermediate!3016 false resIndex!58 resX!58))))

(declare-fun b!325198 () Bool)

(declare-fun res!178529 () Bool)

(assert (=> b!325198 (=> (not res!178529) (not e!200504))))

(assert (=> b!325198 (= res!178529 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7885 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325194 () Bool)

(declare-fun res!178531 () Bool)

(assert (=> b!325194 (=> (not res!178531) (not e!200504))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325194 (= res!178531 (and (= (select (arr!7885 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8237 a!3305))))))

(declare-fun res!178526 () Bool)

(assert (=> start!32516 (=> (not res!178526) (not e!200505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32516 (= res!178526 (validMask!0 mask!3777))))

(assert (=> start!32516 e!200505))

(declare-fun array_inv!5848 (array!16655) Bool)

(assert (=> start!32516 (array_inv!5848 a!3305)))

(assert (=> start!32516 true))

(declare-fun b!325199 () Bool)

(declare-fun res!178528 () Bool)

(assert (=> b!325199 (=> (not res!178528) (not e!200505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325199 (= res!178528 (validKeyInArray!0 k!2497))))

(declare-fun b!325200 () Bool)

(declare-fun res!178532 () Bool)

(assert (=> b!325200 (=> (not res!178532) (not e!200505))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16655 (_ BitVec 32)) SeekEntryResult!3016)

(assert (=> b!325200 (= res!178532 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3016 i!1250)))))

(declare-fun b!325201 () Bool)

(declare-fun res!178524 () Bool)

(assert (=> b!325201 (=> (not res!178524) (not e!200504))))

(assert (=> b!325201 (= res!178524 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156953))))

(declare-fun b!325202 () Bool)

(declare-fun res!178527 () Bool)

(assert (=> b!325202 (=> (not res!178527) (not e!200505))))

(assert (=> b!325202 (= res!178527 (and (= (size!8237 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8237 a!3305))))))

(assert (= (and start!32516 res!178526) b!325202))

(assert (= (and b!325202 res!178527) b!325199))

(assert (= (and b!325199 res!178528) b!325193))

(assert (= (and b!325193 res!178533) b!325200))

(assert (= (and b!325200 res!178532) b!325195))

(assert (= (and b!325195 res!178525) b!325197))

(assert (= (and b!325197 res!178530) b!325194))

(assert (= (and b!325194 res!178531) b!325201))

(assert (= (and b!325201 res!178524) b!325198))

(assert (= (and b!325198 res!178529) b!325196))

(declare-fun m!332087 () Bool)

(assert (=> b!325195 m!332087))

(declare-fun m!332089 () Bool)

(assert (=> b!325200 m!332089))

(declare-fun m!332091 () Bool)

(assert (=> b!325193 m!332091))

(declare-fun m!332093 () Bool)

(assert (=> b!325201 m!332093))

(declare-fun m!332095 () Bool)

(assert (=> b!325196 m!332095))

(declare-fun m!332097 () Bool)

(assert (=> b!325194 m!332097))

(declare-fun m!332099 () Bool)

(assert (=> b!325199 m!332099))

(declare-fun m!332101 () Bool)

(assert (=> start!32516 m!332101))

(declare-fun m!332103 () Bool)

(assert (=> start!32516 m!332103))

(declare-fun m!332105 () Bool)

(assert (=> b!325197 m!332105))

(assert (=> b!325197 m!332105))

(declare-fun m!332107 () Bool)

(assert (=> b!325197 m!332107))

(declare-fun m!332109 () Bool)

(assert (=> b!325198 m!332109))

(push 1)

