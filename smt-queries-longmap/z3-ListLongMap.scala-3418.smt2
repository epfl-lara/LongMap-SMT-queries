; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47420 () Bool)

(assert start!47420)

(declare-fun b!521937 () Bool)

(declare-fun res!319711 () Bool)

(declare-fun e!304457 () Bool)

(assert (=> b!521937 (=> res!319711 e!304457)))

(declare-datatypes ((SeekEntryResult!4402 0))(
  ( (MissingZero!4402 (index!19811 (_ BitVec 32))) (Found!4402 (index!19812 (_ BitVec 32))) (Intermediate!4402 (undefined!5214 Bool) (index!19813 (_ BitVec 32)) (x!48937 (_ BitVec 32))) (Undefined!4402) (MissingVacant!4402 (index!19814 (_ BitVec 32))) )
))
(declare-fun lt!239331 () SeekEntryResult!4402)

(get-info :version)

(assert (=> b!521937 (= res!319711 (or (undefined!5214 lt!239331) (not ((_ is Intermediate!4402) lt!239331))))))

(declare-fun b!521938 () Bool)

(assert (=> b!521938 (= e!304457 true)))

(declare-datatypes ((array!33247 0))(
  ( (array!33248 (arr!15979 (Array (_ BitVec 32) (_ BitVec 64))) (size!16343 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33247)

(assert (=> b!521938 (and (or (= (select (arr!15979 a!3235) (index!19813 lt!239331)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15979 a!3235) (index!19813 lt!239331)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15979 a!3235) (index!19813 lt!239331)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15979 a!3235) (index!19813 lt!239331)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16219 0))(
  ( (Unit!16220) )
))
(declare-fun lt!239338 () Unit!16219)

(declare-fun e!304455 () Unit!16219)

(assert (=> b!521938 (= lt!239338 e!304455)))

(declare-fun c!61415 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521938 (= c!61415 (= (select (arr!15979 a!3235) (index!19813 lt!239331)) (select (arr!15979 a!3235) j!176)))))

(assert (=> b!521938 (and (bvslt (x!48937 lt!239331) #b01111111111111111111111111111110) (or (= (select (arr!15979 a!3235) (index!19813 lt!239331)) (select (arr!15979 a!3235) j!176)) (= (select (arr!15979 a!3235) (index!19813 lt!239331)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15979 a!3235) (index!19813 lt!239331)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521939 () Bool)

(declare-fun e!304459 () Bool)

(declare-fun e!304456 () Bool)

(assert (=> b!521939 (= e!304459 e!304456)))

(declare-fun res!319717 () Bool)

(assert (=> b!521939 (=> (not res!319717) (not e!304456))))

(declare-fun lt!239336 () SeekEntryResult!4402)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521939 (= res!319717 (or (= lt!239336 (MissingZero!4402 i!1204)) (= lt!239336 (MissingVacant!4402 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33247 (_ BitVec 32)) SeekEntryResult!4402)

(assert (=> b!521939 (= lt!239336 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521940 () Bool)

(declare-fun res!319712 () Bool)

(assert (=> b!521940 (=> (not res!319712) (not e!304459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521940 (= res!319712 (validKeyInArray!0 k0!2280))))

(declare-fun b!521941 () Bool)

(declare-fun e!304458 () Bool)

(assert (=> b!521941 (= e!304458 false)))

(declare-fun b!521942 () Bool)

(declare-fun res!319719 () Bool)

(assert (=> b!521942 (=> (not res!319719) (not e!304456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33247 (_ BitVec 32)) Bool)

(assert (=> b!521942 (= res!319719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521943 () Bool)

(declare-fun res!319713 () Bool)

(assert (=> b!521943 (=> (not res!319713) (not e!304459))))

(assert (=> b!521943 (= res!319713 (and (= (size!16343 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16343 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16343 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!319715 () Bool)

(assert (=> start!47420 (=> (not res!319715) (not e!304459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47420 (= res!319715 (validMask!0 mask!3524))))

(assert (=> start!47420 e!304459))

(assert (=> start!47420 true))

(declare-fun array_inv!11838 (array!33247) Bool)

(assert (=> start!47420 (array_inv!11838 a!3235)))

(declare-fun b!521944 () Bool)

(declare-fun res!319716 () Bool)

(assert (=> b!521944 (=> (not res!319716) (not e!304459))))

(declare-fun arrayContainsKey!0 (array!33247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521944 (= res!319716 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521945 () Bool)

(declare-fun Unit!16221 () Unit!16219)

(assert (=> b!521945 (= e!304455 Unit!16221)))

(declare-fun lt!239333 () (_ BitVec 32))

(declare-fun lt!239330 () Unit!16219)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33247 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16219)

(assert (=> b!521945 (= lt!239330 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239333 #b00000000000000000000000000000000 (index!19813 lt!239331) (x!48937 lt!239331) mask!3524))))

(declare-fun lt!239335 () array!33247)

(declare-fun lt!239337 () (_ BitVec 64))

(declare-fun res!319720 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33247 (_ BitVec 32)) SeekEntryResult!4402)

(assert (=> b!521945 (= res!319720 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239333 lt!239337 lt!239335 mask!3524) (Intermediate!4402 false (index!19813 lt!239331) (x!48937 lt!239331))))))

(assert (=> b!521945 (=> (not res!319720) (not e!304458))))

(assert (=> b!521945 e!304458))

(declare-fun b!521946 () Bool)

(declare-fun res!319709 () Bool)

(assert (=> b!521946 (=> (not res!319709) (not e!304456))))

(declare-datatypes ((List!10044 0))(
  ( (Nil!10041) (Cons!10040 (h!10962 (_ BitVec 64)) (t!16264 List!10044)) )
))
(declare-fun arrayNoDuplicates!0 (array!33247 (_ BitVec 32) List!10044) Bool)

(assert (=> b!521946 (= res!319709 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10041))))

(declare-fun b!521947 () Bool)

(declare-fun e!304460 () Bool)

(assert (=> b!521947 (= e!304460 (= (seekEntryOrOpen!0 (select (arr!15979 a!3235) j!176) a!3235 mask!3524) (Found!4402 j!176)))))

(declare-fun b!521948 () Bool)

(assert (=> b!521948 (= e!304456 (not e!304457))))

(declare-fun res!319714 () Bool)

(assert (=> b!521948 (=> res!319714 e!304457)))

(declare-fun lt!239334 () (_ BitVec 32))

(assert (=> b!521948 (= res!319714 (= lt!239331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239334 lt!239337 lt!239335 mask!3524)))))

(assert (=> b!521948 (= lt!239331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239333 (select (arr!15979 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521948 (= lt!239334 (toIndex!0 lt!239337 mask!3524))))

(assert (=> b!521948 (= lt!239337 (select (store (arr!15979 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521948 (= lt!239333 (toIndex!0 (select (arr!15979 a!3235) j!176) mask!3524))))

(assert (=> b!521948 (= lt!239335 (array!33248 (store (arr!15979 a!3235) i!1204 k0!2280) (size!16343 a!3235)))))

(assert (=> b!521948 e!304460))

(declare-fun res!319710 () Bool)

(assert (=> b!521948 (=> (not res!319710) (not e!304460))))

(assert (=> b!521948 (= res!319710 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239332 () Unit!16219)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16219)

(assert (=> b!521948 (= lt!239332 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521949 () Bool)

(declare-fun res!319718 () Bool)

(assert (=> b!521949 (=> (not res!319718) (not e!304459))))

(assert (=> b!521949 (= res!319718 (validKeyInArray!0 (select (arr!15979 a!3235) j!176)))))

(declare-fun b!521950 () Bool)

(declare-fun Unit!16222 () Unit!16219)

(assert (=> b!521950 (= e!304455 Unit!16222)))

(assert (= (and start!47420 res!319715) b!521943))

(assert (= (and b!521943 res!319713) b!521949))

(assert (= (and b!521949 res!319718) b!521940))

(assert (= (and b!521940 res!319712) b!521944))

(assert (= (and b!521944 res!319716) b!521939))

(assert (= (and b!521939 res!319717) b!521942))

(assert (= (and b!521942 res!319719) b!521946))

(assert (= (and b!521946 res!319709) b!521948))

(assert (= (and b!521948 res!319710) b!521947))

(assert (= (and b!521948 (not res!319714)) b!521937))

(assert (= (and b!521937 (not res!319711)) b!521938))

(assert (= (and b!521938 c!61415) b!521945))

(assert (= (and b!521938 (not c!61415)) b!521950))

(assert (= (and b!521945 res!319720) b!521941))

(declare-fun m!503095 () Bool)

(assert (=> b!521949 m!503095))

(assert (=> b!521949 m!503095))

(declare-fun m!503097 () Bool)

(assert (=> b!521949 m!503097))

(declare-fun m!503099 () Bool)

(assert (=> b!521948 m!503099))

(declare-fun m!503101 () Bool)

(assert (=> b!521948 m!503101))

(declare-fun m!503103 () Bool)

(assert (=> b!521948 m!503103))

(declare-fun m!503105 () Bool)

(assert (=> b!521948 m!503105))

(assert (=> b!521948 m!503095))

(declare-fun m!503107 () Bool)

(assert (=> b!521948 m!503107))

(assert (=> b!521948 m!503095))

(declare-fun m!503109 () Bool)

(assert (=> b!521948 m!503109))

(declare-fun m!503111 () Bool)

(assert (=> b!521948 m!503111))

(assert (=> b!521948 m!503095))

(declare-fun m!503113 () Bool)

(assert (=> b!521948 m!503113))

(declare-fun m!503115 () Bool)

(assert (=> b!521938 m!503115))

(assert (=> b!521938 m!503095))

(declare-fun m!503117 () Bool)

(assert (=> b!521944 m!503117))

(declare-fun m!503119 () Bool)

(assert (=> b!521945 m!503119))

(declare-fun m!503121 () Bool)

(assert (=> b!521945 m!503121))

(declare-fun m!503123 () Bool)

(assert (=> b!521946 m!503123))

(declare-fun m!503125 () Bool)

(assert (=> b!521939 m!503125))

(declare-fun m!503127 () Bool)

(assert (=> b!521940 m!503127))

(assert (=> b!521947 m!503095))

(assert (=> b!521947 m!503095))

(declare-fun m!503129 () Bool)

(assert (=> b!521947 m!503129))

(declare-fun m!503131 () Bool)

(assert (=> start!47420 m!503131))

(declare-fun m!503133 () Bool)

(assert (=> start!47420 m!503133))

(declare-fun m!503135 () Bool)

(assert (=> b!521942 m!503135))

(check-sat (not b!521944) (not b!521947) (not b!521948) (not b!521945) (not b!521939) (not start!47420) (not b!521940) (not b!521946) (not b!521942) (not b!521949))
(check-sat)
