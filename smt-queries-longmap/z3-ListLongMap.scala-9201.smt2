; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110554 () Bool)

(assert start!110554)

(declare-fun b_free!29389 () Bool)

(declare-fun b_next!29389 () Bool)

(assert (=> start!110554 (= b_free!29389 (not b_next!29389))))

(declare-fun tp!103489 () Bool)

(declare-fun b_and!47579 () Bool)

(assert (=> start!110554 (= tp!103489 b_and!47579)))

(declare-fun b!1307737 () Bool)

(declare-fun e!746248 () Bool)

(assert (=> b!1307737 (= e!746248 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87153 0))(
  ( (array!87154 (arr!42057 (Array (_ BitVec 32) (_ BitVec 64))) (size!42609 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87153)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!51929 0))(
  ( (V!51930 (val!17634 Int)) )
))
(declare-fun minValue!1296 () V!51929)

(declare-datatypes ((ValueCell!16661 0))(
  ( (ValueCellFull!16661 (v!20260 V!51929)) (EmptyCell!16661) )
))
(declare-datatypes ((array!87155 0))(
  ( (array!87156 (arr!42058 (Array (_ BitVec 32) ValueCell!16661)) (size!42610 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87155)

(declare-fun zeroValue!1296 () V!51929)

(declare-fun lt!584916 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22784 0))(
  ( (tuple2!22785 (_1!11403 (_ BitVec 64)) (_2!11403 V!51929)) )
))
(declare-datatypes ((List!29911 0))(
  ( (Nil!29908) (Cons!29907 (h!31116 tuple2!22784) (t!43509 List!29911)) )
))
(declare-datatypes ((ListLongMap!20441 0))(
  ( (ListLongMap!20442 (toList!10236 List!29911)) )
))
(declare-fun contains!8313 (ListLongMap!20441 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5131 (array!87153 array!87155 (_ BitVec 32) (_ BitVec 32) V!51929 V!51929 (_ BitVec 32) Int) ListLongMap!20441)

(assert (=> b!1307737 (= lt!584916 (contains!8313 (getCurrentListMap!5131 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307738 () Bool)

(declare-fun res!868072 () Bool)

(assert (=> b!1307738 (=> (not res!868072) (not e!746248))))

(declare-datatypes ((List!29912 0))(
  ( (Nil!29909) (Cons!29908 (h!31117 (_ BitVec 64)) (t!43510 List!29912)) )
))
(declare-fun arrayNoDuplicates!0 (array!87153 (_ BitVec 32) List!29912) Bool)

(assert (=> b!1307738 (= res!868072 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29909))))

(declare-fun res!868075 () Bool)

(assert (=> start!110554 (=> (not res!868075) (not e!746248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110554 (= res!868075 (validMask!0 mask!2040))))

(assert (=> start!110554 e!746248))

(assert (=> start!110554 tp!103489))

(declare-fun array_inv!31987 (array!87153) Bool)

(assert (=> start!110554 (array_inv!31987 _keys!1628)))

(assert (=> start!110554 true))

(declare-fun tp_is_empty!35119 () Bool)

(assert (=> start!110554 tp_is_empty!35119))

(declare-fun e!746249 () Bool)

(declare-fun array_inv!31988 (array!87155) Bool)

(assert (=> start!110554 (and (array_inv!31988 _values!1354) e!746249)))

(declare-fun b!1307739 () Bool)

(declare-fun res!868074 () Bool)

(assert (=> b!1307739 (=> (not res!868074) (not e!746248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87153 (_ BitVec 32)) Bool)

(assert (=> b!1307739 (= res!868074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54307 () Bool)

(declare-fun mapRes!54307 () Bool)

(declare-fun tp!103490 () Bool)

(declare-fun e!746246 () Bool)

(assert (=> mapNonEmpty!54307 (= mapRes!54307 (and tp!103490 e!746246))))

(declare-fun mapKey!54307 () (_ BitVec 32))

(declare-fun mapValue!54307 () ValueCell!16661)

(declare-fun mapRest!54307 () (Array (_ BitVec 32) ValueCell!16661))

(assert (=> mapNonEmpty!54307 (= (arr!42058 _values!1354) (store mapRest!54307 mapKey!54307 mapValue!54307))))

(declare-fun b!1307740 () Bool)

(assert (=> b!1307740 (= e!746246 tp_is_empty!35119)))

(declare-fun b!1307741 () Bool)

(declare-fun e!746245 () Bool)

(assert (=> b!1307741 (= e!746245 tp_is_empty!35119)))

(declare-fun b!1307742 () Bool)

(declare-fun res!868071 () Bool)

(assert (=> b!1307742 (=> (not res!868071) (not e!746248))))

(assert (=> b!1307742 (= res!868071 (and (= (size!42610 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42609 _keys!1628) (size!42610 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307743 () Bool)

(declare-fun res!868073 () Bool)

(assert (=> b!1307743 (=> (not res!868073) (not e!746248))))

(assert (=> b!1307743 (= res!868073 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42609 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307744 () Bool)

(assert (=> b!1307744 (= e!746249 (and e!746245 mapRes!54307))))

(declare-fun condMapEmpty!54307 () Bool)

(declare-fun mapDefault!54307 () ValueCell!16661)

(assert (=> b!1307744 (= condMapEmpty!54307 (= (arr!42058 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16661)) mapDefault!54307)))))

(declare-fun mapIsEmpty!54307 () Bool)

(assert (=> mapIsEmpty!54307 mapRes!54307))

(assert (= (and start!110554 res!868075) b!1307742))

(assert (= (and b!1307742 res!868071) b!1307739))

(assert (= (and b!1307739 res!868074) b!1307738))

(assert (= (and b!1307738 res!868072) b!1307743))

(assert (= (and b!1307743 res!868073) b!1307737))

(assert (= (and b!1307744 condMapEmpty!54307) mapIsEmpty!54307))

(assert (= (and b!1307744 (not condMapEmpty!54307)) mapNonEmpty!54307))

(get-info :version)

(assert (= (and mapNonEmpty!54307 ((_ is ValueCellFull!16661) mapValue!54307)) b!1307740))

(assert (= (and b!1307744 ((_ is ValueCellFull!16661) mapDefault!54307)) b!1307741))

(assert (= start!110554 b!1307744))

(declare-fun m!1197861 () Bool)

(assert (=> b!1307737 m!1197861))

(assert (=> b!1307737 m!1197861))

(declare-fun m!1197863 () Bool)

(assert (=> b!1307737 m!1197863))

(declare-fun m!1197865 () Bool)

(assert (=> b!1307739 m!1197865))

(declare-fun m!1197867 () Bool)

(assert (=> b!1307738 m!1197867))

(declare-fun m!1197869 () Bool)

(assert (=> mapNonEmpty!54307 m!1197869))

(declare-fun m!1197871 () Bool)

(assert (=> start!110554 m!1197871))

(declare-fun m!1197873 () Bool)

(assert (=> start!110554 m!1197873))

(declare-fun m!1197875 () Bool)

(assert (=> start!110554 m!1197875))

(check-sat b_and!47579 tp_is_empty!35119 (not mapNonEmpty!54307) (not b!1307739) (not b_next!29389) (not start!110554) (not b!1307737) (not b!1307738))
(check-sat b_and!47579 (not b_next!29389))
