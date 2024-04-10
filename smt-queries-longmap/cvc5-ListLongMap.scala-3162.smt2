; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44598 () Bool)

(assert start!44598)

(declare-fun b!489156 () Bool)

(declare-fun res!292098 () Bool)

(declare-fun e!287731 () Bool)

(assert (=> b!489156 (=> (not res!292098) (not e!287731))))

(declare-datatypes ((array!31657 0))(
  ( (array!31658 (arr!15216 (Array (_ BitVec 32) (_ BitVec 64))) (size!15580 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31657)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489156 (= res!292098 (validKeyInArray!0 (select (arr!15216 a!3235) j!176)))))

(declare-fun b!489157 () Bool)

(declare-fun res!292094 () Bool)

(assert (=> b!489157 (=> (not res!292094) (not e!287731))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!489157 (= res!292094 (validKeyInArray!0 k!2280))))

(declare-fun res!292095 () Bool)

(assert (=> start!44598 (=> (not res!292095) (not e!287731))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44598 (= res!292095 (validMask!0 mask!3524))))

(assert (=> start!44598 e!287731))

(assert (=> start!44598 true))

(declare-fun array_inv!11012 (array!31657) Bool)

(assert (=> start!44598 (array_inv!11012 a!3235)))

(declare-fun b!489158 () Bool)

(declare-fun e!287732 () Bool)

(assert (=> b!489158 (= e!287731 e!287732)))

(declare-fun res!292097 () Bool)

(assert (=> b!489158 (=> (not res!292097) (not e!287732))))

(declare-datatypes ((SeekEntryResult!3683 0))(
  ( (MissingZero!3683 (index!16911 (_ BitVec 32))) (Found!3683 (index!16912 (_ BitVec 32))) (Intermediate!3683 (undefined!4495 Bool) (index!16913 (_ BitVec 32)) (x!46029 (_ BitVec 32))) (Undefined!3683) (MissingVacant!3683 (index!16914 (_ BitVec 32))) )
))
(declare-fun lt!220692 () SeekEntryResult!3683)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489158 (= res!292097 (or (= lt!220692 (MissingZero!3683 i!1204)) (= lt!220692 (MissingVacant!3683 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31657 (_ BitVec 32)) SeekEntryResult!3683)

(assert (=> b!489158 (= lt!220692 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489159 () Bool)

(declare-fun res!292096 () Bool)

(assert (=> b!489159 (=> (not res!292096) (not e!287732))))

(declare-datatypes ((List!9374 0))(
  ( (Nil!9371) (Cons!9370 (h!10232 (_ BitVec 64)) (t!15602 List!9374)) )
))
(declare-fun arrayNoDuplicates!0 (array!31657 (_ BitVec 32) List!9374) Bool)

(assert (=> b!489159 (= res!292096 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9371))))

(declare-fun b!489160 () Bool)

(declare-fun res!292093 () Bool)

(assert (=> b!489160 (=> (not res!292093) (not e!287731))))

(declare-fun arrayContainsKey!0 (array!31657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489160 (= res!292093 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489161 () Bool)

(assert (=> b!489161 (= e!287732 (not true))))

(declare-fun lt!220693 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489161 (= lt!220693 (toIndex!0 (select (store (arr!15216 a!3235) i!1204 k!2280) j!176) mask!3524))))

(declare-fun e!287733 () Bool)

(assert (=> b!489161 e!287733))

(declare-fun res!292099 () Bool)

(assert (=> b!489161 (=> (not res!292099) (not e!287733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31657 (_ BitVec 32)) Bool)

(assert (=> b!489161 (= res!292099 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14312 0))(
  ( (Unit!14313) )
))
(declare-fun lt!220691 () Unit!14312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14312)

(assert (=> b!489161 (= lt!220691 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489162 () Bool)

(declare-fun res!292092 () Bool)

(assert (=> b!489162 (=> (not res!292092) (not e!287732))))

(assert (=> b!489162 (= res!292092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489163 () Bool)

(assert (=> b!489163 (= e!287733 (= (seekEntryOrOpen!0 (select (arr!15216 a!3235) j!176) a!3235 mask!3524) (Found!3683 j!176)))))

(declare-fun b!489164 () Bool)

(declare-fun res!292100 () Bool)

(assert (=> b!489164 (=> (not res!292100) (not e!287731))))

(assert (=> b!489164 (= res!292100 (and (= (size!15580 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15580 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15580 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44598 res!292095) b!489164))

(assert (= (and b!489164 res!292100) b!489156))

(assert (= (and b!489156 res!292098) b!489157))

(assert (= (and b!489157 res!292094) b!489160))

(assert (= (and b!489160 res!292093) b!489158))

(assert (= (and b!489158 res!292097) b!489162))

(assert (= (and b!489162 res!292092) b!489159))

(assert (= (and b!489159 res!292096) b!489161))

(assert (= (and b!489161 res!292099) b!489163))

(declare-fun m!468879 () Bool)

(assert (=> b!489162 m!468879))

(declare-fun m!468881 () Bool)

(assert (=> b!489156 m!468881))

(assert (=> b!489156 m!468881))

(declare-fun m!468883 () Bool)

(assert (=> b!489156 m!468883))

(declare-fun m!468885 () Bool)

(assert (=> b!489158 m!468885))

(declare-fun m!468887 () Bool)

(assert (=> b!489159 m!468887))

(declare-fun m!468889 () Bool)

(assert (=> b!489160 m!468889))

(declare-fun m!468891 () Bool)

(assert (=> b!489157 m!468891))

(declare-fun m!468893 () Bool)

(assert (=> start!44598 m!468893))

(declare-fun m!468895 () Bool)

(assert (=> start!44598 m!468895))

(declare-fun m!468897 () Bool)

(assert (=> b!489161 m!468897))

(declare-fun m!468899 () Bool)

(assert (=> b!489161 m!468899))

(declare-fun m!468901 () Bool)

(assert (=> b!489161 m!468901))

(declare-fun m!468903 () Bool)

(assert (=> b!489161 m!468903))

(assert (=> b!489161 m!468901))

(declare-fun m!468905 () Bool)

(assert (=> b!489161 m!468905))

(assert (=> b!489163 m!468881))

(assert (=> b!489163 m!468881))

(declare-fun m!468907 () Bool)

(assert (=> b!489163 m!468907))

(push 1)

