; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83412 () Bool)

(assert start!83412)

(declare-fun b_free!19405 () Bool)

(declare-fun b_next!19405 () Bool)

(assert (=> start!83412 (= b_free!19405 (not b_next!19405))))

(declare-fun tp!67494 () Bool)

(declare-fun b_and!31007 () Bool)

(assert (=> start!83412 (= tp!67494 b_and!31007)))

(declare-fun b!974164 () Bool)

(declare-fun res!652100 () Bool)

(declare-fun e!549088 () Bool)

(assert (=> b!974164 (=> (not res!652100) (not e!549088))))

(declare-datatypes ((array!60647 0))(
  ( (array!60648 (arr!29187 (Array (_ BitVec 32) (_ BitVec 64))) (size!29666 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60647)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974164 (= res!652100 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29666 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29666 _keys!1717))))))

(declare-fun b!974165 () Bool)

(assert (=> b!974165 (= e!549088 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34721 0))(
  ( (V!34722 (val!11202 Int)) )
))
(declare-datatypes ((tuple2!14394 0))(
  ( (tuple2!14395 (_1!7208 (_ BitVec 64)) (_2!7208 V!34721)) )
))
(declare-datatypes ((List!20251 0))(
  ( (Nil!20248) (Cons!20247 (h!21409 tuple2!14394) (t!28728 List!20251)) )
))
(declare-datatypes ((ListLongMap!13091 0))(
  ( (ListLongMap!13092 (toList!6561 List!20251)) )
))
(declare-fun lt!432743 () ListLongMap!13091)

(declare-datatypes ((ValueCell!10670 0))(
  ( (ValueCellFull!10670 (v!13761 V!34721)) (EmptyCell!10670) )
))
(declare-datatypes ((array!60649 0))(
  ( (array!60650 (arr!29188 (Array (_ BitVec 32) ValueCell!10670)) (size!29667 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60649)

(declare-fun zeroValue!1367 () V!34721)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34721)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3794 (array!60647 array!60649 (_ BitVec 32) (_ BitVec 32) V!34721 V!34721 (_ BitVec 32) Int) ListLongMap!13091)

(assert (=> b!974165 (= lt!432743 (getCurrentListMap!3794 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974166 () Bool)

(declare-fun e!549087 () Bool)

(declare-fun tp_is_empty!22303 () Bool)

(assert (=> b!974166 (= e!549087 tp_is_empty!22303)))

(declare-fun b!974167 () Bool)

(declare-fun res!652095 () Bool)

(assert (=> b!974167 (=> (not res!652095) (not e!549088))))

(declare-fun contains!5650 (ListLongMap!13091 (_ BitVec 64)) Bool)

(assert (=> b!974167 (= res!652095 (contains!5650 (getCurrentListMap!3794 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29187 _keys!1717) i!822)))))

(declare-fun res!652101 () Bool)

(assert (=> start!83412 (=> (not res!652101) (not e!549088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83412 (= res!652101 (validMask!0 mask!2147))))

(assert (=> start!83412 e!549088))

(assert (=> start!83412 true))

(declare-fun e!549090 () Bool)

(declare-fun array_inv!22573 (array!60649) Bool)

(assert (=> start!83412 (and (array_inv!22573 _values!1425) e!549090)))

(assert (=> start!83412 tp_is_empty!22303))

(assert (=> start!83412 tp!67494))

(declare-fun array_inv!22574 (array!60647) Bool)

(assert (=> start!83412 (array_inv!22574 _keys!1717)))

(declare-fun b!974168 () Bool)

(declare-fun res!652096 () Bool)

(assert (=> b!974168 (=> (not res!652096) (not e!549088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974168 (= res!652096 (validKeyInArray!0 (select (arr!29187 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35464 () Bool)

(declare-fun mapRes!35464 () Bool)

(assert (=> mapIsEmpty!35464 mapRes!35464))

(declare-fun b!974169 () Bool)

(declare-fun res!652099 () Bool)

(assert (=> b!974169 (=> (not res!652099) (not e!549088))))

(assert (=> b!974169 (= res!652099 (and (= (size!29667 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29666 _keys!1717) (size!29667 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974170 () Bool)

(declare-fun e!549089 () Bool)

(assert (=> b!974170 (= e!549090 (and e!549089 mapRes!35464))))

(declare-fun condMapEmpty!35464 () Bool)

(declare-fun mapDefault!35464 () ValueCell!10670)

