; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120398 () Bool)

(assert start!120398)

(declare-fun b!1400391 () Bool)

(declare-fun res!938461 () Bool)

(declare-fun e!792900 () Bool)

(assert (=> b!1400391 (=> (not res!938461) (not e!792900))))

(declare-datatypes ((array!95792 0))(
  ( (array!95793 (arr!46246 (Array (_ BitVec 32) (_ BitVec 64))) (size!46797 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95792)

(declare-datatypes ((List!32752 0))(
  ( (Nil!32749) (Cons!32748 (h!34001 (_ BitVec 64)) (t!47438 List!32752)) )
))
(declare-fun arrayNoDuplicates!0 (array!95792 (_ BitVec 32) List!32752) Bool)

(assert (=> b!1400391 (= res!938461 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32749))))

(declare-fun b!1400392 () Bool)

(declare-fun res!938464 () Bool)

(assert (=> b!1400392 (=> (not res!938464) (not e!792900))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95792 (_ BitVec 32)) Bool)

(assert (=> b!1400392 (= res!938464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400393 () Bool)

(declare-fun res!938456 () Bool)

(assert (=> b!1400393 (=> (not res!938456) (not e!792900))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400393 (= res!938456 (and (= (size!46797 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46797 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46797 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400394 () Bool)

(declare-fun res!938455 () Bool)

(assert (=> b!1400394 (=> (not res!938455) (not e!792900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400394 (= res!938455 (validKeyInArray!0 (select (arr!46246 a!2901) i!1037)))))

(declare-fun b!1400395 () Bool)

(declare-fun res!938459 () Bool)

(assert (=> b!1400395 (=> (not res!938459) (not e!792900))))

(assert (=> b!1400395 (= res!938459 (validKeyInArray!0 (select (arr!46246 a!2901) j!112)))))

(declare-fun b!1400396 () Bool)

(declare-fun e!792899 () Bool)

(declare-datatypes ((SeekEntryResult!10466 0))(
  ( (MissingZero!10466 (index!44238 (_ BitVec 32))) (Found!10466 (index!44239 (_ BitVec 32))) (Intermediate!10466 (undefined!11278 Bool) (index!44240 (_ BitVec 32)) (x!126036 (_ BitVec 32))) (Undefined!10466) (MissingVacant!10466 (index!44241 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95792 (_ BitVec 32)) SeekEntryResult!10466)

(assert (=> b!1400396 (= e!792899 (= (seekEntryOrOpen!0 (select (arr!46246 a!2901) j!112) a!2901 mask!2840) (Found!10466 j!112)))))

(declare-fun res!938457 () Bool)

(assert (=> start!120398 (=> (not res!938457) (not e!792900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120398 (= res!938457 (validMask!0 mask!2840))))

(assert (=> start!120398 e!792900))

(assert (=> start!120398 true))

(declare-fun array_inv!35527 (array!95792) Bool)

(assert (=> start!120398 (array_inv!35527 a!2901)))

(declare-fun b!1400397 () Bool)

(declare-fun e!792901 () Bool)

(assert (=> b!1400397 (= e!792900 (not e!792901))))

(declare-fun res!938463 () Bool)

(assert (=> b!1400397 (=> res!938463 e!792901)))

(declare-fun lt!615829 () SeekEntryResult!10466)

(get-info :version)

(assert (=> b!1400397 (= res!938463 (or (not ((_ is Intermediate!10466) lt!615829)) (undefined!11278 lt!615829)))))

(assert (=> b!1400397 e!792899))

(declare-fun res!938462 () Bool)

(assert (=> b!1400397 (=> (not res!938462) (not e!792899))))

(assert (=> b!1400397 (= res!938462 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46963 0))(
  ( (Unit!46964) )
))
(declare-fun lt!615827 () Unit!46963)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46963)

(assert (=> b!1400397 (= lt!615827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615824 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95792 (_ BitVec 32)) SeekEntryResult!10466)

(assert (=> b!1400397 (= lt!615829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615824 (select (arr!46246 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400397 (= lt!615824 (toIndex!0 (select (arr!46246 a!2901) j!112) mask!2840))))

(declare-fun b!1400398 () Bool)

(declare-fun e!792897 () Bool)

(assert (=> b!1400398 (= e!792897 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun e!792898 () Bool)

(assert (=> b!1400398 e!792898))

(declare-fun res!938458 () Bool)

(assert (=> b!1400398 (=> (not res!938458) (not e!792898))))

(declare-fun lt!615828 () SeekEntryResult!10466)

(assert (=> b!1400398 (= res!938458 (and (not (undefined!11278 lt!615828)) (= (index!44240 lt!615828) i!1037) (bvslt (x!126036 lt!615828) (x!126036 lt!615829)) (= (select (store (arr!46246 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44240 lt!615828)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!615830 () Unit!46963)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46963)

(assert (=> b!1400398 (= lt!615830 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615824 (x!126036 lt!615829) (index!44240 lt!615829) (x!126036 lt!615828) (index!44240 lt!615828) (undefined!11278 lt!615828) mask!2840))))

(declare-fun lt!615826 () array!95792)

(declare-fun lt!615825 () (_ BitVec 64))

(declare-fun b!1400399 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95792 (_ BitVec 32)) SeekEntryResult!10466)

(assert (=> b!1400399 (= e!792898 (= (seekEntryOrOpen!0 lt!615825 lt!615826 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126036 lt!615828) (index!44240 lt!615828) (index!44240 lt!615828) (select (arr!46246 a!2901) j!112) lt!615826 mask!2840)))))

(declare-fun b!1400400 () Bool)

(assert (=> b!1400400 (= e!792901 e!792897)))

(declare-fun res!938460 () Bool)

(assert (=> b!1400400 (=> res!938460 e!792897)))

(assert (=> b!1400400 (= res!938460 (or (= lt!615829 lt!615828) (not ((_ is Intermediate!10466) lt!615828))))))

(assert (=> b!1400400 (= lt!615828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615825 mask!2840) lt!615825 lt!615826 mask!2840))))

(assert (=> b!1400400 (= lt!615825 (select (store (arr!46246 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400400 (= lt!615826 (array!95793 (store (arr!46246 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46797 a!2901)))))

(assert (= (and start!120398 res!938457) b!1400393))

(assert (= (and b!1400393 res!938456) b!1400394))

(assert (= (and b!1400394 res!938455) b!1400395))

(assert (= (and b!1400395 res!938459) b!1400392))

(assert (= (and b!1400392 res!938464) b!1400391))

(assert (= (and b!1400391 res!938461) b!1400397))

(assert (= (and b!1400397 res!938462) b!1400396))

(assert (= (and b!1400397 (not res!938463)) b!1400400))

(assert (= (and b!1400400 (not res!938460)) b!1400398))

(assert (= (and b!1400398 res!938458) b!1400399))

(declare-fun m!1287883 () Bool)

(assert (=> b!1400395 m!1287883))

(assert (=> b!1400395 m!1287883))

(declare-fun m!1287885 () Bool)

(assert (=> b!1400395 m!1287885))

(declare-fun m!1287887 () Bool)

(assert (=> b!1400398 m!1287887))

(declare-fun m!1287889 () Bool)

(assert (=> b!1400398 m!1287889))

(declare-fun m!1287891 () Bool)

(assert (=> b!1400398 m!1287891))

(declare-fun m!1287893 () Bool)

(assert (=> b!1400399 m!1287893))

(assert (=> b!1400399 m!1287883))

(assert (=> b!1400399 m!1287883))

(declare-fun m!1287895 () Bool)

(assert (=> b!1400399 m!1287895))

(declare-fun m!1287897 () Bool)

(assert (=> b!1400400 m!1287897))

(assert (=> b!1400400 m!1287897))

(declare-fun m!1287899 () Bool)

(assert (=> b!1400400 m!1287899))

(assert (=> b!1400400 m!1287887))

(declare-fun m!1287901 () Bool)

(assert (=> b!1400400 m!1287901))

(assert (=> b!1400396 m!1287883))

(assert (=> b!1400396 m!1287883))

(declare-fun m!1287903 () Bool)

(assert (=> b!1400396 m!1287903))

(declare-fun m!1287905 () Bool)

(assert (=> b!1400391 m!1287905))

(declare-fun m!1287907 () Bool)

(assert (=> b!1400392 m!1287907))

(declare-fun m!1287909 () Bool)

(assert (=> start!120398 m!1287909))

(declare-fun m!1287911 () Bool)

(assert (=> start!120398 m!1287911))

(declare-fun m!1287913 () Bool)

(assert (=> b!1400394 m!1287913))

(assert (=> b!1400394 m!1287913))

(declare-fun m!1287915 () Bool)

(assert (=> b!1400394 m!1287915))

(assert (=> b!1400397 m!1287883))

(declare-fun m!1287917 () Bool)

(assert (=> b!1400397 m!1287917))

(assert (=> b!1400397 m!1287883))

(declare-fun m!1287919 () Bool)

(assert (=> b!1400397 m!1287919))

(assert (=> b!1400397 m!1287883))

(declare-fun m!1287921 () Bool)

(assert (=> b!1400397 m!1287921))

(declare-fun m!1287923 () Bool)

(assert (=> b!1400397 m!1287923))

(check-sat (not b!1400398) (not b!1400396) (not b!1400397) (not b!1400400) (not b!1400395) (not b!1400399) (not b!1400392) (not b!1400391) (not b!1400394) (not start!120398))
(check-sat)
