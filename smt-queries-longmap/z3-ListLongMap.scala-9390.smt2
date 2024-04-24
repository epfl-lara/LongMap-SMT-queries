; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112000 () Bool)

(assert start!112000)

(declare-fun b_free!30433 () Bool)

(declare-fun b_next!30433 () Bool)

(assert (=> start!112000 (= b_free!30433 (not b_next!30433))))

(declare-fun tp!106774 () Bool)

(declare-fun b_and!48973 () Bool)

(assert (=> start!112000 (= tp!106774 b_and!48973)))

(declare-fun b!1325818 () Bool)

(declare-fun e!755930 () Bool)

(declare-fun tp_is_empty!36253 () Bool)

(assert (=> b!1325818 (= e!755930 tp_is_empty!36253)))

(declare-fun b!1325819 () Bool)

(declare-fun res!879672 () Bool)

(declare-fun e!755931 () Bool)

(assert (=> b!1325819 (=> (not res!879672) (not e!755931))))

(declare-datatypes ((array!89507 0))(
  ( (array!89508 (arr!43223 (Array (_ BitVec 32) (_ BitVec 64))) (size!43774 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89507)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325819 (= res!879672 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43774 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325820 () Bool)

(declare-fun res!879670 () Bool)

(assert (=> b!1325820 (=> (not res!879670) (not e!755931))))

(declare-datatypes ((List!30656 0))(
  ( (Nil!30653) (Cons!30652 (h!31870 (_ BitVec 64)) (t!44574 List!30656)) )
))
(declare-fun arrayNoDuplicates!0 (array!89507 (_ BitVec 32) List!30656) Bool)

(assert (=> b!1325820 (= res!879670 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30653))))

(declare-fun b!1325821 () Bool)

(declare-fun e!755928 () Bool)

(declare-fun mapRes!56027 () Bool)

(assert (=> b!1325821 (= e!755928 (and e!755930 mapRes!56027))))

(declare-fun condMapEmpty!56027 () Bool)

(declare-datatypes ((V!53441 0))(
  ( (V!53442 (val!18201 Int)) )
))
(declare-datatypes ((ValueCell!17228 0))(
  ( (ValueCellFull!17228 (v!20826 V!53441)) (EmptyCell!17228) )
))
(declare-datatypes ((array!89509 0))(
  ( (array!89510 (arr!43224 (Array (_ BitVec 32) ValueCell!17228)) (size!43775 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89509)

(declare-fun mapDefault!56027 () ValueCell!17228)

(assert (=> b!1325821 (= condMapEmpty!56027 (= (arr!43224 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17228)) mapDefault!56027)))))

(declare-fun mapIsEmpty!56027 () Bool)

(assert (=> mapIsEmpty!56027 mapRes!56027))

(declare-fun res!879669 () Bool)

(assert (=> start!112000 (=> (not res!879669) (not e!755931))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112000 (= res!879669 (validMask!0 mask!2019))))

(assert (=> start!112000 e!755931))

(declare-fun array_inv!32901 (array!89507) Bool)

(assert (=> start!112000 (array_inv!32901 _keys!1609)))

(assert (=> start!112000 true))

(assert (=> start!112000 tp_is_empty!36253))

(declare-fun array_inv!32902 (array!89509) Bool)

(assert (=> start!112000 (and (array_inv!32902 _values!1337) e!755928)))

(assert (=> start!112000 tp!106774))

(declare-fun b!1325822 () Bool)

(assert (=> b!1325822 (= e!755931 false)))

(declare-fun zeroValue!1279 () V!53441)

(declare-fun lt!589949 () Bool)

(declare-fun minValue!1279 () V!53441)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23502 0))(
  ( (tuple2!23503 (_1!11762 (_ BitVec 64)) (_2!11762 V!53441)) )
))
(declare-datatypes ((List!30657 0))(
  ( (Nil!30654) (Cons!30653 (h!31871 tuple2!23502) (t!44575 List!30657)) )
))
(declare-datatypes ((ListLongMap!21167 0))(
  ( (ListLongMap!21168 (toList!10599 List!30657)) )
))
(declare-fun contains!8766 (ListLongMap!21167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5582 (array!89507 array!89509 (_ BitVec 32) (_ BitVec 32) V!53441 V!53441 (_ BitVec 32) Int) ListLongMap!21167)

(assert (=> b!1325822 (= lt!589949 (contains!8766 (getCurrentListMap!5582 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325823 () Bool)

(declare-fun res!879673 () Bool)

(assert (=> b!1325823 (=> (not res!879673) (not e!755931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89507 (_ BitVec 32)) Bool)

(assert (=> b!1325823 (= res!879673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!56027 () Bool)

(declare-fun tp!106775 () Bool)

(declare-fun e!755932 () Bool)

(assert (=> mapNonEmpty!56027 (= mapRes!56027 (and tp!106775 e!755932))))

(declare-fun mapRest!56027 () (Array (_ BitVec 32) ValueCell!17228))

(declare-fun mapValue!56027 () ValueCell!17228)

(declare-fun mapKey!56027 () (_ BitVec 32))

(assert (=> mapNonEmpty!56027 (= (arr!43224 _values!1337) (store mapRest!56027 mapKey!56027 mapValue!56027))))

(declare-fun b!1325824 () Bool)

(declare-fun res!879671 () Bool)

(assert (=> b!1325824 (=> (not res!879671) (not e!755931))))

(assert (=> b!1325824 (= res!879671 (and (= (size!43775 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43774 _keys!1609) (size!43775 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325825 () Bool)

(assert (=> b!1325825 (= e!755932 tp_is_empty!36253)))

(assert (= (and start!112000 res!879669) b!1325824))

(assert (= (and b!1325824 res!879671) b!1325823))

(assert (= (and b!1325823 res!879673) b!1325820))

(assert (= (and b!1325820 res!879670) b!1325819))

(assert (= (and b!1325819 res!879672) b!1325822))

(assert (= (and b!1325821 condMapEmpty!56027) mapIsEmpty!56027))

(assert (= (and b!1325821 (not condMapEmpty!56027)) mapNonEmpty!56027))

(get-info :version)

(assert (= (and mapNonEmpty!56027 ((_ is ValueCellFull!17228) mapValue!56027)) b!1325825))

(assert (= (and b!1325821 ((_ is ValueCellFull!17228) mapDefault!56027)) b!1325818))

(assert (= start!112000 b!1325821))

(declare-fun m!1214945 () Bool)

(assert (=> mapNonEmpty!56027 m!1214945))

(declare-fun m!1214947 () Bool)

(assert (=> b!1325820 m!1214947))

(declare-fun m!1214949 () Bool)

(assert (=> start!112000 m!1214949))

(declare-fun m!1214951 () Bool)

(assert (=> start!112000 m!1214951))

(declare-fun m!1214953 () Bool)

(assert (=> start!112000 m!1214953))

(declare-fun m!1214955 () Bool)

(assert (=> b!1325822 m!1214955))

(assert (=> b!1325822 m!1214955))

(declare-fun m!1214957 () Bool)

(assert (=> b!1325822 m!1214957))

(declare-fun m!1214959 () Bool)

(assert (=> b!1325823 m!1214959))

(check-sat (not mapNonEmpty!56027) (not b!1325820) tp_is_empty!36253 b_and!48973 (not b_next!30433) (not b!1325823) (not b!1325822) (not start!112000))
(check-sat b_and!48973 (not b_next!30433))
