; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111052 () Bool)

(assert start!111052)

(declare-fun b_free!29887 () Bool)

(declare-fun b_next!29887 () Bool)

(assert (=> start!111052 (= b_free!29887 (not b_next!29887))))

(declare-fun tp!104984 () Bool)

(declare-fun b_and!48077 () Bool)

(assert (=> start!111052 (= tp!104984 b_and!48077)))

(declare-fun b!1314748 () Bool)

(declare-fun e!749981 () Bool)

(declare-fun tp_is_empty!35617 () Bool)

(assert (=> b!1314748 (= e!749981 tp_is_empty!35617)))

(declare-fun b!1314749 () Bool)

(declare-fun res!872841 () Bool)

(declare-fun e!749983 () Bool)

(assert (=> b!1314749 (=> (not res!872841) (not e!749983))))

(declare-datatypes ((array!88109 0))(
  ( (array!88110 (arr!42535 (Array (_ BitVec 32) (_ BitVec 64))) (size!43087 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88109)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88109 (_ BitVec 32)) Bool)

(assert (=> b!1314749 (= res!872841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314750 () Bool)

(declare-fun res!872845 () Bool)

(assert (=> b!1314750 (=> (not res!872845) (not e!749983))))

(declare-datatypes ((V!52593 0))(
  ( (V!52594 (val!17883 Int)) )
))
(declare-datatypes ((ValueCell!16910 0))(
  ( (ValueCellFull!16910 (v!20509 V!52593)) (EmptyCell!16910) )
))
(declare-datatypes ((array!88111 0))(
  ( (array!88112 (arr!42536 (Array (_ BitVec 32) ValueCell!16910)) (size!43088 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88111)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314750 (= res!872845 (and (= (size!43088 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43087 _keys!1628) (size!43088 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314751 () Bool)

(declare-fun res!872843 () Bool)

(assert (=> b!1314751 (=> (not res!872843) (not e!749983))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1314751 (= res!872843 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43087 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314752 () Bool)

(assert (=> b!1314752 (= e!749983 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52593)

(declare-fun zeroValue!1296 () V!52593)

(declare-fun lt!585654 () Bool)

(declare-datatypes ((tuple2!23154 0))(
  ( (tuple2!23155 (_1!11588 (_ BitVec 64)) (_2!11588 V!52593)) )
))
(declare-datatypes ((List!30268 0))(
  ( (Nil!30265) (Cons!30264 (h!31473 tuple2!23154) (t!43866 List!30268)) )
))
(declare-datatypes ((ListLongMap!20811 0))(
  ( (ListLongMap!20812 (toList!10421 List!30268)) )
))
(declare-fun contains!8498 (ListLongMap!20811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5316 (array!88109 array!88111 (_ BitVec 32) (_ BitVec 32) V!52593 V!52593 (_ BitVec 32) Int) ListLongMap!20811)

(assert (=> b!1314752 (= lt!585654 (contains!8498 (getCurrentListMap!5316 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!55054 () Bool)

(declare-fun mapRes!55054 () Bool)

(assert (=> mapIsEmpty!55054 mapRes!55054))

(declare-fun mapNonEmpty!55054 () Bool)

(declare-fun tp!104983 () Bool)

(assert (=> mapNonEmpty!55054 (= mapRes!55054 (and tp!104983 e!749981))))

(declare-fun mapKey!55054 () (_ BitVec 32))

(declare-fun mapRest!55054 () (Array (_ BitVec 32) ValueCell!16910))

(declare-fun mapValue!55054 () ValueCell!16910)

(assert (=> mapNonEmpty!55054 (= (arr!42536 _values!1354) (store mapRest!55054 mapKey!55054 mapValue!55054))))

(declare-fun b!1314754 () Bool)

(declare-fun e!749982 () Bool)

(assert (=> b!1314754 (= e!749982 tp_is_empty!35617)))

(declare-fun b!1314755 () Bool)

(declare-fun e!749980 () Bool)

(assert (=> b!1314755 (= e!749980 (and e!749982 mapRes!55054))))

(declare-fun condMapEmpty!55054 () Bool)

(declare-fun mapDefault!55054 () ValueCell!16910)

(assert (=> b!1314755 (= condMapEmpty!55054 (= (arr!42536 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16910)) mapDefault!55054)))))

(declare-fun res!872842 () Bool)

(assert (=> start!111052 (=> (not res!872842) (not e!749983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111052 (= res!872842 (validMask!0 mask!2040))))

(assert (=> start!111052 e!749983))

(assert (=> start!111052 tp!104984))

(declare-fun array_inv!32313 (array!88109) Bool)

(assert (=> start!111052 (array_inv!32313 _keys!1628)))

(assert (=> start!111052 true))

(assert (=> start!111052 tp_is_empty!35617))

(declare-fun array_inv!32314 (array!88111) Bool)

(assert (=> start!111052 (and (array_inv!32314 _values!1354) e!749980)))

(declare-fun b!1314753 () Bool)

(declare-fun res!872844 () Bool)

(assert (=> b!1314753 (=> (not res!872844) (not e!749983))))

(declare-datatypes ((List!30269 0))(
  ( (Nil!30266) (Cons!30265 (h!31474 (_ BitVec 64)) (t!43867 List!30269)) )
))
(declare-fun arrayNoDuplicates!0 (array!88109 (_ BitVec 32) List!30269) Bool)

(assert (=> b!1314753 (= res!872844 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30266))))

(assert (= (and start!111052 res!872842) b!1314750))

(assert (= (and b!1314750 res!872845) b!1314749))

(assert (= (and b!1314749 res!872841) b!1314753))

(assert (= (and b!1314753 res!872844) b!1314751))

(assert (= (and b!1314751 res!872843) b!1314752))

(assert (= (and b!1314755 condMapEmpty!55054) mapIsEmpty!55054))

(assert (= (and b!1314755 (not condMapEmpty!55054)) mapNonEmpty!55054))

(get-info :version)

(assert (= (and mapNonEmpty!55054 ((_ is ValueCellFull!16910) mapValue!55054)) b!1314748))

(assert (= (and b!1314755 ((_ is ValueCellFull!16910) mapDefault!55054)) b!1314754))

(assert (= start!111052 b!1314755))

(declare-fun m!1202697 () Bool)

(assert (=> b!1314753 m!1202697))

(declare-fun m!1202699 () Bool)

(assert (=> mapNonEmpty!55054 m!1202699))

(declare-fun m!1202701 () Bool)

(assert (=> b!1314749 m!1202701))

(declare-fun m!1202703 () Bool)

(assert (=> b!1314752 m!1202703))

(assert (=> b!1314752 m!1202703))

(declare-fun m!1202705 () Bool)

(assert (=> b!1314752 m!1202705))

(declare-fun m!1202707 () Bool)

(assert (=> start!111052 m!1202707))

(declare-fun m!1202709 () Bool)

(assert (=> start!111052 m!1202709))

(declare-fun m!1202711 () Bool)

(assert (=> start!111052 m!1202711))

(check-sat (not b!1314753) (not mapNonEmpty!55054) tp_is_empty!35617 (not b!1314749) b_and!48077 (not b!1314752) (not start!111052) (not b_next!29887))
(check-sat b_and!48077 (not b_next!29887))
