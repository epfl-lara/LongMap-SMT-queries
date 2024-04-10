; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44790 () Bool)

(assert start!44790)

(declare-fun res!294722 () Bool)

(declare-fun e!288914 () Bool)

(assert (=> start!44790 (=> (not res!294722) (not e!288914))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44790 (= res!294722 (validMask!0 mask!3524))))

(assert (=> start!44790 e!288914))

(assert (=> start!44790 true))

(declare-datatypes ((array!31849 0))(
  ( (array!31850 (arr!15312 (Array (_ BitVec 32) (_ BitVec 64))) (size!15676 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31849)

(declare-fun array_inv!11108 (array!31849) Bool)

(assert (=> start!44790 (array_inv!11108 a!3235)))

(declare-fun b!491777 () Bool)

(declare-fun res!294715 () Bool)

(assert (=> b!491777 (=> (not res!294715) (not e!288914))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491777 (= res!294715 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491778 () Bool)

(declare-fun res!294721 () Bool)

(assert (=> b!491778 (=> (not res!294721) (not e!288914))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491778 (= res!294721 (validKeyInArray!0 (select (arr!15312 a!3235) j!176)))))

(declare-fun b!491779 () Bool)

(declare-fun e!288913 () Bool)

(assert (=> b!491779 (= e!288913 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!491780 () Bool)

(declare-fun e!288911 () Bool)

(assert (=> b!491780 (= e!288914 e!288911)))

(declare-fun res!294713 () Bool)

(assert (=> b!491780 (=> (not res!294713) (not e!288911))))

(declare-datatypes ((SeekEntryResult!3779 0))(
  ( (MissingZero!3779 (index!17295 (_ BitVec 32))) (Found!3779 (index!17296 (_ BitVec 32))) (Intermediate!3779 (undefined!4591 Bool) (index!17297 (_ BitVec 32)) (x!46381 (_ BitVec 32))) (Undefined!3779) (MissingVacant!3779 (index!17298 (_ BitVec 32))) )
))
(declare-fun lt!222363 () SeekEntryResult!3779)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491780 (= res!294713 (or (= lt!222363 (MissingZero!3779 i!1204)) (= lt!222363 (MissingVacant!3779 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31849 (_ BitVec 32)) SeekEntryResult!3779)

(assert (=> b!491780 (= lt!222363 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491781 () Bool)

(declare-fun e!288915 () Bool)

(assert (=> b!491781 (= e!288915 (= (seekEntryOrOpen!0 (select (arr!15312 a!3235) j!176) a!3235 mask!3524) (Found!3779 j!176)))))

(declare-fun b!491782 () Bool)

(declare-fun res!294718 () Bool)

(assert (=> b!491782 (=> (not res!294718) (not e!288911))))

(declare-datatypes ((List!9470 0))(
  ( (Nil!9467) (Cons!9466 (h!10328 (_ BitVec 64)) (t!15698 List!9470)) )
))
(declare-fun arrayNoDuplicates!0 (array!31849 (_ BitVec 32) List!9470) Bool)

(assert (=> b!491782 (= res!294718 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9467))))

(declare-fun b!491783 () Bool)

(declare-fun res!294716 () Bool)

(assert (=> b!491783 (=> (not res!294716) (not e!288914))))

(assert (=> b!491783 (= res!294716 (and (= (size!15676 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15676 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15676 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491784 () Bool)

(declare-fun res!294714 () Bool)

(assert (=> b!491784 (=> (not res!294714) (not e!288914))))

(assert (=> b!491784 (= res!294714 (validKeyInArray!0 k!2280))))

(declare-fun b!491785 () Bool)

(declare-fun res!294720 () Bool)

(assert (=> b!491785 (=> (not res!294720) (not e!288911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31849 (_ BitVec 32)) Bool)

(assert (=> b!491785 (= res!294720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491786 () Bool)

(assert (=> b!491786 (= e!288911 (not e!288913))))

(declare-fun res!294717 () Bool)

(assert (=> b!491786 (=> res!294717 e!288913)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31849 (_ BitVec 32)) SeekEntryResult!3779)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491786 (= res!294717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15312 a!3235) j!176) mask!3524) (select (arr!15312 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15312 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15312 a!3235) i!1204 k!2280) j!176) (array!31850 (store (arr!15312 a!3235) i!1204 k!2280) (size!15676 a!3235)) mask!3524)))))

(assert (=> b!491786 e!288915))

(declare-fun res!294719 () Bool)

(assert (=> b!491786 (=> (not res!294719) (not e!288915))))

(assert (=> b!491786 (= res!294719 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14504 0))(
  ( (Unit!14505) )
))
(declare-fun lt!222364 () Unit!14504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14504)

(assert (=> b!491786 (= lt!222364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44790 res!294722) b!491783))

(assert (= (and b!491783 res!294716) b!491778))

(assert (= (and b!491778 res!294721) b!491784))

(assert (= (and b!491784 res!294714) b!491777))

(assert (= (and b!491777 res!294715) b!491780))

(assert (= (and b!491780 res!294713) b!491785))

(assert (= (and b!491785 res!294720) b!491782))

(assert (= (and b!491782 res!294718) b!491786))

(assert (= (and b!491786 res!294719) b!491781))

(assert (= (and b!491786 (not res!294717)) b!491779))

(declare-fun m!472509 () Bool)

(assert (=> b!491777 m!472509))

(declare-fun m!472511 () Bool)

(assert (=> start!44790 m!472511))

(declare-fun m!472513 () Bool)

(assert (=> start!44790 m!472513))

(declare-fun m!472515 () Bool)

(assert (=> b!491785 m!472515))

(declare-fun m!472517 () Bool)

(assert (=> b!491781 m!472517))

(assert (=> b!491781 m!472517))

(declare-fun m!472519 () Bool)

(assert (=> b!491781 m!472519))

(assert (=> b!491778 m!472517))

(assert (=> b!491778 m!472517))

(declare-fun m!472521 () Bool)

(assert (=> b!491778 m!472521))

(declare-fun m!472523 () Bool)

(assert (=> b!491782 m!472523))

(declare-fun m!472525 () Bool)

(assert (=> b!491786 m!472525))

(declare-fun m!472527 () Bool)

(assert (=> b!491786 m!472527))

(declare-fun m!472529 () Bool)

(assert (=> b!491786 m!472529))

(declare-fun m!472531 () Bool)

(assert (=> b!491786 m!472531))

(assert (=> b!491786 m!472517))

(declare-fun m!472533 () Bool)

(assert (=> b!491786 m!472533))

(assert (=> b!491786 m!472517))

(assert (=> b!491786 m!472531))

(declare-fun m!472535 () Bool)

(assert (=> b!491786 m!472535))

(assert (=> b!491786 m!472529))

(declare-fun m!472537 () Bool)

(assert (=> b!491786 m!472537))

(assert (=> b!491786 m!472517))

(declare-fun m!472539 () Bool)

(assert (=> b!491786 m!472539))

(assert (=> b!491786 m!472529))

(assert (=> b!491786 m!472535))

(declare-fun m!472541 () Bool)

(assert (=> b!491784 m!472541))

(declare-fun m!472543 () Bool)

(assert (=> b!491780 m!472543))

(push 1)

