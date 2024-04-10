; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45058 () Bool)

(assert start!45058)

(declare-fun b!494516 () Bool)

(declare-fun res!297087 () Bool)

(declare-fun e!290217 () Bool)

(assert (=> b!494516 (=> (not res!297087) (not e!290217))))

(declare-datatypes ((array!32003 0))(
  ( (array!32004 (arr!15386 (Array (_ BitVec 32) (_ BitVec 64))) (size!15750 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32003)

(declare-datatypes ((List!9544 0))(
  ( (Nil!9541) (Cons!9540 (h!10408 (_ BitVec 64)) (t!15772 List!9544)) )
))
(declare-fun arrayNoDuplicates!0 (array!32003 (_ BitVec 32) List!9544) Bool)

(assert (=> b!494516 (= res!297087 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9541))))

(declare-fun res!297095 () Bool)

(declare-fun e!290216 () Bool)

(assert (=> start!45058 (=> (not res!297095) (not e!290216))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45058 (= res!297095 (validMask!0 mask!3524))))

(assert (=> start!45058 e!290216))

(assert (=> start!45058 true))

(declare-fun array_inv!11182 (array!32003) Bool)

(assert (=> start!45058 (array_inv!11182 a!3235)))

(declare-fun b!494517 () Bool)

(assert (=> b!494517 (= e!290216 e!290217)))

(declare-fun res!297094 () Bool)

(assert (=> b!494517 (=> (not res!297094) (not e!290217))))

(declare-datatypes ((SeekEntryResult!3853 0))(
  ( (MissingZero!3853 (index!17591 (_ BitVec 32))) (Found!3853 (index!17592 (_ BitVec 32))) (Intermediate!3853 (undefined!4665 Bool) (index!17593 (_ BitVec 32)) (x!46659 (_ BitVec 32))) (Undefined!3853) (MissingVacant!3853 (index!17594 (_ BitVec 32))) )
))
(declare-fun lt!223817 () SeekEntryResult!3853)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494517 (= res!297094 (or (= lt!223817 (MissingZero!3853 i!1204)) (= lt!223817 (MissingVacant!3853 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32003 (_ BitVec 32)) SeekEntryResult!3853)

(assert (=> b!494517 (= lt!223817 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494518 () Bool)

(declare-fun e!290214 () Bool)

(assert (=> b!494518 (= e!290217 (not e!290214))))

(declare-fun res!297091 () Bool)

(assert (=> b!494518 (=> res!297091 e!290214)))

(declare-fun lt!223821 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223820 () SeekEntryResult!3853)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32003 (_ BitVec 32)) SeekEntryResult!3853)

(assert (=> b!494518 (= res!297091 (= lt!223820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223821 (select (store (arr!15386 a!3235) i!1204 k!2280) j!176) (array!32004 (store (arr!15386 a!3235) i!1204 k!2280) (size!15750 a!3235)) mask!3524)))))

(declare-fun lt!223822 () (_ BitVec 32))

(assert (=> b!494518 (= lt!223820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223822 (select (arr!15386 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494518 (= lt!223821 (toIndex!0 (select (store (arr!15386 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494518 (= lt!223822 (toIndex!0 (select (arr!15386 a!3235) j!176) mask!3524))))

(declare-fun lt!223818 () SeekEntryResult!3853)

(assert (=> b!494518 (= lt!223818 (Found!3853 j!176))))

(assert (=> b!494518 (= lt!223818 (seekEntryOrOpen!0 (select (arr!15386 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32003 (_ BitVec 32)) Bool)

(assert (=> b!494518 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14652 0))(
  ( (Unit!14653) )
))
(declare-fun lt!223819 () Unit!14652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32003 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14652)

(assert (=> b!494518 (= lt!223819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494519 () Bool)

(assert (=> b!494519 (= e!290214 true)))

(assert (=> b!494519 (= lt!223818 Undefined!3853)))

(declare-fun b!494520 () Bool)

(declare-fun res!297090 () Bool)

(assert (=> b!494520 (=> (not res!297090) (not e!290217))))

(assert (=> b!494520 (= res!297090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494521 () Bool)

(declare-fun res!297092 () Bool)

(assert (=> b!494521 (=> (not res!297092) (not e!290216))))

(declare-fun arrayContainsKey!0 (array!32003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494521 (= res!297092 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494522 () Bool)

(declare-fun res!297086 () Bool)

(assert (=> b!494522 (=> (not res!297086) (not e!290216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494522 (= res!297086 (validKeyInArray!0 (select (arr!15386 a!3235) j!176)))))

(declare-fun b!494523 () Bool)

(declare-fun res!297088 () Bool)

(assert (=> b!494523 (=> res!297088 e!290214)))

(assert (=> b!494523 (= res!297088 (or (not (is-Intermediate!3853 lt!223820)) (not (undefined!4665 lt!223820))))))

(declare-fun b!494524 () Bool)

(declare-fun res!297093 () Bool)

(assert (=> b!494524 (=> (not res!297093) (not e!290216))))

(assert (=> b!494524 (= res!297093 (validKeyInArray!0 k!2280))))

(declare-fun b!494525 () Bool)

(declare-fun res!297089 () Bool)

(assert (=> b!494525 (=> (not res!297089) (not e!290216))))

(assert (=> b!494525 (= res!297089 (and (= (size!15750 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15750 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15750 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45058 res!297095) b!494525))

(assert (= (and b!494525 res!297089) b!494522))

(assert (= (and b!494522 res!297086) b!494524))

(assert (= (and b!494524 res!297093) b!494521))

(assert (= (and b!494521 res!297092) b!494517))

(assert (= (and b!494517 res!297094) b!494520))

(assert (= (and b!494520 res!297090) b!494516))

(assert (= (and b!494516 res!297087) b!494518))

(assert (= (and b!494518 (not res!297091)) b!494523))

(assert (= (and b!494523 (not res!297088)) b!494519))

(declare-fun m!475575 () Bool)

(assert (=> b!494516 m!475575))

(declare-fun m!475577 () Bool)

(assert (=> b!494522 m!475577))

(assert (=> b!494522 m!475577))

(declare-fun m!475579 () Bool)

(assert (=> b!494522 m!475579))

(declare-fun m!475581 () Bool)

(assert (=> start!45058 m!475581))

(declare-fun m!475583 () Bool)

(assert (=> start!45058 m!475583))

(declare-fun m!475585 () Bool)

(assert (=> b!494521 m!475585))

(declare-fun m!475587 () Bool)

(assert (=> b!494520 m!475587))

(declare-fun m!475589 () Bool)

(assert (=> b!494524 m!475589))

(declare-fun m!475591 () Bool)

(assert (=> b!494518 m!475591))

(declare-fun m!475593 () Bool)

(assert (=> b!494518 m!475593))

(declare-fun m!475595 () Bool)

(assert (=> b!494518 m!475595))

(assert (=> b!494518 m!475595))

(declare-fun m!475597 () Bool)

(assert (=> b!494518 m!475597))

(assert (=> b!494518 m!475577))

(declare-fun m!475599 () Bool)

(assert (=> b!494518 m!475599))

(assert (=> b!494518 m!475577))

(declare-fun m!475601 () Bool)

(assert (=> b!494518 m!475601))

(assert (=> b!494518 m!475577))

(declare-fun m!475603 () Bool)

(assert (=> b!494518 m!475603))

(assert (=> b!494518 m!475577))

(declare-fun m!475605 () Bool)

(assert (=> b!494518 m!475605))

(assert (=> b!494518 m!475595))

(declare-fun m!475607 () Bool)

(assert (=> b!494518 m!475607))

(declare-fun m!475609 () Bool)

(assert (=> b!494517 m!475609))

(push 1)

