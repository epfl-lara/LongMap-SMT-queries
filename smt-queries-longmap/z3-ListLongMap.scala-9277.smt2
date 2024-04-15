; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111010 () Bool)

(assert start!111010)

(declare-fun b_free!29845 () Bool)

(declare-fun b_next!29845 () Bool)

(assert (=> start!111010 (= b_free!29845 (not b_next!29845))))

(declare-fun tp!104858 () Bool)

(declare-fun b_and!48035 () Bool)

(assert (=> start!111010 (= tp!104858 b_and!48035)))

(declare-fun b!1314245 () Bool)

(declare-fun e!749669 () Bool)

(declare-fun tp_is_empty!35575 () Bool)

(assert (=> b!1314245 (= e!749669 tp_is_empty!35575)))

(declare-fun b!1314246 () Bool)

(declare-fun e!749668 () Bool)

(declare-fun e!749667 () Bool)

(declare-fun mapRes!54991 () Bool)

(assert (=> b!1314246 (= e!749668 (and e!749667 mapRes!54991))))

(declare-fun condMapEmpty!54991 () Bool)

(declare-datatypes ((V!52537 0))(
  ( (V!52538 (val!17862 Int)) )
))
(declare-datatypes ((ValueCell!16889 0))(
  ( (ValueCellFull!16889 (v!20488 V!52537)) (EmptyCell!16889) )
))
(declare-datatypes ((array!88027 0))(
  ( (array!88028 (arr!42494 (Array (_ BitVec 32) ValueCell!16889)) (size!43046 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88027)

(declare-fun mapDefault!54991 () ValueCell!16889)

(assert (=> b!1314246 (= condMapEmpty!54991 (= (arr!42494 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16889)) mapDefault!54991)))))

(declare-fun mapIsEmpty!54991 () Bool)

(assert (=> mapIsEmpty!54991 mapRes!54991))

(declare-fun b!1314247 () Bool)

(assert (=> b!1314247 (= e!749667 tp_is_empty!35575)))

(declare-fun mapNonEmpty!54991 () Bool)

(declare-fun tp!104857 () Bool)

(assert (=> mapNonEmpty!54991 (= mapRes!54991 (and tp!104857 e!749669))))

(declare-fun mapValue!54991 () ValueCell!16889)

(declare-fun mapRest!54991 () (Array (_ BitVec 32) ValueCell!16889))

(declare-fun mapKey!54991 () (_ BitVec 32))

(assert (=> mapNonEmpty!54991 (= (arr!42494 _values!1354) (store mapRest!54991 mapKey!54991 mapValue!54991))))

(declare-fun b!1314244 () Bool)

(declare-fun res!872528 () Bool)

(declare-fun e!749666 () Bool)

(assert (=> b!1314244 (=> (not res!872528) (not e!749666))))

(declare-datatypes ((array!88029 0))(
  ( (array!88030 (arr!42495 (Array (_ BitVec 32) (_ BitVec 64))) (size!43047 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88029)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88029 (_ BitVec 32)) Bool)

(assert (=> b!1314244 (= res!872528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!872529 () Bool)

(assert (=> start!111010 (=> (not res!872529) (not e!749666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111010 (= res!872529 (validMask!0 mask!2040))))

(assert (=> start!111010 e!749666))

(assert (=> start!111010 tp!104858))

(declare-fun array_inv!32285 (array!88029) Bool)

(assert (=> start!111010 (array_inv!32285 _keys!1628)))

(assert (=> start!111010 true))

(assert (=> start!111010 tp_is_empty!35575))

(declare-fun array_inv!32286 (array!88027) Bool)

(assert (=> start!111010 (and (array_inv!32286 _values!1354) e!749668)))

(declare-fun b!1314248 () Bool)

(declare-fun res!872530 () Bool)

(assert (=> b!1314248 (=> (not res!872530) (not e!749666))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314248 (= res!872530 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43047 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314249 () Bool)

(declare-fun res!872527 () Bool)

(assert (=> b!1314249 (=> (not res!872527) (not e!749666))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314249 (= res!872527 (and (= (size!43046 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43047 _keys!1628) (size!43046 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314250 () Bool)

(assert (=> b!1314250 (= e!749666 false)))

(declare-fun lt!585591 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52537)

(declare-fun zeroValue!1296 () V!52537)

(declare-datatypes ((tuple2!23120 0))(
  ( (tuple2!23121 (_1!11571 (_ BitVec 64)) (_2!11571 V!52537)) )
))
(declare-datatypes ((List!30236 0))(
  ( (Nil!30233) (Cons!30232 (h!31441 tuple2!23120) (t!43834 List!30236)) )
))
(declare-datatypes ((ListLongMap!20777 0))(
  ( (ListLongMap!20778 (toList!10404 List!30236)) )
))
(declare-fun contains!8481 (ListLongMap!20777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5299 (array!88029 array!88027 (_ BitVec 32) (_ BitVec 32) V!52537 V!52537 (_ BitVec 32) Int) ListLongMap!20777)

(assert (=> b!1314250 (= lt!585591 (contains!8481 (getCurrentListMap!5299 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1314251 () Bool)

(declare-fun res!872526 () Bool)

(assert (=> b!1314251 (=> (not res!872526) (not e!749666))))

(declare-datatypes ((List!30237 0))(
  ( (Nil!30234) (Cons!30233 (h!31442 (_ BitVec 64)) (t!43835 List!30237)) )
))
(declare-fun arrayNoDuplicates!0 (array!88029 (_ BitVec 32) List!30237) Bool)

(assert (=> b!1314251 (= res!872526 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30234))))

(assert (= (and start!111010 res!872529) b!1314249))

(assert (= (and b!1314249 res!872527) b!1314244))

(assert (= (and b!1314244 res!872528) b!1314251))

(assert (= (and b!1314251 res!872526) b!1314248))

(assert (= (and b!1314248 res!872530) b!1314250))

(assert (= (and b!1314246 condMapEmpty!54991) mapIsEmpty!54991))

(assert (= (and b!1314246 (not condMapEmpty!54991)) mapNonEmpty!54991))

(get-info :version)

(assert (= (and mapNonEmpty!54991 ((_ is ValueCellFull!16889) mapValue!54991)) b!1314245))

(assert (= (and b!1314246 ((_ is ValueCellFull!16889) mapDefault!54991)) b!1314247))

(assert (= start!111010 b!1314246))

(declare-fun m!1202361 () Bool)

(assert (=> b!1314250 m!1202361))

(assert (=> b!1314250 m!1202361))

(declare-fun m!1202363 () Bool)

(assert (=> b!1314250 m!1202363))

(declare-fun m!1202365 () Bool)

(assert (=> start!111010 m!1202365))

(declare-fun m!1202367 () Bool)

(assert (=> start!111010 m!1202367))

(declare-fun m!1202369 () Bool)

(assert (=> start!111010 m!1202369))

(declare-fun m!1202371 () Bool)

(assert (=> b!1314244 m!1202371))

(declare-fun m!1202373 () Bool)

(assert (=> b!1314251 m!1202373))

(declare-fun m!1202375 () Bool)

(assert (=> mapNonEmpty!54991 m!1202375))

(check-sat (not b!1314251) (not start!111010) b_and!48035 tp_is_empty!35575 (not mapNonEmpty!54991) (not b!1314250) (not b!1314244) (not b_next!29845))
(check-sat b_and!48035 (not b_next!29845))
