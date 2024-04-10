; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101254 () Bool)

(assert start!101254)

(declare-fun b_free!26177 () Bool)

(declare-fun b_next!26177 () Bool)

(assert (=> start!101254 (= b_free!26177 (not b_next!26177))))

(declare-fun tp!91553 () Bool)

(declare-fun b_and!43471 () Bool)

(assert (=> start!101254 (= tp!91553 b_and!43471)))

(declare-fun b!1216168 () Bool)

(declare-fun e!690490 () Bool)

(declare-fun e!690493 () Bool)

(assert (=> b!1216168 (= e!690490 (not e!690493))))

(declare-fun res!807556 () Bool)

(assert (=> b!1216168 (=> res!807556 e!690493)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216168 (= res!807556 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78535 0))(
  ( (array!78536 (arr!37902 (Array (_ BitVec 32) (_ BitVec 64))) (size!38438 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78535)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216168 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40320 0))(
  ( (Unit!40321) )
))
(declare-fun lt!552814 () Unit!40320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78535 (_ BitVec 64) (_ BitVec 32)) Unit!40320)

(assert (=> b!1216168 (= lt!552814 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1216169 () Bool)

(declare-fun res!807554 () Bool)

(declare-fun e!690496 () Bool)

(assert (=> b!1216169 (=> (not res!807554) (not e!690496))))

(declare-datatypes ((List!26720 0))(
  ( (Nil!26717) (Cons!26716 (h!27925 (_ BitVec 64)) (t!39877 List!26720)) )
))
(declare-fun arrayNoDuplicates!0 (array!78535 (_ BitVec 32) List!26720) Bool)

(assert (=> b!1216169 (= res!807554 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26717))))

(declare-fun b!1216170 () Bool)

(declare-fun res!807558 () Bool)

(assert (=> b!1216170 (=> (not res!807558) (not e!690496))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78535 (_ BitVec 32)) Bool)

(assert (=> b!1216170 (= res!807558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216171 () Bool)

(declare-fun res!807555 () Bool)

(assert (=> b!1216171 (=> (not res!807555) (not e!690490))))

(declare-fun lt!552815 () array!78535)

(assert (=> b!1216171 (= res!807555 (arrayNoDuplicates!0 lt!552815 #b00000000000000000000000000000000 Nil!26717))))

(declare-fun b!1216172 () Bool)

(declare-fun e!690495 () Bool)

(declare-fun tp_is_empty!30881 () Bool)

(assert (=> b!1216172 (= e!690495 tp_is_empty!30881)))

(declare-fun b!1216173 () Bool)

(declare-fun res!807550 () Bool)

(assert (=> b!1216173 (=> (not res!807550) (not e!690496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216173 (= res!807550 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!48196 () Bool)

(declare-fun mapRes!48196 () Bool)

(declare-fun tp!91552 () Bool)

(assert (=> mapNonEmpty!48196 (= mapRes!48196 (and tp!91552 e!690495))))

(declare-fun mapKey!48196 () (_ BitVec 32))

(declare-datatypes ((V!46301 0))(
  ( (V!46302 (val!15497 Int)) )
))
(declare-datatypes ((ValueCell!14731 0))(
  ( (ValueCellFull!14731 (v!18150 V!46301)) (EmptyCell!14731) )
))
(declare-fun mapValue!48196 () ValueCell!14731)

(declare-fun mapRest!48196 () (Array (_ BitVec 32) ValueCell!14731))

(declare-datatypes ((array!78537 0))(
  ( (array!78538 (arr!37903 (Array (_ BitVec 32) ValueCell!14731)) (size!38439 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78537)

(assert (=> mapNonEmpty!48196 (= (arr!37903 _values!996) (store mapRest!48196 mapKey!48196 mapValue!48196))))

(declare-fun res!807559 () Bool)

(assert (=> start!101254 (=> (not res!807559) (not e!690496))))

(assert (=> start!101254 (= res!807559 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38438 _keys!1208))))))

(assert (=> start!101254 e!690496))

(assert (=> start!101254 tp_is_empty!30881))

(declare-fun array_inv!28856 (array!78535) Bool)

(assert (=> start!101254 (array_inv!28856 _keys!1208)))

(assert (=> start!101254 true))

(assert (=> start!101254 tp!91553))

(declare-fun e!690492 () Bool)

(declare-fun array_inv!28857 (array!78537) Bool)

(assert (=> start!101254 (and (array_inv!28857 _values!996) e!690492)))

(declare-fun b!1216174 () Bool)

(declare-fun res!807553 () Bool)

(assert (=> b!1216174 (=> (not res!807553) (not e!690496))))

(assert (=> b!1216174 (= res!807553 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38438 _keys!1208))))))

(declare-fun b!1216175 () Bool)

(declare-fun res!807557 () Bool)

(assert (=> b!1216175 (=> (not res!807557) (not e!690496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216175 (= res!807557 (validMask!0 mask!1564))))

(declare-fun b!1216176 () Bool)

(declare-fun e!690491 () Bool)

(assert (=> b!1216176 (= e!690492 (and e!690491 mapRes!48196))))

(declare-fun condMapEmpty!48196 () Bool)

(declare-fun mapDefault!48196 () ValueCell!14731)

