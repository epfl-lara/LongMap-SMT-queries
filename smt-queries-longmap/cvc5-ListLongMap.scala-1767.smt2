; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32238 () Bool)

(assert start!32238)

(declare-fun b!321200 () Bool)

(declare-fun e!199079 () Bool)

(assert (=> b!321200 (= e!199079 false)))

(declare-datatypes ((array!16441 0))(
  ( (array!16442 (arr!7779 (Array (_ BitVec 32) (_ BitVec 64))) (size!8131 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16441)

(declare-datatypes ((SeekEntryResult!2875 0))(
  ( (MissingZero!2875 (index!13676 (_ BitVec 32))) (Found!2875 (index!13677 (_ BitVec 32))) (Intermediate!2875 (undefined!3687 Bool) (index!13678 (_ BitVec 32)) (x!32043 (_ BitVec 32))) (Undefined!2875) (MissingVacant!2875 (index!13679 (_ BitVec 32))) )
))
(declare-fun lt!156192 () SeekEntryResult!2875)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16441 (_ BitVec 32)) SeekEntryResult!2875)

(assert (=> b!321200 (= lt!156192 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(declare-fun b!321201 () Bool)

(declare-fun res!175374 () Bool)

(assert (=> b!321201 (=> (not res!175374) (not e!199079))))

(declare-fun arrayContainsKey!0 (array!16441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321201 (= res!175374 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!175377 () Bool)

(assert (=> start!32238 (=> (not res!175377) (not e!199079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32238 (= res!175377 (validMask!0 mask!3777))))

(assert (=> start!32238 e!199079))

(declare-fun array_inv!5729 (array!16441) Bool)

(assert (=> start!32238 (array_inv!5729 a!3305)))

(assert (=> start!32238 true))

(declare-fun b!321202 () Bool)

(declare-fun res!175373 () Bool)

(assert (=> b!321202 (=> (not res!175373) (not e!199079))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321202 (= res!175373 (and (= (select (arr!7779 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8131 a!3305))))))

(declare-fun b!321203 () Bool)

(declare-fun res!175371 () Bool)

(assert (=> b!321203 (=> (not res!175371) (not e!199079))))

(assert (=> b!321203 (= res!175371 (and (= (size!8131 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8131 a!3305))))))

(declare-fun b!321204 () Bool)

(declare-fun res!175375 () Bool)

(assert (=> b!321204 (=> (not res!175375) (not e!199079))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321204 (= res!175375 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2875 false resIndex!58 resX!58)))))

(declare-fun b!321205 () Bool)

(declare-fun res!175376 () Bool)

(assert (=> b!321205 (=> (not res!175376) (not e!199079))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16441 (_ BitVec 32)) SeekEntryResult!2875)

(assert (=> b!321205 (= res!175376 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2875 i!1250)))))

(declare-fun b!321206 () Bool)

(declare-fun res!175372 () Bool)

(assert (=> b!321206 (=> (not res!175372) (not e!199079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16441 (_ BitVec 32)) Bool)

(assert (=> b!321206 (= res!175372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321207 () Bool)

(declare-fun res!175370 () Bool)

(assert (=> b!321207 (=> (not res!175370) (not e!199079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321207 (= res!175370 (validKeyInArray!0 k!2497))))

(assert (= (and start!32238 res!175377) b!321203))

(assert (= (and b!321203 res!175371) b!321207))

(assert (= (and b!321207 res!175370) b!321201))

(assert (= (and b!321201 res!175374) b!321205))

(assert (= (and b!321205 res!175376) b!321206))

(assert (= (and b!321206 res!175372) b!321204))

(assert (= (and b!321204 res!175375) b!321202))

(assert (= (and b!321202 res!175373) b!321200))

(declare-fun m!329609 () Bool)

(assert (=> b!321205 m!329609))

(declare-fun m!329611 () Bool)

(assert (=> start!32238 m!329611))

(declare-fun m!329613 () Bool)

(assert (=> start!32238 m!329613))

(declare-fun m!329615 () Bool)

(assert (=> b!321201 m!329615))

(declare-fun m!329617 () Bool)

(assert (=> b!321204 m!329617))

(assert (=> b!321204 m!329617))

(declare-fun m!329619 () Bool)

(assert (=> b!321204 m!329619))

(declare-fun m!329621 () Bool)

(assert (=> b!321200 m!329621))

(declare-fun m!329623 () Bool)

(assert (=> b!321202 m!329623))

(declare-fun m!329625 () Bool)

(assert (=> b!321206 m!329625))

(declare-fun m!329627 () Bool)

(assert (=> b!321207 m!329627))

(push 1)

(assert (not start!32238))

(assert (not b!321207))

(assert (not b!321204))

(assert (not b!321206))

(assert (not b!321205))

(assert (not b!321200))

(assert (not b!321201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

