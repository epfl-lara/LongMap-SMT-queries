; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92568 () Bool)

(assert start!92568)

(declare-fun b!1050854 () Bool)

(declare-fun e!596323 () Bool)

(declare-fun e!596326 () Bool)

(assert (=> b!1050854 (= e!596323 e!596326)))

(declare-fun res!699178 () Bool)

(assert (=> b!1050854 (=> res!699178 e!596326)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66184 0))(
  ( (array!66185 (arr!31825 (Array (_ BitVec 32) (_ BitVec 64))) (size!32362 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66184)

(assert (=> b!1050854 (= res!699178 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32362 a!3488)))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050854 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34339 0))(
  ( (Unit!34340) )
))
(declare-fun lt!464068 () Unit!34339)

(declare-fun lt!464071 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66184 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34339)

(assert (=> b!1050854 (= lt!464068 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464071 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22107 0))(
  ( (Nil!22104) (Cons!22103 (h!23321 (_ BitVec 64)) (t!31406 List!22107)) )
))
(declare-fun arrayNoDuplicates!0 (array!66184 (_ BitVec 32) List!22107) Bool)

(assert (=> b!1050854 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22104)))

(declare-fun lt!464070 () Unit!34339)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66184 (_ BitVec 32) (_ BitVec 32)) Unit!34339)

