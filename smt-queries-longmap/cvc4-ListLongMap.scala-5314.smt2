; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71108 () Bool)

(assert start!71108)

(declare-fun b_free!13295 () Bool)

(declare-fun b_next!13295 () Bool)

(assert (=> start!71108 (= b_free!13295 (not b_next!13295))))

(declare-fun tp!46642 () Bool)

(declare-fun b_and!22209 () Bool)

(assert (=> start!71108 (= tp!46642 b_and!22209)))

(declare-datatypes ((V!25007 0))(
  ( (V!25008 (val!7550 Int)) )
))
(declare-datatypes ((tuple2!10000 0))(
  ( (tuple2!10001 (_1!5011 (_ BitVec 64)) (_2!5011 V!25007)) )
))
(declare-fun lt!373302 () tuple2!10000)

(declare-datatypes ((List!15800 0))(
  ( (Nil!15797) (Cons!15796 (h!16925 tuple2!10000) (t!22145 List!15800)) )
))
(declare-datatypes ((ListLongMap!8823 0))(
  ( (ListLongMap!8824 (toList!4427 List!15800)) )
))
(declare-fun lt!373298 () ListLongMap!8823)

(declare-fun e!459805 () Bool)

(declare-fun b!825896 () Bool)

(declare-fun lt!373294 () tuple2!10000)

(declare-fun lt!373296 () ListLongMap!8823)

(declare-fun +!1934 (ListLongMap!8823 tuple2!10000) ListLongMap!8823)

(assert (=> b!825896 (= e!459805 (= lt!373298 (+!1934 (+!1934 lt!373296 lt!373302) lt!373294)))))

(declare-fun b!825897 () Bool)

(declare-fun e!459806 () Bool)

(declare-fun e!459803 () Bool)

(assert (=> b!825897 (= e!459806 (not e!459803))))

(declare-fun res!563025 () Bool)

