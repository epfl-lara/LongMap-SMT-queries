; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70304 () Bool)

(assert start!70304)

(declare-fun b_free!12679 () Bool)

(declare-fun b_next!12679 () Bool)

(assert (=> start!70304 (= b_free!12679 (not b_next!12679))))

(declare-fun tp!44760 () Bool)

(declare-fun b_and!21479 () Bool)

(assert (=> start!70304 (= tp!44760 b_and!21479)))

(declare-fun b!816775 () Bool)

(declare-fun res!557614 () Bool)

(declare-fun e!453131 () Bool)

(assert (=> b!816775 (=> (not res!557614) (not e!453131))))

(declare-datatypes ((array!44976 0))(
  ( (array!44977 (arr!21545 (Array (_ BitVec 32) (_ BitVec 64))) (size!21966 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44976)

(declare-datatypes ((List!15344 0))(
  ( (Nil!15341) (Cons!15340 (h!16469 (_ BitVec 64)) (t!21667 List!15344)) )
))
(declare-fun arrayNoDuplicates!0 (array!44976 (_ BitVec 32) List!15344) Bool)

(assert (=> b!816775 (= res!557614 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15341))))

(declare-fun mapIsEmpty!23173 () Bool)

(declare-fun mapRes!23173 () Bool)

(assert (=> mapIsEmpty!23173 mapRes!23173))

(declare-fun b!816776 () Bool)

(declare-fun e!453133 () Bool)

(assert (=> b!816776 (= e!453133 true)))

(declare-datatypes ((V!24187 0))(
  ( (V!24188 (val!7242 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24187)

(declare-fun minValue!754 () V!24187)

(declare-datatypes ((ValueCell!6779 0))(
  ( (ValueCellFull!6779 (v!9670 V!24187)) (EmptyCell!6779) )
))
(declare-datatypes ((array!44978 0))(
  ( (array!44979 (arr!21546 (Array (_ BitVec 32) ValueCell!6779)) (size!21967 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44978)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9516 0))(
  ( (tuple2!9517 (_1!4769 (_ BitVec 64)) (_2!4769 V!24187)) )
))
(declare-datatypes ((List!15345 0))(
  ( (Nil!15342) (Cons!15341 (h!16470 tuple2!9516) (t!21668 List!15345)) )
))
(declare-datatypes ((ListLongMap!8339 0))(
  ( (ListLongMap!8340 (toList!4185 List!15345)) )
))
(declare-fun lt!365886 () ListLongMap!8339)

(declare-fun getCurrentListMap!2410 (array!44976 array!44978 (_ BitVec 32) (_ BitVec 32) V!24187 V!24187 (_ BitVec 32) Int) ListLongMap!8339)

(assert (=> b!816776 (= lt!365886 (getCurrentListMap!2410 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24187)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365883 () ListLongMap!8339)

(declare-fun +!1816 (ListLongMap!8339 tuple2!9516) ListLongMap!8339)

(assert (=> b!816776 (= lt!365883 (+!1816 (getCurrentListMap!2410 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816777 () Bool)

(assert (=> b!816777 (= e!453131 (not e!453133))))

(declare-fun res!557612 () Bool)

(assert (=> b!816777 (=> res!557612 e!453133)))

(assert (=> b!816777 (= res!557612 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365884 () ListLongMap!8339)

(declare-fun lt!365887 () ListLongMap!8339)

(assert (=> b!816777 (= lt!365884 lt!365887)))

(declare-datatypes ((Unit!27854 0))(
  ( (Unit!27855) )
))
(declare-fun lt!365885 () Unit!27854)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!337 (array!44976 array!44978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24187 V!24187 V!24187 V!24187 (_ BitVec 32) Int) Unit!27854)

(assert (=> b!816777 (= lt!365885 (lemmaNoChangeToArrayThenSameMapNoExtras!337 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2227 (array!44976 array!44978 (_ BitVec 32) (_ BitVec 32) V!24187 V!24187 (_ BitVec 32) Int) ListLongMap!8339)

(assert (=> b!816777 (= lt!365887 (getCurrentListMapNoExtraKeys!2227 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816777 (= lt!365884 (getCurrentListMapNoExtraKeys!2227 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816779 () Bool)

(declare-fun e!453132 () Bool)

(declare-fun tp_is_empty!14389 () Bool)

(assert (=> b!816779 (= e!453132 tp_is_empty!14389)))

(declare-fun b!816780 () Bool)

(declare-fun res!557613 () Bool)

(assert (=> b!816780 (=> (not res!557613) (not e!453131))))

(assert (=> b!816780 (= res!557613 (and (= (size!21967 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21966 _keys!976) (size!21967 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816781 () Bool)

(declare-fun e!453135 () Bool)

(declare-fun e!453134 () Bool)

(assert (=> b!816781 (= e!453135 (and e!453134 mapRes!23173))))

(declare-fun condMapEmpty!23173 () Bool)

(declare-fun mapDefault!23173 () ValueCell!6779)

