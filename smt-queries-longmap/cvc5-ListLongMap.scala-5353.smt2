; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71692 () Bool)

(assert start!71692)

(declare-fun b_free!13525 () Bool)

(declare-fun b_next!13525 () Bool)

(assert (=> start!71692 (= b_free!13525 (not b_next!13525))))

(declare-fun tp!47372 () Bool)

(declare-fun b_and!22611 () Bool)

(assert (=> start!71692 (= tp!47372 b_and!22611)))

(declare-fun b!833767 () Bool)

(declare-fun e!465154 () Bool)

(declare-fun tp_is_empty!15235 () Bool)

(assert (=> b!833767 (= e!465154 tp_is_empty!15235)))

(declare-fun b!833768 () Bool)

(declare-fun res!566947 () Bool)

(declare-fun e!465152 () Bool)

(assert (=> b!833768 (=> (not res!566947) (not e!465152))))

(declare-datatypes ((array!46644 0))(
  ( (array!46645 (arr!22356 (Array (_ BitVec 32) (_ BitVec 64))) (size!22777 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46644)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25315 0))(
  ( (V!25316 (val!7665 Int)) )
))
(declare-datatypes ((ValueCell!7202 0))(
  ( (ValueCellFull!7202 (v!10113 V!25315)) (EmptyCell!7202) )
))
(declare-datatypes ((array!46646 0))(
  ( (array!46647 (arr!22357 (Array (_ BitVec 32) ValueCell!7202)) (size!22778 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46646)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!833768 (= res!566947 (and (= (size!22778 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22777 _keys!976) (size!22778 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!833769 () Bool)

(declare-fun e!465153 () Bool)

(assert (=> b!833769 (= e!465153 tp_is_empty!15235)))

(declare-fun b!833770 () Bool)

(declare-fun e!465148 () Bool)

(declare-fun e!465149 () Bool)

(assert (=> b!833770 (= e!465148 e!465149)))

(declare-fun res!566945 () Bool)

(assert (=> b!833770 (=> res!566945 e!465149)))

(declare-datatypes ((tuple2!10178 0))(
  ( (tuple2!10179 (_1!5100 (_ BitVec 64)) (_2!5100 V!25315)) )
))
(declare-fun lt!378550 () tuple2!10178)

(declare-fun lt!378542 () tuple2!10178)

(declare-datatypes ((List!15968 0))(
  ( (Nil!15965) (Cons!15964 (h!17095 tuple2!10178) (t!22339 List!15968)) )
))
(declare-datatypes ((ListLongMap!9001 0))(
  ( (ListLongMap!9002 (toList!4516 List!15968)) )
))
(declare-fun lt!378552 () ListLongMap!9001)

(declare-fun lt!378551 () ListLongMap!9001)

(declare-fun +!1994 (ListLongMap!9001 tuple2!10178) ListLongMap!9001)

(assert (=> b!833770 (= res!566945 (not (= lt!378551 (+!1994 (+!1994 lt!378552 lt!378550) lt!378542))))))

(declare-fun lt!378543 () ListLongMap!9001)

(declare-fun lt!378547 () ListLongMap!9001)

(assert (=> b!833770 (and (= lt!378543 lt!378547) (= lt!378551 lt!378547) (= lt!378551 lt!378543))))

(declare-fun lt!378553 () ListLongMap!9001)

(assert (=> b!833770 (= lt!378547 (+!1994 lt!378553 lt!378550))))

(declare-fun lt!378545 () ListLongMap!9001)

(assert (=> b!833770 (= lt!378543 (+!1994 lt!378545 lt!378550))))

(declare-fun zeroValueAfter!34 () V!25315)

(declare-datatypes ((Unit!28575 0))(
  ( (Unit!28576) )
))
(declare-fun lt!378546 () Unit!28575)

(declare-fun zeroValueBefore!34 () V!25315)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!246 (ListLongMap!9001 (_ BitVec 64) V!25315 V!25315) Unit!28575)

(assert (=> b!833770 (= lt!378546 (addSameAsAddTwiceSameKeyDiffValues!246 lt!378545 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!465151 () Bool)

(assert (=> b!833770 e!465151))

(declare-fun res!566942 () Bool)

(assert (=> b!833770 (=> (not res!566942) (not e!465151))))

(declare-fun lt!378549 () ListLongMap!9001)

(assert (=> b!833770 (= res!566942 (= lt!378549 lt!378553))))

(declare-fun lt!378548 () tuple2!10178)

(assert (=> b!833770 (= lt!378553 (+!1994 lt!378545 lt!378548))))

(assert (=> b!833770 (= lt!378545 (+!1994 lt!378552 lt!378542))))

(assert (=> b!833770 (= lt!378550 (tuple2!10179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465156 () Bool)

(assert (=> b!833770 e!465156))

(declare-fun res!566946 () Bool)

(assert (=> b!833770 (=> (not res!566946) (not e!465156))))

(assert (=> b!833770 (= res!566946 (= lt!378549 (+!1994 (+!1994 lt!378552 lt!378548) lt!378542)))))

(declare-fun minValue!754 () V!25315)

(assert (=> b!833770 (= lt!378542 (tuple2!10179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833770 (= lt!378548 (tuple2!10179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2609 (array!46644 array!46646 (_ BitVec 32) (_ BitVec 32) V!25315 V!25315 (_ BitVec 32) Int) ListLongMap!9001)

(assert (=> b!833770 (= lt!378551 (getCurrentListMap!2609 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833770 (= lt!378549 (getCurrentListMap!2609 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24515 () Bool)

(declare-fun mapRes!24515 () Bool)

(declare-fun tp!47371 () Bool)

(assert (=> mapNonEmpty!24515 (= mapRes!24515 (and tp!47371 e!465153))))

(declare-fun mapKey!24515 () (_ BitVec 32))

(declare-fun mapValue!24515 () ValueCell!7202)

(declare-fun mapRest!24515 () (Array (_ BitVec 32) ValueCell!7202))

(assert (=> mapNonEmpty!24515 (= (arr!22357 _values!788) (store mapRest!24515 mapKey!24515 mapValue!24515))))

(declare-fun b!833771 () Bool)

(declare-fun e!465150 () Bool)

(assert (=> b!833771 (= e!465150 (and e!465154 mapRes!24515))))

(declare-fun condMapEmpty!24515 () Bool)

(declare-fun mapDefault!24515 () ValueCell!7202)

