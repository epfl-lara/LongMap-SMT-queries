; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117948 () Bool)

(assert start!117948)

(declare-fun b!1381770 () Bool)

(declare-fun res!923400 () Bool)

(declare-fun e!783257 () Bool)

(assert (=> b!1381770 (=> (not res!923400) (not e!783257))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94339 0))(
  ( (array!94340 (arr!45552 (Array (_ BitVec 32) (_ BitVec 64))) (size!46102 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94339)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381770 (= res!923400 (and (= (size!46102 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46102 a!2971))))))

(declare-fun b!1381772 () Bool)

(declare-fun res!923398 () Bool)

(assert (=> b!1381772 (=> (not res!923398) (not e!783257))))

(declare-datatypes ((List!32086 0))(
  ( (Nil!32083) (Cons!32082 (h!33291 (_ BitVec 64)) (t!46780 List!32086)) )
))
(declare-fun arrayNoDuplicates!0 (array!94339 (_ BitVec 32) List!32086) Bool)

(assert (=> b!1381772 (= res!923398 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32083))))

(declare-fun b!1381773 () Bool)

(assert (=> b!1381773 (= e!783257 false)))

(declare-fun lt!608283 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94339 (_ BitVec 32)) Bool)

(assert (=> b!1381773 (= lt!608283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381771 () Bool)

(declare-fun res!923399 () Bool)

(assert (=> b!1381771 (=> (not res!923399) (not e!783257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381771 (= res!923399 (validKeyInArray!0 (select (arr!45552 a!2971) i!1094)))))

(declare-fun res!923401 () Bool)

(assert (=> start!117948 (=> (not res!923401) (not e!783257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117948 (= res!923401 (validMask!0 mask!3034))))

(assert (=> start!117948 e!783257))

(assert (=> start!117948 true))

(declare-fun array_inv!34580 (array!94339) Bool)

(assert (=> start!117948 (array_inv!34580 a!2971)))

(assert (= (and start!117948 res!923401) b!1381770))

(assert (= (and b!1381770 res!923400) b!1381771))

(assert (= (and b!1381771 res!923399) b!1381772))

(assert (= (and b!1381772 res!923398) b!1381773))

(declare-fun m!1266951 () Bool)

(assert (=> b!1381772 m!1266951))

(declare-fun m!1266953 () Bool)

(assert (=> b!1381773 m!1266953))

(declare-fun m!1266955 () Bool)

(assert (=> b!1381771 m!1266955))

(assert (=> b!1381771 m!1266955))

(declare-fun m!1266957 () Bool)

(assert (=> b!1381771 m!1266957))

(declare-fun m!1266959 () Bool)

(assert (=> start!117948 m!1266959))

(declare-fun m!1266961 () Bool)

(assert (=> start!117948 m!1266961))

(check-sat (not start!117948) (not b!1381772) (not b!1381771) (not b!1381773))
