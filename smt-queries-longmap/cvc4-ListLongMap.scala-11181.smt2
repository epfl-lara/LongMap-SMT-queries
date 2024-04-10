; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130722 () Bool)

(assert start!130722)

(declare-fun b!1533109 () Bool)

(declare-fun res!1050198 () Bool)

(declare-fun e!854145 () Bool)

(assert (=> b!1533109 (=> (not res!1050198) (not e!854145))))

(declare-datatypes ((array!101820 0))(
  ( (array!101821 (arr!49126 (Array (_ BitVec 32) (_ BitVec 64))) (size!49676 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101820)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533109 (= res!1050198 (and (= (size!49676 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49676 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49676 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050197 () Bool)

(assert (=> start!130722 (=> (not res!1050197) (not e!854145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130722 (= res!1050197 (validMask!0 mask!2480))))

(assert (=> start!130722 e!854145))

(assert (=> start!130722 true))

(declare-fun array_inv!38154 (array!101820) Bool)

(assert (=> start!130722 (array_inv!38154 a!2792)))

(declare-fun b!1533110 () Bool)

(declare-fun res!1050199 () Bool)

(assert (=> b!1533110 (=> (not res!1050199) (not e!854145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101820 (_ BitVec 32)) Bool)

(assert (=> b!1533110 (= res!1050199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533111 () Bool)

(declare-fun res!1050195 () Bool)

(assert (=> b!1533111 (=> (not res!1050195) (not e!854145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533111 (= res!1050195 (validKeyInArray!0 (select (arr!49126 a!2792) j!64)))))

(declare-fun b!1533112 () Bool)

(declare-fun res!1050196 () Bool)

(assert (=> b!1533112 (=> (not res!1050196) (not e!854145))))

(assert (=> b!1533112 (= res!1050196 (validKeyInArray!0 (select (arr!49126 a!2792) i!951)))))

(declare-fun b!1533113 () Bool)

(assert (=> b!1533113 (= e!854145 false)))

(declare-fun lt!663775 () Bool)

(declare-datatypes ((List!35600 0))(
  ( (Nil!35597) (Cons!35596 (h!37041 (_ BitVec 64)) (t!50294 List!35600)) )
))
(declare-fun arrayNoDuplicates!0 (array!101820 (_ BitVec 32) List!35600) Bool)

(assert (=> b!1533113 (= lt!663775 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35597))))

(assert (= (and start!130722 res!1050197) b!1533109))

(assert (= (and b!1533109 res!1050198) b!1533112))

(assert (= (and b!1533112 res!1050196) b!1533111))

(assert (= (and b!1533111 res!1050195) b!1533110))

(assert (= (and b!1533110 res!1050199) b!1533113))

(declare-fun m!1415825 () Bool)

(assert (=> b!1533110 m!1415825))

(declare-fun m!1415827 () Bool)

(assert (=> b!1533113 m!1415827))

(declare-fun m!1415829 () Bool)

(assert (=> start!130722 m!1415829))

(declare-fun m!1415831 () Bool)

(assert (=> start!130722 m!1415831))

(declare-fun m!1415833 () Bool)

(assert (=> b!1533112 m!1415833))

(assert (=> b!1533112 m!1415833))

(declare-fun m!1415835 () Bool)

(assert (=> b!1533112 m!1415835))

(declare-fun m!1415837 () Bool)

(assert (=> b!1533111 m!1415837))

(assert (=> b!1533111 m!1415837))

(declare-fun m!1415839 () Bool)

(assert (=> b!1533111 m!1415839))

(push 1)

(assert (not b!1533111))

(assert (not b!1533113))

(assert (not b!1533110))

(assert (not b!1533112))

(assert (not start!130722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

