; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118986 () Bool)

(assert start!118986)

(declare-fun b!1388911 () Bool)

(declare-fun res!929141 () Bool)

(declare-fun e!786794 () Bool)

(assert (=> b!1388911 (=> (not res!929141) (not e!786794))))

(declare-datatypes ((array!94983 0))(
  ( (array!94984 (arr!45860 (Array (_ BitVec 32) (_ BitVec 64))) (size!46410 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94983)

(declare-datatypes ((List!32379 0))(
  ( (Nil!32376) (Cons!32375 (h!33590 (_ BitVec 64)) (t!47073 List!32379)) )
))
(declare-fun arrayNoDuplicates!0 (array!94983 (_ BitVec 32) List!32379) Bool)

(assert (=> b!1388911 (= res!929141 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32376))))

(declare-fun b!1388913 () Bool)

(declare-fun res!929142 () Bool)

(assert (=> b!1388913 (=> (not res!929142) (not e!786794))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94983 (_ BitVec 32)) Bool)

(assert (=> b!1388913 (= res!929142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388914 () Bool)

(assert (=> b!1388914 (= e!786794 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1388915 () Bool)

(declare-fun res!929146 () Bool)

(assert (=> b!1388915 (=> (not res!929146) (not e!786794))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388915 (= res!929146 (validKeyInArray!0 (select (arr!45860 a!2901) j!112)))))

(declare-fun b!1388916 () Bool)

(declare-fun res!929143 () Bool)

(assert (=> b!1388916 (=> (not res!929143) (not e!786794))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1388916 (= res!929143 (validKeyInArray!0 (select (arr!45860 a!2901) i!1037)))))

(declare-fun res!929145 () Bool)

(assert (=> start!118986 (=> (not res!929145) (not e!786794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118986 (= res!929145 (validMask!0 mask!2840))))

(assert (=> start!118986 e!786794))

(assert (=> start!118986 true))

(declare-fun array_inv!34888 (array!94983) Bool)

(assert (=> start!118986 (array_inv!34888 a!2901)))

(declare-fun b!1388912 () Bool)

(declare-fun res!929144 () Bool)

(assert (=> b!1388912 (=> (not res!929144) (not e!786794))))

(assert (=> b!1388912 (= res!929144 (and (= (size!46410 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46410 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46410 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!118986 res!929145) b!1388912))

(assert (= (and b!1388912 res!929144) b!1388916))

(assert (= (and b!1388916 res!929143) b!1388915))

(assert (= (and b!1388915 res!929146) b!1388913))

(assert (= (and b!1388913 res!929142) b!1388911))

(assert (= (and b!1388911 res!929141) b!1388914))

(declare-fun m!1274631 () Bool)

(assert (=> b!1388916 m!1274631))

(assert (=> b!1388916 m!1274631))

(declare-fun m!1274633 () Bool)

(assert (=> b!1388916 m!1274633))

(declare-fun m!1274635 () Bool)

(assert (=> start!118986 m!1274635))

(declare-fun m!1274637 () Bool)

(assert (=> start!118986 m!1274637))

(declare-fun m!1274639 () Bool)

(assert (=> b!1388915 m!1274639))

(assert (=> b!1388915 m!1274639))

(declare-fun m!1274641 () Bool)

(assert (=> b!1388915 m!1274641))

(declare-fun m!1274643 () Bool)

(assert (=> b!1388913 m!1274643))

(declare-fun m!1274645 () Bool)

(assert (=> b!1388911 m!1274645))

(push 1)

(assert (not b!1388913))

(assert (not start!118986))

(assert (not b!1388915))

(assert (not b!1388916))

