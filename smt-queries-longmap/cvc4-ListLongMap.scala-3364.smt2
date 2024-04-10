; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46240 () Bool)

(assert start!46240)

(declare-fun b!512090 () Bool)

(declare-fun res!312758 () Bool)

(declare-fun e!299127 () Bool)

(assert (=> b!512090 (=> (not res!312758) (not e!299127))))

(declare-datatypes ((array!32894 0))(
  ( (array!32895 (arr!15824 (Array (_ BitVec 32) (_ BitVec 64))) (size!16188 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32894)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512090 (= res!312758 (validKeyInArray!0 (select (arr!15824 a!3235) j!176)))))

(declare-fun b!512091 () Bool)

(declare-fun res!312760 () Bool)

(assert (=> b!512091 (=> (not res!312760) (not e!299127))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!512091 (= res!312760 (validKeyInArray!0 k!2280))))

(declare-fun b!512092 () Bool)

(declare-fun res!312756 () Bool)

(declare-fun e!299124 () Bool)

(assert (=> b!512092 (=> res!312756 e!299124)))

(declare-datatypes ((SeekEntryResult!4291 0))(
  ( (MissingZero!4291 (index!19352 (_ BitVec 32))) (Found!4291 (index!19353 (_ BitVec 32))) (Intermediate!4291 (undefined!5103 Bool) (index!19354 (_ BitVec 32)) (x!48298 (_ BitVec 32))) (Undefined!4291) (MissingVacant!4291 (index!19355 (_ BitVec 32))) )
))
(declare-fun lt!234374 () SeekEntryResult!4291)

(assert (=> b!512092 (= res!312756 (or (not (is-Intermediate!4291 lt!234374)) (not (undefined!5103 lt!234374))))))

(declare-fun b!512093 () Bool)

(declare-fun e!299125 () Bool)

(assert (=> b!512093 (= e!299125 (not e!299124))))

(declare-fun res!312759 () Bool)

(assert (=> b!512093 (=> res!312759 e!299124)))

(declare-fun lt!234376 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32894 (_ BitVec 32)) SeekEntryResult!4291)

(assert (=> b!512093 (= res!312759 (= lt!234374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234376 (select (store (arr!15824 a!3235) i!1204 k!2280) j!176) (array!32895 (store (arr!15824 a!3235) i!1204 k!2280) (size!16188 a!3235)) mask!3524)))))

(declare-fun lt!234373 () (_ BitVec 32))

