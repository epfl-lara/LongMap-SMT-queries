; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44684 () Bool)

(assert start!44684)

(declare-fun b!490400 () Bool)

(declare-fun e!288279 () Bool)

(assert (=> b!490400 (= e!288279 true)))

(declare-fun lt!221523 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3682 0))(
  ( (MissingZero!3682 (index!16907 (_ BitVec 32))) (Found!3682 (index!16908 (_ BitVec 32))) (Intermediate!3682 (undefined!4494 Bool) (index!16909 (_ BitVec 32)) (x!46153 (_ BitVec 32))) (Undefined!3682) (MissingVacant!3682 (index!16910 (_ BitVec 32))) )
))
(declare-fun lt!221524 () SeekEntryResult!3682)

(declare-datatypes ((array!31744 0))(
  ( (array!31745 (arr!15259 (Array (_ BitVec 32) (_ BitVec 64))) (size!15623 (_ BitVec 32))) )
))
(declare-fun lt!221522 () array!31744)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31744 (_ BitVec 32)) SeekEntryResult!3682)

(assert (=> b!490400 (= lt!221524 (seekEntryOrOpen!0 lt!221523 lt!221522 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun a!3235 () array!31744)

(declare-datatypes ((Unit!14371 0))(
  ( (Unit!14372) )
))
(declare-fun lt!221519 () Unit!14371)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31744 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14371)

(assert (=> b!490400 (= lt!221519 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun res!293396 () Bool)

(declare-fun e!288278 () Bool)

(assert (=> start!44684 (=> (not res!293396) (not e!288278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44684 (= res!293396 (validMask!0 mask!3524))))

(assert (=> start!44684 e!288278))

(assert (=> start!44684 true))

(declare-fun array_inv!11118 (array!31744) Bool)

(assert (=> start!44684 (array_inv!11118 a!3235)))

(declare-fun b!490401 () Bool)

(declare-fun res!293395 () Bool)

(assert (=> b!490401 (=> (not res!293395) (not e!288278))))

(assert (=> b!490401 (= res!293395 (and (= (size!15623 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15623 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15623 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490402 () Bool)

(declare-fun res!293397 () Bool)

(assert (=> b!490402 (=> (not res!293397) (not e!288278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490402 (= res!293397 (validKeyInArray!0 k0!2280))))

(declare-fun b!490403 () Bool)

(declare-fun res!293391 () Bool)

(assert (=> b!490403 (=> (not res!293391) (not e!288278))))

(declare-fun arrayContainsKey!0 (array!31744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490403 (= res!293391 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490404 () Bool)

(declare-fun res!293394 () Bool)

(assert (=> b!490404 (=> (not res!293394) (not e!288278))))

(assert (=> b!490404 (= res!293394 (validKeyInArray!0 (select (arr!15259 a!3235) j!176)))))

(declare-fun b!490405 () Bool)

(declare-fun res!293393 () Bool)

(declare-fun e!288276 () Bool)

(assert (=> b!490405 (=> (not res!293393) (not e!288276))))

(declare-datatypes ((List!9324 0))(
  ( (Nil!9321) (Cons!9320 (h!10182 (_ BitVec 64)) (t!15544 List!9324)) )
))
(declare-fun arrayNoDuplicates!0 (array!31744 (_ BitVec 32) List!9324) Bool)

(assert (=> b!490405 (= res!293393 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9321))))

(declare-fun b!490406 () Bool)

(declare-fun res!293392 () Bool)

(assert (=> b!490406 (=> (not res!293392) (not e!288276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31744 (_ BitVec 32)) Bool)

(assert (=> b!490406 (= res!293392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490407 () Bool)

(assert (=> b!490407 (= e!288278 e!288276)))

(declare-fun res!293398 () Bool)

(assert (=> b!490407 (=> (not res!293398) (not e!288276))))

(declare-fun lt!221521 () SeekEntryResult!3682)

(assert (=> b!490407 (= res!293398 (or (= lt!221521 (MissingZero!3682 i!1204)) (= lt!221521 (MissingVacant!3682 i!1204))))))

(assert (=> b!490407 (= lt!221521 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490408 () Bool)

(assert (=> b!490408 (= e!288276 (not e!288279))))

(declare-fun res!293390 () Bool)

(assert (=> b!490408 (=> res!293390 e!288279)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31744 (_ BitVec 32)) SeekEntryResult!3682)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490408 (= res!293390 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15259 a!3235) j!176) mask!3524) (select (arr!15259 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221523 mask!3524) lt!221523 lt!221522 mask!3524))))))

(assert (=> b!490408 (= lt!221523 (select (store (arr!15259 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490408 (= lt!221522 (array!31745 (store (arr!15259 a!3235) i!1204 k0!2280) (size!15623 a!3235)))))

(assert (=> b!490408 (= lt!221524 (Found!3682 j!176))))

(assert (=> b!490408 (= lt!221524 (seekEntryOrOpen!0 (select (arr!15259 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490408 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221520 () Unit!14371)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14371)

(assert (=> b!490408 (= lt!221520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44684 res!293396) b!490401))

(assert (= (and b!490401 res!293395) b!490404))

(assert (= (and b!490404 res!293394) b!490402))

(assert (= (and b!490402 res!293397) b!490403))

(assert (= (and b!490403 res!293391) b!490407))

(assert (= (and b!490407 res!293398) b!490406))

(assert (= (and b!490406 res!293392) b!490405))

(assert (= (and b!490405 res!293393) b!490408))

(assert (= (and b!490408 (not res!293390)) b!490400))

(declare-fun m!470761 () Bool)

(assert (=> b!490400 m!470761))

(declare-fun m!470763 () Bool)

(assert (=> b!490400 m!470763))

(declare-fun m!470765 () Bool)

(assert (=> b!490407 m!470765))

(declare-fun m!470767 () Bool)

(assert (=> b!490404 m!470767))

(assert (=> b!490404 m!470767))

(declare-fun m!470769 () Bool)

(assert (=> b!490404 m!470769))

(declare-fun m!470771 () Bool)

(assert (=> b!490402 m!470771))

(declare-fun m!470773 () Bool)

(assert (=> start!44684 m!470773))

(declare-fun m!470775 () Bool)

(assert (=> start!44684 m!470775))

(declare-fun m!470777 () Bool)

(assert (=> b!490403 m!470777))

(declare-fun m!470779 () Bool)

(assert (=> b!490405 m!470779))

(declare-fun m!470781 () Bool)

(assert (=> b!490408 m!470781))

(declare-fun m!470783 () Bool)

(assert (=> b!490408 m!470783))

(declare-fun m!470785 () Bool)

(assert (=> b!490408 m!470785))

(assert (=> b!490408 m!470767))

(declare-fun m!470787 () Bool)

(assert (=> b!490408 m!470787))

(assert (=> b!490408 m!470767))

(assert (=> b!490408 m!470785))

(declare-fun m!470789 () Bool)

(assert (=> b!490408 m!470789))

(declare-fun m!470791 () Bool)

(assert (=> b!490408 m!470791))

(assert (=> b!490408 m!470767))

(declare-fun m!470793 () Bool)

(assert (=> b!490408 m!470793))

(assert (=> b!490408 m!470767))

(declare-fun m!470795 () Bool)

(assert (=> b!490408 m!470795))

(assert (=> b!490408 m!470789))

(declare-fun m!470797 () Bool)

(assert (=> b!490408 m!470797))

(declare-fun m!470799 () Bool)

(assert (=> b!490406 m!470799))

(check-sat (not b!490400) (not b!490405) (not start!44684) (not b!490408) (not b!490406) (not b!490403) (not b!490402) (not b!490407) (not b!490404))
(check-sat)
