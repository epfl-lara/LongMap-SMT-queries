; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111324 () Bool)

(assert start!111324)

(declare-fun b_free!29935 () Bool)

(declare-fun b_next!29935 () Bool)

(assert (=> start!111324 (= b_free!29935 (not b_next!29935))))

(declare-fun tp!105127 () Bool)

(declare-fun b_and!48145 () Bool)

(assert (=> start!111324 (= tp!105127 b_and!48145)))

(declare-fun b!1316729 () Bool)

(declare-fun res!873784 () Bool)

(declare-fun e!751219 () Bool)

(assert (=> b!1316729 (=> (not res!873784) (not e!751219))))

(declare-datatypes ((array!88351 0))(
  ( (array!88352 (arr!42651 (Array (_ BitVec 32) (_ BitVec 64))) (size!43202 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88351)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52657 0))(
  ( (V!52658 (val!17907 Int)) )
))
(declare-datatypes ((ValueCell!16934 0))(
  ( (ValueCellFull!16934 (v!20529 V!52657)) (EmptyCell!16934) )
))
(declare-datatypes ((array!88353 0))(
  ( (array!88354 (arr!42652 (Array (_ BitVec 32) ValueCell!16934)) (size!43203 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88353)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1316729 (= res!873784 (and (= (size!43203 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43202 _keys!1628) (size!43203 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316730 () Bool)

(declare-fun e!751217 () Bool)

(declare-fun tp_is_empty!35665 () Bool)

(assert (=> b!1316730 (= e!751217 tp_is_empty!35665)))

(declare-fun b!1316731 () Bool)

(declare-fun res!873788 () Bool)

(assert (=> b!1316731 (=> (not res!873788) (not e!751219))))

(declare-datatypes ((List!30270 0))(
  ( (Nil!30267) (Cons!30266 (h!31484 (_ BitVec 64)) (t!43868 List!30270)) )
))
(declare-fun arrayNoDuplicates!0 (array!88351 (_ BitVec 32) List!30270) Bool)

(assert (=> b!1316731 (= res!873788 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30267))))

(declare-fun mapNonEmpty!55126 () Bool)

(declare-fun mapRes!55126 () Bool)

(declare-fun tp!105126 () Bool)

(declare-fun e!751218 () Bool)

(assert (=> mapNonEmpty!55126 (= mapRes!55126 (and tp!105126 e!751218))))

(declare-fun mapKey!55126 () (_ BitVec 32))

(declare-fun mapRest!55126 () (Array (_ BitVec 32) ValueCell!16934))

(declare-fun mapValue!55126 () ValueCell!16934)

(assert (=> mapNonEmpty!55126 (= (arr!42652 _values!1354) (store mapRest!55126 mapKey!55126 mapValue!55126))))

(declare-fun res!873787 () Bool)

(assert (=> start!111324 (=> (not res!873787) (not e!751219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111324 (= res!873787 (validMask!0 mask!2040))))

(assert (=> start!111324 e!751219))

(assert (=> start!111324 tp!105127))

(declare-fun array_inv!32481 (array!88351) Bool)

(assert (=> start!111324 (array_inv!32481 _keys!1628)))

(assert (=> start!111324 true))

(assert (=> start!111324 tp_is_empty!35665))

(declare-fun e!751216 () Bool)

(declare-fun array_inv!32482 (array!88353) Bool)

(assert (=> start!111324 (and (array_inv!32482 _values!1354) e!751216)))

(declare-fun b!1316732 () Bool)

(assert (=> b!1316732 (= e!751218 tp_is_empty!35665)))

(declare-fun b!1316733 () Bool)

(declare-fun res!873786 () Bool)

(assert (=> b!1316733 (=> (not res!873786) (not e!751219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88351 (_ BitVec 32)) Bool)

(assert (=> b!1316733 (= res!873786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316734 () Bool)

(declare-fun res!873785 () Bool)

(assert (=> b!1316734 (=> (not res!873785) (not e!751219))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316734 (= res!873785 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43202 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316735 () Bool)

(assert (=> b!1316735 (= e!751216 (and e!751217 mapRes!55126))))

(declare-fun condMapEmpty!55126 () Bool)

(declare-fun mapDefault!55126 () ValueCell!16934)

(assert (=> b!1316735 (= condMapEmpty!55126 (= (arr!42652 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16934)) mapDefault!55126)))))

(declare-fun mapIsEmpty!55126 () Bool)

(assert (=> mapIsEmpty!55126 mapRes!55126))

(declare-fun b!1316736 () Bool)

(assert (=> b!1316736 (= e!751219 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!586388 () Bool)

(declare-fun minValue!1296 () V!52657)

(declare-fun zeroValue!1296 () V!52657)

(declare-datatypes ((tuple2!23124 0))(
  ( (tuple2!23125 (_1!11573 (_ BitVec 64)) (_2!11573 V!52657)) )
))
(declare-datatypes ((List!30271 0))(
  ( (Nil!30268) (Cons!30267 (h!31485 tuple2!23124) (t!43869 List!30271)) )
))
(declare-datatypes ((ListLongMap!20789 0))(
  ( (ListLongMap!20790 (toList!10410 List!30271)) )
))
(declare-fun contains!8572 (ListLongMap!20789 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5414 (array!88351 array!88353 (_ BitVec 32) (_ BitVec 32) V!52657 V!52657 (_ BitVec 32) Int) ListLongMap!20789)

(assert (=> b!1316736 (= lt!586388 (contains!8572 (getCurrentListMap!5414 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(assert (= (and start!111324 res!873787) b!1316729))

(assert (= (and b!1316729 res!873784) b!1316733))

(assert (= (and b!1316733 res!873786) b!1316731))

(assert (= (and b!1316731 res!873788) b!1316734))

(assert (= (and b!1316734 res!873785) b!1316736))

(assert (= (and b!1316735 condMapEmpty!55126) mapIsEmpty!55126))

(assert (= (and b!1316735 (not condMapEmpty!55126)) mapNonEmpty!55126))

(get-info :version)

(assert (= (and mapNonEmpty!55126 ((_ is ValueCellFull!16934) mapValue!55126)) b!1316732))

(assert (= (and b!1316735 ((_ is ValueCellFull!16934) mapDefault!55126)) b!1316730))

(assert (= start!111324 b!1316735))

(declare-fun m!1205225 () Bool)

(assert (=> start!111324 m!1205225))

(declare-fun m!1205227 () Bool)

(assert (=> start!111324 m!1205227))

(declare-fun m!1205229 () Bool)

(assert (=> start!111324 m!1205229))

(declare-fun m!1205231 () Bool)

(assert (=> b!1316731 m!1205231))

(declare-fun m!1205233 () Bool)

(assert (=> b!1316736 m!1205233))

(assert (=> b!1316736 m!1205233))

(declare-fun m!1205235 () Bool)

(assert (=> b!1316736 m!1205235))

(declare-fun m!1205237 () Bool)

(assert (=> mapNonEmpty!55126 m!1205237))

(declare-fun m!1205239 () Bool)

(assert (=> b!1316733 m!1205239))

(check-sat tp_is_empty!35665 b_and!48145 (not b!1316736) (not start!111324) (not b_next!29935) (not b!1316733) (not b!1316731) (not mapNonEmpty!55126))
(check-sat b_and!48145 (not b_next!29935))
