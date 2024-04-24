; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110802 () Bool)

(assert start!110802)

(declare-fun b_free!29413 () Bool)

(declare-fun b_next!29413 () Bool)

(assert (=> start!110802 (= b_free!29413 (not b_next!29413))))

(declare-fun tp!103561 () Bool)

(declare-fun b_and!47623 () Bool)

(assert (=> start!110802 (= tp!103561 b_and!47623)))

(declare-fun b!1309510 () Bool)

(declare-fun res!868919 () Bool)

(declare-fun e!747305 () Bool)

(assert (=> b!1309510 (=> (not res!868919) (not e!747305))))

(declare-datatypes ((array!87343 0))(
  ( (array!87344 (arr!42147 (Array (_ BitVec 32) (_ BitVec 64))) (size!42698 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87343)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309510 (= res!868919 (not (= (select (arr!42147 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309511 () Bool)

(declare-fun res!868916 () Bool)

(assert (=> b!1309511 (=> (not res!868916) (not e!747305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309511 (= res!868916 (validKeyInArray!0 (select (arr!42147 _keys!1628) from!2020)))))

(declare-fun b!1309512 () Bool)

(declare-fun e!747304 () Bool)

(declare-fun e!747302 () Bool)

(declare-fun mapRes!54343 () Bool)

(assert (=> b!1309512 (= e!747304 (and e!747302 mapRes!54343))))

(declare-fun condMapEmpty!54343 () Bool)

(declare-datatypes ((V!51961 0))(
  ( (V!51962 (val!17646 Int)) )
))
(declare-datatypes ((ValueCell!16673 0))(
  ( (ValueCellFull!16673 (v!20268 V!51961)) (EmptyCell!16673) )
))
(declare-datatypes ((array!87345 0))(
  ( (array!87346 (arr!42148 (Array (_ BitVec 32) ValueCell!16673)) (size!42699 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87345)

(declare-fun mapDefault!54343 () ValueCell!16673)

(assert (=> b!1309512 (= condMapEmpty!54343 (= (arr!42148 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16673)) mapDefault!54343)))))

(declare-fun b!1309513 () Bool)

(assert (=> b!1309513 (= e!747305 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!51961)

(declare-fun zeroValue!1296 () V!51961)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22756 0))(
  ( (tuple2!22757 (_1!11389 (_ BitVec 64)) (_2!11389 V!51961)) )
))
(declare-datatypes ((List!29918 0))(
  ( (Nil!29915) (Cons!29914 (h!31132 tuple2!22756) (t!43516 List!29918)) )
))
(declare-datatypes ((ListLongMap!20421 0))(
  ( (ListLongMap!20422 (toList!10226 List!29918)) )
))
(declare-fun contains!8388 (ListLongMap!20421 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5230 (array!87343 array!87345 (_ BitVec 32) (_ BitVec 32) V!51961 V!51961 (_ BitVec 32) Int) ListLongMap!20421)

(assert (=> b!1309513 (contains!8388 (getCurrentListMap!5230 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43253 0))(
  ( (Unit!43254) )
))
(declare-fun lt!585614 () Unit!43253)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!7 (array!87343 array!87345 (_ BitVec 32) (_ BitVec 32) V!51961 V!51961 (_ BitVec 64) (_ BitVec 32) Int) Unit!43253)

(assert (=> b!1309513 (= lt!585614 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!7 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309514 () Bool)

(declare-fun res!868922 () Bool)

(assert (=> b!1309514 (=> (not res!868922) (not e!747305))))

(assert (=> b!1309514 (= res!868922 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!868914 () Bool)

(assert (=> start!110802 (=> (not res!868914) (not e!747305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110802 (= res!868914 (validMask!0 mask!2040))))

(assert (=> start!110802 e!747305))

(assert (=> start!110802 tp!103561))

(declare-fun array_inv!32113 (array!87343) Bool)

(assert (=> start!110802 (array_inv!32113 _keys!1628)))

(assert (=> start!110802 true))

(declare-fun tp_is_empty!35143 () Bool)

(assert (=> start!110802 tp_is_empty!35143))

(declare-fun array_inv!32114 (array!87345) Bool)

(assert (=> start!110802 (and (array_inv!32114 _values!1354) e!747304)))

(declare-fun b!1309515 () Bool)

(declare-fun res!868917 () Bool)

(assert (=> b!1309515 (=> (not res!868917) (not e!747305))))

(assert (=> b!1309515 (= res!868917 (contains!8388 (getCurrentListMap!5230 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309516 () Bool)

(declare-fun res!868921 () Bool)

(assert (=> b!1309516 (=> (not res!868921) (not e!747305))))

(declare-datatypes ((List!29919 0))(
  ( (Nil!29916) (Cons!29915 (h!31133 (_ BitVec 64)) (t!43517 List!29919)) )
))
(declare-fun arrayNoDuplicates!0 (array!87343 (_ BitVec 32) List!29919) Bool)

(assert (=> b!1309516 (= res!868921 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29916))))

(declare-fun b!1309517 () Bool)

(declare-fun res!868918 () Bool)

(assert (=> b!1309517 (=> (not res!868918) (not e!747305))))

(assert (=> b!1309517 (= res!868918 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42698 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54343 () Bool)

(declare-fun tp!103560 () Bool)

(declare-fun e!747301 () Bool)

(assert (=> mapNonEmpty!54343 (= mapRes!54343 (and tp!103560 e!747301))))

(declare-fun mapKey!54343 () (_ BitVec 32))

(declare-fun mapRest!54343 () (Array (_ BitVec 32) ValueCell!16673))

(declare-fun mapValue!54343 () ValueCell!16673)

(assert (=> mapNonEmpty!54343 (= (arr!42148 _values!1354) (store mapRest!54343 mapKey!54343 mapValue!54343))))

(declare-fun b!1309518 () Bool)

(declare-fun res!868915 () Bool)

(assert (=> b!1309518 (=> (not res!868915) (not e!747305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87343 (_ BitVec 32)) Bool)

(assert (=> b!1309518 (= res!868915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309519 () Bool)

(assert (=> b!1309519 (= e!747302 tp_is_empty!35143)))

(declare-fun b!1309520 () Bool)

(declare-fun res!868920 () Bool)

(assert (=> b!1309520 (=> (not res!868920) (not e!747305))))

(assert (=> b!1309520 (= res!868920 (and (= (size!42699 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42698 _keys!1628) (size!42699 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309521 () Bool)

(assert (=> b!1309521 (= e!747301 tp_is_empty!35143)))

(declare-fun mapIsEmpty!54343 () Bool)

(assert (=> mapIsEmpty!54343 mapRes!54343))

(assert (= (and start!110802 res!868914) b!1309520))

(assert (= (and b!1309520 res!868920) b!1309518))

(assert (= (and b!1309518 res!868915) b!1309516))

(assert (= (and b!1309516 res!868921) b!1309517))

(assert (= (and b!1309517 res!868918) b!1309515))

(assert (= (and b!1309515 res!868917) b!1309510))

(assert (= (and b!1309510 res!868919) b!1309511))

(assert (= (and b!1309511 res!868916) b!1309514))

(assert (= (and b!1309514 res!868922) b!1309513))

(assert (= (and b!1309512 condMapEmpty!54343) mapIsEmpty!54343))

(assert (= (and b!1309512 (not condMapEmpty!54343)) mapNonEmpty!54343))

(get-info :version)

(assert (= (and mapNonEmpty!54343 ((_ is ValueCellFull!16673) mapValue!54343)) b!1309521))

(assert (= (and b!1309512 ((_ is ValueCellFull!16673) mapDefault!54343)) b!1309519))

(assert (= start!110802 b!1309512))

(declare-fun m!1200257 () Bool)

(assert (=> start!110802 m!1200257))

(declare-fun m!1200259 () Bool)

(assert (=> start!110802 m!1200259))

(declare-fun m!1200261 () Bool)

(assert (=> start!110802 m!1200261))

(declare-fun m!1200263 () Bool)

(assert (=> b!1309511 m!1200263))

(assert (=> b!1309511 m!1200263))

(declare-fun m!1200265 () Bool)

(assert (=> b!1309511 m!1200265))

(declare-fun m!1200267 () Bool)

(assert (=> mapNonEmpty!54343 m!1200267))

(declare-fun m!1200269 () Bool)

(assert (=> b!1309515 m!1200269))

(assert (=> b!1309515 m!1200269))

(declare-fun m!1200271 () Bool)

(assert (=> b!1309515 m!1200271))

(declare-fun m!1200273 () Bool)

(assert (=> b!1309518 m!1200273))

(declare-fun m!1200275 () Bool)

(assert (=> b!1309516 m!1200275))

(declare-fun m!1200277 () Bool)

(assert (=> b!1309513 m!1200277))

(assert (=> b!1309513 m!1200277))

(declare-fun m!1200279 () Bool)

(assert (=> b!1309513 m!1200279))

(declare-fun m!1200281 () Bool)

(assert (=> b!1309513 m!1200281))

(assert (=> b!1309510 m!1200263))

(check-sat (not mapNonEmpty!54343) (not b!1309518) b_and!47623 (not b_next!29413) (not b!1309511) (not start!110802) tp_is_empty!35143 (not b!1309513) (not b!1309516) (not b!1309515))
(check-sat b_and!47623 (not b_next!29413))
