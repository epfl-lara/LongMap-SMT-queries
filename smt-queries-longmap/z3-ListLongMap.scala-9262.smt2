; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110920 () Bool)

(assert start!110920)

(declare-fun b_free!29755 () Bool)

(declare-fun b_next!29755 () Bool)

(assert (=> start!110920 (= b_free!29755 (not b_next!29755))))

(declare-fun tp!104588 () Bool)

(declare-fun b_and!47945 () Bool)

(assert (=> start!110920 (= tp!104588 b_and!47945)))

(declare-fun mapIsEmpty!54856 () Bool)

(declare-fun mapRes!54856 () Bool)

(assert (=> mapIsEmpty!54856 mapRes!54856))

(declare-fun b!1313128 () Bool)

(declare-fun e!748990 () Bool)

(declare-fun e!748992 () Bool)

(assert (=> b!1313128 (= e!748990 (and e!748992 mapRes!54856))))

(declare-fun condMapEmpty!54856 () Bool)

(declare-datatypes ((V!52417 0))(
  ( (V!52418 (val!17817 Int)) )
))
(declare-datatypes ((ValueCell!16844 0))(
  ( (ValueCellFull!16844 (v!20443 V!52417)) (EmptyCell!16844) )
))
(declare-datatypes ((array!87853 0))(
  ( (array!87854 (arr!42407 (Array (_ BitVec 32) ValueCell!16844)) (size!42959 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87853)

(declare-fun mapDefault!54856 () ValueCell!16844)

(assert (=> b!1313128 (= condMapEmpty!54856 (= (arr!42407 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16844)) mapDefault!54856)))))

(declare-fun b!1313129 () Bool)

(declare-fun res!871819 () Bool)

(declare-fun e!748993 () Bool)

(assert (=> b!1313129 (=> (not res!871819) (not e!748993))))

(declare-datatypes ((array!87855 0))(
  ( (array!87856 (arr!42408 (Array (_ BitVec 32) (_ BitVec 64))) (size!42960 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87855)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87855 (_ BitVec 32)) Bool)

(assert (=> b!1313129 (= res!871819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313130 () Bool)

(declare-fun res!871818 () Bool)

(assert (=> b!1313130 (=> (not res!871818) (not e!748993))))

(declare-datatypes ((List!30176 0))(
  ( (Nil!30173) (Cons!30172 (h!31381 (_ BitVec 64)) (t!43774 List!30176)) )
))
(declare-fun arrayNoDuplicates!0 (array!87855 (_ BitVec 32) List!30176) Bool)

(assert (=> b!1313130 (= res!871818 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30173))))

(declare-fun b!1313131 () Bool)

(declare-fun res!871816 () Bool)

(assert (=> b!1313131 (=> (not res!871816) (not e!748993))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313131 (= res!871816 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42960 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313132 () Bool)

(declare-fun e!748991 () Bool)

(declare-fun tp_is_empty!35485 () Bool)

(assert (=> b!1313132 (= e!748991 tp_is_empty!35485)))

(declare-fun res!871815 () Bool)

(assert (=> start!110920 (=> (not res!871815) (not e!748993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110920 (= res!871815 (validMask!0 mask!2040))))

(assert (=> start!110920 e!748993))

(assert (=> start!110920 tp!104588))

(declare-fun array_inv!32225 (array!87855) Bool)

(assert (=> start!110920 (array_inv!32225 _keys!1628)))

(assert (=> start!110920 true))

(assert (=> start!110920 tp_is_empty!35485))

(declare-fun array_inv!32226 (array!87853) Bool)

(assert (=> start!110920 (and (array_inv!32226 _values!1354) e!748990)))

(declare-fun mapNonEmpty!54856 () Bool)

(declare-fun tp!104587 () Bool)

(assert (=> mapNonEmpty!54856 (= mapRes!54856 (and tp!104587 e!748991))))

(declare-fun mapRest!54856 () (Array (_ BitVec 32) ValueCell!16844))

(declare-fun mapValue!54856 () ValueCell!16844)

(declare-fun mapKey!54856 () (_ BitVec 32))

(assert (=> mapNonEmpty!54856 (= (arr!42407 _values!1354) (store mapRest!54856 mapKey!54856 mapValue!54856))))

(declare-fun b!1313133 () Bool)

(declare-fun res!871817 () Bool)

(assert (=> b!1313133 (=> (not res!871817) (not e!748993))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313133 (= res!871817 (and (= (size!42959 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42960 _keys!1628) (size!42959 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313134 () Bool)

(assert (=> b!1313134 (= e!748993 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52417)

(declare-fun zeroValue!1296 () V!52417)

(declare-fun lt!585456 () Bool)

(declare-datatypes ((tuple2!23056 0))(
  ( (tuple2!23057 (_1!11539 (_ BitVec 64)) (_2!11539 V!52417)) )
))
(declare-datatypes ((List!30177 0))(
  ( (Nil!30174) (Cons!30173 (h!31382 tuple2!23056) (t!43775 List!30177)) )
))
(declare-datatypes ((ListLongMap!20713 0))(
  ( (ListLongMap!20714 (toList!10372 List!30177)) )
))
(declare-fun contains!8449 (ListLongMap!20713 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5267 (array!87855 array!87853 (_ BitVec 32) (_ BitVec 32) V!52417 V!52417 (_ BitVec 32) Int) ListLongMap!20713)

(assert (=> b!1313134 (= lt!585456 (contains!8449 (getCurrentListMap!5267 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313135 () Bool)

(assert (=> b!1313135 (= e!748992 tp_is_empty!35485)))

(assert (= (and start!110920 res!871815) b!1313133))

(assert (= (and b!1313133 res!871817) b!1313129))

(assert (= (and b!1313129 res!871819) b!1313130))

(assert (= (and b!1313130 res!871818) b!1313131))

(assert (= (and b!1313131 res!871816) b!1313134))

(assert (= (and b!1313128 condMapEmpty!54856) mapIsEmpty!54856))

(assert (= (and b!1313128 (not condMapEmpty!54856)) mapNonEmpty!54856))

(get-info :version)

(assert (= (and mapNonEmpty!54856 ((_ is ValueCellFull!16844) mapValue!54856)) b!1313132))

(assert (= (and b!1313128 ((_ is ValueCellFull!16844) mapDefault!54856)) b!1313135))

(assert (= start!110920 b!1313128))

(declare-fun m!1201611 () Bool)

(assert (=> mapNonEmpty!54856 m!1201611))

(declare-fun m!1201613 () Bool)

(assert (=> b!1313130 m!1201613))

(declare-fun m!1201615 () Bool)

(assert (=> start!110920 m!1201615))

(declare-fun m!1201617 () Bool)

(assert (=> start!110920 m!1201617))

(declare-fun m!1201619 () Bool)

(assert (=> start!110920 m!1201619))

(declare-fun m!1201621 () Bool)

(assert (=> b!1313129 m!1201621))

(declare-fun m!1201623 () Bool)

(assert (=> b!1313134 m!1201623))

(assert (=> b!1313134 m!1201623))

(declare-fun m!1201625 () Bool)

(assert (=> b!1313134 m!1201625))

(check-sat (not b!1313129) b_and!47945 (not mapNonEmpty!54856) (not start!110920) tp_is_empty!35485 (not b!1313130) (not b!1313134) (not b_next!29755))
(check-sat b_and!47945 (not b_next!29755))
