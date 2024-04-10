; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45804 () Bool)

(assert start!45804)

(declare-fun b!507049 () Bool)

(declare-fun e!296754 () Bool)

(declare-fun e!296753 () Bool)

(assert (=> b!507049 (= e!296754 e!296753)))

(declare-fun res!308014 () Bool)

(assert (=> b!507049 (=> (not res!308014) (not e!296753))))

(declare-datatypes ((SeekEntryResult!4127 0))(
  ( (MissingZero!4127 (index!18696 (_ BitVec 32))) (Found!4127 (index!18697 (_ BitVec 32))) (Intermediate!4127 (undefined!4939 Bool) (index!18698 (_ BitVec 32)) (x!47696 (_ BitVec 32))) (Undefined!4127) (MissingVacant!4127 (index!18699 (_ BitVec 32))) )
))
(declare-fun lt!231427 () SeekEntryResult!4127)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507049 (= res!308014 (or (= lt!231427 (MissingZero!4127 i!1204)) (= lt!231427 (MissingVacant!4127 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32560 0))(
  ( (array!32561 (arr!15660 (Array (_ BitVec 32) (_ BitVec 64))) (size!16024 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32560)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32560 (_ BitVec 32)) SeekEntryResult!4127)

(assert (=> b!507049 (= lt!231427 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507050 () Bool)

(declare-fun e!296750 () Bool)

(assert (=> b!507050 (= e!296750 true)))

(assert (=> b!507050 false))

(declare-fun b!507051 () Bool)

(declare-fun e!296749 () Bool)

(assert (=> b!507051 (= e!296753 (not e!296749))))

(declare-fun res!308017 () Bool)

(assert (=> b!507051 (=> res!308017 e!296749)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!231425 () SeekEntryResult!4127)

(declare-fun lt!231426 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32560 (_ BitVec 32)) SeekEntryResult!4127)

(assert (=> b!507051 (= res!308017 (= lt!231425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231426 (select (store (arr!15660 a!3235) i!1204 k!2280) j!176) (array!32561 (store (arr!15660 a!3235) i!1204 k!2280) (size!16024 a!3235)) mask!3524)))))

(declare-fun lt!231428 () (_ BitVec 32))

(assert (=> b!507051 (= lt!231425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231428 (select (arr!15660 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507051 (= lt!231426 (toIndex!0 (select (store (arr!15660 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!507051 (= lt!231428 (toIndex!0 (select (arr!15660 a!3235) j!176) mask!3524))))

(declare-fun e!296751 () Bool)

(assert (=> b!507051 e!296751))

(declare-fun res!308011 () Bool)

(assert (=> b!507051 (=> (not res!308011) (not e!296751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32560 (_ BitVec 32)) Bool)

(assert (=> b!507051 (= res!308011 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15542 0))(
  ( (Unit!15543) )
))
(declare-fun lt!231429 () Unit!15542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15542)

(assert (=> b!507051 (= lt!231429 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!308013 () Bool)

(assert (=> start!45804 (=> (not res!308013) (not e!296754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45804 (= res!308013 (validMask!0 mask!3524))))

(assert (=> start!45804 e!296754))

(assert (=> start!45804 true))

(declare-fun array_inv!11456 (array!32560) Bool)

(assert (=> start!45804 (array_inv!11456 a!3235)))

(declare-fun b!507052 () Bool)

(declare-fun res!308010 () Bool)

(assert (=> b!507052 (=> (not res!308010) (not e!296754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507052 (= res!308010 (validKeyInArray!0 (select (arr!15660 a!3235) j!176)))))

(declare-fun b!507053 () Bool)

(declare-fun res!308015 () Bool)

(assert (=> b!507053 (=> (not res!308015) (not e!296754))))

(declare-fun arrayContainsKey!0 (array!32560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507053 (= res!308015 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507054 () Bool)

(assert (=> b!507054 (= e!296749 e!296750)))

(declare-fun res!308008 () Bool)

(assert (=> b!507054 (=> res!308008 e!296750)))

(declare-fun lt!231430 () Bool)

(assert (=> b!507054 (= res!308008 (or (and (not lt!231430) (undefined!4939 lt!231425)) (and (not lt!231430) (not (undefined!4939 lt!231425)))))))

(assert (=> b!507054 (= lt!231430 (not (is-Intermediate!4127 lt!231425)))))

(declare-fun b!507055 () Bool)

(declare-fun res!308012 () Bool)

(assert (=> b!507055 (=> (not res!308012) (not e!296754))))

(assert (=> b!507055 (= res!308012 (and (= (size!16024 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16024 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16024 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507056 () Bool)

(assert (=> b!507056 (= e!296751 (= (seekEntryOrOpen!0 (select (arr!15660 a!3235) j!176) a!3235 mask!3524) (Found!4127 j!176)))))

(declare-fun b!507057 () Bool)

(declare-fun res!308009 () Bool)

(assert (=> b!507057 (=> (not res!308009) (not e!296753))))

(declare-datatypes ((List!9818 0))(
  ( (Nil!9815) (Cons!9814 (h!10691 (_ BitVec 64)) (t!16046 List!9818)) )
))
(declare-fun arrayNoDuplicates!0 (array!32560 (_ BitVec 32) List!9818) Bool)

(assert (=> b!507057 (= res!308009 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9815))))

(declare-fun b!507058 () Bool)

(declare-fun res!308016 () Bool)

(assert (=> b!507058 (=> (not res!308016) (not e!296754))))

(assert (=> b!507058 (= res!308016 (validKeyInArray!0 k!2280))))

(declare-fun b!507059 () Bool)

(declare-fun res!308018 () Bool)

(assert (=> b!507059 (=> (not res!308018) (not e!296753))))

(assert (=> b!507059 (= res!308018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45804 res!308013) b!507055))

(assert (= (and b!507055 res!308012) b!507052))

(assert (= (and b!507052 res!308010) b!507058))

(assert (= (and b!507058 res!308016) b!507053))

(assert (= (and b!507053 res!308015) b!507049))

(assert (= (and b!507049 res!308014) b!507059))

(assert (= (and b!507059 res!308018) b!507057))

(assert (= (and b!507057 res!308009) b!507051))

(assert (= (and b!507051 res!308011) b!507056))

(assert (= (and b!507051 (not res!308017)) b!507054))

(assert (= (and b!507054 (not res!308008)) b!507050))

(declare-fun m!487767 () Bool)

(assert (=> b!507057 m!487767))

(declare-fun m!487769 () Bool)

(assert (=> b!507049 m!487769))

(declare-fun m!487771 () Bool)

(assert (=> b!507056 m!487771))

(assert (=> b!507056 m!487771))

(declare-fun m!487773 () Bool)

(assert (=> b!507056 m!487773))

(declare-fun m!487775 () Bool)

(assert (=> b!507053 m!487775))

(declare-fun m!487777 () Bool)

(assert (=> b!507051 m!487777))

(declare-fun m!487779 () Bool)

(assert (=> b!507051 m!487779))

(declare-fun m!487781 () Bool)

(assert (=> b!507051 m!487781))

(assert (=> b!507051 m!487771))

(declare-fun m!487783 () Bool)

(assert (=> b!507051 m!487783))

(assert (=> b!507051 m!487771))

(declare-fun m!487785 () Bool)

(assert (=> b!507051 m!487785))

(assert (=> b!507051 m!487771))

(declare-fun m!487787 () Bool)

(assert (=> b!507051 m!487787))

(assert (=> b!507051 m!487781))

(declare-fun m!487789 () Bool)

(assert (=> b!507051 m!487789))

(assert (=> b!507051 m!487781))

(declare-fun m!487791 () Bool)

(assert (=> b!507051 m!487791))

(declare-fun m!487793 () Bool)

(assert (=> start!45804 m!487793))

(declare-fun m!487795 () Bool)

(assert (=> start!45804 m!487795))

(declare-fun m!487797 () Bool)

(assert (=> b!507058 m!487797))

(assert (=> b!507052 m!487771))

(assert (=> b!507052 m!487771))

(declare-fun m!487799 () Bool)

(assert (=> b!507052 m!487799))

(declare-fun m!487801 () Bool)

(assert (=> b!507059 m!487801))

(push 1)

