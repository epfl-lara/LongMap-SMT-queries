; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70310 () Bool)

(assert start!70310)

(declare-fun b_free!12685 () Bool)

(declare-fun b_next!12685 () Bool)

(assert (=> start!70310 (= b_free!12685 (not b_next!12685))))

(declare-fun tp!44778 () Bool)

(declare-fun b_and!21485 () Bool)

(assert (=> start!70310 (= tp!44778 b_and!21485)))

(declare-fun b!816847 () Bool)

(declare-fun e!453189 () Bool)

(declare-fun e!453187 () Bool)

(assert (=> b!816847 (= e!453189 (not e!453187))))

(declare-fun res!557658 () Bool)

(assert (=> b!816847 (=> res!557658 e!453187)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816847 (= res!557658 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24195 0))(
  ( (V!24196 (val!7245 Int)) )
))
(declare-datatypes ((tuple2!9520 0))(
  ( (tuple2!9521 (_1!4771 (_ BitVec 64)) (_2!4771 V!24195)) )
))
(declare-datatypes ((List!15349 0))(
  ( (Nil!15346) (Cons!15345 (h!16474 tuple2!9520) (t!21672 List!15349)) )
))
(declare-datatypes ((ListLongMap!8343 0))(
  ( (ListLongMap!8344 (toList!4187 List!15349)) )
))
(declare-fun lt!365930 () ListLongMap!8343)

(declare-fun lt!365928 () ListLongMap!8343)

(assert (=> b!816847 (= lt!365930 lt!365928)))

(declare-fun zeroValueBefore!34 () V!24195)

(declare-datatypes ((array!44988 0))(
  ( (array!44989 (arr!21551 (Array (_ BitVec 32) (_ BitVec 64))) (size!21972 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44988)

(declare-fun zeroValueAfter!34 () V!24195)

(declare-fun minValue!754 () V!24195)

(declare-datatypes ((ValueCell!6782 0))(
  ( (ValueCellFull!6782 (v!9673 V!24195)) (EmptyCell!6782) )
))
(declare-datatypes ((array!44990 0))(
  ( (array!44991 (arr!21552 (Array (_ BitVec 32) ValueCell!6782)) (size!21973 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44990)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27858 0))(
  ( (Unit!27859) )
))
(declare-fun lt!365931 () Unit!27858)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!339 (array!44988 array!44990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24195 V!24195 V!24195 V!24195 (_ BitVec 32) Int) Unit!27858)

(assert (=> b!816847 (= lt!365931 (lemmaNoChangeToArrayThenSameMapNoExtras!339 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2229 (array!44988 array!44990 (_ BitVec 32) (_ BitVec 32) V!24195 V!24195 (_ BitVec 32) Int) ListLongMap!8343)

(assert (=> b!816847 (= lt!365928 (getCurrentListMapNoExtraKeys!2229 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816847 (= lt!365930 (getCurrentListMapNoExtraKeys!2229 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!557659 () Bool)

(assert (=> start!70310 (=> (not res!557659) (not e!453189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70310 (= res!557659 (validMask!0 mask!1312))))

(assert (=> start!70310 e!453189))

(declare-fun tp_is_empty!14395 () Bool)

(assert (=> start!70310 tp_is_empty!14395))

(declare-fun array_inv!17241 (array!44988) Bool)

(assert (=> start!70310 (array_inv!17241 _keys!976)))

(assert (=> start!70310 true))

(declare-fun e!453188 () Bool)

(declare-fun array_inv!17242 (array!44990) Bool)

(assert (=> start!70310 (and (array_inv!17242 _values!788) e!453188)))

(assert (=> start!70310 tp!44778))

(declare-fun b!816848 () Bool)

(declare-fun res!557657 () Bool)

(assert (=> b!816848 (=> (not res!557657) (not e!453189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44988 (_ BitVec 32)) Bool)

(assert (=> b!816848 (= res!557657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816849 () Bool)

(declare-fun e!453190 () Bool)

(assert (=> b!816849 (= e!453190 tp_is_empty!14395)))

(declare-fun b!816850 () Bool)

(declare-fun e!453186 () Bool)

(assert (=> b!816850 (= e!453186 tp_is_empty!14395)))

(declare-fun b!816851 () Bool)

(declare-fun mapRes!23182 () Bool)

(assert (=> b!816851 (= e!453188 (and e!453186 mapRes!23182))))

(declare-fun condMapEmpty!23182 () Bool)

(declare-fun mapDefault!23182 () ValueCell!6782)

