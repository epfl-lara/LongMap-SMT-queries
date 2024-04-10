; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134822 () Bool)

(assert start!134822)

(declare-fun res!1073887 () Bool)

(declare-fun e!876394 () Bool)

(assert (=> start!134822 (=> (not res!1073887) (not e!876394))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134822 (= res!1073887 (validMask!0 mask!889))))

(assert (=> start!134822 e!876394))

(assert (=> start!134822 true))

(declare-datatypes ((array!104919 0))(
  ( (array!104920 (arr!50629 (Array (_ BitVec 32) (_ BitVec 64))) (size!51179 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104919)

(declare-fun array_inv!39356 (array!104919) Bool)

(assert (=> start!134822 (array_inv!39356 _keys!600)))

(declare-fun b!1571770 () Bool)

(declare-fun res!1073889 () Bool)

(assert (=> b!1571770 (=> (not res!1073889) (not e!876394))))

(assert (=> b!1571770 (= res!1073889 (= (size!51179 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571771 () Bool)

(declare-fun res!1073888 () Bool)

(assert (=> b!1571771 (=> (not res!1073888) (not e!876394))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571771 (= res!1073888 (validKeyInArray!0 k!754))))

(declare-fun b!1571772 () Bool)

(assert (=> b!1571772 (= e!876394 false)))

(declare-fun lt!673735 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571772 (= lt!673735 (toIndex!0 k!754 mask!889))))

(assert (= (and start!134822 res!1073887) b!1571770))

(assert (= (and b!1571770 res!1073889) b!1571771))

(assert (= (and b!1571771 res!1073888) b!1571772))

(declare-fun m!1445647 () Bool)

(assert (=> start!134822 m!1445647))

(declare-fun m!1445649 () Bool)

(assert (=> start!134822 m!1445649))

(declare-fun m!1445651 () Bool)

(assert (=> b!1571771 m!1445651))

(declare-fun m!1445653 () Bool)

(assert (=> b!1571772 m!1445653))

(push 1)

(assert (not start!134822))

(assert (not b!1571771))

(assert (not b!1571772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

