; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130688 () Bool)

(assert start!130688)

(declare-fun res!1049925 () Bool)

(declare-fun e!854044 () Bool)

(assert (=> start!130688 (=> (not res!1049925) (not e!854044))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130688 (= res!1049925 (validMask!0 mask!2480))))

(assert (=> start!130688 e!854044))

(assert (=> start!130688 true))

(declare-datatypes ((array!101786 0))(
  ( (array!101787 (arr!49109 (Array (_ BitVec 32) (_ BitVec 64))) (size!49659 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101786)

(declare-fun array_inv!38137 (array!101786) Bool)

(assert (=> start!130688 (array_inv!38137 a!2792)))

(declare-fun b!1532836 () Bool)

(declare-fun res!1049923 () Bool)

(assert (=> b!1532836 (=> (not res!1049923) (not e!854044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101786 (_ BitVec 32)) Bool)

(assert (=> b!1532836 (= res!1049923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532837 () Bool)

(declare-fun res!1049926 () Bool)

(assert (=> b!1532837 (=> (not res!1049926) (not e!854044))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532837 (= res!1049926 (validKeyInArray!0 (select (arr!49109 a!2792) j!64)))))

(declare-fun b!1532838 () Bool)

(declare-fun res!1049924 () Bool)

(assert (=> b!1532838 (=> (not res!1049924) (not e!854044))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532838 (= res!1049924 (validKeyInArray!0 (select (arr!49109 a!2792) i!951)))))

(declare-fun b!1532839 () Bool)

(declare-fun res!1049922 () Bool)

(assert (=> b!1532839 (=> (not res!1049922) (not e!854044))))

(assert (=> b!1532839 (= res!1049922 (and (= (size!49659 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49659 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49659 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532840 () Bool)

(assert (=> b!1532840 (= e!854044 false)))

(declare-fun lt!663742 () Bool)

(declare-datatypes ((List!35583 0))(
  ( (Nil!35580) (Cons!35579 (h!37024 (_ BitVec 64)) (t!50277 List!35583)) )
))
(declare-fun arrayNoDuplicates!0 (array!101786 (_ BitVec 32) List!35583) Bool)

(assert (=> b!1532840 (= lt!663742 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35580))))

(assert (= (and start!130688 res!1049925) b!1532839))

(assert (= (and b!1532839 res!1049922) b!1532838))

(assert (= (and b!1532838 res!1049924) b!1532837))

(assert (= (and b!1532837 res!1049926) b!1532836))

(assert (= (and b!1532836 res!1049923) b!1532840))

(declare-fun m!1415541 () Bool)

(assert (=> b!1532840 m!1415541))

(declare-fun m!1415543 () Bool)

(assert (=> b!1532838 m!1415543))

(assert (=> b!1532838 m!1415543))

(declare-fun m!1415545 () Bool)

(assert (=> b!1532838 m!1415545))

(declare-fun m!1415547 () Bool)

(assert (=> b!1532837 m!1415547))

(assert (=> b!1532837 m!1415547))

(declare-fun m!1415549 () Bool)

(assert (=> b!1532837 m!1415549))

(declare-fun m!1415551 () Bool)

(assert (=> b!1532836 m!1415551))

(declare-fun m!1415553 () Bool)

(assert (=> start!130688 m!1415553))

(declare-fun m!1415555 () Bool)

(assert (=> start!130688 m!1415555))

(push 1)

(assert (not b!1532840))

(assert (not b!1532837))

(assert (not b!1532836))

(assert (not b!1532838))

(assert (not start!130688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

