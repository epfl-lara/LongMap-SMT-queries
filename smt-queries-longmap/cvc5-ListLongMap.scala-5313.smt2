; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71098 () Bool)

(assert start!71098)

(declare-fun b_free!13285 () Bool)

(declare-fun b_next!13285 () Bool)

(assert (=> start!71098 (= b_free!13285 (not b_next!13285))))

(declare-fun tp!46612 () Bool)

(declare-fun b_and!22199 () Bool)

(assert (=> start!71098 (= tp!46612 b_and!22199)))

(declare-fun b!825738 () Bool)

(declare-fun e!459679 () Bool)

(assert (=> b!825738 (= e!459679 true)))

(declare-datatypes ((V!24995 0))(
  ( (V!24996 (val!7545 Int)) )
))
(declare-datatypes ((tuple2!9990 0))(
  ( (tuple2!9991 (_1!5006 (_ BitVec 64)) (_2!5006 V!24995)) )
))
(declare-datatypes ((List!15792 0))(
  ( (Nil!15789) (Cons!15788 (h!16917 tuple2!9990) (t!22137 List!15792)) )
))
(declare-datatypes ((ListLongMap!8813 0))(
  ( (ListLongMap!8814 (toList!4422 List!15792)) )
))
(declare-fun lt!373092 () ListLongMap!8813)

(declare-fun lt!373091 () tuple2!9990)

(declare-fun lt!373103 () tuple2!9990)

(declare-fun lt!373104 () ListLongMap!8813)

(declare-fun +!1929 (ListLongMap!8813 tuple2!9990) ListLongMap!8813)

(assert (=> b!825738 (= lt!373104 (+!1929 (+!1929 lt!373092 lt!373091) lt!373103))))

(declare-fun lt!373094 () ListLongMap!8813)

(declare-fun lt!373099 () ListLongMap!8813)

(declare-fun lt!373102 () ListLongMap!8813)

(assert (=> b!825738 (and (= lt!373094 lt!373099) (= lt!373102 lt!373099) (= lt!373102 lt!373094))))

(declare-fun lt!373101 () ListLongMap!8813)

(assert (=> b!825738 (= lt!373099 (+!1929 lt!373101 lt!373091))))

(declare-fun lt!373097 () ListLongMap!8813)

(assert (=> b!825738 (= lt!373094 (+!1929 lt!373097 lt!373091))))

(declare-fun zeroValueBefore!34 () V!24995)

(declare-fun zeroValueAfter!34 () V!24995)

(declare-datatypes ((Unit!28305 0))(
  ( (Unit!28306) )
))
(declare-fun lt!373095 () Unit!28305)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!212 (ListLongMap!8813 (_ BitVec 64) V!24995 V!24995) Unit!28305)

(assert (=> b!825738 (= lt!373095 (addSameAsAddTwiceSameKeyDiffValues!212 lt!373097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459674 () Bool)

(assert (=> b!825738 e!459674))

(declare-fun res!562912 () Bool)

(assert (=> b!825738 (=> (not res!562912) (not e!459674))))

(declare-fun lt!373093 () ListLongMap!8813)

(assert (=> b!825738 (= res!562912 (= lt!373093 lt!373101))))

(declare-fun lt!373096 () tuple2!9990)

(assert (=> b!825738 (= lt!373101 (+!1929 lt!373097 lt!373096))))

(assert (=> b!825738 (= lt!373097 (+!1929 lt!373092 lt!373103))))

(assert (=> b!825738 (= lt!373091 (tuple2!9991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459680 () Bool)

(assert (=> b!825738 e!459680))

(declare-fun res!562906 () Bool)

(assert (=> b!825738 (=> (not res!562906) (not e!459680))))

(assert (=> b!825738 (= res!562906 (= lt!373093 (+!1929 (+!1929 lt!373092 lt!373096) lt!373103)))))

(declare-fun minValue!754 () V!24995)

(assert (=> b!825738 (= lt!373103 (tuple2!9991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825738 (= lt!373096 (tuple2!9991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46172 0))(
  ( (array!46173 (arr!22132 (Array (_ BitVec 32) (_ BitVec 64))) (size!22553 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46172)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!7082 0))(
  ( (ValueCellFull!7082 (v!9978 V!24995)) (EmptyCell!7082) )
))
(declare-datatypes ((array!46174 0))(
  ( (array!46175 (arr!22133 (Array (_ BitVec 32) ValueCell!7082)) (size!22554 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46174)

(declare-fun getCurrentListMap!2552 (array!46172 array!46174 (_ BitVec 32) (_ BitVec 32) V!24995 V!24995 (_ BitVec 32) Int) ListLongMap!8813)

(assert (=> b!825738 (= lt!373102 (getCurrentListMap!2552 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825738 (= lt!373093 (getCurrentListMap!2552 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24115 () Bool)

(declare-fun mapRes!24115 () Bool)

(assert (=> mapIsEmpty!24115 mapRes!24115))

(declare-fun lt!373100 () ListLongMap!8813)

(declare-fun b!825739 () Bool)

(assert (=> b!825739 (= e!459674 (= lt!373102 (+!1929 (+!1929 lt!373100 lt!373103) lt!373091)))))

(declare-fun b!825740 () Bool)

(declare-fun e!459677 () Bool)

(declare-fun e!459678 () Bool)

(assert (=> b!825740 (= e!459677 (and e!459678 mapRes!24115))))

(declare-fun condMapEmpty!24115 () Bool)

(declare-fun mapDefault!24115 () ValueCell!7082)

