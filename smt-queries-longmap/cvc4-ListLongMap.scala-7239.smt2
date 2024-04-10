; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92500 () Bool)

(assert start!92500)

(declare-fun b!1051941 () Bool)

(declare-fun e!597193 () Bool)

(declare-fun e!597194 () Bool)

(assert (=> b!1051941 (= e!597193 e!597194)))

(declare-fun res!701074 () Bool)

(assert (=> b!1051941 (=> res!701074 e!597194)))

(declare-datatypes ((array!66301 0))(
  ( (array!66302 (arr!31890 (Array (_ BitVec 32) (_ BitVec 64))) (size!32426 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66301)

(declare-fun lt!464511 () (_ BitVec 32))

(declare-fun lt!464510 () (_ BitVec 32))

(assert (=> b!1051941 (= res!701074 (or (bvslt lt!464511 #b00000000000000000000000000000000) (bvsge lt!464510 (size!32426 a!3488)) (bvsge lt!464511 (size!32426 a!3488))))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051941 (arrayContainsKey!0 a!3488 k!2747 lt!464510)))

(declare-datatypes ((Unit!34452 0))(
  ( (Unit!34453) )
))
(declare-fun lt!464513 () Unit!34452)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66301 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34452)

(assert (=> b!1051941 (= lt!464513 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464510))))

(assert (=> b!1051941 (= lt!464510 (bvadd #b00000000000000000000000000000001 lt!464511))))

(declare-datatypes ((List!22202 0))(
  ( (Nil!22199) (Cons!22198 (h!23407 (_ BitVec 64)) (t!31509 List!22202)) )
))
(declare-fun arrayNoDuplicates!0 (array!66301 (_ BitVec 32) List!22202) Bool)

(assert (=> b!1051941 (arrayNoDuplicates!0 a!3488 lt!464511 Nil!22199)))

(declare-fun lt!464509 () Unit!34452)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66301 (_ BitVec 32) (_ BitVec 32)) Unit!34452)

(assert (=> b!1051941 (= lt!464509 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464511))))

(declare-fun b!1051942 () Bool)

(declare-fun e!597199 () Bool)

(declare-fun e!597195 () Bool)

(assert (=> b!1051942 (= e!597199 e!597195)))

(declare-fun res!701070 () Bool)

(assert (=> b!1051942 (=> (not res!701070) (not e!597195))))

(assert (=> b!1051942 (= res!701070 (not (= lt!464511 i!1381)))))

(declare-fun lt!464514 () array!66301)

(declare-fun arrayScanForKey!0 (array!66301 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051942 (= lt!464511 (arrayScanForKey!0 lt!464514 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051943 () Bool)

(declare-fun res!701076 () Bool)

(declare-fun e!597192 () Bool)

(assert (=> b!1051943 (=> (not res!701076) (not e!597192))))

(assert (=> b!1051943 (= res!701076 (= (select (arr!31890 a!3488) i!1381) k!2747))))

(declare-fun b!1051944 () Bool)

(declare-fun res!701067 () Bool)

(assert (=> b!1051944 (=> res!701067 e!597194)))

(declare-fun noDuplicate!1529 (List!22202) Bool)

(assert (=> b!1051944 (= res!701067 (not (noDuplicate!1529 Nil!22199)))))

(declare-fun b!1051945 () Bool)

(declare-fun res!701073 () Bool)

(assert (=> b!1051945 (=> res!701073 e!597194)))

(declare-fun contains!6144 (List!22202 (_ BitVec 64)) Bool)

(assert (=> b!1051945 (= res!701073 (contains!6144 Nil!22199 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051947 () Bool)

(declare-fun e!597198 () Bool)

(assert (=> b!1051947 (= e!597198 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051948 () Bool)

(declare-fun res!701069 () Bool)

(assert (=> b!1051948 (=> (not res!701069) (not e!597192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051948 (= res!701069 (validKeyInArray!0 k!2747))))

(declare-fun b!1051949 () Bool)

(declare-fun e!597197 () Bool)

(assert (=> b!1051949 (= e!597197 e!597198)))

(declare-fun res!701075 () Bool)

(assert (=> b!1051949 (=> res!701075 e!597198)))

(assert (=> b!1051949 (= res!701075 (or (bvsgt lt!464511 i!1381) (bvsle i!1381 lt!464511)))))

(declare-fun b!1051950 () Bool)

(assert (=> b!1051950 (= e!597192 e!597199)))

(declare-fun res!701078 () Bool)

(assert (=> b!1051950 (=> (not res!701078) (not e!597199))))

(assert (=> b!1051950 (= res!701078 (arrayContainsKey!0 lt!464514 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051950 (= lt!464514 (array!66302 (store (arr!31890 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32426 a!3488)))))

(declare-fun b!1051951 () Bool)

(assert (=> b!1051951 (= e!597194 true)))

(declare-fun lt!464512 () Bool)

(assert (=> b!1051951 (= lt!464512 (contains!6144 Nil!22199 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051952 () Bool)

(assert (=> b!1051952 (= e!597195 (not e!597193))))

(declare-fun res!701072 () Bool)

(assert (=> b!1051952 (=> res!701072 e!597193)))

(assert (=> b!1051952 (= res!701072 (or (bvsgt lt!464511 i!1381) (bvsle i!1381 lt!464511)))))

(assert (=> b!1051952 e!597197))

(declare-fun res!701068 () Bool)

(assert (=> b!1051952 (=> (not res!701068) (not e!597197))))

(assert (=> b!1051952 (= res!701068 (= (select (store (arr!31890 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464511) k!2747))))

(declare-fun b!1051946 () Bool)

(declare-fun res!701071 () Bool)

(assert (=> b!1051946 (=> (not res!701071) (not e!597192))))

(assert (=> b!1051946 (= res!701071 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22199))))

(declare-fun res!701077 () Bool)

(assert (=> start!92500 (=> (not res!701077) (not e!597192))))

(assert (=> start!92500 (= res!701077 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32426 a!3488)) (bvslt (size!32426 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92500 e!597192))

(assert (=> start!92500 true))

(declare-fun array_inv!24670 (array!66301) Bool)

(assert (=> start!92500 (array_inv!24670 a!3488)))

(assert (= (and start!92500 res!701077) b!1051946))

(assert (= (and b!1051946 res!701071) b!1051948))

(assert (= (and b!1051948 res!701069) b!1051943))

(assert (= (and b!1051943 res!701076) b!1051950))

(assert (= (and b!1051950 res!701078) b!1051942))

(assert (= (and b!1051942 res!701070) b!1051952))

(assert (= (and b!1051952 res!701068) b!1051949))

(assert (= (and b!1051949 (not res!701075)) b!1051947))

(assert (= (and b!1051952 (not res!701072)) b!1051941))

(assert (= (and b!1051941 (not res!701074)) b!1051944))

(assert (= (and b!1051944 (not res!701067)) b!1051945))

(assert (= (and b!1051945 (not res!701073)) b!1051951))

(declare-fun m!972375 () Bool)

(assert (=> b!1051952 m!972375))

(declare-fun m!972377 () Bool)

(assert (=> b!1051952 m!972377))

(declare-fun m!972379 () Bool)

(assert (=> b!1051941 m!972379))

(declare-fun m!972381 () Bool)

(assert (=> b!1051941 m!972381))

(declare-fun m!972383 () Bool)

(assert (=> b!1051941 m!972383))

(declare-fun m!972385 () Bool)

(assert (=> b!1051941 m!972385))

(declare-fun m!972387 () Bool)

(assert (=> b!1051950 m!972387))

(assert (=> b!1051950 m!972375))

(declare-fun m!972389 () Bool)

(assert (=> b!1051951 m!972389))

(declare-fun m!972391 () Bool)

(assert (=> b!1051942 m!972391))

(declare-fun m!972393 () Bool)

(assert (=> b!1051946 m!972393))

(declare-fun m!972395 () Bool)

(assert (=> b!1051947 m!972395))

(declare-fun m!972397 () Bool)

(assert (=> start!92500 m!972397))

(declare-fun m!972399 () Bool)

(assert (=> b!1051944 m!972399))

(declare-fun m!972401 () Bool)

(assert (=> b!1051948 m!972401))

(declare-fun m!972403 () Bool)

(assert (=> b!1051943 m!972403))

(declare-fun m!972405 () Bool)

(assert (=> b!1051945 m!972405))

(push 1)

