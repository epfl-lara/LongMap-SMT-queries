; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70922 () Bool)

(assert start!70922)

(declare-fun b_free!13139 () Bool)

(declare-fun b_next!13139 () Bool)

(assert (=> start!70922 (= b_free!13139 (not b_next!13139))))

(declare-fun tp!46168 () Bool)

(declare-fun b_and!22035 () Bool)

(assert (=> start!70922 (= tp!46168 b_and!22035)))

(declare-fun b!823696 () Bool)

(declare-fun e!458154 () Bool)

(assert (=> b!823696 (= e!458154 (not true))))

(declare-datatypes ((V!24799 0))(
  ( (V!24800 (val!7472 Int)) )
))
(declare-datatypes ((tuple2!9882 0))(
  ( (tuple2!9883 (_1!4952 (_ BitVec 64)) (_2!4952 V!24799)) )
))
(declare-datatypes ((List!15694 0))(
  ( (Nil!15691) (Cons!15690 (h!16819 tuple2!9882) (t!22035 List!15694)) )
))
(declare-datatypes ((ListLongMap!8705 0))(
  ( (ListLongMap!8706 (toList!4368 List!15694)) )
))
(declare-fun lt!371494 () ListLongMap!8705)

(declare-fun lt!371493 () ListLongMap!8705)

(assert (=> b!823696 (= lt!371494 lt!371493)))

(declare-fun zeroValueBefore!34 () V!24799)

(declare-datatypes ((array!45890 0))(
  ( (array!45891 (arr!21993 (Array (_ BitVec 32) (_ BitVec 64))) (size!22414 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45890)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24799)

(declare-fun minValue!754 () V!24799)

(declare-datatypes ((ValueCell!7009 0))(
  ( (ValueCellFull!7009 (v!9905 V!24799)) (EmptyCell!7009) )
))
(declare-datatypes ((array!45892 0))(
  ( (array!45893 (arr!21994 (Array (_ BitVec 32) ValueCell!7009)) (size!22415 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45892)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28204 0))(
  ( (Unit!28205) )
))
(declare-fun lt!371492 () Unit!28204)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!493 (array!45890 array!45892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24799 V!24799 V!24799 V!24799 (_ BitVec 32) Int) Unit!28204)

(assert (=> b!823696 (= lt!371492 (lemmaNoChangeToArrayThenSameMapNoExtras!493 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2383 (array!45890 array!45892 (_ BitVec 32) (_ BitVec 32) V!24799 V!24799 (_ BitVec 32) Int) ListLongMap!8705)

(assert (=> b!823696 (= lt!371493 (getCurrentListMapNoExtraKeys!2383 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823696 (= lt!371494 (getCurrentListMapNoExtraKeys!2383 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823697 () Bool)

(declare-fun e!458158 () Bool)

(declare-fun tp_is_empty!14849 () Bool)

(assert (=> b!823697 (= e!458158 tp_is_empty!14849)))

(declare-fun b!823698 () Bool)

(declare-fun res!561666 () Bool)

(assert (=> b!823698 (=> (not res!561666) (not e!458154))))

(assert (=> b!823698 (= res!561666 (and (= (size!22415 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22414 _keys!976) (size!22415 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23890 () Bool)

(declare-fun mapRes!23890 () Bool)

(declare-fun tp!46167 () Bool)

(assert (=> mapNonEmpty!23890 (= mapRes!23890 (and tp!46167 e!458158))))

(declare-fun mapValue!23890 () ValueCell!7009)

(declare-fun mapRest!23890 () (Array (_ BitVec 32) ValueCell!7009))

(declare-fun mapKey!23890 () (_ BitVec 32))

(assert (=> mapNonEmpty!23890 (= (arr!21994 _values!788) (store mapRest!23890 mapKey!23890 mapValue!23890))))

(declare-fun b!823699 () Bool)

(declare-fun e!458157 () Bool)

(assert (=> b!823699 (= e!458157 tp_is_empty!14849)))

(declare-fun b!823700 () Bool)

(declare-fun e!458156 () Bool)

(assert (=> b!823700 (= e!458156 (and e!458157 mapRes!23890))))

(declare-fun condMapEmpty!23890 () Bool)

(declare-fun mapDefault!23890 () ValueCell!7009)

