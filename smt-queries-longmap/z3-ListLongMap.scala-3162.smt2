; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44600 () Bool)

(assert start!44600)

(declare-fun b!489183 () Bool)

(declare-fun res!292119 () Bool)

(declare-fun e!287743 () Bool)

(assert (=> b!489183 (=> (not res!292119) (not e!287743))))

(declare-datatypes ((array!31659 0))(
  ( (array!31660 (arr!15217 (Array (_ BitVec 32) (_ BitVec 64))) (size!15581 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31659)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489183 (= res!292119 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489184 () Bool)

(declare-fun res!292121 () Bool)

(declare-fun e!287742 () Bool)

(assert (=> b!489184 (=> (not res!292121) (not e!287742))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31659 (_ BitVec 32)) Bool)

(assert (=> b!489184 (= res!292121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489185 () Bool)

(declare-fun res!292124 () Bool)

(assert (=> b!489185 (=> (not res!292124) (not e!287743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489185 (= res!292124 (validKeyInArray!0 k0!2280))))

(declare-fun b!489186 () Bool)

(assert (=> b!489186 (= e!287742 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!220701 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489186 (= lt!220701 (toIndex!0 (select (store (arr!15217 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287744 () Bool)

(assert (=> b!489186 e!287744))

(declare-fun res!292122 () Bool)

(assert (=> b!489186 (=> (not res!292122) (not e!287744))))

(assert (=> b!489186 (= res!292122 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14314 0))(
  ( (Unit!14315) )
))
(declare-fun lt!220702 () Unit!14314)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14314)

(assert (=> b!489186 (= lt!220702 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489187 () Bool)

(declare-datatypes ((SeekEntryResult!3684 0))(
  ( (MissingZero!3684 (index!16915 (_ BitVec 32))) (Found!3684 (index!16916 (_ BitVec 32))) (Intermediate!3684 (undefined!4496 Bool) (index!16917 (_ BitVec 32)) (x!46030 (_ BitVec 32))) (Undefined!3684) (MissingVacant!3684 (index!16918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31659 (_ BitVec 32)) SeekEntryResult!3684)

(assert (=> b!489187 (= e!287744 (= (seekEntryOrOpen!0 (select (arr!15217 a!3235) j!176) a!3235 mask!3524) (Found!3684 j!176)))))

(declare-fun b!489188 () Bool)

(assert (=> b!489188 (= e!287743 e!287742)))

(declare-fun res!292123 () Bool)

(assert (=> b!489188 (=> (not res!292123) (not e!287742))))

(declare-fun lt!220700 () SeekEntryResult!3684)

(assert (=> b!489188 (= res!292123 (or (= lt!220700 (MissingZero!3684 i!1204)) (= lt!220700 (MissingVacant!3684 i!1204))))))

(assert (=> b!489188 (= lt!220700 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!292127 () Bool)

(assert (=> start!44600 (=> (not res!292127) (not e!287743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44600 (= res!292127 (validMask!0 mask!3524))))

(assert (=> start!44600 e!287743))

(assert (=> start!44600 true))

(declare-fun array_inv!11013 (array!31659) Bool)

(assert (=> start!44600 (array_inv!11013 a!3235)))

(declare-fun b!489189 () Bool)

(declare-fun res!292126 () Bool)

(assert (=> b!489189 (=> (not res!292126) (not e!287743))))

(assert (=> b!489189 (= res!292126 (validKeyInArray!0 (select (arr!15217 a!3235) j!176)))))

(declare-fun b!489190 () Bool)

(declare-fun res!292125 () Bool)

(assert (=> b!489190 (=> (not res!292125) (not e!287742))))

(declare-datatypes ((List!9375 0))(
  ( (Nil!9372) (Cons!9371 (h!10233 (_ BitVec 64)) (t!15603 List!9375)) )
))
(declare-fun arrayNoDuplicates!0 (array!31659 (_ BitVec 32) List!9375) Bool)

(assert (=> b!489190 (= res!292125 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9372))))

(declare-fun b!489191 () Bool)

(declare-fun res!292120 () Bool)

(assert (=> b!489191 (=> (not res!292120) (not e!287743))))

(assert (=> b!489191 (= res!292120 (and (= (size!15581 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15581 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15581 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44600 res!292127) b!489191))

(assert (= (and b!489191 res!292120) b!489189))

(assert (= (and b!489189 res!292126) b!489185))

(assert (= (and b!489185 res!292124) b!489183))

(assert (= (and b!489183 res!292119) b!489188))

(assert (= (and b!489188 res!292123) b!489184))

(assert (= (and b!489184 res!292121) b!489190))

(assert (= (and b!489190 res!292125) b!489186))

(assert (= (and b!489186 res!292122) b!489187))

(declare-fun m!468909 () Bool)

(assert (=> b!489188 m!468909))

(declare-fun m!468911 () Bool)

(assert (=> b!489187 m!468911))

(assert (=> b!489187 m!468911))

(declare-fun m!468913 () Bool)

(assert (=> b!489187 m!468913))

(declare-fun m!468915 () Bool)

(assert (=> b!489185 m!468915))

(declare-fun m!468917 () Bool)

(assert (=> b!489190 m!468917))

(assert (=> b!489189 m!468911))

(assert (=> b!489189 m!468911))

(declare-fun m!468919 () Bool)

(assert (=> b!489189 m!468919))

(declare-fun m!468921 () Bool)

(assert (=> start!44600 m!468921))

(declare-fun m!468923 () Bool)

(assert (=> start!44600 m!468923))

(declare-fun m!468925 () Bool)

(assert (=> b!489186 m!468925))

(declare-fun m!468927 () Bool)

(assert (=> b!489186 m!468927))

(declare-fun m!468929 () Bool)

(assert (=> b!489186 m!468929))

(declare-fun m!468931 () Bool)

(assert (=> b!489186 m!468931))

(assert (=> b!489186 m!468929))

(declare-fun m!468933 () Bool)

(assert (=> b!489186 m!468933))

(declare-fun m!468935 () Bool)

(assert (=> b!489183 m!468935))

(declare-fun m!468937 () Bool)

(assert (=> b!489184 m!468937))

(check-sat (not start!44600) (not b!489183) (not b!489184) (not b!489187) (not b!489185) (not b!489189) (not b!489188) (not b!489186) (not b!489190))
(check-sat)
