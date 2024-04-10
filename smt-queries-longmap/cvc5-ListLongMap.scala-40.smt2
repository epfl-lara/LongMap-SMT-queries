; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!712 () Bool)

(assert start!712)

(declare-fun b_free!145 () Bool)

(declare-fun b_next!145 () Bool)

(assert (=> start!712 (= b_free!145 (not b_next!145))))

(declare-fun tp!659 () Bool)

(declare-fun b_and!287 () Bool)

(assert (=> start!712 (= tp!659 b_and!287)))

(declare-fun res!5933 () Bool)

(declare-fun e!2589 () Bool)

(assert (=> start!712 (=> (not res!5933) (not e!2589))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!712 (= res!5933 (validMask!0 mask!2250))))

(assert (=> start!712 e!2589))

(assert (=> start!712 tp!659))

(assert (=> start!712 true))

(declare-datatypes ((V!475 0))(
  ( (V!476 (val!117 Int)) )
))
(declare-datatypes ((ValueCell!95 0))(
  ( (ValueCellFull!95 (v!1206 V!475)) (EmptyCell!95) )
))
(declare-datatypes ((array!379 0))(
  ( (array!380 (arr!180 (Array (_ BitVec 32) ValueCell!95)) (size!242 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!379)

(declare-fun e!2592 () Bool)

(declare-fun array_inv!133 (array!379) Bool)

(assert (=> start!712 (and (array_inv!133 _values!1492) e!2592)))

(declare-fun tp_is_empty!223 () Bool)

(assert (=> start!712 tp_is_empty!223))

(declare-datatypes ((array!381 0))(
  ( (array!382 (arr!181 (Array (_ BitVec 32) (_ BitVec 64))) (size!243 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!381)

(declare-fun array_inv!134 (array!381) Bool)

(assert (=> start!712 (array_inv!134 _keys!1806)))

(declare-fun b!4852 () Bool)

(declare-fun res!5929 () Bool)

(assert (=> b!4852 (=> (not res!5929) (not e!2589))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4852 (= res!5929 (and (= (size!242 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!243 _keys!1806) (size!242 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4853 () Bool)

(declare-fun res!5935 () Bool)

(assert (=> b!4853 (=> (not res!5935) (not e!2589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!381 (_ BitVec 32)) Bool)

(assert (=> b!4853 (= res!5935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4854 () Bool)

(declare-fun res!5930 () Bool)

(assert (=> b!4854 (=> (not res!5930) (not e!2589))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4854 (= res!5930 (validKeyInArray!0 k!1278))))

(declare-fun b!4855 () Bool)

(declare-fun e!2591 () Bool)

(assert (=> b!4855 (= e!2589 (not e!2591))))

(declare-fun res!5932 () Bool)

(assert (=> b!4855 (=> res!5932 e!2591)))

(declare-fun arrayContainsKey!0 (array!381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4855 (= res!5932 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!2588 () Bool)

(assert (=> b!4855 e!2588))

(declare-fun c!290 () Bool)

(assert (=> b!4855 (= c!290 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!475)

(declare-fun zeroValue!1434 () V!475)

(declare-datatypes ((Unit!53 0))(
  ( (Unit!54) )
))
(declare-fun lt!798 () Unit!53)

(declare-fun lemmaKeyInListMapIsInArray!14 (array!381 array!379 (_ BitVec 32) (_ BitVec 32) V!475 V!475 (_ BitVec 64) Int) Unit!53)

(assert (=> b!4855 (= lt!798 (lemmaKeyInListMapIsInArray!14 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun mapIsEmpty!299 () Bool)

(declare-fun mapRes!299 () Bool)

(assert (=> mapIsEmpty!299 mapRes!299))

(declare-fun b!4856 () Bool)

(assert (=> b!4856 (= e!2588 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!4857 () Bool)

(declare-fun e!2594 () Bool)

(assert (=> b!4857 (= e!2594 tp_is_empty!223)))

(declare-fun b!4858 () Bool)

(declare-fun res!5931 () Bool)

(assert (=> b!4858 (=> (not res!5931) (not e!2589))))

(declare-datatypes ((tuple2!108 0))(
  ( (tuple2!109 (_1!54 (_ BitVec 64)) (_2!54 V!475)) )
))
(declare-datatypes ((List!117 0))(
  ( (Nil!114) (Cons!113 (h!679 tuple2!108) (t!2248 List!117)) )
))
(declare-datatypes ((ListLongMap!113 0))(
  ( (ListLongMap!114 (toList!72 List!117)) )
))
(declare-fun contains!44 (ListLongMap!113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!31 (array!381 array!379 (_ BitVec 32) (_ BitVec 32) V!475 V!475 (_ BitVec 32) Int) ListLongMap!113)

(assert (=> b!4858 (= res!5931 (contains!44 (getCurrentListMap!31 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!4859 () Bool)

(assert (=> b!4859 (= e!2588 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!4860 () Bool)

(declare-fun e!2593 () Bool)

(assert (=> b!4860 (= e!2593 tp_is_empty!223)))

(declare-fun mapNonEmpty!299 () Bool)

(declare-fun tp!658 () Bool)

(assert (=> mapNonEmpty!299 (= mapRes!299 (and tp!658 e!2593))))

(declare-fun mapRest!299 () (Array (_ BitVec 32) ValueCell!95))

(declare-fun mapValue!299 () ValueCell!95)

(declare-fun mapKey!299 () (_ BitVec 32))

(assert (=> mapNonEmpty!299 (= (arr!180 _values!1492) (store mapRest!299 mapKey!299 mapValue!299))))

(declare-fun b!4861 () Bool)

(declare-fun res!5934 () Bool)

(assert (=> b!4861 (=> (not res!5934) (not e!2589))))

(declare-datatypes ((List!118 0))(
  ( (Nil!115) (Cons!114 (h!680 (_ BitVec 64)) (t!2249 List!118)) )
))
(declare-fun arrayNoDuplicates!0 (array!381 (_ BitVec 32) List!118) Bool)

(assert (=> b!4861 (= res!5934 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!115))))

(declare-fun b!4862 () Bool)

(assert (=> b!4862 (= e!2592 (and e!2594 mapRes!299))))

(declare-fun condMapEmpty!299 () Bool)

(declare-fun mapDefault!299 () ValueCell!95)

