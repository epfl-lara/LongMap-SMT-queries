; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83434 () Bool)

(assert start!83434)

(declare-fun b_free!19427 () Bool)

(declare-fun b_next!19427 () Bool)

(assert (=> start!83434 (= b_free!19427 (not b_next!19427))))

(declare-fun tp!67559 () Bool)

(declare-fun b_and!31029 () Bool)

(assert (=> start!83434 (= tp!67559 b_and!31029)))

(declare-fun b!974494 () Bool)

(declare-fun e!549254 () Bool)

(declare-fun tp_is_empty!22325 () Bool)

(assert (=> b!974494 (= e!549254 tp_is_empty!22325)))

(declare-fun b!974495 () Bool)

(declare-fun res!652330 () Bool)

(declare-fun e!549253 () Bool)

(assert (=> b!974495 (=> (not res!652330) (not e!549253))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34749 0))(
  ( (V!34750 (val!11213 Int)) )
))
(declare-datatypes ((ValueCell!10681 0))(
  ( (ValueCellFull!10681 (v!13772 V!34749)) (EmptyCell!10681) )
))
(declare-datatypes ((array!60691 0))(
  ( (array!60692 (arr!29209 (Array (_ BitVec 32) ValueCell!10681)) (size!29688 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60691)

(declare-fun zeroValue!1367 () V!34749)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34749)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60693 0))(
  ( (array!60694 (arr!29210 (Array (_ BitVec 32) (_ BitVec 64))) (size!29689 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60693)

(declare-datatypes ((tuple2!14416 0))(
  ( (tuple2!14417 (_1!7219 (_ BitVec 64)) (_2!7219 V!34749)) )
))
(declare-datatypes ((List!20268 0))(
  ( (Nil!20265) (Cons!20264 (h!21426 tuple2!14416) (t!28745 List!20268)) )
))
(declare-datatypes ((ListLongMap!13113 0))(
  ( (ListLongMap!13114 (toList!6572 List!20268)) )
))
(declare-fun contains!5658 (ListLongMap!13113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3805 (array!60693 array!60691 (_ BitVec 32) (_ BitVec 32) V!34749 V!34749 (_ BitVec 32) Int) ListLongMap!13113)

(assert (=> b!974495 (= res!652330 (contains!5658 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29210 _keys!1717) i!822)))))

(declare-fun b!974496 () Bool)

(declare-fun e!549256 () Bool)

(assert (=> b!974496 (= e!549256 tp_is_empty!22325)))

(declare-fun b!974497 () Bool)

(declare-fun res!652327 () Bool)

(assert (=> b!974497 (=> (not res!652327) (not e!549253))))

(declare-datatypes ((List!20269 0))(
  ( (Nil!20266) (Cons!20265 (h!21427 (_ BitVec 64)) (t!28746 List!20269)) )
))
(declare-fun arrayNoDuplicates!0 (array!60693 (_ BitVec 32) List!20269) Bool)

(assert (=> b!974497 (= res!652327 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20266))))

(declare-fun b!974498 () Bool)

(declare-fun res!652332 () Bool)

(assert (=> b!974498 (=> (not res!652332) (not e!549253))))

(assert (=> b!974498 (= res!652332 (and (= (size!29688 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29689 _keys!1717) (size!29688 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974500 () Bool)

(declare-fun res!652328 () Bool)

(assert (=> b!974500 (=> (not res!652328) (not e!549253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974500 (= res!652328 (validKeyInArray!0 (select (arr!29210 _keys!1717) i!822)))))

(declare-fun b!974501 () Bool)

(assert (=> b!974501 (= e!549253 false)))

(declare-fun lt!432776 () ListLongMap!13113)

(assert (=> b!974501 (= lt!432776 (getCurrentListMap!3805 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974502 () Bool)

(declare-fun res!652329 () Bool)

(assert (=> b!974502 (=> (not res!652329) (not e!549253))))

(assert (=> b!974502 (= res!652329 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29689 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29689 _keys!1717))))))

(declare-fun mapNonEmpty!35497 () Bool)

(declare-fun mapRes!35497 () Bool)

(declare-fun tp!67560 () Bool)

(assert (=> mapNonEmpty!35497 (= mapRes!35497 (and tp!67560 e!549254))))

(declare-fun mapValue!35497 () ValueCell!10681)

(declare-fun mapKey!35497 () (_ BitVec 32))

(declare-fun mapRest!35497 () (Array (_ BitVec 32) ValueCell!10681))

(assert (=> mapNonEmpty!35497 (= (arr!29209 _values!1425) (store mapRest!35497 mapKey!35497 mapValue!35497))))

(declare-fun b!974503 () Bool)

(declare-fun e!549255 () Bool)

(assert (=> b!974503 (= e!549255 (and e!549256 mapRes!35497))))

(declare-fun condMapEmpty!35497 () Bool)

(declare-fun mapDefault!35497 () ValueCell!10681)

