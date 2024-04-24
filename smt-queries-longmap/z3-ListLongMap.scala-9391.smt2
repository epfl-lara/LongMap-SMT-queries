; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112006 () Bool)

(assert start!112006)

(declare-fun b_free!30439 () Bool)

(declare-fun b_next!30439 () Bool)

(assert (=> start!112006 (= b_free!30439 (not b_next!30439))))

(declare-fun tp!106792 () Bool)

(declare-fun b_and!48979 () Bool)

(assert (=> start!112006 (= tp!106792 b_and!48979)))

(declare-fun b!1325890 () Bool)

(declare-fun e!755974 () Bool)

(declare-fun e!755977 () Bool)

(declare-fun mapRes!56036 () Bool)

(assert (=> b!1325890 (= e!755974 (and e!755977 mapRes!56036))))

(declare-fun condMapEmpty!56036 () Bool)

(declare-datatypes ((V!53449 0))(
  ( (V!53450 (val!18204 Int)) )
))
(declare-datatypes ((ValueCell!17231 0))(
  ( (ValueCellFull!17231 (v!20829 V!53449)) (EmptyCell!17231) )
))
(declare-datatypes ((array!89519 0))(
  ( (array!89520 (arr!43229 (Array (_ BitVec 32) ValueCell!17231)) (size!43780 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89519)

(declare-fun mapDefault!56036 () ValueCell!17231)

(assert (=> b!1325890 (= condMapEmpty!56036 (= (arr!43229 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17231)) mapDefault!56036)))))

(declare-fun b!1325891 () Bool)

(declare-fun res!879718 () Bool)

(declare-fun e!755976 () Bool)

(assert (=> b!1325891 (=> (not res!879718) (not e!755976))))

(declare-datatypes ((array!89521 0))(
  ( (array!89522 (arr!43230 (Array (_ BitVec 32) (_ BitVec 64))) (size!43781 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89521)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325891 (= res!879718 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43781 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325892 () Bool)

(declare-fun e!755975 () Bool)

(declare-fun tp_is_empty!36259 () Bool)

(assert (=> b!1325892 (= e!755975 tp_is_empty!36259)))

(declare-fun b!1325893 () Bool)

(assert (=> b!1325893 (= e!755976 false)))

(declare-fun zeroValue!1279 () V!53449)

(declare-fun minValue!1279 () V!53449)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589958 () Bool)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23508 0))(
  ( (tuple2!23509 (_1!11765 (_ BitVec 64)) (_2!11765 V!53449)) )
))
(declare-datatypes ((List!30662 0))(
  ( (Nil!30659) (Cons!30658 (h!31876 tuple2!23508) (t!44580 List!30662)) )
))
(declare-datatypes ((ListLongMap!21173 0))(
  ( (ListLongMap!21174 (toList!10602 List!30662)) )
))
(declare-fun contains!8769 (ListLongMap!21173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5585 (array!89521 array!89519 (_ BitVec 32) (_ BitVec 32) V!53449 V!53449 (_ BitVec 32) Int) ListLongMap!21173)

(assert (=> b!1325893 (= lt!589958 (contains!8769 (getCurrentListMap!5585 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!56036 () Bool)

(assert (=> mapIsEmpty!56036 mapRes!56036))

(declare-fun b!1325894 () Bool)

(assert (=> b!1325894 (= e!755977 tp_is_empty!36259)))

(declare-fun mapNonEmpty!56036 () Bool)

(declare-fun tp!106793 () Bool)

(assert (=> mapNonEmpty!56036 (= mapRes!56036 (and tp!106793 e!755975))))

(declare-fun mapRest!56036 () (Array (_ BitVec 32) ValueCell!17231))

(declare-fun mapKey!56036 () (_ BitVec 32))

(declare-fun mapValue!56036 () ValueCell!17231)

(assert (=> mapNonEmpty!56036 (= (arr!43229 _values!1337) (store mapRest!56036 mapKey!56036 mapValue!56036))))

(declare-fun res!879714 () Bool)

(assert (=> start!112006 (=> (not res!879714) (not e!755976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112006 (= res!879714 (validMask!0 mask!2019))))

(assert (=> start!112006 e!755976))

(declare-fun array_inv!32903 (array!89521) Bool)

(assert (=> start!112006 (array_inv!32903 _keys!1609)))

(assert (=> start!112006 true))

(assert (=> start!112006 tp_is_empty!36259))

(declare-fun array_inv!32904 (array!89519) Bool)

(assert (=> start!112006 (and (array_inv!32904 _values!1337) e!755974)))

(assert (=> start!112006 tp!106792))

(declare-fun b!1325895 () Bool)

(declare-fun res!879716 () Bool)

(assert (=> b!1325895 (=> (not res!879716) (not e!755976))))

(declare-datatypes ((List!30663 0))(
  ( (Nil!30660) (Cons!30659 (h!31877 (_ BitVec 64)) (t!44581 List!30663)) )
))
(declare-fun arrayNoDuplicates!0 (array!89521 (_ BitVec 32) List!30663) Bool)

(assert (=> b!1325895 (= res!879716 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30660))))

(declare-fun b!1325896 () Bool)

(declare-fun res!879715 () Bool)

(assert (=> b!1325896 (=> (not res!879715) (not e!755976))))

(assert (=> b!1325896 (= res!879715 (and (= (size!43780 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43781 _keys!1609) (size!43780 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325897 () Bool)

(declare-fun res!879717 () Bool)

(assert (=> b!1325897 (=> (not res!879717) (not e!755976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89521 (_ BitVec 32)) Bool)

(assert (=> b!1325897 (= res!879717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!112006 res!879714) b!1325896))

(assert (= (and b!1325896 res!879715) b!1325897))

(assert (= (and b!1325897 res!879717) b!1325895))

(assert (= (and b!1325895 res!879716) b!1325891))

(assert (= (and b!1325891 res!879718) b!1325893))

(assert (= (and b!1325890 condMapEmpty!56036) mapIsEmpty!56036))

(assert (= (and b!1325890 (not condMapEmpty!56036)) mapNonEmpty!56036))

(get-info :version)

(assert (= (and mapNonEmpty!56036 ((_ is ValueCellFull!17231) mapValue!56036)) b!1325892))

(assert (= (and b!1325890 ((_ is ValueCellFull!17231) mapDefault!56036)) b!1325894))

(assert (= start!112006 b!1325890))

(declare-fun m!1214993 () Bool)

(assert (=> start!112006 m!1214993))

(declare-fun m!1214995 () Bool)

(assert (=> start!112006 m!1214995))

(declare-fun m!1214997 () Bool)

(assert (=> start!112006 m!1214997))

(declare-fun m!1214999 () Bool)

(assert (=> mapNonEmpty!56036 m!1214999))

(declare-fun m!1215001 () Bool)

(assert (=> b!1325895 m!1215001))

(declare-fun m!1215003 () Bool)

(assert (=> b!1325893 m!1215003))

(assert (=> b!1325893 m!1215003))

(declare-fun m!1215005 () Bool)

(assert (=> b!1325893 m!1215005))

(declare-fun m!1215007 () Bool)

(assert (=> b!1325897 m!1215007))

(check-sat (not b_next!30439) b_and!48979 tp_is_empty!36259 (not b!1325893) (not mapNonEmpty!56036) (not b!1325897) (not start!112006) (not b!1325895))
(check-sat b_and!48979 (not b_next!30439))
