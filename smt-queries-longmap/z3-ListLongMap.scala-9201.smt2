; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110778 () Bool)

(assert start!110778)

(declare-fun b_free!29389 () Bool)

(declare-fun b_next!29389 () Bool)

(assert (=> start!110778 (= b_free!29389 (not b_next!29389))))

(declare-fun tp!103488 () Bool)

(declare-fun b_and!47599 () Bool)

(assert (=> start!110778 (= tp!103488 b_and!47599)))

(declare-fun mapIsEmpty!54307 () Bool)

(declare-fun mapRes!54307 () Bool)

(assert (=> mapIsEmpty!54307 mapRes!54307))

(declare-fun b!1309106 () Bool)

(declare-fun res!868620 () Bool)

(declare-fun e!747125 () Bool)

(assert (=> b!1309106 (=> (not res!868620) (not e!747125))))

(declare-datatypes ((array!87297 0))(
  ( (array!87298 (arr!42124 (Array (_ BitVec 32) (_ BitVec 64))) (size!42675 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87297)

(declare-datatypes ((List!29901 0))(
  ( (Nil!29898) (Cons!29897 (h!31115 (_ BitVec 64)) (t!43499 List!29901)) )
))
(declare-fun arrayNoDuplicates!0 (array!87297 (_ BitVec 32) List!29901) Bool)

(assert (=> b!1309106 (= res!868620 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29898))))

(declare-fun b!1309107 () Bool)

(declare-fun res!868622 () Bool)

(assert (=> b!1309107 (=> (not res!868622) (not e!747125))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51929 0))(
  ( (V!51930 (val!17634 Int)) )
))
(declare-datatypes ((ValueCell!16661 0))(
  ( (ValueCellFull!16661 (v!20256 V!51929)) (EmptyCell!16661) )
))
(declare-datatypes ((array!87299 0))(
  ( (array!87300 (arr!42125 (Array (_ BitVec 32) ValueCell!16661)) (size!42676 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87299)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309107 (= res!868622 (and (= (size!42676 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42675 _keys!1628) (size!42676 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309108 () Bool)

(declare-fun res!868621 () Bool)

(assert (=> b!1309108 (=> (not res!868621) (not e!747125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87297 (_ BitVec 32)) Bool)

(assert (=> b!1309108 (= res!868621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309109 () Bool)

(declare-fun res!868618 () Bool)

(assert (=> b!1309109 (=> (not res!868618) (not e!747125))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309109 (= res!868618 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42675 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309110 () Bool)

(declare-fun e!747122 () Bool)

(declare-fun tp_is_empty!35119 () Bool)

(assert (=> b!1309110 (= e!747122 tp_is_empty!35119)))

(declare-fun res!868619 () Bool)

(assert (=> start!110778 (=> (not res!868619) (not e!747125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110778 (= res!868619 (validMask!0 mask!2040))))

(assert (=> start!110778 e!747125))

(assert (=> start!110778 tp!103488))

(declare-fun array_inv!32099 (array!87297) Bool)

(assert (=> start!110778 (array_inv!32099 _keys!1628)))

(assert (=> start!110778 true))

(assert (=> start!110778 tp_is_empty!35119))

(declare-fun e!747123 () Bool)

(declare-fun array_inv!32100 (array!87299) Bool)

(assert (=> start!110778 (and (array_inv!32100 _values!1354) e!747123)))

(declare-fun mapNonEmpty!54307 () Bool)

(declare-fun tp!103489 () Bool)

(assert (=> mapNonEmpty!54307 (= mapRes!54307 (and tp!103489 e!747122))))

(declare-fun mapValue!54307 () ValueCell!16661)

(declare-fun mapKey!54307 () (_ BitVec 32))

(declare-fun mapRest!54307 () (Array (_ BitVec 32) ValueCell!16661))

(assert (=> mapNonEmpty!54307 (= (arr!42125 _values!1354) (store mapRest!54307 mapKey!54307 mapValue!54307))))

(declare-fun b!1309111 () Bool)

(declare-fun e!747124 () Bool)

(assert (=> b!1309111 (= e!747123 (and e!747124 mapRes!54307))))

(declare-fun condMapEmpty!54307 () Bool)

(declare-fun mapDefault!54307 () ValueCell!16661)

(assert (=> b!1309111 (= condMapEmpty!54307 (= (arr!42125 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16661)) mapDefault!54307)))))

(declare-fun b!1309112 () Bool)

(assert (=> b!1309112 (= e!747124 tp_is_empty!35119)))

(declare-fun b!1309113 () Bool)

(assert (=> b!1309113 (= e!747125 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585578 () Bool)

(declare-fun minValue!1296 () V!51929)

(declare-fun zeroValue!1296 () V!51929)

(declare-datatypes ((tuple2!22736 0))(
  ( (tuple2!22737 (_1!11379 (_ BitVec 64)) (_2!11379 V!51929)) )
))
(declare-datatypes ((List!29902 0))(
  ( (Nil!29899) (Cons!29898 (h!31116 tuple2!22736) (t!43500 List!29902)) )
))
(declare-datatypes ((ListLongMap!20401 0))(
  ( (ListLongMap!20402 (toList!10216 List!29902)) )
))
(declare-fun contains!8378 (ListLongMap!20401 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5220 (array!87297 array!87299 (_ BitVec 32) (_ BitVec 32) V!51929 V!51929 (_ BitVec 32) Int) ListLongMap!20401)

(assert (=> b!1309113 (= lt!585578 (contains!8378 (getCurrentListMap!5220 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!110778 res!868619) b!1309107))

(assert (= (and b!1309107 res!868622) b!1309108))

(assert (= (and b!1309108 res!868621) b!1309106))

(assert (= (and b!1309106 res!868620) b!1309109))

(assert (= (and b!1309109 res!868618) b!1309113))

(assert (= (and b!1309111 condMapEmpty!54307) mapIsEmpty!54307))

(assert (= (and b!1309111 (not condMapEmpty!54307)) mapNonEmpty!54307))

(get-info :version)

(assert (= (and mapNonEmpty!54307 ((_ is ValueCellFull!16661) mapValue!54307)) b!1309110))

(assert (= (and b!1309111 ((_ is ValueCellFull!16661) mapDefault!54307)) b!1309112))

(assert (= start!110778 b!1309111))

(declare-fun m!1199975 () Bool)

(assert (=> b!1309113 m!1199975))

(assert (=> b!1309113 m!1199975))

(declare-fun m!1199977 () Bool)

(assert (=> b!1309113 m!1199977))

(declare-fun m!1199979 () Bool)

(assert (=> mapNonEmpty!54307 m!1199979))

(declare-fun m!1199981 () Bool)

(assert (=> start!110778 m!1199981))

(declare-fun m!1199983 () Bool)

(assert (=> start!110778 m!1199983))

(declare-fun m!1199985 () Bool)

(assert (=> start!110778 m!1199985))

(declare-fun m!1199987 () Bool)

(assert (=> b!1309108 m!1199987))

(declare-fun m!1199989 () Bool)

(assert (=> b!1309106 m!1199989))

(check-sat (not mapNonEmpty!54307) tp_is_empty!35119 b_and!47599 (not b!1309106) (not start!110778) (not b_next!29389) (not b!1309108) (not b!1309113))
(check-sat b_and!47599 (not b_next!29389))
