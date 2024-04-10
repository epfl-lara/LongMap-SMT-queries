; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111730 () Bool)

(assert start!111730)

(declare-fun b_free!30387 () Bool)

(declare-fun b_next!30387 () Bool)

(assert (=> start!111730 (= b_free!30387 (not b_next!30387))))

(declare-fun tp!106636 () Bool)

(declare-fun b_and!48925 () Bool)

(assert (=> start!111730 (= tp!106636 b_and!48925)))

(declare-fun b!1323940 () Bool)

(declare-fun res!878783 () Bool)

(declare-fun e!754744 () Bool)

(assert (=> b!1323940 (=> (not res!878783) (not e!754744))))

(declare-datatypes ((array!89330 0))(
  ( (array!89331 (arr!43139 (Array (_ BitVec 32) (_ BitVec 64))) (size!43689 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89330)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53379 0))(
  ( (V!53380 (val!18178 Int)) )
))
(declare-datatypes ((ValueCell!17205 0))(
  ( (ValueCellFull!17205 (v!20808 V!53379)) (EmptyCell!17205) )
))
(declare-datatypes ((array!89332 0))(
  ( (array!89333 (arr!43140 (Array (_ BitVec 32) ValueCell!17205)) (size!43690 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89332)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323940 (= res!878783 (and (= (size!43690 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43689 _keys!1609) (size!43690 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323941 () Bool)

(assert (=> b!1323941 (= e!754744 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53379)

(declare-fun minValue!1279 () V!53379)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589413 () Bool)

(declare-datatypes ((tuple2!23440 0))(
  ( (tuple2!23441 (_1!11731 (_ BitVec 64)) (_2!11731 V!53379)) )
))
(declare-datatypes ((List!30579 0))(
  ( (Nil!30576) (Cons!30575 (h!31784 tuple2!23440) (t!44505 List!30579)) )
))
(declare-datatypes ((ListLongMap!21097 0))(
  ( (ListLongMap!21098 (toList!10564 List!30579)) )
))
(declare-fun contains!8719 (ListLongMap!21097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5560 (array!89330 array!89332 (_ BitVec 32) (_ BitVec 32) V!53379 V!53379 (_ BitVec 32) Int) ListLongMap!21097)

(assert (=> b!1323941 (= lt!589413 (contains!8719 (getCurrentListMap!5560 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323942 () Bool)

(declare-fun res!878779 () Bool)

(assert (=> b!1323942 (=> (not res!878779) (not e!754744))))

(assert (=> b!1323942 (= res!878779 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43689 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323943 () Bool)

(declare-fun res!878782 () Bool)

(assert (=> b!1323943 (=> (not res!878782) (not e!754744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89330 (_ BitVec 32)) Bool)

(assert (=> b!1323943 (= res!878782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323944 () Bool)

(declare-fun e!754742 () Bool)

(declare-fun e!754741 () Bool)

(declare-fun mapRes!55958 () Bool)

(assert (=> b!1323944 (= e!754742 (and e!754741 mapRes!55958))))

(declare-fun condMapEmpty!55958 () Bool)

(declare-fun mapDefault!55958 () ValueCell!17205)

(assert (=> b!1323944 (= condMapEmpty!55958 (= (arr!43140 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17205)) mapDefault!55958)))))

(declare-fun mapIsEmpty!55958 () Bool)

(assert (=> mapIsEmpty!55958 mapRes!55958))

(declare-fun b!1323945 () Bool)

(declare-fun e!754740 () Bool)

(declare-fun tp_is_empty!36207 () Bool)

(assert (=> b!1323945 (= e!754740 tp_is_empty!36207)))

(declare-fun b!1323946 () Bool)

(assert (=> b!1323946 (= e!754741 tp_is_empty!36207)))

(declare-fun b!1323947 () Bool)

(declare-fun res!878781 () Bool)

(assert (=> b!1323947 (=> (not res!878781) (not e!754744))))

(declare-datatypes ((List!30580 0))(
  ( (Nil!30577) (Cons!30576 (h!31785 (_ BitVec 64)) (t!44506 List!30580)) )
))
(declare-fun arrayNoDuplicates!0 (array!89330 (_ BitVec 32) List!30580) Bool)

(assert (=> b!1323947 (= res!878781 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30577))))

(declare-fun res!878780 () Bool)

(assert (=> start!111730 (=> (not res!878780) (not e!754744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111730 (= res!878780 (validMask!0 mask!2019))))

(assert (=> start!111730 e!754744))

(declare-fun array_inv!32565 (array!89330) Bool)

(assert (=> start!111730 (array_inv!32565 _keys!1609)))

(assert (=> start!111730 true))

(assert (=> start!111730 tp_is_empty!36207))

(declare-fun array_inv!32566 (array!89332) Bool)

(assert (=> start!111730 (and (array_inv!32566 _values!1337) e!754742)))

(assert (=> start!111730 tp!106636))

(declare-fun mapNonEmpty!55958 () Bool)

(declare-fun tp!106637 () Bool)

(assert (=> mapNonEmpty!55958 (= mapRes!55958 (and tp!106637 e!754740))))

(declare-fun mapRest!55958 () (Array (_ BitVec 32) ValueCell!17205))

(declare-fun mapValue!55958 () ValueCell!17205)

(declare-fun mapKey!55958 () (_ BitVec 32))

(assert (=> mapNonEmpty!55958 (= (arr!43140 _values!1337) (store mapRest!55958 mapKey!55958 mapValue!55958))))

(assert (= (and start!111730 res!878780) b!1323940))

(assert (= (and b!1323940 res!878783) b!1323943))

(assert (= (and b!1323943 res!878782) b!1323947))

(assert (= (and b!1323947 res!878781) b!1323942))

(assert (= (and b!1323942 res!878779) b!1323941))

(assert (= (and b!1323944 condMapEmpty!55958) mapIsEmpty!55958))

(assert (= (and b!1323944 (not condMapEmpty!55958)) mapNonEmpty!55958))

(get-info :version)

(assert (= (and mapNonEmpty!55958 ((_ is ValueCellFull!17205) mapValue!55958)) b!1323945))

(assert (= (and b!1323944 ((_ is ValueCellFull!17205) mapDefault!55958)) b!1323946))

(assert (= start!111730 b!1323944))

(declare-fun m!1212967 () Bool)

(assert (=> b!1323941 m!1212967))

(assert (=> b!1323941 m!1212967))

(declare-fun m!1212969 () Bool)

(assert (=> b!1323941 m!1212969))

(declare-fun m!1212971 () Bool)

(assert (=> b!1323947 m!1212971))

(declare-fun m!1212973 () Bool)

(assert (=> mapNonEmpty!55958 m!1212973))

(declare-fun m!1212975 () Bool)

(assert (=> b!1323943 m!1212975))

(declare-fun m!1212977 () Bool)

(assert (=> start!111730 m!1212977))

(declare-fun m!1212979 () Bool)

(assert (=> start!111730 m!1212979))

(declare-fun m!1212981 () Bool)

(assert (=> start!111730 m!1212981))

(check-sat (not b!1323941) b_and!48925 tp_is_empty!36207 (not mapNonEmpty!55958) (not b_next!30387) (not b!1323947) (not start!111730) (not b!1323943))
(check-sat b_and!48925 (not b_next!30387))
