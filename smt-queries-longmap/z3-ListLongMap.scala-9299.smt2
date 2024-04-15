; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111142 () Bool)

(assert start!111142)

(declare-fun b_free!29977 () Bool)

(declare-fun b_next!29977 () Bool)

(assert (=> start!111142 (= b_free!29977 (not b_next!29977))))

(declare-fun tp!105253 () Bool)

(declare-fun b_and!48167 () Bool)

(assert (=> start!111142 (= tp!105253 b_and!48167)))

(declare-fun b!1315865 () Bool)

(declare-fun e!750657 () Bool)

(assert (=> b!1315865 (= e!750657 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88283 0))(
  ( (array!88284 (arr!42622 (Array (_ BitVec 32) (_ BitVec 64))) (size!43174 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88283)

(declare-fun lt!585789 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52713 0))(
  ( (V!52714 (val!17928 Int)) )
))
(declare-fun minValue!1296 () V!52713)

(declare-fun zeroValue!1296 () V!52713)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16955 0))(
  ( (ValueCellFull!16955 (v!20554 V!52713)) (EmptyCell!16955) )
))
(declare-datatypes ((array!88285 0))(
  ( (array!88286 (arr!42623 (Array (_ BitVec 32) ValueCell!16955)) (size!43175 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88285)

(declare-datatypes ((tuple2!23212 0))(
  ( (tuple2!23213 (_1!11617 (_ BitVec 64)) (_2!11617 V!52713)) )
))
(declare-datatypes ((List!30328 0))(
  ( (Nil!30325) (Cons!30324 (h!31533 tuple2!23212) (t!43926 List!30328)) )
))
(declare-datatypes ((ListLongMap!20869 0))(
  ( (ListLongMap!20870 (toList!10450 List!30328)) )
))
(declare-fun contains!8527 (ListLongMap!20869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5345 (array!88283 array!88285 (_ BitVec 32) (_ BitVec 32) V!52713 V!52713 (_ BitVec 32) Int) ListLongMap!20869)

(assert (=> b!1315865 (= lt!585789 (contains!8527 (getCurrentListMap!5345 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315866 () Bool)

(declare-fun res!873554 () Bool)

(assert (=> b!1315866 (=> (not res!873554) (not e!750657))))

(assert (=> b!1315866 (= res!873554 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43174 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!55189 () Bool)

(declare-fun mapRes!55189 () Bool)

(declare-fun tp!105254 () Bool)

(declare-fun e!750656 () Bool)

(assert (=> mapNonEmpty!55189 (= mapRes!55189 (and tp!105254 e!750656))))

(declare-fun mapValue!55189 () ValueCell!16955)

(declare-fun mapRest!55189 () (Array (_ BitVec 32) ValueCell!16955))

(declare-fun mapKey!55189 () (_ BitVec 32))

(assert (=> mapNonEmpty!55189 (= (arr!42623 _values!1354) (store mapRest!55189 mapKey!55189 mapValue!55189))))

(declare-fun b!1315867 () Bool)

(declare-fun res!873553 () Bool)

(assert (=> b!1315867 (=> (not res!873553) (not e!750657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88283 (_ BitVec 32)) Bool)

(assert (=> b!1315867 (= res!873553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!55189 () Bool)

(assert (=> mapIsEmpty!55189 mapRes!55189))

(declare-fun b!1315864 () Bool)

(declare-fun e!750658 () Bool)

(declare-fun tp_is_empty!35707 () Bool)

(assert (=> b!1315864 (= e!750658 tp_is_empty!35707)))

(declare-fun res!873555 () Bool)

(assert (=> start!111142 (=> (not res!873555) (not e!750657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111142 (= res!873555 (validMask!0 mask!2040))))

(assert (=> start!111142 e!750657))

(assert (=> start!111142 tp!105253))

(declare-fun array_inv!32371 (array!88283) Bool)

(assert (=> start!111142 (array_inv!32371 _keys!1628)))

(assert (=> start!111142 true))

(assert (=> start!111142 tp_is_empty!35707))

(declare-fun e!750659 () Bool)

(declare-fun array_inv!32372 (array!88285) Bool)

(assert (=> start!111142 (and (array_inv!32372 _values!1354) e!750659)))

(declare-fun b!1315868 () Bool)

(assert (=> b!1315868 (= e!750656 tp_is_empty!35707)))

(declare-fun b!1315869 () Bool)

(declare-fun res!873552 () Bool)

(assert (=> b!1315869 (=> (not res!873552) (not e!750657))))

(declare-datatypes ((List!30329 0))(
  ( (Nil!30326) (Cons!30325 (h!31534 (_ BitVec 64)) (t!43927 List!30329)) )
))
(declare-fun arrayNoDuplicates!0 (array!88283 (_ BitVec 32) List!30329) Bool)

(assert (=> b!1315869 (= res!873552 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30326))))

(declare-fun b!1315870 () Bool)

(declare-fun res!873556 () Bool)

(assert (=> b!1315870 (=> (not res!873556) (not e!750657))))

(assert (=> b!1315870 (= res!873556 (and (= (size!43175 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43174 _keys!1628) (size!43175 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315871 () Bool)

(assert (=> b!1315871 (= e!750659 (and e!750658 mapRes!55189))))

(declare-fun condMapEmpty!55189 () Bool)

(declare-fun mapDefault!55189 () ValueCell!16955)

(assert (=> b!1315871 (= condMapEmpty!55189 (= (arr!42623 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16955)) mapDefault!55189)))))

(assert (= (and start!111142 res!873555) b!1315870))

(assert (= (and b!1315870 res!873556) b!1315867))

(assert (= (and b!1315867 res!873553) b!1315869))

(assert (= (and b!1315869 res!873552) b!1315866))

(assert (= (and b!1315866 res!873554) b!1315865))

(assert (= (and b!1315871 condMapEmpty!55189) mapIsEmpty!55189))

(assert (= (and b!1315871 (not condMapEmpty!55189)) mapNonEmpty!55189))

(get-info :version)

(assert (= (and mapNonEmpty!55189 ((_ is ValueCellFull!16955) mapValue!55189)) b!1315868))

(assert (= (and b!1315871 ((_ is ValueCellFull!16955) mapDefault!55189)) b!1315864))

(assert (= start!111142 b!1315871))

(declare-fun m!1203447 () Bool)

(assert (=> start!111142 m!1203447))

(declare-fun m!1203449 () Bool)

(assert (=> start!111142 m!1203449))

(declare-fun m!1203451 () Bool)

(assert (=> start!111142 m!1203451))

(declare-fun m!1203453 () Bool)

(assert (=> b!1315869 m!1203453))

(declare-fun m!1203455 () Bool)

(assert (=> mapNonEmpty!55189 m!1203455))

(declare-fun m!1203457 () Bool)

(assert (=> b!1315867 m!1203457))

(declare-fun m!1203459 () Bool)

(assert (=> b!1315865 m!1203459))

(assert (=> b!1315865 m!1203459))

(declare-fun m!1203461 () Bool)

(assert (=> b!1315865 m!1203461))

(check-sat tp_is_empty!35707 (not b_next!29977) (not mapNonEmpty!55189) (not b!1315865) b_and!48167 (not b!1315867) (not start!111142) (not b!1315869))
(check-sat b_and!48167 (not b_next!29977))
