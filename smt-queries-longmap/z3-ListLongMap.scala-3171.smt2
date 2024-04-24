; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44642 () Bool)

(assert start!44642)

(declare-fun b!489833 () Bool)

(declare-fun res!292828 () Bool)

(declare-fun e!288027 () Bool)

(assert (=> b!489833 (=> (not res!292828) (not e!288027))))

(declare-datatypes ((array!31702 0))(
  ( (array!31703 (arr!15238 (Array (_ BitVec 32) (_ BitVec 64))) (size!15602 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31702)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489833 (= res!292828 (validKeyInArray!0 (select (arr!15238 a!3235) j!176)))))

(declare-fun e!288026 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!489834 () Bool)

(declare-datatypes ((SeekEntryResult!3661 0))(
  ( (MissingZero!3661 (index!16823 (_ BitVec 32))) (Found!3661 (index!16824 (_ BitVec 32))) (Intermediate!3661 (undefined!4473 Bool) (index!16825 (_ BitVec 32)) (x!46076 (_ BitVec 32))) (Undefined!3661) (MissingVacant!3661 (index!16826 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31702 (_ BitVec 32)) SeekEntryResult!3661)

(assert (=> b!489834 (= e!288026 (= (seekEntryOrOpen!0 (select (arr!15238 a!3235) j!176) a!3235 mask!3524) (Found!3661 j!176)))))

(declare-fun b!489835 () Bool)

(declare-fun res!292823 () Bool)

(assert (=> b!489835 (=> (not res!292823) (not e!288027))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489835 (= res!292823 (and (= (size!15602 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15602 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15602 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489836 () Bool)

(declare-fun res!292827 () Bool)

(assert (=> b!489836 (=> (not res!292827) (not e!288027))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!489836 (= res!292827 (validKeyInArray!0 k0!2280))))

(declare-fun b!489837 () Bool)

(declare-fun e!288024 () Bool)

(assert (=> b!489837 (= e!288027 e!288024)))

(declare-fun res!292824 () Bool)

(assert (=> b!489837 (=> (not res!292824) (not e!288024))))

(declare-fun lt!221146 () SeekEntryResult!3661)

(assert (=> b!489837 (= res!292824 (or (= lt!221146 (MissingZero!3661 i!1204)) (= lt!221146 (MissingVacant!3661 i!1204))))))

(assert (=> b!489837 (= lt!221146 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489838 () Bool)

(declare-fun res!292825 () Bool)

(assert (=> b!489838 (=> (not res!292825) (not e!288024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31702 (_ BitVec 32)) Bool)

(assert (=> b!489838 (= res!292825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489839 () Bool)

(assert (=> b!489839 (= e!288024 (not true))))

(declare-fun lt!221145 () (_ BitVec 32))

(declare-fun lt!221143 () SeekEntryResult!3661)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31702 (_ BitVec 32)) SeekEntryResult!3661)

(assert (=> b!489839 (= lt!221143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221145 (select (store (arr!15238 a!3235) i!1204 k0!2280) j!176) (array!31703 (store (arr!15238 a!3235) i!1204 k0!2280) (size!15602 a!3235)) mask!3524))))

(declare-fun lt!221144 () (_ BitVec 32))

(declare-fun lt!221141 () SeekEntryResult!3661)

(assert (=> b!489839 (= lt!221141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221144 (select (arr!15238 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489839 (= lt!221145 (toIndex!0 (select (store (arr!15238 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489839 (= lt!221144 (toIndex!0 (select (arr!15238 a!3235) j!176) mask!3524))))

(assert (=> b!489839 e!288026))

(declare-fun res!292829 () Bool)

(assert (=> b!489839 (=> (not res!292829) (not e!288026))))

(assert (=> b!489839 (= res!292829 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14329 0))(
  ( (Unit!14330) )
))
(declare-fun lt!221142 () Unit!14329)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14329)

(assert (=> b!489839 (= lt!221142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489840 () Bool)

(declare-fun res!292826 () Bool)

(assert (=> b!489840 (=> (not res!292826) (not e!288024))))

(declare-datatypes ((List!9303 0))(
  ( (Nil!9300) (Cons!9299 (h!10161 (_ BitVec 64)) (t!15523 List!9303)) )
))
(declare-fun arrayNoDuplicates!0 (array!31702 (_ BitVec 32) List!9303) Bool)

(assert (=> b!489840 (= res!292826 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9300))))

(declare-fun res!292830 () Bool)

(assert (=> start!44642 (=> (not res!292830) (not e!288027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44642 (= res!292830 (validMask!0 mask!3524))))

(assert (=> start!44642 e!288027))

(assert (=> start!44642 true))

(declare-fun array_inv!11097 (array!31702) Bool)

(assert (=> start!44642 (array_inv!11097 a!3235)))

(declare-fun b!489841 () Bool)

(declare-fun res!292831 () Bool)

(assert (=> b!489841 (=> (not res!292831) (not e!288027))))

(declare-fun arrayContainsKey!0 (array!31702 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489841 (= res!292831 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44642 res!292830) b!489835))

(assert (= (and b!489835 res!292823) b!489833))

(assert (= (and b!489833 res!292828) b!489836))

(assert (= (and b!489836 res!292827) b!489841))

(assert (= (and b!489841 res!292831) b!489837))

(assert (= (and b!489837 res!292824) b!489838))

(assert (= (and b!489838 res!292825) b!489840))

(assert (= (and b!489840 res!292826) b!489839))

(assert (= (and b!489839 res!292829) b!489834))

(declare-fun m!470005 () Bool)

(assert (=> b!489838 m!470005))

(declare-fun m!470007 () Bool)

(assert (=> b!489833 m!470007))

(assert (=> b!489833 m!470007))

(declare-fun m!470009 () Bool)

(assert (=> b!489833 m!470009))

(declare-fun m!470011 () Bool)

(assert (=> b!489837 m!470011))

(declare-fun m!470013 () Bool)

(assert (=> b!489836 m!470013))

(declare-fun m!470015 () Bool)

(assert (=> b!489840 m!470015))

(declare-fun m!470017 () Bool)

(assert (=> b!489839 m!470017))

(declare-fun m!470019 () Bool)

(assert (=> b!489839 m!470019))

(declare-fun m!470021 () Bool)

(assert (=> b!489839 m!470021))

(assert (=> b!489839 m!470007))

(declare-fun m!470023 () Bool)

(assert (=> b!489839 m!470023))

(assert (=> b!489839 m!470007))

(declare-fun m!470025 () Bool)

(assert (=> b!489839 m!470025))

(assert (=> b!489839 m!470007))

(declare-fun m!470027 () Bool)

(assert (=> b!489839 m!470027))

(assert (=> b!489839 m!470021))

(declare-fun m!470029 () Bool)

(assert (=> b!489839 m!470029))

(assert (=> b!489839 m!470021))

(declare-fun m!470031 () Bool)

(assert (=> b!489839 m!470031))

(declare-fun m!470033 () Bool)

(assert (=> b!489841 m!470033))

(declare-fun m!470035 () Bool)

(assert (=> start!44642 m!470035))

(declare-fun m!470037 () Bool)

(assert (=> start!44642 m!470037))

(assert (=> b!489834 m!470007))

(assert (=> b!489834 m!470007))

(declare-fun m!470039 () Bool)

(assert (=> b!489834 m!470039))

(check-sat (not b!489838) (not b!489834) (not start!44642) (not b!489840) (not b!489841) (not b!489837) (not b!489833) (not b!489836) (not b!489839))
(check-sat)
