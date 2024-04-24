; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44954 () Bool)

(assert start!44954)

(declare-fun b!493063 () Bool)

(declare-fun res!295690 () Bool)

(declare-fun e!289606 () Bool)

(assert (=> b!493063 (=> (not res!295690) (not e!289606))))

(declare-datatypes ((array!31900 0))(
  ( (array!31901 (arr!15334 (Array (_ BitVec 32) (_ BitVec 64))) (size!15698 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31900)

(declare-datatypes ((List!9399 0))(
  ( (Nil!9396) (Cons!9395 (h!10263 (_ BitVec 64)) (t!15619 List!9399)) )
))
(declare-fun arrayNoDuplicates!0 (array!31900 (_ BitVec 32) List!9399) Bool)

(assert (=> b!493063 (= res!295690 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9396))))

(declare-fun b!493064 () Bool)

(declare-fun res!295693 () Bool)

(declare-fun e!289608 () Bool)

(assert (=> b!493064 (=> (not res!295693) (not e!289608))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493064 (= res!295693 (validKeyInArray!0 k0!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!493065 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!289604 () Bool)

(declare-datatypes ((SeekEntryResult!3757 0))(
  ( (MissingZero!3757 (index!17207 (_ BitVec 32))) (Found!3757 (index!17208 (_ BitVec 32))) (Intermediate!3757 (undefined!4569 Bool) (index!17209 (_ BitVec 32)) (x!46440 (_ BitVec 32))) (Undefined!3757) (MissingVacant!3757 (index!17210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31900 (_ BitVec 32)) SeekEntryResult!3757)

(assert (=> b!493065 (= e!289604 (= (seekEntryOrOpen!0 (select (arr!15334 a!3235) j!176) a!3235 mask!3524) (Found!3757 j!176)))))

(declare-fun b!493066 () Bool)

(declare-fun e!289605 () Bool)

(assert (=> b!493066 (= e!289606 (not e!289605))))

(declare-fun res!295695 () Bool)

(assert (=> b!493066 (=> res!295695 e!289605)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!222994 () (_ BitVec 32))

(declare-fun lt!222993 () SeekEntryResult!3757)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31900 (_ BitVec 32)) SeekEntryResult!3757)

(assert (=> b!493066 (= res!295695 (= lt!222993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222994 (select (store (arr!15334 a!3235) i!1204 k0!2280) j!176) (array!31901 (store (arr!15334 a!3235) i!1204 k0!2280) (size!15698 a!3235)) mask!3524)))))

(declare-fun lt!222990 () (_ BitVec 32))

(assert (=> b!493066 (= lt!222993 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222990 (select (arr!15334 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493066 (= lt!222994 (toIndex!0 (select (store (arr!15334 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493066 (= lt!222990 (toIndex!0 (select (arr!15334 a!3235) j!176) mask!3524))))

(assert (=> b!493066 e!289604))

(declare-fun res!295688 () Bool)

(assert (=> b!493066 (=> (not res!295688) (not e!289604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31900 (_ BitVec 32)) Bool)

(assert (=> b!493066 (= res!295688 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14521 0))(
  ( (Unit!14522) )
))
(declare-fun lt!222991 () Unit!14521)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14521)

(assert (=> b!493066 (= lt!222991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493067 () Bool)

(declare-fun res!295687 () Bool)

(assert (=> b!493067 (=> (not res!295687) (not e!289608))))

(assert (=> b!493067 (= res!295687 (validKeyInArray!0 (select (arr!15334 a!3235) j!176)))))

(declare-fun b!493068 () Bool)

(get-info :version)

(assert (=> b!493068 (= e!289605 (or (not ((_ is Intermediate!3757) lt!222993)) (not (undefined!4569 lt!222993)) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun b!493069 () Bool)

(declare-fun res!295694 () Bool)

(assert (=> b!493069 (=> (not res!295694) (not e!289606))))

(assert (=> b!493069 (= res!295694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493070 () Bool)

(declare-fun res!295692 () Bool)

(assert (=> b!493070 (=> (not res!295692) (not e!289608))))

(declare-fun arrayContainsKey!0 (array!31900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493070 (= res!295692 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493071 () Bool)

(assert (=> b!493071 (= e!289608 e!289606)))

(declare-fun res!295696 () Bool)

(assert (=> b!493071 (=> (not res!295696) (not e!289606))))

(declare-fun lt!222992 () SeekEntryResult!3757)

(assert (=> b!493071 (= res!295696 (or (= lt!222992 (MissingZero!3757 i!1204)) (= lt!222992 (MissingVacant!3757 i!1204))))))

(assert (=> b!493071 (= lt!222992 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493072 () Bool)

(declare-fun res!295689 () Bool)

(assert (=> b!493072 (=> (not res!295689) (not e!289608))))

(assert (=> b!493072 (= res!295689 (and (= (size!15698 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15698 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15698 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!295691 () Bool)

(assert (=> start!44954 (=> (not res!295691) (not e!289608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44954 (= res!295691 (validMask!0 mask!3524))))

(assert (=> start!44954 e!289608))

(assert (=> start!44954 true))

(declare-fun array_inv!11193 (array!31900) Bool)

(assert (=> start!44954 (array_inv!11193 a!3235)))

(assert (= (and start!44954 res!295691) b!493072))

(assert (= (and b!493072 res!295689) b!493067))

(assert (= (and b!493067 res!295687) b!493064))

(assert (= (and b!493064 res!295693) b!493070))

(assert (= (and b!493070 res!295692) b!493071))

(assert (= (and b!493071 res!295696) b!493069))

(assert (= (and b!493069 res!295694) b!493063))

(assert (= (and b!493063 res!295690) b!493066))

(assert (= (and b!493066 res!295688) b!493065))

(assert (= (and b!493066 (not res!295695)) b!493068))

(declare-fun m!474067 () Bool)

(assert (=> b!493066 m!474067))

(declare-fun m!474069 () Bool)

(assert (=> b!493066 m!474069))

(declare-fun m!474071 () Bool)

(assert (=> b!493066 m!474071))

(declare-fun m!474073 () Bool)

(assert (=> b!493066 m!474073))

(declare-fun m!474075 () Bool)

(assert (=> b!493066 m!474075))

(assert (=> b!493066 m!474073))

(assert (=> b!493066 m!474073))

(declare-fun m!474077 () Bool)

(assert (=> b!493066 m!474077))

(declare-fun m!474079 () Bool)

(assert (=> b!493066 m!474079))

(assert (=> b!493066 m!474071))

(declare-fun m!474081 () Bool)

(assert (=> b!493066 m!474081))

(assert (=> b!493066 m!474071))

(declare-fun m!474083 () Bool)

(assert (=> b!493066 m!474083))

(declare-fun m!474085 () Bool)

(assert (=> b!493064 m!474085))

(declare-fun m!474087 () Bool)

(assert (=> b!493063 m!474087))

(declare-fun m!474089 () Bool)

(assert (=> b!493069 m!474089))

(declare-fun m!474091 () Bool)

(assert (=> start!44954 m!474091))

(declare-fun m!474093 () Bool)

(assert (=> start!44954 m!474093))

(assert (=> b!493067 m!474073))

(assert (=> b!493067 m!474073))

(declare-fun m!474095 () Bool)

(assert (=> b!493067 m!474095))

(declare-fun m!474097 () Bool)

(assert (=> b!493071 m!474097))

(declare-fun m!474099 () Bool)

(assert (=> b!493070 m!474099))

(assert (=> b!493065 m!474073))

(assert (=> b!493065 m!474073))

(declare-fun m!474101 () Bool)

(assert (=> b!493065 m!474101))

(check-sat (not b!493065) (not b!493069) (not b!493063) (not b!493067) (not b!493064) (not start!44954) (not b!493070) (not b!493066) (not b!493071))
(check-sat)
