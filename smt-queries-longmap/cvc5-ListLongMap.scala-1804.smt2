; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32524 () Bool)

(assert start!32524)

(declare-fun b!325313 () Bool)

(declare-fun res!178647 () Bool)

(declare-fun e!200540 () Bool)

(assert (=> b!325313 (=> (not res!178647) (not e!200540))))

(declare-datatypes ((array!16663 0))(
  ( (array!16664 (arr!7889 (Array (_ BitVec 32) (_ BitVec 64))) (size!8241 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16663)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3020 0))(
  ( (MissingZero!3020 (index!14256 (_ BitVec 32))) (Found!3020 (index!14257 (_ BitVec 32))) (Intermediate!3020 (undefined!3832 Bool) (index!14258 (_ BitVec 32)) (x!32496 (_ BitVec 32))) (Undefined!3020) (MissingVacant!3020 (index!14259 (_ BitVec 32))) )
))
(declare-fun lt!156977 () SeekEntryResult!3020)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16663 (_ BitVec 32)) SeekEntryResult!3020)

(assert (=> b!325313 (= res!178647 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156977))))

(declare-fun b!325314 () Bool)

(declare-fun res!178653 () Bool)

(assert (=> b!325314 (=> (not res!178653) (not e!200540))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325314 (= res!178653 (and (= (select (arr!7889 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8241 a!3305))))))

(declare-fun b!325315 () Bool)

(declare-fun res!178644 () Bool)

(declare-fun e!200541 () Bool)

(assert (=> b!325315 (=> (not res!178644) (not e!200541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16663 (_ BitVec 32)) Bool)

(assert (=> b!325315 (= res!178644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325316 () Bool)

(assert (=> b!325316 (= e!200540 (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) resX!58))))

(declare-fun lt!156978 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325316 (= lt!156978 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun res!178649 () Bool)

(assert (=> start!32524 (=> (not res!178649) (not e!200541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32524 (= res!178649 (validMask!0 mask!3777))))

(assert (=> start!32524 e!200541))

(declare-fun array_inv!5852 (array!16663) Bool)

(assert (=> start!32524 (array_inv!5852 a!3305)))

(assert (=> start!32524 true))

(declare-fun b!325317 () Bool)

(declare-fun res!178648 () Bool)

(assert (=> b!325317 (=> (not res!178648) (not e!200541))))

(declare-fun arrayContainsKey!0 (array!16663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325317 (= res!178648 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325318 () Bool)

(declare-fun res!178651 () Bool)

(assert (=> b!325318 (=> (not res!178651) (not e!200541))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16663 (_ BitVec 32)) SeekEntryResult!3020)

(assert (=> b!325318 (= res!178651 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3020 i!1250)))))

(declare-fun b!325319 () Bool)

(assert (=> b!325319 (= e!200541 e!200540)))

(declare-fun res!178645 () Bool)

(assert (=> b!325319 (=> (not res!178645) (not e!200540))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325319 (= res!178645 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156977))))

(assert (=> b!325319 (= lt!156977 (Intermediate!3020 false resIndex!58 resX!58))))

(declare-fun b!325320 () Bool)

(declare-fun res!178652 () Bool)

(assert (=> b!325320 (=> (not res!178652) (not e!200541))))

(assert (=> b!325320 (= res!178652 (and (= (size!8241 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8241 a!3305))))))

(declare-fun b!325321 () Bool)

(declare-fun res!178650 () Bool)

(assert (=> b!325321 (=> (not res!178650) (not e!200540))))

(assert (=> b!325321 (= res!178650 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7889 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325322 () Bool)

(declare-fun res!178646 () Bool)

(assert (=> b!325322 (=> (not res!178646) (not e!200541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325322 (= res!178646 (validKeyInArray!0 k!2497))))

(assert (= (and start!32524 res!178649) b!325320))

(assert (= (and b!325320 res!178652) b!325322))

(assert (= (and b!325322 res!178646) b!325317))

(assert (= (and b!325317 res!178648) b!325318))

(assert (= (and b!325318 res!178651) b!325315))

(assert (= (and b!325315 res!178644) b!325319))

(assert (= (and b!325319 res!178645) b!325314))

(assert (= (and b!325314 res!178653) b!325313))

(assert (= (and b!325313 res!178647) b!325321))

(assert (= (and b!325321 res!178650) b!325316))

(declare-fun m!332183 () Bool)

(assert (=> b!325315 m!332183))

(declare-fun m!332185 () Bool)

(assert (=> b!325321 m!332185))

(declare-fun m!332187 () Bool)

(assert (=> b!325322 m!332187))

(declare-fun m!332189 () Bool)

(assert (=> b!325314 m!332189))

(declare-fun m!332191 () Bool)

(assert (=> b!325318 m!332191))

(declare-fun m!332193 () Bool)

(assert (=> b!325316 m!332193))

(declare-fun m!332195 () Bool)

(assert (=> b!325313 m!332195))

(declare-fun m!332197 () Bool)

(assert (=> start!32524 m!332197))

(declare-fun m!332199 () Bool)

(assert (=> start!32524 m!332199))

(declare-fun m!332201 () Bool)

(assert (=> b!325317 m!332201))

(declare-fun m!332203 () Bool)

(assert (=> b!325319 m!332203))

(assert (=> b!325319 m!332203))

(declare-fun m!332205 () Bool)

(assert (=> b!325319 m!332205))

(push 1)

(assert (not b!325315))

(assert (not b!325316))

(assert (not b!325318))

(assert (not b!325317))

(assert (not b!325313))

(assert (not b!325319))

(assert (not start!32524))

(assert (not b!325322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

