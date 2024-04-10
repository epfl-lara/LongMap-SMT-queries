; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108794 () Bool)

(assert start!108794)

(declare-fun b_free!28307 () Bool)

(declare-fun b_next!28307 () Bool)

(assert (=> start!108794 (= b_free!28307 (not b_next!28307))))

(declare-fun tp!100037 () Bool)

(declare-fun b_and!46373 () Bool)

(assert (=> start!108794 (= tp!100037 b_and!46373)))

(declare-fun b!1284716 () Bool)

(declare-fun res!853445 () Bool)

(declare-fun e!733865 () Bool)

(assert (=> b!1284716 (=> (not res!853445) (not e!733865))))

(declare-datatypes ((array!84952 0))(
  ( (array!84953 (arr!40978 (Array (_ BitVec 32) (_ BitVec 64))) (size!41528 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84952)

(declare-datatypes ((List!29039 0))(
  ( (Nil!29036) (Cons!29035 (h!30244 (_ BitVec 64)) (t!42583 List!29039)) )
))
(declare-fun arrayNoDuplicates!0 (array!84952 (_ BitVec 32) List!29039) Bool)

(assert (=> b!1284716 (= res!853445 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29036))))

(declare-fun b!1284717 () Bool)

(declare-fun e!733861 () Bool)

(declare-fun tp_is_empty!33947 () Bool)

(assert (=> b!1284717 (= e!733861 tp_is_empty!33947)))

(declare-fun b!1284718 () Bool)

(declare-fun res!853442 () Bool)

(assert (=> b!1284718 (=> (not res!853442) (not e!733865))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284718 (= res!853442 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41528 _keys!1741))))))

(declare-fun mapIsEmpty!52478 () Bool)

(declare-fun mapRes!52478 () Bool)

(assert (=> mapIsEmpty!52478 mapRes!52478))

(declare-fun mapNonEmpty!52478 () Bool)

(declare-fun tp!100036 () Bool)

(assert (=> mapNonEmpty!52478 (= mapRes!52478 (and tp!100036 e!733861))))

(declare-datatypes ((V!50365 0))(
  ( (V!50366 (val!17048 Int)) )
))
(declare-datatypes ((ValueCell!16075 0))(
  ( (ValueCellFull!16075 (v!19650 V!50365)) (EmptyCell!16075) )
))
(declare-fun mapValue!52478 () ValueCell!16075)

(declare-fun mapRest!52478 () (Array (_ BitVec 32) ValueCell!16075))

(declare-datatypes ((array!84954 0))(
  ( (array!84955 (arr!40979 (Array (_ BitVec 32) ValueCell!16075)) (size!41529 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84954)

(declare-fun mapKey!52478 () (_ BitVec 32))

(assert (=> mapNonEmpty!52478 (= (arr!40979 _values!1445) (store mapRest!52478 mapKey!52478 mapValue!52478))))

(declare-fun b!1284719 () Bool)

(declare-fun e!733864 () Bool)

(declare-fun e!733862 () Bool)

(assert (=> b!1284719 (= e!733864 (and e!733862 mapRes!52478))))

(declare-fun condMapEmpty!52478 () Bool)

(declare-fun mapDefault!52478 () ValueCell!16075)

