; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83140 () Bool)

(assert start!83140)

(declare-fun b_free!19133 () Bool)

(declare-fun b_next!19133 () Bool)

(assert (=> start!83140 (= b_free!19133 (not b_next!19133))))

(declare-fun tp!66677 () Bool)

(declare-fun b_and!30621 () Bool)

(assert (=> start!83140 (= tp!66677 b_and!30621)))

(declare-fun b!969890 () Bool)

(declare-fun e!546795 () Bool)

(declare-fun tp_is_empty!22031 () Bool)

(assert (=> b!969890 (= e!546795 tp_is_empty!22031)))

(declare-fun b!969891 () Bool)

(declare-fun res!649160 () Bool)

(declare-fun e!546797 () Bool)

(assert (=> b!969891 (=> (not res!649160) (not e!546797))))

(declare-datatypes ((array!60123 0))(
  ( (array!60124 (arr!28925 (Array (_ BitVec 32) (_ BitVec 64))) (size!29404 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60123)

(declare-datatypes ((List!20045 0))(
  ( (Nil!20042) (Cons!20041 (h!21203 (_ BitVec 64)) (t!28408 List!20045)) )
))
(declare-fun arrayNoDuplicates!0 (array!60123 (_ BitVec 32) List!20045) Bool)

(assert (=> b!969891 (= res!649160 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20042))))

(declare-fun b!969892 () Bool)

(declare-fun e!546798 () Bool)

(assert (=> b!969892 (= e!546798 tp_is_empty!22031)))

(declare-fun b!969893 () Bool)

(assert (=> b!969893 (= e!546797 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34357 0))(
  ( (V!34358 (val!11066 Int)) )
))
(declare-datatypes ((ValueCell!10534 0))(
  ( (ValueCellFull!10534 (v!13625 V!34357)) (EmptyCell!10534) )
))
(declare-datatypes ((array!60125 0))(
  ( (array!60126 (arr!28926 (Array (_ BitVec 32) ValueCell!10534)) (size!29405 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60125)

(declare-fun zeroValue!1367 () V!34357)

(declare-fun lt!431687 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34357)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14176 0))(
  ( (tuple2!14177 (_1!7099 (_ BitVec 64)) (_2!7099 V!34357)) )
))
(declare-datatypes ((List!20046 0))(
  ( (Nil!20043) (Cons!20042 (h!21204 tuple2!14176) (t!28409 List!20046)) )
))
(declare-datatypes ((ListLongMap!12873 0))(
  ( (ListLongMap!12874 (toList!6452 List!20046)) )
))
(declare-fun contains!5556 (ListLongMap!12873 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3685 (array!60123 array!60125 (_ BitVec 32) (_ BitVec 32) V!34357 V!34357 (_ BitVec 32) Int) ListLongMap!12873)

(assert (=> b!969893 (= lt!431687 (contains!5556 (getCurrentListMap!3685 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28925 _keys!1717) i!822)))))

(declare-fun b!969894 () Bool)

(declare-fun res!649163 () Bool)

(assert (=> b!969894 (=> (not res!649163) (not e!546797))))

(assert (=> b!969894 (= res!649163 (and (= (size!29405 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29404 _keys!1717) (size!29405 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969895 () Bool)

(declare-fun e!546799 () Bool)

(declare-fun mapRes!35056 () Bool)

(assert (=> b!969895 (= e!546799 (and e!546798 mapRes!35056))))

(declare-fun condMapEmpty!35056 () Bool)

(declare-fun mapDefault!35056 () ValueCell!10534)

