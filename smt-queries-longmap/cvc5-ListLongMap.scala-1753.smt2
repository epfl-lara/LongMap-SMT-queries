; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32116 () Bool)

(assert start!32116)

(declare-fun b!320094 () Bool)

(declare-fun res!174339 () Bool)

(declare-fun e!198705 () Bool)

(assert (=> b!320094 (=> (not res!174339) (not e!198705))))

(declare-datatypes ((array!16351 0))(
  ( (array!16352 (arr!7736 (Array (_ BitVec 32) (_ BitVec 64))) (size!8088 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16351)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16351 (_ BitVec 32)) Bool)

(assert (=> b!320094 (= res!174339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320095 () Bool)

(declare-fun res!174337 () Bool)

(assert (=> b!320095 (=> (not res!174337) (not e!198705))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320095 (= res!174337 (and (= (size!8088 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8088 a!3305))))))

(declare-fun b!320097 () Bool)

(declare-fun res!174341 () Bool)

(assert (=> b!320097 (=> (not res!174341) (not e!198705))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2867 0))(
  ( (MissingZero!2867 (index!13644 (_ BitVec 32))) (Found!2867 (index!13645 (_ BitVec 32))) (Intermediate!2867 (undefined!3679 Bool) (index!13646 (_ BitVec 32)) (x!31920 (_ BitVec 32))) (Undefined!2867) (MissingVacant!2867 (index!13647 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16351 (_ BitVec 32)) SeekEntryResult!2867)

(assert (=> b!320097 (= res!174341 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2867 i!1250)))))

(declare-fun b!320098 () Bool)

(declare-fun res!174338 () Bool)

(assert (=> b!320098 (=> (not res!174338) (not e!198705))))

(declare-fun arrayContainsKey!0 (array!16351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320098 (= res!174338 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320099 () Bool)

(assert (=> b!320099 (= e!198705 false)))

(declare-fun lt!155979 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320099 (= lt!155979 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!320096 () Bool)

(declare-fun res!174340 () Bool)

(assert (=> b!320096 (=> (not res!174340) (not e!198705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320096 (= res!174340 (validKeyInArray!0 k!2497))))

(declare-fun res!174342 () Bool)

(assert (=> start!32116 (=> (not res!174342) (not e!198705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32116 (= res!174342 (validMask!0 mask!3777))))

(assert (=> start!32116 e!198705))

(assert (=> start!32116 true))

(declare-fun array_inv!5699 (array!16351) Bool)

(assert (=> start!32116 (array_inv!5699 a!3305)))

(assert (= (and start!32116 res!174342) b!320095))

(assert (= (and b!320095 res!174337) b!320096))

(assert (= (and b!320096 res!174340) b!320098))

(assert (= (and b!320098 res!174338) b!320097))

(assert (= (and b!320097 res!174341) b!320094))

(assert (= (and b!320094 res!174339) b!320099))

(declare-fun m!328529 () Bool)

(assert (=> b!320096 m!328529))

(declare-fun m!328531 () Bool)

(assert (=> b!320099 m!328531))

(declare-fun m!328533 () Bool)

(assert (=> b!320097 m!328533))

(declare-fun m!328535 () Bool)

(assert (=> start!32116 m!328535))

(declare-fun m!328537 () Bool)

(assert (=> start!32116 m!328537))

(declare-fun m!328539 () Bool)

(assert (=> b!320094 m!328539))

(declare-fun m!328541 () Bool)

(assert (=> b!320098 m!328541))

(push 1)

(assert (not b!320099))

(assert (not b!320098))

(assert (not b!320097))

(assert (not b!320094))

(assert (not b!320096))

(assert (not start!32116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

