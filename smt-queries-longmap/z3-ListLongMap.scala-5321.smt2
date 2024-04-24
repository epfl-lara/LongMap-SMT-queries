; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71332 () Bool)

(assert start!71332)

(declare-fun b_free!13333 () Bool)

(declare-fun b_next!13333 () Bool)

(assert (=> start!71332 (= b_free!13333 (not b_next!13333))))

(declare-fun tp!46758 () Bool)

(declare-fun b_and!22269 () Bool)

(assert (=> start!71332 (= tp!46758 b_and!22269)))

(declare-fun b!827558 () Bool)

(declare-fun res!563865 () Bool)

(declare-fun e!460962 () Bool)

(assert (=> b!827558 (=> (not res!563865) (not e!460962))))

(declare-datatypes ((array!46265 0))(
  ( (array!46266 (arr!22173 (Array (_ BitVec 32) (_ BitVec 64))) (size!22593 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46265)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25059 0))(
  ( (V!25060 (val!7569 Int)) )
))
(declare-datatypes ((ValueCell!7106 0))(
  ( (ValueCellFull!7106 (v!10003 V!25059)) (EmptyCell!7106) )
))
(declare-datatypes ((array!46267 0))(
  ( (array!46268 (arr!22174 (Array (_ BitVec 32) ValueCell!7106)) (size!22594 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46267)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827558 (= res!563865 (and (= (size!22594 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22593 _keys!976) (size!22594 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827560 () Bool)

(declare-fun e!460964 () Bool)

(assert (=> b!827560 (= e!460962 (not e!460964))))

(declare-fun res!563862 () Bool)

(assert (=> b!827560 (=> res!563862 e!460964)))

(assert (=> b!827560 (= res!563862 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9954 0))(
  ( (tuple2!9955 (_1!4988 (_ BitVec 64)) (_2!4988 V!25059)) )
))
(declare-datatypes ((List!15731 0))(
  ( (Nil!15728) (Cons!15727 (h!16862 tuple2!9954) (t!22070 List!15731)) )
))
(declare-datatypes ((ListLongMap!8779 0))(
  ( (ListLongMap!8780 (toList!4405 List!15731)) )
))
(declare-fun lt!374631 () ListLongMap!8779)

(declare-fun lt!374638 () ListLongMap!8779)

(assert (=> b!827560 (= lt!374631 lt!374638)))

(declare-fun zeroValueBefore!34 () V!25059)

(declare-fun zeroValueAfter!34 () V!25059)

(declare-fun minValue!754 () V!25059)

(declare-datatypes ((Unit!28362 0))(
  ( (Unit!28363) )
))
(declare-fun lt!374644 () Unit!28362)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!571 (array!46265 array!46267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25059 V!25059 V!25059 V!25059 (_ BitVec 32) Int) Unit!28362)

(assert (=> b!827560 (= lt!374644 (lemmaNoChangeToArrayThenSameMapNoExtras!571 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2483 (array!46265 array!46267 (_ BitVec 32) (_ BitVec 32) V!25059 V!25059 (_ BitVec 32) Int) ListLongMap!8779)

(assert (=> b!827560 (= lt!374638 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827560 (= lt!374631 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827561 () Bool)

(declare-fun e!460960 () Bool)

(declare-fun tp_is_empty!15043 () Bool)

(assert (=> b!827561 (= e!460960 tp_is_empty!15043)))

(declare-fun b!827562 () Bool)

(declare-fun e!460961 () Bool)

(declare-fun mapRes!24190 () Bool)

(assert (=> b!827562 (= e!460961 (and e!460960 mapRes!24190))))

(declare-fun condMapEmpty!24190 () Bool)

(declare-fun mapDefault!24190 () ValueCell!7106)

(assert (=> b!827562 (= condMapEmpty!24190 (= (arr!22174 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7106)) mapDefault!24190)))))

(declare-fun mapNonEmpty!24190 () Bool)

(declare-fun tp!46759 () Bool)

(declare-fun e!460958 () Bool)

(assert (=> mapNonEmpty!24190 (= mapRes!24190 (and tp!46759 e!460958))))

(declare-fun mapKey!24190 () (_ BitVec 32))

(declare-fun mapValue!24190 () ValueCell!7106)

(declare-fun mapRest!24190 () (Array (_ BitVec 32) ValueCell!7106))

(assert (=> mapNonEmpty!24190 (= (arr!22174 _values!788) (store mapRest!24190 mapKey!24190 mapValue!24190))))

(declare-fun lt!374635 () tuple2!9954)

(declare-fun e!460963 () Bool)

(declare-fun b!827563 () Bool)

(declare-fun lt!374632 () ListLongMap!8779)

(declare-fun +!1951 (ListLongMap!8779 tuple2!9954) ListLongMap!8779)

(assert (=> b!827563 (= e!460963 (= lt!374632 (+!1951 (+!1951 lt!374638 (tuple2!9955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374635)))))

(declare-fun mapIsEmpty!24190 () Bool)

(assert (=> mapIsEmpty!24190 mapRes!24190))

(declare-fun b!827559 () Bool)

(declare-fun res!563861 () Bool)

(assert (=> b!827559 (=> (not res!563861) (not e!460962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46265 (_ BitVec 32)) Bool)

(assert (=> b!827559 (= res!563861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563860 () Bool)

(assert (=> start!71332 (=> (not res!563860) (not e!460962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71332 (= res!563860 (validMask!0 mask!1312))))

(assert (=> start!71332 e!460962))

(assert (=> start!71332 tp_is_empty!15043))

(declare-fun array_inv!17713 (array!46265) Bool)

(assert (=> start!71332 (array_inv!17713 _keys!976)))

(assert (=> start!71332 true))

(declare-fun array_inv!17714 (array!46267) Bool)

(assert (=> start!71332 (and (array_inv!17714 _values!788) e!460961)))

(assert (=> start!71332 tp!46758))

(declare-fun lt!374641 () tuple2!9954)

(declare-fun e!460965 () Bool)

(declare-fun b!827564 () Bool)

(assert (=> b!827564 (= e!460965 (= lt!374632 (+!1951 (+!1951 lt!374638 lt!374635) lt!374641)))))

(declare-fun b!827565 () Bool)

(assert (=> b!827565 (= e!460958 tp_is_empty!15043)))

(declare-fun b!827566 () Bool)

(assert (=> b!827566 (= e!460964 true)))

(declare-fun lt!374642 () ListLongMap!8779)

(assert (=> b!827566 (= lt!374642 (+!1951 (+!1951 lt!374631 lt!374641) lt!374635))))

(declare-fun lt!374639 () ListLongMap!8779)

(declare-fun lt!374634 () ListLongMap!8779)

(assert (=> b!827566 (and (= lt!374639 lt!374634) (= lt!374632 lt!374634) (= lt!374632 lt!374639))))

(declare-fun lt!374640 () ListLongMap!8779)

(assert (=> b!827566 (= lt!374634 (+!1951 lt!374640 lt!374641))))

(declare-fun lt!374633 () ListLongMap!8779)

(assert (=> b!827566 (= lt!374639 (+!1951 lt!374633 lt!374641))))

(declare-fun lt!374637 () Unit!28362)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!235 (ListLongMap!8779 (_ BitVec 64) V!25059 V!25059) Unit!28362)

(assert (=> b!827566 (= lt!374637 (addSameAsAddTwiceSameKeyDiffValues!235 lt!374633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!827566 e!460965))

(declare-fun res!563863 () Bool)

(assert (=> b!827566 (=> (not res!563863) (not e!460965))))

(declare-fun lt!374643 () ListLongMap!8779)

(assert (=> b!827566 (= res!563863 (= lt!374643 lt!374640))))

(declare-fun lt!374636 () tuple2!9954)

(assert (=> b!827566 (= lt!374640 (+!1951 lt!374633 lt!374636))))

(assert (=> b!827566 (= lt!374633 (+!1951 lt!374631 lt!374635))))

(assert (=> b!827566 (= lt!374641 (tuple2!9955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!827566 e!460963))

(declare-fun res!563866 () Bool)

(assert (=> b!827566 (=> (not res!563866) (not e!460963))))

(assert (=> b!827566 (= res!563866 (= lt!374643 (+!1951 (+!1951 lt!374631 lt!374636) lt!374635)))))

(assert (=> b!827566 (= lt!374635 (tuple2!9955 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!827566 (= lt!374636 (tuple2!9955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2526 (array!46265 array!46267 (_ BitVec 32) (_ BitVec 32) V!25059 V!25059 (_ BitVec 32) Int) ListLongMap!8779)

(assert (=> b!827566 (= lt!374632 (getCurrentListMap!2526 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827566 (= lt!374643 (getCurrentListMap!2526 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827567 () Bool)

(declare-fun res!563864 () Bool)

(assert (=> b!827567 (=> (not res!563864) (not e!460962))))

(declare-datatypes ((List!15732 0))(
  ( (Nil!15729) (Cons!15728 (h!16863 (_ BitVec 64)) (t!22071 List!15732)) )
))
(declare-fun arrayNoDuplicates!0 (array!46265 (_ BitVec 32) List!15732) Bool)

(assert (=> b!827567 (= res!563864 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15729))))

(assert (= (and start!71332 res!563860) b!827558))

(assert (= (and b!827558 res!563865) b!827559))

(assert (= (and b!827559 res!563861) b!827567))

(assert (= (and b!827567 res!563864) b!827560))

(assert (= (and b!827560 (not res!563862)) b!827566))

(assert (= (and b!827566 res!563866) b!827563))

(assert (= (and b!827566 res!563863) b!827564))

(assert (= (and b!827562 condMapEmpty!24190) mapIsEmpty!24190))

(assert (= (and b!827562 (not condMapEmpty!24190)) mapNonEmpty!24190))

(get-info :version)

(assert (= (and mapNonEmpty!24190 ((_ is ValueCellFull!7106) mapValue!24190)) b!827565))

(assert (= (and b!827562 ((_ is ValueCellFull!7106) mapDefault!24190)) b!827561))

(assert (= start!71332 b!827562))

(declare-fun m!770821 () Bool)

(assert (=> mapNonEmpty!24190 m!770821))

(declare-fun m!770823 () Bool)

(assert (=> b!827567 m!770823))

(declare-fun m!770825 () Bool)

(assert (=> b!827566 m!770825))

(declare-fun m!770827 () Bool)

(assert (=> b!827566 m!770827))

(declare-fun m!770829 () Bool)

(assert (=> b!827566 m!770829))

(declare-fun m!770831 () Bool)

(assert (=> b!827566 m!770831))

(declare-fun m!770833 () Bool)

(assert (=> b!827566 m!770833))

(declare-fun m!770835 () Bool)

(assert (=> b!827566 m!770835))

(declare-fun m!770837 () Bool)

(assert (=> b!827566 m!770837))

(declare-fun m!770839 () Bool)

(assert (=> b!827566 m!770839))

(assert (=> b!827566 m!770833))

(declare-fun m!770841 () Bool)

(assert (=> b!827566 m!770841))

(declare-fun m!770843 () Bool)

(assert (=> b!827566 m!770843))

(assert (=> b!827566 m!770825))

(declare-fun m!770845 () Bool)

(assert (=> b!827566 m!770845))

(declare-fun m!770847 () Bool)

(assert (=> b!827560 m!770847))

(declare-fun m!770849 () Bool)

(assert (=> b!827560 m!770849))

(declare-fun m!770851 () Bool)

(assert (=> b!827560 m!770851))

(declare-fun m!770853 () Bool)

(assert (=> b!827563 m!770853))

(assert (=> b!827563 m!770853))

(declare-fun m!770855 () Bool)

(assert (=> b!827563 m!770855))

(declare-fun m!770857 () Bool)

(assert (=> start!71332 m!770857))

(declare-fun m!770859 () Bool)

(assert (=> start!71332 m!770859))

(declare-fun m!770861 () Bool)

(assert (=> start!71332 m!770861))

(declare-fun m!770863 () Bool)

(assert (=> b!827559 m!770863))

(declare-fun m!770865 () Bool)

(assert (=> b!827564 m!770865))

(assert (=> b!827564 m!770865))

(declare-fun m!770867 () Bool)

(assert (=> b!827564 m!770867))

(check-sat (not b_next!13333) b_and!22269 (not b!827567) (not start!71332) (not b!827566) (not b!827564) (not b!827559) (not b!827563) (not b!827560) (not mapNonEmpty!24190) tp_is_empty!15043)
(check-sat b_and!22269 (not b_next!13333))
