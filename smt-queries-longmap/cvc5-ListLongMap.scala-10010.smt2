; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118314 () Bool)

(assert start!118314)

(declare-fun b!1384015 () Bool)

(declare-fun res!924819 () Bool)

(declare-fun e!784534 () Bool)

(assert (=> b!1384015 (=> (not res!924819) (not e!784534))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94574 0))(
  ( (array!94575 (arr!45666 (Array (_ BitVec 32) (_ BitVec 64))) (size!46217 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94574)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1384015 (= res!924819 (and (= (size!46217 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46217 a!2971))))))

(declare-fun b!1384016 () Bool)

(declare-fun res!924820 () Bool)

(assert (=> b!1384016 (=> (not res!924820) (not e!784534))))

(assert (=> b!1384016 (= res!924820 (and (not (= (select (arr!45666 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45666 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46217 a!2971))))))

(declare-fun res!924822 () Bool)

(assert (=> start!118314 (=> (not res!924822) (not e!784534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118314 (= res!924822 (validMask!0 mask!3034))))

(assert (=> start!118314 e!784534))

(assert (=> start!118314 true))

(declare-fun array_inv!34947 (array!94574) Bool)

(assert (=> start!118314 (array_inv!34947 a!2971)))

(declare-fun b!1384017 () Bool)

(declare-fun res!924823 () Bool)

(assert (=> b!1384017 (=> (not res!924823) (not e!784534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384017 (= res!924823 (validKeyInArray!0 (select (arr!45666 a!2971) i!1094)))))

(declare-fun b!1384018 () Bool)

(assert (=> b!1384018 (= e!784534 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94574 (_ BitVec 32)) Bool)

(assert (=> b!1384018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94575 (store (arr!45666 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46217 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46002 0))(
  ( (Unit!46003) )
))
(declare-fun lt!608955 () Unit!46002)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46002)

(assert (=> b!1384018 (= lt!608955 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1384019 () Bool)

(declare-fun res!924818 () Bool)

(assert (=> b!1384019 (=> (not res!924818) (not e!784534))))

(declare-datatypes ((List!32187 0))(
  ( (Nil!32184) (Cons!32183 (h!33401 (_ BitVec 64)) (t!46873 List!32187)) )
))
(declare-fun arrayNoDuplicates!0 (array!94574 (_ BitVec 32) List!32187) Bool)

(assert (=> b!1384019 (= res!924818 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32184))))

(declare-fun b!1384020 () Bool)

(declare-fun res!924821 () Bool)

(assert (=> b!1384020 (=> (not res!924821) (not e!784534))))

(assert (=> b!1384020 (= res!924821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118314 res!924822) b!1384015))

(assert (= (and b!1384015 res!924819) b!1384017))

(assert (= (and b!1384017 res!924823) b!1384019))

(assert (= (and b!1384019 res!924818) b!1384020))

(assert (= (and b!1384020 res!924821) b!1384016))

(assert (= (and b!1384016 res!924820) b!1384018))

(declare-fun m!1269465 () Bool)

(assert (=> b!1384019 m!1269465))

(declare-fun m!1269467 () Bool)

(assert (=> b!1384016 m!1269467))

(declare-fun m!1269469 () Bool)

(assert (=> start!118314 m!1269469))

(declare-fun m!1269471 () Bool)

(assert (=> start!118314 m!1269471))

(assert (=> b!1384017 m!1269467))

(assert (=> b!1384017 m!1269467))

(declare-fun m!1269473 () Bool)

(assert (=> b!1384017 m!1269473))

(declare-fun m!1269475 () Bool)

(assert (=> b!1384020 m!1269475))

(declare-fun m!1269477 () Bool)

(assert (=> b!1384018 m!1269477))

(declare-fun m!1269479 () Bool)

(assert (=> b!1384018 m!1269479))

(declare-fun m!1269481 () Bool)

(assert (=> b!1384018 m!1269481))

(push 1)

(assert (not start!118314))

(assert (not b!1384020))

(assert (not b!1384019))

(assert (not b!1384018))

(assert (not b!1384017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

