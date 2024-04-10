; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45832 () Bool)

(assert start!45832)

(declare-fun b!507511 () Bool)

(declare-fun res!308474 () Bool)

(declare-fun e!297006 () Bool)

(assert (=> b!507511 (=> (not res!308474) (not e!297006))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32588 0))(
  ( (array!32589 (arr!15674 (Array (_ BitVec 32) (_ BitVec 64))) (size!16038 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32588)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507511 (= res!308474 (and (= (size!16038 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16038 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16038 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507512 () Bool)

(declare-fun res!308480 () Bool)

(declare-fun e!297001 () Bool)

(assert (=> b!507512 (=> (not res!308480) (not e!297001))))

(declare-datatypes ((List!9832 0))(
  ( (Nil!9829) (Cons!9828 (h!10705 (_ BitVec 64)) (t!16060 List!9832)) )
))
(declare-fun arrayNoDuplicates!0 (array!32588 (_ BitVec 32) List!9832) Bool)

(assert (=> b!507512 (= res!308480 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9829))))

(declare-fun b!507513 () Bool)

(declare-fun e!297002 () Bool)

(assert (=> b!507513 (= e!297002 true)))

(declare-fun lt!231786 () array!32588)

(declare-datatypes ((SeekEntryResult!4141 0))(
  ( (MissingZero!4141 (index!18752 (_ BitVec 32))) (Found!4141 (index!18753 (_ BitVec 32))) (Intermediate!4141 (undefined!4953 Bool) (index!18754 (_ BitVec 32)) (x!47742 (_ BitVec 32))) (Undefined!4141) (MissingVacant!4141 (index!18755 (_ BitVec 32))) )
))
(declare-fun lt!231790 () SeekEntryResult!4141)

(declare-fun lt!231789 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32588 (_ BitVec 32)) SeekEntryResult!4141)

(assert (=> b!507513 (= lt!231790 (seekEntryOrOpen!0 lt!231789 lt!231786 mask!3524))))

(assert (=> b!507513 false))

(declare-fun b!507514 () Bool)

(declare-fun e!297004 () Bool)

(assert (=> b!507514 (= e!297001 (not e!297004))))

(declare-fun res!308475 () Bool)

(assert (=> b!507514 (=> res!308475 e!297004)))

(declare-fun lt!231785 () SeekEntryResult!4141)

(declare-fun lt!231783 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32588 (_ BitVec 32)) SeekEntryResult!4141)

(assert (=> b!507514 (= res!308475 (= lt!231785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231783 lt!231789 lt!231786 mask!3524)))))

(declare-fun lt!231788 () (_ BitVec 32))

(assert (=> b!507514 (= lt!231785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231788 (select (arr!15674 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507514 (= lt!231783 (toIndex!0 lt!231789 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!507514 (= lt!231789 (select (store (arr!15674 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507514 (= lt!231788 (toIndex!0 (select (arr!15674 a!3235) j!176) mask!3524))))

(assert (=> b!507514 (= lt!231786 (array!32589 (store (arr!15674 a!3235) i!1204 k!2280) (size!16038 a!3235)))))

(declare-fun e!297003 () Bool)

(assert (=> b!507514 e!297003))

(declare-fun res!308472 () Bool)

(assert (=> b!507514 (=> (not res!308472) (not e!297003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32588 (_ BitVec 32)) Bool)

(assert (=> b!507514 (= res!308472 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15570 0))(
  ( (Unit!15571) )
))
(declare-fun lt!231787 () Unit!15570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15570)

(assert (=> b!507514 (= lt!231787 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507516 () Bool)

(declare-fun res!308473 () Bool)

(assert (=> b!507516 (=> (not res!308473) (not e!297006))))

(declare-fun arrayContainsKey!0 (array!32588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507516 (= res!308473 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507517 () Bool)

(declare-fun res!308471 () Bool)

(assert (=> b!507517 (=> (not res!308471) (not e!297006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507517 (= res!308471 (validKeyInArray!0 k!2280))))

(declare-fun b!507518 () Bool)

(assert (=> b!507518 (= e!297003 (= (seekEntryOrOpen!0 (select (arr!15674 a!3235) j!176) a!3235 mask!3524) (Found!4141 j!176)))))

(declare-fun b!507519 () Bool)

(declare-fun res!308479 () Bool)

(assert (=> b!507519 (=> (not res!308479) (not e!297006))))

(assert (=> b!507519 (= res!308479 (validKeyInArray!0 (select (arr!15674 a!3235) j!176)))))

(declare-fun res!308470 () Bool)

(assert (=> start!45832 (=> (not res!308470) (not e!297006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45832 (= res!308470 (validMask!0 mask!3524))))

(assert (=> start!45832 e!297006))

(assert (=> start!45832 true))

(declare-fun array_inv!11470 (array!32588) Bool)

(assert (=> start!45832 (array_inv!11470 a!3235)))

(declare-fun b!507515 () Bool)

(assert (=> b!507515 (= e!297004 e!297002)))

(declare-fun res!308478 () Bool)

(assert (=> b!507515 (=> res!308478 e!297002)))

(declare-fun lt!231784 () Bool)

(assert (=> b!507515 (= res!308478 (or (and (not lt!231784) (undefined!4953 lt!231785)) (and (not lt!231784) (not (undefined!4953 lt!231785)))))))

(assert (=> b!507515 (= lt!231784 (not (is-Intermediate!4141 lt!231785)))))

(declare-fun b!507520 () Bool)

(assert (=> b!507520 (= e!297006 e!297001)))

(declare-fun res!308477 () Bool)

(assert (=> b!507520 (=> (not res!308477) (not e!297001))))

(declare-fun lt!231782 () SeekEntryResult!4141)

(assert (=> b!507520 (= res!308477 (or (= lt!231782 (MissingZero!4141 i!1204)) (= lt!231782 (MissingVacant!4141 i!1204))))))

(assert (=> b!507520 (= lt!231782 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507521 () Bool)

(declare-fun res!308476 () Bool)

(assert (=> b!507521 (=> (not res!308476) (not e!297001))))

(assert (=> b!507521 (= res!308476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45832 res!308470) b!507511))

(assert (= (and b!507511 res!308474) b!507519))

(assert (= (and b!507519 res!308479) b!507517))

(assert (= (and b!507517 res!308471) b!507516))

(assert (= (and b!507516 res!308473) b!507520))

(assert (= (and b!507520 res!308477) b!507521))

(assert (= (and b!507521 res!308476) b!507512))

(assert (= (and b!507512 res!308480) b!507514))

(assert (= (and b!507514 res!308472) b!507518))

(assert (= (and b!507514 (not res!308475)) b!507515))

(assert (= (and b!507515 (not res!308478)) b!507513))

(declare-fun m!488293 () Bool)

(assert (=> b!507519 m!488293))

(assert (=> b!507519 m!488293))

(declare-fun m!488295 () Bool)

(assert (=> b!507519 m!488295))

(declare-fun m!488297 () Bool)

(assert (=> b!507514 m!488297))

(declare-fun m!488299 () Bool)

(assert (=> b!507514 m!488299))

(declare-fun m!488301 () Bool)

(assert (=> b!507514 m!488301))

(assert (=> b!507514 m!488293))

(declare-fun m!488303 () Bool)

(assert (=> b!507514 m!488303))

(assert (=> b!507514 m!488293))

(declare-fun m!488305 () Bool)

(assert (=> b!507514 m!488305))

(assert (=> b!507514 m!488293))

(declare-fun m!488307 () Bool)

(assert (=> b!507514 m!488307))

(declare-fun m!488309 () Bool)

(assert (=> b!507514 m!488309))

(declare-fun m!488311 () Bool)

(assert (=> b!507514 m!488311))

(declare-fun m!488313 () Bool)

(assert (=> b!507520 m!488313))

(declare-fun m!488315 () Bool)

(assert (=> b!507521 m!488315))

(assert (=> b!507518 m!488293))

(assert (=> b!507518 m!488293))

(declare-fun m!488317 () Bool)

(assert (=> b!507518 m!488317))

(declare-fun m!488319 () Bool)

(assert (=> start!45832 m!488319))

(declare-fun m!488321 () Bool)

(assert (=> start!45832 m!488321))

(declare-fun m!488323 () Bool)

(assert (=> b!507516 m!488323))

(declare-fun m!488325 () Bool)

(assert (=> b!507517 m!488325))

(declare-fun m!488327 () Bool)

(assert (=> b!507513 m!488327))

(declare-fun m!488329 () Bool)

(assert (=> b!507512 m!488329))

(push 1)

