; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32726 () Bool)

(assert start!32726)

(declare-fun b!327191 () Bool)

(declare-fun res!180230 () Bool)

(declare-fun e!201253 () Bool)

(assert (=> b!327191 (=> (not res!180230) (not e!201253))))

(declare-datatypes ((array!16763 0))(
  ( (array!16764 (arr!7936 (Array (_ BitVec 32) (_ BitVec 64))) (size!8288 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16763)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327191 (= res!180230 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327192 () Bool)

(declare-fun res!180229 () Bool)

(assert (=> b!327192 (=> (not res!180229) (not e!201253))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3067 0))(
  ( (MissingZero!3067 (index!14444 (_ BitVec 32))) (Found!3067 (index!14445 (_ BitVec 32))) (Intermediate!3067 (undefined!3879 Bool) (index!14446 (_ BitVec 32)) (x!32681 (_ BitVec 32))) (Undefined!3067) (MissingVacant!3067 (index!14447 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16763 (_ BitVec 32)) SeekEntryResult!3067)

(assert (=> b!327192 (= res!180229 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3067 i!1250)))))

(declare-fun b!327193 () Bool)

(declare-fun res!180231 () Bool)

(assert (=> b!327193 (=> (not res!180231) (not e!201253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16763 (_ BitVec 32)) Bool)

(assert (=> b!327193 (= res!180231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327194 () Bool)

(declare-fun res!180225 () Bool)

(assert (=> b!327194 (=> (not res!180225) (not e!201253))))

(assert (=> b!327194 (= res!180225 (and (= (size!8288 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8288 a!3305))))))

(declare-fun b!327195 () Bool)

(declare-fun e!201251 () Bool)

(assert (=> b!327195 (= e!201251 false)))

(declare-datatypes ((Unit!10168 0))(
  ( (Unit!10169) )
))
(declare-fun lt!157475 () Unit!10168)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16763 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10168)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327195 (= lt!157475 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!327196 () Bool)

(declare-fun res!180226 () Bool)

(assert (=> b!327196 (=> (not res!180226) (not e!201251))))

(assert (=> b!327196 (= res!180226 (and (= (select (arr!7936 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8288 a!3305))))))

(declare-fun b!327197 () Bool)

(declare-fun res!180222 () Bool)

(assert (=> b!327197 (=> (not res!180222) (not e!201253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327197 (= res!180222 (validKeyInArray!0 k!2497))))

(declare-fun res!180227 () Bool)

(assert (=> start!32726 (=> (not res!180227) (not e!201253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32726 (= res!180227 (validMask!0 mask!3777))))

(assert (=> start!32726 e!201253))

(declare-fun array_inv!5899 (array!16763) Bool)

(assert (=> start!32726 (array_inv!5899 a!3305)))

(assert (=> start!32726 true))

(declare-fun b!327198 () Bool)

(assert (=> b!327198 (= e!201253 e!201251)))

(declare-fun res!180228 () Bool)

(assert (=> b!327198 (=> (not res!180228) (not e!201251))))

(declare-fun lt!157476 () SeekEntryResult!3067)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16763 (_ BitVec 32)) SeekEntryResult!3067)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327198 (= res!180228 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157476))))

(assert (=> b!327198 (= lt!157476 (Intermediate!3067 false resIndex!58 resX!58))))

(declare-fun b!327199 () Bool)

(declare-fun res!180223 () Bool)

(assert (=> b!327199 (=> (not res!180223) (not e!201251))))

(assert (=> b!327199 (= res!180223 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7936 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!327200 () Bool)

(declare-fun res!180224 () Bool)

(assert (=> b!327200 (=> (not res!180224) (not e!201251))))

(assert (=> b!327200 (= res!180224 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157476))))

(assert (= (and start!32726 res!180227) b!327194))

(assert (= (and b!327194 res!180225) b!327197))

(assert (= (and b!327197 res!180222) b!327191))

(assert (= (and b!327191 res!180230) b!327192))

(assert (= (and b!327192 res!180229) b!327193))

(assert (= (and b!327193 res!180231) b!327198))

(assert (= (and b!327198 res!180228) b!327196))

(assert (= (and b!327196 res!180226) b!327200))

(assert (= (and b!327200 res!180224) b!327199))

(assert (= (and b!327199 res!180223) b!327195))

(declare-fun m!333639 () Bool)

(assert (=> b!327199 m!333639))

(declare-fun m!333641 () Bool)

(assert (=> b!327193 m!333641))

(declare-fun m!333643 () Bool)

(assert (=> start!32726 m!333643))

(declare-fun m!333645 () Bool)

(assert (=> start!32726 m!333645))

(declare-fun m!333647 () Bool)

(assert (=> b!327198 m!333647))

(assert (=> b!327198 m!333647))

(declare-fun m!333649 () Bool)

(assert (=> b!327198 m!333649))

(declare-fun m!333651 () Bool)

(assert (=> b!327197 m!333651))

(declare-fun m!333653 () Bool)

(assert (=> b!327195 m!333653))

(assert (=> b!327195 m!333653))

(declare-fun m!333655 () Bool)

(assert (=> b!327195 m!333655))

(declare-fun m!333657 () Bool)

(assert (=> b!327196 m!333657))

(declare-fun m!333659 () Bool)

(assert (=> b!327191 m!333659))

(declare-fun m!333661 () Bool)

(assert (=> b!327200 m!333661))

(declare-fun m!333663 () Bool)

(assert (=> b!327192 m!333663))

(push 1)

(assert (not b!327198))

(assert (not b!327193))

(assert (not b!327200))

(assert (not b!327195))

(assert (not b!327191))

(assert (not start!32726))

(assert (not b!327192))

(assert (not b!327197))

(check-sat)

