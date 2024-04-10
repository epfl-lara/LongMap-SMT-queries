; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45386 () Bool)

(assert start!45386)

(declare-fun b!498648 () Bool)

(declare-datatypes ((Unit!14892 0))(
  ( (Unit!14893) )
))
(declare-fun e!292250 () Unit!14892)

(declare-fun Unit!14894 () Unit!14892)

(assert (=> b!498648 (= e!292250 Unit!14894)))

(declare-fun e!292254 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32211 0))(
  ( (array!32212 (arr!15487 (Array (_ BitVec 32) (_ BitVec 64))) (size!15851 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32211)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!498649 () Bool)

(declare-datatypes ((SeekEntryResult!3954 0))(
  ( (MissingZero!3954 (index!17998 (_ BitVec 32))) (Found!3954 (index!17999 (_ BitVec 32))) (Intermediate!3954 (undefined!4766 Bool) (index!18000 (_ BitVec 32)) (x!47047 (_ BitVec 32))) (Undefined!3954) (MissingVacant!3954 (index!18001 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32211 (_ BitVec 32)) SeekEntryResult!3954)

(assert (=> b!498649 (= e!292254 (= (seekEntryOrOpen!0 (select (arr!15487 a!3235) j!176) a!3235 mask!3524) (Found!3954 j!176)))))

(declare-fun b!498650 () Bool)

(declare-fun res!300716 () Bool)

(declare-fun e!292247 () Bool)

(assert (=> b!498650 (=> (not res!300716) (not e!292247))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498650 (= res!300716 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498651 () Bool)

(declare-fun res!300720 () Bool)

(assert (=> b!498651 (=> (not res!300720) (not e!292247))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498651 (= res!300720 (and (= (size!15851 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15851 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15851 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498652 () Bool)

(declare-fun res!300722 () Bool)

(declare-fun e!292251 () Bool)

(assert (=> b!498652 (=> (not res!300722) (not e!292251))))

(declare-datatypes ((List!9645 0))(
  ( (Nil!9642) (Cons!9641 (h!10515 (_ BitVec 64)) (t!15873 List!9645)) )
))
(declare-fun arrayNoDuplicates!0 (array!32211 (_ BitVec 32) List!9645) Bool)

(assert (=> b!498652 (= res!300722 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9642))))

(declare-fun b!498653 () Bool)

(declare-fun Unit!14895 () Unit!14892)

(assert (=> b!498653 (= e!292250 Unit!14895)))

(declare-fun lt!225921 () SeekEntryResult!3954)

(declare-fun lt!225920 () (_ BitVec 32))

(declare-fun lt!225919 () Unit!14892)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32211 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14892)

(assert (=> b!498653 (= lt!225919 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225920 #b00000000000000000000000000000000 (index!18000 lt!225921) (x!47047 lt!225921) mask!3524))))

(declare-fun lt!225924 () array!32211)

(declare-fun res!300727 () Bool)

(declare-fun lt!225926 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32211 (_ BitVec 32)) SeekEntryResult!3954)

(assert (=> b!498653 (= res!300727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225920 lt!225926 lt!225924 mask!3524) (Intermediate!3954 false (index!18000 lt!225921) (x!47047 lt!225921))))))

(declare-fun e!292248 () Bool)

(assert (=> b!498653 (=> (not res!300727) (not e!292248))))

(assert (=> b!498653 e!292248))

(declare-fun b!498654 () Bool)

(declare-fun res!300718 () Bool)

(assert (=> b!498654 (=> (not res!300718) (not e!292251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32211 (_ BitVec 32)) Bool)

(assert (=> b!498654 (= res!300718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498655 () Bool)

(assert (=> b!498655 (= e!292247 e!292251)))

(declare-fun res!300717 () Bool)

(assert (=> b!498655 (=> (not res!300717) (not e!292251))))

(declare-fun lt!225922 () SeekEntryResult!3954)

(assert (=> b!498655 (= res!300717 (or (= lt!225922 (MissingZero!3954 i!1204)) (= lt!225922 (MissingVacant!3954 i!1204))))))

(assert (=> b!498655 (= lt!225922 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498656 () Bool)

(declare-fun res!300725 () Bool)

(assert (=> b!498656 (=> (not res!300725) (not e!292247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498656 (= res!300725 (validKeyInArray!0 k0!2280))))

(declare-fun res!300728 () Bool)

(assert (=> start!45386 (=> (not res!300728) (not e!292247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45386 (= res!300728 (validMask!0 mask!3524))))

(assert (=> start!45386 e!292247))

(assert (=> start!45386 true))

(declare-fun array_inv!11283 (array!32211) Bool)

(assert (=> start!45386 (array_inv!11283 a!3235)))

(declare-fun b!498657 () Bool)

(declare-fun e!292249 () Bool)

(declare-fun e!292252 () Bool)

(assert (=> b!498657 (= e!292249 e!292252)))

(declare-fun res!300719 () Bool)

(assert (=> b!498657 (=> res!300719 e!292252)))

(assert (=> b!498657 (= res!300719 (or (bvsgt #b00000000000000000000000000000000 (x!47047 lt!225921)) (bvsgt (x!47047 lt!225921) #b01111111111111111111111111111110) (bvslt lt!225920 #b00000000000000000000000000000000) (bvsge lt!225920 (size!15851 a!3235)) (bvslt (index!18000 lt!225921) #b00000000000000000000000000000000) (bvsge (index!18000 lt!225921) (size!15851 a!3235)) (not (= lt!225921 (Intermediate!3954 false (index!18000 lt!225921) (x!47047 lt!225921))))))))

(assert (=> b!498657 (and (or (= (select (arr!15487 a!3235) (index!18000 lt!225921)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15487 a!3235) (index!18000 lt!225921)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15487 a!3235) (index!18000 lt!225921)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15487 a!3235) (index!18000 lt!225921)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225927 () Unit!14892)

(assert (=> b!498657 (= lt!225927 e!292250)))

(declare-fun c!59243 () Bool)

(assert (=> b!498657 (= c!59243 (= (select (arr!15487 a!3235) (index!18000 lt!225921)) (select (arr!15487 a!3235) j!176)))))

(assert (=> b!498657 (and (bvslt (x!47047 lt!225921) #b01111111111111111111111111111110) (or (= (select (arr!15487 a!3235) (index!18000 lt!225921)) (select (arr!15487 a!3235) j!176)) (= (select (arr!15487 a!3235) (index!18000 lt!225921)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15487 a!3235) (index!18000 lt!225921)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498658 () Bool)

(declare-fun res!300721 () Bool)

(assert (=> b!498658 (=> (not res!300721) (not e!292247))))

(assert (=> b!498658 (= res!300721 (validKeyInArray!0 (select (arr!15487 a!3235) j!176)))))

(declare-fun b!498659 () Bool)

(declare-fun res!300726 () Bool)

(assert (=> b!498659 (=> res!300726 e!292249)))

(get-info :version)

(assert (=> b!498659 (= res!300726 (or (undefined!4766 lt!225921) (not ((_ is Intermediate!3954) lt!225921))))))

(declare-fun b!498660 () Bool)

(assert (=> b!498660 (= e!292251 (not e!292249))))

(declare-fun res!300723 () Bool)

(assert (=> b!498660 (=> res!300723 e!292249)))

(declare-fun lt!225925 () (_ BitVec 32))

(assert (=> b!498660 (= res!300723 (= lt!225921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225925 lt!225926 lt!225924 mask!3524)))))

(assert (=> b!498660 (= lt!225921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225920 (select (arr!15487 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498660 (= lt!225925 (toIndex!0 lt!225926 mask!3524))))

(assert (=> b!498660 (= lt!225926 (select (store (arr!15487 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498660 (= lt!225920 (toIndex!0 (select (arr!15487 a!3235) j!176) mask!3524))))

(assert (=> b!498660 (= lt!225924 (array!32212 (store (arr!15487 a!3235) i!1204 k0!2280) (size!15851 a!3235)))))

(assert (=> b!498660 e!292254))

(declare-fun res!300724 () Bool)

(assert (=> b!498660 (=> (not res!300724) (not e!292254))))

(assert (=> b!498660 (= res!300724 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225928 () Unit!14892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14892)

(assert (=> b!498660 (= lt!225928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498661 () Bool)

(assert (=> b!498661 (= e!292252 true)))

(declare-fun lt!225923 () SeekEntryResult!3954)

(assert (=> b!498661 (= lt!225923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225920 lt!225926 lt!225924 mask!3524))))

(declare-fun b!498662 () Bool)

(assert (=> b!498662 (= e!292248 false)))

(assert (= (and start!45386 res!300728) b!498651))

(assert (= (and b!498651 res!300720) b!498658))

(assert (= (and b!498658 res!300721) b!498656))

(assert (= (and b!498656 res!300725) b!498650))

(assert (= (and b!498650 res!300716) b!498655))

(assert (= (and b!498655 res!300717) b!498654))

(assert (= (and b!498654 res!300718) b!498652))

(assert (= (and b!498652 res!300722) b!498660))

(assert (= (and b!498660 res!300724) b!498649))

(assert (= (and b!498660 (not res!300723)) b!498659))

(assert (= (and b!498659 (not res!300726)) b!498657))

(assert (= (and b!498657 c!59243) b!498653))

(assert (= (and b!498657 (not c!59243)) b!498648))

(assert (= (and b!498653 res!300727) b!498662))

(assert (= (and b!498657 (not res!300719)) b!498661))

(declare-fun m!479901 () Bool)

(assert (=> b!498655 m!479901))

(declare-fun m!479903 () Bool)

(assert (=> b!498650 m!479903))

(declare-fun m!479905 () Bool)

(assert (=> start!45386 m!479905))

(declare-fun m!479907 () Bool)

(assert (=> start!45386 m!479907))

(declare-fun m!479909 () Bool)

(assert (=> b!498657 m!479909))

(declare-fun m!479911 () Bool)

(assert (=> b!498657 m!479911))

(assert (=> b!498658 m!479911))

(assert (=> b!498658 m!479911))

(declare-fun m!479913 () Bool)

(assert (=> b!498658 m!479913))

(declare-fun m!479915 () Bool)

(assert (=> b!498653 m!479915))

(declare-fun m!479917 () Bool)

(assert (=> b!498653 m!479917))

(assert (=> b!498661 m!479917))

(declare-fun m!479919 () Bool)

(assert (=> b!498652 m!479919))

(assert (=> b!498660 m!479911))

(declare-fun m!479921 () Bool)

(assert (=> b!498660 m!479921))

(declare-fun m!479923 () Bool)

(assert (=> b!498660 m!479923))

(declare-fun m!479925 () Bool)

(assert (=> b!498660 m!479925))

(assert (=> b!498660 m!479911))

(declare-fun m!479927 () Bool)

(assert (=> b!498660 m!479927))

(assert (=> b!498660 m!479911))

(declare-fun m!479929 () Bool)

(assert (=> b!498660 m!479929))

(declare-fun m!479931 () Bool)

(assert (=> b!498660 m!479931))

(declare-fun m!479933 () Bool)

(assert (=> b!498660 m!479933))

(declare-fun m!479935 () Bool)

(assert (=> b!498660 m!479935))

(assert (=> b!498649 m!479911))

(assert (=> b!498649 m!479911))

(declare-fun m!479937 () Bool)

(assert (=> b!498649 m!479937))

(declare-fun m!479939 () Bool)

(assert (=> b!498654 m!479939))

(declare-fun m!479941 () Bool)

(assert (=> b!498656 m!479941))

(check-sat (not b!498650) (not b!498653) (not b!498661) (not b!498652) (not b!498660) (not start!45386) (not b!498655) (not b!498654) (not b!498649) (not b!498658) (not b!498656))
(check-sat)
