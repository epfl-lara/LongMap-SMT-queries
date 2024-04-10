; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82686 () Bool)

(assert start!82686)

(declare-fun b_free!18819 () Bool)

(declare-fun b_next!18819 () Bool)

(assert (=> start!82686 (= b_free!18819 (not b_next!18819))))

(declare-fun tp!65576 () Bool)

(declare-fun b_and!30307 () Bool)

(assert (=> start!82686 (= tp!65576 b_and!30307)))

(declare-fun b!964100 () Bool)

(declare-fun res!645278 () Bool)

(declare-fun e!543544 () Bool)

(assert (=> b!964100 (=> (not res!645278) (not e!543544))))

(declare-datatypes ((array!59331 0))(
  ( (array!59332 (arr!28534 (Array (_ BitVec 32) (_ BitVec 64))) (size!29013 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59331)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!964100 (= res!645278 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29013 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29013 _keys!1686))))))

(declare-fun b!964101 () Bool)

(declare-fun e!543540 () Bool)

(declare-fun e!543543 () Bool)

(declare-fun mapRes!34426 () Bool)

(assert (=> b!964101 (= e!543540 (and e!543543 mapRes!34426))))

(declare-fun condMapEmpty!34426 () Bool)

(declare-datatypes ((V!33811 0))(
  ( (V!33812 (val!10861 Int)) )
))
(declare-datatypes ((ValueCell!10329 0))(
  ( (ValueCellFull!10329 (v!13419 V!33811)) (EmptyCell!10329) )
))
(declare-datatypes ((array!59333 0))(
  ( (array!59334 (arr!28535 (Array (_ BitVec 32) ValueCell!10329)) (size!29014 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59333)

(declare-fun mapDefault!34426 () ValueCell!10329)

(assert (=> b!964101 (= condMapEmpty!34426 (= (arr!28535 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10329)) mapDefault!34426)))))

(declare-fun b!964102 () Bool)

(declare-fun e!543542 () Bool)

(assert (=> b!964102 (= e!543544 (not e!543542))))

(declare-fun res!645279 () Bool)

(assert (=> b!964102 (=> res!645279 e!543542)))

(assert (=> b!964102 (= res!645279 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29013 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33811)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33811)

(declare-datatypes ((tuple2!13956 0))(
  ( (tuple2!13957 (_1!6989 (_ BitVec 64)) (_2!6989 V!33811)) )
))
(declare-datatypes ((List!19804 0))(
  ( (Nil!19801) (Cons!19800 (h!20962 tuple2!13956) (t!28167 List!19804)) )
))
(declare-datatypes ((ListLongMap!12653 0))(
  ( (ListLongMap!12654 (toList!6342 List!19804)) )
))
(declare-fun contains!5445 (ListLongMap!12653 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3575 (array!59331 array!59333 (_ BitVec 32) (_ BitVec 32) V!33811 V!33811 (_ BitVec 32) Int) ListLongMap!12653)

(assert (=> b!964102 (contains!5445 (getCurrentListMap!3575 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28534 _keys!1686) i!803))))

(declare-datatypes ((Unit!32267 0))(
  ( (Unit!32268) )
))
(declare-fun lt!431046 () Unit!32267)

(declare-fun lemmaInListMapFromThenInFromMinusOne!28 (array!59331 array!59333 (_ BitVec 32) (_ BitVec 32) V!33811 V!33811 (_ BitVec 32) (_ BitVec 32) Int) Unit!32267)

(assert (=> b!964102 (= lt!431046 (lemmaInListMapFromThenInFromMinusOne!28 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun res!645283 () Bool)

(assert (=> start!82686 (=> (not res!645283) (not e!543544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82686 (= res!645283 (validMask!0 mask!2110))))

(assert (=> start!82686 e!543544))

(assert (=> start!82686 true))

(declare-fun array_inv!22101 (array!59333) Bool)

(assert (=> start!82686 (and (array_inv!22101 _values!1400) e!543540)))

(declare-fun array_inv!22102 (array!59331) Bool)

(assert (=> start!82686 (array_inv!22102 _keys!1686)))

(assert (=> start!82686 tp!65576))

(declare-fun tp_is_empty!21621 () Bool)

(assert (=> start!82686 tp_is_empty!21621))

(declare-fun b!964103 () Bool)

(declare-fun res!645285 () Bool)

(assert (=> b!964103 (=> (not res!645285) (not e!543544))))

(assert (=> b!964103 (= res!645285 (and (= (size!29014 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29013 _keys!1686) (size!29014 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964104 () Bool)

(declare-fun res!645284 () Bool)

(assert (=> b!964104 (=> (not res!645284) (not e!543544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964104 (= res!645284 (validKeyInArray!0 (select (arr!28534 _keys!1686) i!803)))))

(declare-fun b!964105 () Bool)

(declare-fun e!543545 () Bool)

(assert (=> b!964105 (= e!543545 tp_is_empty!21621)))

(declare-fun b!964106 () Bool)

(declare-fun res!645286 () Bool)

(assert (=> b!964106 (=> (not res!645286) (not e!543544))))

(assert (=> b!964106 (= res!645286 (contains!5445 (getCurrentListMap!3575 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28534 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34426 () Bool)

(assert (=> mapIsEmpty!34426 mapRes!34426))

(declare-fun b!964107 () Bool)

(declare-fun res!645282 () Bool)

(assert (=> b!964107 (=> (not res!645282) (not e!543544))))

(assert (=> b!964107 (= res!645282 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964108 () Bool)

(declare-fun res!645281 () Bool)

(assert (=> b!964108 (=> (not res!645281) (not e!543544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59331 (_ BitVec 32)) Bool)

(assert (=> b!964108 (= res!645281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34426 () Bool)

(declare-fun tp!65577 () Bool)

(assert (=> mapNonEmpty!34426 (= mapRes!34426 (and tp!65577 e!543545))))

(declare-fun mapKey!34426 () (_ BitVec 32))

(declare-fun mapRest!34426 () (Array (_ BitVec 32) ValueCell!10329))

(declare-fun mapValue!34426 () ValueCell!10329)

(assert (=> mapNonEmpty!34426 (= (arr!28535 _values!1400) (store mapRest!34426 mapKey!34426 mapValue!34426))))

(declare-fun b!964109 () Bool)

(assert (=> b!964109 (= e!543542 true)))

(assert (=> b!964109 (contains!5445 (getCurrentListMap!3575 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28534 _keys!1686) i!803))))

(declare-fun lt!431047 () Unit!32267)

(declare-fun lemmaInListMapFromThenInFromSmaller!27 (array!59331 array!59333 (_ BitVec 32) (_ BitVec 32) V!33811 V!33811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32267)

(assert (=> b!964109 (= lt!431047 (lemmaInListMapFromThenInFromSmaller!27 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964110 () Bool)

(assert (=> b!964110 (= e!543543 tp_is_empty!21621)))

(declare-fun b!964111 () Bool)

(declare-fun res!645280 () Bool)

(assert (=> b!964111 (=> (not res!645280) (not e!543544))))

(declare-datatypes ((List!19805 0))(
  ( (Nil!19802) (Cons!19801 (h!20963 (_ BitVec 64)) (t!28168 List!19805)) )
))
(declare-fun arrayNoDuplicates!0 (array!59331 (_ BitVec 32) List!19805) Bool)

(assert (=> b!964111 (= res!645280 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19802))))

(assert (= (and start!82686 res!645283) b!964103))

(assert (= (and b!964103 res!645285) b!964108))

(assert (= (and b!964108 res!645281) b!964111))

(assert (= (and b!964111 res!645280) b!964100))

(assert (= (and b!964100 res!645278) b!964104))

(assert (= (and b!964104 res!645284) b!964106))

(assert (= (and b!964106 res!645286) b!964107))

(assert (= (and b!964107 res!645282) b!964102))

(assert (= (and b!964102 (not res!645279)) b!964109))

(assert (= (and b!964101 condMapEmpty!34426) mapIsEmpty!34426))

(assert (= (and b!964101 (not condMapEmpty!34426)) mapNonEmpty!34426))

(get-info :version)

(assert (= (and mapNonEmpty!34426 ((_ is ValueCellFull!10329) mapValue!34426)) b!964105))

(assert (= (and b!964101 ((_ is ValueCellFull!10329) mapDefault!34426)) b!964110))

(assert (= start!82686 b!964101))

(declare-fun m!893393 () Bool)

(assert (=> b!964108 m!893393))

(declare-fun m!893395 () Bool)

(assert (=> b!964104 m!893395))

(assert (=> b!964104 m!893395))

(declare-fun m!893397 () Bool)

(assert (=> b!964104 m!893397))

(declare-fun m!893399 () Bool)

(assert (=> b!964102 m!893399))

(assert (=> b!964102 m!893395))

(assert (=> b!964102 m!893399))

(assert (=> b!964102 m!893395))

(declare-fun m!893401 () Bool)

(assert (=> b!964102 m!893401))

(declare-fun m!893403 () Bool)

(assert (=> b!964102 m!893403))

(declare-fun m!893405 () Bool)

(assert (=> b!964111 m!893405))

(declare-fun m!893407 () Bool)

(assert (=> start!82686 m!893407))

(declare-fun m!893409 () Bool)

(assert (=> start!82686 m!893409))

(declare-fun m!893411 () Bool)

(assert (=> start!82686 m!893411))

(declare-fun m!893413 () Bool)

(assert (=> mapNonEmpty!34426 m!893413))

(declare-fun m!893415 () Bool)

(assert (=> b!964106 m!893415))

(assert (=> b!964106 m!893395))

(assert (=> b!964106 m!893415))

(assert (=> b!964106 m!893395))

(declare-fun m!893417 () Bool)

(assert (=> b!964106 m!893417))

(declare-fun m!893419 () Bool)

(assert (=> b!964109 m!893419))

(assert (=> b!964109 m!893395))

(assert (=> b!964109 m!893419))

(assert (=> b!964109 m!893395))

(declare-fun m!893421 () Bool)

(assert (=> b!964109 m!893421))

(declare-fun m!893423 () Bool)

(assert (=> b!964109 m!893423))

(check-sat (not start!82686) (not b!964108) b_and!30307 tp_is_empty!21621 (not b!964109) (not mapNonEmpty!34426) (not b!964106) (not b!964102) (not b!964104) (not b_next!18819) (not b!964111))
(check-sat b_and!30307 (not b_next!18819))
