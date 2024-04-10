; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44964 () Bool)

(assert start!44964)

(declare-fun b!493124 () Bool)

(declare-fun res!295702 () Bool)

(declare-fun e!289645 () Bool)

(assert (=> b!493124 (=> (not res!295702) (not e!289645))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31909 0))(
  ( (array!31910 (arr!15339 (Array (_ BitVec 32) (_ BitVec 64))) (size!15703 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31909)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493124 (= res!295702 (and (= (size!15703 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15703 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15703 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493125 () Bool)

(declare-fun res!295701 () Bool)

(assert (=> b!493125 (=> (not res!295701) (not e!289645))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493125 (= res!295701 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493126 () Bool)

(declare-fun e!289647 () Bool)

(declare-fun e!289644 () Bool)

(assert (=> b!493126 (= e!289647 (not e!289644))))

(declare-fun res!295696 () Bool)

(assert (=> b!493126 (=> res!295696 e!289644)))

(declare-datatypes ((SeekEntryResult!3806 0))(
  ( (MissingZero!3806 (index!17403 (_ BitVec 32))) (Found!3806 (index!17404 (_ BitVec 32))) (Intermediate!3806 (undefined!4618 Bool) (index!17405 (_ BitVec 32)) (x!46492 (_ BitVec 32))) (Undefined!3806) (MissingVacant!3806 (index!17406 (_ BitVec 32))) )
))
(declare-fun lt!222981 () SeekEntryResult!3806)

(declare-fun lt!222978 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31909 (_ BitVec 32)) SeekEntryResult!3806)

(assert (=> b!493126 (= res!295696 (= lt!222981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222978 (select (store (arr!15339 a!3235) i!1204 k!2280) j!176) (array!31910 (store (arr!15339 a!3235) i!1204 k!2280) (size!15703 a!3235)) mask!3524)))))

(declare-fun lt!222979 () (_ BitVec 32))

(assert (=> b!493126 (= lt!222981 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222979 (select (arr!15339 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493126 (= lt!222978 (toIndex!0 (select (store (arr!15339 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493126 (= lt!222979 (toIndex!0 (select (arr!15339 a!3235) j!176) mask!3524))))

(declare-fun e!289643 () Bool)

(assert (=> b!493126 e!289643))

(declare-fun res!295695 () Bool)

(assert (=> b!493126 (=> (not res!295695) (not e!289643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31909 (_ BitVec 32)) Bool)

(assert (=> b!493126 (= res!295695 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14558 0))(
  ( (Unit!14559) )
))
(declare-fun lt!222982 () Unit!14558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14558)

(assert (=> b!493126 (= lt!222982 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493127 () Bool)

(assert (=> b!493127 (= e!289645 e!289647)))

(declare-fun res!295700 () Bool)

(assert (=> b!493127 (=> (not res!295700) (not e!289647))))

(declare-fun lt!222980 () SeekEntryResult!3806)

(assert (=> b!493127 (= res!295700 (or (= lt!222980 (MissingZero!3806 i!1204)) (= lt!222980 (MissingVacant!3806 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31909 (_ BitVec 32)) SeekEntryResult!3806)

(assert (=> b!493127 (= lt!222980 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493128 () Bool)

(declare-fun res!295694 () Bool)

(assert (=> b!493128 (=> (not res!295694) (not e!289647))))

(declare-datatypes ((List!9497 0))(
  ( (Nil!9494) (Cons!9493 (h!10361 (_ BitVec 64)) (t!15725 List!9497)) )
))
(declare-fun arrayNoDuplicates!0 (array!31909 (_ BitVec 32) List!9497) Bool)

(assert (=> b!493128 (= res!295694 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9494))))

(declare-fun b!493129 () Bool)

(declare-fun res!295699 () Bool)

(assert (=> b!493129 (=> (not res!295699) (not e!289647))))

(assert (=> b!493129 (= res!295699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493130 () Bool)

(declare-fun res!295697 () Bool)

(assert (=> b!493130 (=> (not res!295697) (not e!289645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493130 (= res!295697 (validKeyInArray!0 k!2280))))

(declare-fun b!493131 () Bool)

(assert (=> b!493131 (= e!289644 (or (not (is-Intermediate!3806 lt!222981)) (not (undefined!4618 lt!222981)) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun b!493132 () Bool)

(declare-fun res!295698 () Bool)

(assert (=> b!493132 (=> (not res!295698) (not e!289645))))

(assert (=> b!493132 (= res!295698 (validKeyInArray!0 (select (arr!15339 a!3235) j!176)))))

(declare-fun b!493133 () Bool)

(assert (=> b!493133 (= e!289643 (= (seekEntryOrOpen!0 (select (arr!15339 a!3235) j!176) a!3235 mask!3524) (Found!3806 j!176)))))

(declare-fun res!295703 () Bool)

(assert (=> start!44964 (=> (not res!295703) (not e!289645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44964 (= res!295703 (validMask!0 mask!3524))))

(assert (=> start!44964 e!289645))

(assert (=> start!44964 true))

(declare-fun array_inv!11135 (array!31909) Bool)

(assert (=> start!44964 (array_inv!11135 a!3235)))

(assert (= (and start!44964 res!295703) b!493124))

(assert (= (and b!493124 res!295702) b!493132))

(assert (= (and b!493132 res!295698) b!493130))

(assert (= (and b!493130 res!295697) b!493125))

(assert (= (and b!493125 res!295701) b!493127))

(assert (= (and b!493127 res!295700) b!493129))

(assert (= (and b!493129 res!295699) b!493128))

(assert (= (and b!493128 res!295694) b!493126))

(assert (= (and b!493126 res!295695) b!493133))

(assert (= (and b!493126 (not res!295696)) b!493131))

(declare-fun m!473883 () Bool)

(assert (=> b!493126 m!473883))

(declare-fun m!473885 () Bool)

(assert (=> b!493126 m!473885))

(declare-fun m!473887 () Bool)

(assert (=> b!493126 m!473887))

(declare-fun m!473889 () Bool)

(assert (=> b!493126 m!473889))

(declare-fun m!473891 () Bool)

(assert (=> b!493126 m!473891))

(assert (=> b!493126 m!473889))

(declare-fun m!473893 () Bool)

(assert (=> b!493126 m!473893))

(assert (=> b!493126 m!473887))

(declare-fun m!473895 () Bool)

(assert (=> b!493126 m!473895))

(assert (=> b!493126 m!473889))

(declare-fun m!473897 () Bool)

(assert (=> b!493126 m!473897))

(assert (=> b!493126 m!473887))

(declare-fun m!473899 () Bool)

(assert (=> b!493126 m!473899))

(declare-fun m!473901 () Bool)

(assert (=> start!44964 m!473901))

(declare-fun m!473903 () Bool)

(assert (=> start!44964 m!473903))

(declare-fun m!473905 () Bool)

(assert (=> b!493125 m!473905))

(declare-fun m!473907 () Bool)

(assert (=> b!493130 m!473907))

(declare-fun m!473909 () Bool)

(assert (=> b!493128 m!473909))

(assert (=> b!493133 m!473889))

(assert (=> b!493133 m!473889))

(declare-fun m!473911 () Bool)

(assert (=> b!493133 m!473911))

(declare-fun m!473913 () Bool)

(assert (=> b!493129 m!473913))

(assert (=> b!493132 m!473889))

(assert (=> b!493132 m!473889))

(declare-fun m!473915 () Bool)

(assert (=> b!493132 m!473915))

(declare-fun m!473917 () Bool)

(assert (=> b!493127 m!473917))

(push 1)

