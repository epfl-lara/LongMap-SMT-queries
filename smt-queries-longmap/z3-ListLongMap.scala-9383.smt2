; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111734 () Bool)

(assert start!111734)

(declare-fun b_free!30391 () Bool)

(declare-fun b_next!30391 () Bool)

(assert (=> start!111734 (= b_free!30391 (not b_next!30391))))

(declare-fun tp!106650 () Bool)

(declare-fun b_and!48911 () Bool)

(assert (=> start!111734 (= tp!106650 b_and!48911)))

(declare-fun b!1323918 () Bool)

(declare-fun e!754739 () Bool)

(declare-fun tp_is_empty!36211 () Bool)

(assert (=> b!1323918 (= e!754739 tp_is_empty!36211)))

(declare-fun b!1323919 () Bool)

(declare-fun res!878783 () Bool)

(declare-fun e!754738 () Bool)

(assert (=> b!1323919 (=> (not res!878783) (not e!754738))))

(declare-datatypes ((array!89267 0))(
  ( (array!89268 (arr!43108 (Array (_ BitVec 32) (_ BitVec 64))) (size!43660 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89267)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53385 0))(
  ( (V!53386 (val!18180 Int)) )
))
(declare-datatypes ((ValueCell!17207 0))(
  ( (ValueCellFull!17207 (v!20809 V!53385)) (EmptyCell!17207) )
))
(declare-datatypes ((array!89269 0))(
  ( (array!89270 (arr!43109 (Array (_ BitVec 32) ValueCell!17207)) (size!43661 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89269)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1323919 (= res!878783 (and (= (size!43661 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43660 _keys!1609) (size!43661 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323920 () Bool)

(assert (=> b!1323920 (= e!754738 false)))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53385)

(declare-fun minValue!1279 () V!53385)

(declare-fun lt!589233 () Bool)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23506 0))(
  ( (tuple2!23507 (_1!11764 (_ BitVec 64)) (_2!11764 V!53385)) )
))
(declare-datatypes ((List!30637 0))(
  ( (Nil!30634) (Cons!30633 (h!31842 tuple2!23506) (t!44555 List!30637)) )
))
(declare-datatypes ((ListLongMap!21163 0))(
  ( (ListLongMap!21164 (toList!10597 List!30637)) )
))
(declare-fun contains!8680 (ListLongMap!21163 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5476 (array!89267 array!89269 (_ BitVec 32) (_ BitVec 32) V!53385 V!53385 (_ BitVec 32) Int) ListLongMap!21163)

(assert (=> b!1323920 (= lt!589233 (contains!8680 (getCurrentListMap!5476 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55964 () Bool)

(declare-fun mapRes!55964 () Bool)

(declare-fun tp!106649 () Bool)

(declare-fun e!754740 () Bool)

(assert (=> mapNonEmpty!55964 (= mapRes!55964 (and tp!106649 e!754740))))

(declare-fun mapKey!55964 () (_ BitVec 32))

(declare-fun mapValue!55964 () ValueCell!17207)

(declare-fun mapRest!55964 () (Array (_ BitVec 32) ValueCell!17207))

(assert (=> mapNonEmpty!55964 (= (arr!43109 _values!1337) (store mapRest!55964 mapKey!55964 mapValue!55964))))

(declare-fun b!1323921 () Bool)

(declare-fun res!878784 () Bool)

(assert (=> b!1323921 (=> (not res!878784) (not e!754738))))

(assert (=> b!1323921 (= res!878784 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43660 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323922 () Bool)

(declare-fun res!878780 () Bool)

(assert (=> b!1323922 (=> (not res!878780) (not e!754738))))

(declare-datatypes ((List!30638 0))(
  ( (Nil!30635) (Cons!30634 (h!31843 (_ BitVec 64)) (t!44556 List!30638)) )
))
(declare-fun arrayNoDuplicates!0 (array!89267 (_ BitVec 32) List!30638) Bool)

(assert (=> b!1323922 (= res!878780 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30635))))

(declare-fun b!1323923 () Bool)

(assert (=> b!1323923 (= e!754740 tp_is_empty!36211)))

(declare-fun b!1323924 () Bool)

(declare-fun res!878782 () Bool)

(assert (=> b!1323924 (=> (not res!878782) (not e!754738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89267 (_ BitVec 32)) Bool)

(assert (=> b!1323924 (= res!878782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323925 () Bool)

(declare-fun e!754737 () Bool)

(assert (=> b!1323925 (= e!754737 (and e!754739 mapRes!55964))))

(declare-fun condMapEmpty!55964 () Bool)

(declare-fun mapDefault!55964 () ValueCell!17207)

(assert (=> b!1323925 (= condMapEmpty!55964 (= (arr!43109 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17207)) mapDefault!55964)))))

(declare-fun mapIsEmpty!55964 () Bool)

(assert (=> mapIsEmpty!55964 mapRes!55964))

(declare-fun res!878781 () Bool)

(assert (=> start!111734 (=> (not res!878781) (not e!754738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111734 (= res!878781 (validMask!0 mask!2019))))

(assert (=> start!111734 e!754738))

(declare-fun array_inv!32727 (array!89267) Bool)

(assert (=> start!111734 (array_inv!32727 _keys!1609)))

(assert (=> start!111734 true))

(assert (=> start!111734 tp_is_empty!36211))

(declare-fun array_inv!32728 (array!89269) Bool)

(assert (=> start!111734 (and (array_inv!32728 _values!1337) e!754737)))

(assert (=> start!111734 tp!106650))

(assert (= (and start!111734 res!878781) b!1323919))

(assert (= (and b!1323919 res!878783) b!1323924))

(assert (= (and b!1323924 res!878782) b!1323922))

(assert (= (and b!1323922 res!878780) b!1323921))

(assert (= (and b!1323921 res!878784) b!1323920))

(assert (= (and b!1323925 condMapEmpty!55964) mapIsEmpty!55964))

(assert (= (and b!1323925 (not condMapEmpty!55964)) mapNonEmpty!55964))

(get-info :version)

(assert (= (and mapNonEmpty!55964 ((_ is ValueCellFull!17207) mapValue!55964)) b!1323923))

(assert (= (and b!1323925 ((_ is ValueCellFull!17207) mapDefault!55964)) b!1323918))

(assert (= start!111734 b!1323925))

(declare-fun m!1212483 () Bool)

(assert (=> b!1323922 m!1212483))

(declare-fun m!1212485 () Bool)

(assert (=> mapNonEmpty!55964 m!1212485))

(declare-fun m!1212487 () Bool)

(assert (=> start!111734 m!1212487))

(declare-fun m!1212489 () Bool)

(assert (=> start!111734 m!1212489))

(declare-fun m!1212491 () Bool)

(assert (=> start!111734 m!1212491))

(declare-fun m!1212493 () Bool)

(assert (=> b!1323924 m!1212493))

(declare-fun m!1212495 () Bool)

(assert (=> b!1323920 m!1212495))

(assert (=> b!1323920 m!1212495))

(declare-fun m!1212497 () Bool)

(assert (=> b!1323920 m!1212497))

(check-sat (not b!1323922) (not b!1323920) (not b_next!30391) (not mapNonEmpty!55964) (not b!1323924) (not start!111734) tp_is_empty!36211 b_and!48911)
(check-sat b_and!48911 (not b_next!30391))
