; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110878 () Bool)

(assert start!110878)

(declare-fun b_free!29713 () Bool)

(declare-fun b_next!29713 () Bool)

(assert (=> start!110878 (= b_free!29713 (not b_next!29713))))

(declare-fun tp!104461 () Bool)

(declare-fun b_and!47903 () Bool)

(assert (=> start!110878 (= tp!104461 b_and!47903)))

(declare-fun b!1312597 () Bool)

(declare-fun e!748679 () Bool)

(declare-fun tp_is_empty!35443 () Bool)

(assert (=> b!1312597 (= e!748679 tp_is_empty!35443)))

(declare-fun b!1312598 () Bool)

(declare-fun e!748675 () Bool)

(declare-fun e!748676 () Bool)

(declare-fun mapRes!54793 () Bool)

(assert (=> b!1312598 (= e!748675 (and e!748676 mapRes!54793))))

(declare-fun condMapEmpty!54793 () Bool)

(declare-datatypes ((V!52361 0))(
  ( (V!52362 (val!17796 Int)) )
))
(declare-datatypes ((ValueCell!16823 0))(
  ( (ValueCellFull!16823 (v!20422 V!52361)) (EmptyCell!16823) )
))
(declare-datatypes ((array!87775 0))(
  ( (array!87776 (arr!42368 (Array (_ BitVec 32) ValueCell!16823)) (size!42920 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87775)

(declare-fun mapDefault!54793 () ValueCell!16823)

(assert (=> b!1312598 (= condMapEmpty!54793 (= (arr!42368 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16823)) mapDefault!54793)))))

(declare-fun res!871475 () Bool)

(declare-fun e!748678 () Bool)

(assert (=> start!110878 (=> (not res!871475) (not e!748678))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110878 (= res!871475 (validMask!0 mask!2040))))

(assert (=> start!110878 e!748678))

(assert (=> start!110878 tp!104461))

(declare-datatypes ((array!87777 0))(
  ( (array!87778 (arr!42369 (Array (_ BitVec 32) (_ BitVec 64))) (size!42921 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87777)

(declare-fun array_inv!32201 (array!87777) Bool)

(assert (=> start!110878 (array_inv!32201 _keys!1628)))

(assert (=> start!110878 true))

(assert (=> start!110878 tp_is_empty!35443))

(declare-fun array_inv!32202 (array!87775) Bool)

(assert (=> start!110878 (and (array_inv!32202 _values!1354) e!748675)))

(declare-fun b!1312599 () Bool)

(declare-fun res!871474 () Bool)

(assert (=> b!1312599 (=> (not res!871474) (not e!748678))))

(declare-datatypes ((List!30148 0))(
  ( (Nil!30145) (Cons!30144 (h!31353 (_ BitVec 64)) (t!43746 List!30148)) )
))
(declare-fun arrayNoDuplicates!0 (array!87777 (_ BitVec 32) List!30148) Bool)

(assert (=> b!1312599 (= res!871474 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30145))))

(declare-fun mapNonEmpty!54793 () Bool)

(declare-fun tp!104462 () Bool)

(assert (=> mapNonEmpty!54793 (= mapRes!54793 (and tp!104462 e!748679))))

(declare-fun mapRest!54793 () (Array (_ BitVec 32) ValueCell!16823))

(declare-fun mapKey!54793 () (_ BitVec 32))

(declare-fun mapValue!54793 () ValueCell!16823)

(assert (=> mapNonEmpty!54793 (= (arr!42368 _values!1354) (store mapRest!54793 mapKey!54793 mapValue!54793))))

(declare-fun b!1312600 () Bool)

(declare-fun res!871473 () Bool)

(assert (=> b!1312600 (=> (not res!871473) (not e!748678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87777 (_ BitVec 32)) Bool)

(assert (=> b!1312600 (= res!871473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312601 () Bool)

(declare-fun res!871476 () Bool)

(assert (=> b!1312601 (=> (not res!871476) (not e!748678))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312601 (= res!871476 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42921 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312602 () Bool)

(assert (=> b!1312602 (= e!748676 tp_is_empty!35443)))

(declare-fun b!1312603 () Bool)

(assert (=> b!1312603 (= e!748678 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585402 () Bool)

(declare-fun minValue!1296 () V!52361)

(declare-fun zeroValue!1296 () V!52361)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23032 0))(
  ( (tuple2!23033 (_1!11527 (_ BitVec 64)) (_2!11527 V!52361)) )
))
(declare-datatypes ((List!30149 0))(
  ( (Nil!30146) (Cons!30145 (h!31354 tuple2!23032) (t!43747 List!30149)) )
))
(declare-datatypes ((ListLongMap!20689 0))(
  ( (ListLongMap!20690 (toList!10360 List!30149)) )
))
(declare-fun contains!8437 (ListLongMap!20689 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5255 (array!87777 array!87775 (_ BitVec 32) (_ BitVec 32) V!52361 V!52361 (_ BitVec 32) Int) ListLongMap!20689)

(assert (=> b!1312603 (= lt!585402 (contains!8437 (getCurrentListMap!5255 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312604 () Bool)

(declare-fun res!871477 () Bool)

(assert (=> b!1312604 (=> (not res!871477) (not e!748678))))

(assert (=> b!1312604 (= res!871477 (and (= (size!42920 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42921 _keys!1628) (size!42920 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54793 () Bool)

(assert (=> mapIsEmpty!54793 mapRes!54793))

(assert (= (and start!110878 res!871475) b!1312604))

(assert (= (and b!1312604 res!871477) b!1312600))

(assert (= (and b!1312600 res!871473) b!1312599))

(assert (= (and b!1312599 res!871474) b!1312601))

(assert (= (and b!1312601 res!871476) b!1312603))

(assert (= (and b!1312598 condMapEmpty!54793) mapIsEmpty!54793))

(assert (= (and b!1312598 (not condMapEmpty!54793)) mapNonEmpty!54793))

(get-info :version)

(assert (= (and mapNonEmpty!54793 ((_ is ValueCellFull!16823) mapValue!54793)) b!1312597))

(assert (= (and b!1312598 ((_ is ValueCellFull!16823) mapDefault!54793)) b!1312602))

(assert (= start!110878 b!1312598))

(declare-fun m!1201263 () Bool)

(assert (=> b!1312599 m!1201263))

(declare-fun m!1201265 () Bool)

(assert (=> mapNonEmpty!54793 m!1201265))

(declare-fun m!1201267 () Bool)

(assert (=> start!110878 m!1201267))

(declare-fun m!1201269 () Bool)

(assert (=> start!110878 m!1201269))

(declare-fun m!1201271 () Bool)

(assert (=> start!110878 m!1201271))

(declare-fun m!1201273 () Bool)

(assert (=> b!1312603 m!1201273))

(assert (=> b!1312603 m!1201273))

(declare-fun m!1201275 () Bool)

(assert (=> b!1312603 m!1201275))

(declare-fun m!1201277 () Bool)

(assert (=> b!1312600 m!1201277))

(check-sat (not b_next!29713) b_and!47903 tp_is_empty!35443 (not start!110878) (not mapNonEmpty!54793) (not b!1312600) (not b!1312603) (not b!1312599))
(check-sat b_and!47903 (not b_next!29713))
