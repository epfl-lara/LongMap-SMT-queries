; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113312 () Bool)

(assert start!113312)

(declare-fun b_free!31363 () Bool)

(declare-fun b_next!31363 () Bool)

(assert (=> start!113312 (= b_free!31363 (not b_next!31363))))

(declare-fun tp!109893 () Bool)

(declare-fun b_and!50585 () Bool)

(assert (=> start!113312 (= tp!109893 b_and!50585)))

(declare-fun mapNonEmpty!57751 () Bool)

(declare-fun mapRes!57751 () Bool)

(declare-fun tp!109894 () Bool)

(declare-fun e!765199 () Bool)

(assert (=> mapNonEmpty!57751 (= mapRes!57751 (and tp!109894 e!765199))))

(declare-datatypes ((V!54921 0))(
  ( (V!54922 (val!18756 Int)) )
))
(declare-datatypes ((ValueCell!17783 0))(
  ( (ValueCellFull!17783 (v!21404 V!54921)) (EmptyCell!17783) )
))
(declare-fun mapRest!57751 () (Array (_ BitVec 32) ValueCell!17783))

(declare-fun mapValue!57751 () ValueCell!17783)

(declare-datatypes ((array!91566 0))(
  ( (array!91567 (arr!44239 (Array (_ BitVec 32) ValueCell!17783)) (size!44789 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91566)

(declare-fun mapKey!57751 () (_ BitVec 32))

(assert (=> mapNonEmpty!57751 (= (arr!44239 _values!1303) (store mapRest!57751 mapKey!57751 mapValue!57751))))

(declare-fun b!1344453 () Bool)

(declare-fun res!892012 () Bool)

(declare-fun e!765200 () Bool)

(assert (=> b!1344453 (=> (not res!892012) (not e!765200))))

(declare-datatypes ((array!91568 0))(
  ( (array!91569 (arr!44240 (Array (_ BitVec 32) (_ BitVec 64))) (size!44790 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91568)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91568 (_ BitVec 32)) Bool)

(assert (=> b!1344453 (= res!892012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344454 () Bool)

(declare-fun e!765202 () Bool)

(declare-fun tp_is_empty!37363 () Bool)

(assert (=> b!1344454 (= e!765202 tp_is_empty!37363)))

(declare-fun b!1344455 () Bool)

(declare-fun res!892009 () Bool)

(assert (=> b!1344455 (=> (not res!892009) (not e!765200))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344455 (= res!892009 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44790 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344456 () Bool)

(declare-fun res!892010 () Bool)

(assert (=> b!1344456 (=> (not res!892010) (not e!765200))))

(declare-datatypes ((List!31325 0))(
  ( (Nil!31322) (Cons!31321 (h!32530 (_ BitVec 64)) (t!45849 List!31325)) )
))
(declare-fun arrayNoDuplicates!0 (array!91568 (_ BitVec 32) List!31325) Bool)

(assert (=> b!1344456 (= res!892010 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31322))))

(declare-fun mapIsEmpty!57751 () Bool)

(assert (=> mapIsEmpty!57751 mapRes!57751))

(declare-fun b!1344457 () Bool)

(assert (=> b!1344457 (= e!765199 tp_is_empty!37363)))

(declare-fun b!1344459 () Bool)

(assert (=> b!1344459 (= e!765200 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun b!1344460 () Bool)

(declare-fun res!892013 () Bool)

(assert (=> b!1344460 (=> (not res!892013) (not e!765200))))

(assert (=> b!1344460 (= res!892013 (not (= (select (arr!44240 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1344461 () Bool)

(declare-fun res!892008 () Bool)

(assert (=> b!1344461 (=> (not res!892008) (not e!765200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344461 (= res!892008 (validKeyInArray!0 (select (arr!44240 _keys!1571) from!1960)))))

(declare-fun res!892011 () Bool)

(assert (=> start!113312 (=> (not res!892011) (not e!765200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113312 (= res!892011 (validMask!0 mask!1977))))

(assert (=> start!113312 e!765200))

(assert (=> start!113312 tp_is_empty!37363))

(assert (=> start!113312 true))

(declare-fun array_inv!33339 (array!91568) Bool)

(assert (=> start!113312 (array_inv!33339 _keys!1571)))

(declare-fun e!765203 () Bool)

(declare-fun array_inv!33340 (array!91566) Bool)

(assert (=> start!113312 (and (array_inv!33340 _values!1303) e!765203)))

(assert (=> start!113312 tp!109893))

(declare-fun b!1344458 () Bool)

(declare-fun res!892014 () Bool)

(assert (=> b!1344458 (=> (not res!892014) (not e!765200))))

(declare-fun minValue!1245 () V!54921)

(declare-fun zeroValue!1245 () V!54921)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24170 0))(
  ( (tuple2!24171 (_1!12096 (_ BitVec 64)) (_2!12096 V!54921)) )
))
(declare-datatypes ((List!31326 0))(
  ( (Nil!31323) (Cons!31322 (h!32531 tuple2!24170) (t!45850 List!31326)) )
))
(declare-datatypes ((ListLongMap!21827 0))(
  ( (ListLongMap!21828 (toList!10929 List!31326)) )
))
(declare-fun contains!9105 (ListLongMap!21827 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5885 (array!91568 array!91566 (_ BitVec 32) (_ BitVec 32) V!54921 V!54921 (_ BitVec 32) Int) ListLongMap!21827)

(assert (=> b!1344458 (= res!892014 (contains!9105 (getCurrentListMap!5885 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344462 () Bool)

(declare-fun res!892007 () Bool)

(assert (=> b!1344462 (=> (not res!892007) (not e!765200))))

(assert (=> b!1344462 (= res!892007 (and (= (size!44789 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44790 _keys!1571) (size!44789 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344463 () Bool)

(assert (=> b!1344463 (= e!765203 (and e!765202 mapRes!57751))))

(declare-fun condMapEmpty!57751 () Bool)

(declare-fun mapDefault!57751 () ValueCell!17783)

