; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83406 () Bool)

(assert start!83406)

(declare-fun b_free!19399 () Bool)

(declare-fun b_next!19399 () Bool)

(assert (=> start!83406 (= b_free!19399 (not b_next!19399))))

(declare-fun tp!67475 () Bool)

(declare-fun b_and!31001 () Bool)

(assert (=> start!83406 (= tp!67475 b_and!31001)))

(declare-fun b!974074 () Bool)

(declare-fun e!549043 () Bool)

(declare-fun tp_is_empty!22297 () Bool)

(assert (=> b!974074 (= e!549043 tp_is_empty!22297)))

(declare-fun b!974075 () Bool)

(declare-fun res!652037 () Bool)

(declare-fun e!549044 () Bool)

(assert (=> b!974075 (=> (not res!652037) (not e!549044))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34713 0))(
  ( (V!34714 (val!11199 Int)) )
))
(declare-datatypes ((ValueCell!10667 0))(
  ( (ValueCellFull!10667 (v!13758 V!34713)) (EmptyCell!10667) )
))
(declare-datatypes ((array!60635 0))(
  ( (array!60636 (arr!29181 (Array (_ BitVec 32) ValueCell!10667)) (size!29660 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60635)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60637 0))(
  ( (array!60638 (arr!29182 (Array (_ BitVec 32) (_ BitVec 64))) (size!29661 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60637)

(assert (=> b!974075 (= res!652037 (and (= (size!29660 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29661 _keys!1717) (size!29660 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974076 () Bool)

(declare-fun res!652033 () Bool)

(assert (=> b!974076 (=> (not res!652033) (not e!549044))))

(declare-fun zeroValue!1367 () V!34713)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34713)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14390 0))(
  ( (tuple2!14391 (_1!7206 (_ BitVec 64)) (_2!7206 V!34713)) )
))
(declare-datatypes ((List!20248 0))(
  ( (Nil!20245) (Cons!20244 (h!21406 tuple2!14390) (t!28725 List!20248)) )
))
(declare-datatypes ((ListLongMap!13087 0))(
  ( (ListLongMap!13088 (toList!6559 List!20248)) )
))
(declare-fun contains!5648 (ListLongMap!13087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3792 (array!60637 array!60635 (_ BitVec 32) (_ BitVec 32) V!34713 V!34713 (_ BitVec 32) Int) ListLongMap!13087)

(assert (=> b!974076 (= res!652033 (contains!5648 (getCurrentListMap!3792 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29182 _keys!1717) i!822)))))

(declare-fun res!652034 () Bool)

(assert (=> start!83406 (=> (not res!652034) (not e!549044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83406 (= res!652034 (validMask!0 mask!2147))))

(assert (=> start!83406 e!549044))

(assert (=> start!83406 true))

(declare-fun e!549045 () Bool)

(declare-fun array_inv!22569 (array!60635) Bool)

(assert (=> start!83406 (and (array_inv!22569 _values!1425) e!549045)))

(assert (=> start!83406 tp_is_empty!22297))

(assert (=> start!83406 tp!67475))

(declare-fun array_inv!22570 (array!60637) Bool)

(assert (=> start!83406 (array_inv!22570 _keys!1717)))

(declare-fun b!974077 () Bool)

(declare-fun res!652038 () Bool)

(assert (=> b!974077 (=> (not res!652038) (not e!549044))))

(assert (=> b!974077 (= res!652038 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29661 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29661 _keys!1717))))))

(declare-fun mapNonEmpty!35455 () Bool)

(declare-fun mapRes!35455 () Bool)

(declare-fun tp!67476 () Bool)

(declare-fun e!549042 () Bool)

(assert (=> mapNonEmpty!35455 (= mapRes!35455 (and tp!67476 e!549042))))

(declare-fun mapRest!35455 () (Array (_ BitVec 32) ValueCell!10667))

(declare-fun mapKey!35455 () (_ BitVec 32))

(declare-fun mapValue!35455 () ValueCell!10667)

(assert (=> mapNonEmpty!35455 (= (arr!29181 _values!1425) (store mapRest!35455 mapKey!35455 mapValue!35455))))

(declare-fun b!974078 () Bool)

(assert (=> b!974078 (= e!549044 false)))

(declare-fun lt!432734 () ListLongMap!13087)

(assert (=> b!974078 (= lt!432734 (getCurrentListMap!3792 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974079 () Bool)

(declare-fun res!652032 () Bool)

(assert (=> b!974079 (=> (not res!652032) (not e!549044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60637 (_ BitVec 32)) Bool)

(assert (=> b!974079 (= res!652032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974080 () Bool)

(assert (=> b!974080 (= e!549045 (and e!549043 mapRes!35455))))

(declare-fun condMapEmpty!35455 () Bool)

(declare-fun mapDefault!35455 () ValueCell!10667)

