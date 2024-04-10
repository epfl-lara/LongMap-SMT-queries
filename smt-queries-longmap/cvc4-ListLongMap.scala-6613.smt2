; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83566 () Bool)

(assert start!83566)

(declare-fun b_free!19553 () Bool)

(declare-fun b_next!19553 () Bool)

(assert (=> start!83566 (= b_free!19553 (not b_next!19553))))

(declare-fun tp!67946 () Bool)

(declare-fun b_and!31191 () Bool)

(assert (=> start!83566 (= tp!67946 b_and!31191)))

(declare-fun b!976563 () Bool)

(declare-fun res!653769 () Bool)

(declare-fun e!550353 () Bool)

(assert (=> b!976563 (=> (not res!653769) (not e!550353))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34925 0))(
  ( (V!34926 (val!11279 Int)) )
))
(declare-datatypes ((ValueCell!10747 0))(
  ( (ValueCellFull!10747 (v!13838 V!34925)) (EmptyCell!10747) )
))
(declare-datatypes ((array!60939 0))(
  ( (array!60940 (arr!29333 (Array (_ BitVec 32) ValueCell!10747)) (size!29812 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60939)

(declare-fun zeroValue!1367 () V!34925)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34925)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60941 0))(
  ( (array!60942 (arr!29334 (Array (_ BitVec 32) (_ BitVec 64))) (size!29813 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60941)

(declare-datatypes ((tuple2!14516 0))(
  ( (tuple2!14517 (_1!7269 (_ BitVec 64)) (_2!7269 V!34925)) )
))
(declare-datatypes ((List!20365 0))(
  ( (Nil!20362) (Cons!20361 (h!21523 tuple2!14516) (t!28878 List!20365)) )
))
(declare-datatypes ((ListLongMap!13213 0))(
  ( (ListLongMap!13214 (toList!6622 List!20365)) )
))
(declare-fun contains!5700 (ListLongMap!13213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3854 (array!60941 array!60939 (_ BitVec 32) (_ BitVec 32) V!34925 V!34925 (_ BitVec 32) Int) ListLongMap!13213)

(assert (=> b!976563 (= res!653769 (contains!5700 (getCurrentListMap!3854 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29334 _keys!1717) i!822)))))

(declare-fun b!976564 () Bool)

(declare-fun e!550350 () Bool)

(assert (=> b!976564 (= e!550353 e!550350)))

(declare-fun res!653772 () Bool)

(assert (=> b!976564 (=> (not res!653772) (not e!550350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976564 (= res!653772 (not (validKeyInArray!0 (select (arr!29334 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun lt!433145 () ListLongMap!13213)

(assert (=> b!976564 (= lt!433145 (getCurrentListMap!3854 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976565 () Bool)

(declare-fun e!550349 () Bool)

(declare-fun tp_is_empty!22457 () Bool)

(assert (=> b!976565 (= e!550349 tp_is_empty!22457)))

(declare-fun b!976566 () Bool)

(declare-fun res!653771 () Bool)

(assert (=> b!976566 (=> (not res!653771) (not e!550353))))

(declare-datatypes ((List!20366 0))(
  ( (Nil!20363) (Cons!20362 (h!21524 (_ BitVec 64)) (t!28879 List!20366)) )
))
(declare-fun arrayNoDuplicates!0 (array!60941 (_ BitVec 32) List!20366) Bool)

(assert (=> b!976566 (= res!653771 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20363))))

(declare-fun mapIsEmpty!35695 () Bool)

(declare-fun mapRes!35695 () Bool)

(assert (=> mapIsEmpty!35695 mapRes!35695))

(declare-fun b!976567 () Bool)

(declare-fun res!653765 () Bool)

(assert (=> b!976567 (=> (not res!653765) (not e!550353))))

(assert (=> b!976567 (= res!653765 (and (= (size!29812 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29813 _keys!1717) (size!29812 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976568 () Bool)

(declare-fun res!653768 () Bool)

(assert (=> b!976568 (=> (not res!653768) (not e!550353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60941 (_ BitVec 32)) Bool)

(assert (=> b!976568 (= res!653768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976569 () Bool)

(declare-fun res!653766 () Bool)

(assert (=> b!976569 (=> (not res!653766) (not e!550353))))

(assert (=> b!976569 (= res!653766 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29813 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29813 _keys!1717))))))

(declare-fun b!976570 () Bool)

(declare-fun res!653767 () Bool)

(assert (=> b!976570 (=> (not res!653767) (not e!550353))))

(assert (=> b!976570 (= res!653767 (validKeyInArray!0 (select (arr!29334 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35695 () Bool)

(declare-fun tp!67947 () Bool)

(assert (=> mapNonEmpty!35695 (= mapRes!35695 (and tp!67947 e!550349))))

(declare-fun mapKey!35695 () (_ BitVec 32))

(declare-fun mapValue!35695 () ValueCell!10747)

(declare-fun mapRest!35695 () (Array (_ BitVec 32) ValueCell!10747))

(assert (=> mapNonEmpty!35695 (= (arr!29333 _values!1425) (store mapRest!35695 mapKey!35695 mapValue!35695))))

(declare-fun b!976571 () Bool)

(declare-fun e!550354 () Bool)

(assert (=> b!976571 (= e!550354 tp_is_empty!22457)))

(declare-fun b!976572 () Bool)

(assert (=> b!976572 (= e!550350 (not (contains!5700 lt!433145 (select (arr!29334 _keys!1717) i!822))))))

(declare-fun b!976573 () Bool)

(declare-fun e!550351 () Bool)

(assert (=> b!976573 (= e!550351 (and e!550354 mapRes!35695))))

(declare-fun condMapEmpty!35695 () Bool)

(declare-fun mapDefault!35695 () ValueCell!10747)

