; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92488 () Bool)

(assert start!92488)

(declare-fun b!1051725 () Bool)

(declare-fun e!597054 () Bool)

(declare-fun e!597049 () Bool)

(assert (=> b!1051725 (= e!597054 e!597049)))

(declare-fun res!700862 () Bool)

(assert (=> b!1051725 (=> res!700862 e!597049)))

(declare-fun lt!464402 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1051725 (= res!700862 (or (bvsgt lt!464402 i!1381) (bvsle i!1381 lt!464402)))))

(declare-fun res!700859 () Bool)

(declare-fun e!597055 () Bool)

(assert (=> start!92488 (=> (not res!700859) (not e!597055))))

(declare-datatypes ((array!66289 0))(
  ( (array!66290 (arr!31884 (Array (_ BitVec 32) (_ BitVec 64))) (size!32420 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66289)

(assert (=> start!92488 (= res!700859 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32420 a!3488)) (bvslt (size!32420 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92488 e!597055))

(assert (=> start!92488 true))

(declare-fun array_inv!24664 (array!66289) Bool)

(assert (=> start!92488 (array_inv!24664 a!3488)))

(declare-fun b!1051726 () Bool)

(declare-fun e!597053 () Bool)

(assert (=> b!1051726 (= e!597053 true)))

(declare-fun lt!464404 () Bool)

(declare-datatypes ((List!22196 0))(
  ( (Nil!22193) (Cons!22192 (h!23401 (_ BitVec 64)) (t!31503 List!22196)) )
))
(declare-fun contains!6138 (List!22196 (_ BitVec 64)) Bool)

(assert (=> b!1051726 (= lt!464404 (contains!6138 Nil!22193 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051727 () Bool)

(declare-fun e!597050 () Bool)

(declare-fun e!597048 () Bool)

(assert (=> b!1051727 (= e!597050 e!597048)))

(declare-fun res!700858 () Bool)

(assert (=> b!1051727 (=> (not res!700858) (not e!597048))))

(assert (=> b!1051727 (= res!700858 (not (= lt!464402 i!1381)))))

(declare-fun lt!464406 () array!66289)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66289 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051727 (= lt!464402 (arrayScanForKey!0 lt!464406 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051728 () Bool)

(declare-fun res!700856 () Bool)

(assert (=> b!1051728 (=> (not res!700856) (not e!597055))))

(assert (=> b!1051728 (= res!700856 (= (select (arr!31884 a!3488) i!1381) k!2747))))

(declare-fun b!1051729 () Bool)

(declare-fun res!700852 () Bool)

(assert (=> b!1051729 (=> (not res!700852) (not e!597055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051729 (= res!700852 (validKeyInArray!0 k!2747))))

(declare-fun b!1051730 () Bool)

(assert (=> b!1051730 (= e!597055 e!597050)))

(declare-fun res!700861 () Bool)

(assert (=> b!1051730 (=> (not res!700861) (not e!597050))))

(declare-fun arrayContainsKey!0 (array!66289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051730 (= res!700861 (arrayContainsKey!0 lt!464406 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051730 (= lt!464406 (array!66290 (store (arr!31884 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32420 a!3488)))))

(declare-fun b!1051731 () Bool)

(declare-fun res!700854 () Bool)

(assert (=> b!1051731 (=> res!700854 e!597053)))

(assert (=> b!1051731 (= res!700854 (contains!6138 Nil!22193 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051732 () Bool)

(assert (=> b!1051732 (= e!597049 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1051733 () Bool)

(declare-fun res!700857 () Bool)

(assert (=> b!1051733 (=> res!700857 e!597053)))

(declare-fun noDuplicate!1523 (List!22196) Bool)

(assert (=> b!1051733 (= res!700857 (not (noDuplicate!1523 Nil!22193)))))

(declare-fun b!1051734 () Bool)

(declare-fun res!700851 () Bool)

(assert (=> b!1051734 (=> (not res!700851) (not e!597055))))

(declare-fun arrayNoDuplicates!0 (array!66289 (_ BitVec 32) List!22196) Bool)

(assert (=> b!1051734 (= res!700851 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22193))))

(declare-fun b!1051735 () Bool)

(declare-fun e!597052 () Bool)

(assert (=> b!1051735 (= e!597052 e!597053)))

(declare-fun res!700853 () Bool)

(assert (=> b!1051735 (=> res!700853 e!597053)))

(declare-fun lt!464401 () (_ BitVec 32))

(assert (=> b!1051735 (= res!700853 (or (bvslt lt!464402 #b00000000000000000000000000000000) (bvsge lt!464401 (size!32420 a!3488)) (bvsge lt!464402 (size!32420 a!3488))))))

(assert (=> b!1051735 (arrayContainsKey!0 a!3488 k!2747 lt!464401)))

(declare-datatypes ((Unit!34440 0))(
  ( (Unit!34441) )
))
(declare-fun lt!464403 () Unit!34440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34440)

(assert (=> b!1051735 (= lt!464403 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464401))))

(assert (=> b!1051735 (= lt!464401 (bvadd #b00000000000000000000000000000001 lt!464402))))

(assert (=> b!1051735 (arrayNoDuplicates!0 a!3488 lt!464402 Nil!22193)))

(declare-fun lt!464405 () Unit!34440)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66289 (_ BitVec 32) (_ BitVec 32)) Unit!34440)

(assert (=> b!1051735 (= lt!464405 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464402))))

(declare-fun b!1051736 () Bool)

(assert (=> b!1051736 (= e!597048 (not e!597052))))

(declare-fun res!700860 () Bool)

(assert (=> b!1051736 (=> res!700860 e!597052)))

(assert (=> b!1051736 (= res!700860 (or (bvsgt lt!464402 i!1381) (bvsle i!1381 lt!464402)))))

(assert (=> b!1051736 e!597054))

(declare-fun res!700855 () Bool)

(assert (=> b!1051736 (=> (not res!700855) (not e!597054))))

(assert (=> b!1051736 (= res!700855 (= (select (store (arr!31884 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464402) k!2747))))

(assert (= (and start!92488 res!700859) b!1051734))

(assert (= (and b!1051734 res!700851) b!1051729))

(assert (= (and b!1051729 res!700852) b!1051728))

(assert (= (and b!1051728 res!700856) b!1051730))

(assert (= (and b!1051730 res!700861) b!1051727))

(assert (= (and b!1051727 res!700858) b!1051736))

(assert (= (and b!1051736 res!700855) b!1051725))

(assert (= (and b!1051725 (not res!700862)) b!1051732))

(assert (= (and b!1051736 (not res!700860)) b!1051735))

(assert (= (and b!1051735 (not res!700853)) b!1051733))

(assert (= (and b!1051733 (not res!700857)) b!1051731))

(assert (= (and b!1051731 (not res!700854)) b!1051726))

(declare-fun m!972183 () Bool)

(assert (=> b!1051726 m!972183))

(declare-fun m!972185 () Bool)

(assert (=> b!1051733 m!972185))

(declare-fun m!972187 () Bool)

(assert (=> b!1051734 m!972187))

(declare-fun m!972189 () Bool)

(assert (=> b!1051730 m!972189))

(declare-fun m!972191 () Bool)

(assert (=> b!1051730 m!972191))

(assert (=> b!1051736 m!972191))

(declare-fun m!972193 () Bool)

(assert (=> b!1051736 m!972193))

(declare-fun m!972195 () Bool)

(assert (=> b!1051727 m!972195))

(declare-fun m!972197 () Bool)

(assert (=> b!1051732 m!972197))

(declare-fun m!972199 () Bool)

(assert (=> b!1051735 m!972199))

(declare-fun m!972201 () Bool)

(assert (=> b!1051735 m!972201))

(declare-fun m!972203 () Bool)

(assert (=> b!1051735 m!972203))

(declare-fun m!972205 () Bool)

(assert (=> b!1051735 m!972205))

(declare-fun m!972207 () Bool)

(assert (=> b!1051729 m!972207))

(declare-fun m!972209 () Bool)

(assert (=> b!1051728 m!972209))

(declare-fun m!972211 () Bool)

(assert (=> start!92488 m!972211))

(declare-fun m!972213 () Bool)

(assert (=> b!1051731 m!972213))

(push 1)

(assert (not b!1051729))

(assert (not b!1051727))

(assert (not b!1051731))

(assert (not b!1051726))

(assert (not b!1051732))

