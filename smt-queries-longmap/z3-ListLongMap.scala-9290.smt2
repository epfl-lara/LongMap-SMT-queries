; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111312 () Bool)

(assert start!111312)

(declare-fun b_free!29923 () Bool)

(declare-fun b_next!29923 () Bool)

(assert (=> start!111312 (= b_free!29923 (not b_next!29923))))

(declare-fun tp!105091 () Bool)

(declare-fun b_and!48133 () Bool)

(assert (=> start!111312 (= tp!105091 b_and!48133)))

(declare-fun b!1316585 () Bool)

(declare-fun res!873698 () Bool)

(declare-fun e!751130 () Bool)

(assert (=> b!1316585 (=> (not res!873698) (not e!751130))))

(declare-datatypes ((array!88327 0))(
  ( (array!88328 (arr!42639 (Array (_ BitVec 32) (_ BitVec 64))) (size!43190 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88327)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88327 (_ BitVec 32)) Bool)

(assert (=> b!1316585 (= res!873698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316586 () Bool)

(declare-fun e!751127 () Bool)

(declare-fun tp_is_empty!35653 () Bool)

(assert (=> b!1316586 (= e!751127 tp_is_empty!35653)))

(declare-fun b!1316587 () Bool)

(declare-fun e!751126 () Bool)

(assert (=> b!1316587 (= e!751126 tp_is_empty!35653)))

(declare-fun b!1316588 () Bool)

(declare-fun res!873696 () Bool)

(assert (=> b!1316588 (=> (not res!873696) (not e!751130))))

(declare-datatypes ((List!30260 0))(
  ( (Nil!30257) (Cons!30256 (h!31474 (_ BitVec 64)) (t!43858 List!30260)) )
))
(declare-fun arrayNoDuplicates!0 (array!88327 (_ BitVec 32) List!30260) Bool)

(assert (=> b!1316588 (= res!873696 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30257))))

(declare-fun b!1316589 () Bool)

(declare-fun e!751129 () Bool)

(declare-fun mapRes!55108 () Bool)

(assert (=> b!1316589 (= e!751129 (and e!751126 mapRes!55108))))

(declare-fun condMapEmpty!55108 () Bool)

(declare-datatypes ((V!52641 0))(
  ( (V!52642 (val!17901 Int)) )
))
(declare-datatypes ((ValueCell!16928 0))(
  ( (ValueCellFull!16928 (v!20523 V!52641)) (EmptyCell!16928) )
))
(declare-datatypes ((array!88329 0))(
  ( (array!88330 (arr!42640 (Array (_ BitVec 32) ValueCell!16928)) (size!43191 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88329)

(declare-fun mapDefault!55108 () ValueCell!16928)

(assert (=> b!1316589 (= condMapEmpty!55108 (= (arr!42640 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16928)) mapDefault!55108)))))

(declare-fun mapNonEmpty!55108 () Bool)

(declare-fun tp!105090 () Bool)

(assert (=> mapNonEmpty!55108 (= mapRes!55108 (and tp!105090 e!751127))))

(declare-fun mapRest!55108 () (Array (_ BitVec 32) ValueCell!16928))

(declare-fun mapValue!55108 () ValueCell!16928)

(declare-fun mapKey!55108 () (_ BitVec 32))

(assert (=> mapNonEmpty!55108 (= (arr!42640 _values!1354) (store mapRest!55108 mapKey!55108 mapValue!55108))))

(declare-fun res!873694 () Bool)

(assert (=> start!111312 (=> (not res!873694) (not e!751130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111312 (= res!873694 (validMask!0 mask!2040))))

(assert (=> start!111312 e!751130))

(assert (=> start!111312 tp!105091))

(declare-fun array_inv!32471 (array!88327) Bool)

(assert (=> start!111312 (array_inv!32471 _keys!1628)))

(assert (=> start!111312 true))

(assert (=> start!111312 tp_is_empty!35653))

(declare-fun array_inv!32472 (array!88329) Bool)

(assert (=> start!111312 (and (array_inv!32472 _values!1354) e!751129)))

(declare-fun b!1316590 () Bool)

(declare-fun res!873695 () Bool)

(assert (=> b!1316590 (=> (not res!873695) (not e!751130))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316590 (= res!873695 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43190 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316591 () Bool)

(declare-fun res!873697 () Bool)

(assert (=> b!1316591 (=> (not res!873697) (not e!751130))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316591 (= res!873697 (and (= (size!43191 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43190 _keys!1628) (size!43191 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55108 () Bool)

(assert (=> mapIsEmpty!55108 mapRes!55108))

(declare-fun b!1316592 () Bool)

(assert (=> b!1316592 (= e!751130 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586370 () Bool)

(declare-fun minValue!1296 () V!52641)

(declare-fun zeroValue!1296 () V!52641)

(declare-datatypes ((tuple2!23114 0))(
  ( (tuple2!23115 (_1!11568 (_ BitVec 64)) (_2!11568 V!52641)) )
))
(declare-datatypes ((List!30261 0))(
  ( (Nil!30258) (Cons!30257 (h!31475 tuple2!23114) (t!43859 List!30261)) )
))
(declare-datatypes ((ListLongMap!20779 0))(
  ( (ListLongMap!20780 (toList!10405 List!30261)) )
))
(declare-fun contains!8567 (ListLongMap!20779 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5409 (array!88327 array!88329 (_ BitVec 32) (_ BitVec 32) V!52641 V!52641 (_ BitVec 32) Int) ListLongMap!20779)

(assert (=> b!1316592 (= lt!586370 (contains!8567 (getCurrentListMap!5409 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!111312 res!873694) b!1316591))

(assert (= (and b!1316591 res!873697) b!1316585))

(assert (= (and b!1316585 res!873698) b!1316588))

(assert (= (and b!1316588 res!873696) b!1316590))

(assert (= (and b!1316590 res!873695) b!1316592))

(assert (= (and b!1316589 condMapEmpty!55108) mapIsEmpty!55108))

(assert (= (and b!1316589 (not condMapEmpty!55108)) mapNonEmpty!55108))

(get-info :version)

(assert (= (and mapNonEmpty!55108 ((_ is ValueCellFull!16928) mapValue!55108)) b!1316586))

(assert (= (and b!1316589 ((_ is ValueCellFull!16928) mapDefault!55108)) b!1316587))

(assert (= start!111312 b!1316589))

(declare-fun m!1205129 () Bool)

(assert (=> b!1316588 m!1205129))

(declare-fun m!1205131 () Bool)

(assert (=> b!1316592 m!1205131))

(assert (=> b!1316592 m!1205131))

(declare-fun m!1205133 () Bool)

(assert (=> b!1316592 m!1205133))

(declare-fun m!1205135 () Bool)

(assert (=> mapNonEmpty!55108 m!1205135))

(declare-fun m!1205137 () Bool)

(assert (=> start!111312 m!1205137))

(declare-fun m!1205139 () Bool)

(assert (=> start!111312 m!1205139))

(declare-fun m!1205141 () Bool)

(assert (=> start!111312 m!1205141))

(declare-fun m!1205143 () Bool)

(assert (=> b!1316585 m!1205143))

(check-sat (not b!1316588) (not b_next!29923) (not b!1316592) (not b!1316585) (not start!111312) tp_is_empty!35653 b_and!48133 (not mapNonEmpty!55108))
(check-sat b_and!48133 (not b_next!29923))
