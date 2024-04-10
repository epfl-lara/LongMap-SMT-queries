; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42478 () Bool)

(assert start!42478)

(declare-fun b_free!11933 () Bool)

(declare-fun b_next!11933 () Bool)

(assert (=> start!42478 (= b_free!11933 (not b_next!11933))))

(declare-fun tp!41835 () Bool)

(declare-fun b_and!20401 () Bool)

(assert (=> start!42478 (= tp!41835 b_and!20401)))

(declare-fun b!473949 () Bool)

(declare-fun e!278113 () Bool)

(declare-fun tp_is_empty!13361 () Bool)

(assert (=> b!473949 (= e!278113 tp_is_empty!13361)))

(declare-fun mapIsEmpty!21757 () Bool)

(declare-fun mapRes!21757 () Bool)

(assert (=> mapIsEmpty!21757 mapRes!21757))

(declare-fun mapNonEmpty!21757 () Bool)

(declare-fun tp!41836 () Bool)

(declare-fun e!278116 () Bool)

(assert (=> mapNonEmpty!21757 (= mapRes!21757 (and tp!41836 e!278116))))

(declare-fun mapKey!21757 () (_ BitVec 32))

(declare-datatypes ((V!18919 0))(
  ( (V!18920 (val!6725 Int)) )
))
(declare-datatypes ((ValueCell!6337 0))(
  ( (ValueCellFull!6337 (v!9017 V!18919)) (EmptyCell!6337) )
))
(declare-datatypes ((array!30477 0))(
  ( (array!30478 (arr!14657 (Array (_ BitVec 32) ValueCell!6337)) (size!15009 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30477)

(declare-fun mapRest!21757 () (Array (_ BitVec 32) ValueCell!6337))

(declare-fun mapValue!21757 () ValueCell!6337)

(assert (=> mapNonEmpty!21757 (= (arr!14657 _values!833) (store mapRest!21757 mapKey!21757 mapValue!21757))))

(declare-fun b!473950 () Bool)

(declare-fun res!283084 () Bool)

(declare-fun e!278111 () Bool)

(assert (=> b!473950 (=> (not res!283084) (not e!278111))))

(declare-datatypes ((array!30479 0))(
  ( (array!30480 (arr!14658 (Array (_ BitVec 32) (_ BitVec 64))) (size!15010 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30479)

(declare-datatypes ((List!8945 0))(
  ( (Nil!8942) (Cons!8941 (h!9797 (_ BitVec 64)) (t!14917 List!8945)) )
))
(declare-fun arrayNoDuplicates!0 (array!30479 (_ BitVec 32) List!8945) Bool)

(assert (=> b!473950 (= res!283084 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8942))))

(declare-fun b!473951 () Bool)

(declare-fun e!278115 () Bool)

(assert (=> b!473951 (= e!278111 (not e!278115))))

(declare-fun res!283081 () Bool)

(assert (=> b!473951 (=> res!283081 e!278115)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!473951 (= res!283081 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8866 0))(
  ( (tuple2!8867 (_1!4444 (_ BitVec 64)) (_2!4444 V!18919)) )
))
(declare-datatypes ((List!8946 0))(
  ( (Nil!8943) (Cons!8942 (h!9798 tuple2!8866) (t!14918 List!8946)) )
))
(declare-datatypes ((ListLongMap!7779 0))(
  ( (ListLongMap!7780 (toList!3905 List!8946)) )
))
(declare-fun lt!215624 () ListLongMap!7779)

(declare-fun lt!215625 () ListLongMap!7779)

(assert (=> b!473951 (= lt!215624 lt!215625)))

(declare-fun minValueBefore!38 () V!18919)

(declare-fun zeroValue!794 () V!18919)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13968 0))(
  ( (Unit!13969) )
))
(declare-fun lt!215627 () Unit!13968)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18919)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!244 (array!30479 array!30477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18919 V!18919 V!18919 V!18919 (_ BitVec 32) Int) Unit!13968)

(assert (=> b!473951 (= lt!215627 (lemmaNoChangeToArrayThenSameMapNoExtras!244 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2064 (array!30479 array!30477 (_ BitVec 32) (_ BitVec 32) V!18919 V!18919 (_ BitVec 32) Int) ListLongMap!7779)

(assert (=> b!473951 (= lt!215625 (getCurrentListMapNoExtraKeys!2064 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473951 (= lt!215624 (getCurrentListMapNoExtraKeys!2064 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!283082 () Bool)

(assert (=> start!42478 (=> (not res!283082) (not e!278111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42478 (= res!283082 (validMask!0 mask!1365))))

(assert (=> start!42478 e!278111))

(assert (=> start!42478 tp_is_empty!13361))

(assert (=> start!42478 tp!41835))

(assert (=> start!42478 true))

(declare-fun array_inv!10574 (array!30479) Bool)

(assert (=> start!42478 (array_inv!10574 _keys!1025)))

(declare-fun e!278112 () Bool)

(declare-fun array_inv!10575 (array!30477) Bool)

(assert (=> start!42478 (and (array_inv!10575 _values!833) e!278112)))

(declare-fun b!473952 () Bool)

(declare-fun res!283083 () Bool)

(assert (=> b!473952 (=> (not res!283083) (not e!278111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30479 (_ BitVec 32)) Bool)

(assert (=> b!473952 (= res!283083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473953 () Bool)

(declare-fun res!283085 () Bool)

(assert (=> b!473953 (=> (not res!283085) (not e!278111))))

(assert (=> b!473953 (= res!283085 (and (= (size!15009 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15010 _keys!1025) (size!15009 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473954 () Bool)

(assert (=> b!473954 (= e!278115 true)))

(declare-fun lt!215628 () ListLongMap!7779)

(declare-fun lt!215630 () tuple2!8866)

(declare-fun +!1740 (ListLongMap!7779 tuple2!8866) ListLongMap!7779)

(assert (=> b!473954 (= (+!1740 lt!215628 lt!215630) (+!1740 (+!1740 lt!215628 (tuple2!8867 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215630))))

(assert (=> b!473954 (= lt!215630 (tuple2!8867 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215626 () Unit!13968)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!149 (ListLongMap!7779 (_ BitVec 64) V!18919 V!18919) Unit!13968)

(assert (=> b!473954 (= lt!215626 (addSameAsAddTwiceSameKeyDiffValues!149 lt!215628 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!473954 (= lt!215628 (+!1740 lt!215624 (tuple2!8867 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215629 () ListLongMap!7779)

(declare-fun getCurrentListMap!2269 (array!30479 array!30477 (_ BitVec 32) (_ BitVec 32) V!18919 V!18919 (_ BitVec 32) Int) ListLongMap!7779)

(assert (=> b!473954 (= lt!215629 (getCurrentListMap!2269 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215631 () ListLongMap!7779)

(assert (=> b!473954 (= lt!215631 (getCurrentListMap!2269 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473955 () Bool)

(assert (=> b!473955 (= e!278112 (and e!278113 mapRes!21757))))

(declare-fun condMapEmpty!21757 () Bool)

(declare-fun mapDefault!21757 () ValueCell!6337)

