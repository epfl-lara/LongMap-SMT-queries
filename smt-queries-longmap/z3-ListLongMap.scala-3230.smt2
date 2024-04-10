; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45188 () Bool)

(assert start!45188)

(declare-fun b!495925 () Bool)

(declare-fun res!298316 () Bool)

(declare-fun e!290888 () Bool)

(assert (=> b!495925 (=> (not res!298316) (not e!290888))))

(declare-datatypes ((array!32076 0))(
  ( (array!32077 (arr!15421 (Array (_ BitVec 32) (_ BitVec 64))) (size!15785 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32076)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495925 (= res!298316 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495926 () Bool)

(declare-fun res!298314 () Bool)

(assert (=> b!495926 (=> (not res!298314) (not e!290888))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495926 (= res!298314 (and (= (size!15785 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15785 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15785 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495927 () Bool)

(declare-fun res!298321 () Bool)

(declare-fun e!290892 () Bool)

(assert (=> b!495927 (=> (not res!298321) (not e!290892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32076 (_ BitVec 32)) Bool)

(assert (=> b!495927 (= res!298321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495929 () Bool)

(declare-fun res!298317 () Bool)

(declare-fun e!290890 () Bool)

(assert (=> b!495929 (=> res!298317 e!290890)))

(declare-datatypes ((SeekEntryResult!3888 0))(
  ( (MissingZero!3888 (index!17731 (_ BitVec 32))) (Found!3888 (index!17732 (_ BitVec 32))) (Intermediate!3888 (undefined!4700 Bool) (index!17733 (_ BitVec 32)) (x!46796 (_ BitVec 32))) (Undefined!3888) (MissingVacant!3888 (index!17734 (_ BitVec 32))) )
))
(declare-fun lt!224510 () SeekEntryResult!3888)

(get-info :version)

(assert (=> b!495929 (= res!298317 (or (undefined!4700 lt!224510) (not ((_ is Intermediate!3888) lt!224510))))))

(declare-fun e!290889 () Bool)

(declare-fun b!495930 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32076 (_ BitVec 32)) SeekEntryResult!3888)

(assert (=> b!495930 (= e!290889 (= (seekEntryOrOpen!0 (select (arr!15421 a!3235) j!176) a!3235 mask!3524) (Found!3888 j!176)))))

(declare-fun b!495931 () Bool)

(assert (=> b!495931 (= e!290892 (not e!290890))))

(declare-fun res!298319 () Bool)

(assert (=> b!495931 (=> res!298319 e!290890)))

(declare-fun lt!224512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32076 (_ BitVec 32)) SeekEntryResult!3888)

(assert (=> b!495931 (= res!298319 (= lt!224510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224512 (select (store (arr!15421 a!3235) i!1204 k0!2280) j!176) (array!32077 (store (arr!15421 a!3235) i!1204 k0!2280) (size!15785 a!3235)) mask!3524)))))

(declare-fun lt!224511 () (_ BitVec 32))

(assert (=> b!495931 (= lt!224510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224511 (select (arr!15421 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495931 (= lt!224512 (toIndex!0 (select (store (arr!15421 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495931 (= lt!224511 (toIndex!0 (select (arr!15421 a!3235) j!176) mask!3524))))

(assert (=> b!495931 e!290889))

(declare-fun res!298315 () Bool)

(assert (=> b!495931 (=> (not res!298315) (not e!290889))))

(assert (=> b!495931 (= res!298315 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14722 0))(
  ( (Unit!14723) )
))
(declare-fun lt!224509 () Unit!14722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14722)

(assert (=> b!495931 (= lt!224509 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495932 () Bool)

(assert (=> b!495932 (= e!290890 true)))

(assert (=> b!495932 (and (bvslt (x!46796 lt!224510) #b01111111111111111111111111111110) (or (= (select (arr!15421 a!3235) (index!17733 lt!224510)) (select (arr!15421 a!3235) j!176)) (= (select (arr!15421 a!3235) (index!17733 lt!224510)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15421 a!3235) (index!17733 lt!224510)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495933 () Bool)

(declare-fun res!298313 () Bool)

(assert (=> b!495933 (=> (not res!298313) (not e!290888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495933 (= res!298313 (validKeyInArray!0 k0!2280))))

(declare-fun b!495934 () Bool)

(declare-fun res!298322 () Bool)

(assert (=> b!495934 (=> (not res!298322) (not e!290892))))

(declare-datatypes ((List!9579 0))(
  ( (Nil!9576) (Cons!9575 (h!10446 (_ BitVec 64)) (t!15807 List!9579)) )
))
(declare-fun arrayNoDuplicates!0 (array!32076 (_ BitVec 32) List!9579) Bool)

(assert (=> b!495934 (= res!298322 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9576))))

(declare-fun b!495935 () Bool)

(assert (=> b!495935 (= e!290888 e!290892)))

(declare-fun res!298318 () Bool)

(assert (=> b!495935 (=> (not res!298318) (not e!290892))))

(declare-fun lt!224508 () SeekEntryResult!3888)

(assert (=> b!495935 (= res!298318 (or (= lt!224508 (MissingZero!3888 i!1204)) (= lt!224508 (MissingVacant!3888 i!1204))))))

(assert (=> b!495935 (= lt!224508 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495928 () Bool)

(declare-fun res!298312 () Bool)

(assert (=> b!495928 (=> (not res!298312) (not e!290888))))

(assert (=> b!495928 (= res!298312 (validKeyInArray!0 (select (arr!15421 a!3235) j!176)))))

(declare-fun res!298320 () Bool)

(assert (=> start!45188 (=> (not res!298320) (not e!290888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45188 (= res!298320 (validMask!0 mask!3524))))

(assert (=> start!45188 e!290888))

(assert (=> start!45188 true))

(declare-fun array_inv!11217 (array!32076) Bool)

(assert (=> start!45188 (array_inv!11217 a!3235)))

(assert (= (and start!45188 res!298320) b!495926))

(assert (= (and b!495926 res!298314) b!495928))

(assert (= (and b!495928 res!298312) b!495933))

(assert (= (and b!495933 res!298313) b!495925))

(assert (= (and b!495925 res!298316) b!495935))

(assert (= (and b!495935 res!298318) b!495927))

(assert (= (and b!495927 res!298321) b!495934))

(assert (= (and b!495934 res!298322) b!495931))

(assert (= (and b!495931 res!298315) b!495930))

(assert (= (and b!495931 (not res!298319)) b!495929))

(assert (= (and b!495929 (not res!298317)) b!495932))

(declare-fun m!477083 () Bool)

(assert (=> b!495935 m!477083))

(declare-fun m!477085 () Bool)

(assert (=> b!495931 m!477085))

(declare-fun m!477087 () Bool)

(assert (=> b!495931 m!477087))

(declare-fun m!477089 () Bool)

(assert (=> b!495931 m!477089))

(assert (=> b!495931 m!477089))

(declare-fun m!477091 () Bool)

(assert (=> b!495931 m!477091))

(declare-fun m!477093 () Bool)

(assert (=> b!495931 m!477093))

(declare-fun m!477095 () Bool)

(assert (=> b!495931 m!477095))

(assert (=> b!495931 m!477093))

(declare-fun m!477097 () Bool)

(assert (=> b!495931 m!477097))

(assert (=> b!495931 m!477089))

(declare-fun m!477099 () Bool)

(assert (=> b!495931 m!477099))

(assert (=> b!495931 m!477093))

(declare-fun m!477101 () Bool)

(assert (=> b!495931 m!477101))

(assert (=> b!495928 m!477093))

(assert (=> b!495928 m!477093))

(declare-fun m!477103 () Bool)

(assert (=> b!495928 m!477103))

(assert (=> b!495930 m!477093))

(assert (=> b!495930 m!477093))

(declare-fun m!477105 () Bool)

(assert (=> b!495930 m!477105))

(declare-fun m!477107 () Bool)

(assert (=> start!45188 m!477107))

(declare-fun m!477109 () Bool)

(assert (=> start!45188 m!477109))

(declare-fun m!477111 () Bool)

(assert (=> b!495932 m!477111))

(assert (=> b!495932 m!477093))

(declare-fun m!477113 () Bool)

(assert (=> b!495925 m!477113))

(declare-fun m!477115 () Bool)

(assert (=> b!495933 m!477115))

(declare-fun m!477117 () Bool)

(assert (=> b!495934 m!477117))

(declare-fun m!477119 () Bool)

(assert (=> b!495927 m!477119))

(check-sat (not b!495933) (not b!495930) (not b!495928) (not b!495935) (not b!495927) (not start!45188) (not b!495925) (not b!495934) (not b!495931))
(check-sat)
