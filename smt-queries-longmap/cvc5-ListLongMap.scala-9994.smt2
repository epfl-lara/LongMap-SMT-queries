; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117970 () Bool)

(assert start!117970)

(declare-fun b!1381924 () Bool)

(declare-fun res!923553 () Bool)

(declare-fun e!783323 () Bool)

(assert (=> b!1381924 (=> (not res!923553) (not e!783323))))

(declare-datatypes ((array!94361 0))(
  ( (array!94362 (arr!45563 (Array (_ BitVec 32) (_ BitVec 64))) (size!46113 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94361)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381924 (= res!923553 (and (not (= (select (arr!45563 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45563 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46113 a!2971))))))

(declare-fun b!1381925 () Bool)

(declare-fun res!923557 () Bool)

(assert (=> b!1381925 (=> (not res!923557) (not e!783323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381925 (= res!923557 (validKeyInArray!0 (select (arr!45563 a!2971) i!1094)))))

(declare-fun b!1381926 () Bool)

(declare-fun res!923554 () Bool)

(assert (=> b!1381926 (=> (not res!923554) (not e!783323))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94361 (_ BitVec 32)) Bool)

(assert (=> b!1381926 (= res!923554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381927 () Bool)

(declare-fun res!923556 () Bool)

(assert (=> b!1381927 (=> (not res!923556) (not e!783323))))

(declare-datatypes ((List!32097 0))(
  ( (Nil!32094) (Cons!32093 (h!33302 (_ BitVec 64)) (t!46791 List!32097)) )
))
(declare-fun arrayNoDuplicates!0 (array!94361 (_ BitVec 32) List!32097) Bool)

(assert (=> b!1381927 (= res!923556 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32094))))

(declare-fun b!1381928 () Bool)

(declare-fun res!923555 () Bool)

(assert (=> b!1381928 (=> (not res!923555) (not e!783323))))

(assert (=> b!1381928 (= res!923555 (and (= (size!46113 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46113 a!2971))))))

(declare-fun b!1381929 () Bool)

(assert (=> b!1381929 (= e!783323 (not true))))

(assert (=> b!1381929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94362 (store (arr!45563 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46113 a!2971)) mask!3034)))

(declare-datatypes ((Unit!46029 0))(
  ( (Unit!46030) )
))
(declare-fun lt!608316 () Unit!46029)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46029)

(assert (=> b!1381929 (= lt!608316 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun res!923552 () Bool)

(assert (=> start!117970 (=> (not res!923552) (not e!783323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117970 (= res!923552 (validMask!0 mask!3034))))

(assert (=> start!117970 e!783323))

(assert (=> start!117970 true))

(declare-fun array_inv!34591 (array!94361) Bool)

(assert (=> start!117970 (array_inv!34591 a!2971)))

(assert (= (and start!117970 res!923552) b!1381928))

(assert (= (and b!1381928 res!923555) b!1381925))

(assert (= (and b!1381925 res!923557) b!1381927))

(assert (= (and b!1381927 res!923556) b!1381926))

(assert (= (and b!1381926 res!923554) b!1381924))

(assert (= (and b!1381924 res!923553) b!1381929))

(declare-fun m!1267101 () Bool)

(assert (=> start!117970 m!1267101))

(declare-fun m!1267103 () Bool)

(assert (=> start!117970 m!1267103))

(declare-fun m!1267105 () Bool)

(assert (=> b!1381927 m!1267105))

(declare-fun m!1267107 () Bool)

(assert (=> b!1381926 m!1267107))

(declare-fun m!1267109 () Bool)

(assert (=> b!1381929 m!1267109))

(declare-fun m!1267111 () Bool)

(assert (=> b!1381929 m!1267111))

(declare-fun m!1267113 () Bool)

(assert (=> b!1381929 m!1267113))

(declare-fun m!1267115 () Bool)

(assert (=> b!1381924 m!1267115))

(assert (=> b!1381925 m!1267115))

(assert (=> b!1381925 m!1267115))

(declare-fun m!1267117 () Bool)

(assert (=> b!1381925 m!1267117))

(push 1)

(assert (not start!117970))

(assert (not b!1381925))

(assert (not b!1381929))

(assert (not b!1381927))

(assert (not b!1381926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

