; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44710 () Bool)

(assert start!44710)

(declare-fun b!490677 () Bool)

(declare-fun res!293615 () Bool)

(declare-fun e!288413 () Bool)

(assert (=> b!490677 (=> (not res!293615) (not e!288413))))

(declare-datatypes ((array!31769 0))(
  ( (array!31770 (arr!15272 (Array (_ BitVec 32) (_ BitVec 64))) (size!15636 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31769)

(declare-datatypes ((List!9430 0))(
  ( (Nil!9427) (Cons!9426 (h!10288 (_ BitVec 64)) (t!15658 List!9430)) )
))
(declare-fun arrayNoDuplicates!0 (array!31769 (_ BitVec 32) List!9430) Bool)

(assert (=> b!490677 (= res!293615 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9427))))

(declare-fun b!490678 () Bool)

(declare-fun e!288414 () Bool)

(assert (=> b!490678 (= e!288413 (not e!288414))))

(declare-fun res!293621 () Bool)

(assert (=> b!490678 (=> res!293621 e!288414)))

(declare-fun lt!221651 () array!31769)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!221654 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3739 0))(
  ( (MissingZero!3739 (index!17135 (_ BitVec 32))) (Found!3739 (index!17136 (_ BitVec 32))) (Intermediate!3739 (undefined!4551 Bool) (index!17137 (_ BitVec 32)) (x!46229 (_ BitVec 32))) (Undefined!3739) (MissingVacant!3739 (index!17138 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31769 (_ BitVec 32)) SeekEntryResult!3739)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490678 (= res!293621 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15272 a!3235) j!176) mask!3524) (select (arr!15272 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221654 mask!3524) lt!221654 lt!221651 mask!3524))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490678 (= lt!221654 (select (store (arr!15272 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490678 (= lt!221651 (array!31770 (store (arr!15272 a!3235) i!1204 k!2280) (size!15636 a!3235)))))

(declare-fun lt!221652 () SeekEntryResult!3739)

(assert (=> b!490678 (= lt!221652 (Found!3739 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31769 (_ BitVec 32)) SeekEntryResult!3739)

(assert (=> b!490678 (= lt!221652 (seekEntryOrOpen!0 (select (arr!15272 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31769 (_ BitVec 32)) Bool)

(assert (=> b!490678 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14424 0))(
  ( (Unit!14425) )
))
(declare-fun lt!221655 () Unit!14424)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14424)

(assert (=> b!490678 (= lt!221655 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490680 () Bool)

(declare-fun res!293619 () Bool)

(assert (=> b!490680 (=> (not res!293619) (not e!288413))))

(assert (=> b!490680 (= res!293619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490681 () Bool)

(assert (=> b!490681 (= e!288414 true)))

(assert (=> b!490681 (= lt!221652 (seekEntryOrOpen!0 lt!221654 lt!221651 mask!3524))))

(declare-fun lt!221653 () Unit!14424)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14424)

(assert (=> b!490681 (= lt!221653 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490682 () Bool)

(declare-fun res!293618 () Bool)

(declare-fun e!288411 () Bool)

(assert (=> b!490682 (=> (not res!293618) (not e!288411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490682 (= res!293618 (validKeyInArray!0 (select (arr!15272 a!3235) j!176)))))

(declare-fun b!490683 () Bool)

(declare-fun res!293617 () Bool)

(assert (=> b!490683 (=> (not res!293617) (not e!288411))))

(assert (=> b!490683 (= res!293617 (and (= (size!15636 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15636 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15636 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490684 () Bool)

(assert (=> b!490684 (= e!288411 e!288413)))

(declare-fun res!293614 () Bool)

(assert (=> b!490684 (=> (not res!293614) (not e!288413))))

(declare-fun lt!221656 () SeekEntryResult!3739)

(assert (=> b!490684 (= res!293614 (or (= lt!221656 (MissingZero!3739 i!1204)) (= lt!221656 (MissingVacant!3739 i!1204))))))

(assert (=> b!490684 (= lt!221656 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490685 () Bool)

(declare-fun res!293616 () Bool)

(assert (=> b!490685 (=> (not res!293616) (not e!288411))))

(assert (=> b!490685 (= res!293616 (validKeyInArray!0 k!2280))))

(declare-fun b!490679 () Bool)

(declare-fun res!293620 () Bool)

(assert (=> b!490679 (=> (not res!293620) (not e!288411))))

(declare-fun arrayContainsKey!0 (array!31769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490679 (= res!293620 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!293613 () Bool)

(assert (=> start!44710 (=> (not res!293613) (not e!288411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44710 (= res!293613 (validMask!0 mask!3524))))

(assert (=> start!44710 e!288411))

(assert (=> start!44710 true))

(declare-fun array_inv!11068 (array!31769) Bool)

(assert (=> start!44710 (array_inv!11068 a!3235)))

(assert (= (and start!44710 res!293613) b!490683))

(assert (= (and b!490683 res!293617) b!490682))

(assert (= (and b!490682 res!293618) b!490685))

(assert (= (and b!490685 res!293616) b!490679))

(assert (= (and b!490679 res!293620) b!490684))

(assert (= (and b!490684 res!293614) b!490680))

(assert (= (and b!490680 res!293619) b!490677))

(assert (= (and b!490677 res!293615) b!490678))

(assert (= (and b!490678 (not res!293621)) b!490681))

(declare-fun m!470897 () Bool)

(assert (=> b!490678 m!470897))

(assert (=> b!490678 m!470897))

(declare-fun m!470899 () Bool)

(assert (=> b!490678 m!470899))

(declare-fun m!470901 () Bool)

(assert (=> b!490678 m!470901))

(declare-fun m!470903 () Bool)

(assert (=> b!490678 m!470903))

(declare-fun m!470905 () Bool)

(assert (=> b!490678 m!470905))

(declare-fun m!470907 () Bool)

(assert (=> b!490678 m!470907))

(declare-fun m!470909 () Bool)

(assert (=> b!490678 m!470909))

(declare-fun m!470911 () Bool)

(assert (=> b!490678 m!470911))

(assert (=> b!490678 m!470909))

(assert (=> b!490678 m!470907))

(assert (=> b!490678 m!470909))

(declare-fun m!470913 () Bool)

(assert (=> b!490678 m!470913))

(assert (=> b!490678 m!470909))

(declare-fun m!470915 () Bool)

(assert (=> b!490678 m!470915))

(declare-fun m!470917 () Bool)

(assert (=> b!490677 m!470917))

(declare-fun m!470919 () Bool)

(assert (=> b!490680 m!470919))

(declare-fun m!470921 () Bool)

(assert (=> b!490685 m!470921))

(declare-fun m!470923 () Bool)

(assert (=> b!490681 m!470923))

(declare-fun m!470925 () Bool)

(assert (=> b!490681 m!470925))

(declare-fun m!470927 () Bool)

(assert (=> b!490679 m!470927))

(assert (=> b!490682 m!470909))

(assert (=> b!490682 m!470909))

(declare-fun m!470929 () Bool)

(assert (=> b!490682 m!470929))

(declare-fun m!470931 () Bool)

(assert (=> b!490684 m!470931))

(declare-fun m!470933 () Bool)

(assert (=> start!44710 m!470933))

(declare-fun m!470935 () Bool)

(assert (=> start!44710 m!470935))

(push 1)

