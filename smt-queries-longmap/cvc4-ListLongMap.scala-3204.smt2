; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44974 () Bool)

(assert start!44974)

(declare-fun b!493266 () Bool)

(declare-fun res!295842 () Bool)

(declare-fun e!289710 () Bool)

(assert (=> b!493266 (=> (not res!295842) (not e!289710))))

(declare-datatypes ((array!31919 0))(
  ( (array!31920 (arr!15344 (Array (_ BitVec 32) (_ BitVec 64))) (size!15708 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31919)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31919 (_ BitVec 32)) Bool)

(assert (=> b!493266 (= res!295842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493267 () Bool)

(declare-fun e!289711 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3811 0))(
  ( (MissingZero!3811 (index!17423 (_ BitVec 32))) (Found!3811 (index!17424 (_ BitVec 32))) (Intermediate!3811 (undefined!4623 Bool) (index!17425 (_ BitVec 32)) (x!46505 (_ BitVec 32))) (Undefined!3811) (MissingVacant!3811 (index!17426 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31919 (_ BitVec 32)) SeekEntryResult!3811)

(assert (=> b!493267 (= e!289711 (= (seekEntryOrOpen!0 (select (arr!15344 a!3235) j!176) a!3235 mask!3524) (Found!3811 j!176)))))

(declare-fun b!493268 () Bool)

(declare-fun res!295836 () Bool)

(assert (=> b!493268 (=> (not res!295836) (not e!289710))))

(declare-datatypes ((List!9502 0))(
  ( (Nil!9499) (Cons!9498 (h!10366 (_ BitVec 64)) (t!15730 List!9502)) )
))
(declare-fun arrayNoDuplicates!0 (array!31919 (_ BitVec 32) List!9502) Bool)

(assert (=> b!493268 (= res!295836 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9499))))

(declare-fun b!493269 () Bool)

(declare-fun res!295840 () Bool)

(declare-fun e!289713 () Bool)

(assert (=> b!493269 (=> (not res!295840) (not e!289713))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493269 (= res!295840 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!295839 () Bool)

(assert (=> start!44974 (=> (not res!295839) (not e!289713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44974 (= res!295839 (validMask!0 mask!3524))))

(assert (=> start!44974 e!289713))

(assert (=> start!44974 true))

(declare-fun array_inv!11140 (array!31919) Bool)

(assert (=> start!44974 (array_inv!11140 a!3235)))

(declare-fun b!493270 () Bool)

(declare-fun res!295841 () Bool)

(assert (=> b!493270 (=> (not res!295841) (not e!289713))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493270 (= res!295841 (and (= (size!15708 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15708 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15708 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493271 () Bool)

(assert (=> b!493271 (= e!289710 (not true))))

(declare-fun lt!223066 () (_ BitVec 32))

(declare-fun lt!223063 () SeekEntryResult!3811)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31919 (_ BitVec 32)) SeekEntryResult!3811)

(assert (=> b!493271 (= lt!223063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223066 (select (store (arr!15344 a!3235) i!1204 k!2280) j!176) (array!31920 (store (arr!15344 a!3235) i!1204 k!2280) (size!15708 a!3235)) mask!3524))))

(declare-fun lt!223065 () SeekEntryResult!3811)

(declare-fun lt!223061 () (_ BitVec 32))

(assert (=> b!493271 (= lt!223065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223061 (select (arr!15344 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493271 (= lt!223066 (toIndex!0 (select (store (arr!15344 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493271 (= lt!223061 (toIndex!0 (select (arr!15344 a!3235) j!176) mask!3524))))

(assert (=> b!493271 e!289711))

(declare-fun res!295844 () Bool)

(assert (=> b!493271 (=> (not res!295844) (not e!289711))))

(assert (=> b!493271 (= res!295844 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14568 0))(
  ( (Unit!14569) )
))
(declare-fun lt!223062 () Unit!14568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14568)

(assert (=> b!493271 (= lt!223062 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493272 () Bool)

(declare-fun res!295843 () Bool)

(assert (=> b!493272 (=> (not res!295843) (not e!289713))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493272 (= res!295843 (validKeyInArray!0 k!2280))))

(declare-fun b!493273 () Bool)

(declare-fun res!295838 () Bool)

(assert (=> b!493273 (=> (not res!295838) (not e!289713))))

(assert (=> b!493273 (= res!295838 (validKeyInArray!0 (select (arr!15344 a!3235) j!176)))))

(declare-fun b!493274 () Bool)

(assert (=> b!493274 (= e!289713 e!289710)))

(declare-fun res!295837 () Bool)

(assert (=> b!493274 (=> (not res!295837) (not e!289710))))

(declare-fun lt!223064 () SeekEntryResult!3811)

(assert (=> b!493274 (= res!295837 (or (= lt!223064 (MissingZero!3811 i!1204)) (= lt!223064 (MissingVacant!3811 i!1204))))))

(assert (=> b!493274 (= lt!223064 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44974 res!295839) b!493270))

(assert (= (and b!493270 res!295841) b!493273))

(assert (= (and b!493273 res!295838) b!493272))

(assert (= (and b!493272 res!295843) b!493269))

(assert (= (and b!493269 res!295840) b!493274))

(assert (= (and b!493274 res!295837) b!493266))

(assert (= (and b!493266 res!295842) b!493268))

(assert (= (and b!493268 res!295836) b!493271))

(assert (= (and b!493271 res!295844) b!493267))

(declare-fun m!474063 () Bool)

(assert (=> b!493274 m!474063))

(declare-fun m!474065 () Bool)

(assert (=> b!493273 m!474065))

(assert (=> b!493273 m!474065))

(declare-fun m!474067 () Bool)

(assert (=> b!493273 m!474067))

(declare-fun m!474069 () Bool)

(assert (=> b!493266 m!474069))

(declare-fun m!474071 () Bool)

(assert (=> b!493271 m!474071))

(declare-fun m!474073 () Bool)

(assert (=> b!493271 m!474073))

(declare-fun m!474075 () Bool)

(assert (=> b!493271 m!474075))

(assert (=> b!493271 m!474071))

(assert (=> b!493271 m!474065))

(declare-fun m!474077 () Bool)

(assert (=> b!493271 m!474077))

(assert (=> b!493271 m!474065))

(declare-fun m!474079 () Bool)

(assert (=> b!493271 m!474079))

(assert (=> b!493271 m!474071))

(declare-fun m!474081 () Bool)

(assert (=> b!493271 m!474081))

(declare-fun m!474083 () Bool)

(assert (=> b!493271 m!474083))

(assert (=> b!493271 m!474065))

(declare-fun m!474085 () Bool)

(assert (=> b!493271 m!474085))

(assert (=> b!493267 m!474065))

(assert (=> b!493267 m!474065))

(declare-fun m!474087 () Bool)

(assert (=> b!493267 m!474087))

(declare-fun m!474089 () Bool)

(assert (=> b!493268 m!474089))

(declare-fun m!474091 () Bool)

(assert (=> b!493269 m!474091))

(declare-fun m!474093 () Bool)

(assert (=> b!493272 m!474093))

(declare-fun m!474095 () Bool)

(assert (=> start!44974 m!474095))

(declare-fun m!474097 () Bool)

(assert (=> start!44974 m!474097))

(push 1)

