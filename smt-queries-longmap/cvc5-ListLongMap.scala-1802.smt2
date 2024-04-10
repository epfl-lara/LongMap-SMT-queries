; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32512 () Bool)

(assert start!32512)

(declare-fun b!325133 () Bool)

(declare-fun res!178470 () Bool)

(declare-fun e!200486 () Bool)

(assert (=> b!325133 (=> (not res!178470) (not e!200486))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325133 (= res!178470 (validKeyInArray!0 k!2497))))

(declare-fun b!325134 () Bool)

(declare-fun res!178467 () Bool)

(declare-fun e!200488 () Bool)

(assert (=> b!325134 (=> (not res!178467) (not e!200488))))

(declare-datatypes ((array!16651 0))(
  ( (array!16652 (arr!7883 (Array (_ BitVec 32) (_ BitVec 64))) (size!8235 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16651)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3014 0))(
  ( (MissingZero!3014 (index!14232 (_ BitVec 32))) (Found!3014 (index!14233 (_ BitVec 32))) (Intermediate!3014 (undefined!3826 Bool) (index!14234 (_ BitVec 32)) (x!32474 (_ BitVec 32))) (Undefined!3014) (MissingVacant!3014 (index!14235 (_ BitVec 32))) )
))
(declare-fun lt!156941 () SeekEntryResult!3014)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16651 (_ BitVec 32)) SeekEntryResult!3014)

(assert (=> b!325134 (= res!178467 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156941))))

(declare-fun res!178473 () Bool)

(assert (=> start!32512 (=> (not res!178473) (not e!200486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32512 (= res!178473 (validMask!0 mask!3777))))

(assert (=> start!32512 e!200486))

(declare-fun array_inv!5846 (array!16651) Bool)

(assert (=> start!32512 (array_inv!5846 a!3305)))

(assert (=> start!32512 true))

(declare-fun b!325135 () Bool)

(declare-fun res!178472 () Bool)

(assert (=> b!325135 (=> (not res!178472) (not e!200486))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16651 (_ BitVec 32)) SeekEntryResult!3014)

(assert (=> b!325135 (= res!178472 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3014 i!1250)))))

(declare-fun b!325136 () Bool)

(declare-fun res!178469 () Bool)

(assert (=> b!325136 (=> (not res!178469) (not e!200486))))

(assert (=> b!325136 (= res!178469 (and (= (size!8235 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8235 a!3305))))))

(declare-fun b!325137 () Bool)

(declare-fun res!178464 () Bool)

(assert (=> b!325137 (=> (not res!178464) (not e!200486))))

(declare-fun arrayContainsKey!0 (array!16651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325137 (= res!178464 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325138 () Bool)

(declare-fun res!178468 () Bool)

(assert (=> b!325138 (=> (not res!178468) (not e!200488))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325138 (= res!178468 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7883 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325139 () Bool)

(declare-fun res!178466 () Bool)

(assert (=> b!325139 (=> (not res!178466) (not e!200486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16651 (_ BitVec 32)) Bool)

(assert (=> b!325139 (= res!178466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325140 () Bool)

(assert (=> b!325140 (= e!200488 false)))

(declare-fun lt!156942 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325140 (= lt!156942 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325141 () Bool)

(assert (=> b!325141 (= e!200486 e!200488)))

(declare-fun res!178471 () Bool)

(assert (=> b!325141 (=> (not res!178471) (not e!200488))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325141 (= res!178471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156941))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325141 (= lt!156941 (Intermediate!3014 false resIndex!58 resX!58))))

(declare-fun b!325142 () Bool)

(declare-fun res!178465 () Bool)

(assert (=> b!325142 (=> (not res!178465) (not e!200488))))

(assert (=> b!325142 (= res!178465 (and (= (select (arr!7883 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8235 a!3305))))))

(assert (= (and start!32512 res!178473) b!325136))

(assert (= (and b!325136 res!178469) b!325133))

(assert (= (and b!325133 res!178470) b!325137))

(assert (= (and b!325137 res!178464) b!325135))

(assert (= (and b!325135 res!178472) b!325139))

(assert (= (and b!325139 res!178466) b!325141))

(assert (= (and b!325141 res!178471) b!325142))

(assert (= (and b!325142 res!178465) b!325134))

(assert (= (and b!325134 res!178467) b!325138))

(assert (= (and b!325138 res!178468) b!325140))

(declare-fun m!332039 () Bool)

(assert (=> start!32512 m!332039))

(declare-fun m!332041 () Bool)

(assert (=> start!32512 m!332041))

(declare-fun m!332043 () Bool)

(assert (=> b!325133 m!332043))

(declare-fun m!332045 () Bool)

(assert (=> b!325134 m!332045))

(declare-fun m!332047 () Bool)

(assert (=> b!325141 m!332047))

(assert (=> b!325141 m!332047))

(declare-fun m!332049 () Bool)

(assert (=> b!325141 m!332049))

(declare-fun m!332051 () Bool)

(assert (=> b!325140 m!332051))

(declare-fun m!332053 () Bool)

(assert (=> b!325138 m!332053))

(declare-fun m!332055 () Bool)

(assert (=> b!325135 m!332055))

(declare-fun m!332057 () Bool)

(assert (=> b!325142 m!332057))

(declare-fun m!332059 () Bool)

(assert (=> b!325139 m!332059))

(declare-fun m!332061 () Bool)

(assert (=> b!325137 m!332061))

(push 1)

