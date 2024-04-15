; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110812 () Bool)

(assert start!110812)

(declare-fun b_free!29647 () Bool)

(declare-fun b_next!29647 () Bool)

(assert (=> start!110812 (= b_free!29647 (not b_next!29647))))

(declare-fun tp!104264 () Bool)

(declare-fun b_and!47837 () Bool)

(assert (=> start!110812 (= tp!104264 b_and!47837)))

(declare-fun b!1311489 () Bool)

(declare-fun res!870667 () Bool)

(declare-fun e!748182 () Bool)

(assert (=> b!1311489 (=> (not res!870667) (not e!748182))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311489 (= res!870667 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54694 () Bool)

(declare-fun mapRes!54694 () Bool)

(declare-fun tp!104263 () Bool)

(declare-fun e!748183 () Bool)

(assert (=> mapNonEmpty!54694 (= mapRes!54694 (and tp!104263 e!748183))))

(declare-datatypes ((V!52273 0))(
  ( (V!52274 (val!17763 Int)) )
))
(declare-datatypes ((ValueCell!16790 0))(
  ( (ValueCellFull!16790 (v!20389 V!52273)) (EmptyCell!16790) )
))
(declare-fun mapRest!54694 () (Array (_ BitVec 32) ValueCell!16790))

(declare-fun mapKey!54694 () (_ BitVec 32))

(declare-fun mapValue!54694 () ValueCell!16790)

(declare-datatypes ((array!87649 0))(
  ( (array!87650 (arr!42305 (Array (_ BitVec 32) ValueCell!16790)) (size!42857 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87649)

(assert (=> mapNonEmpty!54694 (= (arr!42305 _values!1354) (store mapRest!54694 mapKey!54694 mapValue!54694))))

(declare-fun b!1311490 () Bool)

(declare-fun res!870668 () Bool)

(assert (=> b!1311490 (=> (not res!870668) (not e!748182))))

(declare-datatypes ((array!87651 0))(
  ( (array!87652 (arr!42306 (Array (_ BitVec 32) (_ BitVec 64))) (size!42858 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87651)

(declare-datatypes ((List!30099 0))(
  ( (Nil!30096) (Cons!30095 (h!31304 (_ BitVec 64)) (t!43697 List!30099)) )
))
(declare-fun arrayNoDuplicates!0 (array!87651 (_ BitVec 32) List!30099) Bool)

(assert (=> b!1311490 (= res!870668 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30096))))

(declare-fun mapIsEmpty!54694 () Bool)

(assert (=> mapIsEmpty!54694 mapRes!54694))

(declare-fun b!1311491 () Bool)

(declare-fun res!870664 () Bool)

(assert (=> b!1311491 (=> (not res!870664) (not e!748182))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1311491 (= res!870664 (validKeyInArray!0 (select (arr!42306 _keys!1628) from!2020)))))

(declare-fun b!1311492 () Bool)

(declare-fun res!870670 () Bool)

(assert (=> b!1311492 (=> (not res!870670) (not e!748182))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52273)

(declare-fun zeroValue!1296 () V!52273)

(declare-datatypes ((tuple2!22978 0))(
  ( (tuple2!22979 (_1!11500 (_ BitVec 64)) (_2!11500 V!52273)) )
))
(declare-datatypes ((List!30100 0))(
  ( (Nil!30097) (Cons!30096 (h!31305 tuple2!22978) (t!43698 List!30100)) )
))
(declare-datatypes ((ListLongMap!20635 0))(
  ( (ListLongMap!20636 (toList!10333 List!30100)) )
))
(declare-fun contains!8410 (ListLongMap!20635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5228 (array!87651 array!87649 (_ BitVec 32) (_ BitVec 32) V!52273 V!52273 (_ BitVec 32) Int) ListLongMap!20635)

(assert (=> b!1311492 (= res!870670 (contains!8410 (getCurrentListMap!5228 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!870665 () Bool)

(assert (=> start!110812 (=> (not res!870665) (not e!748182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110812 (= res!870665 (validMask!0 mask!2040))))

(assert (=> start!110812 e!748182))

(assert (=> start!110812 tp!104264))

(declare-fun array_inv!32151 (array!87651) Bool)

(assert (=> start!110812 (array_inv!32151 _keys!1628)))

(assert (=> start!110812 true))

(declare-fun tp_is_empty!35377 () Bool)

(assert (=> start!110812 tp_is_empty!35377))

(declare-fun e!748184 () Bool)

(declare-fun array_inv!32152 (array!87649) Bool)

(assert (=> start!110812 (and (array_inv!32152 _values!1354) e!748184)))

(declare-fun b!1311493 () Bool)

(declare-fun e!748180 () Bool)

(assert (=> b!1311493 (= e!748180 tp_is_empty!35377)))

(declare-fun b!1311494 () Bool)

(declare-fun res!870662 () Bool)

(assert (=> b!1311494 (=> (not res!870662) (not e!748182))))

(assert (=> b!1311494 (= res!870662 (and (= (size!42857 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42858 _keys!1628) (size!42857 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311495 () Bool)

(assert (=> b!1311495 (= e!748183 tp_is_empty!35377)))

(declare-fun b!1311496 () Bool)

(declare-fun res!870663 () Bool)

(assert (=> b!1311496 (=> (not res!870663) (not e!748182))))

(assert (=> b!1311496 (= res!870663 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42858 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311497 () Bool)

(assert (=> b!1311497 (= e!748184 (and e!748180 mapRes!54694))))

(declare-fun condMapEmpty!54694 () Bool)

(declare-fun mapDefault!54694 () ValueCell!16790)

(assert (=> b!1311497 (= condMapEmpty!54694 (= (arr!42305 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16790)) mapDefault!54694)))))

(declare-fun b!1311498 () Bool)

(declare-fun res!870666 () Bool)

(assert (=> b!1311498 (=> (not res!870666) (not e!748182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87651 (_ BitVec 32)) Bool)

(assert (=> b!1311498 (= res!870666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311499 () Bool)

(assert (=> b!1311499 (= e!748182 (not true))))

(assert (=> b!1311499 (contains!8410 (getCurrentListMap!5228 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43181 0))(
  ( (Unit!43182) )
))
(declare-fun lt!585303 () Unit!43181)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!1 (array!87651 array!87649 (_ BitVec 32) (_ BitVec 32) V!52273 V!52273 (_ BitVec 64) (_ BitVec 32) Int) Unit!43181)

(assert (=> b!1311499 (= lt!585303 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!1 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1311500 () Bool)

(declare-fun res!870669 () Bool)

(assert (=> b!1311500 (=> (not res!870669) (not e!748182))))

(assert (=> b!1311500 (= res!870669 (not (= (select (arr!42306 _keys!1628) from!2020) k0!1175)))))

(assert (= (and start!110812 res!870665) b!1311494))

(assert (= (and b!1311494 res!870662) b!1311498))

(assert (= (and b!1311498 res!870666) b!1311490))

(assert (= (and b!1311490 res!870668) b!1311496))

(assert (= (and b!1311496 res!870663) b!1311492))

(assert (= (and b!1311492 res!870670) b!1311500))

(assert (= (and b!1311500 res!870669) b!1311491))

(assert (= (and b!1311491 res!870664) b!1311489))

(assert (= (and b!1311489 res!870667) b!1311499))

(assert (= (and b!1311497 condMapEmpty!54694) mapIsEmpty!54694))

(assert (= (and b!1311497 (not condMapEmpty!54694)) mapNonEmpty!54694))

(get-info :version)

(assert (= (and mapNonEmpty!54694 ((_ is ValueCellFull!16790) mapValue!54694)) b!1311495))

(assert (= (and b!1311497 ((_ is ValueCellFull!16790) mapDefault!54694)) b!1311493))

(assert (= start!110812 b!1311497))

(declare-fun m!1200465 () Bool)

(assert (=> b!1311490 m!1200465))

(declare-fun m!1200467 () Bool)

(assert (=> b!1311498 m!1200467))

(declare-fun m!1200469 () Bool)

(assert (=> b!1311499 m!1200469))

(assert (=> b!1311499 m!1200469))

(declare-fun m!1200471 () Bool)

(assert (=> b!1311499 m!1200471))

(declare-fun m!1200473 () Bool)

(assert (=> b!1311499 m!1200473))

(declare-fun m!1200475 () Bool)

(assert (=> mapNonEmpty!54694 m!1200475))

(declare-fun m!1200477 () Bool)

(assert (=> start!110812 m!1200477))

(declare-fun m!1200479 () Bool)

(assert (=> start!110812 m!1200479))

(declare-fun m!1200481 () Bool)

(assert (=> start!110812 m!1200481))

(declare-fun m!1200483 () Bool)

(assert (=> b!1311492 m!1200483))

(assert (=> b!1311492 m!1200483))

(declare-fun m!1200485 () Bool)

(assert (=> b!1311492 m!1200485))

(declare-fun m!1200487 () Bool)

(assert (=> b!1311500 m!1200487))

(assert (=> b!1311491 m!1200487))

(assert (=> b!1311491 m!1200487))

(declare-fun m!1200489 () Bool)

(assert (=> b!1311491 m!1200489))

(check-sat (not b!1311499) (not b!1311492) (not mapNonEmpty!54694) (not b_next!29647) (not start!110812) (not b!1311498) tp_is_empty!35377 b_and!47837 (not b!1311490) (not b!1311491))
(check-sat b_and!47837 (not b_next!29647))
