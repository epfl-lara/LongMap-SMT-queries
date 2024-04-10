; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70880 () Bool)

(assert start!70880)

(declare-fun b_free!13117 () Bool)

(declare-fun b_next!13117 () Bool)

(assert (=> start!70880 (= b_free!13117 (not b_next!13117))))

(declare-fun tp!46098 () Bool)

(declare-fun b_and!22001 () Bool)

(assert (=> start!70880 (= tp!46098 b_and!22001)))

(declare-fun b!823259 () Bool)

(declare-fun e!457851 () Bool)

(declare-fun e!457854 () Bool)

(assert (=> b!823259 (= e!457851 (not e!457854))))

(declare-fun res!561429 () Bool)

(assert (=> b!823259 (=> res!561429 e!457854)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823259 (= res!561429 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24771 0))(
  ( (V!24772 (val!7461 Int)) )
))
(declare-datatypes ((tuple2!9866 0))(
  ( (tuple2!9867 (_1!4944 (_ BitVec 64)) (_2!4944 V!24771)) )
))
(declare-datatypes ((List!15679 0))(
  ( (Nil!15676) (Cons!15675 (h!16804 tuple2!9866) (t!22018 List!15679)) )
))
(declare-datatypes ((ListLongMap!8689 0))(
  ( (ListLongMap!8690 (toList!4360 List!15679)) )
))
(declare-fun lt!371071 () ListLongMap!8689)

(declare-fun lt!371067 () ListLongMap!8689)

(assert (=> b!823259 (= lt!371071 lt!371067)))

(declare-fun zeroValueBefore!34 () V!24771)

(declare-datatypes ((Unit!28186 0))(
  ( (Unit!28187) )
))
(declare-fun lt!371070 () Unit!28186)

(declare-datatypes ((array!45846 0))(
  ( (array!45847 (arr!21972 (Array (_ BitVec 32) (_ BitVec 64))) (size!22393 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45846)

(declare-fun zeroValueAfter!34 () V!24771)

(declare-fun minValue!754 () V!24771)

(declare-datatypes ((ValueCell!6998 0))(
  ( (ValueCellFull!6998 (v!9893 V!24771)) (EmptyCell!6998) )
))
(declare-datatypes ((array!45848 0))(
  ( (array!45849 (arr!21973 (Array (_ BitVec 32) ValueCell!6998)) (size!22394 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45848)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!485 (array!45846 array!45848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24771 V!24771 V!24771 V!24771 (_ BitVec 32) Int) Unit!28186)

(assert (=> b!823259 (= lt!371070 (lemmaNoChangeToArrayThenSameMapNoExtras!485 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2375 (array!45846 array!45848 (_ BitVec 32) (_ BitVec 32) V!24771 V!24771 (_ BitVec 32) Int) ListLongMap!8689)

(assert (=> b!823259 (= lt!371067 (getCurrentListMapNoExtraKeys!2375 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823259 (= lt!371071 (getCurrentListMapNoExtraKeys!2375 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823260 () Bool)

(declare-fun e!457853 () Bool)

(declare-fun tp_is_empty!14827 () Bool)

(assert (=> b!823260 (= e!457853 tp_is_empty!14827)))

(declare-fun b!823261 () Bool)

(declare-fun res!561433 () Bool)

(assert (=> b!823261 (=> (not res!561433) (not e!457851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45846 (_ BitVec 32)) Bool)

(assert (=> b!823261 (= res!561433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823262 () Bool)

(assert (=> b!823262 (= e!457854 true)))

(declare-fun lt!371068 () ListLongMap!8689)

(declare-fun lt!371065 () ListLongMap!8689)

(declare-fun lt!371069 () tuple2!9866)

(declare-fun +!1909 (ListLongMap!8689 tuple2!9866) ListLongMap!8689)

(assert (=> b!823262 (= lt!371068 (+!1909 lt!371065 lt!371069))))

(declare-fun lt!371072 () Unit!28186)

(declare-fun addCommutativeForDiffKeys!472 (ListLongMap!8689 (_ BitVec 64) V!24771 (_ BitVec 64) V!24771) Unit!28186)

(assert (=> b!823262 (= lt!371072 (addCommutativeForDiffKeys!472 lt!371071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371064 () ListLongMap!8689)

(assert (=> b!823262 (= lt!371064 lt!371068)))

(declare-fun lt!371063 () tuple2!9866)

(assert (=> b!823262 (= lt!371068 (+!1909 (+!1909 lt!371071 lt!371069) lt!371063))))

(assert (=> b!823262 (= lt!371069 (tuple2!9867 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371066 () ListLongMap!8689)

(assert (=> b!823262 (= lt!371066 lt!371065)))

(assert (=> b!823262 (= lt!371065 (+!1909 lt!371071 lt!371063))))

(assert (=> b!823262 (= lt!371063 (tuple2!9867 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2523 (array!45846 array!45848 (_ BitVec 32) (_ BitVec 32) V!24771 V!24771 (_ BitVec 32) Int) ListLongMap!8689)

(assert (=> b!823262 (= lt!371064 (getCurrentListMap!2523 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823262 (= lt!371066 (getCurrentListMap!2523 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823263 () Bool)

(declare-fun e!457852 () Bool)

(assert (=> b!823263 (= e!457852 tp_is_empty!14827)))

(declare-fun mapIsEmpty!23854 () Bool)

(declare-fun mapRes!23854 () Bool)

(assert (=> mapIsEmpty!23854 mapRes!23854))

(declare-fun b!823264 () Bool)

(declare-fun e!457856 () Bool)

(assert (=> b!823264 (= e!457856 (and e!457853 mapRes!23854))))

(declare-fun condMapEmpty!23854 () Bool)

(declare-fun mapDefault!23854 () ValueCell!6998)

