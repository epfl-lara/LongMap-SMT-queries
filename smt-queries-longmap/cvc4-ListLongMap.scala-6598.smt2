; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83476 () Bool)

(assert start!83476)

(declare-fun b_free!19463 () Bool)

(declare-fun b_next!19463 () Bool)

(assert (=> start!83476 (= b_free!19463 (not b_next!19463))))

(declare-fun tp!67676 () Bool)

(declare-fun b_and!31065 () Bool)

(assert (=> start!83476 (= tp!67676 b_and!31065)))

(declare-fun b!975097 () Bool)

(declare-fun res!652740 () Bool)

(declare-fun e!549579 () Bool)

(assert (=> b!975097 (=> (not res!652740) (not e!549579))))

(declare-datatypes ((array!60767 0))(
  ( (array!60768 (arr!29247 (Array (_ BitVec 32) (_ BitVec 64))) (size!29726 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60767)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975097 (= res!652740 (validKeyInArray!0 (select (arr!29247 _keys!1717) i!822)))))

(declare-fun b!975098 () Bool)

(declare-fun res!652744 () Bool)

(assert (=> b!975098 (=> (not res!652744) (not e!549579))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34805 0))(
  ( (V!34806 (val!11234 Int)) )
))
(declare-fun zeroValue!1367 () V!34805)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34805)

(declare-datatypes ((ValueCell!10702 0))(
  ( (ValueCellFull!10702 (v!13793 V!34805)) (EmptyCell!10702) )
))
(declare-datatypes ((array!60769 0))(
  ( (array!60770 (arr!29248 (Array (_ BitVec 32) ValueCell!10702)) (size!29727 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60769)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14442 0))(
  ( (tuple2!14443 (_1!7232 (_ BitVec 64)) (_2!7232 V!34805)) )
))
(declare-datatypes ((List!20295 0))(
  ( (Nil!20292) (Cons!20291 (h!21453 tuple2!14442) (t!28772 List!20295)) )
))
(declare-datatypes ((ListLongMap!13139 0))(
  ( (ListLongMap!13140 (toList!6585 List!20295)) )
))
(declare-fun contains!5667 (ListLongMap!13139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3818 (array!60767 array!60769 (_ BitVec 32) (_ BitVec 32) V!34805 V!34805 (_ BitVec 32) Int) ListLongMap!13139)

(assert (=> b!975098 (= res!652744 (contains!5667 (getCurrentListMap!3818 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29247 _keys!1717) i!822)))))

(declare-fun b!975099 () Bool)

(declare-fun res!652742 () Bool)

(assert (=> b!975099 (=> (not res!652742) (not e!549579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60767 (_ BitVec 32)) Bool)

(assert (=> b!975099 (= res!652742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35560 () Bool)

(declare-fun mapRes!35560 () Bool)

(declare-fun tp!67677 () Bool)

(declare-fun e!549580 () Bool)

(assert (=> mapNonEmpty!35560 (= mapRes!35560 (and tp!67677 e!549580))))

(declare-fun mapKey!35560 () (_ BitVec 32))

(declare-fun mapRest!35560 () (Array (_ BitVec 32) ValueCell!10702))

(declare-fun mapValue!35560 () ValueCell!10702)

(assert (=> mapNonEmpty!35560 (= (arr!29248 _values!1425) (store mapRest!35560 mapKey!35560 mapValue!35560))))

(declare-fun res!652745 () Bool)

(assert (=> start!83476 (=> (not res!652745) (not e!549579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83476 (= res!652745 (validMask!0 mask!2147))))

(assert (=> start!83476 e!549579))

(assert (=> start!83476 true))

(declare-fun e!549576 () Bool)

(declare-fun array_inv!22617 (array!60769) Bool)

(assert (=> start!83476 (and (array_inv!22617 _values!1425) e!549576)))

(declare-fun tp_is_empty!22367 () Bool)

(assert (=> start!83476 tp_is_empty!22367))

(assert (=> start!83476 tp!67676))

(declare-fun array_inv!22618 (array!60767) Bool)

(assert (=> start!83476 (array_inv!22618 _keys!1717)))

(declare-fun b!975100 () Bool)

(declare-fun e!549577 () Bool)

(assert (=> b!975100 (= e!549576 (and e!549577 mapRes!35560))))

(declare-fun condMapEmpty!35560 () Bool)

(declare-fun mapDefault!35560 () ValueCell!10702)

