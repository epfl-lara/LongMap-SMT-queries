; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83404 () Bool)

(assert start!83404)

(declare-fun b_free!19397 () Bool)

(declare-fun b_next!19397 () Bool)

(assert (=> start!83404 (= b_free!19397 (not b_next!19397))))

(declare-fun tp!67470 () Bool)

(declare-fun b_and!30999 () Bool)

(assert (=> start!83404 (= tp!67470 b_and!30999)))

(declare-fun mapIsEmpty!35452 () Bool)

(declare-fun mapRes!35452 () Bool)

(assert (=> mapIsEmpty!35452 mapRes!35452))

(declare-fun b!974044 () Bool)

(declare-fun res!652013 () Bool)

(declare-fun e!549027 () Bool)

(assert (=> b!974044 (=> (not res!652013) (not e!549027))))

(declare-datatypes ((array!60631 0))(
  ( (array!60632 (arr!29179 (Array (_ BitVec 32) (_ BitVec 64))) (size!29658 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60631)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60631 (_ BitVec 32)) Bool)

(assert (=> b!974044 (= res!652013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974045 () Bool)

(declare-fun res!652017 () Bool)

(assert (=> b!974045 (=> (not res!652017) (not e!549027))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974045 (= res!652017 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29658 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29658 _keys!1717))))))

(declare-fun b!974046 () Bool)

(assert (=> b!974046 (= e!549027 false)))

(declare-datatypes ((V!34709 0))(
  ( (V!34710 (val!11198 Int)) )
))
(declare-datatypes ((tuple2!14388 0))(
  ( (tuple2!14389 (_1!7205 (_ BitVec 64)) (_2!7205 V!34709)) )
))
(declare-datatypes ((List!20246 0))(
  ( (Nil!20243) (Cons!20242 (h!21404 tuple2!14388) (t!28723 List!20246)) )
))
(declare-datatypes ((ListLongMap!13085 0))(
  ( (ListLongMap!13086 (toList!6558 List!20246)) )
))
(declare-fun lt!432731 () ListLongMap!13085)

(declare-datatypes ((ValueCell!10666 0))(
  ( (ValueCellFull!10666 (v!13757 V!34709)) (EmptyCell!10666) )
))
(declare-datatypes ((array!60633 0))(
  ( (array!60634 (arr!29180 (Array (_ BitVec 32) ValueCell!10666)) (size!29659 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60633)

(declare-fun zeroValue!1367 () V!34709)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34709)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3791 (array!60631 array!60633 (_ BitVec 32) (_ BitVec 32) V!34709 V!34709 (_ BitVec 32) Int) ListLongMap!13085)

(assert (=> b!974046 (= lt!432731 (getCurrentListMap!3791 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974048 () Bool)

(declare-fun res!652016 () Bool)

(assert (=> b!974048 (=> (not res!652016) (not e!549027))))

(declare-datatypes ((List!20247 0))(
  ( (Nil!20244) (Cons!20243 (h!21405 (_ BitVec 64)) (t!28724 List!20247)) )
))
(declare-fun arrayNoDuplicates!0 (array!60631 (_ BitVec 32) List!20247) Bool)

(assert (=> b!974048 (= res!652016 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20244))))

(declare-fun mapNonEmpty!35452 () Bool)

(declare-fun tp!67469 () Bool)

(declare-fun e!549031 () Bool)

(assert (=> mapNonEmpty!35452 (= mapRes!35452 (and tp!67469 e!549031))))

(declare-fun mapRest!35452 () (Array (_ BitVec 32) ValueCell!10666))

(declare-fun mapKey!35452 () (_ BitVec 32))

(declare-fun mapValue!35452 () ValueCell!10666)

(assert (=> mapNonEmpty!35452 (= (arr!29180 _values!1425) (store mapRest!35452 mapKey!35452 mapValue!35452))))

(declare-fun b!974049 () Bool)

(declare-fun res!652014 () Bool)

(assert (=> b!974049 (=> (not res!652014) (not e!549027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974049 (= res!652014 (validKeyInArray!0 (select (arr!29179 _keys!1717) i!822)))))

(declare-fun b!974050 () Bool)

(declare-fun e!549029 () Bool)

(declare-fun e!549028 () Bool)

(assert (=> b!974050 (= e!549029 (and e!549028 mapRes!35452))))

(declare-fun condMapEmpty!35452 () Bool)

(declare-fun mapDefault!35452 () ValueCell!10666)

