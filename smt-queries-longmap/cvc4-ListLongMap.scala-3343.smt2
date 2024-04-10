; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46054 () Bool)

(assert start!46054)

(declare-fun b!510027 () Bool)

(declare-fun res!310879 () Bool)

(declare-fun e!298182 () Bool)

(assert (=> b!510027 (=> (not res!310879) (not e!298182))))

(declare-datatypes ((array!32765 0))(
  ( (array!32766 (arr!15761 (Array (_ BitVec 32) (_ BitVec 64))) (size!16125 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32765)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510027 (= res!310879 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510028 () Bool)

(declare-fun res!310874 () Bool)

(assert (=> b!510028 (=> (not res!310874) (not e!298182))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510028 (= res!310874 (validKeyInArray!0 (select (arr!15761 a!3235) j!176)))))

(declare-fun b!510029 () Bool)

(declare-fun res!310878 () Bool)

(assert (=> b!510029 (=> (not res!310878) (not e!298182))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510029 (= res!310878 (and (= (size!16125 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16125 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16125 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!310872 () Bool)

(assert (=> start!46054 (=> (not res!310872) (not e!298182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46054 (= res!310872 (validMask!0 mask!3524))))

(assert (=> start!46054 e!298182))

(assert (=> start!46054 true))

(declare-fun array_inv!11557 (array!32765) Bool)

(assert (=> start!46054 (array_inv!11557 a!3235)))

(declare-fun b!510030 () Bool)

(declare-fun e!298185 () Bool)

(assert (=> b!510030 (= e!298182 e!298185)))

(declare-fun res!310880 () Bool)

(assert (=> b!510030 (=> (not res!310880) (not e!298185))))

(declare-datatypes ((SeekEntryResult!4228 0))(
  ( (MissingZero!4228 (index!19100 (_ BitVec 32))) (Found!4228 (index!19101 (_ BitVec 32))) (Intermediate!4228 (undefined!5040 Bool) (index!19102 (_ BitVec 32)) (x!48061 (_ BitVec 32))) (Undefined!4228) (MissingVacant!4228 (index!19103 (_ BitVec 32))) )
))
(declare-fun lt!233109 () SeekEntryResult!4228)

(assert (=> b!510030 (= res!310880 (or (= lt!233109 (MissingZero!4228 i!1204)) (= lt!233109 (MissingVacant!4228 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32765 (_ BitVec 32)) SeekEntryResult!4228)

(assert (=> b!510030 (= lt!233109 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510031 () Bool)

(declare-fun e!298183 () Bool)

(assert (=> b!510031 (= e!298183 (= (seekEntryOrOpen!0 (select (arr!15761 a!3235) j!176) a!3235 mask!3524) (Found!4228 j!176)))))

(declare-fun b!510032 () Bool)

(declare-fun res!310873 () Bool)

(assert (=> b!510032 (=> (not res!310873) (not e!298185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32765 (_ BitVec 32)) Bool)

(assert (=> b!510032 (= res!310873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510033 () Bool)

(assert (=> b!510033 (= e!298185 (not true))))

(declare-fun lt!233113 () (_ BitVec 32))

(declare-fun lt!233111 () SeekEntryResult!4228)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32765 (_ BitVec 32)) SeekEntryResult!4228)

(assert (=> b!510033 (= lt!233111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233113 (select (store (arr!15761 a!3235) i!1204 k!2280) j!176) (array!32766 (store (arr!15761 a!3235) i!1204 k!2280) (size!16125 a!3235)) mask!3524))))

(declare-fun lt!233108 () (_ BitVec 32))

(declare-fun lt!233112 () SeekEntryResult!4228)

(assert (=> b!510033 (= lt!233112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233108 (select (arr!15761 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510033 (= lt!233113 (toIndex!0 (select (store (arr!15761 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!510033 (= lt!233108 (toIndex!0 (select (arr!15761 a!3235) j!176) mask!3524))))

(assert (=> b!510033 e!298183))

(declare-fun res!310875 () Bool)

(assert (=> b!510033 (=> (not res!310875) (not e!298183))))

(assert (=> b!510033 (= res!310875 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15714 0))(
  ( (Unit!15715) )
))
(declare-fun lt!233110 () Unit!15714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15714)

(assert (=> b!510033 (= lt!233110 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510034 () Bool)

(declare-fun res!310877 () Bool)

(assert (=> b!510034 (=> (not res!310877) (not e!298185))))

(declare-datatypes ((List!9919 0))(
  ( (Nil!9916) (Cons!9915 (h!10792 (_ BitVec 64)) (t!16147 List!9919)) )
))
(declare-fun arrayNoDuplicates!0 (array!32765 (_ BitVec 32) List!9919) Bool)

(assert (=> b!510034 (= res!310877 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9916))))

(declare-fun b!510035 () Bool)

(declare-fun res!310876 () Bool)

(assert (=> b!510035 (=> (not res!310876) (not e!298182))))

(assert (=> b!510035 (= res!310876 (validKeyInArray!0 k!2280))))

(assert (= (and start!46054 res!310872) b!510029))

(assert (= (and b!510029 res!310878) b!510028))

(assert (= (and b!510028 res!310874) b!510035))

(assert (= (and b!510035 res!310876) b!510027))

(assert (= (and b!510027 res!310879) b!510030))

(assert (= (and b!510030 res!310880) b!510032))

(assert (= (and b!510032 res!310873) b!510034))

(assert (= (and b!510034 res!310877) b!510033))

(assert (= (and b!510033 res!310875) b!510031))

(declare-fun m!491109 () Bool)

(assert (=> b!510027 m!491109))

(declare-fun m!491111 () Bool)

(assert (=> b!510030 m!491111))

(declare-fun m!491113 () Bool)

(assert (=> b!510034 m!491113))

(declare-fun m!491115 () Bool)

(assert (=> b!510032 m!491115))

(declare-fun m!491117 () Bool)

(assert (=> b!510035 m!491117))

(declare-fun m!491119 () Bool)

(assert (=> b!510033 m!491119))

(declare-fun m!491121 () Bool)

(assert (=> b!510033 m!491121))

(declare-fun m!491123 () Bool)

(assert (=> b!510033 m!491123))

(declare-fun m!491125 () Bool)

(assert (=> b!510033 m!491125))

(declare-fun m!491127 () Bool)

(assert (=> b!510033 m!491127))

(assert (=> b!510033 m!491119))

(declare-fun m!491129 () Bool)

(assert (=> b!510033 m!491129))

(declare-fun m!491131 () Bool)

(assert (=> b!510033 m!491131))

(assert (=> b!510033 m!491127))

(declare-fun m!491133 () Bool)

(assert (=> b!510033 m!491133))

(assert (=> b!510033 m!491127))

(declare-fun m!491135 () Bool)

(assert (=> b!510033 m!491135))

(assert (=> b!510033 m!491119))

(assert (=> b!510028 m!491119))

(assert (=> b!510028 m!491119))

(declare-fun m!491137 () Bool)

(assert (=> b!510028 m!491137))

(declare-fun m!491139 () Bool)

(assert (=> start!46054 m!491139))

(declare-fun m!491141 () Bool)

(assert (=> start!46054 m!491141))

(assert (=> b!510031 m!491119))

(assert (=> b!510031 m!491119))

(declare-fun m!491143 () Bool)

(assert (=> b!510031 m!491143))

(push 1)

