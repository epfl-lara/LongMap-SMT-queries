; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118988 () Bool)

(assert start!118988)

(declare-fun b!1388929 () Bool)

(declare-fun res!929161 () Bool)

(declare-fun e!786800 () Bool)

(assert (=> b!1388929 (=> (not res!929161) (not e!786800))))

(declare-datatypes ((array!94985 0))(
  ( (array!94986 (arr!45861 (Array (_ BitVec 32) (_ BitVec 64))) (size!46411 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94985)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388929 (= res!929161 (validKeyInArray!0 (select (arr!45861 a!2901) i!1037)))))

(declare-fun res!929162 () Bool)

(assert (=> start!118988 (=> (not res!929162) (not e!786800))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118988 (= res!929162 (validMask!0 mask!2840))))

(assert (=> start!118988 e!786800))

(assert (=> start!118988 true))

(declare-fun array_inv!34889 (array!94985) Bool)

(assert (=> start!118988 (array_inv!34889 a!2901)))

(declare-fun b!1388930 () Bool)

(assert (=> b!1388930 (= e!786800 (bvslt mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1388931 () Bool)

(declare-fun res!929159 () Bool)

(assert (=> b!1388931 (=> (not res!929159) (not e!786800))))

(declare-datatypes ((List!32380 0))(
  ( (Nil!32377) (Cons!32376 (h!33591 (_ BitVec 64)) (t!47074 List!32380)) )
))
(declare-fun arrayNoDuplicates!0 (array!94985 (_ BitVec 32) List!32380) Bool)

(assert (=> b!1388931 (= res!929159 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32377))))

(declare-fun b!1388932 () Bool)

(declare-fun res!929164 () Bool)

(assert (=> b!1388932 (=> (not res!929164) (not e!786800))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1388932 (= res!929164 (and (= (size!46411 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46411 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46411 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1388933 () Bool)

(declare-fun res!929163 () Bool)

(assert (=> b!1388933 (=> (not res!929163) (not e!786800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94985 (_ BitVec 32)) Bool)

(assert (=> b!1388933 (= res!929163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1388934 () Bool)

(declare-fun res!929160 () Bool)

(assert (=> b!1388934 (=> (not res!929160) (not e!786800))))

(assert (=> b!1388934 (= res!929160 (validKeyInArray!0 (select (arr!45861 a!2901) j!112)))))

(assert (= (and start!118988 res!929162) b!1388932))

(assert (= (and b!1388932 res!929164) b!1388929))

(assert (= (and b!1388929 res!929161) b!1388934))

(assert (= (and b!1388934 res!929160) b!1388933))

(assert (= (and b!1388933 res!929163) b!1388931))

(assert (= (and b!1388931 res!929159) b!1388930))

(declare-fun m!1274647 () Bool)

(assert (=> b!1388929 m!1274647))

(assert (=> b!1388929 m!1274647))

(declare-fun m!1274649 () Bool)

(assert (=> b!1388929 m!1274649))

(declare-fun m!1274651 () Bool)

(assert (=> start!118988 m!1274651))

(declare-fun m!1274653 () Bool)

(assert (=> start!118988 m!1274653))

(declare-fun m!1274655 () Bool)

(assert (=> b!1388931 m!1274655))

(declare-fun m!1274657 () Bool)

(assert (=> b!1388934 m!1274657))

(assert (=> b!1388934 m!1274657))

(declare-fun m!1274659 () Bool)

(assert (=> b!1388934 m!1274659))

(declare-fun m!1274661 () Bool)

(assert (=> b!1388933 m!1274661))

(check-sat (not start!118988) (not b!1388934) (not b!1388933) (not b!1388931) (not b!1388929))
(check-sat)
