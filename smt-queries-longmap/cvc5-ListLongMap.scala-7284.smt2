; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93066 () Bool)

(assert start!93066)

(declare-fun b!1055892 () Bool)

(declare-fun e!600179 () Bool)

(declare-fun e!600180 () Bool)

(assert (=> b!1055892 (= e!600179 (not e!600180))))

(declare-fun res!704712 () Bool)

(assert (=> b!1055892 (=> res!704712 e!600180)))

(declare-fun lt!465968 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055892 (= res!704712 (bvsle lt!465968 i!1381))))

(declare-fun e!600178 () Bool)

(assert (=> b!1055892 e!600178))

(declare-fun res!704706 () Bool)

(assert (=> b!1055892 (=> (not res!704706) (not e!600178))))

(declare-datatypes ((array!66591 0))(
  ( (array!66592 (arr!32023 (Array (_ BitVec 32) (_ BitVec 64))) (size!32559 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66591)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1055892 (= res!704706 (= (select (store (arr!32023 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465968) k!2747))))

(declare-fun b!1055893 () Bool)

(assert (=> b!1055893 (= e!600180 true)))

(assert (=> b!1055893 false))

(declare-datatypes ((Unit!34604 0))(
  ( (Unit!34605) )
))
(declare-fun lt!465971 () Unit!34604)

(declare-datatypes ((List!22335 0))(
  ( (Nil!22332) (Cons!22331 (h!23540 (_ BitVec 64)) (t!31642 List!22335)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66591 (_ BitVec 64) (_ BitVec 32) List!22335) Unit!34604)

(assert (=> b!1055893 (= lt!465971 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 i!1381 Nil!22332))))

(declare-fun arrayContainsKey!0 (array!66591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055893 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!465972 () Unit!34604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66591 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34604)

(assert (=> b!1055893 (= lt!465972 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465968 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66591 (_ BitVec 32) List!22335) Bool)

(assert (=> b!1055893 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22332)))

(declare-fun lt!465969 () Unit!34604)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66591 (_ BitVec 32) (_ BitVec 32)) Unit!34604)

(assert (=> b!1055893 (= lt!465969 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055894 () Bool)

(declare-fun e!600183 () Bool)

(assert (=> b!1055894 (= e!600178 e!600183)))

(declare-fun res!704707 () Bool)

(assert (=> b!1055894 (=> res!704707 e!600183)))

(assert (=> b!1055894 (= res!704707 (bvsle lt!465968 i!1381))))

(declare-fun b!1055895 () Bool)

(declare-fun e!600181 () Bool)

(declare-fun e!600184 () Bool)

(assert (=> b!1055895 (= e!600181 e!600184)))

(declare-fun res!704713 () Bool)

(assert (=> b!1055895 (=> (not res!704713) (not e!600184))))

(declare-fun lt!465970 () array!66591)

(assert (=> b!1055895 (= res!704713 (arrayContainsKey!0 lt!465970 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1055895 (= lt!465970 (array!66592 (store (arr!32023 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32559 a!3488)))))

(declare-fun res!704708 () Bool)

(assert (=> start!93066 (=> (not res!704708) (not e!600181))))

(assert (=> start!93066 (= res!704708 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32559 a!3488)) (bvslt (size!32559 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93066 e!600181))

(assert (=> start!93066 true))

(declare-fun array_inv!24803 (array!66591) Bool)

(assert (=> start!93066 (array_inv!24803 a!3488)))

(declare-fun b!1055896 () Bool)

(declare-fun res!704710 () Bool)

(assert (=> b!1055896 (=> (not res!704710) (not e!600181))))

(assert (=> b!1055896 (= res!704710 (= (select (arr!32023 a!3488) i!1381) k!2747))))

(declare-fun b!1055897 () Bool)

(declare-fun res!704714 () Bool)

(assert (=> b!1055897 (=> (not res!704714) (not e!600181))))

(assert (=> b!1055897 (= res!704714 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22332))))

(declare-fun b!1055898 () Bool)

(assert (=> b!1055898 (= e!600183 (arrayContainsKey!0 a!3488 k!2747 lt!465968))))

(declare-fun b!1055899 () Bool)

(assert (=> b!1055899 (= e!600184 e!600179)))

(declare-fun res!704711 () Bool)

(assert (=> b!1055899 (=> (not res!704711) (not e!600179))))

(assert (=> b!1055899 (= res!704711 (not (= lt!465968 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66591 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055899 (= lt!465968 (arrayScanForKey!0 lt!465970 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055900 () Bool)

(declare-fun res!704709 () Bool)

(assert (=> b!1055900 (=> (not res!704709) (not e!600181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055900 (= res!704709 (validKeyInArray!0 k!2747))))

(assert (= (and start!93066 res!704708) b!1055897))

(assert (= (and b!1055897 res!704714) b!1055900))

(assert (= (and b!1055900 res!704709) b!1055896))

(assert (= (and b!1055896 res!704710) b!1055895))

(assert (= (and b!1055895 res!704713) b!1055899))

(assert (= (and b!1055899 res!704711) b!1055892))

(assert (= (and b!1055892 res!704706) b!1055894))

(assert (= (and b!1055894 (not res!704707)) b!1055898))

(assert (= (and b!1055892 (not res!704712)) b!1055893))

(declare-fun m!975869 () Bool)

(assert (=> b!1055898 m!975869))

(declare-fun m!975871 () Bool)

(assert (=> b!1055896 m!975871))

(declare-fun m!975873 () Bool)

(assert (=> start!93066 m!975873))

(declare-fun m!975875 () Bool)

(assert (=> b!1055900 m!975875))

(declare-fun m!975877 () Bool)

(assert (=> b!1055893 m!975877))

(declare-fun m!975879 () Bool)

(assert (=> b!1055893 m!975879))

(declare-fun m!975881 () Bool)

(assert (=> b!1055893 m!975881))

(declare-fun m!975883 () Bool)

(assert (=> b!1055893 m!975883))

(declare-fun m!975885 () Bool)

(assert (=> b!1055893 m!975885))

(declare-fun m!975887 () Bool)

(assert (=> b!1055895 m!975887))

(declare-fun m!975889 () Bool)

(assert (=> b!1055895 m!975889))

(assert (=> b!1055892 m!975889))

(declare-fun m!975891 () Bool)

(assert (=> b!1055892 m!975891))

(declare-fun m!975893 () Bool)

(assert (=> b!1055897 m!975893))

(declare-fun m!975895 () Bool)

(assert (=> b!1055899 m!975895))

(push 1)

