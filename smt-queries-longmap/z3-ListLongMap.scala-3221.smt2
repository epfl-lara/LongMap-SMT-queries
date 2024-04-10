; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45074 () Bool)

(assert start!45074)

(declare-fun b!494756 () Bool)

(declare-fun res!297330 () Bool)

(declare-fun e!290312 () Bool)

(assert (=> b!494756 (=> (not res!297330) (not e!290312))))

(declare-datatypes ((array!32019 0))(
  ( (array!32020 (arr!15394 (Array (_ BitVec 32) (_ BitVec 64))) (size!15758 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32019)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494756 (= res!297330 (validKeyInArray!0 (select (arr!15394 a!3235) j!176)))))

(declare-fun res!297332 () Bool)

(assert (=> start!45074 (=> (not res!297332) (not e!290312))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45074 (= res!297332 (validMask!0 mask!3524))))

(assert (=> start!45074 e!290312))

(assert (=> start!45074 true))

(declare-fun array_inv!11190 (array!32019) Bool)

(assert (=> start!45074 (array_inv!11190 a!3235)))

(declare-fun b!494757 () Bool)

(declare-fun e!290311 () Bool)

(assert (=> b!494757 (= e!290311 true)))

(declare-datatypes ((SeekEntryResult!3861 0))(
  ( (MissingZero!3861 (index!17623 (_ BitVec 32))) (Found!3861 (index!17624 (_ BitVec 32))) (Intermediate!3861 (undefined!4673 Bool) (index!17625 (_ BitVec 32)) (x!46691 (_ BitVec 32))) (Undefined!3861) (MissingVacant!3861 (index!17626 (_ BitVec 32))) )
))
(declare-fun lt!223962 () SeekEntryResult!3861)

(assert (=> b!494757 (= lt!223962 Undefined!3861)))

(declare-fun b!494758 () Bool)

(declare-fun res!297335 () Bool)

(assert (=> b!494758 (=> (not res!297335) (not e!290312))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494758 (= res!297335 (and (= (size!15758 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15758 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15758 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494759 () Bool)

(declare-fun res!297326 () Bool)

(assert (=> b!494759 (=> (not res!297326) (not e!290312))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494759 (= res!297326 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494760 () Bool)

(declare-fun res!297331 () Bool)

(declare-fun e!290313 () Bool)

(assert (=> b!494760 (=> (not res!297331) (not e!290313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32019 (_ BitVec 32)) Bool)

(assert (=> b!494760 (= res!297331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494761 () Bool)

(declare-fun res!297334 () Bool)

(assert (=> b!494761 (=> (not res!297334) (not e!290313))))

(declare-datatypes ((List!9552 0))(
  ( (Nil!9549) (Cons!9548 (h!10416 (_ BitVec 64)) (t!15780 List!9552)) )
))
(declare-fun arrayNoDuplicates!0 (array!32019 (_ BitVec 32) List!9552) Bool)

(assert (=> b!494761 (= res!297334 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9549))))

(declare-fun b!494762 () Bool)

(declare-fun res!297328 () Bool)

(assert (=> b!494762 (=> res!297328 e!290311)))

(declare-fun lt!223961 () SeekEntryResult!3861)

(get-info :version)

(assert (=> b!494762 (= res!297328 (or (not ((_ is Intermediate!3861) lt!223961)) (not (undefined!4673 lt!223961))))))

(declare-fun b!494763 () Bool)

(assert (=> b!494763 (= e!290312 e!290313)))

(declare-fun res!297333 () Bool)

(assert (=> b!494763 (=> (not res!297333) (not e!290313))))

(declare-fun lt!223966 () SeekEntryResult!3861)

(assert (=> b!494763 (= res!297333 (or (= lt!223966 (MissingZero!3861 i!1204)) (= lt!223966 (MissingVacant!3861 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32019 (_ BitVec 32)) SeekEntryResult!3861)

(assert (=> b!494763 (= lt!223966 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494764 () Bool)

(declare-fun res!297327 () Bool)

(assert (=> b!494764 (=> (not res!297327) (not e!290312))))

(assert (=> b!494764 (= res!297327 (validKeyInArray!0 k0!2280))))

(declare-fun b!494765 () Bool)

(assert (=> b!494765 (= e!290313 (not e!290311))))

(declare-fun res!297329 () Bool)

(assert (=> b!494765 (=> res!297329 e!290311)))

(declare-fun lt!223965 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32019 (_ BitVec 32)) SeekEntryResult!3861)

(assert (=> b!494765 (= res!297329 (= lt!223961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223965 (select (store (arr!15394 a!3235) i!1204 k0!2280) j!176) (array!32020 (store (arr!15394 a!3235) i!1204 k0!2280) (size!15758 a!3235)) mask!3524)))))

(declare-fun lt!223964 () (_ BitVec 32))

(assert (=> b!494765 (= lt!223961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223964 (select (arr!15394 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494765 (= lt!223965 (toIndex!0 (select (store (arr!15394 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494765 (= lt!223964 (toIndex!0 (select (arr!15394 a!3235) j!176) mask!3524))))

(assert (=> b!494765 (= lt!223962 (Found!3861 j!176))))

(assert (=> b!494765 (= lt!223962 (seekEntryOrOpen!0 (select (arr!15394 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494765 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14668 0))(
  ( (Unit!14669) )
))
(declare-fun lt!223963 () Unit!14668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14668)

(assert (=> b!494765 (= lt!223963 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45074 res!297332) b!494758))

(assert (= (and b!494758 res!297335) b!494756))

(assert (= (and b!494756 res!297330) b!494764))

(assert (= (and b!494764 res!297327) b!494759))

(assert (= (and b!494759 res!297326) b!494763))

(assert (= (and b!494763 res!297333) b!494760))

(assert (= (and b!494760 res!297331) b!494761))

(assert (= (and b!494761 res!297334) b!494765))

(assert (= (and b!494765 (not res!297329)) b!494762))

(assert (= (and b!494762 (not res!297328)) b!494757))

(declare-fun m!475863 () Bool)

(assert (=> b!494764 m!475863))

(declare-fun m!475865 () Bool)

(assert (=> b!494756 m!475865))

(assert (=> b!494756 m!475865))

(declare-fun m!475867 () Bool)

(assert (=> b!494756 m!475867))

(declare-fun m!475869 () Bool)

(assert (=> b!494761 m!475869))

(declare-fun m!475871 () Bool)

(assert (=> start!45074 m!475871))

(declare-fun m!475873 () Bool)

(assert (=> start!45074 m!475873))

(declare-fun m!475875 () Bool)

(assert (=> b!494759 m!475875))

(declare-fun m!475877 () Bool)

(assert (=> b!494760 m!475877))

(declare-fun m!475879 () Bool)

(assert (=> b!494765 m!475879))

(declare-fun m!475881 () Bool)

(assert (=> b!494765 m!475881))

(declare-fun m!475883 () Bool)

(assert (=> b!494765 m!475883))

(assert (=> b!494765 m!475883))

(declare-fun m!475885 () Bool)

(assert (=> b!494765 m!475885))

(assert (=> b!494765 m!475865))

(declare-fun m!475887 () Bool)

(assert (=> b!494765 m!475887))

(assert (=> b!494765 m!475865))

(declare-fun m!475889 () Bool)

(assert (=> b!494765 m!475889))

(assert (=> b!494765 m!475865))

(declare-fun m!475891 () Bool)

(assert (=> b!494765 m!475891))

(assert (=> b!494765 m!475883))

(declare-fun m!475893 () Bool)

(assert (=> b!494765 m!475893))

(assert (=> b!494765 m!475865))

(declare-fun m!475895 () Bool)

(assert (=> b!494765 m!475895))

(declare-fun m!475897 () Bool)

(assert (=> b!494763 m!475897))

(check-sat (not start!45074) (not b!494760) (not b!494759) (not b!494764) (not b!494756) (not b!494765) (not b!494763) (not b!494761))
(check-sat)
