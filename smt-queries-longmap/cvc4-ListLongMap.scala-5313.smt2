; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71102 () Bool)

(assert start!71102)

(declare-fun b_free!13289 () Bool)

(declare-fun b_next!13289 () Bool)

(assert (=> start!71102 (= b_free!13289 (not b_next!13289))))

(declare-fun tp!46623 () Bool)

(declare-fun b_and!22203 () Bool)

(assert (=> start!71102 (= tp!46623 b_and!22203)))

(declare-fun mapIsEmpty!24121 () Bool)

(declare-fun mapRes!24121 () Bool)

(assert (=> mapIsEmpty!24121 mapRes!24121))

(declare-fun b!825798 () Bool)

(declare-fun e!459725 () Bool)

(assert (=> b!825798 (= e!459725 true)))

(declare-datatypes ((V!24999 0))(
  ( (V!25000 (val!7547 Int)) )
))
(declare-datatypes ((tuple2!9994 0))(
  ( (tuple2!9995 (_1!5008 (_ BitVec 64)) (_2!5008 V!24999)) )
))
(declare-datatypes ((List!15795 0))(
  ( (Nil!15792) (Cons!15791 (h!16920 tuple2!9994) (t!22140 List!15795)) )
))
(declare-datatypes ((ListLongMap!8817 0))(
  ( (ListLongMap!8818 (toList!4424 List!15795)) )
))
(declare-fun lt!373178 () ListLongMap!8817)

(declare-fun lt!373183 () tuple2!9994)

(declare-fun lt!373188 () ListLongMap!8817)

(declare-fun lt!373187 () tuple2!9994)

(declare-fun +!1931 (ListLongMap!8817 tuple2!9994) ListLongMap!8817)

(assert (=> b!825798 (= lt!373188 (+!1931 (+!1931 lt!373178 lt!373183) lt!373187))))

(declare-fun lt!373182 () ListLongMap!8817)

(declare-fun lt!373186 () ListLongMap!8817)

(declare-fun lt!373184 () ListLongMap!8817)

(assert (=> b!825798 (and (= lt!373182 lt!373186) (= lt!373184 lt!373186) (= lt!373184 lt!373182))))

(declare-fun lt!373180 () ListLongMap!8817)

(assert (=> b!825798 (= lt!373186 (+!1931 lt!373180 lt!373183))))

(declare-fun lt!373175 () ListLongMap!8817)

(assert (=> b!825798 (= lt!373182 (+!1931 lt!373175 lt!373183))))

(declare-fun zeroValueBefore!34 () V!24999)

(declare-datatypes ((Unit!28309 0))(
  ( (Unit!28310) )
))
(declare-fun lt!373179 () Unit!28309)

(declare-fun zeroValueAfter!34 () V!24999)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!214 (ListLongMap!8817 (_ BitVec 64) V!24999 V!24999) Unit!28309)

