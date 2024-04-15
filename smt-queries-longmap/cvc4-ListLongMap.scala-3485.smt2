; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48368 () Bool)

(assert start!48368)

(declare-fun b!531334 () Bool)

(declare-fun res!326971 () Bool)

(declare-fun e!309478 () Bool)

(assert (=> b!531334 (=> (not res!326971) (not e!309478))))

(declare-datatypes ((array!33686 0))(
  ( (array!33687 (arr!16185 (Array (_ BitVec 32) (_ BitVec 64))) (size!16550 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33686)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531334 (= res!326971 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531335 () Bool)

(declare-fun e!309480 () Bool)

(assert (=> b!531335 (= e!309480 false)))

(declare-fun lt!244806 () Bool)

(declare-datatypes ((List!10343 0))(
  ( (Nil!10340) (Cons!10339 (h!11279 (_ BitVec 64)) (t!16562 List!10343)) )
))
(declare-fun arrayNoDuplicates!0 (array!33686 (_ BitVec 32) List!10343) Bool)

(assert (=> b!531335 (= lt!244806 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10340))))

(declare-fun b!531336 () Bool)

(declare-fun res!326972 () Bool)

(assert (=> b!531336 (=> (not res!326972) (not e!309478))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531336 (= res!326972 (validKeyInArray!0 (select (arr!16185 a!3154) j!147)))))

(declare-fun res!326968 () Bool)

(assert (=> start!48368 (=> (not res!326968) (not e!309478))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48368 (= res!326968 (validMask!0 mask!3216))))

(assert (=> start!48368 e!309478))

(assert (=> start!48368 true))

(declare-fun array_inv!12068 (array!33686) Bool)

(assert (=> start!48368 (array_inv!12068 a!3154)))

(declare-fun b!531337 () Bool)

(declare-fun res!326970 () Bool)

(assert (=> b!531337 (=> (not res!326970) (not e!309480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33686 (_ BitVec 32)) Bool)

(assert (=> b!531337 (= res!326970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531338 () Bool)

(declare-fun res!326969 () Bool)

(assert (=> b!531338 (=> (not res!326969) (not e!309478))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531338 (= res!326969 (and (= (size!16550 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16550 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16550 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531339 () Bool)

(declare-fun res!326967 () Bool)

(assert (=> b!531339 (=> (not res!326967) (not e!309478))))

(assert (=> b!531339 (= res!326967 (validKeyInArray!0 k!1998))))

(declare-fun b!531340 () Bool)

(assert (=> b!531340 (= e!309478 e!309480)))

(declare-fun res!326966 () Bool)

(assert (=> b!531340 (=> (not res!326966) (not e!309480))))

(declare-datatypes ((SeekEntryResult!4640 0))(
  ( (MissingZero!4640 (index!20784 (_ BitVec 32))) (Found!4640 (index!20785 (_ BitVec 32))) (Intermediate!4640 (undefined!5452 Bool) (index!20786 (_ BitVec 32)) (x!49769 (_ BitVec 32))) (Undefined!4640) (MissingVacant!4640 (index!20787 (_ BitVec 32))) )
))
(declare-fun lt!244807 () SeekEntryResult!4640)

(assert (=> b!531340 (= res!326966 (or (= lt!244807 (MissingZero!4640 i!1153)) (= lt!244807 (MissingVacant!4640 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33686 (_ BitVec 32)) SeekEntryResult!4640)

(assert (=> b!531340 (= lt!244807 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48368 res!326968) b!531338))

(assert (= (and b!531338 res!326969) b!531336))

(assert (= (and b!531336 res!326972) b!531339))

(assert (= (and b!531339 res!326967) b!531334))

(assert (= (and b!531334 res!326971) b!531340))

(assert (= (and b!531340 res!326966) b!531337))

(assert (= (and b!531337 res!326970) b!531335))

(declare-fun m!511237 () Bool)

(assert (=> start!48368 m!511237))

(declare-fun m!511239 () Bool)

(assert (=> start!48368 m!511239))

(declare-fun m!511241 () Bool)

(assert (=> b!531339 m!511241))

(declare-fun m!511243 () Bool)

(assert (=> b!531334 m!511243))

(declare-fun m!511245 () Bool)

(assert (=> b!531335 m!511245))

(declare-fun m!511247 () Bool)

(assert (=> b!531336 m!511247))

(assert (=> b!531336 m!511247))

(declare-fun m!511249 () Bool)

(assert (=> b!531336 m!511249))

(declare-fun m!511251 () Bool)

(assert (=> b!531337 m!511251))

(declare-fun m!511253 () Bool)

(assert (=> b!531340 m!511253))

(push 1)

(assert (not b!531336))

(assert (not b!531335))

(assert (not b!531340))

(assert (not b!531337))

(assert (not start!48368))

(assert (not b!531334))

(assert (not b!531339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

