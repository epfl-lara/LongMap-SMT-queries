; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70788 () Bool)

(assert start!70788)

(declare-fun b_free!13045 () Bool)

(declare-fun b_next!13045 () Bool)

(assert (=> start!70788 (= b_free!13045 (not b_next!13045))))

(declare-fun tp!45880 () Bool)

(declare-fun b_and!21917 () Bool)

(assert (=> start!70788 (= tp!45880 b_and!21917)))

(declare-fun mapIsEmpty!23743 () Bool)

(declare-fun mapRes!23743 () Bool)

(assert (=> mapIsEmpty!23743 mapRes!23743))

(declare-fun b!822214 () Bool)

(declare-fun res!560812 () Bool)

(declare-fun e!457095 () Bool)

(assert (=> b!822214 (=> (not res!560812) (not e!457095))))

(declare-datatypes ((array!45704 0))(
  ( (array!45705 (arr!21902 (Array (_ BitVec 32) (_ BitVec 64))) (size!22323 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45704)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45704 (_ BitVec 32)) Bool)

(assert (=> b!822214 (= res!560812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560814 () Bool)

(assert (=> start!70788 (=> (not res!560814) (not e!457095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70788 (= res!560814 (validMask!0 mask!1312))))

(assert (=> start!70788 e!457095))

(declare-fun tp_is_empty!14755 () Bool)

(assert (=> start!70788 tp_is_empty!14755))

(declare-fun array_inv!17495 (array!45704) Bool)

(assert (=> start!70788 (array_inv!17495 _keys!976)))

(assert (=> start!70788 true))

(declare-datatypes ((V!24675 0))(
  ( (V!24676 (val!7425 Int)) )
))
(declare-datatypes ((ValueCell!6962 0))(
  ( (ValueCellFull!6962 (v!9856 V!24675)) (EmptyCell!6962) )
))
(declare-datatypes ((array!45706 0))(
  ( (array!45707 (arr!21903 (Array (_ BitVec 32) ValueCell!6962)) (size!22324 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45706)

(declare-fun e!457094 () Bool)

(declare-fun array_inv!17496 (array!45706) Bool)

(assert (=> start!70788 (and (array_inv!17496 _values!788) e!457094)))

(assert (=> start!70788 tp!45880))

(declare-fun b!822215 () Bool)

(declare-fun e!457091 () Bool)

(assert (=> b!822215 (= e!457095 (not e!457091))))

(declare-fun res!560810 () Bool)

(assert (=> b!822215 (=> res!560810 e!457091)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822215 (= res!560810 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9802 0))(
  ( (tuple2!9803 (_1!4912 (_ BitVec 64)) (_2!4912 V!24675)) )
))
(declare-datatypes ((List!15618 0))(
  ( (Nil!15615) (Cons!15614 (h!16743 tuple2!9802) (t!21955 List!15618)) )
))
(declare-datatypes ((ListLongMap!8625 0))(
  ( (ListLongMap!8626 (toList!4328 List!15618)) )
))
(declare-fun lt!369832 () ListLongMap!8625)

(declare-fun lt!369834 () ListLongMap!8625)

(assert (=> b!822215 (= lt!369832 lt!369834)))

(declare-fun zeroValueBefore!34 () V!24675)

(declare-datatypes ((Unit!28120 0))(
  ( (Unit!28121) )
))
(declare-fun lt!369836 () Unit!28120)

(declare-fun zeroValueAfter!34 () V!24675)

(declare-fun minValue!754 () V!24675)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!457 (array!45704 array!45706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24675 V!24675 V!24675 V!24675 (_ BitVec 32) Int) Unit!28120)

(assert (=> b!822215 (= lt!369836 (lemmaNoChangeToArrayThenSameMapNoExtras!457 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2347 (array!45704 array!45706 (_ BitVec 32) (_ BitVec 32) V!24675 V!24675 (_ BitVec 32) Int) ListLongMap!8625)

(assert (=> b!822215 (= lt!369834 (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822215 (= lt!369832 (getCurrentListMapNoExtraKeys!2347 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822216 () Bool)

(declare-fun e!457093 () Bool)

(assert (=> b!822216 (= e!457093 tp_is_empty!14755)))

(declare-fun mapNonEmpty!23743 () Bool)

(declare-fun tp!45879 () Bool)

(declare-fun e!457090 () Bool)

(assert (=> mapNonEmpty!23743 (= mapRes!23743 (and tp!45879 e!457090))))

(declare-fun mapRest!23743 () (Array (_ BitVec 32) ValueCell!6962))

(declare-fun mapKey!23743 () (_ BitVec 32))

(declare-fun mapValue!23743 () ValueCell!6962)

(assert (=> mapNonEmpty!23743 (= (arr!21903 _values!788) (store mapRest!23743 mapKey!23743 mapValue!23743))))

(declare-fun b!822217 () Bool)

(assert (=> b!822217 (= e!457090 tp_is_empty!14755)))

(declare-fun b!822218 () Bool)

(declare-fun res!560811 () Bool)

(assert (=> b!822218 (=> (not res!560811) (not e!457095))))

(declare-datatypes ((List!15619 0))(
  ( (Nil!15616) (Cons!15615 (h!16744 (_ BitVec 64)) (t!21956 List!15619)) )
))
(declare-fun arrayNoDuplicates!0 (array!45704 (_ BitVec 32) List!15619) Bool)

(assert (=> b!822218 (= res!560811 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15616))))

(declare-fun b!822219 () Bool)

(declare-fun res!560813 () Bool)

(assert (=> b!822219 (=> (not res!560813) (not e!457095))))

(assert (=> b!822219 (= res!560813 (and (= (size!22324 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22323 _keys!976) (size!22324 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822220 () Bool)

(assert (=> b!822220 (= e!457091 true)))

(declare-fun lt!369831 () ListLongMap!8625)

(declare-fun lt!369830 () ListLongMap!8625)

(declare-fun lt!369837 () tuple2!9802)

(declare-fun +!1879 (ListLongMap!8625 tuple2!9802) ListLongMap!8625)

(assert (=> b!822220 (= lt!369831 (+!1879 lt!369830 lt!369837))))

(declare-fun lt!369828 () Unit!28120)

(declare-fun addCommutativeForDiffKeys!442 (ListLongMap!8625 (_ BitVec 64) V!24675 (_ BitVec 64) V!24675) Unit!28120)

(assert (=> b!822220 (= lt!369828 (addCommutativeForDiffKeys!442 lt!369832 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369829 () ListLongMap!8625)

(assert (=> b!822220 (= lt!369829 lt!369831)))

(declare-fun lt!369833 () tuple2!9802)

(assert (=> b!822220 (= lt!369831 (+!1879 (+!1879 lt!369832 lt!369837) lt!369833))))

(assert (=> b!822220 (= lt!369837 (tuple2!9803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369835 () ListLongMap!8625)

(assert (=> b!822220 (= lt!369835 lt!369830)))

(assert (=> b!822220 (= lt!369830 (+!1879 lt!369832 lt!369833))))

(assert (=> b!822220 (= lt!369833 (tuple2!9803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2493 (array!45704 array!45706 (_ BitVec 32) (_ BitVec 32) V!24675 V!24675 (_ BitVec 32) Int) ListLongMap!8625)

(assert (=> b!822220 (= lt!369829 (getCurrentListMap!2493 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822220 (= lt!369835 (getCurrentListMap!2493 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822221 () Bool)

(assert (=> b!822221 (= e!457094 (and e!457093 mapRes!23743))))

(declare-fun condMapEmpty!23743 () Bool)

(declare-fun mapDefault!23743 () ValueCell!6962)

