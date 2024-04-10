; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93240 () Bool)

(assert start!93240)

(declare-fun b!1057159 () Bool)

(declare-fun e!601154 () Bool)

(assert (=> b!1057159 (= e!601154 true)))

(declare-datatypes ((array!66678 0))(
  ( (array!66679 (arr!32062 (Array (_ BitVec 32) (_ BitVec 64))) (size!32598 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66678)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun lt!466322 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057159 (arrayContainsKey!0 a!3488 k!2747 lt!466322)))

(declare-datatypes ((Unit!34646 0))(
  ( (Unit!34647) )
))
(declare-fun lt!466323 () Unit!34646)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34646)

(assert (=> b!1057159 (= lt!466323 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466322))))

(declare-fun lt!466320 () (_ BitVec 32))

(assert (=> b!1057159 (= lt!466322 (bvadd #b00000000000000000000000000000001 lt!466320))))

(declare-datatypes ((List!22374 0))(
  ( (Nil!22371) (Cons!22370 (h!23579 (_ BitVec 64)) (t!31681 List!22374)) )
))
(declare-fun arrayNoDuplicates!0 (array!66678 (_ BitVec 32) List!22374) Bool)

(assert (=> b!1057159 (arrayNoDuplicates!0 a!3488 lt!466320 Nil!22371)))

(declare-fun lt!466321 () Unit!34646)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66678 (_ BitVec 32) (_ BitVec 32)) Unit!34646)

(assert (=> b!1057159 (= lt!466321 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466320))))

(declare-fun b!1057160 () Bool)

(declare-fun e!601156 () Bool)

(assert (=> b!1057160 (= e!601156 (not e!601154))))

(declare-fun res!705860 () Bool)

(assert (=> b!1057160 (=> res!705860 e!601154)))

(assert (=> b!1057160 (= res!705860 (or (bvsgt lt!466320 i!1381) (bvsle i!1381 lt!466320)))))

(declare-fun e!601153 () Bool)

(assert (=> b!1057160 e!601153))

(declare-fun res!705858 () Bool)

(assert (=> b!1057160 (=> (not res!705858) (not e!601153))))

(assert (=> b!1057160 (= res!705858 (= (select (store (arr!32062 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466320) k!2747))))

(declare-fun b!1057161 () Bool)

(declare-fun res!705866 () Bool)

(declare-fun e!601157 () Bool)

(assert (=> b!1057161 (=> (not res!705866) (not e!601157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057161 (= res!705866 (validKeyInArray!0 k!2747))))

(declare-fun b!1057162 () Bool)

(declare-fun e!601155 () Bool)

(assert (=> b!1057162 (= e!601157 e!601155)))

(declare-fun res!705863 () Bool)

(assert (=> b!1057162 (=> (not res!705863) (not e!601155))))

(declare-fun lt!466319 () array!66678)

(assert (=> b!1057162 (= res!705863 (arrayContainsKey!0 lt!466319 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057162 (= lt!466319 (array!66679 (store (arr!32062 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32598 a!3488)))))

(declare-fun res!705864 () Bool)

(assert (=> start!93240 (=> (not res!705864) (not e!601157))))

(assert (=> start!93240 (= res!705864 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32598 a!3488)) (bvslt (size!32598 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93240 e!601157))

(assert (=> start!93240 true))

(declare-fun array_inv!24842 (array!66678) Bool)

(assert (=> start!93240 (array_inv!24842 a!3488)))

(declare-fun b!1057158 () Bool)

(declare-fun res!705859 () Bool)

(assert (=> b!1057158 (=> (not res!705859) (not e!601157))))

(assert (=> b!1057158 (= res!705859 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22371))))

(declare-fun b!1057163 () Bool)

(declare-fun e!601158 () Bool)

(assert (=> b!1057163 (= e!601153 e!601158)))

(declare-fun res!705865 () Bool)

(assert (=> b!1057163 (=> res!705865 e!601158)))

(assert (=> b!1057163 (= res!705865 (or (bvsgt lt!466320 i!1381) (bvsle i!1381 lt!466320)))))

(declare-fun b!1057164 () Bool)

(assert (=> b!1057164 (= e!601155 e!601156)))

(declare-fun res!705861 () Bool)

(assert (=> b!1057164 (=> (not res!705861) (not e!601156))))

(assert (=> b!1057164 (= res!705861 (not (= lt!466320 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66678 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057164 (= lt!466320 (arrayScanForKey!0 lt!466319 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057165 () Bool)

(assert (=> b!1057165 (= e!601158 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057166 () Bool)

(declare-fun res!705862 () Bool)

(assert (=> b!1057166 (=> (not res!705862) (not e!601157))))

(assert (=> b!1057166 (= res!705862 (= (select (arr!32062 a!3488) i!1381) k!2747))))

(assert (= (and start!93240 res!705864) b!1057158))

(assert (= (and b!1057158 res!705859) b!1057161))

(assert (= (and b!1057161 res!705866) b!1057166))

(assert (= (and b!1057166 res!705862) b!1057162))

(assert (= (and b!1057162 res!705863) b!1057164))

(assert (= (and b!1057164 res!705861) b!1057160))

(assert (= (and b!1057160 res!705858) b!1057163))

(assert (= (and b!1057163 (not res!705865)) b!1057165))

(assert (= (and b!1057160 (not res!705860)) b!1057159))

(declare-fun m!976865 () Bool)

(assert (=> b!1057160 m!976865))

(declare-fun m!976867 () Bool)

(assert (=> b!1057160 m!976867))

(declare-fun m!976869 () Bool)

(assert (=> b!1057165 m!976869))

(declare-fun m!976871 () Bool)

(assert (=> b!1057159 m!976871))

(declare-fun m!976873 () Bool)

(assert (=> b!1057159 m!976873))

(declare-fun m!976875 () Bool)

(assert (=> b!1057159 m!976875))

(declare-fun m!976877 () Bool)

(assert (=> b!1057159 m!976877))

(declare-fun m!976879 () Bool)

(assert (=> b!1057158 m!976879))

(declare-fun m!976881 () Bool)

(assert (=> b!1057161 m!976881))

(declare-fun m!976883 () Bool)

(assert (=> b!1057164 m!976883))

(declare-fun m!976885 () Bool)

(assert (=> b!1057162 m!976885))

(assert (=> b!1057162 m!976865))

(declare-fun m!976887 () Bool)

(assert (=> b!1057166 m!976887))

(declare-fun m!976889 () Bool)

(assert (=> start!93240 m!976889))

(push 1)