(assert (=> b!1050854 (= lt!464070 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050855 () Bool)

(assert (=> b!1050855 (= e!596326 true)))

(declare-fun lt!464072 () Bool)

(declare-fun contains!6137 (List!22107 (_ BitVec 64)) Bool)

(assert (=> b!1050855 (= lt!464072 (contains!6137 Nil!22104 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050856 () Bool)

(declare-fun res!699176 () Bool)

(declare-fun e!596328 () Bool)

(assert (=> b!1050856 (=> (not res!699176) (not e!596328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050856 (= res!699176 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050857 () Bool)

(declare-fun e!596322 () Bool)

(assert (=> b!1050857 (= e!596328 e!596322)))

(declare-fun res!699174 () Bool)

(assert (=> b!1050857 (=> (not res!699174) (not e!596322))))

(declare-fun lt!464069 () array!66184)

(assert (=> b!1050857 (= res!699174 (arrayContainsKey!0 lt!464069 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050857 (= lt!464069 (array!66185 (store (arr!31825 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32362 a!3488)))))

(declare-fun b!1050858 () Bool)

(declare-fun e!596329 () Bool)

(assert (=> b!1050858 (= e!596329 (not e!596323))))

(declare-fun res!699179 () Bool)

(assert (=> b!1050858 (=> res!699179 e!596323)))

(assert (=> b!1050858 (= res!699179 (bvsle lt!464071 i!1381))))

(declare-fun e!596325 () Bool)

(assert (=> b!1050858 e!596325))

(declare-fun res!699177 () Bool)

(assert (=> b!1050858 (=> (not res!699177) (not e!596325))))

(assert (=> b!1050858 (= res!699177 (= (select (store (arr!31825 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464071) k0!2747))))

(declare-fun b!1050859 () Bool)

(declare-fun res!699175 () Bool)

(assert (=> b!1050859 (=> res!699175 e!596326)))

(declare-fun noDuplicate!1513 (List!22107) Bool)

(assert (=> b!1050859 (= res!699175 (not (noDuplicate!1513 Nil!22104)))))

(declare-fun b!1050853 () Bool)

(declare-fun res!699183 () Bool)

(assert (=> b!1050853 (=> (not res!699183) (not e!596328))))

(assert (=> b!1050853 (= res!699183 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22104))))

(declare-fun res!699182 () Bool)

(assert (=> start!92568 (=> (not res!699182) (not e!596328))))

(assert (=> start!92568 (= res!699182 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32362 a!3488)) (bvslt (size!32362 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92568 e!596328))

(assert (=> start!92568 true))

(declare-fun array_inv!24607 (array!66184) Bool)

(assert (=> start!92568 (array_inv!24607 a!3488)))

(declare-fun b!1050860 () Bool)

(declare-fun e!596324 () Bool)

(assert (=> b!1050860 (= e!596324 (arrayContainsKey!0 a!3488 k0!2747 lt!464071))))

(declare-fun b!1050861 () Bool)

(declare-fun res!699180 () Bool)

(assert (=> b!1050861 (=> res!699180 e!596326)))

(assert (=> b!1050861 (= res!699180 (contains!6137 Nil!22104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050862 () Bool)

(assert (=> b!1050862 (= e!596325 e!596324)))

(declare-fun res!699181 () Bool)

(assert (=> b!1050862 (=> res!699181 e!596324)))

(assert (=> b!1050862 (= res!699181 (bvsle lt!464071 i!1381))))

(declare-fun b!1050863 () Bool)

(assert (=> b!1050863 (= e!596322 e!596329)))

(declare-fun res!699184 () Bool)

(assert (=> b!1050863 (=> (not res!699184) (not e!596329))))

(assert (=> b!1050863 (= res!699184 (not (= lt!464071 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66184 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050863 (= lt!464071 (arrayScanForKey!0 lt!464069 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050864 () Bool)

(declare-fun res!699185 () Bool)

(assert (=> b!1050864 (=> (not res!699185) (not e!596328))))

(assert (=> b!1050864 (= res!699185 (= (select (arr!31825 a!3488) i!1381) k0!2747))))

(assert (= (and start!92568 res!699182) b!1050853))

(assert (= (and b!1050853 res!699183) b!1050856))

(assert (= (and b!1050856 res!699176) b!1050864))

(assert (= (and b!1050864 res!699185) b!1050857))

(assert (= (and b!1050857 res!699174) b!1050863))

(assert (= (and b!1050863 res!699184) b!1050858))

(assert (= (and b!1050858 res!699177) b!1050862))

(assert (= (and b!1050862 (not res!699181)) b!1050860))

(assert (= (and b!1050858 (not res!699179)) b!1050854))

(assert (= (and b!1050854 (not res!699178)) b!1050859))

(assert (= (and b!1050859 (not res!699175)) b!1050861))

(assert (= (and b!1050861 (not res!699180)) b!1050855))

(declare-fun m!971957 () Bool)

(assert (=> b!1050853 m!971957))

(declare-fun m!971959 () Bool)

(assert (=> b!1050860 m!971959))

(declare-fun m!971961 () Bool)

(assert (=> b!1050863 m!971961))

(declare-fun m!971963 () Bool)

(assert (=> b!1050854 m!971963))

(declare-fun m!971965 () Bool)

(assert (=> b!1050854 m!971965))

(declare-fun m!971967 () Bool)

(assert (=> b!1050854 m!971967))

(declare-fun m!971969 () Bool)

(assert (=> b!1050854 m!971969))

(declare-fun m!971971 () Bool)

(assert (=> b!1050857 m!971971))

(declare-fun m!971973 () Bool)

(assert (=> b!1050857 m!971973))

(declare-fun m!971975 () Bool)

(assert (=> b!1050861 m!971975))

(declare-fun m!971977 () Bool)

(assert (=> b!1050859 m!971977))

(declare-fun m!971979 () Bool)

(assert (=> b!1050856 m!971979))

(declare-fun m!971981 () Bool)

(assert (=> b!1050864 m!971981))

(declare-fun m!971983 () Bool)

(assert (=> b!1050855 m!971983))

(assert (=> b!1050858 m!971973))

(declare-fun m!971985 () Bool)

(assert (=> b!1050858 m!971985))

(declare-fun m!971987 () Bool)

(assert (=> start!92568 m!971987))

(check-sat (not b!1050860) (not b!1050859) (not start!92568) (not b!1050863) (not b!1050857) (not b!1050855) (not b!1050853) (not b!1050856) (not b!1050854) (not b!1050861))
(check-sat)