(assert (=> b!825897 (=> res!563025 e!459803)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825897 (= res!563025 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373299 () ListLongMap!8823)

(assert (=> b!825897 (= lt!373299 lt!373296)))

(declare-fun zeroValueBefore!34 () V!25007)

(declare-datatypes ((array!46192 0))(
  ( (array!46193 (arr!22142 (Array (_ BitVec 32) (_ BitVec 64))) (size!22563 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46192)

(declare-fun minValue!754 () V!25007)

(declare-datatypes ((ValueCell!7087 0))(
  ( (ValueCellFull!7087 (v!9983 V!25007)) (EmptyCell!7087) )
))
(declare-datatypes ((array!46194 0))(
  ( (array!46195 (arr!22143 (Array (_ BitVec 32) ValueCell!7087)) (size!22564 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46194)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28315 0))(
  ( (Unit!28316) )
))
(declare-fun lt!373295 () Unit!28315)

(declare-fun zeroValueAfter!34 () V!25007)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!546 (array!46192 array!46194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25007 V!25007 V!25007 V!25007 (_ BitVec 32) Int) Unit!28315)

(assert (=> b!825897 (= lt!373295 (lemmaNoChangeToArrayThenSameMapNoExtras!546 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2436 (array!46192 array!46194 (_ BitVec 32) (_ BitVec 32) V!25007 V!25007 (_ BitVec 32) Int) ListLongMap!8823)

(assert (=> b!825897 (= lt!373296 (getCurrentListMapNoExtraKeys!2436 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825897 (= lt!373299 (getCurrentListMapNoExtraKeys!2436 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825898 () Bool)

(declare-fun res!563026 () Bool)

(assert (=> b!825898 (=> (not res!563026) (not e!459806))))

(declare-datatypes ((List!15801 0))(
  ( (Nil!15798) (Cons!15797 (h!16926 (_ BitVec 64)) (t!22146 List!15801)) )
))
(declare-fun arrayNoDuplicates!0 (array!46192 (_ BitVec 32) List!15801) Bool)

(assert (=> b!825898 (= res!563026 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15798))))

(declare-fun res!563023 () Bool)

(assert (=> start!71108 (=> (not res!563023) (not e!459806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71108 (= res!563023 (validMask!0 mask!1312))))

(assert (=> start!71108 e!459806))

(declare-fun tp_is_empty!15005 () Bool)

(assert (=> start!71108 tp_is_empty!15005))

(declare-fun array_inv!17651 (array!46192) Bool)

(assert (=> start!71108 (array_inv!17651 _keys!976)))

(assert (=> start!71108 true))

(declare-fun e!459804 () Bool)

(declare-fun array_inv!17652 (array!46194) Bool)

(assert (=> start!71108 (and (array_inv!17652 _values!788) e!459804)))

(assert (=> start!71108 tp!46642))

(declare-fun b!825899 () Bool)

(declare-fun e!459810 () Bool)

(assert (=> b!825899 (= e!459810 (bvsle #b00000000000000000000000000000000 (size!22563 _keys!976)))))

(declare-fun b!825900 () Bool)

(declare-fun e!459809 () Bool)

(assert (=> b!825900 (= e!459809 (= lt!373298 (+!1934 (+!1934 lt!373296 (tuple2!10001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373302)))))

(declare-fun mapIsEmpty!24130 () Bool)

(declare-fun mapRes!24130 () Bool)

(assert (=> mapIsEmpty!24130 mapRes!24130))

(declare-fun b!825901 () Bool)

(assert (=> b!825901 (= e!459803 e!459810)))

(declare-fun res!563022 () Bool)

(assert (=> b!825901 (=> res!563022 e!459810)))

(assert (=> b!825901 (= res!563022 (not (= lt!373298 (+!1934 (+!1934 lt!373299 lt!373294) lt!373302))))))

(declare-fun lt!373304 () ListLongMap!8823)

(declare-fun lt!373305 () ListLongMap!8823)

(assert (=> b!825901 (and (= lt!373304 lt!373305) (= lt!373298 lt!373305) (= lt!373298 lt!373304))))

(declare-fun lt!373303 () ListLongMap!8823)

(assert (=> b!825901 (= lt!373305 (+!1934 lt!373303 lt!373294))))

(declare-fun lt!373301 () ListLongMap!8823)

(assert (=> b!825901 (= lt!373304 (+!1934 lt!373301 lt!373294))))

(declare-fun lt!373293 () Unit!28315)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!217 (ListLongMap!8823 (_ BitVec 64) V!25007 V!25007) Unit!28315)

(assert (=> b!825901 (= lt!373293 (addSameAsAddTwiceSameKeyDiffValues!217 lt!373301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!825901 e!459805))

(declare-fun res!563021 () Bool)

(assert (=> b!825901 (=> (not res!563021) (not e!459805))))

(declare-fun lt!373297 () ListLongMap!8823)

(assert (=> b!825901 (= res!563021 (= lt!373297 lt!373303))))

(declare-fun lt!373300 () tuple2!10000)

(assert (=> b!825901 (= lt!373303 (+!1934 lt!373301 lt!373300))))

(assert (=> b!825901 (= lt!373301 (+!1934 lt!373299 lt!373302))))

(assert (=> b!825901 (= lt!373294 (tuple2!10001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!825901 e!459809))

(declare-fun res!563020 () Bool)

(assert (=> b!825901 (=> (not res!563020) (not e!459809))))

(assert (=> b!825901 (= res!563020 (= lt!373297 (+!1934 (+!1934 lt!373299 lt!373300) lt!373302)))))

(assert (=> b!825901 (= lt!373302 (tuple2!10001 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825901 (= lt!373300 (tuple2!10001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2557 (array!46192 array!46194 (_ BitVec 32) (_ BitVec 32) V!25007 V!25007 (_ BitVec 32) Int) ListLongMap!8823)

(assert (=> b!825901 (= lt!373298 (getCurrentListMap!2557 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825901 (= lt!373297 (getCurrentListMap!2557 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825902 () Bool)

(declare-fun res!563024 () Bool)

(assert (=> b!825902 (=> (not res!563024) (not e!459806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46192 (_ BitVec 32)) Bool)

(assert (=> b!825902 (= res!563024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825903 () Bool)

(declare-fun res!563019 () Bool)

(assert (=> b!825903 (=> (not res!563019) (not e!459806))))

(assert (=> b!825903 (= res!563019 (and (= (size!22564 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22563 _keys!976) (size!22564 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!24130 () Bool)

(declare-fun tp!46641 () Bool)

(declare-fun e!459802 () Bool)

(assert (=> mapNonEmpty!24130 (= mapRes!24130 (and tp!46641 e!459802))))

(declare-fun mapValue!24130 () ValueCell!7087)

(declare-fun mapRest!24130 () (Array (_ BitVec 32) ValueCell!7087))

(declare-fun mapKey!24130 () (_ BitVec 32))

(assert (=> mapNonEmpty!24130 (= (arr!22143 _values!788) (store mapRest!24130 mapKey!24130 mapValue!24130))))

(declare-fun b!825904 () Bool)

(assert (=> b!825904 (= e!459802 tp_is_empty!15005)))

(declare-fun b!825905 () Bool)

(declare-fun e!459807 () Bool)

(assert (=> b!825905 (= e!459804 (and e!459807 mapRes!24130))))

(declare-fun condMapEmpty!24130 () Bool)

(declare-fun mapDefault!24130 () ValueCell!7087)

