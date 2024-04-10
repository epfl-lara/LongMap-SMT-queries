; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70770 () Bool)

(assert start!70770)

(declare-fun b_free!13027 () Bool)

(declare-fun b_next!13027 () Bool)

(assert (=> start!70770 (= b_free!13027 (not b_next!13027))))

(declare-fun tp!45826 () Bool)

(declare-fun b_and!21899 () Bool)

(assert (=> start!70770 (= tp!45826 b_and!21899)))

(declare-fun mapIsEmpty!23716 () Bool)

(declare-fun mapRes!23716 () Bool)

(assert (=> mapIsEmpty!23716 mapRes!23716))

(declare-fun b!821998 () Bool)

(declare-fun res!560676 () Bool)

(declare-fun e!456931 () Bool)

(assert (=> b!821998 (=> (not res!560676) (not e!456931))))

(declare-datatypes ((array!45670 0))(
  ( (array!45671 (arr!21885 (Array (_ BitVec 32) (_ BitVec 64))) (size!22306 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45670)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24651 0))(
  ( (V!24652 (val!7416 Int)) )
))
(declare-datatypes ((ValueCell!6953 0))(
  ( (ValueCellFull!6953 (v!9847 V!24651)) (EmptyCell!6953) )
))
(declare-datatypes ((array!45672 0))(
  ( (array!45673 (arr!21886 (Array (_ BitVec 32) ValueCell!6953)) (size!22307 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45672)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821998 (= res!560676 (and (= (size!22307 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22306 _keys!976) (size!22307 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23716 () Bool)

(declare-fun tp!45825 () Bool)

(declare-fun e!456933 () Bool)

(assert (=> mapNonEmpty!23716 (= mapRes!23716 (and tp!45825 e!456933))))

(declare-fun mapValue!23716 () ValueCell!6953)

(declare-fun mapRest!23716 () (Array (_ BitVec 32) ValueCell!6953))

(declare-fun mapKey!23716 () (_ BitVec 32))

(assert (=> mapNonEmpty!23716 (= (arr!21886 _values!788) (store mapRest!23716 mapKey!23716 mapValue!23716))))

(declare-fun b!821999 () Bool)

(declare-fun res!560677 () Bool)

(assert (=> b!821999 (=> (not res!560677) (not e!456931))))

(declare-datatypes ((List!15605 0))(
  ( (Nil!15602) (Cons!15601 (h!16730 (_ BitVec 64)) (t!21942 List!15605)) )
))
(declare-fun arrayNoDuplicates!0 (array!45670 (_ BitVec 32) List!15605) Bool)

(assert (=> b!821999 (= res!560677 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15602))))

(declare-fun b!822000 () Bool)

(declare-fun res!560679 () Bool)

(assert (=> b!822000 (=> (not res!560679) (not e!456931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45670 (_ BitVec 32)) Bool)

(assert (=> b!822000 (= res!560679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560675 () Bool)

(assert (=> start!70770 (=> (not res!560675) (not e!456931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70770 (= res!560675 (validMask!0 mask!1312))))

(assert (=> start!70770 e!456931))

(declare-fun tp_is_empty!14737 () Bool)

(assert (=> start!70770 tp_is_empty!14737))

(declare-fun array_inv!17481 (array!45670) Bool)

(assert (=> start!70770 (array_inv!17481 _keys!976)))

(assert (=> start!70770 true))

(declare-fun e!456932 () Bool)

(declare-fun array_inv!17482 (array!45672) Bool)

(assert (=> start!70770 (and (array_inv!17482 _values!788) e!456932)))

(assert (=> start!70770 tp!45826))

(declare-fun b!822001 () Bool)

(declare-fun e!456929 () Bool)

(assert (=> b!822001 (= e!456929 true)))

(declare-datatypes ((tuple2!9790 0))(
  ( (tuple2!9791 (_1!4906 (_ BitVec 64)) (_2!4906 V!24651)) )
))
(declare-datatypes ((List!15606 0))(
  ( (Nil!15603) (Cons!15602 (h!16731 tuple2!9790) (t!21943 List!15606)) )
))
(declare-datatypes ((ListLongMap!8613 0))(
  ( (ListLongMap!8614 (toList!4322 List!15606)) )
))
(declare-fun lt!369567 () ListLongMap!8613)

(declare-fun lt!369562 () ListLongMap!8613)

(declare-fun lt!369560 () tuple2!9790)

(declare-fun +!1874 (ListLongMap!8613 tuple2!9790) ListLongMap!8613)

(assert (=> b!822001 (= lt!369567 (+!1874 lt!369562 lt!369560))))

(declare-fun lt!369564 () ListLongMap!8613)

(declare-fun zeroValueAfter!34 () V!24651)

(declare-fun minValue!754 () V!24651)

(declare-datatypes ((Unit!28108 0))(
  ( (Unit!28109) )
))
(declare-fun lt!369563 () Unit!28108)

(declare-fun addCommutativeForDiffKeys!437 (ListLongMap!8613 (_ BitVec 64) V!24651 (_ BitVec 64) V!24651) Unit!28108)

(assert (=> b!822001 (= lt!369563 (addCommutativeForDiffKeys!437 lt!369564 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369559 () ListLongMap!8613)

(assert (=> b!822001 (= lt!369559 lt!369567)))

(declare-fun lt!369565 () tuple2!9790)

(assert (=> b!822001 (= lt!369567 (+!1874 (+!1874 lt!369564 lt!369560) lt!369565))))

(assert (=> b!822001 (= lt!369560 (tuple2!9791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369561 () ListLongMap!8613)

(assert (=> b!822001 (= lt!369561 lt!369562)))

(assert (=> b!822001 (= lt!369562 (+!1874 lt!369564 lt!369565))))

(assert (=> b!822001 (= lt!369565 (tuple2!9791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2488 (array!45670 array!45672 (_ BitVec 32) (_ BitVec 32) V!24651 V!24651 (_ BitVec 32) Int) ListLongMap!8613)

(assert (=> b!822001 (= lt!369559 (getCurrentListMap!2488 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24651)

(assert (=> b!822001 (= lt!369561 (getCurrentListMap!2488 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822002 () Bool)

(assert (=> b!822002 (= e!456933 tp_is_empty!14737)))

(declare-fun b!822003 () Bool)

(assert (=> b!822003 (= e!456931 (not e!456929))))

(declare-fun res!560678 () Bool)

(assert (=> b!822003 (=> res!560678 e!456929)))

(assert (=> b!822003 (= res!560678 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369558 () ListLongMap!8613)

(assert (=> b!822003 (= lt!369564 lt!369558)))

(declare-fun lt!369566 () Unit!28108)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!451 (array!45670 array!45672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24651 V!24651 V!24651 V!24651 (_ BitVec 32) Int) Unit!28108)

(assert (=> b!822003 (= lt!369566 (lemmaNoChangeToArrayThenSameMapNoExtras!451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2341 (array!45670 array!45672 (_ BitVec 32) (_ BitVec 32) V!24651 V!24651 (_ BitVec 32) Int) ListLongMap!8613)

(assert (=> b!822003 (= lt!369558 (getCurrentListMapNoExtraKeys!2341 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822003 (= lt!369564 (getCurrentListMapNoExtraKeys!2341 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822004 () Bool)

(declare-fun e!456930 () Bool)

(assert (=> b!822004 (= e!456932 (and e!456930 mapRes!23716))))

(declare-fun condMapEmpty!23716 () Bool)

(declare-fun mapDefault!23716 () ValueCell!6953)

