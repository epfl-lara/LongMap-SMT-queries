; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134242 () Bool)

(assert start!134242)

(declare-fun res!1071937 () Bool)

(declare-fun e!874125 () Bool)

(assert (=> start!134242 (=> (not res!1071937) (not e!874125))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104710 0))(
  ( (array!104711 (arr!50536 (Array (_ BitVec 32) (_ BitVec 64))) (size!51088 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104710)

(assert (=> start!134242 (= res!1071937 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51088 a!3481)) (bvslt (size!51088 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134242 e!874125))

(assert (=> start!134242 true))

(declare-fun array_inv!39472 (array!104710) Bool)

(assert (=> start!134242 (array_inv!39472 a!3481)))

(declare-fun b!1568067 () Bool)

(declare-fun res!1071938 () Bool)

(assert (=> b!1568067 (=> (not res!1071938) (not e!874125))))

(declare-datatypes ((List!36744 0))(
  ( (Nil!36741) (Cons!36740 (h!38188 (_ BitVec 64)) (t!51644 List!36744)) )
))
(declare-fun acc!619 () List!36744)

(declare-fun contains!10360 (List!36744 (_ BitVec 64)) Bool)

(assert (=> b!1568067 (= res!1071938 (not (contains!10360 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568068 () Bool)

(declare-fun res!1071940 () Bool)

(assert (=> b!1568068 (=> (not res!1071940) (not e!874125))))

(assert (=> b!1568068 (= res!1071940 (bvslt from!2856 (size!51088 a!3481)))))

(declare-fun b!1568069 () Bool)

(assert (=> b!1568069 (= e!874125 false)))

(declare-fun lt!672888 () Bool)

(declare-fun e!874126 () Bool)

(assert (=> b!1568069 (= lt!672888 e!874126)))

(declare-fun res!1071939 () Bool)

(assert (=> b!1568069 (=> res!1071939 e!874126)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568069 (= res!1071939 (not (validKeyInArray!0 (select (arr!50536 a!3481) from!2856))))))

(declare-fun b!1568070 () Bool)

(assert (=> b!1568070 (= e!874126 (not (contains!10360 acc!619 (select (arr!50536 a!3481) from!2856))))))

(declare-fun b!1568071 () Bool)

(declare-fun res!1071942 () Bool)

(assert (=> b!1568071 (=> (not res!1071942) (not e!874125))))

(assert (=> b!1568071 (= res!1071942 (not (contains!10360 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568072 () Bool)

(declare-fun res!1071941 () Bool)

(assert (=> b!1568072 (=> (not res!1071941) (not e!874125))))

(declare-fun noDuplicate!2701 (List!36744) Bool)

(assert (=> b!1568072 (= res!1071941 (noDuplicate!2701 acc!619))))

(assert (= (and start!134242 res!1071937) b!1568072))

(assert (= (and b!1568072 res!1071941) b!1568071))

(assert (= (and b!1568071 res!1071942) b!1568067))

(assert (= (and b!1568067 res!1071938) b!1568068))

(assert (= (and b!1568068 res!1071940) b!1568069))

(assert (= (and b!1568069 (not res!1071939)) b!1568070))

(declare-fun m!1442167 () Bool)

(assert (=> start!134242 m!1442167))

(declare-fun m!1442169 () Bool)

(assert (=> b!1568070 m!1442169))

(assert (=> b!1568070 m!1442169))

(declare-fun m!1442171 () Bool)

(assert (=> b!1568070 m!1442171))

(assert (=> b!1568069 m!1442169))

(assert (=> b!1568069 m!1442169))

(declare-fun m!1442173 () Bool)

(assert (=> b!1568069 m!1442173))

(declare-fun m!1442175 () Bool)

(assert (=> b!1568067 m!1442175))

(declare-fun m!1442177 () Bool)

(assert (=> b!1568071 m!1442177))

(declare-fun m!1442179 () Bool)

(assert (=> b!1568072 m!1442179))

(push 1)

(assert (not b!1568072))

(assert (not b!1568067))

(assert (not b!1568071))

(assert (not start!134242))

(assert (not b!1568070))

(assert (not b!1568069))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

