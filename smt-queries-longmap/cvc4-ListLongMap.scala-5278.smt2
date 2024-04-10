; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70822 () Bool)

(assert start!70822)

(declare-fun b_free!13079 () Bool)

(declare-fun b_next!13079 () Bool)

(assert (=> start!70822 (= b_free!13079 (not b_next!13079))))

(declare-fun tp!45981 () Bool)

(declare-fun b_and!21951 () Bool)

(assert (=> start!70822 (= tp!45981 b_and!21951)))

(declare-fun b!822622 () Bool)

(declare-fun res!561068 () Bool)

(declare-fun e!457396 () Bool)

(assert (=> b!822622 (=> (not res!561068) (not e!457396))))

(declare-datatypes ((array!45770 0))(
  ( (array!45771 (arr!21935 (Array (_ BitVec 32) (_ BitVec 64))) (size!22356 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45770)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45770 (_ BitVec 32)) Bool)

(assert (=> b!822622 (= res!561068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822623 () Bool)

(declare-fun e!457401 () Bool)

(assert (=> b!822623 (= e!457396 (not e!457401))))

(declare-fun res!561065 () Bool)

(assert (=> b!822623 (=> res!561065 e!457401)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822623 (= res!561065 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24719 0))(
  ( (V!24720 (val!7442 Int)) )
))
(declare-datatypes ((tuple2!9830 0))(
  ( (tuple2!9831 (_1!4926 (_ BitVec 64)) (_2!4926 V!24719)) )
))
(declare-datatypes ((List!15646 0))(
  ( (Nil!15643) (Cons!15642 (h!16771 tuple2!9830) (t!21983 List!15646)) )
))
(declare-datatypes ((ListLongMap!8653 0))(
  ( (ListLongMap!8654 (toList!4342 List!15646)) )
))
(declare-fun lt!370346 () ListLongMap!8653)

(declare-fun lt!370341 () ListLongMap!8653)

(assert (=> b!822623 (= lt!370346 lt!370341)))

(declare-datatypes ((Unit!28148 0))(
  ( (Unit!28149) )
))
(declare-fun lt!370344 () Unit!28148)

(declare-fun zeroValueBefore!34 () V!24719)

(declare-fun zeroValueAfter!34 () V!24719)

(declare-fun minValue!754 () V!24719)

(declare-datatypes ((ValueCell!6979 0))(
  ( (ValueCellFull!6979 (v!9873 V!24719)) (EmptyCell!6979) )
))
(declare-datatypes ((array!45772 0))(
  ( (array!45773 (arr!21936 (Array (_ BitVec 32) ValueCell!6979)) (size!22357 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45772)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!471 (array!45770 array!45772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24719 V!24719 V!24719 V!24719 (_ BitVec 32) Int) Unit!28148)

(assert (=> b!822623 (= lt!370344 (lemmaNoChangeToArrayThenSameMapNoExtras!471 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2361 (array!45770 array!45772 (_ BitVec 32) (_ BitVec 32) V!24719 V!24719 (_ BitVec 32) Int) ListLongMap!8653)

(assert (=> b!822623 (= lt!370341 (getCurrentListMapNoExtraKeys!2361 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822623 (= lt!370346 (getCurrentListMapNoExtraKeys!2361 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822624 () Bool)

(declare-fun res!561067 () Bool)

(assert (=> b!822624 (=> (not res!561067) (not e!457396))))

(declare-datatypes ((List!15647 0))(
  ( (Nil!15644) (Cons!15643 (h!16772 (_ BitVec 64)) (t!21984 List!15647)) )
))
(declare-fun arrayNoDuplicates!0 (array!45770 (_ BitVec 32) List!15647) Bool)

(assert (=> b!822624 (= res!561067 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15644))))

(declare-fun b!822625 () Bool)

(declare-fun res!561069 () Bool)

(assert (=> b!822625 (=> (not res!561069) (not e!457396))))

(assert (=> b!822625 (= res!561069 (and (= (size!22357 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22356 _keys!976) (size!22357 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822626 () Bool)

(assert (=> b!822626 (= e!457401 (bvsle #b00000000000000000000000000000000 (size!22356 _keys!976)))))

(declare-fun lt!370338 () ListLongMap!8653)

(declare-fun lt!370340 () ListLongMap!8653)

(declare-fun lt!370345 () tuple2!9830)

(declare-fun +!1892 (ListLongMap!8653 tuple2!9830) ListLongMap!8653)

(assert (=> b!822626 (= lt!370338 (+!1892 lt!370340 lt!370345))))

(declare-fun lt!370347 () Unit!28148)

(declare-fun addCommutativeForDiffKeys!455 (ListLongMap!8653 (_ BitVec 64) V!24719 (_ BitVec 64) V!24719) Unit!28148)

(assert (=> b!822626 (= lt!370347 (addCommutativeForDiffKeys!455 lt!370346 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370342 () ListLongMap!8653)

(assert (=> b!822626 (= lt!370342 lt!370338)))

(declare-fun lt!370343 () tuple2!9830)

(assert (=> b!822626 (= lt!370338 (+!1892 (+!1892 lt!370346 lt!370345) lt!370343))))

(assert (=> b!822626 (= lt!370345 (tuple2!9831 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370339 () ListLongMap!8653)

(assert (=> b!822626 (= lt!370339 lt!370340)))

(assert (=> b!822626 (= lt!370340 (+!1892 lt!370346 lt!370343))))

(assert (=> b!822626 (= lt!370343 (tuple2!9831 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2506 (array!45770 array!45772 (_ BitVec 32) (_ BitVec 32) V!24719 V!24719 (_ BitVec 32) Int) ListLongMap!8653)

(assert (=> b!822626 (= lt!370342 (getCurrentListMap!2506 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822626 (= lt!370339 (getCurrentListMap!2506 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23794 () Bool)

(declare-fun mapRes!23794 () Bool)

(declare-fun tp!45982 () Bool)

(declare-fun e!457397 () Bool)

(assert (=> mapNonEmpty!23794 (= mapRes!23794 (and tp!45982 e!457397))))

(declare-fun mapKey!23794 () (_ BitVec 32))

(declare-fun mapRest!23794 () (Array (_ BitVec 32) ValueCell!6979))

(declare-fun mapValue!23794 () ValueCell!6979)

(assert (=> mapNonEmpty!23794 (= (arr!21936 _values!788) (store mapRest!23794 mapKey!23794 mapValue!23794))))

(declare-fun b!822627 () Bool)

(declare-fun tp_is_empty!14789 () Bool)

(assert (=> b!822627 (= e!457397 tp_is_empty!14789)))

(declare-fun res!561066 () Bool)

(assert (=> start!70822 (=> (not res!561066) (not e!457396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70822 (= res!561066 (validMask!0 mask!1312))))

(assert (=> start!70822 e!457396))

(assert (=> start!70822 tp_is_empty!14789))

(declare-fun array_inv!17521 (array!45770) Bool)

(assert (=> start!70822 (array_inv!17521 _keys!976)))

(assert (=> start!70822 true))

(declare-fun e!457398 () Bool)

(declare-fun array_inv!17522 (array!45772) Bool)

(assert (=> start!70822 (and (array_inv!17522 _values!788) e!457398)))

(assert (=> start!70822 tp!45981))

(declare-fun b!822628 () Bool)

(declare-fun e!457399 () Bool)

(assert (=> b!822628 (= e!457399 tp_is_empty!14789)))

(declare-fun mapIsEmpty!23794 () Bool)

(assert (=> mapIsEmpty!23794 mapRes!23794))

(declare-fun b!822629 () Bool)

(assert (=> b!822629 (= e!457398 (and e!457399 mapRes!23794))))

(declare-fun condMapEmpty!23794 () Bool)

(declare-fun mapDefault!23794 () ValueCell!6979)

