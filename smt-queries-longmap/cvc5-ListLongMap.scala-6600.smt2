; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83484 () Bool)

(assert start!83484)

(declare-fun b_free!19471 () Bool)

(declare-fun b_next!19471 () Bool)

(assert (=> start!83484 (= b_free!19471 (not b_next!19471))))

(declare-fun tp!67701 () Bool)

(declare-fun b_and!31073 () Bool)

(assert (=> start!83484 (= tp!67701 b_and!31073)))

(declare-fun mapIsEmpty!35572 () Bool)

(declare-fun mapRes!35572 () Bool)

(assert (=> mapIsEmpty!35572 mapRes!35572))

(declare-fun b!975217 () Bool)

(declare-fun e!549639 () Bool)

(assert (=> b!975217 (= e!549639 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34817 0))(
  ( (V!34818 (val!11238 Int)) )
))
(declare-datatypes ((ValueCell!10706 0))(
  ( (ValueCellFull!10706 (v!13797 V!34817)) (EmptyCell!10706) )
))
(declare-datatypes ((array!60781 0))(
  ( (array!60782 (arr!29254 (Array (_ BitVec 32) ValueCell!10706)) (size!29733 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60781)

(declare-fun zeroValue!1367 () V!34817)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34817)

(declare-datatypes ((tuple2!14448 0))(
  ( (tuple2!14449 (_1!7235 (_ BitVec 64)) (_2!7235 V!34817)) )
))
(declare-datatypes ((List!20300 0))(
  ( (Nil!20297) (Cons!20296 (h!21458 tuple2!14448) (t!28777 List!20300)) )
))
(declare-datatypes ((ListLongMap!13145 0))(
  ( (ListLongMap!13146 (toList!6588 List!20300)) )
))
(declare-fun lt!432842 () ListLongMap!13145)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60783 0))(
  ( (array!60784 (arr!29255 (Array (_ BitVec 32) (_ BitVec 64))) (size!29734 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60783)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun getCurrentListMap!3821 (array!60783 array!60781 (_ BitVec 32) (_ BitVec 32) V!34817 V!34817 (_ BitVec 32) Int) ListLongMap!13145)

(assert (=> b!975217 (= lt!432842 (getCurrentListMap!3821 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!652824 () Bool)

(assert (=> start!83484 (=> (not res!652824) (not e!549639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83484 (= res!652824 (validMask!0 mask!2147))))

(assert (=> start!83484 e!549639))

(assert (=> start!83484 true))

(declare-fun e!549638 () Bool)

(declare-fun array_inv!22623 (array!60781) Bool)

(assert (=> start!83484 (and (array_inv!22623 _values!1425) e!549638)))

(declare-fun tp_is_empty!22375 () Bool)

(assert (=> start!83484 tp_is_empty!22375))

(assert (=> start!83484 tp!67701))

(declare-fun array_inv!22624 (array!60783) Bool)

(assert (=> start!83484 (array_inv!22624 _keys!1717)))

(declare-fun b!975218 () Bool)

(declare-fun res!652826 () Bool)

(assert (=> b!975218 (=> (not res!652826) (not e!549639))))

(declare-datatypes ((List!20301 0))(
  ( (Nil!20298) (Cons!20297 (h!21459 (_ BitVec 64)) (t!28778 List!20301)) )
))
(declare-fun arrayNoDuplicates!0 (array!60783 (_ BitVec 32) List!20301) Bool)

(assert (=> b!975218 (= res!652826 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20298))))

(declare-fun b!975219 () Bool)

(declare-fun res!652828 () Bool)

(assert (=> b!975219 (=> (not res!652828) (not e!549639))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975219 (= res!652828 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29734 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29734 _keys!1717))))))

(declare-fun b!975220 () Bool)

(declare-fun res!652830 () Bool)

(assert (=> b!975220 (=> (not res!652830) (not e!549639))))

(declare-fun contains!5670 (ListLongMap!13145 (_ BitVec 64)) Bool)

(assert (=> b!975220 (= res!652830 (contains!5670 (getCurrentListMap!3821 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29255 _keys!1717) i!822)))))

(declare-fun b!975221 () Bool)

(declare-fun e!549636 () Bool)

(assert (=> b!975221 (= e!549636 tp_is_empty!22375)))

(declare-fun b!975222 () Bool)

(assert (=> b!975222 (= e!549638 (and e!549636 mapRes!35572))))

(declare-fun condMapEmpty!35572 () Bool)

(declare-fun mapDefault!35572 () ValueCell!10706)

