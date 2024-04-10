; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130676 () Bool)

(assert start!130676)

(declare-fun b!1532737 () Bool)

(declare-fun res!1049824 () Bool)

(declare-fun e!854007 () Bool)

(assert (=> b!1532737 (=> (not res!1049824) (not e!854007))))

(declare-datatypes ((array!101774 0))(
  ( (array!101775 (arr!49103 (Array (_ BitVec 32) (_ BitVec 64))) (size!49653 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101774)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532737 (= res!1049824 (validKeyInArray!0 (select (arr!49103 a!2792) i!951)))))

(declare-fun b!1532738 () Bool)

(declare-fun res!1049825 () Bool)

(assert (=> b!1532738 (=> (not res!1049825) (not e!854007))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101774 (_ BitVec 32)) Bool)

(assert (=> b!1532738 (= res!1049825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532739 () Bool)

(assert (=> b!1532739 (= e!854007 false)))

(declare-fun lt!663733 () Bool)

(declare-datatypes ((List!35577 0))(
  ( (Nil!35574) (Cons!35573 (h!37018 (_ BitVec 64)) (t!50271 List!35577)) )
))
(declare-fun arrayNoDuplicates!0 (array!101774 (_ BitVec 32) List!35577) Bool)

(assert (=> b!1532739 (= lt!663733 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35574))))

(declare-fun b!1532740 () Bool)

(declare-fun res!1049827 () Bool)

(assert (=> b!1532740 (=> (not res!1049827) (not e!854007))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1532740 (= res!1049827 (and (= (size!49653 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49653 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49653 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1049823 () Bool)

(assert (=> start!130676 (=> (not res!1049823) (not e!854007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130676 (= res!1049823 (validMask!0 mask!2480))))

(assert (=> start!130676 e!854007))

(assert (=> start!130676 true))

(declare-fun array_inv!38131 (array!101774) Bool)

(assert (=> start!130676 (array_inv!38131 a!2792)))

(declare-fun b!1532741 () Bool)

(declare-fun res!1049826 () Bool)

(assert (=> b!1532741 (=> (not res!1049826) (not e!854007))))

(assert (=> b!1532741 (= res!1049826 (validKeyInArray!0 (select (arr!49103 a!2792) j!64)))))

(assert (= (and start!130676 res!1049823) b!1532740))

(assert (= (and b!1532740 res!1049827) b!1532737))

(assert (= (and b!1532737 res!1049824) b!1532741))

(assert (= (and b!1532741 res!1049826) b!1532738))

(assert (= (and b!1532738 res!1049825) b!1532739))

(declare-fun m!1415439 () Bool)

(assert (=> b!1532739 m!1415439))

(declare-fun m!1415441 () Bool)

(assert (=> b!1532738 m!1415441))

(declare-fun m!1415443 () Bool)

(assert (=> b!1532737 m!1415443))

(assert (=> b!1532737 m!1415443))

(declare-fun m!1415445 () Bool)

(assert (=> b!1532737 m!1415445))

(declare-fun m!1415447 () Bool)

(assert (=> b!1532741 m!1415447))

(assert (=> b!1532741 m!1415447))

(declare-fun m!1415449 () Bool)

(assert (=> b!1532741 m!1415449))

(declare-fun m!1415451 () Bool)

(assert (=> start!130676 m!1415451))

(declare-fun m!1415453 () Bool)

(assert (=> start!130676 m!1415453))

(push 1)

(assert (not b!1532741))

(assert (not b!1532738))

(assert (not b!1532737))

(assert (not start!130676))

(assert (not b!1532739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

