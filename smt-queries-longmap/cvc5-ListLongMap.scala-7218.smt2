; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92370 () Bool)

(assert start!92370)

(declare-fun b!1050186 () Bool)

(declare-fun e!595913 () Bool)

(assert (=> b!1050186 (= e!595913 true)))

(declare-fun lt!463824 () Bool)

(declare-datatypes ((List!22137 0))(
  ( (Nil!22134) (Cons!22133 (h!23342 (_ BitVec 64)) (t!31444 List!22137)) )
))
(declare-fun contains!6130 (List!22137 (_ BitVec 64)) Bool)

(assert (=> b!1050186 (= lt!463824 (contains!6130 Nil!22134 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050187 () Bool)

(declare-fun e!595914 () Bool)

(assert (=> b!1050187 (= e!595914 e!595913)))

(declare-fun res!699312 () Bool)

(assert (=> b!1050187 (=> res!699312 e!595913)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66171 0))(
  ( (array!66172 (arr!31825 (Array (_ BitVec 32) (_ BitVec 64))) (size!32361 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66171)

(assert (=> b!1050187 (= res!699312 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32361 a!3488)))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050187 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34370 0))(
  ( (Unit!34371) )
))
(declare-fun lt!463827 () Unit!34370)

(declare-fun lt!463823 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66171 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34370)

(assert (=> b!1050187 (= lt!463827 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463823 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66171 (_ BitVec 32) List!22137) Bool)

(assert (=> b!1050187 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22134)))

(declare-fun lt!463825 () Unit!34370)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66171 (_ BitVec 32) (_ BitVec 32)) Unit!34370)

(assert (=> b!1050187 (= lt!463825 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun res!699320 () Bool)

(declare-fun e!595911 () Bool)

(assert (=> start!92370 (=> (not res!699320) (not e!595911))))

(assert (=> start!92370 (= res!699320 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32361 a!3488)) (bvslt (size!32361 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92370 e!595911))

(assert (=> start!92370 true))

(declare-fun array_inv!24605 (array!66171) Bool)

(assert (=> start!92370 (array_inv!24605 a!3488)))

(declare-fun b!1050188 () Bool)

(declare-fun e!595918 () Bool)

(declare-fun e!595912 () Bool)

(assert (=> b!1050188 (= e!595918 e!595912)))

(declare-fun res!699314 () Bool)

(assert (=> b!1050188 (=> (not res!699314) (not e!595912))))

(assert (=> b!1050188 (= res!699314 (not (= lt!463823 i!1381)))))

(declare-fun lt!463826 () array!66171)

(declare-fun arrayScanForKey!0 (array!66171 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050188 (= lt!463823 (arrayScanForKey!0 lt!463826 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050189 () Bool)

(declare-fun res!699317 () Bool)

(assert (=> b!1050189 (=> res!699317 e!595913)))

(assert (=> b!1050189 (= res!699317 (contains!6130 Nil!22134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050190 () Bool)

(declare-fun res!699316 () Bool)

(assert (=> b!1050190 (=> (not res!699316) (not e!595911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050190 (= res!699316 (validKeyInArray!0 k!2747))))

(declare-fun b!1050191 () Bool)

(assert (=> b!1050191 (= e!595912 (not e!595914))))

(declare-fun res!699323 () Bool)

(assert (=> b!1050191 (=> res!699323 e!595914)))

(assert (=> b!1050191 (= res!699323 (bvsle lt!463823 i!1381))))

(declare-fun e!595915 () Bool)

(assert (=> b!1050191 e!595915))

(declare-fun res!699313 () Bool)

(assert (=> b!1050191 (=> (not res!699313) (not e!595915))))

(assert (=> b!1050191 (= res!699313 (= (select (store (arr!31825 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463823) k!2747))))

(declare-fun b!1050192 () Bool)

(declare-fun res!699321 () Bool)

(assert (=> b!1050192 (=> (not res!699321) (not e!595911))))

(assert (=> b!1050192 (= res!699321 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22134))))

(declare-fun b!1050193 () Bool)

(assert (=> b!1050193 (= e!595911 e!595918)))

(declare-fun res!699319 () Bool)

(assert (=> b!1050193 (=> (not res!699319) (not e!595918))))

(assert (=> b!1050193 (= res!699319 (arrayContainsKey!0 lt!463826 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050193 (= lt!463826 (array!66172 (store (arr!31825 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32361 a!3488)))))

(declare-fun b!1050194 () Bool)

(declare-fun e!595916 () Bool)

(assert (=> b!1050194 (= e!595915 e!595916)))

(declare-fun res!699322 () Bool)

(assert (=> b!1050194 (=> res!699322 e!595916)))

(assert (=> b!1050194 (= res!699322 (bvsle lt!463823 i!1381))))

(declare-fun b!1050195 () Bool)

(declare-fun res!699315 () Bool)

(assert (=> b!1050195 (=> res!699315 e!595913)))

(declare-fun noDuplicate!1515 (List!22137) Bool)

(assert (=> b!1050195 (= res!699315 (not (noDuplicate!1515 Nil!22134)))))

(declare-fun b!1050196 () Bool)

(assert (=> b!1050196 (= e!595916 (arrayContainsKey!0 a!3488 k!2747 lt!463823))))

(declare-fun b!1050197 () Bool)

(declare-fun res!699318 () Bool)

(assert (=> b!1050197 (=> (not res!699318) (not e!595911))))

(assert (=> b!1050197 (= res!699318 (= (select (arr!31825 a!3488) i!1381) k!2747))))

(assert (= (and start!92370 res!699320) b!1050192))

(assert (= (and b!1050192 res!699321) b!1050190))

(assert (= (and b!1050190 res!699316) b!1050197))

(assert (= (and b!1050197 res!699318) b!1050193))

(assert (= (and b!1050193 res!699319) b!1050188))

(assert (= (and b!1050188 res!699314) b!1050191))

(assert (= (and b!1050191 res!699313) b!1050194))

(assert (= (and b!1050194 (not res!699322)) b!1050196))

(assert (= (and b!1050191 (not res!699323)) b!1050187))

(assert (= (and b!1050187 (not res!699312)) b!1050195))

(assert (= (and b!1050195 (not res!699315)) b!1050189))

(assert (= (and b!1050189 (not res!699317)) b!1050186))

(declare-fun m!970865 () Bool)

(assert (=> b!1050195 m!970865))

(declare-fun m!970867 () Bool)

(assert (=> b!1050191 m!970867))

(declare-fun m!970869 () Bool)

(assert (=> b!1050191 m!970869))

(declare-fun m!970871 () Bool)

(assert (=> b!1050189 m!970871))

(declare-fun m!970873 () Bool)

(assert (=> b!1050190 m!970873))

(declare-fun m!970875 () Bool)

(assert (=> start!92370 m!970875))

(declare-fun m!970877 () Bool)

(assert (=> b!1050187 m!970877))

(declare-fun m!970879 () Bool)

(assert (=> b!1050187 m!970879))

(declare-fun m!970881 () Bool)

(assert (=> b!1050187 m!970881))

(declare-fun m!970883 () Bool)

(assert (=> b!1050187 m!970883))

(declare-fun m!970885 () Bool)

(assert (=> b!1050192 m!970885))

(declare-fun m!970887 () Bool)

(assert (=> b!1050188 m!970887))

(declare-fun m!970889 () Bool)

(assert (=> b!1050197 m!970889))

(declare-fun m!970891 () Bool)

(assert (=> b!1050193 m!970891))

(assert (=> b!1050193 m!970867))

(declare-fun m!970893 () Bool)

(assert (=> b!1050196 m!970893))

(declare-fun m!970895 () Bool)

(assert (=> b!1050186 m!970895))

(push 1)

(assert (not b!1050188))

(assert (not b!1050192))

(assert (not b!1050187))

(assert (not b!1050190))

(assert (not b!1050196))

(assert (not b!1050195))

(assert (not b!1050193))

(assert (not b!1050186))

(assert (not start!92370))

(assert (not b!1050189))

(check-sat)

(pop 1)