(assert (=> b!825798 (= lt!373179 (addSameAsAddTwiceSameKeyDiffValues!214 lt!373175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459727 () Bool)

(assert (=> b!825798 e!459727))

(declare-fun res!562950 () Bool)

(assert (=> b!825798 (=> (not res!562950) (not e!459727))))

(declare-fun lt!373176 () ListLongMap!8817)

(assert (=> b!825798 (= res!562950 (= lt!373176 lt!373180))))

(declare-fun lt!373185 () tuple2!9994)

(assert (=> b!825798 (= lt!373180 (+!1931 lt!373175 lt!373185))))

(assert (=> b!825798 (= lt!373175 (+!1931 lt!373178 lt!373187))))

(assert (=> b!825798 (= lt!373183 (tuple2!9995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459728 () Bool)

(assert (=> b!825798 e!459728))

(declare-fun res!562951 () Bool)

(assert (=> b!825798 (=> (not res!562951) (not e!459728))))

(assert (=> b!825798 (= res!562951 (= lt!373176 (+!1931 (+!1931 lt!373178 lt!373185) lt!373187)))))

(declare-fun minValue!754 () V!24999)

(assert (=> b!825798 (= lt!373187 (tuple2!9995 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825798 (= lt!373185 (tuple2!9995 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46180 0))(
  ( (array!46181 (arr!22136 (Array (_ BitVec 32) (_ BitVec 64))) (size!22557 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46180)

(declare-datatypes ((ValueCell!7084 0))(
  ( (ValueCellFull!7084 (v!9980 V!24999)) (EmptyCell!7084) )
))
(declare-datatypes ((array!46182 0))(
  ( (array!46183 (arr!22137 (Array (_ BitVec 32) ValueCell!7084)) (size!22558 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46182)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2554 (array!46180 array!46182 (_ BitVec 32) (_ BitVec 32) V!24999 V!24999 (_ BitVec 32) Int) ListLongMap!8817)

(assert (=> b!825798 (= lt!373184 (getCurrentListMap!2554 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825798 (= lt!373176 (getCurrentListMap!2554 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825799 () Bool)

(declare-fun e!459722 () Bool)

(assert (=> b!825799 (= e!459722 (not e!459725))))

(declare-fun res!562953 () Bool)

(assert (=> b!825799 (=> res!562953 e!459725)))

(assert (=> b!825799 (= res!562953 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373181 () ListLongMap!8817)

(assert (=> b!825799 (= lt!373178 lt!373181)))

(declare-fun lt!373177 () Unit!28309)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!543 (array!46180 array!46182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24999 V!24999 V!24999 V!24999 (_ BitVec 32) Int) Unit!28309)

(assert (=> b!825799 (= lt!373177 (lemmaNoChangeToArrayThenSameMapNoExtras!543 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2433 (array!46180 array!46182 (_ BitVec 32) (_ BitVec 32) V!24999 V!24999 (_ BitVec 32) Int) ListLongMap!8817)

(assert (=> b!825799 (= lt!373181 (getCurrentListMapNoExtraKeys!2433 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825799 (= lt!373178 (getCurrentListMapNoExtraKeys!2433 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562949 () Bool)

(assert (=> start!71102 (=> (not res!562949) (not e!459722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71102 (= res!562949 (validMask!0 mask!1312))))

(assert (=> start!71102 e!459722))

(declare-fun tp_is_empty!14999 () Bool)

(assert (=> start!71102 tp_is_empty!14999))

(declare-fun array_inv!17647 (array!46180) Bool)

(assert (=> start!71102 (array_inv!17647 _keys!976)))

(assert (=> start!71102 true))

(declare-fun e!459724 () Bool)

(declare-fun array_inv!17648 (array!46182) Bool)

(assert (=> start!71102 (and (array_inv!17648 _values!788) e!459724)))

(assert (=> start!71102 tp!46623))

(declare-fun b!825800 () Bool)

(assert (=> b!825800 (= e!459727 (= lt!373184 (+!1931 (+!1931 lt!373181 lt!373187) lt!373183)))))

(declare-fun b!825801 () Bool)

(declare-fun e!459729 () Bool)

(assert (=> b!825801 (= e!459729 tp_is_empty!14999)))

(declare-fun mapNonEmpty!24121 () Bool)

(declare-fun tp!46624 () Bool)

(declare-fun e!459723 () Bool)

(assert (=> mapNonEmpty!24121 (= mapRes!24121 (and tp!46624 e!459723))))

(declare-fun mapValue!24121 () ValueCell!7084)

(declare-fun mapRest!24121 () (Array (_ BitVec 32) ValueCell!7084))

(declare-fun mapKey!24121 () (_ BitVec 32))

(assert (=> mapNonEmpty!24121 (= (arr!22137 _values!788) (store mapRest!24121 mapKey!24121 mapValue!24121))))

(declare-fun b!825802 () Bool)

(declare-fun res!562952 () Bool)

(assert (=> b!825802 (=> (not res!562952) (not e!459722))))

(declare-datatypes ((List!15796 0))(
  ( (Nil!15793) (Cons!15792 (h!16921 (_ BitVec 64)) (t!22141 List!15796)) )
))
(declare-fun arrayNoDuplicates!0 (array!46180 (_ BitVec 32) List!15796) Bool)

(assert (=> b!825802 (= res!562952 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15793))))

(declare-fun b!825803 () Bool)

(declare-fun res!562948 () Bool)

(assert (=> b!825803 (=> (not res!562948) (not e!459722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46180 (_ BitVec 32)) Bool)

(assert (=> b!825803 (= res!562948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825804 () Bool)

(assert (=> b!825804 (= e!459723 tp_is_empty!14999)))

(declare-fun b!825805 () Bool)

(assert (=> b!825805 (= e!459724 (and e!459729 mapRes!24121))))

(declare-fun condMapEmpty!24121 () Bool)

(declare-fun mapDefault!24121 () ValueCell!7084)

