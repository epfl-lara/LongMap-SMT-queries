; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3944 () Bool)

(assert start!3944)

(declare-fun b_free!859 () Bool)

(declare-fun b_next!859 () Bool)

(assert (=> start!3944 (= b_free!859 (not b_next!859))))

(declare-fun tp!3997 () Bool)

(declare-fun b_and!1663 () Bool)

(assert (=> start!3944 (= tp!3997 b_and!1663)))

(declare-fun b!28212 () Bool)

(declare-fun res!16790 () Bool)

(declare-fun e!18247 () Bool)

(assert (=> b!28212 (=> (not res!16790) (not e!18247))))

(declare-datatypes ((array!1639 0))(
  ( (array!1640 (arr!773 (Array (_ BitVec 32) (_ BitVec 64))) (size!874 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1639)

(declare-datatypes ((List!654 0))(
  ( (Nil!651) (Cons!650 (h!1217 (_ BitVec 64)) (t!3340 List!654)) )
))
(declare-fun arrayNoDuplicates!0 (array!1639 (_ BitVec 32) List!654) Bool)

(assert (=> b!28212 (= res!16790 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!651))))

(declare-fun res!16789 () Bool)

(assert (=> start!3944 (=> (not res!16789) (not e!18247))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3944 (= res!16789 (validMask!0 mask!2294))))

(assert (=> start!3944 e!18247))

(assert (=> start!3944 true))

(assert (=> start!3944 tp!3997))

(declare-datatypes ((V!1443 0))(
  ( (V!1444 (val!633 Int)) )
))
(declare-datatypes ((ValueCell!407 0))(
  ( (ValueCellFull!407 (v!1721 V!1443)) (EmptyCell!407) )
))
(declare-datatypes ((array!1641 0))(
  ( (array!1642 (arr!774 (Array (_ BitVec 32) ValueCell!407)) (size!875 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1641)

(declare-fun e!18246 () Bool)

(declare-fun array_inv!543 (array!1641) Bool)

(assert (=> start!3944 (and (array_inv!543 _values!1501) e!18246)))

(declare-fun array_inv!544 (array!1639) Bool)

(assert (=> start!3944 (array_inv!544 _keys!1833)))

(declare-fun tp_is_empty!1213 () Bool)

(assert (=> start!3944 tp_is_empty!1213))

(declare-fun b!28213 () Bool)

(assert (=> b!28213 (= e!18247 false)))

(declare-fun lt!10759 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1639 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28213 (= lt!10759 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28214 () Bool)

(declare-fun res!16791 () Bool)

(assert (=> b!28214 (=> (not res!16791) (not e!18247))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1443)

(declare-fun minValue!1443 () V!1443)

(declare-datatypes ((tuple2!1066 0))(
  ( (tuple2!1067 (_1!544 (_ BitVec 64)) (_2!544 V!1443)) )
))
(declare-datatypes ((List!655 0))(
  ( (Nil!652) (Cons!651 (h!1218 tuple2!1066) (t!3341 List!655)) )
))
(declare-datatypes ((ListLongMap!631 0))(
  ( (ListLongMap!632 (toList!331 List!655)) )
))
(declare-fun contains!272 (ListLongMap!631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!161 (array!1639 array!1641 (_ BitVec 32) (_ BitVec 32) V!1443 V!1443 (_ BitVec 32) Int) ListLongMap!631)

(assert (=> b!28214 (= res!16791 (not (contains!272 (getCurrentListMap!161 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!28215 () Bool)

(declare-fun res!16787 () Bool)

(assert (=> b!28215 (=> (not res!16787) (not e!18247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28215 (= res!16787 (validKeyInArray!0 k0!1304))))

(declare-fun b!28216 () Bool)

(declare-fun res!16792 () Bool)

(assert (=> b!28216 (=> (not res!16792) (not e!18247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1639 (_ BitVec 32)) Bool)

(assert (=> b!28216 (= res!16792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28217 () Bool)

(declare-fun e!18250 () Bool)

(assert (=> b!28217 (= e!18250 tp_is_empty!1213)))

(declare-fun b!28218 () Bool)

(declare-fun res!16786 () Bool)

(assert (=> b!28218 (=> (not res!16786) (not e!18247))))

(declare-fun arrayContainsKey!0 (array!1639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28218 (= res!16786 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1348 () Bool)

(declare-fun mapRes!1348 () Bool)

(declare-fun tp!3996 () Bool)

(declare-fun e!18249 () Bool)

(assert (=> mapNonEmpty!1348 (= mapRes!1348 (and tp!3996 e!18249))))

(declare-fun mapKey!1348 () (_ BitVec 32))

(declare-fun mapRest!1348 () (Array (_ BitVec 32) ValueCell!407))

(declare-fun mapValue!1348 () ValueCell!407)

(assert (=> mapNonEmpty!1348 (= (arr!774 _values!1501) (store mapRest!1348 mapKey!1348 mapValue!1348))))

(declare-fun b!28219 () Bool)

(assert (=> b!28219 (= e!18249 tp_is_empty!1213)))

(declare-fun b!28220 () Bool)

(declare-fun res!16788 () Bool)

(assert (=> b!28220 (=> (not res!16788) (not e!18247))))

(assert (=> b!28220 (= res!16788 (and (= (size!875 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!874 _keys!1833) (size!875 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1348 () Bool)

(assert (=> mapIsEmpty!1348 mapRes!1348))

(declare-fun b!28221 () Bool)

(assert (=> b!28221 (= e!18246 (and e!18250 mapRes!1348))))

(declare-fun condMapEmpty!1348 () Bool)

(declare-fun mapDefault!1348 () ValueCell!407)

(assert (=> b!28221 (= condMapEmpty!1348 (= (arr!774 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!407)) mapDefault!1348)))))

(assert (= (and start!3944 res!16789) b!28220))

(assert (= (and b!28220 res!16788) b!28216))

(assert (= (and b!28216 res!16792) b!28212))

(assert (= (and b!28212 res!16790) b!28215))

(assert (= (and b!28215 res!16787) b!28214))

(assert (= (and b!28214 res!16791) b!28218))

(assert (= (and b!28218 res!16786) b!28213))

(assert (= (and b!28221 condMapEmpty!1348) mapIsEmpty!1348))

(assert (= (and b!28221 (not condMapEmpty!1348)) mapNonEmpty!1348))

(get-info :version)

(assert (= (and mapNonEmpty!1348 ((_ is ValueCellFull!407) mapValue!1348)) b!28219))

(assert (= (and b!28221 ((_ is ValueCellFull!407) mapDefault!1348)) b!28217))

(assert (= start!3944 b!28221))

(declare-fun m!22431 () Bool)

(assert (=> start!3944 m!22431))

(declare-fun m!22433 () Bool)

(assert (=> start!3944 m!22433))

(declare-fun m!22435 () Bool)

(assert (=> start!3944 m!22435))

(declare-fun m!22437 () Bool)

(assert (=> b!28216 m!22437))

(declare-fun m!22439 () Bool)

(assert (=> b!28218 m!22439))

(declare-fun m!22441 () Bool)

(assert (=> b!28214 m!22441))

(assert (=> b!28214 m!22441))

(declare-fun m!22443 () Bool)

(assert (=> b!28214 m!22443))

(declare-fun m!22445 () Bool)

(assert (=> mapNonEmpty!1348 m!22445))

(declare-fun m!22447 () Bool)

(assert (=> b!28215 m!22447))

(declare-fun m!22449 () Bool)

(assert (=> b!28212 m!22449))

(declare-fun m!22451 () Bool)

(assert (=> b!28213 m!22451))

(check-sat b_and!1663 (not b!28213) (not b!28215) (not b!28212) (not start!3944) tp_is_empty!1213 (not b!28218) (not b_next!859) (not b!28214) (not b!28216) (not mapNonEmpty!1348))
(check-sat b_and!1663 (not b_next!859))
