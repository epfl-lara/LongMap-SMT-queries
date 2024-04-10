; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83224 () Bool)

(assert start!83224)

(declare-fun b_free!19217 () Bool)

(declare-fun b_next!19217 () Bool)

(assert (=> start!83224 (= b_free!19217 (not b_next!19217))))

(declare-fun tp!66929 () Bool)

(declare-fun b_and!30705 () Bool)

(assert (=> start!83224 (= tp!66929 b_and!30705)))

(declare-fun mapNonEmpty!35182 () Bool)

(declare-fun mapRes!35182 () Bool)

(declare-fun tp!66930 () Bool)

(declare-fun e!547427 () Bool)

(assert (=> mapNonEmpty!35182 (= mapRes!35182 (and tp!66930 e!547427))))

(declare-fun mapKey!35182 () (_ BitVec 32))

(declare-datatypes ((V!34469 0))(
  ( (V!34470 (val!11108 Int)) )
))
(declare-datatypes ((ValueCell!10576 0))(
  ( (ValueCellFull!10576 (v!13667 V!34469)) (EmptyCell!10576) )
))
(declare-fun mapValue!35182 () ValueCell!10576)

(declare-datatypes ((array!60283 0))(
  ( (array!60284 (arr!29005 (Array (_ BitVec 32) ValueCell!10576)) (size!29484 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60283)

(declare-fun mapRest!35182 () (Array (_ BitVec 32) ValueCell!10576))

(assert (=> mapNonEmpty!35182 (= (arr!29005 _values!1425) (store mapRest!35182 mapKey!35182 mapValue!35182))))

(declare-fun b!971059 () Bool)

(declare-fun res!649951 () Bool)

(declare-fun e!547425 () Bool)

(assert (=> b!971059 (=> (not res!649951) (not e!547425))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34469)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34469)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60285 0))(
  ( (array!60286 (arr!29006 (Array (_ BitVec 32) (_ BitVec 64))) (size!29485 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60285)

(declare-datatypes ((tuple2!14236 0))(
  ( (tuple2!14237 (_1!7129 (_ BitVec 64)) (_2!7129 V!34469)) )
))
(declare-datatypes ((List!20105 0))(
  ( (Nil!20102) (Cons!20101 (h!21263 tuple2!14236) (t!28468 List!20105)) )
))
(declare-datatypes ((ListLongMap!12933 0))(
  ( (ListLongMap!12934 (toList!6482 List!20105)) )
))
(declare-fun contains!5584 (ListLongMap!12933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3715 (array!60285 array!60283 (_ BitVec 32) (_ BitVec 32) V!34469 V!34469 (_ BitVec 32) Int) ListLongMap!12933)

(assert (=> b!971059 (= res!649951 (contains!5584 (getCurrentListMap!3715 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29006 _keys!1717) i!822)))))

(declare-fun b!971060 () Bool)

(declare-fun tp_is_empty!22115 () Bool)

(assert (=> b!971060 (= e!547427 tp_is_empty!22115)))

(declare-fun b!971061 () Bool)

(assert (=> b!971061 (= e!547425 false)))

(declare-fun lt!431795 () ListLongMap!12933)

(assert (=> b!971061 (= lt!431795 (getCurrentListMap!3715 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!649955 () Bool)

(assert (=> start!83224 (=> (not res!649955) (not e!547425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83224 (= res!649955 (validMask!0 mask!2147))))

(assert (=> start!83224 e!547425))

(assert (=> start!83224 true))

(declare-fun e!547429 () Bool)

(declare-fun array_inv!22447 (array!60283) Bool)

(assert (=> start!83224 (and (array_inv!22447 _values!1425) e!547429)))

(assert (=> start!83224 tp_is_empty!22115))

(assert (=> start!83224 tp!66929))

(declare-fun array_inv!22448 (array!60285) Bool)

(assert (=> start!83224 (array_inv!22448 _keys!1717)))

(declare-fun b!971062 () Bool)

(declare-fun res!649956 () Bool)

(assert (=> b!971062 (=> (not res!649956) (not e!547425))))

(assert (=> b!971062 (= res!649956 (and (= (size!29484 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29485 _keys!1717) (size!29484 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35182 () Bool)

(assert (=> mapIsEmpty!35182 mapRes!35182))

(declare-fun b!971063 () Bool)

(declare-fun res!649953 () Bool)

(assert (=> b!971063 (=> (not res!649953) (not e!547425))))

(assert (=> b!971063 (= res!649953 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29485 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29485 _keys!1717))))))

(declare-fun b!971064 () Bool)

(declare-fun e!547428 () Bool)

(assert (=> b!971064 (= e!547429 (and e!547428 mapRes!35182))))

(declare-fun condMapEmpty!35182 () Bool)

(declare-fun mapDefault!35182 () ValueCell!10576)

