; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70992 () Bool)

(assert start!70992)

(declare-fun b_free!13195 () Bool)

(declare-fun b_next!13195 () Bool)

(assert (=> start!70992 (= b_free!13195 (not b_next!13195))))

(declare-fun tp!46339 () Bool)

(declare-fun b_and!22099 () Bool)

(assert (=> start!70992 (= tp!46339 b_and!22099)))

(declare-fun mapIsEmpty!23977 () Bool)

(declare-fun mapRes!23977 () Bool)

(assert (=> mapIsEmpty!23977 mapRes!23977))

(declare-fun b!824380 () Bool)

(declare-fun e!458643 () Bool)

(declare-fun e!458641 () Bool)

(assert (=> b!824380 (= e!458643 (not e!458641))))

(declare-fun res!562043 () Bool)

(assert (=> b!824380 (=> res!562043 e!458641)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824380 (= res!562043 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24875 0))(
  ( (V!24876 (val!7500 Int)) )
))
(declare-datatypes ((tuple2!9924 0))(
  ( (tuple2!9925 (_1!4973 (_ BitVec 64)) (_2!4973 V!24875)) )
))
(declare-datatypes ((List!15736 0))(
  ( (Nil!15733) (Cons!15732 (h!16861 tuple2!9924) (t!22079 List!15736)) )
))
(declare-datatypes ((ListLongMap!8747 0))(
  ( (ListLongMap!8748 (toList!4389 List!15736)) )
))
(declare-fun lt!371796 () ListLongMap!8747)

(declare-fun lt!371798 () ListLongMap!8747)

(assert (=> b!824380 (= lt!371796 lt!371798)))

(declare-datatypes ((Unit!28246 0))(
  ( (Unit!28247) )
))
(declare-fun lt!371795 () Unit!28246)

(declare-fun zeroValueBefore!34 () V!24875)

(declare-datatypes ((array!45998 0))(
  ( (array!45999 (arr!22046 (Array (_ BitVec 32) (_ BitVec 64))) (size!22467 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45998)

(declare-fun zeroValueAfter!34 () V!24875)

(declare-fun minValue!754 () V!24875)

(declare-datatypes ((ValueCell!7037 0))(
  ( (ValueCellFull!7037 (v!9933 V!24875)) (EmptyCell!7037) )
))
(declare-datatypes ((array!46000 0))(
  ( (array!46001 (arr!22047 (Array (_ BitVec 32) ValueCell!7037)) (size!22468 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46000)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!514 (array!45998 array!46000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24875 V!24875 V!24875 V!24875 (_ BitVec 32) Int) Unit!28246)

(assert (=> b!824380 (= lt!371795 (lemmaNoChangeToArrayThenSameMapNoExtras!514 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2404 (array!45998 array!46000 (_ BitVec 32) (_ BitVec 32) V!24875 V!24875 (_ BitVec 32) Int) ListLongMap!8747)

(assert (=> b!824380 (= lt!371798 (getCurrentListMapNoExtraKeys!2404 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824380 (= lt!371796 (getCurrentListMapNoExtraKeys!2404 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824381 () Bool)

(declare-fun e!458645 () Bool)

(declare-fun tp_is_empty!14905 () Bool)

(assert (=> b!824381 (= e!458645 tp_is_empty!14905)))

(declare-fun b!824382 () Bool)

(declare-fun res!562044 () Bool)

(assert (=> b!824382 (=> (not res!562044) (not e!458643))))

(assert (=> b!824382 (= res!562044 (and (= (size!22468 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22467 _keys!976) (size!22468 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824383 () Bool)

(assert (=> b!824383 (= e!458641 true)))

(declare-fun lt!371797 () ListLongMap!8747)

(declare-fun getCurrentListMap!2530 (array!45998 array!46000 (_ BitVec 32) (_ BitVec 32) V!24875 V!24875 (_ BitVec 32) Int) ListLongMap!8747)

(assert (=> b!824383 (= lt!371797 (getCurrentListMap!2530 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23977 () Bool)

(declare-fun tp!46338 () Bool)

(declare-fun e!458640 () Bool)

(assert (=> mapNonEmpty!23977 (= mapRes!23977 (and tp!46338 e!458640))))

(declare-fun mapKey!23977 () (_ BitVec 32))

(declare-fun mapRest!23977 () (Array (_ BitVec 32) ValueCell!7037))

(declare-fun mapValue!23977 () ValueCell!7037)

(assert (=> mapNonEmpty!23977 (= (arr!22047 _values!788) (store mapRest!23977 mapKey!23977 mapValue!23977))))

(declare-fun b!824384 () Bool)

(declare-fun res!562045 () Bool)

(assert (=> b!824384 (=> (not res!562045) (not e!458643))))

(declare-datatypes ((List!15737 0))(
  ( (Nil!15734) (Cons!15733 (h!16862 (_ BitVec 64)) (t!22080 List!15737)) )
))
(declare-fun arrayNoDuplicates!0 (array!45998 (_ BitVec 32) List!15737) Bool)

(assert (=> b!824384 (= res!562045 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15734))))

(declare-fun b!824386 () Bool)

(declare-fun res!562047 () Bool)

(assert (=> b!824386 (=> (not res!562047) (not e!458643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45998 (_ BitVec 32)) Bool)

(assert (=> b!824386 (= res!562047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824387 () Bool)

(assert (=> b!824387 (= e!458640 tp_is_empty!14905)))

(declare-fun b!824385 () Bool)

(declare-fun e!458642 () Bool)

(assert (=> b!824385 (= e!458642 (and e!458645 mapRes!23977))))

(declare-fun condMapEmpty!23977 () Bool)

(declare-fun mapDefault!23977 () ValueCell!7037)

