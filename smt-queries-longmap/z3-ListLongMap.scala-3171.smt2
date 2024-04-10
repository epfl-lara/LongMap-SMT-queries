; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44654 () Bool)

(assert start!44654)

(declare-fun b!489921 () Bool)

(declare-fun res!292864 () Bool)

(declare-fun e!288075 () Bool)

(assert (=> b!489921 (=> (not res!292864) (not e!288075))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489921 (= res!292864 (validKeyInArray!0 k0!2280))))

(declare-fun b!489922 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!288077 () Bool)

(declare-datatypes ((array!31713 0))(
  ( (array!31714 (arr!15244 (Array (_ BitVec 32) (_ BitVec 64))) (size!15608 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31713)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3711 0))(
  ( (MissingZero!3711 (index!17023 (_ BitVec 32))) (Found!3711 (index!17024 (_ BitVec 32))) (Intermediate!3711 (undefined!4523 Bool) (index!17025 (_ BitVec 32)) (x!46129 (_ BitVec 32))) (Undefined!3711) (MissingVacant!3711 (index!17026 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31713 (_ BitVec 32)) SeekEntryResult!3711)

(assert (=> b!489922 (= e!288077 (= (seekEntryOrOpen!0 (select (arr!15244 a!3235) j!176) a!3235 mask!3524) (Found!3711 j!176)))))

(declare-fun b!489923 () Bool)

(declare-fun res!292862 () Bool)

(declare-fun e!288076 () Bool)

(assert (=> b!489923 (=> (not res!292862) (not e!288076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31713 (_ BitVec 32)) Bool)

(assert (=> b!489923 (= res!292862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489924 () Bool)

(assert (=> b!489924 (= e!288075 e!288076)))

(declare-fun res!292858 () Bool)

(assert (=> b!489924 (=> (not res!292858) (not e!288076))))

(declare-fun lt!221151 () SeekEntryResult!3711)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489924 (= res!292858 (or (= lt!221151 (MissingZero!3711 i!1204)) (= lt!221151 (MissingVacant!3711 i!1204))))))

(assert (=> b!489924 (= lt!221151 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489925 () Bool)

(declare-fun res!292859 () Bool)

(assert (=> b!489925 (=> (not res!292859) (not e!288075))))

(assert (=> b!489925 (= res!292859 (validKeyInArray!0 (select (arr!15244 a!3235) j!176)))))

(declare-fun res!292860 () Bool)

(assert (=> start!44654 (=> (not res!292860) (not e!288075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44654 (= res!292860 (validMask!0 mask!3524))))

(assert (=> start!44654 e!288075))

(assert (=> start!44654 true))

(declare-fun array_inv!11040 (array!31713) Bool)

(assert (=> start!44654 (array_inv!11040 a!3235)))

(declare-fun b!489926 () Bool)

(declare-fun res!292865 () Bool)

(assert (=> b!489926 (=> (not res!292865) (not e!288076))))

(declare-datatypes ((List!9402 0))(
  ( (Nil!9399) (Cons!9398 (h!10260 (_ BitVec 64)) (t!15630 List!9402)) )
))
(declare-fun arrayNoDuplicates!0 (array!31713 (_ BitVec 32) List!9402) Bool)

(assert (=> b!489926 (= res!292865 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9399))))

(declare-fun b!489927 () Bool)

(declare-fun res!292861 () Bool)

(assert (=> b!489927 (=> (not res!292861) (not e!288075))))

(declare-fun arrayContainsKey!0 (array!31713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489927 (= res!292861 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489928 () Bool)

(assert (=> b!489928 (= e!288076 (not true))))

(declare-fun lt!221149 () (_ BitVec 32))

(declare-fun lt!221150 () SeekEntryResult!3711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31713 (_ BitVec 32)) SeekEntryResult!3711)

(assert (=> b!489928 (= lt!221150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221149 (select (store (arr!15244 a!3235) i!1204 k0!2280) j!176) (array!31714 (store (arr!15244 a!3235) i!1204 k0!2280) (size!15608 a!3235)) mask!3524))))

(declare-fun lt!221147 () SeekEntryResult!3711)

(declare-fun lt!221148 () (_ BitVec 32))

(assert (=> b!489928 (= lt!221147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221148 (select (arr!15244 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489928 (= lt!221149 (toIndex!0 (select (store (arr!15244 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489928 (= lt!221148 (toIndex!0 (select (arr!15244 a!3235) j!176) mask!3524))))

(assert (=> b!489928 e!288077))

(declare-fun res!292857 () Bool)

(assert (=> b!489928 (=> (not res!292857) (not e!288077))))

(assert (=> b!489928 (= res!292857 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14368 0))(
  ( (Unit!14369) )
))
(declare-fun lt!221152 () Unit!14368)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14368)

(assert (=> b!489928 (= lt!221152 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489929 () Bool)

(declare-fun res!292863 () Bool)

(assert (=> b!489929 (=> (not res!292863) (not e!288075))))

(assert (=> b!489929 (= res!292863 (and (= (size!15608 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15608 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15608 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44654 res!292860) b!489929))

(assert (= (and b!489929 res!292863) b!489925))

(assert (= (and b!489925 res!292859) b!489921))

(assert (= (and b!489921 res!292864) b!489927))

(assert (= (and b!489927 res!292861) b!489924))

(assert (= (and b!489924 res!292858) b!489923))

(assert (= (and b!489923 res!292862) b!489926))

(assert (= (and b!489926 res!292865) b!489928))

(assert (= (and b!489928 res!292857) b!489922))

(declare-fun m!469857 () Bool)

(assert (=> b!489925 m!469857))

(assert (=> b!489925 m!469857))

(declare-fun m!469859 () Bool)

(assert (=> b!489925 m!469859))

(declare-fun m!469861 () Bool)

(assert (=> b!489927 m!469861))

(declare-fun m!469863 () Bool)

(assert (=> start!44654 m!469863))

(declare-fun m!469865 () Bool)

(assert (=> start!44654 m!469865))

(assert (=> b!489922 m!469857))

(assert (=> b!489922 m!469857))

(declare-fun m!469867 () Bool)

(assert (=> b!489922 m!469867))

(declare-fun m!469869 () Bool)

(assert (=> b!489926 m!469869))

(declare-fun m!469871 () Bool)

(assert (=> b!489924 m!469871))

(declare-fun m!469873 () Bool)

(assert (=> b!489928 m!469873))

(declare-fun m!469875 () Bool)

(assert (=> b!489928 m!469875))

(declare-fun m!469877 () Bool)

(assert (=> b!489928 m!469877))

(assert (=> b!489928 m!469857))

(declare-fun m!469879 () Bool)

(assert (=> b!489928 m!469879))

(assert (=> b!489928 m!469877))

(declare-fun m!469881 () Bool)

(assert (=> b!489928 m!469881))

(assert (=> b!489928 m!469877))

(declare-fun m!469883 () Bool)

(assert (=> b!489928 m!469883))

(assert (=> b!489928 m!469857))

(declare-fun m!469885 () Bool)

(assert (=> b!489928 m!469885))

(assert (=> b!489928 m!469857))

(declare-fun m!469887 () Bool)

(assert (=> b!489928 m!469887))

(declare-fun m!469889 () Bool)

(assert (=> b!489923 m!469889))

(declare-fun m!469891 () Bool)

(assert (=> b!489921 m!469891))

(check-sat (not b!489924) (not b!489928) (not b!489926) (not b!489927) (not start!44654) (not b!489921) (not b!489925) (not b!489922) (not b!489923))
(check-sat)
