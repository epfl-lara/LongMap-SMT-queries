; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45840 () Bool)

(assert start!45840)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!507570 () Bool)

(declare-datatypes ((array!32606 0))(
  ( (array!32607 (arr!15683 (Array (_ BitVec 32) (_ BitVec 64))) (size!16048 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32606)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!297010 () Bool)

(declare-datatypes ((SeekEntryResult!4147 0))(
  ( (MissingZero!4147 (index!18776 (_ BitVec 32))) (Found!4147 (index!18777 (_ BitVec 32))) (Intermediate!4147 (undefined!4959 Bool) (index!18778 (_ BitVec 32)) (x!47775 (_ BitVec 32))) (Undefined!4147) (MissingVacant!4147 (index!18779 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32606 (_ BitVec 32)) SeekEntryResult!4147)

(assert (=> b!507570 (= e!297010 (= (seekEntryOrOpen!0 (select (arr!15683 a!3235) j!176) a!3235 mask!3524) (Found!4147 j!176)))))

(declare-fun b!507571 () Bool)

(declare-fun res!308679 () Bool)

(declare-fun e!297012 () Bool)

(assert (=> b!507571 (=> (not res!308679) (not e!297012))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507571 (= res!308679 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507572 () Bool)

(declare-fun res!308676 () Bool)

(declare-fun e!297011 () Bool)

(assert (=> b!507572 (=> (not res!308676) (not e!297011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32606 (_ BitVec 32)) Bool)

(assert (=> b!507572 (= res!308676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507573 () Bool)

(assert (=> b!507573 (= e!297012 e!297011)))

(declare-fun res!308680 () Bool)

(assert (=> b!507573 (=> (not res!308680) (not e!297011))))

(declare-fun lt!231826 () SeekEntryResult!4147)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507573 (= res!308680 (or (= lt!231826 (MissingZero!4147 i!1204)) (= lt!231826 (MissingVacant!4147 i!1204))))))

(assert (=> b!507573 (= lt!231826 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!308677 () Bool)

(assert (=> start!45840 (=> (not res!308677) (not e!297012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45840 (= res!308677 (validMask!0 mask!3524))))

(assert (=> start!45840 e!297012))

(assert (=> start!45840 true))

(declare-fun array_inv!11566 (array!32606) Bool)

(assert (=> start!45840 (array_inv!11566 a!3235)))

(declare-fun b!507574 () Bool)

(declare-fun res!308672 () Bool)

(assert (=> b!507574 (=> (not res!308672) (not e!297012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507574 (= res!308672 (validKeyInArray!0 (select (arr!15683 a!3235) j!176)))))

(declare-fun b!507575 () Bool)

(declare-fun e!297009 () Bool)

(assert (=> b!507575 (= e!297009 true)))

(declare-fun lt!231822 () SeekEntryResult!4147)

(declare-fun lt!231820 () array!32606)

(declare-fun lt!231818 () (_ BitVec 64))

(assert (=> b!507575 (= lt!231822 (seekEntryOrOpen!0 lt!231818 lt!231820 mask!3524))))

(assert (=> b!507575 false))

(declare-fun b!507576 () Bool)

(declare-fun res!308673 () Bool)

(assert (=> b!507576 (=> (not res!308673) (not e!297012))))

(assert (=> b!507576 (= res!308673 (validKeyInArray!0 k0!2280))))

(declare-fun b!507577 () Bool)

(declare-fun res!308674 () Bool)

(assert (=> b!507577 (=> (not res!308674) (not e!297012))))

(assert (=> b!507577 (= res!308674 (and (= (size!16048 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16048 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16048 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507578 () Bool)

(declare-fun e!297007 () Bool)

(assert (=> b!507578 (= e!297011 (not e!297007))))

(declare-fun res!308671 () Bool)

(assert (=> b!507578 (=> res!308671 e!297007)))

(declare-fun lt!231821 () (_ BitVec 32))

(declare-fun lt!231819 () SeekEntryResult!4147)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32606 (_ BitVec 32)) SeekEntryResult!4147)

(assert (=> b!507578 (= res!308671 (= lt!231819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231821 lt!231818 lt!231820 mask!3524)))))

(declare-fun lt!231823 () (_ BitVec 32))

(assert (=> b!507578 (= lt!231819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231823 (select (arr!15683 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507578 (= lt!231821 (toIndex!0 lt!231818 mask!3524))))

(assert (=> b!507578 (= lt!231818 (select (store (arr!15683 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507578 (= lt!231823 (toIndex!0 (select (arr!15683 a!3235) j!176) mask!3524))))

(assert (=> b!507578 (= lt!231820 (array!32607 (store (arr!15683 a!3235) i!1204 k0!2280) (size!16048 a!3235)))))

(assert (=> b!507578 e!297010))

(declare-fun res!308675 () Bool)

(assert (=> b!507578 (=> (not res!308675) (not e!297010))))

(assert (=> b!507578 (= res!308675 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15568 0))(
  ( (Unit!15569) )
))
(declare-fun lt!231824 () Unit!15568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15568)

(assert (=> b!507578 (= lt!231824 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507579 () Bool)

(declare-fun res!308678 () Bool)

(assert (=> b!507579 (=> (not res!308678) (not e!297011))))

(declare-datatypes ((List!9880 0))(
  ( (Nil!9877) (Cons!9876 (h!10753 (_ BitVec 64)) (t!16099 List!9880)) )
))
(declare-fun arrayNoDuplicates!0 (array!32606 (_ BitVec 32) List!9880) Bool)

(assert (=> b!507579 (= res!308678 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9877))))

(declare-fun b!507580 () Bool)

(assert (=> b!507580 (= e!297007 e!297009)))

(declare-fun res!308681 () Bool)

(assert (=> b!507580 (=> res!308681 e!297009)))

(declare-fun lt!231825 () Bool)

(assert (=> b!507580 (= res!308681 (or (and (not lt!231825) (undefined!4959 lt!231819)) (and (not lt!231825) (not (undefined!4959 lt!231819)))))))

(get-info :version)

(assert (=> b!507580 (= lt!231825 (not ((_ is Intermediate!4147) lt!231819)))))

(assert (= (and start!45840 res!308677) b!507577))

(assert (= (and b!507577 res!308674) b!507574))

(assert (= (and b!507574 res!308672) b!507576))

(assert (= (and b!507576 res!308673) b!507571))

(assert (= (and b!507571 res!308679) b!507573))

(assert (= (and b!507573 res!308680) b!507572))

(assert (= (and b!507572 res!308676) b!507579))

(assert (= (and b!507579 res!308678) b!507578))

(assert (= (and b!507578 res!308675) b!507570))

(assert (= (and b!507578 (not res!308671)) b!507580))

(assert (= (and b!507580 (not res!308681)) b!507575))

(declare-fun m!487921 () Bool)

(assert (=> b!507575 m!487921))

(declare-fun m!487923 () Bool)

(assert (=> b!507571 m!487923))

(declare-fun m!487925 () Bool)

(assert (=> b!507579 m!487925))

(declare-fun m!487927 () Bool)

(assert (=> b!507572 m!487927))

(declare-fun m!487929 () Bool)

(assert (=> b!507578 m!487929))

(declare-fun m!487931 () Bool)

(assert (=> b!507578 m!487931))

(declare-fun m!487933 () Bool)

(assert (=> b!507578 m!487933))

(declare-fun m!487935 () Bool)

(assert (=> b!507578 m!487935))

(declare-fun m!487937 () Bool)

(assert (=> b!507578 m!487937))

(assert (=> b!507578 m!487935))

(declare-fun m!487939 () Bool)

(assert (=> b!507578 m!487939))

(assert (=> b!507578 m!487935))

(declare-fun m!487941 () Bool)

(assert (=> b!507578 m!487941))

(declare-fun m!487943 () Bool)

(assert (=> b!507578 m!487943))

(declare-fun m!487945 () Bool)

(assert (=> b!507578 m!487945))

(assert (=> b!507574 m!487935))

(assert (=> b!507574 m!487935))

(declare-fun m!487947 () Bool)

(assert (=> b!507574 m!487947))

(declare-fun m!487949 () Bool)

(assert (=> b!507576 m!487949))

(declare-fun m!487951 () Bool)

(assert (=> start!45840 m!487951))

(declare-fun m!487953 () Bool)

(assert (=> start!45840 m!487953))

(assert (=> b!507570 m!487935))

(assert (=> b!507570 m!487935))

(declare-fun m!487955 () Bool)

(assert (=> b!507570 m!487955))

(declare-fun m!487957 () Bool)

(assert (=> b!507573 m!487957))

(check-sat (not b!507578) (not b!507570) (not b!507576) (not b!507571) (not b!507575) (not b!507572) (not b!507574) (not b!507579) (not b!507573) (not start!45840))
(check-sat)
