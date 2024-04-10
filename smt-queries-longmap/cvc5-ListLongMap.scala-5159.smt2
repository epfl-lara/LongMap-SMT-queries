; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69928 () Bool)

(assert start!69928)

(declare-fun b_free!12361 () Bool)

(declare-fun b_next!12361 () Bool)

(assert (=> start!69928 (= b_free!12361 (not b_next!12361))))

(declare-fun tp!43794 () Bool)

(declare-fun b_and!21129 () Bool)

(assert (=> start!69928 (= tp!43794 b_and!21129)))

(declare-fun b!812872 () Bool)

(declare-fun e!450342 () Bool)

(declare-fun tp_is_empty!14071 () Bool)

(assert (=> b!812872 (= e!450342 tp_is_empty!14071)))

(declare-fun mapNonEmpty!22684 () Bool)

(declare-fun mapRes!22684 () Bool)

(declare-fun tp!43795 () Bool)

(declare-fun e!450344 () Bool)

(assert (=> mapNonEmpty!22684 (= mapRes!22684 (and tp!43795 e!450344))))

(declare-datatypes ((V!23763 0))(
  ( (V!23764 (val!7083 Int)) )
))
(declare-datatypes ((ValueCell!6620 0))(
  ( (ValueCellFull!6620 (v!9510 V!23763)) (EmptyCell!6620) )
))
(declare-fun mapValue!22684 () ValueCell!6620)

(declare-datatypes ((array!44358 0))(
  ( (array!44359 (arr!21240 (Array (_ BitVec 32) ValueCell!6620)) (size!21661 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44358)

(declare-fun mapRest!22684 () (Array (_ BitVec 32) ValueCell!6620))

(declare-fun mapKey!22684 () (_ BitVec 32))

(assert (=> mapNonEmpty!22684 (= (arr!21240 _values!788) (store mapRest!22684 mapKey!22684 mapValue!22684))))

(declare-fun b!812873 () Bool)

(declare-fun e!450345 () Bool)

(assert (=> b!812873 (= e!450345 false)))

(declare-fun zeroValueBefore!34 () V!23763)

(declare-datatypes ((array!44360 0))(
  ( (array!44361 (arr!21241 (Array (_ BitVec 32) (_ BitVec 64))) (size!21662 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44360)

(declare-fun minValue!754 () V!23763)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((tuple2!9278 0))(
  ( (tuple2!9279 (_1!4650 (_ BitVec 64)) (_2!4650 V!23763)) )
))
(declare-datatypes ((List!15108 0))(
  ( (Nil!15105) (Cons!15104 (h!16233 tuple2!9278) (t!21423 List!15108)) )
))
(declare-datatypes ((ListLongMap!8101 0))(
  ( (ListLongMap!8102 (toList!4066 List!15108)) )
))
(declare-fun lt!364203 () ListLongMap!8101)

(declare-fun getCurrentListMapNoExtraKeys!2116 (array!44360 array!44358 (_ BitVec 32) (_ BitVec 32) V!23763 V!23763 (_ BitVec 32) Int) ListLongMap!8101)

(assert (=> b!812873 (= lt!364203 (getCurrentListMapNoExtraKeys!2116 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812874 () Bool)

(assert (=> b!812874 (= e!450344 tp_is_empty!14071)))

(declare-fun mapIsEmpty!22684 () Bool)

(assert (=> mapIsEmpty!22684 mapRes!22684))

(declare-fun b!812875 () Bool)

(declare-fun res!555396 () Bool)

(assert (=> b!812875 (=> (not res!555396) (not e!450345))))

(declare-datatypes ((List!15109 0))(
  ( (Nil!15106) (Cons!15105 (h!16234 (_ BitVec 64)) (t!21424 List!15109)) )
))
(declare-fun arrayNoDuplicates!0 (array!44360 (_ BitVec 32) List!15109) Bool)

(assert (=> b!812875 (= res!555396 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15106))))

(declare-fun b!812876 () Bool)

(declare-fun res!555397 () Bool)

(assert (=> b!812876 (=> (not res!555397) (not e!450345))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812876 (= res!555397 (and (= (size!21661 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21662 _keys!976) (size!21661 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812877 () Bool)

(declare-fun res!555399 () Bool)

(assert (=> b!812877 (=> (not res!555399) (not e!450345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44360 (_ BitVec 32)) Bool)

(assert (=> b!812877 (= res!555399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812878 () Bool)

(declare-fun e!450343 () Bool)

(assert (=> b!812878 (= e!450343 (and e!450342 mapRes!22684))))

(declare-fun condMapEmpty!22684 () Bool)

(declare-fun mapDefault!22684 () ValueCell!6620)

