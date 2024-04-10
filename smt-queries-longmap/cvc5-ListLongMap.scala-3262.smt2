; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45444 () Bool)

(assert start!45444)

(declare-fun b!499953 () Bool)

(declare-fun e!292945 () Bool)

(assert (=> b!499953 (= e!292945 true)))

(declare-datatypes ((SeekEntryResult!3983 0))(
  ( (MissingZero!3983 (index!18114 (_ BitVec 32))) (Found!3983 (index!18115 (_ BitVec 32))) (Intermediate!3983 (undefined!4795 Bool) (index!18116 (_ BitVec 32)) (x!47156 (_ BitVec 32))) (Undefined!3983) (MissingVacant!3983 (index!18117 (_ BitVec 32))) )
))
(declare-fun lt!226796 () SeekEntryResult!3983)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!226797 () (_ BitVec 32))

(declare-datatypes ((array!32269 0))(
  ( (array!32270 (arr!15516 (Array (_ BitVec 32) (_ BitVec 64))) (size!15880 (_ BitVec 32))) )
))
(declare-fun lt!226798 () array!32269)

(declare-fun lt!226795 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32269 (_ BitVec 32)) SeekEntryResult!3983)

(assert (=> b!499953 (= lt!226796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226797 lt!226795 lt!226798 mask!3524))))

(declare-fun b!499954 () Bool)

(declare-fun res!301853 () Bool)

(declare-fun e!292943 () Bool)

(assert (=> b!499954 (=> (not res!301853) (not e!292943))))

(declare-fun a!3235 () array!32269)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499954 (= res!301853 (validKeyInArray!0 (select (arr!15516 a!3235) j!176)))))

(declare-fun b!499955 () Bool)

(declare-fun e!292947 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32269 (_ BitVec 32)) SeekEntryResult!3983)

(assert (=> b!499955 (= e!292947 (= (seekEntryOrOpen!0 (select (arr!15516 a!3235) j!176) a!3235 mask!3524) (Found!3983 j!176)))))

(declare-fun b!499956 () Bool)

(declare-fun e!292948 () Bool)

(assert (=> b!499956 (= e!292943 e!292948)))

(declare-fun res!301852 () Bool)

(assert (=> b!499956 (=> (not res!301852) (not e!292948))))

