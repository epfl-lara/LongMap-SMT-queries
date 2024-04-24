; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121796 () Bool)

(assert start!121796)

(declare-fun res!950187 () Bool)

(declare-fun e!800220 () Bool)

(assert (=> start!121796 (=> (not res!950187) (not e!800220))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121796 (= res!950187 (validMask!0 mask!2840))))

(assert (=> start!121796 e!800220))

(assert (=> start!121796 true))

(declare-datatypes ((array!96656 0))(
  ( (array!96657 (arr!46663 (Array (_ BitVec 32) (_ BitVec 64))) (size!47214 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96656)

(declare-fun array_inv!35944 (array!96656) Bool)

(assert (=> start!121796 (array_inv!35944 a!2901)))

(declare-fun b!1413876 () Bool)

(declare-fun res!950186 () Bool)

(assert (=> b!1413876 (=> (not res!950186) (not e!800220))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413876 (= res!950186 (validKeyInArray!0 (select (arr!46663 a!2901) i!1037)))))

(declare-fun lt!622944 () (_ BitVec 64))

(declare-fun lt!622940 () array!96656)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!800217 () Bool)

(declare-datatypes ((SeekEntryResult!10877 0))(
  ( (MissingZero!10877 (index!45888 (_ BitVec 32))) (Found!10877 (index!45889 (_ BitVec 32))) (Intermediate!10877 (undefined!11689 Bool) (index!45890 (_ BitVec 32)) (x!127631 (_ BitVec 32))) (Undefined!10877) (MissingVacant!10877 (index!45891 (_ BitVec 32))) )
))
(declare-fun lt!622943 () SeekEntryResult!10877)

(declare-fun b!1413877 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96656 (_ BitVec 32)) SeekEntryResult!10877)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96656 (_ BitVec 32)) SeekEntryResult!10877)

(assert (=> b!1413877 (= e!800217 (= (seekEntryOrOpen!0 lt!622944 lt!622940 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127631 lt!622943) (index!45890 lt!622943) (index!45890 lt!622943) (select (arr!46663 a!2901) j!112) lt!622940 mask!2840)))))

(declare-fun b!1413878 () Bool)

(declare-fun e!800218 () Bool)

(assert (=> b!1413878 (= e!800220 (not e!800218))))

(declare-fun res!950183 () Bool)

(assert (=> b!1413878 (=> res!950183 e!800218)))

(declare-fun lt!622942 () SeekEntryResult!10877)

(get-info :version)

(assert (=> b!1413878 (= res!950183 (or (not ((_ is Intermediate!10877) lt!622942)) (undefined!11689 lt!622942)))))

(declare-fun e!800221 () Bool)

(assert (=> b!1413878 e!800221))

(declare-fun res!950188 () Bool)

