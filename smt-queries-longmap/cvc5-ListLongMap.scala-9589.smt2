; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113396 () Bool)

(assert start!113396)

(declare-fun b_free!31447 () Bool)

(declare-fun b_next!31447 () Bool)

(assert (=> start!113396 (= b_free!31447 (not b_next!31447))))

(declare-fun tp!110146 () Bool)

(declare-fun b_and!50735 () Bool)

(assert (=> start!113396 (= tp!110146 b_and!50735)))

(declare-fun mapIsEmpty!57877 () Bool)

(declare-fun mapRes!57877 () Bool)

(assert (=> mapIsEmpty!57877 mapRes!57877))

(declare-fun b!1346106 () Bool)

(declare-fun res!893217 () Bool)

(declare-fun e!765914 () Bool)

(assert (=> b!1346106 (=> (not res!893217) (not e!765914))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91732 0))(
  ( (array!91733 (arr!44322 (Array (_ BitVec 32) (_ BitVec 64))) (size!44872 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91732)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346106 (= res!893217 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44872 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346107 () Bool)

(declare-fun e!765912 () Bool)

(declare-fun tp_is_empty!37447 () Bool)

(assert (=> b!1346107 (= e!765912 tp_is_empty!37447)))

(declare-fun res!893220 () Bool)

(assert (=> start!113396 (=> (not res!893220) (not e!765914))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113396 (= res!893220 (validMask!0 mask!1977))))

(assert (=> start!113396 e!765914))

(assert (=> start!113396 tp_is_empty!37447))

(assert (=> start!113396 true))

(declare-fun array_inv!33399 (array!91732) Bool)

(assert (=> start!113396 (array_inv!33399 _keys!1571)))

(declare-datatypes ((V!55033 0))(
  ( (V!55034 (val!18798 Int)) )
))
(declare-datatypes ((ValueCell!17825 0))(
  ( (ValueCellFull!17825 (v!21446 V!55033)) (EmptyCell!17825) )
))
(declare-datatypes ((array!91734 0))(
  ( (array!91735 (arr!44323 (Array (_ BitVec 32) ValueCell!17825)) (size!44873 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91734)

(declare-fun e!765913 () Bool)

(declare-fun array_inv!33400 (array!91734) Bool)

(assert (=> start!113396 (and (array_inv!33400 _values!1303) e!765913)))

(assert (=> start!113396 tp!110146))

(declare-fun b!1346108 () Bool)

(assert (=> b!1346108 (= e!765913 (and e!765912 mapRes!57877))))

(declare-fun condMapEmpty!57877 () Bool)

(declare-fun mapDefault!57877 () ValueCell!17825)

