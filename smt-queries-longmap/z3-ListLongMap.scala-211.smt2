; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3944 () Bool)

(assert start!3944)

(declare-fun b_free!853 () Bool)

(declare-fun b_next!853 () Bool)

(assert (=> start!3944 (= b_free!853 (not b_next!853))))

(declare-fun tp!3978 () Bool)

(declare-fun b_and!1653 () Bool)

(assert (=> start!3944 (= tp!3978 b_and!1653)))

(declare-fun b!28104 () Bool)

(declare-fun res!16720 () Bool)

(declare-fun e!18194 () Bool)

(assert (=> b!28104 (=> (not res!16720) (not e!18194))))

(declare-datatypes ((array!1633 0))(
  ( (array!1634 (arr!770 (Array (_ BitVec 32) (_ BitVec 64))) (size!871 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1633)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1633 (_ BitVec 32)) Bool)

(assert (=> b!28104 (= res!16720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28105 () Bool)

(assert (=> b!28105 (= e!18194 false)))

(declare-fun lt!10710 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1633 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28105 (= lt!10710 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!16721 () Bool)

(assert (=> start!3944 (=> (not res!16721) (not e!18194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3944 (= res!16721 (validMask!0 mask!2294))))

(assert (=> start!3944 e!18194))

(assert (=> start!3944 true))

(assert (=> start!3944 tp!3978))

(declare-datatypes ((V!1435 0))(
  ( (V!1436 (val!630 Int)) )
))
(declare-datatypes ((ValueCell!404 0))(
  ( (ValueCellFull!404 (v!1719 V!1435)) (EmptyCell!404) )
))
(declare-datatypes ((array!1635 0))(
  ( (array!1636 (arr!771 (Array (_ BitVec 32) ValueCell!404)) (size!872 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1635)

(declare-fun e!18195 () Bool)

(declare-fun array_inv!535 (array!1635) Bool)

(assert (=> start!3944 (and (array_inv!535 _values!1501) e!18195)))

(declare-fun array_inv!536 (array!1633) Bool)

(assert (=> start!3944 (array_inv!536 _keys!1833)))

(declare-fun tp_is_empty!1207 () Bool)

(assert (=> start!3944 tp_is_empty!1207))

(declare-fun b!28106 () Bool)

(declare-fun res!16715 () Bool)

(assert (=> b!28106 (=> (not res!16715) (not e!18194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28106 (= res!16715 (validKeyInArray!0 k0!1304))))

(declare-fun b!28107 () Bool)

(declare-fun res!16719 () Bool)

(assert (=> b!28107 (=> (not res!16719) (not e!18194))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1435)

(declare-fun minValue!1443 () V!1435)

(declare-datatypes ((tuple2!1048 0))(
  ( (tuple2!1049 (_1!535 (_ BitVec 64)) (_2!535 V!1435)) )
))
(declare-datatypes ((List!642 0))(
  ( (Nil!639) (Cons!638 (h!1205 tuple2!1048) (t!3329 List!642)) )
))
(declare-datatypes ((ListLongMap!619 0))(
  ( (ListLongMap!620 (toList!325 List!642)) )
))
(declare-fun contains!267 (ListLongMap!619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!155 (array!1633 array!1635 (_ BitVec 32) (_ BitVec 32) V!1435 V!1435 (_ BitVec 32) Int) ListLongMap!619)

(assert (=> b!28107 (= res!16719 (not (contains!267 (getCurrentListMap!155 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!28108 () Bool)

(declare-fun res!16718 () Bool)

(assert (=> b!28108 (=> (not res!16718) (not e!18194))))

(declare-datatypes ((List!643 0))(
  ( (Nil!640) (Cons!639 (h!1206 (_ BitVec 64)) (t!3330 List!643)) )
))
(declare-fun arrayNoDuplicates!0 (array!1633 (_ BitVec 32) List!643) Bool)

(assert (=> b!28108 (= res!16718 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!640))))

(declare-fun b!28109 () Bool)

(declare-fun e!18193 () Bool)

(assert (=> b!28109 (= e!18193 tp_is_empty!1207)))

(declare-fun mapIsEmpty!1339 () Bool)

(declare-fun mapRes!1339 () Bool)

(assert (=> mapIsEmpty!1339 mapRes!1339))

(declare-fun b!28110 () Bool)

(declare-fun res!16716 () Bool)

(assert (=> b!28110 (=> (not res!16716) (not e!18194))))

(declare-fun arrayContainsKey!0 (array!1633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28110 (= res!16716 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28111 () Bool)

(declare-fun res!16717 () Bool)

(assert (=> b!28111 (=> (not res!16717) (not e!18194))))

(assert (=> b!28111 (= res!16717 (and (= (size!872 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!871 _keys!1833) (size!872 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28112 () Bool)

(assert (=> b!28112 (= e!18195 (and e!18193 mapRes!1339))))

(declare-fun condMapEmpty!1339 () Bool)

(declare-fun mapDefault!1339 () ValueCell!404)

(assert (=> b!28112 (= condMapEmpty!1339 (= (arr!771 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!404)) mapDefault!1339)))))

(declare-fun b!28113 () Bool)

(declare-fun e!18192 () Bool)

(assert (=> b!28113 (= e!18192 tp_is_empty!1207)))

(declare-fun mapNonEmpty!1339 () Bool)

(declare-fun tp!3979 () Bool)

(assert (=> mapNonEmpty!1339 (= mapRes!1339 (and tp!3979 e!18192))))

(declare-fun mapRest!1339 () (Array (_ BitVec 32) ValueCell!404))

(declare-fun mapKey!1339 () (_ BitVec 32))

(declare-fun mapValue!1339 () ValueCell!404)

(assert (=> mapNonEmpty!1339 (= (arr!771 _values!1501) (store mapRest!1339 mapKey!1339 mapValue!1339))))

(assert (= (and start!3944 res!16721) b!28111))

(assert (= (and b!28111 res!16717) b!28104))

(assert (= (and b!28104 res!16720) b!28108))

(assert (= (and b!28108 res!16718) b!28106))

(assert (= (and b!28106 res!16715) b!28107))

(assert (= (and b!28107 res!16719) b!28110))

(assert (= (and b!28110 res!16716) b!28105))

(assert (= (and b!28112 condMapEmpty!1339) mapIsEmpty!1339))

(assert (= (and b!28112 (not condMapEmpty!1339)) mapNonEmpty!1339))

(get-info :version)

(assert (= (and mapNonEmpty!1339 ((_ is ValueCellFull!404) mapValue!1339)) b!28113))

(assert (= (and b!28112 ((_ is ValueCellFull!404) mapDefault!1339)) b!28109))

(assert (= start!3944 b!28112))

(declare-fun m!22283 () Bool)

(assert (=> b!28110 m!22283))

(declare-fun m!22285 () Bool)

(assert (=> start!3944 m!22285))

(declare-fun m!22287 () Bool)

(assert (=> start!3944 m!22287))

(declare-fun m!22289 () Bool)

(assert (=> start!3944 m!22289))

(declare-fun m!22291 () Bool)

(assert (=> mapNonEmpty!1339 m!22291))

(declare-fun m!22293 () Bool)

(assert (=> b!28108 m!22293))

(declare-fun m!22295 () Bool)

(assert (=> b!28106 m!22295))

(declare-fun m!22297 () Bool)

(assert (=> b!28105 m!22297))

(declare-fun m!22299 () Bool)

(assert (=> b!28104 m!22299))

(declare-fun m!22301 () Bool)

(assert (=> b!28107 m!22301))

(assert (=> b!28107 m!22301))

(declare-fun m!22303 () Bool)

(assert (=> b!28107 m!22303))

(check-sat (not b!28107) (not b_next!853) tp_is_empty!1207 (not mapNonEmpty!1339) (not start!3944) b_and!1653 (not b!28104) (not b!28105) (not b!28106) (not b!28110) (not b!28108))
(check-sat b_and!1653 (not b_next!853))
