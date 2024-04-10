; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46002 () Bool)

(assert start!46002)

(declare-fun b!509325 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!297872 () Bool)

(declare-datatypes ((array!32713 0))(
  ( (array!32714 (arr!15735 (Array (_ BitVec 32) (_ BitVec 64))) (size!16099 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32713)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4202 0))(
  ( (MissingZero!4202 (index!18996 (_ BitVec 32))) (Found!4202 (index!18997 (_ BitVec 32))) (Intermediate!4202 (undefined!5014 Bool) (index!18998 (_ BitVec 32)) (x!47971 (_ BitVec 32))) (Undefined!4202) (MissingVacant!4202 (index!18999 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32713 (_ BitVec 32)) SeekEntryResult!4202)

(assert (=> b!509325 (= e!297872 (= (seekEntryOrOpen!0 (select (arr!15735 a!3235) j!176) a!3235 mask!3524) (Found!4202 j!176)))))

(declare-fun b!509326 () Bool)

(declare-fun e!297871 () Bool)

(declare-fun e!297870 () Bool)

(assert (=> b!509326 (= e!297871 e!297870)))

(declare-fun res!310176 () Bool)

(assert (=> b!509326 (=> (not res!310176) (not e!297870))))

(declare-fun lt!232645 () SeekEntryResult!4202)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509326 (= res!310176 (or (= lt!232645 (MissingZero!4202 i!1204)) (= lt!232645 (MissingVacant!4202 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!509326 (= lt!232645 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509327 () Bool)

(declare-fun res!310178 () Bool)

(assert (=> b!509327 (=> (not res!310178) (not e!297871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509327 (= res!310178 (validKeyInArray!0 k!2280))))

(declare-fun res!310175 () Bool)

(assert (=> start!46002 (=> (not res!310175) (not e!297871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46002 (= res!310175 (validMask!0 mask!3524))))

(assert (=> start!46002 e!297871))

(assert (=> start!46002 true))

(declare-fun array_inv!11531 (array!32713) Bool)

(assert (=> start!46002 (array_inv!11531 a!3235)))

(declare-fun b!509328 () Bool)

(declare-fun res!310177 () Bool)

(assert (=> b!509328 (=> (not res!310177) (not e!297871))))

(assert (=> b!509328 (= res!310177 (and (= (size!16099 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16099 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16099 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509329 () Bool)

(declare-fun res!310172 () Bool)

(assert (=> b!509329 (=> (not res!310172) (not e!297870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32713 (_ BitVec 32)) Bool)

(assert (=> b!509329 (= res!310172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509330 () Bool)

(declare-fun res!310171 () Bool)

(assert (=> b!509330 (=> (not res!310171) (not e!297870))))

(declare-datatypes ((List!9893 0))(
  ( (Nil!9890) (Cons!9889 (h!10766 (_ BitVec 64)) (t!16121 List!9893)) )
))
(declare-fun arrayNoDuplicates!0 (array!32713 (_ BitVec 32) List!9893) Bool)

(assert (=> b!509330 (= res!310171 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9890))))

(declare-fun b!509331 () Bool)

(declare-fun res!310174 () Bool)

(assert (=> b!509331 (=> (not res!310174) (not e!297871))))

(assert (=> b!509331 (= res!310174 (validKeyInArray!0 (select (arr!15735 a!3235) j!176)))))

(declare-fun b!509332 () Bool)

(declare-fun res!310173 () Bool)

(assert (=> b!509332 (=> (not res!310173) (not e!297871))))

(declare-fun arrayContainsKey!0 (array!32713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509332 (= res!310173 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509333 () Bool)

(assert (=> b!509333 (= e!297870 (not true))))

(declare-fun lt!232640 () SeekEntryResult!4202)

(declare-fun lt!232644 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32713 (_ BitVec 32)) SeekEntryResult!4202)

(assert (=> b!509333 (= lt!232640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232644 (select (store (arr!15735 a!3235) i!1204 k!2280) j!176) (array!32714 (store (arr!15735 a!3235) i!1204 k!2280) (size!16099 a!3235)) mask!3524))))

(declare-fun lt!232643 () SeekEntryResult!4202)

(declare-fun lt!232641 () (_ BitVec 32))

(assert (=> b!509333 (= lt!232643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232641 (select (arr!15735 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509333 (= lt!232644 (toIndex!0 (select (store (arr!15735 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509333 (= lt!232641 (toIndex!0 (select (arr!15735 a!3235) j!176) mask!3524))))

(assert (=> b!509333 e!297872))

(declare-fun res!310170 () Bool)

(assert (=> b!509333 (=> (not res!310170) (not e!297872))))

(assert (=> b!509333 (= res!310170 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15662 0))(
  ( (Unit!15663) )
))
(declare-fun lt!232642 () Unit!15662)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15662)

(assert (=> b!509333 (= lt!232642 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46002 res!310175) b!509328))

(assert (= (and b!509328 res!310177) b!509331))

(assert (= (and b!509331 res!310174) b!509327))

(assert (= (and b!509327 res!310178) b!509332))

(assert (= (and b!509332 res!310173) b!509326))

(assert (= (and b!509326 res!310176) b!509329))

(assert (= (and b!509329 res!310172) b!509330))

(assert (= (and b!509330 res!310171) b!509333))

(assert (= (and b!509333 res!310170) b!509325))

(declare-fun m!490173 () Bool)

(assert (=> b!509330 m!490173))

(declare-fun m!490175 () Bool)

(assert (=> b!509331 m!490175))

(assert (=> b!509331 m!490175))

(declare-fun m!490177 () Bool)

(assert (=> b!509331 m!490177))

(assert (=> b!509325 m!490175))

(assert (=> b!509325 m!490175))

(declare-fun m!490179 () Bool)

(assert (=> b!509325 m!490179))

(declare-fun m!490181 () Bool)

(assert (=> b!509332 m!490181))

(declare-fun m!490183 () Bool)

(assert (=> b!509329 m!490183))

(declare-fun m!490185 () Bool)

(assert (=> b!509326 m!490185))

(declare-fun m!490187 () Bool)

(assert (=> b!509333 m!490187))

(declare-fun m!490189 () Bool)

(assert (=> b!509333 m!490189))

(assert (=> b!509333 m!490175))

(declare-fun m!490191 () Bool)

(assert (=> b!509333 m!490191))

(assert (=> b!509333 m!490175))

(declare-fun m!490193 () Bool)

(assert (=> b!509333 m!490193))

(assert (=> b!509333 m!490175))

(declare-fun m!490195 () Bool)

(assert (=> b!509333 m!490195))

(assert (=> b!509333 m!490189))

(declare-fun m!490197 () Bool)

(assert (=> b!509333 m!490197))

(assert (=> b!509333 m!490189))

(declare-fun m!490199 () Bool)

(assert (=> b!509333 m!490199))

(declare-fun m!490201 () Bool)

(assert (=> b!509333 m!490201))

(declare-fun m!490203 () Bool)

(assert (=> start!46002 m!490203))

(declare-fun m!490205 () Bool)

(assert (=> start!46002 m!490205))

(declare-fun m!490207 () Bool)

(assert (=> b!509327 m!490207))

(push 1)

