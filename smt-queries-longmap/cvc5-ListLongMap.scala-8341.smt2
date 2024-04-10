; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101530 () Bool)

(assert start!101530)

(declare-fun b_free!26317 () Bool)

(declare-fun b_next!26317 () Bool)

(assert (=> start!101530 (= b_free!26317 (not b_next!26317))))

(declare-fun tp!91988 () Bool)

(declare-fun b_and!43841 () Bool)

(assert (=> start!101530 (= tp!91988 b_and!43841)))

(declare-fun b!1220701 () Bool)

(declare-fun res!810893 () Bool)

(declare-fun e!693174 () Bool)

(assert (=> b!1220701 (=> (not res!810893) (not e!693174))))

(declare-datatypes ((array!78821 0))(
  ( (array!78822 (arr!38040 (Array (_ BitVec 32) (_ BitVec 64))) (size!38576 (_ BitVec 32))) )
))
(declare-fun lt!555164 () array!78821)

(declare-datatypes ((List!26842 0))(
  ( (Nil!26839) (Cons!26838 (h!28047 (_ BitVec 64)) (t!40139 List!26842)) )
))
(declare-fun arrayNoDuplicates!0 (array!78821 (_ BitVec 32) List!26842) Bool)

(assert (=> b!1220701 (= res!810893 (arrayNoDuplicates!0 lt!555164 #b00000000000000000000000000000000 Nil!26839))))

(declare-fun mapNonEmpty!48421 () Bool)

(declare-fun mapRes!48421 () Bool)

(declare-fun tp!91987 () Bool)

(declare-fun e!693176 () Bool)

(assert (=> mapNonEmpty!48421 (= mapRes!48421 (and tp!91987 e!693176))))

(declare-datatypes ((V!46489 0))(
  ( (V!46490 (val!15567 Int)) )
))
(declare-datatypes ((ValueCell!14801 0))(
  ( (ValueCellFull!14801 (v!18225 V!46489)) (EmptyCell!14801) )
))
(declare-fun mapRest!48421 () (Array (_ BitVec 32) ValueCell!14801))

(declare-fun mapKey!48421 () (_ BitVec 32))

(declare-datatypes ((array!78823 0))(
  ( (array!78824 (arr!38041 (Array (_ BitVec 32) ValueCell!14801)) (size!38577 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78823)

(declare-fun mapValue!48421 () ValueCell!14801)

(assert (=> mapNonEmpty!48421 (= (arr!38041 _values!996) (store mapRest!48421 mapKey!48421 mapValue!48421))))

(declare-fun b!1220702 () Bool)

(declare-fun res!810899 () Bool)

(declare-fun e!693169 () Bool)

(assert (=> b!1220702 (=> (not res!810899) (not e!693169))))

(declare-fun _keys!1208 () array!78821)

(assert (=> b!1220702 (= res!810899 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26839))))

(declare-fun b!1220703 () Bool)

(declare-fun res!810901 () Bool)

(assert (=> b!1220703 (=> (not res!810901) (not e!693169))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78821 (_ BitVec 32)) Bool)

(assert (=> b!1220703 (= res!810901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!810892 () Bool)

(assert (=> start!101530 (=> (not res!810892) (not e!693169))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101530 (= res!810892 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38576 _keys!1208))))))

(assert (=> start!101530 e!693169))

(declare-fun tp_is_empty!31021 () Bool)

(assert (=> start!101530 tp_is_empty!31021))

(declare-fun array_inv!28946 (array!78821) Bool)

(assert (=> start!101530 (array_inv!28946 _keys!1208)))

(assert (=> start!101530 true))

(assert (=> start!101530 tp!91988))

(declare-fun e!693167 () Bool)

(declare-fun array_inv!28947 (array!78823) Bool)

(assert (=> start!101530 (and (array_inv!28947 _values!996) e!693167)))

(declare-fun b!1220704 () Bool)

(declare-fun res!810897 () Bool)

(assert (=> b!1220704 (=> (not res!810897) (not e!693169))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1220704 (= res!810897 (and (= (size!38577 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38576 _keys!1208) (size!38577 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220705 () Bool)

(declare-fun res!810894 () Bool)

(assert (=> b!1220705 (=> (not res!810894) (not e!693169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220705 (= res!810894 (validMask!0 mask!1564))))

(declare-fun b!1220706 () Bool)

(declare-fun e!693178 () Bool)

(assert (=> b!1220706 (= e!693174 (not e!693178))))

(declare-fun res!810902 () Bool)

(assert (=> b!1220706 (=> res!810902 e!693178)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1220706 (= res!810902 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220706 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40444 0))(
  ( (Unit!40445) )
))
(declare-fun lt!555166 () Unit!40444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78821 (_ BitVec 64) (_ BitVec 32)) Unit!40444)

(assert (=> b!1220706 (= lt!555166 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1220707 () Bool)

(declare-fun e!693175 () Bool)

(declare-fun e!693172 () Bool)

(assert (=> b!1220707 (= e!693175 e!693172)))

(declare-fun res!810900 () Bool)

(assert (=> b!1220707 (=> res!810900 e!693172)))

(assert (=> b!1220707 (= res!810900 (not (= (select (arr!38040 _keys!1208) from!1455) k!934)))))

(declare-fun mapIsEmpty!48421 () Bool)

(assert (=> mapIsEmpty!48421 mapRes!48421))

(declare-fun b!1220708 () Bool)

(assert (=> b!1220708 (= e!693172 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1220709 () Bool)

(declare-fun e!693173 () Bool)

(assert (=> b!1220709 (= e!693173 tp_is_empty!31021)))

(declare-fun b!1220710 () Bool)

(declare-fun res!810895 () Bool)

(assert (=> b!1220710 (=> (not res!810895) (not e!693169))))

(assert (=> b!1220710 (= res!810895 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38576 _keys!1208))))))

(declare-fun b!1220711 () Bool)

(assert (=> b!1220711 (= e!693167 (and e!693173 mapRes!48421))))

(declare-fun condMapEmpty!48421 () Bool)

(declare-fun mapDefault!48421 () ValueCell!14801)

