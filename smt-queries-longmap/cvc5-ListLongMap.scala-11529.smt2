; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134258 () Bool)

(assert start!134258)

(declare-datatypes ((array!104748 0))(
  ( (array!104749 (arr!50554 (Array (_ BitVec 32) (_ BitVec 64))) (size!51104 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104748)

(declare-datatypes ((List!36686 0))(
  ( (Nil!36683) (Cons!36682 (h!38129 (_ BitVec 64)) (t!51594 List!36686)) )
))
(declare-fun acc!619 () List!36686)

(declare-fun b!1568155 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun e!874198 () Bool)

(declare-fun contains!10388 (List!36686 (_ BitVec 64)) Bool)

(assert (=> b!1568155 (= e!874198 (not (contains!10388 acc!619 (select (arr!50554 a!3481) from!2856))))))

(declare-fun b!1568156 () Bool)

(declare-fun res!1071846 () Bool)

(declare-fun e!874197 () Bool)

(assert (=> b!1568156 (=> (not res!1071846) (not e!874197))))

(declare-fun noDuplicate!2660 (List!36686) Bool)

(assert (=> b!1568156 (= res!1071846 (noDuplicate!2660 acc!619))))

(declare-fun res!1071843 () Bool)

(assert (=> start!134258 (=> (not res!1071843) (not e!874197))))

(assert (=> start!134258 (= res!1071843 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51104 a!3481)) (bvslt (size!51104 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134258 e!874197))

(assert (=> start!134258 true))

(declare-fun array_inv!39281 (array!104748) Bool)

(assert (=> start!134258 (array_inv!39281 a!3481)))

(declare-fun b!1568157 () Bool)

(declare-fun res!1071844 () Bool)

(assert (=> b!1568157 (=> (not res!1071844) (not e!874197))))

(assert (=> b!1568157 (= res!1071844 (not (contains!10388 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568158 () Bool)

(declare-fun res!1071842 () Bool)

(assert (=> b!1568158 (=> (not res!1071842) (not e!874197))))

(assert (=> b!1568158 (= res!1071842 (bvslt from!2856 (size!51104 a!3481)))))

(declare-fun b!1568159 () Bool)

(assert (=> b!1568159 (= e!874197 false)))

(declare-fun lt!673123 () Bool)

(assert (=> b!1568159 (= lt!673123 e!874198)))

(declare-fun res!1071845 () Bool)

(assert (=> b!1568159 (=> res!1071845 e!874198)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568159 (= res!1071845 (not (validKeyInArray!0 (select (arr!50554 a!3481) from!2856))))))

(declare-fun b!1568160 () Bool)

(declare-fun res!1071841 () Bool)

(assert (=> b!1568160 (=> (not res!1071841) (not e!874197))))

(assert (=> b!1568160 (= res!1071841 (not (contains!10388 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134258 res!1071843) b!1568156))

(assert (= (and b!1568156 res!1071846) b!1568160))

(assert (= (and b!1568160 res!1071841) b!1568157))

(assert (= (and b!1568157 res!1071844) b!1568158))

(assert (= (and b!1568158 res!1071842) b!1568159))

(assert (= (and b!1568159 (not res!1071845)) b!1568155))

(declare-fun m!1442875 () Bool)

(assert (=> b!1568157 m!1442875))

(declare-fun m!1442877 () Bool)

(assert (=> start!134258 m!1442877))

(declare-fun m!1442879 () Bool)

(assert (=> b!1568160 m!1442879))

(declare-fun m!1442881 () Bool)

(assert (=> b!1568156 m!1442881))

(declare-fun m!1442883 () Bool)

(assert (=> b!1568159 m!1442883))

(assert (=> b!1568159 m!1442883))

(declare-fun m!1442885 () Bool)

(assert (=> b!1568159 m!1442885))

(assert (=> b!1568155 m!1442883))

(assert (=> b!1568155 m!1442883))

(declare-fun m!1442887 () Bool)

(assert (=> b!1568155 m!1442887))

(push 1)

(assert (not b!1568155))

(assert (not b!1568156))

(assert (not start!134258))

(assert (not b!1568160))

(assert (not b!1568157))

(assert (not b!1568159))

(check-sat)

