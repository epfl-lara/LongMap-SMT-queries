; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120378 () Bool)

(assert start!120378)

(declare-fun b!1401245 () Bool)

(declare-fun e!793413 () Bool)

(declare-fun e!793415 () Bool)

(assert (=> b!1401245 (= e!793413 e!793415)))

(declare-fun res!939757 () Bool)

(assert (=> b!1401245 (=> res!939757 e!793415)))

(declare-datatypes ((array!95787 0))(
  ( (array!95788 (arr!46244 (Array (_ BitVec 32) (_ BitVec 64))) (size!46794 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95787)

(declare-datatypes ((SeekEntryResult!10561 0))(
  ( (MissingZero!10561 (index!44621 (_ BitVec 32))) (Found!10561 (index!44622 (_ BitVec 32))) (Intermediate!10561 (undefined!11373 Bool) (index!44623 (_ BitVec 32)) (x!126260 (_ BitVec 32))) (Undefined!10561) (MissingVacant!10561 (index!44624 (_ BitVec 32))) )
))
(declare-fun lt!616790 () SeekEntryResult!10561)

(declare-fun lt!616792 () (_ BitVec 32))

(declare-fun lt!616794 () SeekEntryResult!10561)

(assert (=> b!1401245 (= res!939757 (or (bvslt (x!126260 lt!616794) #b00000000000000000000000000000000) (bvsgt (x!126260 lt!616794) #b01111111111111111111111111111110) (bvslt (x!126260 lt!616790) #b00000000000000000000000000000000) (bvsgt (x!126260 lt!616790) #b01111111111111111111111111111110) (bvslt lt!616792 #b00000000000000000000000000000000) (bvsge lt!616792 (size!46794 a!2901)) (bvslt (index!44623 lt!616794) #b00000000000000000000000000000000) (bvsge (index!44623 lt!616794) (size!46794 a!2901)) (bvslt (index!44623 lt!616790) #b00000000000000000000000000000000) (bvsge (index!44623 lt!616790) (size!46794 a!2901)) (not (= lt!616794 (Intermediate!10561 false (index!44623 lt!616794) (x!126260 lt!616794)))) (not (= lt!616790 (Intermediate!10561 false (index!44623 lt!616790) (x!126260 lt!616790))))))))

(declare-fun e!793411 () Bool)

(assert (=> b!1401245 e!793411))

(declare-fun res!939765 () Bool)

(assert (=> b!1401245 (=> (not res!939765) (not e!793411))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401245 (= res!939765 (and (not (undefined!11373 lt!616790)) (= (index!44623 lt!616790) i!1037) (bvslt (x!126260 lt!616790) (x!126260 lt!616794)) (= (select (store (arr!46244 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44623 lt!616790)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47126 0))(
  ( (Unit!47127) )
))
(declare-fun lt!616797 () Unit!47126)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47126)

(assert (=> b!1401245 (= lt!616797 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616792 (x!126260 lt!616794) (index!44623 lt!616794) (x!126260 lt!616790) (index!44623 lt!616790) (undefined!11373 lt!616790) mask!2840))))

(declare-fun b!1401247 () Bool)

(declare-fun e!793412 () Bool)

(assert (=> b!1401247 (= e!793412 e!793413)))

(declare-fun res!939760 () Bool)

(assert (=> b!1401247 (=> res!939760 e!793413)))

(assert (=> b!1401247 (= res!939760 (or (= lt!616794 lt!616790) (not (is-Intermediate!10561 lt!616790))))))

(declare-fun lt!616791 () array!95787)

(declare-fun lt!616793 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95787 (_ BitVec 32)) SeekEntryResult!10561)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401247 (= lt!616790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616793 mask!2840) lt!616793 lt!616791 mask!2840))))

(assert (=> b!1401247 (= lt!616793 (select (store (arr!46244 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401247 (= lt!616791 (array!95788 (store (arr!46244 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46794 a!2901)))))

(declare-fun e!793409 () Bool)

(declare-fun b!1401248 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95787 (_ BitVec 32)) SeekEntryResult!10561)

(assert (=> b!1401248 (= e!793409 (= (seekEntryOrOpen!0 (select (arr!46244 a!2901) j!112) a!2901 mask!2840) (Found!10561 j!112)))))

(declare-fun b!1401249 () Bool)

(declare-fun res!939766 () Bool)

(declare-fun e!793414 () Bool)

(assert (=> b!1401249 (=> (not res!939766) (not e!793414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401249 (= res!939766 (validKeyInArray!0 (select (arr!46244 a!2901) j!112)))))

(declare-fun b!1401250 () Bool)

(assert (=> b!1401250 (= e!793415 true)))

(declare-fun lt!616796 () SeekEntryResult!10561)

(assert (=> b!1401250 (= lt!616796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616792 lt!616793 lt!616791 mask!2840))))

(declare-fun b!1401251 () Bool)

(declare-fun res!939762 () Bool)

(assert (=> b!1401251 (=> (not res!939762) (not e!793414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95787 (_ BitVec 32)) Bool)

(assert (=> b!1401251 (= res!939762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401252 () Bool)

(declare-fun res!939761 () Bool)

(assert (=> b!1401252 (=> (not res!939761) (not e!793414))))

(assert (=> b!1401252 (= res!939761 (and (= (size!46794 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46794 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46794 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401253 () Bool)

(declare-fun res!939756 () Bool)

(assert (=> b!1401253 (=> (not res!939756) (not e!793414))))

(assert (=> b!1401253 (= res!939756 (validKeyInArray!0 (select (arr!46244 a!2901) i!1037)))))

(declare-fun b!1401254 () Bool)

(assert (=> b!1401254 (= e!793414 (not e!793412))))

(declare-fun res!939759 () Bool)

(assert (=> b!1401254 (=> res!939759 e!793412)))

(assert (=> b!1401254 (= res!939759 (or (not (is-Intermediate!10561 lt!616794)) (undefined!11373 lt!616794)))))

(assert (=> b!1401254 e!793409))

(declare-fun res!939763 () Bool)

(assert (=> b!1401254 (=> (not res!939763) (not e!793409))))

(assert (=> b!1401254 (= res!939763 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616795 () Unit!47126)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47126)

(assert (=> b!1401254 (= lt!616795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401254 (= lt!616794 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616792 (select (arr!46244 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401254 (= lt!616792 (toIndex!0 (select (arr!46244 a!2901) j!112) mask!2840))))

(declare-fun b!1401255 () Bool)

(declare-fun res!939758 () Bool)

(assert (=> b!1401255 (=> (not res!939758) (not e!793414))))

(declare-datatypes ((List!32763 0))(
  ( (Nil!32760) (Cons!32759 (h!34007 (_ BitVec 64)) (t!47457 List!32763)) )
))
(declare-fun arrayNoDuplicates!0 (array!95787 (_ BitVec 32) List!32763) Bool)

(assert (=> b!1401255 (= res!939758 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32760))))

(declare-fun res!939764 () Bool)

(assert (=> start!120378 (=> (not res!939764) (not e!793414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120378 (= res!939764 (validMask!0 mask!2840))))

(assert (=> start!120378 e!793414))

(assert (=> start!120378 true))

(declare-fun array_inv!35272 (array!95787) Bool)

(assert (=> start!120378 (array_inv!35272 a!2901)))

(declare-fun b!1401246 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95787 (_ BitVec 32)) SeekEntryResult!10561)

(assert (=> b!1401246 (= e!793411 (= (seekEntryOrOpen!0 lt!616793 lt!616791 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126260 lt!616790) (index!44623 lt!616790) (index!44623 lt!616790) (select (arr!46244 a!2901) j!112) lt!616791 mask!2840)))))

(assert (= (and start!120378 res!939764) b!1401252))

(assert (= (and b!1401252 res!939761) b!1401253))

(assert (= (and b!1401253 res!939756) b!1401249))

(assert (= (and b!1401249 res!939766) b!1401251))

(assert (= (and b!1401251 res!939762) b!1401255))

(assert (= (and b!1401255 res!939758) b!1401254))

(assert (= (and b!1401254 res!939763) b!1401248))

(assert (= (and b!1401254 (not res!939759)) b!1401247))

(assert (= (and b!1401247 (not res!939760)) b!1401245))

(assert (= (and b!1401245 res!939765) b!1401246))

(assert (= (and b!1401245 (not res!939757)) b!1401250))

(declare-fun m!1288965 () Bool)

(assert (=> b!1401246 m!1288965))

(declare-fun m!1288967 () Bool)

(assert (=> b!1401246 m!1288967))

(assert (=> b!1401246 m!1288967))

(declare-fun m!1288969 () Bool)

(assert (=> b!1401246 m!1288969))

(declare-fun m!1288971 () Bool)

(assert (=> b!1401250 m!1288971))

(assert (=> b!1401248 m!1288967))

(assert (=> b!1401248 m!1288967))

(declare-fun m!1288973 () Bool)

(assert (=> b!1401248 m!1288973))

(assert (=> b!1401249 m!1288967))

(assert (=> b!1401249 m!1288967))

(declare-fun m!1288975 () Bool)

(assert (=> b!1401249 m!1288975))

(assert (=> b!1401254 m!1288967))

(declare-fun m!1288977 () Bool)

(assert (=> b!1401254 m!1288977))

(assert (=> b!1401254 m!1288967))

(declare-fun m!1288979 () Bool)

(assert (=> b!1401254 m!1288979))

(assert (=> b!1401254 m!1288967))

(declare-fun m!1288981 () Bool)

(assert (=> b!1401254 m!1288981))

(declare-fun m!1288983 () Bool)

(assert (=> b!1401254 m!1288983))

(declare-fun m!1288985 () Bool)

(assert (=> b!1401251 m!1288985))

(declare-fun m!1288987 () Bool)

(assert (=> b!1401245 m!1288987))

(declare-fun m!1288989 () Bool)

(assert (=> b!1401245 m!1288989))

(declare-fun m!1288991 () Bool)

(assert (=> b!1401245 m!1288991))

(declare-fun m!1288993 () Bool)

(assert (=> b!1401255 m!1288993))

(declare-fun m!1288995 () Bool)

(assert (=> start!120378 m!1288995))

(declare-fun m!1288997 () Bool)

(assert (=> start!120378 m!1288997))

(declare-fun m!1288999 () Bool)

(assert (=> b!1401247 m!1288999))

(assert (=> b!1401247 m!1288999))

(declare-fun m!1289001 () Bool)

(assert (=> b!1401247 m!1289001))

(assert (=> b!1401247 m!1288987))

(declare-fun m!1289003 () Bool)

(assert (=> b!1401247 m!1289003))

(declare-fun m!1289005 () Bool)

(assert (=> b!1401253 m!1289005))

(assert (=> b!1401253 m!1289005))

(declare-fun m!1289007 () Bool)

(assert (=> b!1401253 m!1289007))

(push 1)

