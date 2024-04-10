; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117968 () Bool)

(assert start!117968)

(declare-fun b!1381906 () Bool)

(declare-fun e!783316 () Bool)

(assert (=> b!1381906 (= e!783316 (not true))))

(declare-datatypes ((array!94359 0))(
  ( (array!94360 (arr!45562 (Array (_ BitVec 32) (_ BitVec 64))) (size!46112 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94359)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94359 (_ BitVec 32)) Bool)

(assert (=> b!1381906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94360 (store (arr!45562 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46112 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46027 0))(
  ( (Unit!46028) )
))
(declare-fun lt!608313 () Unit!46027)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46027)

(assert (=> b!1381906 (= lt!608313 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun res!923535 () Bool)

(assert (=> start!117968 (=> (not res!923535) (not e!783316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117968 (= res!923535 (validMask!0 mask!3034))))

(assert (=> start!117968 e!783316))

(assert (=> start!117968 true))

(declare-fun array_inv!34590 (array!94359) Bool)

(assert (=> start!117968 (array_inv!34590 a!2971)))

(declare-fun b!1381907 () Bool)

(declare-fun res!923536 () Bool)

(assert (=> b!1381907 (=> (not res!923536) (not e!783316))))

(assert (=> b!1381907 (= res!923536 (and (= (size!46112 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46112 a!2971))))))

(declare-fun b!1381908 () Bool)

(declare-fun res!923534 () Bool)

(assert (=> b!1381908 (=> (not res!923534) (not e!783316))))

(assert (=> b!1381908 (= res!923534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381909 () Bool)

(declare-fun res!923539 () Bool)

(assert (=> b!1381909 (=> (not res!923539) (not e!783316))))

(declare-datatypes ((List!32096 0))(
  ( (Nil!32093) (Cons!32092 (h!33301 (_ BitVec 64)) (t!46790 List!32096)) )
))
(declare-fun arrayNoDuplicates!0 (array!94359 (_ BitVec 32) List!32096) Bool)

(assert (=> b!1381909 (= res!923539 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32093))))

(declare-fun b!1381910 () Bool)

(declare-fun res!923537 () Bool)

(assert (=> b!1381910 (=> (not res!923537) (not e!783316))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381910 (= res!923537 (validKeyInArray!0 (select (arr!45562 a!2971) i!1094)))))

(declare-fun b!1381911 () Bool)

(declare-fun res!923538 () Bool)

(assert (=> b!1381911 (=> (not res!923538) (not e!783316))))

(assert (=> b!1381911 (= res!923538 (and (not (= (select (arr!45562 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45562 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46112 a!2971))))))

(assert (= (and start!117968 res!923535) b!1381907))

(assert (= (and b!1381907 res!923536) b!1381910))

(assert (= (and b!1381910 res!923537) b!1381909))

(assert (= (and b!1381909 res!923539) b!1381908))

(assert (= (and b!1381908 res!923534) b!1381911))

(assert (= (and b!1381911 res!923538) b!1381906))

(declare-fun m!1267083 () Bool)

(assert (=> b!1381910 m!1267083))

(assert (=> b!1381910 m!1267083))

(declare-fun m!1267085 () Bool)

(assert (=> b!1381910 m!1267085))

(declare-fun m!1267087 () Bool)

(assert (=> b!1381906 m!1267087))

(declare-fun m!1267089 () Bool)

(assert (=> b!1381906 m!1267089))

(declare-fun m!1267091 () Bool)

(assert (=> b!1381906 m!1267091))

(declare-fun m!1267093 () Bool)

(assert (=> start!117968 m!1267093))

(declare-fun m!1267095 () Bool)

(assert (=> start!117968 m!1267095))

(declare-fun m!1267097 () Bool)

(assert (=> b!1381909 m!1267097))

(declare-fun m!1267099 () Bool)

(assert (=> b!1381908 m!1267099))

(assert (=> b!1381911 m!1267083))

(push 1)

(assert (not b!1381908))

(assert (not b!1381910))

(assert (not b!1381909))

(assert (not start!117968))

(assert (not b!1381906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

