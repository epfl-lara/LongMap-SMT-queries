; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45084 () Bool)

(assert start!45084)

(declare-fun b!494908 () Bool)

(declare-fun res!297488 () Bool)

(declare-fun e!290374 () Bool)

(assert (=> b!494908 (=> res!297488 e!290374)))

(declare-datatypes ((SeekEntryResult!3866 0))(
  ( (MissingZero!3866 (index!17643 (_ BitVec 32))) (Found!3866 (index!17644 (_ BitVec 32))) (Intermediate!3866 (undefined!4678 Bool) (index!17645 (_ BitVec 32)) (x!46712 (_ BitVec 32))) (Undefined!3866) (MissingVacant!3866 (index!17646 (_ BitVec 32))) )
))
(declare-fun lt!224052 () SeekEntryResult!3866)

(assert (=> b!494908 (= res!297488 (or (undefined!4678 lt!224052) (not (is-Intermediate!3866 lt!224052))))))

(declare-fun b!494909 () Bool)

(declare-fun res!297484 () Bool)

(declare-fun e!290376 () Bool)

(assert (=> b!494909 (=> (not res!297484) (not e!290376))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32029 0))(
  ( (array!32030 (arr!15399 (Array (_ BitVec 32) (_ BitVec 64))) (size!15763 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32029)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494909 (= res!297484 (and (= (size!15763 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15763 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15763 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!297485 () Bool)

(assert (=> start!45084 (=> (not res!297485) (not e!290376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45084 (= res!297485 (validMask!0 mask!3524))))

(assert (=> start!45084 e!290376))

(assert (=> start!45084 true))

(declare-fun array_inv!11195 (array!32029) Bool)

(assert (=> start!45084 (array_inv!11195 a!3235)))

(declare-fun e!290372 () Bool)

(declare-fun b!494910 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32029 (_ BitVec 32)) SeekEntryResult!3866)

(assert (=> b!494910 (= e!290372 (= (seekEntryOrOpen!0 (select (arr!15399 a!3235) j!176) a!3235 mask!3524) (Found!3866 j!176)))))

(declare-fun b!494911 () Bool)

(declare-fun res!297487 () Bool)

(assert (=> b!494911 (=> (not res!297487) (not e!290376))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494911 (= res!297487 (validKeyInArray!0 k!2280))))

(declare-fun b!494912 () Bool)

(declare-fun res!297478 () Bool)

(declare-fun e!290375 () Bool)

(assert (=> b!494912 (=> (not res!297478) (not e!290375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32029 (_ BitVec 32)) Bool)

(assert (=> b!494912 (= res!297478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494913 () Bool)

(assert (=> b!494913 (= e!290375 (not e!290374))))

(declare-fun res!297482 () Bool)

(assert (=> b!494913 (=> res!297482 e!290374)))

(declare-fun lt!224049 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32029 (_ BitVec 32)) SeekEntryResult!3866)

(assert (=> b!494913 (= res!297482 (= lt!224052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224049 (select (store (arr!15399 a!3235) i!1204 k!2280) j!176) (array!32030 (store (arr!15399 a!3235) i!1204 k!2280) (size!15763 a!3235)) mask!3524)))))

(declare-fun lt!224053 () (_ BitVec 32))

(assert (=> b!494913 (= lt!224052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224053 (select (arr!15399 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494913 (= lt!224049 (toIndex!0 (select (store (arr!15399 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494913 (= lt!224053 (toIndex!0 (select (arr!15399 a!3235) j!176) mask!3524))))

(assert (=> b!494913 e!290372))

(declare-fun res!297486 () Bool)

(assert (=> b!494913 (=> (not res!297486) (not e!290372))))

(assert (=> b!494913 (= res!297486 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14678 0))(
  ( (Unit!14679) )
))
(declare-fun lt!224051 () Unit!14678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32029 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14678)

(assert (=> b!494913 (= lt!224051 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494914 () Bool)

(declare-fun res!297483 () Bool)

(assert (=> b!494914 (=> (not res!297483) (not e!290376))))

(assert (=> b!494914 (= res!297483 (validKeyInArray!0 (select (arr!15399 a!3235) j!176)))))

(declare-fun b!494915 () Bool)

(declare-fun res!297480 () Bool)

(assert (=> b!494915 (=> (not res!297480) (not e!290375))))

(declare-datatypes ((List!9557 0))(
  ( (Nil!9554) (Cons!9553 (h!10421 (_ BitVec 64)) (t!15785 List!9557)) )
))
(declare-fun arrayNoDuplicates!0 (array!32029 (_ BitVec 32) List!9557) Bool)

(assert (=> b!494915 (= res!297480 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9554))))

(declare-fun b!494916 () Bool)

(assert (=> b!494916 (= e!290376 e!290375)))

(declare-fun res!297479 () Bool)

(assert (=> b!494916 (=> (not res!297479) (not e!290375))))

(declare-fun lt!224050 () SeekEntryResult!3866)

(assert (=> b!494916 (= res!297479 (or (= lt!224050 (MissingZero!3866 i!1204)) (= lt!224050 (MissingVacant!3866 i!1204))))))

(assert (=> b!494916 (= lt!224050 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494917 () Bool)

(assert (=> b!494917 (= e!290374 (or (not (= (select (arr!15399 a!3235) (index!17645 lt!224052)) (select (arr!15399 a!3235) j!176))) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!494917 (and (bvslt (x!46712 lt!224052) #b01111111111111111111111111111110) (or (= (select (arr!15399 a!3235) (index!17645 lt!224052)) (select (arr!15399 a!3235) j!176)) (= (select (arr!15399 a!3235) (index!17645 lt!224052)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15399 a!3235) (index!17645 lt!224052)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!494918 () Bool)

(declare-fun res!297481 () Bool)

(assert (=> b!494918 (=> (not res!297481) (not e!290376))))

(declare-fun arrayContainsKey!0 (array!32029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494918 (= res!297481 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45084 res!297485) b!494909))

(assert (= (and b!494909 res!297484) b!494914))

(assert (= (and b!494914 res!297483) b!494911))

(assert (= (and b!494911 res!297487) b!494918))

(assert (= (and b!494918 res!297481) b!494916))

(assert (= (and b!494916 res!297479) b!494912))

(assert (= (and b!494912 res!297478) b!494915))

(assert (= (and b!494915 res!297480) b!494913))

(assert (= (and b!494913 res!297486) b!494910))

(assert (= (and b!494913 (not res!297482)) b!494908))

(assert (= (and b!494908 (not res!297488)) b!494917))

(declare-fun m!476043 () Bool)

(assert (=> b!494910 m!476043))

(assert (=> b!494910 m!476043))

(declare-fun m!476045 () Bool)

(assert (=> b!494910 m!476045))

(assert (=> b!494913 m!476043))

(declare-fun m!476047 () Bool)

(assert (=> b!494913 m!476047))

(declare-fun m!476049 () Bool)

(assert (=> b!494913 m!476049))

(declare-fun m!476051 () Bool)

(assert (=> b!494913 m!476051))

(declare-fun m!476053 () Bool)

(assert (=> b!494913 m!476053))

(declare-fun m!476055 () Bool)

(assert (=> b!494913 m!476055))

(assert (=> b!494913 m!476051))

(assert (=> b!494913 m!476043))

(declare-fun m!476057 () Bool)

(assert (=> b!494913 m!476057))

(assert (=> b!494913 m!476043))

(declare-fun m!476059 () Bool)

(assert (=> b!494913 m!476059))

(assert (=> b!494913 m!476051))

(declare-fun m!476061 () Bool)

(assert (=> b!494913 m!476061))

(declare-fun m!476063 () Bool)

(assert (=> b!494912 m!476063))

(declare-fun m!476065 () Bool)

(assert (=> b!494918 m!476065))

(declare-fun m!476067 () Bool)

(assert (=> start!45084 m!476067))

(declare-fun m!476069 () Bool)

(assert (=> start!45084 m!476069))

(declare-fun m!476071 () Bool)

(assert (=> b!494915 m!476071))

(assert (=> b!494914 m!476043))

(assert (=> b!494914 m!476043))

(declare-fun m!476073 () Bool)

(assert (=> b!494914 m!476073))

(declare-fun m!476075 () Bool)

(assert (=> b!494917 m!476075))

(assert (=> b!494917 m!476043))

(declare-fun m!476077 () Bool)

(assert (=> b!494916 m!476077))

(declare-fun m!476079 () Bool)

(assert (=> b!494911 m!476079))

(push 1)

