; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111204 () Bool)

(assert start!111204)

(declare-fun b_free!29815 () Bool)

(declare-fun b_next!29815 () Bool)

(assert (=> start!111204 (= b_free!29815 (not b_next!29815))))

(declare-fun tp!104766 () Bool)

(declare-fun b_and!48025 () Bool)

(assert (=> start!111204 (= tp!104766 b_and!48025)))

(declare-fun b!1315217 () Bool)

(declare-fun res!872813 () Bool)

(declare-fun e!750317 () Bool)

(assert (=> b!1315217 (=> (not res!872813) (not e!750317))))

(declare-datatypes ((array!88119 0))(
  ( (array!88120 (arr!42535 (Array (_ BitVec 32) (_ BitVec 64))) (size!43086 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88119)

(declare-datatypes ((List!30190 0))(
  ( (Nil!30187) (Cons!30186 (h!31404 (_ BitVec 64)) (t!43788 List!30190)) )
))
(declare-fun arrayNoDuplicates!0 (array!88119 (_ BitVec 32) List!30190) Bool)

(assert (=> b!1315217 (= res!872813 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30187))))

(declare-fun b!1315218 () Bool)

(declare-fun res!872812 () Bool)

(assert (=> b!1315218 (=> (not res!872812) (not e!750317))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52497 0))(
  ( (V!52498 (val!17847 Int)) )
))
(declare-datatypes ((ValueCell!16874 0))(
  ( (ValueCellFull!16874 (v!20469 V!52497)) (EmptyCell!16874) )
))
(declare-datatypes ((array!88121 0))(
  ( (array!88122 (arr!42536 (Array (_ BitVec 32) ValueCell!16874)) (size!43087 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88121)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1315218 (= res!872812 (and (= (size!43087 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43086 _keys!1628) (size!43087 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315219 () Bool)

(declare-fun e!750318 () Bool)

(declare-fun tp_is_empty!35545 () Bool)

(assert (=> b!1315219 (= e!750318 tp_is_empty!35545)))

(declare-fun res!872815 () Bool)

(assert (=> start!111204 (=> (not res!872815) (not e!750317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111204 (= res!872815 (validMask!0 mask!2040))))

(assert (=> start!111204 e!750317))

(assert (=> start!111204 tp!104766))

(declare-fun array_inv!32393 (array!88119) Bool)

(assert (=> start!111204 (array_inv!32393 _keys!1628)))

(assert (=> start!111204 true))

(assert (=> start!111204 tp_is_empty!35545))

(declare-fun e!750319 () Bool)

(declare-fun array_inv!32394 (array!88121) Bool)

(assert (=> start!111204 (and (array_inv!32394 _values!1354) e!750319)))

(declare-fun b!1315220 () Bool)

(declare-fun e!750316 () Bool)

(declare-fun mapRes!54946 () Bool)

(assert (=> b!1315220 (= e!750319 (and e!750316 mapRes!54946))))

(declare-fun condMapEmpty!54946 () Bool)

(declare-fun mapDefault!54946 () ValueCell!16874)

(assert (=> b!1315220 (= condMapEmpty!54946 (= (arr!42536 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16874)) mapDefault!54946)))))

(declare-fun mapIsEmpty!54946 () Bool)

(assert (=> mapIsEmpty!54946 mapRes!54946))

(declare-fun mapNonEmpty!54946 () Bool)

(declare-fun tp!104767 () Bool)

(assert (=> mapNonEmpty!54946 (= mapRes!54946 (and tp!104767 e!750318))))

(declare-fun mapKey!54946 () (_ BitVec 32))

(declare-fun mapRest!54946 () (Array (_ BitVec 32) ValueCell!16874))

(declare-fun mapValue!54946 () ValueCell!16874)

(assert (=> mapNonEmpty!54946 (= (arr!42536 _values!1354) (store mapRest!54946 mapKey!54946 mapValue!54946))))

(declare-fun b!1315221 () Bool)

(assert (=> b!1315221 (= e!750317 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586208 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52497)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52497)

(declare-datatypes ((tuple2!23038 0))(
  ( (tuple2!23039 (_1!11530 (_ BitVec 64)) (_2!11530 V!52497)) )
))
(declare-datatypes ((List!30191 0))(
  ( (Nil!30188) (Cons!30187 (h!31405 tuple2!23038) (t!43789 List!30191)) )
))
(declare-datatypes ((ListLongMap!20703 0))(
  ( (ListLongMap!20704 (toList!10367 List!30191)) )
))
(declare-fun contains!8529 (ListLongMap!20703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5371 (array!88119 array!88121 (_ BitVec 32) (_ BitVec 32) V!52497 V!52497 (_ BitVec 32) Int) ListLongMap!20703)

(assert (=> b!1315221 (= lt!586208 (contains!8529 (getCurrentListMap!5371 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315222 () Bool)

(assert (=> b!1315222 (= e!750316 tp_is_empty!35545)))

(declare-fun b!1315223 () Bool)

(declare-fun res!872814 () Bool)

(assert (=> b!1315223 (=> (not res!872814) (not e!750317))))

(assert (=> b!1315223 (= res!872814 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43086 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315224 () Bool)

(declare-fun res!872816 () Bool)

(assert (=> b!1315224 (=> (not res!872816) (not e!750317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88119 (_ BitVec 32)) Bool)

(assert (=> b!1315224 (= res!872816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!111204 res!872815) b!1315218))

(assert (= (and b!1315218 res!872812) b!1315224))

(assert (= (and b!1315224 res!872816) b!1315217))

(assert (= (and b!1315217 res!872813) b!1315223))

(assert (= (and b!1315223 res!872814) b!1315221))

(assert (= (and b!1315220 condMapEmpty!54946) mapIsEmpty!54946))

(assert (= (and b!1315220 (not condMapEmpty!54946)) mapNonEmpty!54946))

(get-info :version)

(assert (= (and mapNonEmpty!54946 ((_ is ValueCellFull!16874) mapValue!54946)) b!1315219))

(assert (= (and b!1315220 ((_ is ValueCellFull!16874) mapDefault!54946)) b!1315222))

(assert (= start!111204 b!1315220))

(declare-fun m!1204205 () Bool)

(assert (=> b!1315217 m!1204205))

(declare-fun m!1204207 () Bool)

(assert (=> b!1315221 m!1204207))

(assert (=> b!1315221 m!1204207))

(declare-fun m!1204209 () Bool)

(assert (=> b!1315221 m!1204209))

(declare-fun m!1204211 () Bool)

(assert (=> start!111204 m!1204211))

(declare-fun m!1204213 () Bool)

(assert (=> start!111204 m!1204213))

(declare-fun m!1204215 () Bool)

(assert (=> start!111204 m!1204215))

(declare-fun m!1204217 () Bool)

(assert (=> mapNonEmpty!54946 m!1204217))

(declare-fun m!1204219 () Bool)

(assert (=> b!1315224 m!1204219))

(check-sat (not b!1315221) b_and!48025 (not b!1315217) (not b_next!29815) (not start!111204) tp_is_empty!35545 (not b!1315224) (not mapNonEmpty!54946))
(check-sat b_and!48025 (not b_next!29815))
