; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83262 () Bool)

(assert start!83262)

(declare-fun b_free!19255 () Bool)

(declare-fun b_next!19255 () Bool)

(assert (=> start!83262 (= b_free!19255 (not b_next!19255))))

(declare-fun tp!67043 () Bool)

(declare-fun b_and!30743 () Bool)

(assert (=> start!83262 (= tp!67043 b_and!30743)))

(declare-fun b!971629 () Bool)

(declare-fun e!547710 () Bool)

(declare-fun tp_is_empty!22153 () Bool)

(assert (=> b!971629 (= e!547710 tp_is_empty!22153)))

(declare-fun res!650351 () Bool)

(declare-fun e!547711 () Bool)

(assert (=> start!83262 (=> (not res!650351) (not e!547711))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83262 (= res!650351 (validMask!0 mask!2147))))

(assert (=> start!83262 e!547711))

(assert (=> start!83262 true))

(declare-datatypes ((V!34521 0))(
  ( (V!34522 (val!11127 Int)) )
))
(declare-datatypes ((ValueCell!10595 0))(
  ( (ValueCellFull!10595 (v!13686 V!34521)) (EmptyCell!10595) )
))
(declare-datatypes ((array!60353 0))(
  ( (array!60354 (arr!29040 (Array (_ BitVec 32) ValueCell!10595)) (size!29519 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60353)

(declare-fun e!547714 () Bool)

(declare-fun array_inv!22471 (array!60353) Bool)

(assert (=> start!83262 (and (array_inv!22471 _values!1425) e!547714)))

(assert (=> start!83262 tp_is_empty!22153))

(assert (=> start!83262 tp!67043))

(declare-datatypes ((array!60355 0))(
  ( (array!60356 (arr!29041 (Array (_ BitVec 32) (_ BitVec 64))) (size!29520 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60355)

(declare-fun array_inv!22472 (array!60355) Bool)

(assert (=> start!83262 (array_inv!22472 _keys!1717)))

(declare-fun b!971630 () Bool)

(declare-fun res!650354 () Bool)

(assert (=> b!971630 (=> (not res!650354) (not e!547711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60355 (_ BitVec 32)) Bool)

(assert (=> b!971630 (= res!650354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971631 () Bool)

(declare-fun res!650349 () Bool)

(assert (=> b!971631 (=> (not res!650349) (not e!547711))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971631 (= res!650349 (validKeyInArray!0 (select (arr!29041 _keys!1717) i!822)))))

(declare-fun b!971632 () Bool)

(declare-fun res!650352 () Bool)

(assert (=> b!971632 (=> (not res!650352) (not e!547711))))

(declare-datatypes ((List!20128 0))(
  ( (Nil!20125) (Cons!20124 (h!21286 (_ BitVec 64)) (t!28491 List!20128)) )
))
(declare-fun arrayNoDuplicates!0 (array!60355 (_ BitVec 32) List!20128) Bool)

(assert (=> b!971632 (= res!650352 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20125))))

(declare-fun b!971633 () Bool)

(declare-fun res!650355 () Bool)

(assert (=> b!971633 (=> (not res!650355) (not e!547711))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971633 (= res!650355 (and (= (size!29519 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29520 _keys!1717) (size!29519 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971634 () Bool)

(assert (=> b!971634 (= e!547711 false)))

(declare-fun zeroValue!1367 () V!34521)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34521)

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14262 0))(
  ( (tuple2!14263 (_1!7142 (_ BitVec 64)) (_2!7142 V!34521)) )
))
(declare-datatypes ((List!20129 0))(
  ( (Nil!20126) (Cons!20125 (h!21287 tuple2!14262) (t!28492 List!20129)) )
))
(declare-datatypes ((ListLongMap!12959 0))(
  ( (ListLongMap!12960 (toList!6495 List!20129)) )
))
(declare-fun lt!431852 () ListLongMap!12959)

(declare-fun getCurrentListMap!3728 (array!60355 array!60353 (_ BitVec 32) (_ BitVec 32) V!34521 V!34521 (_ BitVec 32) Int) ListLongMap!12959)

(assert (=> b!971634 (= lt!431852 (getCurrentListMap!3728 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971635 () Bool)

(declare-fun res!650353 () Bool)

(assert (=> b!971635 (=> (not res!650353) (not e!547711))))

(declare-fun contains!5595 (ListLongMap!12959 (_ BitVec 64)) Bool)

(assert (=> b!971635 (= res!650353 (contains!5595 (getCurrentListMap!3728 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29041 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35239 () Bool)

(declare-fun mapRes!35239 () Bool)

(assert (=> mapIsEmpty!35239 mapRes!35239))

(declare-fun mapNonEmpty!35239 () Bool)

(declare-fun tp!67044 () Bool)

(assert (=> mapNonEmpty!35239 (= mapRes!35239 (and tp!67044 e!547710))))

(declare-fun mapValue!35239 () ValueCell!10595)

(declare-fun mapKey!35239 () (_ BitVec 32))

(declare-fun mapRest!35239 () (Array (_ BitVec 32) ValueCell!10595))

(assert (=> mapNonEmpty!35239 (= (arr!29040 _values!1425) (store mapRest!35239 mapKey!35239 mapValue!35239))))

(declare-fun b!971636 () Bool)

(declare-fun e!547712 () Bool)

(assert (=> b!971636 (= e!547714 (and e!547712 mapRes!35239))))

(declare-fun condMapEmpty!35239 () Bool)

(declare-fun mapDefault!35239 () ValueCell!10595)