(assert (=> b!512093 (= lt!234374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234373 (select (arr!15824 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512093 (= lt!234376 (toIndex!0 (select (store (arr!15824 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512093 (= lt!234373 (toIndex!0 (select (arr!15824 a!3235) j!176) mask!3524))))

(declare-fun lt!234375 () SeekEntryResult!4291)

(assert (=> b!512093 (= lt!234375 (Found!4291 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32894 (_ BitVec 32)) SeekEntryResult!4291)

(assert (=> b!512093 (= lt!234375 (seekEntryOrOpen!0 (select (arr!15824 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32894 (_ BitVec 32)) Bool)

(assert (=> b!512093 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15840 0))(
  ( (Unit!15841) )
))
(declare-fun lt!234371 () Unit!15840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15840)

(assert (=> b!512093 (= lt!234371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!312757 () Bool)

(assert (=> start!46240 (=> (not res!312757) (not e!299127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46240 (= res!312757 (validMask!0 mask!3524))))

(assert (=> start!46240 e!299127))

(assert (=> start!46240 true))

(declare-fun array_inv!11620 (array!32894) Bool)

(assert (=> start!46240 (array_inv!11620 a!3235)))

(declare-fun b!512094 () Bool)

(declare-fun res!312754 () Bool)

(assert (=> b!512094 (=> (not res!312754) (not e!299127))))

(assert (=> b!512094 (= res!312754 (and (= (size!16188 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16188 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16188 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512095 () Bool)

(assert (=> b!512095 (= e!299127 e!299125)))

(declare-fun res!312761 () Bool)

(assert (=> b!512095 (=> (not res!312761) (not e!299125))))

(declare-fun lt!234372 () SeekEntryResult!4291)

(assert (=> b!512095 (= res!312761 (or (= lt!234372 (MissingZero!4291 i!1204)) (= lt!234372 (MissingVacant!4291 i!1204))))))

(assert (=> b!512095 (= lt!234372 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512096 () Bool)

(declare-fun res!312753 () Bool)

(assert (=> b!512096 (=> (not res!312753) (not e!299127))))

(declare-fun arrayContainsKey!0 (array!32894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512096 (= res!312753 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512097 () Bool)

(declare-fun res!312755 () Bool)

(assert (=> b!512097 (=> (not res!312755) (not e!299125))))

(assert (=> b!512097 (= res!312755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512098 () Bool)

(assert (=> b!512098 (= e!299124 false)))

(assert (=> b!512098 (= lt!234375 Undefined!4291)))

(declare-fun b!512099 () Bool)

(declare-fun res!312752 () Bool)

(assert (=> b!512099 (=> (not res!312752) (not e!299125))))

(declare-datatypes ((List!9982 0))(
  ( (Nil!9979) (Cons!9978 (h!10858 (_ BitVec 64)) (t!16210 List!9982)) )
))
(declare-fun arrayNoDuplicates!0 (array!32894 (_ BitVec 32) List!9982) Bool)

(assert (=> b!512099 (= res!312752 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9979))))

(assert (= (and start!46240 res!312757) b!512094))

(assert (= (and b!512094 res!312754) b!512090))

(assert (= (and b!512090 res!312758) b!512091))

(assert (= (and b!512091 res!312760) b!512096))

(assert (= (and b!512096 res!312753) b!512095))

(assert (= (and b!512095 res!312761) b!512097))

(assert (= (and b!512097 res!312755) b!512099))

(assert (= (and b!512099 res!312752) b!512093))

(assert (= (and b!512093 (not res!312759)) b!512092))

(assert (= (and b!512092 (not res!312756)) b!512098))

(declare-fun m!493677 () Bool)

(assert (=> start!46240 m!493677))

(declare-fun m!493679 () Bool)

(assert (=> start!46240 m!493679))

(declare-fun m!493681 () Bool)

(assert (=> b!512099 m!493681))

(declare-fun m!493683 () Bool)

(assert (=> b!512095 m!493683))

(declare-fun m!493685 () Bool)

(assert (=> b!512096 m!493685))

(declare-fun m!493687 () Bool)

(assert (=> b!512090 m!493687))

(assert (=> b!512090 m!493687))

(declare-fun m!493689 () Bool)

(assert (=> b!512090 m!493689))

(declare-fun m!493691 () Bool)

(assert (=> b!512091 m!493691))

(declare-fun m!493693 () Bool)

(assert (=> b!512093 m!493693))

(declare-fun m!493695 () Bool)

(assert (=> b!512093 m!493695))

(declare-fun m!493697 () Bool)

(assert (=> b!512093 m!493697))

(assert (=> b!512093 m!493697))

(declare-fun m!493699 () Bool)

(assert (=> b!512093 m!493699))

(assert (=> b!512093 m!493687))

(declare-fun m!493701 () Bool)

(assert (=> b!512093 m!493701))

(assert (=> b!512093 m!493687))

(declare-fun m!493703 () Bool)

(assert (=> b!512093 m!493703))

(assert (=> b!512093 m!493687))

(declare-fun m!493705 () Bool)

(assert (=> b!512093 m!493705))

(assert (=> b!512093 m!493697))

(declare-fun m!493707 () Bool)

(assert (=> b!512093 m!493707))

(assert (=> b!512093 m!493687))

(declare-fun m!493709 () Bool)

(assert (=> b!512093 m!493709))

(declare-fun m!493711 () Bool)

(assert (=> b!512097 m!493711))

(push 1)

