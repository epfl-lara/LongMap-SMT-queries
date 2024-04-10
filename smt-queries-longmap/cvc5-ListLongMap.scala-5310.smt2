; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71080 () Bool)

(assert start!71080)

(declare-fun b_free!13267 () Bool)

(declare-fun b_next!13267 () Bool)

(assert (=> start!71080 (= b_free!13267 (not b_next!13267))))

(declare-fun tp!46557 () Bool)

(declare-fun b_and!22181 () Bool)

(assert (=> start!71080 (= tp!46557 b_and!22181)))

(declare-fun mapNonEmpty!24088 () Bool)

(declare-fun mapRes!24088 () Bool)

(declare-fun tp!46558 () Bool)

(declare-fun e!459458 () Bool)

(assert (=> mapNonEmpty!24088 (= mapRes!24088 (and tp!46558 e!459458))))

(declare-datatypes ((V!24971 0))(
  ( (V!24972 (val!7536 Int)) )
))
(declare-datatypes ((ValueCell!7073 0))(
  ( (ValueCellFull!7073 (v!9969 V!24971)) (EmptyCell!7073) )
))
(declare-datatypes ((array!46138 0))(
  ( (array!46139 (arr!22115 (Array (_ BitVec 32) ValueCell!7073)) (size!22536 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46138)

(declare-fun mapRest!24088 () (Array (_ BitVec 32) ValueCell!7073))

(declare-fun mapKey!24088 () (_ BitVec 32))

(declare-fun mapValue!24088 () ValueCell!7073)

(assert (=> mapNonEmpty!24088 (= (arr!22115 _values!788) (store mapRest!24088 mapKey!24088 mapValue!24088))))

(declare-fun b!825468 () Bool)

(declare-fun e!459461 () Bool)

(assert (=> b!825468 (= e!459461 true)))

(declare-datatypes ((tuple2!9976 0))(
  ( (tuple2!9977 (_1!4999 (_ BitVec 64)) (_2!4999 V!24971)) )
))
(declare-datatypes ((List!15781 0))(
  ( (Nil!15778) (Cons!15777 (h!16906 tuple2!9976) (t!22126 List!15781)) )
))
(declare-datatypes ((ListLongMap!8799 0))(
  ( (ListLongMap!8800 (toList!4415 List!15781)) )
))
(declare-fun lt!372722 () ListLongMap!8799)

(declare-fun lt!372726 () tuple2!9976)

(declare-fun lt!372718 () tuple2!9976)

(declare-fun lt!372716 () ListLongMap!8799)

(declare-fun +!1922 (ListLongMap!8799 tuple2!9976) ListLongMap!8799)

(assert (=> b!825468 (= lt!372716 (+!1922 (+!1922 lt!372722 lt!372718) lt!372726))))

(declare-fun lt!372721 () ListLongMap!8799)

(declare-fun lt!372723 () ListLongMap!8799)

(declare-fun lt!372725 () ListLongMap!8799)

(assert (=> b!825468 (and (= lt!372721 lt!372723) (= lt!372725 lt!372723) (= lt!372725 lt!372721))))

(declare-fun lt!372724 () ListLongMap!8799)

(assert (=> b!825468 (= lt!372723 (+!1922 lt!372724 lt!372718))))

(declare-fun lt!372719 () ListLongMap!8799)

(assert (=> b!825468 (= lt!372721 (+!1922 lt!372719 lt!372718))))

(declare-datatypes ((Unit!28293 0))(
  ( (Unit!28294) )
))
(declare-fun lt!372720 () Unit!28293)

(declare-fun zeroValueAfter!34 () V!24971)

(declare-fun zeroValueBefore!34 () V!24971)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!208 (ListLongMap!8799 (_ BitVec 64) V!24971 V!24971) Unit!28293)

(assert (=> b!825468 (= lt!372720 (addSameAsAddTwiceSameKeyDiffValues!208 lt!372719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459460 () Bool)

(assert (=> b!825468 e!459460))

(declare-fun res!562722 () Bool)

(assert (=> b!825468 (=> (not res!562722) (not e!459460))))

(declare-fun lt!372717 () ListLongMap!8799)

(assert (=> b!825468 (= res!562722 (= lt!372717 lt!372724))))

(declare-fun lt!372715 () tuple2!9976)

(assert (=> b!825468 (= lt!372724 (+!1922 lt!372719 lt!372715))))

(assert (=> b!825468 (= lt!372719 (+!1922 lt!372722 lt!372726))))

(assert (=> b!825468 (= lt!372718 (tuple2!9977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459462 () Bool)

(assert (=> b!825468 e!459462))

(declare-fun res!562720 () Bool)

(assert (=> b!825468 (=> (not res!562720) (not e!459462))))

(assert (=> b!825468 (= res!562720 (= lt!372717 (+!1922 (+!1922 lt!372722 lt!372715) lt!372726)))))

(declare-fun minValue!754 () V!24971)

(assert (=> b!825468 (= lt!372726 (tuple2!9977 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825468 (= lt!372715 (tuple2!9977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46140 0))(
  ( (array!46141 (arr!22116 (Array (_ BitVec 32) (_ BitVec 64))) (size!22537 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46140)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2548 (array!46140 array!46138 (_ BitVec 32) (_ BitVec 32) V!24971 V!24971 (_ BitVec 32) Int) ListLongMap!8799)

(assert (=> b!825468 (= lt!372725 (getCurrentListMap!2548 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825468 (= lt!372717 (getCurrentListMap!2548 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24088 () Bool)

(assert (=> mapIsEmpty!24088 mapRes!24088))

(declare-fun b!825469 () Bool)

(declare-fun tp_is_empty!14977 () Bool)

(assert (=> b!825469 (= e!459458 tp_is_empty!14977)))

(declare-fun res!562717 () Bool)

(declare-fun e!459464 () Bool)

(assert (=> start!71080 (=> (not res!562717) (not e!459464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71080 (= res!562717 (validMask!0 mask!1312))))

(assert (=> start!71080 e!459464))

(assert (=> start!71080 tp_is_empty!14977))

(declare-fun array_inv!17629 (array!46140) Bool)

(assert (=> start!71080 (array_inv!17629 _keys!976)))

(assert (=> start!71080 true))

(declare-fun e!459459 () Bool)

(declare-fun array_inv!17630 (array!46138) Bool)

(assert (=> start!71080 (and (array_inv!17630 _values!788) e!459459)))

(assert (=> start!71080 tp!46557))

(declare-fun b!825470 () Bool)

(declare-fun res!562719 () Bool)

(assert (=> b!825470 (=> (not res!562719) (not e!459464))))

(declare-datatypes ((List!15782 0))(
  ( (Nil!15779) (Cons!15778 (h!16907 (_ BitVec 64)) (t!22127 List!15782)) )
))
(declare-fun arrayNoDuplicates!0 (array!46140 (_ BitVec 32) List!15782) Bool)

(assert (=> b!825470 (= res!562719 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15779))))

(declare-fun lt!372714 () ListLongMap!8799)

(declare-fun b!825471 () Bool)

(assert (=> b!825471 (= e!459462 (= lt!372725 (+!1922 (+!1922 lt!372714 (tuple2!9977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372726)))))

(declare-fun b!825472 () Bool)

(assert (=> b!825472 (= e!459460 (= lt!372725 (+!1922 (+!1922 lt!372714 lt!372726) lt!372718)))))

(declare-fun b!825473 () Bool)

(declare-fun e!459463 () Bool)

(assert (=> b!825473 (= e!459459 (and e!459463 mapRes!24088))))

(declare-fun condMapEmpty!24088 () Bool)

(declare-fun mapDefault!24088 () ValueCell!7073)

