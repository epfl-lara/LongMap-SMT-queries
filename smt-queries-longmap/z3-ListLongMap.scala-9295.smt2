; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111118 () Bool)

(assert start!111118)

(declare-fun b_free!29953 () Bool)

(declare-fun b_next!29953 () Bool)

(assert (=> start!111118 (= b_free!29953 (not b_next!29953))))

(declare-fun tp!105181 () Bool)

(declare-fun b_and!48143 () Bool)

(assert (=> start!111118 (= tp!105181 b_and!48143)))

(declare-fun b!1315576 () Bool)

(declare-fun res!873373 () Bool)

(declare-fun e!750477 () Bool)

(assert (=> b!1315576 (=> (not res!873373) (not e!750477))))

(declare-datatypes ((array!88237 0))(
  ( (array!88238 (arr!42599 (Array (_ BitVec 32) (_ BitVec 64))) (size!43151 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88237)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1315576 (= res!873373 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43151 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315577 () Bool)

(declare-fun res!873374 () Bool)

(assert (=> b!1315577 (=> (not res!873374) (not e!750477))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88237 (_ BitVec 32)) Bool)

(assert (=> b!1315577 (= res!873374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!873372 () Bool)

(assert (=> start!111118 (=> (not res!873372) (not e!750477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111118 (= res!873372 (validMask!0 mask!2040))))

(assert (=> start!111118 e!750477))

(assert (=> start!111118 tp!105181))

(declare-fun array_inv!32359 (array!88237) Bool)

(assert (=> start!111118 (array_inv!32359 _keys!1628)))

(assert (=> start!111118 true))

(declare-fun tp_is_empty!35683 () Bool)

(assert (=> start!111118 tp_is_empty!35683))

(declare-datatypes ((V!52681 0))(
  ( (V!52682 (val!17916 Int)) )
))
(declare-datatypes ((ValueCell!16943 0))(
  ( (ValueCellFull!16943 (v!20542 V!52681)) (EmptyCell!16943) )
))
(declare-datatypes ((array!88239 0))(
  ( (array!88240 (arr!42600 (Array (_ BitVec 32) ValueCell!16943)) (size!43152 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88239)

(declare-fun e!750475 () Bool)

(declare-fun array_inv!32360 (array!88239) Bool)

(assert (=> start!111118 (and (array_inv!32360 _values!1354) e!750475)))

(declare-fun mapNonEmpty!55153 () Bool)

(declare-fun mapRes!55153 () Bool)

(declare-fun tp!105182 () Bool)

(declare-fun e!750479 () Bool)

(assert (=> mapNonEmpty!55153 (= mapRes!55153 (and tp!105182 e!750479))))

(declare-fun mapValue!55153 () ValueCell!16943)

(declare-fun mapKey!55153 () (_ BitVec 32))

(declare-fun mapRest!55153 () (Array (_ BitVec 32) ValueCell!16943))

(assert (=> mapNonEmpty!55153 (= (arr!42600 _values!1354) (store mapRest!55153 mapKey!55153 mapValue!55153))))

(declare-fun b!1315578 () Bool)

(declare-fun e!750476 () Bool)

(assert (=> b!1315578 (= e!750475 (and e!750476 mapRes!55153))))

(declare-fun condMapEmpty!55153 () Bool)

(declare-fun mapDefault!55153 () ValueCell!16943)

(assert (=> b!1315578 (= condMapEmpty!55153 (= (arr!42600 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16943)) mapDefault!55153)))))

(declare-fun b!1315579 () Bool)

(declare-fun res!873375 () Bool)

(assert (=> b!1315579 (=> (not res!873375) (not e!750477))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315579 (= res!873375 (and (= (size!43152 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43151 _keys!1628) (size!43152 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315580 () Bool)

(assert (=> b!1315580 (= e!750476 tp_is_empty!35683)))

(declare-fun b!1315581 () Bool)

(declare-fun res!873376 () Bool)

(assert (=> b!1315581 (=> (not res!873376) (not e!750477))))

(declare-datatypes ((List!30314 0))(
  ( (Nil!30311) (Cons!30310 (h!31519 (_ BitVec 64)) (t!43912 List!30314)) )
))
(declare-fun arrayNoDuplicates!0 (array!88237 (_ BitVec 32) List!30314) Bool)

(assert (=> b!1315581 (= res!873376 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30311))))

(declare-fun mapIsEmpty!55153 () Bool)

(assert (=> mapIsEmpty!55153 mapRes!55153))

(declare-fun b!1315582 () Bool)

(assert (=> b!1315582 (= e!750477 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585753 () Bool)

(declare-fun minValue!1296 () V!52681)

(declare-fun zeroValue!1296 () V!52681)

(declare-datatypes ((tuple2!23200 0))(
  ( (tuple2!23201 (_1!11611 (_ BitVec 64)) (_2!11611 V!52681)) )
))
(declare-datatypes ((List!30315 0))(
  ( (Nil!30312) (Cons!30311 (h!31520 tuple2!23200) (t!43913 List!30315)) )
))
(declare-datatypes ((ListLongMap!20857 0))(
  ( (ListLongMap!20858 (toList!10444 List!30315)) )
))
(declare-fun contains!8521 (ListLongMap!20857 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5339 (array!88237 array!88239 (_ BitVec 32) (_ BitVec 32) V!52681 V!52681 (_ BitVec 32) Int) ListLongMap!20857)

(assert (=> b!1315582 (= lt!585753 (contains!8521 (getCurrentListMap!5339 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315583 () Bool)

(assert (=> b!1315583 (= e!750479 tp_is_empty!35683)))

(assert (= (and start!111118 res!873372) b!1315579))

(assert (= (and b!1315579 res!873375) b!1315577))

(assert (= (and b!1315577 res!873374) b!1315581))

(assert (= (and b!1315581 res!873376) b!1315576))

(assert (= (and b!1315576 res!873373) b!1315582))

(assert (= (and b!1315578 condMapEmpty!55153) mapIsEmpty!55153))

(assert (= (and b!1315578 (not condMapEmpty!55153)) mapNonEmpty!55153))

(get-info :version)

(assert (= (and mapNonEmpty!55153 ((_ is ValueCellFull!16943) mapValue!55153)) b!1315583))

(assert (= (and b!1315578 ((_ is ValueCellFull!16943) mapDefault!55153)) b!1315580))

(assert (= start!111118 b!1315578))

(declare-fun m!1203255 () Bool)

(assert (=> b!1315581 m!1203255))

(declare-fun m!1203257 () Bool)

(assert (=> start!111118 m!1203257))

(declare-fun m!1203259 () Bool)

(assert (=> start!111118 m!1203259))

(declare-fun m!1203261 () Bool)

(assert (=> start!111118 m!1203261))

(declare-fun m!1203263 () Bool)

(assert (=> mapNonEmpty!55153 m!1203263))

(declare-fun m!1203265 () Bool)

(assert (=> b!1315577 m!1203265))

(declare-fun m!1203267 () Bool)

(assert (=> b!1315582 m!1203267))

(assert (=> b!1315582 m!1203267))

(declare-fun m!1203269 () Bool)

(assert (=> b!1315582 m!1203269))

(check-sat (not start!111118) (not b_next!29953) (not b!1315582) (not b!1315581) (not b!1315577) tp_is_empty!35683 (not mapNonEmpty!55153) b_and!48143)
(check-sat b_and!48143 (not b_next!29953))
