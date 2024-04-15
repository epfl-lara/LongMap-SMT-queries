; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45978 () Bool)

(assert start!45978)

(declare-fun b!508892 () Bool)

(declare-fun res!309884 () Bool)

(declare-fun e!297624 () Bool)

(assert (=> b!508892 (=> (not res!309884) (not e!297624))))

(declare-datatypes ((array!32699 0))(
  ( (array!32700 (arr!15728 (Array (_ BitVec 32) (_ BitVec 64))) (size!16093 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32699)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508892 (= res!309884 (validKeyInArray!0 (select (arr!15728 a!3235) j!176)))))

(declare-fun b!508893 () Bool)

(declare-fun e!297627 () Bool)

(assert (=> b!508893 (= e!297627 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!232298 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4192 0))(
  ( (MissingZero!4192 (index!18956 (_ BitVec 32))) (Found!4192 (index!18957 (_ BitVec 32))) (Intermediate!4192 (undefined!5004 Bool) (index!18958 (_ BitVec 32)) (x!47940 (_ BitVec 32))) (Undefined!4192) (MissingVacant!4192 (index!18959 (_ BitVec 32))) )
))
(declare-fun lt!232299 () SeekEntryResult!4192)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32699 (_ BitVec 32)) SeekEntryResult!4192)

(assert (=> b!508893 (= lt!232299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232298 (select (store (arr!15728 a!3235) i!1204 k0!2280) j!176) (array!32700 (store (arr!15728 a!3235) i!1204 k0!2280) (size!16093 a!3235)) mask!3524))))

(declare-fun lt!232303 () (_ BitVec 32))

(declare-fun lt!232302 () SeekEntryResult!4192)

(assert (=> b!508893 (= lt!232302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232303 (select (arr!15728 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508893 (= lt!232298 (toIndex!0 (select (store (arr!15728 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!508893 (= lt!232303 (toIndex!0 (select (arr!15728 a!3235) j!176) mask!3524))))

(declare-fun e!297625 () Bool)

(assert (=> b!508893 e!297625))

(declare-fun res!309887 () Bool)

(assert (=> b!508893 (=> (not res!309887) (not e!297625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32699 (_ BitVec 32)) Bool)

(assert (=> b!508893 (= res!309887 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15628 0))(
  ( (Unit!15629) )
))
(declare-fun lt!232300 () Unit!15628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15628)

(assert (=> b!508893 (= lt!232300 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508894 () Bool)

(declare-fun res!309886 () Bool)

(assert (=> b!508894 (=> (not res!309886) (not e!297624))))

(assert (=> b!508894 (= res!309886 (validKeyInArray!0 k0!2280))))

(declare-fun b!508895 () Bool)

(declare-fun res!309879 () Bool)

(assert (=> b!508895 (=> (not res!309879) (not e!297627))))

(declare-datatypes ((List!9925 0))(
  ( (Nil!9922) (Cons!9921 (h!10798 (_ BitVec 64)) (t!16144 List!9925)) )
))
(declare-fun arrayNoDuplicates!0 (array!32699 (_ BitVec 32) List!9925) Bool)

(assert (=> b!508895 (= res!309879 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9922))))

(declare-fun b!508896 () Bool)

(assert (=> b!508896 (= e!297624 e!297627)))

(declare-fun res!309882 () Bool)

(assert (=> b!508896 (=> (not res!309882) (not e!297627))))

(declare-fun lt!232301 () SeekEntryResult!4192)

(assert (=> b!508896 (= res!309882 (or (= lt!232301 (MissingZero!4192 i!1204)) (= lt!232301 (MissingVacant!4192 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32699 (_ BitVec 32)) SeekEntryResult!4192)

(assert (=> b!508896 (= lt!232301 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508897 () Bool)

(declare-fun res!309885 () Bool)

(assert (=> b!508897 (=> (not res!309885) (not e!297624))))

(assert (=> b!508897 (= res!309885 (and (= (size!16093 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16093 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16093 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508898 () Bool)

(assert (=> b!508898 (= e!297625 (= (seekEntryOrOpen!0 (select (arr!15728 a!3235) j!176) a!3235 mask!3524) (Found!4192 j!176)))))

(declare-fun res!309880 () Bool)

(assert (=> start!45978 (=> (not res!309880) (not e!297624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45978 (= res!309880 (validMask!0 mask!3524))))

(assert (=> start!45978 e!297624))

(assert (=> start!45978 true))

(declare-fun array_inv!11611 (array!32699) Bool)

(assert (=> start!45978 (array_inv!11611 a!3235)))

(declare-fun b!508899 () Bool)

(declare-fun res!309883 () Bool)

(assert (=> b!508899 (=> (not res!309883) (not e!297627))))

(assert (=> b!508899 (= res!309883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508900 () Bool)

(declare-fun res!309881 () Bool)

(assert (=> b!508900 (=> (not res!309881) (not e!297624))))

(declare-fun arrayContainsKey!0 (array!32699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508900 (= res!309881 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45978 res!309880) b!508897))

(assert (= (and b!508897 res!309885) b!508892))

(assert (= (and b!508892 res!309884) b!508894))

(assert (= (and b!508894 res!309886) b!508900))

(assert (= (and b!508900 res!309881) b!508896))

(assert (= (and b!508896 res!309882) b!508899))

(assert (= (and b!508899 res!309883) b!508895))

(assert (= (and b!508895 res!309879) b!508893))

(assert (= (and b!508893 res!309887) b!508898))

(declare-fun m!489205 () Bool)

(assert (=> b!508893 m!489205))

(declare-fun m!489207 () Bool)

(assert (=> b!508893 m!489207))

(declare-fun m!489209 () Bool)

(assert (=> b!508893 m!489209))

(declare-fun m!489211 () Bool)

(assert (=> b!508893 m!489211))

(assert (=> b!508893 m!489209))

(assert (=> b!508893 m!489207))

(declare-fun m!489213 () Bool)

(assert (=> b!508893 m!489213))

(declare-fun m!489215 () Bool)

(assert (=> b!508893 m!489215))

(assert (=> b!508893 m!489207))

(declare-fun m!489217 () Bool)

(assert (=> b!508893 m!489217))

(assert (=> b!508893 m!489209))

(declare-fun m!489219 () Bool)

(assert (=> b!508893 m!489219))

(declare-fun m!489221 () Bool)

(assert (=> b!508893 m!489221))

(assert (=> b!508898 m!489209))

(assert (=> b!508898 m!489209))

(declare-fun m!489223 () Bool)

(assert (=> b!508898 m!489223))

(assert (=> b!508892 m!489209))

(assert (=> b!508892 m!489209))

(declare-fun m!489225 () Bool)

(assert (=> b!508892 m!489225))

(declare-fun m!489227 () Bool)

(assert (=> b!508894 m!489227))

(declare-fun m!489229 () Bool)

(assert (=> b!508896 m!489229))

(declare-fun m!489231 () Bool)

(assert (=> b!508900 m!489231))

(declare-fun m!489233 () Bool)

(assert (=> start!45978 m!489233))

(declare-fun m!489235 () Bool)

(assert (=> start!45978 m!489235))

(declare-fun m!489237 () Bool)

(assert (=> b!508899 m!489237))

(declare-fun m!489239 () Bool)

(assert (=> b!508895 m!489239))

(check-sat (not start!45978) (not b!508900) (not b!508893) (not b!508892) (not b!508898) (not b!508896) (not b!508895) (not b!508894) (not b!508899))
(check-sat)
