; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44656 () Bool)

(assert start!44656)

(declare-fun b!489948 () Bool)

(declare-fun res!292888 () Bool)

(declare-fun e!288087 () Bool)

(assert (=> b!489948 (=> (not res!292888) (not e!288087))))

(declare-datatypes ((array!31715 0))(
  ( (array!31716 (arr!15245 (Array (_ BitVec 32) (_ BitVec 64))) (size!15609 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31715)

(declare-datatypes ((List!9403 0))(
  ( (Nil!9400) (Cons!9399 (h!10261 (_ BitVec 64)) (t!15631 List!9403)) )
))
(declare-fun arrayNoDuplicates!0 (array!31715 (_ BitVec 32) List!9403) Bool)

(assert (=> b!489948 (= res!292888 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9400))))

(declare-fun b!489949 () Bool)

(declare-fun e!288089 () Bool)

(assert (=> b!489949 (= e!288089 e!288087)))

(declare-fun res!292886 () Bool)

(assert (=> b!489949 (=> (not res!292886) (not e!288087))))

(declare-datatypes ((SeekEntryResult!3712 0))(
  ( (MissingZero!3712 (index!17027 (_ BitVec 32))) (Found!3712 (index!17028 (_ BitVec 32))) (Intermediate!3712 (undefined!4524 Bool) (index!17029 (_ BitVec 32)) (x!46130 (_ BitVec 32))) (Undefined!3712) (MissingVacant!3712 (index!17030 (_ BitVec 32))) )
))
(declare-fun lt!221169 () SeekEntryResult!3712)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489949 (= res!292886 (or (= lt!221169 (MissingZero!3712 i!1204)) (= lt!221169 (MissingVacant!3712 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31715 (_ BitVec 32)) SeekEntryResult!3712)

(assert (=> b!489949 (= lt!221169 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489950 () Bool)

(declare-fun res!292892 () Bool)

(assert (=> b!489950 (=> (not res!292892) (not e!288089))))

(declare-fun arrayContainsKey!0 (array!31715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489950 (= res!292892 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489951 () Bool)

(declare-fun res!292889 () Bool)

(assert (=> b!489951 (=> (not res!292889) (not e!288087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31715 (_ BitVec 32)) Bool)

(assert (=> b!489951 (= res!292889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!292887 () Bool)

(assert (=> start!44656 (=> (not res!292887) (not e!288089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44656 (= res!292887 (validMask!0 mask!3524))))

(assert (=> start!44656 e!288089))

(assert (=> start!44656 true))

(declare-fun array_inv!11041 (array!31715) Bool)

(assert (=> start!44656 (array_inv!11041 a!3235)))

(declare-fun b!489952 () Bool)

(assert (=> b!489952 (= e!288087 (not true))))

(declare-fun lt!221166 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!221170 () SeekEntryResult!3712)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31715 (_ BitVec 32)) SeekEntryResult!3712)

(assert (=> b!489952 (= lt!221170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221166 (select (store (arr!15245 a!3235) i!1204 k!2280) j!176) (array!31716 (store (arr!15245 a!3235) i!1204 k!2280) (size!15609 a!3235)) mask!3524))))

(declare-fun lt!221168 () (_ BitVec 32))

(declare-fun lt!221167 () SeekEntryResult!3712)

(assert (=> b!489952 (= lt!221167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221168 (select (arr!15245 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489952 (= lt!221166 (toIndex!0 (select (store (arr!15245 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489952 (= lt!221168 (toIndex!0 (select (arr!15245 a!3235) j!176) mask!3524))))

(declare-fun e!288090 () Bool)

(assert (=> b!489952 e!288090))

(declare-fun res!292885 () Bool)

(assert (=> b!489952 (=> (not res!292885) (not e!288090))))

(assert (=> b!489952 (= res!292885 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14370 0))(
  ( (Unit!14371) )
))
(declare-fun lt!221165 () Unit!14370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14370)

(assert (=> b!489952 (= lt!221165 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489953 () Bool)

(declare-fun res!292891 () Bool)

(assert (=> b!489953 (=> (not res!292891) (not e!288089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489953 (= res!292891 (validKeyInArray!0 (select (arr!15245 a!3235) j!176)))))

(declare-fun b!489954 () Bool)

(declare-fun res!292884 () Bool)

(assert (=> b!489954 (=> (not res!292884) (not e!288089))))

(assert (=> b!489954 (= res!292884 (and (= (size!15609 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15609 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15609 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489955 () Bool)

(assert (=> b!489955 (= e!288090 (= (seekEntryOrOpen!0 (select (arr!15245 a!3235) j!176) a!3235 mask!3524) (Found!3712 j!176)))))

(declare-fun b!489956 () Bool)

(declare-fun res!292890 () Bool)

(assert (=> b!489956 (=> (not res!292890) (not e!288089))))

(assert (=> b!489956 (= res!292890 (validKeyInArray!0 k!2280))))

(assert (= (and start!44656 res!292887) b!489954))

(assert (= (and b!489954 res!292884) b!489953))

(assert (= (and b!489953 res!292891) b!489956))

(assert (= (and b!489956 res!292890) b!489950))

(assert (= (and b!489950 res!292892) b!489949))

(assert (= (and b!489949 res!292886) b!489951))

(assert (= (and b!489951 res!292889) b!489948))

(assert (= (and b!489948 res!292888) b!489952))

(assert (= (and b!489952 res!292885) b!489955))

(declare-fun m!469893 () Bool)

(assert (=> b!489952 m!469893))

(declare-fun m!469895 () Bool)

(assert (=> b!489952 m!469895))

(declare-fun m!469897 () Bool)

(assert (=> b!489952 m!469897))

(declare-fun m!469899 () Bool)

(assert (=> b!489952 m!469899))

(assert (=> b!489952 m!469893))

(declare-fun m!469901 () Bool)

(assert (=> b!489952 m!469901))

(declare-fun m!469903 () Bool)

(assert (=> b!489952 m!469903))

(assert (=> b!489952 m!469901))

(declare-fun m!469905 () Bool)

(assert (=> b!489952 m!469905))

(assert (=> b!489952 m!469901))

(declare-fun m!469907 () Bool)

(assert (=> b!489952 m!469907))

(assert (=> b!489952 m!469893))

(declare-fun m!469909 () Bool)

(assert (=> b!489952 m!469909))

(declare-fun m!469911 () Bool)

(assert (=> b!489950 m!469911))

(assert (=> b!489953 m!469901))

(assert (=> b!489953 m!469901))

(declare-fun m!469913 () Bool)

(assert (=> b!489953 m!469913))

(declare-fun m!469915 () Bool)

(assert (=> b!489949 m!469915))

(declare-fun m!469917 () Bool)

(assert (=> b!489948 m!469917))

(declare-fun m!469919 () Bool)

(assert (=> b!489951 m!469919))

(assert (=> b!489955 m!469901))

(assert (=> b!489955 m!469901))

(declare-fun m!469921 () Bool)

(assert (=> b!489955 m!469921))

(declare-fun m!469923 () Bool)

(assert (=> start!44656 m!469923))

(declare-fun m!469925 () Bool)

(assert (=> start!44656 m!469925))

(declare-fun m!469927 () Bool)

(assert (=> b!489956 m!469927))

(push 1)

(assert (not b!489956))

