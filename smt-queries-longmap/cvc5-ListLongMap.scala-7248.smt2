; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92550 () Bool)

(assert start!92550)

(declare-fun b!1052748 () Bool)

(declare-fun res!701876 () Bool)

(declare-fun e!597759 () Bool)

(assert (=> b!1052748 (=> (not res!701876) (not e!597759))))

(declare-datatypes ((array!66351 0))(
  ( (array!66352 (arr!31915 (Array (_ BitVec 32) (_ BitVec 64))) (size!32451 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66351)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052748 (= res!701876 (= (select (arr!31915 a!3488) i!1381) k!2747))))

(declare-fun b!1052749 () Bool)

(declare-fun res!701877 () Bool)

(assert (=> b!1052749 (=> (not res!701877) (not e!597759))))

(declare-datatypes ((List!22227 0))(
  ( (Nil!22224) (Cons!22223 (h!23432 (_ BitVec 64)) (t!31534 List!22227)) )
))
(declare-fun arrayNoDuplicates!0 (array!66351 (_ BitVec 32) List!22227) Bool)

(assert (=> b!1052749 (= res!701877 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22224))))

(declare-fun b!1052751 () Bool)

(declare-fun e!597757 () Bool)

(assert (=> b!1052751 (= e!597757 (not true))))

(declare-fun lt!464952 () (_ BitVec 32))

(assert (=> b!1052751 (= (select (store (arr!31915 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464952) k!2747)))

(declare-fun b!1052752 () Bool)

(declare-fun e!597760 () Bool)

(assert (=> b!1052752 (= e!597759 e!597760)))

(declare-fun res!701879 () Bool)

(assert (=> b!1052752 (=> (not res!701879) (not e!597760))))

(declare-fun lt!464951 () array!66351)

(declare-fun arrayContainsKey!0 (array!66351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052752 (= res!701879 (arrayContainsKey!0 lt!464951 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052752 (= lt!464951 (array!66352 (store (arr!31915 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32451 a!3488)))))

(declare-fun b!1052753 () Bool)

(assert (=> b!1052753 (= e!597760 e!597757)))

(declare-fun res!701874 () Bool)

(assert (=> b!1052753 (=> (not res!701874) (not e!597757))))

(assert (=> b!1052753 (= res!701874 (not (= lt!464952 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66351 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052753 (= lt!464952 (arrayScanForKey!0 lt!464951 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!701875 () Bool)

(assert (=> start!92550 (=> (not res!701875) (not e!597759))))

(assert (=> start!92550 (= res!701875 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32451 a!3488)) (bvslt (size!32451 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92550 e!597759))

(assert (=> start!92550 true))

(declare-fun array_inv!24695 (array!66351) Bool)

(assert (=> start!92550 (array_inv!24695 a!3488)))

(declare-fun b!1052750 () Bool)

(declare-fun res!701878 () Bool)

(assert (=> b!1052750 (=> (not res!701878) (not e!597759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052750 (= res!701878 (validKeyInArray!0 k!2747))))

(assert (= (and start!92550 res!701875) b!1052749))

(assert (= (and b!1052749 res!701877) b!1052750))

(assert (= (and b!1052750 res!701878) b!1052748))

(assert (= (and b!1052748 res!701876) b!1052752))

(assert (= (and b!1052752 res!701879) b!1052753))

(assert (= (and b!1052753 res!701874) b!1052751))

(declare-fun m!973157 () Bool)

(assert (=> b!1052751 m!973157))

(declare-fun m!973159 () Bool)

(assert (=> b!1052751 m!973159))

(declare-fun m!973161 () Bool)

(assert (=> b!1052753 m!973161))

(declare-fun m!973163 () Bool)

(assert (=> b!1052750 m!973163))

(declare-fun m!973165 () Bool)

(assert (=> b!1052749 m!973165))

(declare-fun m!973167 () Bool)

(assert (=> b!1052748 m!973167))

(declare-fun m!973169 () Bool)

(assert (=> start!92550 m!973169))

(declare-fun m!973171 () Bool)

(assert (=> b!1052752 m!973171))

(assert (=> b!1052752 m!973157))

(push 1)

(assert (not b!1052750))

(assert (not start!92550))

(assert (not b!1052749))

(assert (not b!1052752))

(assert (not b!1052753))

(check-sat)

(pop 1)

