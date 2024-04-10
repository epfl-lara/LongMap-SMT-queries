; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110892 () Bool)

(assert start!110892)

(declare-fun b_free!29727 () Bool)

(declare-fun b_next!29727 () Bool)

(assert (=> start!110892 (= b_free!29727 (not b_next!29727))))

(declare-fun tp!104503 () Bool)

(declare-fun b_and!47935 () Bool)

(assert (=> start!110892 (= tp!104503 b_and!47935)))

(declare-fun mapNonEmpty!54814 () Bool)

(declare-fun mapRes!54814 () Bool)

(declare-fun tp!104502 () Bool)

(declare-fun e!748813 () Bool)

(assert (=> mapNonEmpty!54814 (= mapRes!54814 (and tp!104502 e!748813))))

(declare-datatypes ((V!52379 0))(
  ( (V!52380 (val!17803 Int)) )
))
(declare-datatypes ((ValueCell!16830 0))(
  ( (ValueCellFull!16830 (v!20430 V!52379)) (EmptyCell!16830) )
))
(declare-fun mapValue!54814 () ValueCell!16830)

(declare-fun mapRest!54814 () (Array (_ BitVec 32) ValueCell!16830))

(declare-datatypes ((array!87896 0))(
  ( (array!87897 (arr!42428 (Array (_ BitVec 32) ValueCell!16830)) (size!42978 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87896)

(declare-fun mapKey!54814 () (_ BitVec 32))

(assert (=> mapNonEmpty!54814 (= (arr!42428 _values!1354) (store mapRest!54814 mapKey!54814 mapValue!54814))))

(declare-fun res!871608 () Bool)

(declare-fun e!748815 () Bool)

(assert (=> start!110892 (=> (not res!871608) (not e!748815))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110892 (= res!871608 (validMask!0 mask!2040))))

(assert (=> start!110892 e!748815))

(assert (=> start!110892 tp!104503))

(declare-datatypes ((array!87898 0))(
  ( (array!87899 (arr!42429 (Array (_ BitVec 32) (_ BitVec 64))) (size!42979 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87898)

(declare-fun array_inv!32053 (array!87898) Bool)

(assert (=> start!110892 (array_inv!32053 _keys!1628)))

(assert (=> start!110892 true))

(declare-fun tp_is_empty!35457 () Bool)

(assert (=> start!110892 tp_is_empty!35457))

(declare-fun e!748816 () Bool)

(declare-fun array_inv!32054 (array!87896) Bool)

(assert (=> start!110892 (and (array_inv!32054 _values!1354) e!748816)))

(declare-fun mapIsEmpty!54814 () Bool)

(assert (=> mapIsEmpty!54814 mapRes!54814))

(declare-fun b!1312835 () Bool)

(declare-fun res!871611 () Bool)

(assert (=> b!1312835 (=> (not res!871611) (not e!748815))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312835 (= res!871611 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42979 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312836 () Bool)

(declare-fun res!871609 () Bool)

(assert (=> b!1312836 (=> (not res!871609) (not e!748815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87898 (_ BitVec 32)) Bool)

(assert (=> b!1312836 (= res!871609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312837 () Bool)

(assert (=> b!1312837 (= e!748815 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52379)

(declare-fun lt!585609 () Bool)

(declare-fun zeroValue!1296 () V!52379)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22948 0))(
  ( (tuple2!22949 (_1!11485 (_ BitVec 64)) (_2!11485 V!52379)) )
))
(declare-datatypes ((List!30086 0))(
  ( (Nil!30083) (Cons!30082 (h!31291 tuple2!22948) (t!43692 List!30086)) )
))
(declare-datatypes ((ListLongMap!20605 0))(
  ( (ListLongMap!20606 (toList!10318 List!30086)) )
))
(declare-fun contains!8468 (ListLongMap!20605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5331 (array!87898 array!87896 (_ BitVec 32) (_ BitVec 32) V!52379 V!52379 (_ BitVec 32) Int) ListLongMap!20605)

(assert (=> b!1312837 (= lt!585609 (contains!8468 (getCurrentListMap!5331 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312838 () Bool)

(declare-fun e!748817 () Bool)

(assert (=> b!1312838 (= e!748817 tp_is_empty!35457)))

(declare-fun b!1312839 () Bool)

(declare-fun res!871607 () Bool)

(assert (=> b!1312839 (=> (not res!871607) (not e!748815))))

(assert (=> b!1312839 (= res!871607 (and (= (size!42978 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42979 _keys!1628) (size!42978 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312840 () Bool)

(assert (=> b!1312840 (= e!748813 tp_is_empty!35457)))

(declare-fun b!1312841 () Bool)

(declare-fun res!871610 () Bool)

(assert (=> b!1312841 (=> (not res!871610) (not e!748815))))

(declare-datatypes ((List!30087 0))(
  ( (Nil!30084) (Cons!30083 (h!31292 (_ BitVec 64)) (t!43693 List!30087)) )
))
(declare-fun arrayNoDuplicates!0 (array!87898 (_ BitVec 32) List!30087) Bool)

(assert (=> b!1312841 (= res!871610 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30084))))

(declare-fun b!1312842 () Bool)

(assert (=> b!1312842 (= e!748816 (and e!748817 mapRes!54814))))

(declare-fun condMapEmpty!54814 () Bool)

(declare-fun mapDefault!54814 () ValueCell!16830)

(assert (=> b!1312842 (= condMapEmpty!54814 (= (arr!42428 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16830)) mapDefault!54814)))))

(assert (= (and start!110892 res!871608) b!1312839))

(assert (= (and b!1312839 res!871607) b!1312836))

(assert (= (and b!1312836 res!871609) b!1312841))

(assert (= (and b!1312841 res!871610) b!1312835))

(assert (= (and b!1312835 res!871611) b!1312837))

(assert (= (and b!1312842 condMapEmpty!54814) mapIsEmpty!54814))

(assert (= (and b!1312842 (not condMapEmpty!54814)) mapNonEmpty!54814))

(get-info :version)

(assert (= (and mapNonEmpty!54814 ((_ is ValueCellFull!16830) mapValue!54814)) b!1312840))

(assert (= (and b!1312842 ((_ is ValueCellFull!16830) mapDefault!54814)) b!1312838))

(assert (= start!110892 b!1312842))

(declare-fun m!1201891 () Bool)

(assert (=> b!1312836 m!1201891))

(declare-fun m!1201893 () Bool)

(assert (=> b!1312841 m!1201893))

(declare-fun m!1201895 () Bool)

(assert (=> mapNonEmpty!54814 m!1201895))

(declare-fun m!1201897 () Bool)

(assert (=> start!110892 m!1201897))

(declare-fun m!1201899 () Bool)

(assert (=> start!110892 m!1201899))

(declare-fun m!1201901 () Bool)

(assert (=> start!110892 m!1201901))

(declare-fun m!1201903 () Bool)

(assert (=> b!1312837 m!1201903))

(assert (=> b!1312837 m!1201903))

(declare-fun m!1201905 () Bool)

(assert (=> b!1312837 m!1201905))

(check-sat (not start!110892) (not b_next!29727) b_and!47935 (not b!1312837) (not mapNonEmpty!54814) (not b!1312841) (not b!1312836) tp_is_empty!35457)
(check-sat b_and!47935 (not b_next!29727))
