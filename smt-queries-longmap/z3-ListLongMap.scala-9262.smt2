; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111144 () Bool)

(assert start!111144)

(declare-fun b_free!29755 () Bool)

(declare-fun b_next!29755 () Bool)

(assert (=> start!111144 (= b_free!29755 (not b_next!29755))))

(declare-fun tp!104586 () Bool)

(declare-fun b_and!47965 () Bool)

(assert (=> start!111144 (= tp!104586 b_and!47965)))

(declare-fun b!1314497 () Bool)

(declare-fun e!749868 () Bool)

(declare-fun tp_is_empty!35485 () Bool)

(assert (=> b!1314497 (= e!749868 tp_is_empty!35485)))

(declare-fun mapIsEmpty!54856 () Bool)

(declare-fun mapRes!54856 () Bool)

(assert (=> mapIsEmpty!54856 mapRes!54856))

(declare-fun b!1314498 () Bool)

(declare-fun e!749869 () Bool)

(assert (=> b!1314498 (= e!749869 (and e!749868 mapRes!54856))))

(declare-fun condMapEmpty!54856 () Bool)

(declare-datatypes ((V!52417 0))(
  ( (V!52418 (val!17817 Int)) )
))
(declare-datatypes ((ValueCell!16844 0))(
  ( (ValueCellFull!16844 (v!20439 V!52417)) (EmptyCell!16844) )
))
(declare-datatypes ((array!87999 0))(
  ( (array!88000 (arr!42475 (Array (_ BitVec 32) ValueCell!16844)) (size!43026 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87999)

(declare-fun mapDefault!54856 () ValueCell!16844)

(assert (=> b!1314498 (= condMapEmpty!54856 (= (arr!42475 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16844)) mapDefault!54856)))))

(declare-fun b!1314499 () Bool)

(declare-fun res!872364 () Bool)

(declare-fun e!749870 () Bool)

(assert (=> b!1314499 (=> (not res!872364) (not e!749870))))

(declare-datatypes ((array!88001 0))(
  ( (array!88002 (arr!42476 (Array (_ BitVec 32) (_ BitVec 64))) (size!43027 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88001)

(declare-datatypes ((List!30147 0))(
  ( (Nil!30144) (Cons!30143 (h!31361 (_ BitVec 64)) (t!43745 List!30147)) )
))
(declare-fun arrayNoDuplicates!0 (array!88001 (_ BitVec 32) List!30147) Bool)

(assert (=> b!1314499 (= res!872364 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30144))))

(declare-fun mapNonEmpty!54856 () Bool)

(declare-fun tp!104587 () Bool)

(declare-fun e!749867 () Bool)

(assert (=> mapNonEmpty!54856 (= mapRes!54856 (and tp!104587 e!749867))))

(declare-fun mapRest!54856 () (Array (_ BitVec 32) ValueCell!16844))

(declare-fun mapValue!54856 () ValueCell!16844)

(declare-fun mapKey!54856 () (_ BitVec 32))

(assert (=> mapNonEmpty!54856 (= (arr!42475 _values!1354) (store mapRest!54856 mapKey!54856 mapValue!54856))))

(declare-fun b!1314501 () Bool)

(declare-fun res!872363 () Bool)

(assert (=> b!1314501 (=> (not res!872363) (not e!749870))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314501 (= res!872363 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43027 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314502 () Bool)

(declare-fun res!872366 () Bool)

(assert (=> b!1314502 (=> (not res!872366) (not e!749870))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88001 (_ BitVec 32)) Bool)

(assert (=> b!1314502 (= res!872366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314503 () Bool)

(declare-fun res!872362 () Bool)

(assert (=> b!1314503 (=> (not res!872362) (not e!749870))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314503 (= res!872362 (and (= (size!43026 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43027 _keys!1628) (size!43026 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314504 () Bool)

(assert (=> b!1314504 (= e!749870 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52417)

(declare-fun lt!586118 () Bool)

(declare-fun zeroValue!1296 () V!52417)

(declare-datatypes ((tuple2!22996 0))(
  ( (tuple2!22997 (_1!11509 (_ BitVec 64)) (_2!11509 V!52417)) )
))
(declare-datatypes ((List!30148 0))(
  ( (Nil!30145) (Cons!30144 (h!31362 tuple2!22996) (t!43746 List!30148)) )
))
(declare-datatypes ((ListLongMap!20661 0))(
  ( (ListLongMap!20662 (toList!10346 List!30148)) )
))
(declare-fun contains!8508 (ListLongMap!20661 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5350 (array!88001 array!87999 (_ BitVec 32) (_ BitVec 32) V!52417 V!52417 (_ BitVec 32) Int) ListLongMap!20661)

(assert (=> b!1314504 (= lt!586118 (contains!8508 (getCurrentListMap!5350 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314500 () Bool)

(assert (=> b!1314500 (= e!749867 tp_is_empty!35485)))

(declare-fun res!872365 () Bool)

(assert (=> start!111144 (=> (not res!872365) (not e!749870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111144 (= res!872365 (validMask!0 mask!2040))))

(assert (=> start!111144 e!749870))

(assert (=> start!111144 tp!104586))

(declare-fun array_inv!32341 (array!88001) Bool)

(assert (=> start!111144 (array_inv!32341 _keys!1628)))

(assert (=> start!111144 true))

(assert (=> start!111144 tp_is_empty!35485))

(declare-fun array_inv!32342 (array!87999) Bool)

(assert (=> start!111144 (and (array_inv!32342 _values!1354) e!749869)))

(assert (= (and start!111144 res!872365) b!1314503))

(assert (= (and b!1314503 res!872362) b!1314502))

(assert (= (and b!1314502 res!872366) b!1314499))

(assert (= (and b!1314499 res!872364) b!1314501))

(assert (= (and b!1314501 res!872363) b!1314504))

(assert (= (and b!1314498 condMapEmpty!54856) mapIsEmpty!54856))

(assert (= (and b!1314498 (not condMapEmpty!54856)) mapNonEmpty!54856))

(get-info :version)

(assert (= (and mapNonEmpty!54856 ((_ is ValueCellFull!16844) mapValue!54856)) b!1314500))

(assert (= (and b!1314498 ((_ is ValueCellFull!16844) mapDefault!54856)) b!1314497))

(assert (= start!111144 b!1314498))

(declare-fun m!1203725 () Bool)

(assert (=> b!1314499 m!1203725))

(declare-fun m!1203727 () Bool)

(assert (=> b!1314502 m!1203727))

(declare-fun m!1203729 () Bool)

(assert (=> start!111144 m!1203729))

(declare-fun m!1203731 () Bool)

(assert (=> start!111144 m!1203731))

(declare-fun m!1203733 () Bool)

(assert (=> start!111144 m!1203733))

(declare-fun m!1203735 () Bool)

(assert (=> mapNonEmpty!54856 m!1203735))

(declare-fun m!1203737 () Bool)

(assert (=> b!1314504 m!1203737))

(assert (=> b!1314504 m!1203737))

(declare-fun m!1203739 () Bool)

(assert (=> b!1314504 m!1203739))

(check-sat (not b_next!29755) (not b!1314504) tp_is_empty!35485 (not b!1314499) (not mapNonEmpty!54856) b_and!47965 (not start!111144) (not b!1314502))
(check-sat b_and!47965 (not b_next!29755))
