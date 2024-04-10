; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117986 () Bool)

(assert start!117986)

(declare-fun b!1382068 () Bool)

(declare-fun e!783371 () Bool)

(declare-datatypes ((array!94377 0))(
  ( (array!94378 (arr!45571 (Array (_ BitVec 32) (_ BitVec 64))) (size!46121 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94377)

(assert (=> b!1382068 (= e!783371 (not (bvsle #b00000000000000000000000000000000 (size!46121 a!2971))))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94377 (_ BitVec 32)) Bool)

(assert (=> b!1382068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94378 (store (arr!45571 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46121 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46045 0))(
  ( (Unit!46046) )
))
(declare-fun lt!608340 () Unit!46045)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46045)

(assert (=> b!1382068 (= lt!608340 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1382069 () Bool)

(declare-fun res!923701 () Bool)

(assert (=> b!1382069 (=> (not res!923701) (not e!783371))))

(declare-datatypes ((List!32105 0))(
  ( (Nil!32102) (Cons!32101 (h!33310 (_ BitVec 64)) (t!46799 List!32105)) )
))
(declare-fun arrayNoDuplicates!0 (array!94377 (_ BitVec 32) List!32105) Bool)

(assert (=> b!1382069 (= res!923701 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32102))))

(declare-fun b!1382070 () Bool)

(declare-fun res!923696 () Bool)

(assert (=> b!1382070 (=> (not res!923696) (not e!783371))))

(assert (=> b!1382070 (= res!923696 (and (not (= (select (arr!45571 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45571 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46121 a!2971))))))

(declare-fun b!1382071 () Bool)

(declare-fun res!923699 () Bool)

(assert (=> b!1382071 (=> (not res!923699) (not e!783371))))

(assert (=> b!1382071 (= res!923699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923698 () Bool)

(assert (=> start!117986 (=> (not res!923698) (not e!783371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117986 (= res!923698 (validMask!0 mask!3034))))

(assert (=> start!117986 e!783371))

(assert (=> start!117986 true))

(declare-fun array_inv!34599 (array!94377) Bool)

(assert (=> start!117986 (array_inv!34599 a!2971)))

(declare-fun b!1382072 () Bool)

(declare-fun res!923697 () Bool)

(assert (=> b!1382072 (=> (not res!923697) (not e!783371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382072 (= res!923697 (validKeyInArray!0 (select (arr!45571 a!2971) i!1094)))))

(declare-fun b!1382073 () Bool)

(declare-fun res!923700 () Bool)

(assert (=> b!1382073 (=> (not res!923700) (not e!783371))))

(assert (=> b!1382073 (= res!923700 (and (= (size!46121 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46121 a!2971))))))

(assert (= (and start!117986 res!923698) b!1382073))

(assert (= (and b!1382073 res!923700) b!1382072))

(assert (= (and b!1382072 res!923697) b!1382069))

(assert (= (and b!1382069 res!923701) b!1382071))

(assert (= (and b!1382071 res!923699) b!1382070))

(assert (= (and b!1382070 res!923696) b!1382068))

(declare-fun m!1267245 () Bool)

(assert (=> b!1382072 m!1267245))

(assert (=> b!1382072 m!1267245))

(declare-fun m!1267247 () Bool)

(assert (=> b!1382072 m!1267247))

(declare-fun m!1267249 () Bool)

(assert (=> b!1382069 m!1267249))

(declare-fun m!1267251 () Bool)

(assert (=> b!1382068 m!1267251))

(declare-fun m!1267253 () Bool)

(assert (=> b!1382068 m!1267253))

(declare-fun m!1267255 () Bool)

(assert (=> b!1382068 m!1267255))

(assert (=> b!1382070 m!1267245))

(declare-fun m!1267257 () Bool)

(assert (=> b!1382071 m!1267257))

(declare-fun m!1267259 () Bool)

(assert (=> start!117986 m!1267259))

(declare-fun m!1267261 () Bool)

(assert (=> start!117986 m!1267261))

(push 1)

(assert (not b!1382069))

(assert (not start!117986))

(assert (not b!1382072))

