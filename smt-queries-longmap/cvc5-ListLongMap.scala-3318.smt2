; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45852 () Bool)

(assert start!45852)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!507841 () Bool)

(declare-datatypes ((array!32608 0))(
  ( (array!32609 (arr!15684 (Array (_ BitVec 32) (_ BitVec 64))) (size!16048 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32608)

(declare-fun e!297184 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4151 0))(
  ( (MissingZero!4151 (index!18792 (_ BitVec 32))) (Found!4151 (index!18793 (_ BitVec 32))) (Intermediate!4151 (undefined!4963 Bool) (index!18794 (_ BitVec 32)) (x!47784 (_ BitVec 32))) (Undefined!4151) (MissingVacant!4151 (index!18795 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32608 (_ BitVec 32)) SeekEntryResult!4151)

(assert (=> b!507841 (= e!297184 (= (seekEntryOrOpen!0 (select (arr!15684 a!3235) j!176) a!3235 mask!3524) (Found!4151 j!176)))))

(declare-fun b!507843 () Bool)

(declare-fun res!308800 () Bool)

(declare-fun e!297182 () Bool)

(assert (=> b!507843 (=> (not res!308800) (not e!297182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32608 (_ BitVec 32)) Bool)

(assert (=> b!507843 (= res!308800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507844 () Bool)

(declare-fun e!297186 () Bool)

(assert (=> b!507844 (= e!297182 (not e!297186))))

(declare-fun res!308806 () Bool)

(assert (=> b!507844 (=> res!308806 e!297186)))

(declare-fun lt!232060 () (_ BitVec 32))

(declare-fun lt!232052 () SeekEntryResult!4151)

(declare-fun lt!232056 () array!32608)

(declare-fun lt!232058 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32608 (_ BitVec 32)) SeekEntryResult!4151)

(assert (=> b!507844 (= res!308806 (= lt!232052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232060 lt!232058 lt!232056 mask!3524)))))

(declare-fun lt!232053 () (_ BitVec 32))

(assert (=> b!507844 (= lt!232052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232053 (select (arr!15684 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507844 (= lt!232060 (toIndex!0 lt!232058 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507844 (= lt!232058 (select (store (arr!15684 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507844 (= lt!232053 (toIndex!0 (select (arr!15684 a!3235) j!176) mask!3524))))

(assert (=> b!507844 (= lt!232056 (array!32609 (store (arr!15684 a!3235) i!1204 k!2280) (size!16048 a!3235)))))

(assert (=> b!507844 e!297184))

(declare-fun res!308804 () Bool)

(assert (=> b!507844 (=> (not res!308804) (not e!297184))))

(assert (=> b!507844 (= res!308804 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15590 0))(
  ( (Unit!15591) )
))
(declare-fun lt!232057 () Unit!15590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32608 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15590)

(assert (=> b!507844 (= lt!232057 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507845 () Bool)

(declare-fun res!308810 () Bool)

(declare-fun e!297181 () Bool)

(assert (=> b!507845 (=> (not res!308810) (not e!297181))))

(declare-fun arrayContainsKey!0 (array!32608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507845 (= res!308810 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507846 () Bool)

(declare-fun e!297183 () Bool)

(assert (=> b!507846 (= e!297183 true)))

(declare-fun lt!232055 () SeekEntryResult!4151)

(assert (=> b!507846 (= lt!232055 (seekEntryOrOpen!0 lt!232058 lt!232056 mask!3524))))

(assert (=> b!507846 false))

(declare-fun b!507847 () Bool)

(declare-fun res!308805 () Bool)

(assert (=> b!507847 (=> (not res!308805) (not e!297182))))

(declare-datatypes ((List!9842 0))(
  ( (Nil!9839) (Cons!9838 (h!10715 (_ BitVec 64)) (t!16070 List!9842)) )
))
(declare-fun arrayNoDuplicates!0 (array!32608 (_ BitVec 32) List!9842) Bool)

(assert (=> b!507847 (= res!308805 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9839))))

(declare-fun b!507848 () Bool)

(assert (=> b!507848 (= e!297186 e!297183)))

(declare-fun res!308807 () Bool)

(assert (=> b!507848 (=> res!308807 e!297183)))

(declare-fun lt!232054 () Bool)

(assert (=> b!507848 (= res!308807 (or (and (not lt!232054) (undefined!4963 lt!232052)) (and (not lt!232054) (not (undefined!4963 lt!232052)))))))

(assert (=> b!507848 (= lt!232054 (not (is-Intermediate!4151 lt!232052)))))

(declare-fun b!507849 () Bool)

(declare-fun res!308808 () Bool)

(assert (=> b!507849 (=> (not res!308808) (not e!297181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507849 (= res!308808 (validKeyInArray!0 k!2280))))

(declare-fun b!507850 () Bool)

(assert (=> b!507850 (= e!297181 e!297182)))

(declare-fun res!308802 () Bool)

(assert (=> b!507850 (=> (not res!308802) (not e!297182))))

(declare-fun lt!232059 () SeekEntryResult!4151)

(assert (=> b!507850 (= res!308802 (or (= lt!232059 (MissingZero!4151 i!1204)) (= lt!232059 (MissingVacant!4151 i!1204))))))

(assert (=> b!507850 (= lt!232059 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507851 () Bool)

(declare-fun res!308809 () Bool)

(assert (=> b!507851 (=> (not res!308809) (not e!297181))))

(assert (=> b!507851 (= res!308809 (and (= (size!16048 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16048 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16048 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!308801 () Bool)

(assert (=> start!45852 (=> (not res!308801) (not e!297181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45852 (= res!308801 (validMask!0 mask!3524))))

(assert (=> start!45852 e!297181))

(assert (=> start!45852 true))

(declare-fun array_inv!11480 (array!32608) Bool)

(assert (=> start!45852 (array_inv!11480 a!3235)))

(declare-fun b!507842 () Bool)

(declare-fun res!308803 () Bool)

(assert (=> b!507842 (=> (not res!308803) (not e!297181))))

(assert (=> b!507842 (= res!308803 (validKeyInArray!0 (select (arr!15684 a!3235) j!176)))))

(assert (= (and start!45852 res!308801) b!507851))

(assert (= (and b!507851 res!308809) b!507842))

(assert (= (and b!507842 res!308803) b!507849))

(assert (= (and b!507849 res!308808) b!507845))

(assert (= (and b!507845 res!308810) b!507850))

(assert (= (and b!507850 res!308802) b!507843))

(assert (= (and b!507843 res!308800) b!507847))

(assert (= (and b!507847 res!308805) b!507844))

(assert (= (and b!507844 res!308804) b!507841))

(assert (= (and b!507844 (not res!308806)) b!507848))

(assert (= (and b!507848 (not res!308807)) b!507846))

(declare-fun m!488673 () Bool)

(assert (=> b!507842 m!488673))

(assert (=> b!507842 m!488673))

(declare-fun m!488675 () Bool)

(assert (=> b!507842 m!488675))

(assert (=> b!507841 m!488673))

(assert (=> b!507841 m!488673))

(declare-fun m!488677 () Bool)

(assert (=> b!507841 m!488677))

(declare-fun m!488679 () Bool)

(assert (=> b!507847 m!488679))

(declare-fun m!488681 () Bool)

(assert (=> b!507844 m!488681))

(declare-fun m!488683 () Bool)

(assert (=> b!507844 m!488683))

(declare-fun m!488685 () Bool)

(assert (=> b!507844 m!488685))

(declare-fun m!488687 () Bool)

(assert (=> b!507844 m!488687))

(assert (=> b!507844 m!488673))

(declare-fun m!488689 () Bool)

(assert (=> b!507844 m!488689))

(assert (=> b!507844 m!488673))

(declare-fun m!488691 () Bool)

(assert (=> b!507844 m!488691))

(declare-fun m!488693 () Bool)

(assert (=> b!507844 m!488693))

(assert (=> b!507844 m!488673))

(declare-fun m!488695 () Bool)

(assert (=> b!507844 m!488695))

(declare-fun m!488697 () Bool)

(assert (=> b!507850 m!488697))

(declare-fun m!488699 () Bool)

(assert (=> b!507845 m!488699))

(declare-fun m!488701 () Bool)

(assert (=> start!45852 m!488701))

(declare-fun m!488703 () Bool)

(assert (=> start!45852 m!488703))

(declare-fun m!488705 () Bool)

(assert (=> b!507843 m!488705))

(declare-fun m!488707 () Bool)

(assert (=> b!507846 m!488707))

(declare-fun m!488709 () Bool)

(assert (=> b!507849 m!488709))

(push 1)

