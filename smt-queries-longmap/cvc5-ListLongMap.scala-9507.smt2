; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112734 () Bool)

(assert start!112734)

(declare-fun b_free!31045 () Bool)

(declare-fun b_next!31045 () Bool)

(assert (=> start!112734 (= b_free!31045 (not b_next!31045))))

(declare-fun tp!108779 () Bool)

(declare-fun b_and!50023 () Bool)

(assert (=> start!112734 (= tp!108779 b_and!50023)))

(declare-fun b!1337299 () Bool)

(declare-fun res!887462 () Bool)

(declare-fun e!761485 () Bool)

(assert (=> b!1337299 (=> (not res!887462) (not e!761485))))

(declare-datatypes ((array!90766 0))(
  ( (array!90767 (arr!43847 (Array (_ BitVec 32) (_ BitVec 64))) (size!44397 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90766)

(declare-datatypes ((List!31072 0))(
  ( (Nil!31069) (Cons!31068 (h!32277 (_ BitVec 64)) (t!45386 List!31072)) )
))
(declare-fun arrayNoDuplicates!0 (array!90766 (_ BitVec 32) List!31072) Bool)

(assert (=> b!1337299 (= res!887462 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31069))))

(declare-fun mapIsEmpty!57113 () Bool)

(declare-fun mapRes!57113 () Bool)

(assert (=> mapIsEmpty!57113 mapRes!57113))

(declare-fun b!1337300 () Bool)

(declare-fun e!761482 () Bool)

(declare-fun tp_is_empty!36955 () Bool)

(assert (=> b!1337300 (= e!761482 tp_is_empty!36955)))

(declare-fun b!1337301 () Bool)

(declare-fun res!887456 () Bool)

(assert (=> b!1337301 (=> (not res!887456) (not e!761485))))

(declare-datatypes ((V!54377 0))(
  ( (V!54378 (val!18552 Int)) )
))
(declare-datatypes ((ValueCell!17579 0))(
  ( (ValueCellFull!17579 (v!21193 V!54377)) (EmptyCell!17579) )
))
(declare-datatypes ((array!90768 0))(
  ( (array!90769 (arr!43848 (Array (_ BitVec 32) ValueCell!17579)) (size!44398 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90768)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54377)

(declare-fun zeroValue!1262 () V!54377)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-datatypes ((tuple2!23930 0))(
  ( (tuple2!23931 (_1!11976 (_ BitVec 64)) (_2!11976 V!54377)) )
))
(declare-datatypes ((List!31073 0))(
  ( (Nil!31070) (Cons!31069 (h!32278 tuple2!23930) (t!45387 List!31073)) )
))
(declare-datatypes ((ListLongMap!21587 0))(
  ( (ListLongMap!21588 (toList!10809 List!31073)) )
))
(declare-fun contains!8976 (ListLongMap!21587 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5780 (array!90766 array!90768 (_ BitVec 32) (_ BitVec 32) V!54377 V!54377 (_ BitVec 32) Int) ListLongMap!21587)

(assert (=> b!1337301 (= res!887456 (contains!8976 (getCurrentListMap!5780 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun mapNonEmpty!57113 () Bool)

(declare-fun tp!108778 () Bool)

(declare-fun e!761484 () Bool)

(assert (=> mapNonEmpty!57113 (= mapRes!57113 (and tp!108778 e!761484))))

(declare-fun mapRest!57113 () (Array (_ BitVec 32) ValueCell!17579))

(declare-fun mapKey!57113 () (_ BitVec 32))

(declare-fun mapValue!57113 () ValueCell!17579)

(assert (=> mapNonEmpty!57113 (= (arr!43848 _values!1320) (store mapRest!57113 mapKey!57113 mapValue!57113))))

(declare-fun b!1337303 () Bool)

(declare-fun res!887459 () Bool)

(assert (=> b!1337303 (=> (not res!887459) (not e!761485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1337303 (= res!887459 (validKeyInArray!0 (select (arr!43847 _keys!1590) from!1980)))))

(declare-fun b!1337304 () Bool)

(assert (=> b!1337304 (= e!761484 tp_is_empty!36955)))

(declare-fun b!1337305 () Bool)

(declare-fun res!887460 () Bool)

(assert (=> b!1337305 (=> (not res!887460) (not e!761485))))

(assert (=> b!1337305 (= res!887460 (and (= (size!44398 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44397 _keys!1590) (size!44398 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1337306 () Bool)

(declare-fun e!761483 () Bool)

(assert (=> b!1337306 (= e!761483 (and e!761482 mapRes!57113))))

(declare-fun condMapEmpty!57113 () Bool)

(declare-fun mapDefault!57113 () ValueCell!17579)

