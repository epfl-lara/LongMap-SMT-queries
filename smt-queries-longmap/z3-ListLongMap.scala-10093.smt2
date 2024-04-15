; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118982 () Bool)

(assert start!118982)

(declare-fun res!929111 () Bool)

(declare-fun e!786754 () Bool)

(assert (=> start!118982 (=> (not res!929111) (not e!786754))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118982 (= res!929111 (validMask!0 mask!2840))))

(assert (=> start!118982 e!786754))

(assert (=> start!118982 true))

(declare-datatypes ((array!94932 0))(
  ( (array!94933 (arr!45835 (Array (_ BitVec 32) (_ BitVec 64))) (size!46387 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94932)

(declare-fun array_inv!35068 (array!94932) Bool)

(assert (=> start!118982 (array_inv!35068 a!2901)))

(declare-fun b!1388830 () Bool)

(declare-fun res!929114 () Bool)

(assert (=> b!1388830 (=> (not res!929114) (not e!786754))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388830 (= res!929114 (and (= (size!46387 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46387 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46387 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388831 () Bool)

(assert (=> b!1388831 (= e!786754 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1388832 () Bool)

(declare-fun res!929115 () Bool)

(assert (=> b!1388832 (=> (not res!929115) (not e!786754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94932 (_ BitVec 32)) Bool)

(assert (=> b!1388832 (= res!929115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388833 () Bool)

(declare-fun res!929112 () Bool)

(assert (=> b!1388833 (=> (not res!929112) (not e!786754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388833 (= res!929112 (validKeyInArray!0 (select (arr!45835 a!2901) j!112)))))

(declare-fun b!1388834 () Bool)

(declare-fun res!929113 () Bool)

(assert (=> b!1388834 (=> (not res!929113) (not e!786754))))

(assert (=> b!1388834 (= res!929113 (validKeyInArray!0 (select (arr!45835 a!2901) i!1037)))))

(declare-fun b!1388835 () Bool)

(declare-fun res!929116 () Bool)

(assert (=> b!1388835 (=> (not res!929116) (not e!786754))))

(declare-datatypes ((List!32432 0))(
  ( (Nil!32429) (Cons!32428 (h!33643 (_ BitVec 64)) (t!47118 List!32432)) )
))
(declare-fun arrayNoDuplicates!0 (array!94932 (_ BitVec 32) List!32432) Bool)

(assert (=> b!1388835 (= res!929116 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32429))))

(assert (= (and start!118982 res!929111) b!1388830))

(assert (= (and b!1388830 res!929114) b!1388834))

(assert (= (and b!1388834 res!929113) b!1388833))

(assert (= (and b!1388833 res!929112) b!1388832))

(assert (= (and b!1388832 res!929115) b!1388835))

(assert (= (and b!1388835 res!929116) b!1388831))

(declare-fun m!1274095 () Bool)

(assert (=> b!1388833 m!1274095))

(assert (=> b!1388833 m!1274095))

(declare-fun m!1274097 () Bool)

(assert (=> b!1388833 m!1274097))

(declare-fun m!1274099 () Bool)

(assert (=> b!1388834 m!1274099))

(assert (=> b!1388834 m!1274099))

(declare-fun m!1274101 () Bool)

(assert (=> b!1388834 m!1274101))

(declare-fun m!1274103 () Bool)

(assert (=> start!118982 m!1274103))

(declare-fun m!1274105 () Bool)

(assert (=> start!118982 m!1274105))

(declare-fun m!1274107 () Bool)

(assert (=> b!1388832 m!1274107))

(declare-fun m!1274109 () Bool)

(assert (=> b!1388835 m!1274109))

(check-sat (not b!1388833) (not b!1388835) (not b!1388832) (not start!118982) (not b!1388834))
(check-sat)