(assert (=> b!1413878 (=> (not res!950188) (not e!800221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96656 (_ BitVec 32)) Bool)

(assert (=> b!1413878 (= res!950188 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47755 0))(
  ( (Unit!47756) )
))
(declare-fun lt!622945 () Unit!47755)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47755)

(assert (=> b!1413878 (= lt!622945 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622946 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96656 (_ BitVec 32)) SeekEntryResult!10877)

(assert (=> b!1413878 (= lt!622942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622946 (select (arr!46663 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413878 (= lt!622946 (toIndex!0 (select (arr!46663 a!2901) j!112) mask!2840))))

(declare-fun b!1413879 () Bool)

(assert (=> b!1413879 (= e!800221 (= (seekEntryOrOpen!0 (select (arr!46663 a!2901) j!112) a!2901 mask!2840) (Found!10877 j!112)))))

(declare-fun b!1413880 () Bool)

(declare-fun res!950190 () Bool)

(assert (=> b!1413880 (=> (not res!950190) (not e!800220))))

(assert (=> b!1413880 (= res!950190 (and (= (size!47214 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47214 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47214 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413881 () Bool)

(declare-fun res!950185 () Bool)

(assert (=> b!1413881 (=> (not res!950185) (not e!800220))))

(assert (=> b!1413881 (= res!950185 (validKeyInArray!0 (select (arr!46663 a!2901) j!112)))))

(declare-fun b!1413882 () Bool)

(declare-fun res!950182 () Bool)

(assert (=> b!1413882 (=> (not res!950182) (not e!800220))))

(declare-datatypes ((List!33169 0))(
  ( (Nil!33166) (Cons!33165 (h!34448 (_ BitVec 64)) (t!47855 List!33169)) )
))
(declare-fun arrayNoDuplicates!0 (array!96656 (_ BitVec 32) List!33169) Bool)

(assert (=> b!1413882 (= res!950182 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33166))))

(declare-fun b!1413883 () Bool)

(declare-fun e!800222 () Bool)

(assert (=> b!1413883 (= e!800218 e!800222)))

(declare-fun res!950191 () Bool)

(assert (=> b!1413883 (=> res!950191 e!800222)))

(assert (=> b!1413883 (= res!950191 (or (= lt!622942 lt!622943) (not ((_ is Intermediate!10877) lt!622943))))))

(assert (=> b!1413883 (= lt!622943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622944 mask!2840) lt!622944 lt!622940 mask!2840))))

(assert (=> b!1413883 (= lt!622944 (select (store (arr!46663 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413883 (= lt!622940 (array!96657 (store (arr!46663 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47214 a!2901)))))

(declare-fun b!1413884 () Bool)

(assert (=> b!1413884 (= e!800222 true)))

(assert (=> b!1413884 e!800217))

(declare-fun res!950189 () Bool)

(assert (=> b!1413884 (=> (not res!950189) (not e!800217))))

(assert (=> b!1413884 (= res!950189 (and (not (undefined!11689 lt!622943)) (= (index!45890 lt!622943) i!1037) (bvslt (x!127631 lt!622943) (x!127631 lt!622942)) (= (select (store (arr!46663 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45890 lt!622943)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622941 () Unit!47755)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47755)

(assert (=> b!1413884 (= lt!622941 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622946 (x!127631 lt!622942) (index!45890 lt!622942) (x!127631 lt!622943) (index!45890 lt!622943) (undefined!11689 lt!622943) mask!2840))))

(declare-fun b!1413885 () Bool)

(declare-fun res!950184 () Bool)

(assert (=> b!1413885 (=> (not res!950184) (not e!800220))))

(assert (=> b!1413885 (= res!950184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121796 res!950187) b!1413880))

(assert (= (and b!1413880 res!950190) b!1413876))

(assert (= (and b!1413876 res!950186) b!1413881))

(assert (= (and b!1413881 res!950185) b!1413885))

(assert (= (and b!1413885 res!950184) b!1413882))

(assert (= (and b!1413882 res!950182) b!1413878))

(assert (= (and b!1413878 res!950188) b!1413879))

(assert (= (and b!1413878 (not res!950183)) b!1413883))

(assert (= (and b!1413883 (not res!950191)) b!1413884))

(assert (= (and b!1413884 res!950189) b!1413877))

(declare-fun m!1304251 () Bool)

(assert (=> b!1413882 m!1304251))

(declare-fun m!1304253 () Bool)

(assert (=> b!1413879 m!1304253))

(assert (=> b!1413879 m!1304253))

(declare-fun m!1304255 () Bool)

(assert (=> b!1413879 m!1304255))

(declare-fun m!1304257 () Bool)

(assert (=> b!1413885 m!1304257))

(assert (=> b!1413881 m!1304253))

(assert (=> b!1413881 m!1304253))

(declare-fun m!1304259 () Bool)

(assert (=> b!1413881 m!1304259))

(declare-fun m!1304261 () Bool)

(assert (=> b!1413883 m!1304261))

(assert (=> b!1413883 m!1304261))

(declare-fun m!1304263 () Bool)

(assert (=> b!1413883 m!1304263))

(declare-fun m!1304265 () Bool)

(assert (=> b!1413883 m!1304265))

(declare-fun m!1304267 () Bool)

(assert (=> b!1413883 m!1304267))

(declare-fun m!1304269 () Bool)

(assert (=> start!121796 m!1304269))

(declare-fun m!1304271 () Bool)

(assert (=> start!121796 m!1304271))

(declare-fun m!1304273 () Bool)

(assert (=> b!1413876 m!1304273))

(assert (=> b!1413876 m!1304273))

(declare-fun m!1304275 () Bool)

(assert (=> b!1413876 m!1304275))

(assert (=> b!1413878 m!1304253))

(declare-fun m!1304277 () Bool)

(assert (=> b!1413878 m!1304277))

(assert (=> b!1413878 m!1304253))

(declare-fun m!1304279 () Bool)

(assert (=> b!1413878 m!1304279))

(assert (=> b!1413878 m!1304253))

(declare-fun m!1304281 () Bool)

(assert (=> b!1413878 m!1304281))

(declare-fun m!1304283 () Bool)

(assert (=> b!1413878 m!1304283))

(declare-fun m!1304285 () Bool)

(assert (=> b!1413877 m!1304285))

(assert (=> b!1413877 m!1304253))

(assert (=> b!1413877 m!1304253))

(declare-fun m!1304287 () Bool)

(assert (=> b!1413877 m!1304287))

(assert (=> b!1413884 m!1304265))

(declare-fun m!1304289 () Bool)

(assert (=> b!1413884 m!1304289))

(declare-fun m!1304291 () Bool)

(assert (=> b!1413884 m!1304291))

(check-sat (not b!1413885) (not b!1413876) (not b!1413878) (not b!1413877) (not b!1413882) (not b!1413881) (not start!121796) (not b!1413883) (not b!1413879) (not b!1413884))
(check-sat)
