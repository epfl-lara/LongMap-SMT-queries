; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42468 () Bool)

(assert start!42468)

(declare-fun b_free!11923 () Bool)

(declare-fun b_next!11923 () Bool)

(assert (=> start!42468 (= b_free!11923 (not b_next!11923))))

(declare-fun tp!41806 () Bool)

(declare-fun b_and!20391 () Bool)

(assert (=> start!42468 (= tp!41806 b_and!20391)))

(declare-fun b!473830 () Bool)

(declare-fun e!278023 () Bool)

(assert (=> b!473830 (= e!278023 true)))

(declare-datatypes ((V!18907 0))(
  ( (V!18908 (val!6720 Int)) )
))
(declare-datatypes ((tuple2!8858 0))(
  ( (tuple2!8859 (_1!4440 (_ BitVec 64)) (_2!4440 V!18907)) )
))
(declare-datatypes ((List!8938 0))(
  ( (Nil!8935) (Cons!8934 (h!9790 tuple2!8858) (t!14910 List!8938)) )
))
(declare-datatypes ((ListLongMap!7771 0))(
  ( (ListLongMap!7772 (toList!3901 List!8938)) )
))
(declare-fun lt!215511 () ListLongMap!7771)

(declare-fun lt!215506 () tuple2!8858)

(declare-fun minValueBefore!38 () V!18907)

(declare-fun +!1736 (ListLongMap!7771 tuple2!8858) ListLongMap!7771)

(assert (=> b!473830 (= (+!1736 lt!215511 lt!215506) (+!1736 (+!1736 lt!215511 (tuple2!8859 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215506))))

(declare-fun minValueAfter!38 () V!18907)

(assert (=> b!473830 (= lt!215506 (tuple2!8859 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13960 0))(
  ( (Unit!13961) )
))
(declare-fun lt!215509 () Unit!13960)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!145 (ListLongMap!7771 (_ BitVec 64) V!18907 V!18907) Unit!13960)

(assert (=> b!473830 (= lt!215509 (addSameAsAddTwiceSameKeyDiffValues!145 lt!215511 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215507 () ListLongMap!7771)

(declare-fun zeroValue!794 () V!18907)

(assert (=> b!473830 (= lt!215511 (+!1736 lt!215507 (tuple2!8859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215510 () ListLongMap!7771)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30459 0))(
  ( (array!30460 (arr!14648 (Array (_ BitVec 32) (_ BitVec 64))) (size!15000 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30459)

(declare-datatypes ((ValueCell!6332 0))(
  ( (ValueCellFull!6332 (v!9012 V!18907)) (EmptyCell!6332) )
))
(declare-datatypes ((array!30461 0))(
  ( (array!30462 (arr!14649 (Array (_ BitVec 32) ValueCell!6332)) (size!15001 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30461)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2265 (array!30459 array!30461 (_ BitVec 32) (_ BitVec 32) V!18907 V!18907 (_ BitVec 32) Int) ListLongMap!7771)

(assert (=> b!473830 (= lt!215510 (getCurrentListMap!2265 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!215505 () ListLongMap!7771)

(assert (=> b!473830 (= lt!215505 (getCurrentListMap!2265 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21742 () Bool)

(declare-fun mapRes!21742 () Bool)

(declare-fun tp!41805 () Bool)

(declare-fun e!278021 () Bool)

(assert (=> mapNonEmpty!21742 (= mapRes!21742 (and tp!41805 e!278021))))

(declare-fun mapKey!21742 () (_ BitVec 32))

(declare-fun mapRest!21742 () (Array (_ BitVec 32) ValueCell!6332))

(declare-fun mapValue!21742 () ValueCell!6332)

(assert (=> mapNonEmpty!21742 (= (arr!14649 _values!833) (store mapRest!21742 mapKey!21742 mapValue!21742))))

(declare-fun b!473831 () Bool)

(declare-fun e!278026 () Bool)

(declare-fun e!278024 () Bool)

(assert (=> b!473831 (= e!278026 (and e!278024 mapRes!21742))))

(declare-fun condMapEmpty!21742 () Bool)

(declare-fun mapDefault!21742 () ValueCell!6332)

