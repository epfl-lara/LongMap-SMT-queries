; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70874 () Bool)

(assert start!70874)

(declare-fun b_free!13111 () Bool)

(declare-fun b_next!13111 () Bool)

(assert (=> start!70874 (= b_free!13111 (not b_next!13111))))

(declare-fun tp!46080 () Bool)

(declare-fun b_and!21995 () Bool)

(assert (=> start!70874 (= tp!46080 b_and!21995)))

(declare-fun b!823187 () Bool)

(declare-fun res!561384 () Bool)

(declare-fun e!457802 () Bool)

(assert (=> b!823187 (=> (not res!561384) (not e!457802))))

(declare-datatypes ((array!45834 0))(
  ( (array!45835 (arr!21966 (Array (_ BitVec 32) (_ BitVec 64))) (size!22387 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45834)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45834 (_ BitVec 32)) Bool)

(assert (=> b!823187 (= res!561384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823188 () Bool)

(declare-fun res!561385 () Bool)

(assert (=> b!823188 (=> (not res!561385) (not e!457802))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24763 0))(
  ( (V!24764 (val!7458 Int)) )
))
(declare-datatypes ((ValueCell!6995 0))(
  ( (ValueCellFull!6995 (v!9890 V!24763)) (EmptyCell!6995) )
))
(declare-datatypes ((array!45836 0))(
  ( (array!45837 (arr!21967 (Array (_ BitVec 32) ValueCell!6995)) (size!22388 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45836)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823188 (= res!561385 (and (= (size!22388 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22387 _keys!976) (size!22388 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823189 () Bool)

(declare-fun e!457800 () Bool)

(assert (=> b!823189 (= e!457802 (not e!457800))))

(declare-fun res!561387 () Bool)

(assert (=> b!823189 (=> res!561387 e!457800)))

(assert (=> b!823189 (= res!561387 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9860 0))(
  ( (tuple2!9861 (_1!4941 (_ BitVec 64)) (_2!4941 V!24763)) )
))
(declare-datatypes ((List!15673 0))(
  ( (Nil!15670) (Cons!15669 (h!16798 tuple2!9860) (t!22012 List!15673)) )
))
(declare-datatypes ((ListLongMap!8683 0))(
  ( (ListLongMap!8684 (toList!4357 List!15673)) )
))
(declare-fun lt!370978 () ListLongMap!8683)

(declare-fun lt!370980 () ListLongMap!8683)

(assert (=> b!823189 (= lt!370978 lt!370980)))

(declare-fun zeroValueBefore!34 () V!24763)

(declare-fun zeroValueAfter!34 () V!24763)

(declare-fun minValue!754 () V!24763)

(declare-datatypes ((Unit!28180 0))(
  ( (Unit!28181) )
))
(declare-fun lt!370974 () Unit!28180)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!482 (array!45834 array!45836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24763 V!24763 V!24763 V!24763 (_ BitVec 32) Int) Unit!28180)

(assert (=> b!823189 (= lt!370974 (lemmaNoChangeToArrayThenSameMapNoExtras!482 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2372 (array!45834 array!45836 (_ BitVec 32) (_ BitVec 32) V!24763 V!24763 (_ BitVec 32) Int) ListLongMap!8683)

(assert (=> b!823189 (= lt!370980 (getCurrentListMapNoExtraKeys!2372 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823189 (= lt!370978 (getCurrentListMapNoExtraKeys!2372 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823190 () Bool)

(assert (=> b!823190 (= e!457800 true)))

(declare-fun lt!370976 () ListLongMap!8683)

(declare-fun lt!370973 () ListLongMap!8683)

(declare-fun lt!370979 () tuple2!9860)

(declare-fun +!1906 (ListLongMap!8683 tuple2!9860) ListLongMap!8683)

(assert (=> b!823190 (= lt!370976 (+!1906 lt!370973 lt!370979))))

(declare-fun lt!370982 () Unit!28180)

(declare-fun addCommutativeForDiffKeys!469 (ListLongMap!8683 (_ BitVec 64) V!24763 (_ BitVec 64) V!24763) Unit!28180)

(assert (=> b!823190 (= lt!370982 (addCommutativeForDiffKeys!469 lt!370978 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370981 () ListLongMap!8683)

(assert (=> b!823190 (= lt!370981 lt!370976)))

(declare-fun lt!370975 () tuple2!9860)

(assert (=> b!823190 (= lt!370976 (+!1906 (+!1906 lt!370978 lt!370979) lt!370975))))

(assert (=> b!823190 (= lt!370979 (tuple2!9861 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370977 () ListLongMap!8683)

(assert (=> b!823190 (= lt!370977 lt!370973)))

(assert (=> b!823190 (= lt!370973 (+!1906 lt!370978 lt!370975))))

(assert (=> b!823190 (= lt!370975 (tuple2!9861 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2520 (array!45834 array!45836 (_ BitVec 32) (_ BitVec 32) V!24763 V!24763 (_ BitVec 32) Int) ListLongMap!8683)

(assert (=> b!823190 (= lt!370981 (getCurrentListMap!2520 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823190 (= lt!370977 (getCurrentListMap!2520 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561388 () Bool)

(assert (=> start!70874 (=> (not res!561388) (not e!457802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70874 (= res!561388 (validMask!0 mask!1312))))

(assert (=> start!70874 e!457802))

(declare-fun tp_is_empty!14821 () Bool)

(assert (=> start!70874 tp_is_empty!14821))

(declare-fun array_inv!17541 (array!45834) Bool)

(assert (=> start!70874 (array_inv!17541 _keys!976)))

(assert (=> start!70874 true))

(declare-fun e!457797 () Bool)

(declare-fun array_inv!17542 (array!45836) Bool)

(assert (=> start!70874 (and (array_inv!17542 _values!788) e!457797)))

(assert (=> start!70874 tp!46080))

(declare-fun mapNonEmpty!23845 () Bool)

(declare-fun mapRes!23845 () Bool)

(declare-fun tp!46081 () Bool)

(declare-fun e!457799 () Bool)

(assert (=> mapNonEmpty!23845 (= mapRes!23845 (and tp!46081 e!457799))))

(declare-fun mapValue!23845 () ValueCell!6995)

(declare-fun mapKey!23845 () (_ BitVec 32))

(declare-fun mapRest!23845 () (Array (_ BitVec 32) ValueCell!6995))

(assert (=> mapNonEmpty!23845 (= (arr!21967 _values!788) (store mapRest!23845 mapKey!23845 mapValue!23845))))

(declare-fun b!823191 () Bool)

(declare-fun res!561386 () Bool)

(assert (=> b!823191 (=> (not res!561386) (not e!457802))))

(declare-datatypes ((List!15674 0))(
  ( (Nil!15671) (Cons!15670 (h!16799 (_ BitVec 64)) (t!22013 List!15674)) )
))
(declare-fun arrayNoDuplicates!0 (array!45834 (_ BitVec 32) List!15674) Bool)

(assert (=> b!823191 (= res!561386 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15671))))

(declare-fun b!823192 () Bool)

(assert (=> b!823192 (= e!457799 tp_is_empty!14821)))

(declare-fun b!823193 () Bool)

(declare-fun e!457798 () Bool)

(assert (=> b!823193 (= e!457797 (and e!457798 mapRes!23845))))

(declare-fun condMapEmpty!23845 () Bool)

(declare-fun mapDefault!23845 () ValueCell!6995)

