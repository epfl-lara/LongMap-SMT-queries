; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83362 () Bool)

(assert start!83362)

(declare-fun b_free!19355 () Bool)

(declare-fun b_next!19355 () Bool)

(assert (=> start!83362 (= b_free!19355 (not b_next!19355))))

(declare-fun tp!67344 () Bool)

(declare-fun b_and!30931 () Bool)

(assert (=> start!83362 (= tp!67344 b_and!30931)))

(declare-fun b!973351 () Bool)

(declare-fun res!651538 () Bool)

(declare-fun e!548642 () Bool)

(assert (=> b!973351 (=> (not res!651538) (not e!548642))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34653 0))(
  ( (V!34654 (val!11177 Int)) )
))
(declare-datatypes ((ValueCell!10645 0))(
  ( (ValueCellFull!10645 (v!13736 V!34653)) (EmptyCell!10645) )
))
(declare-datatypes ((array!60547 0))(
  ( (array!60548 (arr!29137 (Array (_ BitVec 32) ValueCell!10645)) (size!29616 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60547)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60549 0))(
  ( (array!60550 (arr!29138 (Array (_ BitVec 32) (_ BitVec 64))) (size!29617 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60549)

(assert (=> b!973351 (= res!651538 (and (= (size!29616 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29617 _keys!1717) (size!29616 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973352 () Bool)

(declare-fun res!651533 () Bool)

(assert (=> b!973352 (=> (not res!651533) (not e!548642))))

(declare-datatypes ((List!20209 0))(
  ( (Nil!20206) (Cons!20205 (h!21367 (_ BitVec 64)) (t!28662 List!20209)) )
))
(declare-fun arrayNoDuplicates!0 (array!60549 (_ BitVec 32) List!20209) Bool)

(assert (=> b!973352 (= res!651533 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20206))))

(declare-fun b!973353 () Bool)

(declare-fun e!548639 () Bool)

(assert (=> b!973353 (= e!548642 e!548639)))

(declare-fun res!651539 () Bool)

(assert (=> b!973353 (=> (not res!651539) (not e!548639))))

(declare-datatypes ((tuple2!14348 0))(
  ( (tuple2!14349 (_1!7185 (_ BitVec 64)) (_2!7185 V!34653)) )
))
(declare-datatypes ((List!20210 0))(
  ( (Nil!20207) (Cons!20206 (h!21368 tuple2!14348) (t!28663 List!20210)) )
))
(declare-datatypes ((ListLongMap!13045 0))(
  ( (ListLongMap!13046 (toList!6538 List!20210)) )
))
(declare-fun lt!432451 () ListLongMap!13045)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5631 (ListLongMap!13045 (_ BitVec 64)) Bool)

(assert (=> b!973353 (= res!651539 (contains!5631 lt!432451 (select (arr!29138 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34653)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34653)

(declare-fun getCurrentListMap!3771 (array!60549 array!60547 (_ BitVec 32) (_ BitVec 32) V!34653 V!34653 (_ BitVec 32) Int) ListLongMap!13045)

(assert (=> b!973353 (= lt!432451 (getCurrentListMap!3771 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973355 () Bool)

(declare-fun e!548640 () Bool)

(declare-fun tp_is_empty!22253 () Bool)

(assert (=> b!973355 (= e!548640 tp_is_empty!22253)))

(declare-fun b!973356 () Bool)

(declare-fun res!651534 () Bool)

(assert (=> b!973356 (=> (not res!651534) (not e!548642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973356 (= res!651534 (validKeyInArray!0 (select (arr!29138 _keys!1717) i!822)))))

(declare-fun b!973357 () Bool)

(declare-fun e!548638 () Bool)

(assert (=> b!973357 (= e!548638 tp_is_empty!22253)))

(declare-fun b!973358 () Bool)

(declare-fun e!548641 () Bool)

(declare-fun mapRes!35389 () Bool)

(assert (=> b!973358 (= e!548641 (and e!548638 mapRes!35389))))

(declare-fun condMapEmpty!35389 () Bool)

(declare-fun mapDefault!35389 () ValueCell!10645)

