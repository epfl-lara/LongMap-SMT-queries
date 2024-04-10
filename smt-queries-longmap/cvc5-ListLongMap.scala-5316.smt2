; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71136 () Bool)

(assert start!71136)

(declare-fun b_free!13303 () Bool)

(declare-fun b_next!13303 () Bool)

(assert (=> start!71136 (= b_free!13303 (not b_next!13303))))

(declare-fun tp!46668 () Bool)

(declare-fun b_and!22229 () Bool)

(assert (=> start!71136 (= tp!46668 b_and!22229)))

(declare-fun b!826214 () Bool)

(declare-fun res!563201 () Bool)

(declare-fun e!460025 () Bool)

(assert (=> b!826214 (=> (not res!563201) (not e!460025))))

(declare-datatypes ((array!46208 0))(
  ( (array!46209 (arr!22149 (Array (_ BitVec 32) (_ BitVec 64))) (size!22570 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46208)

(declare-datatypes ((List!15805 0))(
  ( (Nil!15802) (Cons!15801 (h!16930 (_ BitVec 64)) (t!22152 List!15805)) )
))
(declare-fun arrayNoDuplicates!0 (array!46208 (_ BitVec 32) List!15805) Bool)

(assert (=> b!826214 (= res!563201 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15802))))

(declare-fun b!826215 () Bool)

(declare-fun e!460022 () Bool)

(assert (=> b!826215 (= e!460022 true)))

(declare-datatypes ((V!25019 0))(
  ( (V!25020 (val!7554 Int)) )
))
(declare-datatypes ((tuple2!10006 0))(
  ( (tuple2!10007 (_1!5014 (_ BitVec 64)) (_2!5014 V!25019)) )
))
(declare-datatypes ((List!15806 0))(
  ( (Nil!15803) (Cons!15802 (h!16931 tuple2!10006) (t!22153 List!15806)) )
))
(declare-datatypes ((ListLongMap!8829 0))(
  ( (ListLongMap!8830 (toList!4430 List!15806)) )
))
(declare-fun lt!373647 () ListLongMap!8829)

(declare-fun lt!373656 () tuple2!10006)

(declare-fun lt!373652 () tuple2!10006)

(declare-fun lt!373651 () ListLongMap!8829)

(declare-fun +!1937 (ListLongMap!8829 tuple2!10006) ListLongMap!8829)

(assert (=> b!826215 (= lt!373651 (+!1937 (+!1937 lt!373647 lt!373652) lt!373656))))

(declare-fun lt!373657 () ListLongMap!8829)

(declare-fun lt!373660 () ListLongMap!8829)

(declare-fun lt!373654 () ListLongMap!8829)

(assert (=> b!826215 (and (= lt!373657 lt!373660) (= lt!373654 lt!373660) (= lt!373654 lt!373657))))

(declare-fun lt!373655 () ListLongMap!8829)

(assert (=> b!826215 (= lt!373660 (+!1937 lt!373655 lt!373652))))

(declare-fun lt!373653 () ListLongMap!8829)

(assert (=> b!826215 (= lt!373657 (+!1937 lt!373653 lt!373652))))

(declare-fun zeroValueBefore!34 () V!25019)

(declare-fun zeroValueAfter!34 () V!25019)

(declare-datatypes ((Unit!28323 0))(
  ( (Unit!28324) )
))
(declare-fun lt!373658 () Unit!28323)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!220 (ListLongMap!8829 (_ BitVec 64) V!25019 V!25019) Unit!28323)

(assert (=> b!826215 (= lt!373658 (addSameAsAddTwiceSameKeyDiffValues!220 lt!373653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460021 () Bool)

(assert (=> b!826215 e!460021))

(declare-fun res!563200 () Bool)

(assert (=> b!826215 (=> (not res!563200) (not e!460021))))

(declare-fun lt!373649 () ListLongMap!8829)

(assert (=> b!826215 (= res!563200 (= lt!373649 lt!373655))))

(declare-fun lt!373648 () tuple2!10006)

(assert (=> b!826215 (= lt!373655 (+!1937 lt!373653 lt!373648))))

(assert (=> b!826215 (= lt!373653 (+!1937 lt!373647 lt!373656))))

(assert (=> b!826215 (= lt!373652 (tuple2!10007 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460023 () Bool)

(assert (=> b!826215 e!460023))

(declare-fun res!563204 () Bool)

(assert (=> b!826215 (=> (not res!563204) (not e!460023))))

(assert (=> b!826215 (= res!563204 (= lt!373649 (+!1937 (+!1937 lt!373647 lt!373648) lt!373656)))))

(declare-fun minValue!754 () V!25019)

(assert (=> b!826215 (= lt!373656 (tuple2!10007 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826215 (= lt!373648 (tuple2!10007 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((ValueCell!7091 0))(
  ( (ValueCellFull!7091 (v!9988 V!25019)) (EmptyCell!7091) )
))
(declare-datatypes ((array!46210 0))(
  ( (array!46211 (arr!22150 (Array (_ BitVec 32) ValueCell!7091)) (size!22571 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46210)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2560 (array!46208 array!46210 (_ BitVec 32) (_ BitVec 32) V!25019 V!25019 (_ BitVec 32) Int) ListLongMap!8829)

(assert (=> b!826215 (= lt!373654 (getCurrentListMap!2560 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826215 (= lt!373649 (getCurrentListMap!2560 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826216 () Bool)

(declare-fun lt!373650 () ListLongMap!8829)

(assert (=> b!826216 (= e!460021 (= lt!373654 (+!1937 (+!1937 lt!373650 lt!373656) lt!373652)))))

(declare-fun res!563202 () Bool)

(assert (=> start!71136 (=> (not res!563202) (not e!460025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71136 (= res!563202 (validMask!0 mask!1312))))

(assert (=> start!71136 e!460025))

(declare-fun tp_is_empty!15013 () Bool)

(assert (=> start!71136 tp_is_empty!15013))

(declare-fun array_inv!17657 (array!46208) Bool)

(assert (=> start!71136 (array_inv!17657 _keys!976)))

(assert (=> start!71136 true))

(declare-fun e!460024 () Bool)

(declare-fun array_inv!17658 (array!46210) Bool)

(assert (=> start!71136 (and (array_inv!17658 _values!788) e!460024)))

(assert (=> start!71136 tp!46668))

(declare-fun b!826217 () Bool)

(declare-fun e!460026 () Bool)

(assert (=> b!826217 (= e!460026 tp_is_empty!15013)))

(declare-fun b!826218 () Bool)

(declare-fun res!563203 () Bool)

(assert (=> b!826218 (=> (not res!563203) (not e!460025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46208 (_ BitVec 32)) Bool)

(assert (=> b!826218 (= res!563203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826219 () Bool)

(declare-fun e!460027 () Bool)

(declare-fun mapRes!24145 () Bool)

(assert (=> b!826219 (= e!460024 (and e!460027 mapRes!24145))))

(declare-fun condMapEmpty!24145 () Bool)

(declare-fun mapDefault!24145 () ValueCell!7091)

