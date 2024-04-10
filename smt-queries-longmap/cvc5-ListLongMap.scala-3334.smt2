; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45996 () Bool)

(assert start!45996)

(declare-fun b!509244 () Bool)

(declare-fun res!310090 () Bool)

(declare-fun e!297837 () Bool)

(assert (=> b!509244 (=> (not res!310090) (not e!297837))))

(declare-datatypes ((array!32707 0))(
  ( (array!32708 (arr!15732 (Array (_ BitVec 32) (_ BitVec 64))) (size!16096 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32707)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509244 (= res!310090 (validKeyInArray!0 (select (arr!15732 a!3235) j!176)))))

(declare-fun res!310097 () Bool)

(assert (=> start!45996 (=> (not res!310097) (not e!297837))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45996 (= res!310097 (validMask!0 mask!3524))))

(assert (=> start!45996 e!297837))

(assert (=> start!45996 true))

(declare-fun array_inv!11528 (array!32707) Bool)

(assert (=> start!45996 (array_inv!11528 a!3235)))

(declare-fun b!509245 () Bool)

(declare-fun res!310092 () Bool)

(assert (=> b!509245 (=> (not res!310092) (not e!297837))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509245 (= res!310092 (and (= (size!16096 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16096 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16096 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509246 () Bool)

(declare-fun e!297836 () Bool)

(assert (=> b!509246 (= e!297836 (not true))))

(declare-datatypes ((SeekEntryResult!4199 0))(
  ( (MissingZero!4199 (index!18984 (_ BitVec 32))) (Found!4199 (index!18985 (_ BitVec 32))) (Intermediate!4199 (undefined!5011 Bool) (index!18986 (_ BitVec 32)) (x!47960 (_ BitVec 32))) (Undefined!4199) (MissingVacant!4199 (index!18987 (_ BitVec 32))) )
))
(declare-fun lt!232588 () SeekEntryResult!4199)

(declare-fun lt!232586 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32707 (_ BitVec 32)) SeekEntryResult!4199)

(assert (=> b!509246 (= lt!232588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232586 (select (store (arr!15732 a!3235) i!1204 k!2280) j!176) (array!32708 (store (arr!15732 a!3235) i!1204 k!2280) (size!16096 a!3235)) mask!3524))))

(declare-fun lt!232590 () (_ BitVec 32))

(declare-fun lt!232589 () SeekEntryResult!4199)

(assert (=> b!509246 (= lt!232589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232590 (select (arr!15732 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509246 (= lt!232586 (toIndex!0 (select (store (arr!15732 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509246 (= lt!232590 (toIndex!0 (select (arr!15732 a!3235) j!176) mask!3524))))

(declare-fun e!297834 () Bool)

(assert (=> b!509246 e!297834))

(declare-fun res!310093 () Bool)

(assert (=> b!509246 (=> (not res!310093) (not e!297834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32707 (_ BitVec 32)) Bool)

(assert (=> b!509246 (= res!310093 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15656 0))(
  ( (Unit!15657) )
))
(declare-fun lt!232587 () Unit!15656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15656)

(assert (=> b!509246 (= lt!232587 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509247 () Bool)

(declare-fun res!310091 () Bool)

(assert (=> b!509247 (=> (not res!310091) (not e!297836))))

(declare-datatypes ((List!9890 0))(
  ( (Nil!9887) (Cons!9886 (h!10763 (_ BitVec 64)) (t!16118 List!9890)) )
))
(declare-fun arrayNoDuplicates!0 (array!32707 (_ BitVec 32) List!9890) Bool)

(assert (=> b!509247 (= res!310091 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9887))))

(declare-fun b!509248 () Bool)

(assert (=> b!509248 (= e!297837 e!297836)))

(declare-fun res!310096 () Bool)

(assert (=> b!509248 (=> (not res!310096) (not e!297836))))

(declare-fun lt!232591 () SeekEntryResult!4199)

(assert (=> b!509248 (= res!310096 (or (= lt!232591 (MissingZero!4199 i!1204)) (= lt!232591 (MissingVacant!4199 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32707 (_ BitVec 32)) SeekEntryResult!4199)

(assert (=> b!509248 (= lt!232591 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509249 () Bool)

(declare-fun res!310094 () Bool)

(assert (=> b!509249 (=> (not res!310094) (not e!297836))))

(assert (=> b!509249 (= res!310094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509250 () Bool)

(declare-fun res!310089 () Bool)

(assert (=> b!509250 (=> (not res!310089) (not e!297837))))

(assert (=> b!509250 (= res!310089 (validKeyInArray!0 k!2280))))

(declare-fun b!509251 () Bool)

(declare-fun res!310095 () Bool)

(assert (=> b!509251 (=> (not res!310095) (not e!297837))))

(declare-fun arrayContainsKey!0 (array!32707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509251 (= res!310095 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509252 () Bool)

(assert (=> b!509252 (= e!297834 (= (seekEntryOrOpen!0 (select (arr!15732 a!3235) j!176) a!3235 mask!3524) (Found!4199 j!176)))))

(assert (= (and start!45996 res!310097) b!509245))

(assert (= (and b!509245 res!310092) b!509244))

(assert (= (and b!509244 res!310090) b!509250))

(assert (= (and b!509250 res!310089) b!509251))

(assert (= (and b!509251 res!310095) b!509248))

(assert (= (and b!509248 res!310096) b!509249))

(assert (= (and b!509249 res!310094) b!509247))

(assert (= (and b!509247 res!310091) b!509246))

(assert (= (and b!509246 res!310093) b!509252))

(declare-fun m!490065 () Bool)

(assert (=> b!509252 m!490065))

(assert (=> b!509252 m!490065))

(declare-fun m!490067 () Bool)

(assert (=> b!509252 m!490067))

(assert (=> b!509244 m!490065))

(assert (=> b!509244 m!490065))

(declare-fun m!490069 () Bool)

(assert (=> b!509244 m!490069))

(declare-fun m!490071 () Bool)

(assert (=> b!509249 m!490071))

(declare-fun m!490073 () Bool)

(assert (=> start!45996 m!490073))

(declare-fun m!490075 () Bool)

(assert (=> start!45996 m!490075))

(declare-fun m!490077 () Bool)

(assert (=> b!509250 m!490077))

(declare-fun m!490079 () Bool)

(assert (=> b!509246 m!490079))

(declare-fun m!490081 () Bool)

(assert (=> b!509246 m!490081))

(declare-fun m!490083 () Bool)

(assert (=> b!509246 m!490083))

(declare-fun m!490085 () Bool)

(assert (=> b!509246 m!490085))

(assert (=> b!509246 m!490079))

(assert (=> b!509246 m!490065))

(declare-fun m!490087 () Bool)

(assert (=> b!509246 m!490087))

(assert (=> b!509246 m!490065))

(declare-fun m!490089 () Bool)

(assert (=> b!509246 m!490089))

(assert (=> b!509246 m!490079))

(declare-fun m!490091 () Bool)

(assert (=> b!509246 m!490091))

(assert (=> b!509246 m!490065))

(declare-fun m!490093 () Bool)

(assert (=> b!509246 m!490093))

(declare-fun m!490095 () Bool)

(assert (=> b!509247 m!490095))

(declare-fun m!490097 () Bool)

(assert (=> b!509251 m!490097))

(declare-fun m!490099 () Bool)

(assert (=> b!509248 m!490099))

(push 1)

