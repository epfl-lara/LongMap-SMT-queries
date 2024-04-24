; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111598 () Bool)

(assert start!111598)

(declare-fun b_free!30031 () Bool)

(declare-fun b_next!30031 () Bool)

(assert (=> start!111598 (= b_free!30031 (not b_next!30031))))

(declare-fun tp!105569 () Bool)

(declare-fun b_and!48253 () Bool)

(assert (=> start!111598 (= tp!105569 b_and!48253)))

(declare-fun b!1319191 () Bool)

(declare-fun res!875173 () Bool)

(declare-fun e!752916 () Bool)

(assert (=> b!1319191 (=> (not res!875173) (not e!752916))))

(declare-datatypes ((array!88721 0))(
  ( (array!88722 (arr!42830 (Array (_ BitVec 32) (_ BitVec 64))) (size!43381 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88721)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52905 0))(
  ( (V!52906 (val!18000 Int)) )
))
(declare-datatypes ((ValueCell!17027 0))(
  ( (ValueCellFull!17027 (v!20625 V!52905)) (EmptyCell!17027) )
))
(declare-datatypes ((array!88723 0))(
  ( (array!88724 (arr!42831 (Array (_ BitVec 32) ValueCell!17027)) (size!43382 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88723)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319191 (= res!875173 (and (= (size!43382 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43381 _keys!1609) (size!43382 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319192 () Bool)

(declare-fun e!752913 () Bool)

(declare-fun tp_is_empty!35851 () Bool)

(assert (=> b!1319192 (= e!752913 tp_is_empty!35851)))

(declare-fun res!875169 () Bool)

(assert (=> start!111598 (=> (not res!875169) (not e!752916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111598 (= res!875169 (validMask!0 mask!2019))))

(assert (=> start!111598 e!752916))

(declare-fun array_inv!32617 (array!88721) Bool)

(assert (=> start!111598 (array_inv!32617 _keys!1609)))

(assert (=> start!111598 true))

(assert (=> start!111598 tp_is_empty!35851))

(declare-fun e!752914 () Bool)

(declare-fun array_inv!32618 (array!88723) Bool)

(assert (=> start!111598 (and (array_inv!32618 _values!1337) e!752914)))

(assert (=> start!111598 tp!105569))

(declare-fun mapIsEmpty!55424 () Bool)

(declare-fun mapRes!55424 () Bool)

(assert (=> mapIsEmpty!55424 mapRes!55424))

(declare-fun b!1319193 () Bool)

(declare-fun res!875170 () Bool)

(assert (=> b!1319193 (=> (not res!875170) (not e!752916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88721 (_ BitVec 32)) Bool)

(assert (=> b!1319193 (= res!875170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55424 () Bool)

(declare-fun tp!105568 () Bool)

(assert (=> mapNonEmpty!55424 (= mapRes!55424 (and tp!105568 e!752913))))

(declare-fun mapRest!55424 () (Array (_ BitVec 32) ValueCell!17027))

(declare-fun mapKey!55424 () (_ BitVec 32))

(declare-fun mapValue!55424 () ValueCell!17027)

(assert (=> mapNonEmpty!55424 (= (arr!42831 _values!1337) (store mapRest!55424 mapKey!55424 mapValue!55424))))

(declare-fun b!1319194 () Bool)

(declare-fun res!875172 () Bool)

(assert (=> b!1319194 (=> (not res!875172) (not e!752916))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319194 (= res!875172 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43381 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319195 () Bool)

(declare-fun e!752915 () Bool)

(assert (=> b!1319195 (= e!752914 (and e!752915 mapRes!55424))))

(declare-fun condMapEmpty!55424 () Bool)

(declare-fun mapDefault!55424 () ValueCell!17027)

(assert (=> b!1319195 (= condMapEmpty!55424 (= (arr!42831 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17027)) mapDefault!55424)))))

(declare-fun b!1319196 () Bool)

(assert (=> b!1319196 (= e!752916 false)))

(declare-fun zeroValue!1279 () V!52905)

(declare-fun minValue!1279 () V!52905)

(declare-fun lt!586898 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23196 0))(
  ( (tuple2!23197 (_1!11609 (_ BitVec 64)) (_2!11609 V!52905)) )
))
(declare-datatypes ((List!30359 0))(
  ( (Nil!30356) (Cons!30355 (h!31573 tuple2!23196) (t!43959 List!30359)) )
))
(declare-datatypes ((ListLongMap!20861 0))(
  ( (ListLongMap!20862 (toList!10446 List!30359)) )
))
(declare-fun contains!8613 (ListLongMap!20861 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5450 (array!88721 array!88723 (_ BitVec 32) (_ BitVec 32) V!52905 V!52905 (_ BitVec 32) Int) ListLongMap!20861)

(assert (=> b!1319196 (= lt!586898 (contains!8613 (getCurrentListMap!5450 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319197 () Bool)

(declare-fun res!875171 () Bool)

(assert (=> b!1319197 (=> (not res!875171) (not e!752916))))

(declare-datatypes ((List!30360 0))(
  ( (Nil!30357) (Cons!30356 (h!31574 (_ BitVec 64)) (t!43960 List!30360)) )
))
(declare-fun arrayNoDuplicates!0 (array!88721 (_ BitVec 32) List!30360) Bool)

(assert (=> b!1319197 (= res!875171 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30357))))

(declare-fun b!1319198 () Bool)

(assert (=> b!1319198 (= e!752915 tp_is_empty!35851)))

(assert (= (and start!111598 res!875169) b!1319191))

(assert (= (and b!1319191 res!875173) b!1319193))

(assert (= (and b!1319193 res!875170) b!1319197))

(assert (= (and b!1319197 res!875171) b!1319194))

(assert (= (and b!1319194 res!875172) b!1319196))

(assert (= (and b!1319195 condMapEmpty!55424) mapIsEmpty!55424))

(assert (= (and b!1319195 (not condMapEmpty!55424)) mapNonEmpty!55424))

(get-info :version)

(assert (= (and mapNonEmpty!55424 ((_ is ValueCellFull!17027) mapValue!55424)) b!1319192))

(assert (= (and b!1319195 ((_ is ValueCellFull!17027) mapDefault!55424)) b!1319198))

(assert (= start!111598 b!1319195))

(declare-fun m!1207193 () Bool)

(assert (=> mapNonEmpty!55424 m!1207193))

(declare-fun m!1207195 () Bool)

(assert (=> start!111598 m!1207195))

(declare-fun m!1207197 () Bool)

(assert (=> start!111598 m!1207197))

(declare-fun m!1207199 () Bool)

(assert (=> start!111598 m!1207199))

(declare-fun m!1207201 () Bool)

(assert (=> b!1319193 m!1207201))

(declare-fun m!1207203 () Bool)

(assert (=> b!1319197 m!1207203))

(declare-fun m!1207205 () Bool)

(assert (=> b!1319196 m!1207205))

(assert (=> b!1319196 m!1207205))

(declare-fun m!1207207 () Bool)

(assert (=> b!1319196 m!1207207))

(check-sat tp_is_empty!35851 (not b!1319197) (not b!1319196) b_and!48253 (not b!1319193) (not start!111598) (not b_next!30031) (not mapNonEmpty!55424))
(check-sat b_and!48253 (not b_next!30031))