(declare-fun lt!226792 () SeekEntryResult!3983)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499956 (= res!301852 (or (= lt!226792 (MissingZero!3983 i!1204)) (= lt!226792 (MissingVacant!3983 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!499956 (= lt!226792 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499957 () Bool)

(declare-fun res!301858 () Bool)

(assert (=> b!499957 (=> (not res!301858) (not e!292943))))

(assert (=> b!499957 (= res!301858 (validKeyInArray!0 k!2280))))

(declare-fun b!499958 () Bool)

(declare-datatypes ((Unit!15008 0))(
  ( (Unit!15009) )
))
(declare-fun e!292950 () Unit!15008)

(declare-fun Unit!15010 () Unit!15008)

(assert (=> b!499958 (= e!292950 Unit!15010)))

(declare-fun b!499959 () Bool)

(declare-fun res!301851 () Bool)

(assert (=> b!499959 (=> (not res!301851) (not e!292943))))

(declare-fun arrayContainsKey!0 (array!32269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499959 (= res!301851 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499961 () Bool)

(declare-fun res!301854 () Bool)

(assert (=> b!499961 (=> (not res!301854) (not e!292948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32269 (_ BitVec 32)) Bool)

(assert (=> b!499961 (= res!301854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499962 () Bool)

(declare-fun Unit!15011 () Unit!15008)

(assert (=> b!499962 (= e!292950 Unit!15011)))

(declare-fun lt!226791 () Unit!15008)

(declare-fun lt!226794 () SeekEntryResult!3983)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32269 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15008)

(assert (=> b!499962 (= lt!226791 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226797 #b00000000000000000000000000000000 (index!18116 lt!226794) (x!47156 lt!226794) mask!3524))))

(declare-fun res!301856 () Bool)

(assert (=> b!499962 (= res!301856 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226797 lt!226795 lt!226798 mask!3524) (Intermediate!3983 false (index!18116 lt!226794) (x!47156 lt!226794))))))

(declare-fun e!292946 () Bool)

(assert (=> b!499962 (=> (not res!301856) (not e!292946))))

(assert (=> b!499962 e!292946))

(declare-fun b!499963 () Bool)

(declare-fun res!301847 () Bool)

(assert (=> b!499963 (=> (not res!301847) (not e!292948))))

(declare-datatypes ((List!9674 0))(
  ( (Nil!9671) (Cons!9670 (h!10544 (_ BitVec 64)) (t!15902 List!9674)) )
))
(declare-fun arrayNoDuplicates!0 (array!32269 (_ BitVec 32) List!9674) Bool)

(assert (=> b!499963 (= res!301847 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9671))))

(declare-fun b!499964 () Bool)

(declare-fun e!292944 () Bool)

(assert (=> b!499964 (= e!292944 e!292945)))

(declare-fun res!301859 () Bool)

(assert (=> b!499964 (=> res!301859 e!292945)))

(assert (=> b!499964 (= res!301859 (or (bvsgt #b00000000000000000000000000000000 (x!47156 lt!226794)) (bvsgt (x!47156 lt!226794) #b01111111111111111111111111111110) (bvslt lt!226797 #b00000000000000000000000000000000) (bvsge lt!226797 (size!15880 a!3235)) (bvslt (index!18116 lt!226794) #b00000000000000000000000000000000) (bvsge (index!18116 lt!226794) (size!15880 a!3235)) (not (= lt!226794 (Intermediate!3983 false (index!18116 lt!226794) (x!47156 lt!226794))))))))

(assert (=> b!499964 (and (or (= (select (arr!15516 a!3235) (index!18116 lt!226794)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15516 a!3235) (index!18116 lt!226794)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15516 a!3235) (index!18116 lt!226794)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15516 a!3235) (index!18116 lt!226794)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226793 () Unit!15008)

(assert (=> b!499964 (= lt!226793 e!292950)))

(declare-fun c!59330 () Bool)

(assert (=> b!499964 (= c!59330 (= (select (arr!15516 a!3235) (index!18116 lt!226794)) (select (arr!15516 a!3235) j!176)))))

(assert (=> b!499964 (and (bvslt (x!47156 lt!226794) #b01111111111111111111111111111110) (or (= (select (arr!15516 a!3235) (index!18116 lt!226794)) (select (arr!15516 a!3235) j!176)) (= (select (arr!15516 a!3235) (index!18116 lt!226794)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15516 a!3235) (index!18116 lt!226794)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499965 () Bool)

(assert (=> b!499965 (= e!292948 (not e!292944))))

(declare-fun res!301848 () Bool)

(assert (=> b!499965 (=> res!301848 e!292944)))

(declare-fun lt!226790 () (_ BitVec 32))

(assert (=> b!499965 (= res!301848 (= lt!226794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226790 lt!226795 lt!226798 mask!3524)))))

(assert (=> b!499965 (= lt!226794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226797 (select (arr!15516 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499965 (= lt!226790 (toIndex!0 lt!226795 mask!3524))))

(assert (=> b!499965 (= lt!226795 (select (store (arr!15516 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499965 (= lt!226797 (toIndex!0 (select (arr!15516 a!3235) j!176) mask!3524))))

(assert (=> b!499965 (= lt!226798 (array!32270 (store (arr!15516 a!3235) i!1204 k!2280) (size!15880 a!3235)))))

(assert (=> b!499965 e!292947))

(declare-fun res!301857 () Bool)

(assert (=> b!499965 (=> (not res!301857) (not e!292947))))

(assert (=> b!499965 (= res!301857 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226789 () Unit!15008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15008)

(assert (=> b!499965 (= lt!226789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499960 () Bool)

(declare-fun res!301855 () Bool)

(assert (=> b!499960 (=> res!301855 e!292944)))

(assert (=> b!499960 (= res!301855 (or (undefined!4795 lt!226794) (not (is-Intermediate!3983 lt!226794))))))

(declare-fun res!301850 () Bool)

(assert (=> start!45444 (=> (not res!301850) (not e!292943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45444 (= res!301850 (validMask!0 mask!3524))))

(assert (=> start!45444 e!292943))

(assert (=> start!45444 true))

(declare-fun array_inv!11312 (array!32269) Bool)

(assert (=> start!45444 (array_inv!11312 a!3235)))

(declare-fun b!499966 () Bool)

(declare-fun res!301849 () Bool)

(assert (=> b!499966 (=> (not res!301849) (not e!292943))))

(assert (=> b!499966 (= res!301849 (and (= (size!15880 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15880 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15880 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499967 () Bool)

(assert (=> b!499967 (= e!292946 false)))

(assert (= (and start!45444 res!301850) b!499966))

(assert (= (and b!499966 res!301849) b!499954))

(assert (= (and b!499954 res!301853) b!499957))

(assert (= (and b!499957 res!301858) b!499959))

(assert (= (and b!499959 res!301851) b!499956))

(assert (= (and b!499956 res!301852) b!499961))

(assert (= (and b!499961 res!301854) b!499963))

(assert (= (and b!499963 res!301847) b!499965))

(assert (= (and b!499965 res!301857) b!499955))

(assert (= (and b!499965 (not res!301848)) b!499960))

(assert (= (and b!499960 (not res!301855)) b!499964))

(assert (= (and b!499964 c!59330) b!499962))

(assert (= (and b!499964 (not c!59330)) b!499958))

(assert (= (and b!499962 res!301856) b!499967))

(assert (= (and b!499964 (not res!301859)) b!499953))

(declare-fun m!481119 () Bool)

(assert (=> start!45444 m!481119))

(declare-fun m!481121 () Bool)

(assert (=> start!45444 m!481121))

(declare-fun m!481123 () Bool)

(assert (=> b!499963 m!481123))

(declare-fun m!481125 () Bool)

(assert (=> b!499965 m!481125))

(declare-fun m!481127 () Bool)

(assert (=> b!499965 m!481127))

(declare-fun m!481129 () Bool)

(assert (=> b!499965 m!481129))

(declare-fun m!481131 () Bool)

(assert (=> b!499965 m!481131))

(declare-fun m!481133 () Bool)

(assert (=> b!499965 m!481133))

(assert (=> b!499965 m!481125))

(declare-fun m!481135 () Bool)

(assert (=> b!499965 m!481135))

(assert (=> b!499965 m!481125))

(declare-fun m!481137 () Bool)

(assert (=> b!499965 m!481137))

(declare-fun m!481139 () Bool)

(assert (=> b!499965 m!481139))

(declare-fun m!481141 () Bool)

(assert (=> b!499965 m!481141))

(declare-fun m!481143 () Bool)

(assert (=> b!499961 m!481143))

(declare-fun m!481145 () Bool)

(assert (=> b!499956 m!481145))

(declare-fun m!481147 () Bool)

(assert (=> b!499959 m!481147))

(declare-fun m!481149 () Bool)

(assert (=> b!499962 m!481149))

(declare-fun m!481151 () Bool)

(assert (=> b!499962 m!481151))

(declare-fun m!481153 () Bool)

(assert (=> b!499964 m!481153))

(assert (=> b!499964 m!481125))

(assert (=> b!499953 m!481151))

(assert (=> b!499955 m!481125))

(assert (=> b!499955 m!481125))

(declare-fun m!481155 () Bool)

(assert (=> b!499955 m!481155))

(assert (=> b!499954 m!481125))

(assert (=> b!499954 m!481125))

(declare-fun m!481157 () Bool)

(assert (=> b!499954 m!481157))

(declare-fun m!481159 () Bool)

(assert (=> b!499957 m!481159))

(push 1)

