; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111048 () Bool)

(assert start!111048)

(declare-fun b_free!29659 () Bool)

(declare-fun b_next!29659 () Bool)

(assert (=> start!111048 (= b_free!29659 (not b_next!29659))))

(declare-fun tp!104298 () Bool)

(declare-fun b_and!47869 () Bool)

(assert (=> start!111048 (= tp!104298 b_and!47869)))

(declare-fun b!1313074 () Bool)

(declare-fun res!871378 () Bool)

(declare-fun e!749148 () Bool)

(assert (=> b!1313074 (=> (not res!871378) (not e!749148))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313074 (= res!871378 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1313075 () Bool)

(declare-fun res!871375 () Bool)

(assert (=> b!1313075 (=> (not res!871375) (not e!749148))))

(declare-datatypes ((array!87815 0))(
  ( (array!87816 (arr!42383 (Array (_ BitVec 32) (_ BitVec 64))) (size!42934 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87815)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52289 0))(
  ( (V!52290 (val!17769 Int)) )
))
(declare-datatypes ((ValueCell!16796 0))(
  ( (ValueCellFull!16796 (v!20391 V!52289)) (EmptyCell!16796) )
))
(declare-datatypes ((array!87817 0))(
  ( (array!87818 (arr!42384 (Array (_ BitVec 32) ValueCell!16796)) (size!42935 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87817)

(assert (=> b!1313075 (= res!871375 (and (= (size!42935 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42934 _keys!1628) (size!42935 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313076 () Bool)

(declare-fun e!749150 () Bool)

(declare-fun tp_is_empty!35389 () Bool)

(assert (=> b!1313076 (= e!749150 tp_is_empty!35389)))

(declare-fun res!871371 () Bool)

(assert (=> start!111048 (=> (not res!871371) (not e!749148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111048 (= res!871371 (validMask!0 mask!2040))))

(assert (=> start!111048 e!749148))

(assert (=> start!111048 tp!104298))

(declare-fun array_inv!32287 (array!87815) Bool)

(assert (=> start!111048 (array_inv!32287 _keys!1628)))

(assert (=> start!111048 true))

(assert (=> start!111048 tp_is_empty!35389))

(declare-fun e!749146 () Bool)

(declare-fun array_inv!32288 (array!87817) Bool)

(assert (=> start!111048 (and (array_inv!32288 _values!1354) e!749146)))

(declare-fun b!1313077 () Bool)

(assert (=> b!1313077 (= e!749148 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52289)

(declare-fun zeroValue!1296 () V!52289)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22934 0))(
  ( (tuple2!22935 (_1!11478 (_ BitVec 64)) (_2!11478 V!52289)) )
))
(declare-datatypes ((List!30088 0))(
  ( (Nil!30085) (Cons!30084 (h!31302 tuple2!22934) (t!43686 List!30088)) )
))
(declare-datatypes ((ListLongMap!20599 0))(
  ( (ListLongMap!20600 (toList!10315 List!30088)) )
))
(declare-fun contains!8477 (ListLongMap!20599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5319 (array!87815 array!87817 (_ BitVec 32) (_ BitVec 32) V!52289 V!52289 (_ BitVec 32) Int) ListLongMap!20599)

(assert (=> b!1313077 (contains!8477 (getCurrentListMap!5319 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43329 0))(
  ( (Unit!43330) )
))
(declare-fun lt!585983 () Unit!43329)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!5 (array!87815 array!87817 (_ BitVec 32) (_ BitVec 32) V!52289 V!52289 (_ BitVec 64) (_ BitVec 32) Int) Unit!43329)

(assert (=> b!1313077 (= lt!585983 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!5 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1313078 () Bool)

(declare-fun res!871372 () Bool)

(assert (=> b!1313078 (=> (not res!871372) (not e!749148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87815 (_ BitVec 32)) Bool)

(assert (=> b!1313078 (= res!871372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313079 () Bool)

(declare-fun res!871377 () Bool)

(assert (=> b!1313079 (=> (not res!871377) (not e!749148))))

(assert (=> b!1313079 (= res!871377 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42934 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313080 () Bool)

(declare-fun res!871374 () Bool)

(assert (=> b!1313080 (=> (not res!871374) (not e!749148))))

(assert (=> b!1313080 (= res!871374 (contains!8477 (getCurrentListMap!5319 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapNonEmpty!54712 () Bool)

(declare-fun mapRes!54712 () Bool)

(declare-fun tp!104299 () Bool)

(declare-fun e!749149 () Bool)

(assert (=> mapNonEmpty!54712 (= mapRes!54712 (and tp!104299 e!749149))))

(declare-fun mapKey!54712 () (_ BitVec 32))

(declare-fun mapRest!54712 () (Array (_ BitVec 32) ValueCell!16796))

(declare-fun mapValue!54712 () ValueCell!16796)

(assert (=> mapNonEmpty!54712 (= (arr!42384 _values!1354) (store mapRest!54712 mapKey!54712 mapValue!54712))))

(declare-fun b!1313081 () Bool)

(declare-fun res!871373 () Bool)

(assert (=> b!1313081 (=> (not res!871373) (not e!749148))))

(assert (=> b!1313081 (= res!871373 (not (= (select (arr!42383 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1313082 () Bool)

(assert (=> b!1313082 (= e!749146 (and e!749150 mapRes!54712))))

(declare-fun condMapEmpty!54712 () Bool)

(declare-fun mapDefault!54712 () ValueCell!16796)

(assert (=> b!1313082 (= condMapEmpty!54712 (= (arr!42384 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16796)) mapDefault!54712)))))

(declare-fun b!1313083 () Bool)

(assert (=> b!1313083 (= e!749149 tp_is_empty!35389)))

(declare-fun b!1313084 () Bool)

(declare-fun res!871379 () Bool)

(assert (=> b!1313084 (=> (not res!871379) (not e!749148))))

(declare-datatypes ((List!30089 0))(
  ( (Nil!30086) (Cons!30085 (h!31303 (_ BitVec 64)) (t!43687 List!30089)) )
))
(declare-fun arrayNoDuplicates!0 (array!87815 (_ BitVec 32) List!30089) Bool)

(assert (=> b!1313084 (= res!871379 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30086))))

(declare-fun b!1313085 () Bool)

(declare-fun res!871376 () Bool)

(assert (=> b!1313085 (=> (not res!871376) (not e!749148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313085 (= res!871376 (validKeyInArray!0 (select (arr!42383 _keys!1628) from!2020)))))

(declare-fun mapIsEmpty!54712 () Bool)

(assert (=> mapIsEmpty!54712 mapRes!54712))

(assert (= (and start!111048 res!871371) b!1313075))

(assert (= (and b!1313075 res!871375) b!1313078))

(assert (= (and b!1313078 res!871372) b!1313084))

(assert (= (and b!1313084 res!871379) b!1313079))

(assert (= (and b!1313079 res!871377) b!1313080))

(assert (= (and b!1313080 res!871374) b!1313081))

(assert (= (and b!1313081 res!871373) b!1313085))

(assert (= (and b!1313085 res!871376) b!1313074))

(assert (= (and b!1313074 res!871378) b!1313077))

(assert (= (and b!1313082 condMapEmpty!54712) mapIsEmpty!54712))

(assert (= (and b!1313082 (not condMapEmpty!54712)) mapNonEmpty!54712))

(get-info :version)

(assert (= (and mapNonEmpty!54712 ((_ is ValueCellFull!16796) mapValue!54712)) b!1313083))

(assert (= (and b!1313082 ((_ is ValueCellFull!16796) mapDefault!54712)) b!1313076))

(assert (= start!111048 b!1313082))

(declare-fun m!1202735 () Bool)

(assert (=> b!1313085 m!1202735))

(assert (=> b!1313085 m!1202735))

(declare-fun m!1202737 () Bool)

(assert (=> b!1313085 m!1202737))

(declare-fun m!1202739 () Bool)

(assert (=> mapNonEmpty!54712 m!1202739))

(declare-fun m!1202741 () Bool)

(assert (=> b!1313077 m!1202741))

(assert (=> b!1313077 m!1202741))

(declare-fun m!1202743 () Bool)

(assert (=> b!1313077 m!1202743))

(declare-fun m!1202745 () Bool)

(assert (=> b!1313077 m!1202745))

(declare-fun m!1202747 () Bool)

(assert (=> b!1313084 m!1202747))

(assert (=> b!1313081 m!1202735))

(declare-fun m!1202749 () Bool)

(assert (=> start!111048 m!1202749))

(declare-fun m!1202751 () Bool)

(assert (=> start!111048 m!1202751))

(declare-fun m!1202753 () Bool)

(assert (=> start!111048 m!1202753))

(declare-fun m!1202755 () Bool)

(assert (=> b!1313078 m!1202755))

(declare-fun m!1202757 () Bool)

(assert (=> b!1313080 m!1202757))

(assert (=> b!1313080 m!1202757))

(declare-fun m!1202759 () Bool)

(assert (=> b!1313080 m!1202759))

(check-sat (not b!1313077) (not start!111048) b_and!47869 (not b!1313078) (not b_next!29659) (not b!1313084) (not b!1313085) tp_is_empty!35389 (not mapNonEmpty!54712) (not b!1313080))
(check-sat b_and!47869 (not b_next!29659))
