; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70242 () Bool)

(assert start!70242)

(declare-fun b_free!12635 () Bool)

(declare-fun b_next!12635 () Bool)

(assert (=> start!70242 (= b_free!12635 (not b_next!12635))))

(declare-fun tp!44626 () Bool)

(declare-fun b_and!21423 () Bool)

(assert (=> start!70242 (= tp!44626 b_and!21423)))

(declare-fun b!816063 () Bool)

(declare-fun e!452626 () Bool)

(assert (=> b!816063 (= e!452626 true)))

(declare-datatypes ((array!44890 0))(
  ( (array!44891 (arr!21503 (Array (_ BitVec 32) (_ BitVec 64))) (size!21924 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44890)

(declare-datatypes ((V!24127 0))(
  ( (V!24128 (val!7220 Int)) )
))
(declare-fun zeroValueAfter!34 () V!24127)

(declare-fun minValue!754 () V!24127)

(declare-datatypes ((ValueCell!6757 0))(
  ( (ValueCellFull!6757 (v!9647 V!24127)) (EmptyCell!6757) )
))
(declare-datatypes ((array!44892 0))(
  ( (array!44893 (arr!21504 (Array (_ BitVec 32) ValueCell!6757)) (size!21925 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44892)

(declare-datatypes ((tuple2!9480 0))(
  ( (tuple2!9481 (_1!4751 (_ BitVec 64)) (_2!4751 V!24127)) )
))
(declare-datatypes ((List!15310 0))(
  ( (Nil!15307) (Cons!15306 (h!16435 tuple2!9480) (t!21631 List!15310)) )
))
(declare-datatypes ((ListLongMap!8303 0))(
  ( (ListLongMap!8304 (toList!4167 List!15310)) )
))
(declare-fun lt!365432 () ListLongMap!8303)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun getCurrentListMap!2394 (array!44890 array!44892 (_ BitVec 32) (_ BitVec 32) V!24127 V!24127 (_ BitVec 32) Int) ListLongMap!8303)

(assert (=> b!816063 (= lt!365432 (getCurrentListMap!2394 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24127)

(declare-fun lt!365435 () ListLongMap!8303)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun +!1800 (ListLongMap!8303 tuple2!9480) ListLongMap!8303)

(assert (=> b!816063 (= lt!365435 (+!1800 (getCurrentListMap!2394 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9481 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun res!557203 () Bool)

(declare-fun e!452630 () Bool)

(assert (=> start!70242 (=> (not res!557203) (not e!452630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70242 (= res!557203 (validMask!0 mask!1312))))

(assert (=> start!70242 e!452630))

(declare-fun tp_is_empty!14345 () Bool)

(assert (=> start!70242 tp_is_empty!14345))

(declare-fun array_inv!17205 (array!44890) Bool)

(assert (=> start!70242 (array_inv!17205 _keys!976)))

(assert (=> start!70242 true))

(declare-fun e!452629 () Bool)

(declare-fun array_inv!17206 (array!44892) Bool)

(assert (=> start!70242 (and (array_inv!17206 _values!788) e!452629)))

(assert (=> start!70242 tp!44626))

(declare-fun b!816064 () Bool)

(assert (=> b!816064 (= e!452630 (not e!452626))))

(declare-fun res!557200 () Bool)

(assert (=> b!816064 (=> res!557200 e!452626)))

(assert (=> b!816064 (= res!557200 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365434 () ListLongMap!8303)

(declare-fun lt!365431 () ListLongMap!8303)

(assert (=> b!816064 (= lt!365434 lt!365431)))

(declare-datatypes ((Unit!27822 0))(
  ( (Unit!27823) )
))
(declare-fun lt!365433 () Unit!27822)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!322 (array!44890 array!44892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24127 V!24127 V!24127 V!24127 (_ BitVec 32) Int) Unit!27822)

(assert (=> b!816064 (= lt!365433 (lemmaNoChangeToArrayThenSameMapNoExtras!322 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2212 (array!44890 array!44892 (_ BitVec 32) (_ BitVec 32) V!24127 V!24127 (_ BitVec 32) Int) ListLongMap!8303)

(assert (=> b!816064 (= lt!365431 (getCurrentListMapNoExtraKeys!2212 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816064 (= lt!365434 (getCurrentListMapNoExtraKeys!2212 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23104 () Bool)

(declare-fun mapRes!23104 () Bool)

(declare-fun tp!44625 () Bool)

(declare-fun e!452625 () Bool)

(assert (=> mapNonEmpty!23104 (= mapRes!23104 (and tp!44625 e!452625))))

(declare-fun mapKey!23104 () (_ BitVec 32))

(declare-fun mapRest!23104 () (Array (_ BitVec 32) ValueCell!6757))

(declare-fun mapValue!23104 () ValueCell!6757)

(assert (=> mapNonEmpty!23104 (= (arr!21504 _values!788) (store mapRest!23104 mapKey!23104 mapValue!23104))))

(declare-fun b!816065 () Bool)

(declare-fun res!557204 () Bool)

(assert (=> b!816065 (=> (not res!557204) (not e!452630))))

(declare-datatypes ((List!15311 0))(
  ( (Nil!15308) (Cons!15307 (h!16436 (_ BitVec 64)) (t!21632 List!15311)) )
))
(declare-fun arrayNoDuplicates!0 (array!44890 (_ BitVec 32) List!15311) Bool)

(assert (=> b!816065 (= res!557204 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15308))))

(declare-fun b!816066 () Bool)

(declare-fun res!557201 () Bool)

(assert (=> b!816066 (=> (not res!557201) (not e!452630))))

(assert (=> b!816066 (= res!557201 (and (= (size!21925 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21924 _keys!976) (size!21925 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816067 () Bool)

(assert (=> b!816067 (= e!452625 tp_is_empty!14345)))

(declare-fun b!816068 () Bool)

(declare-fun res!557202 () Bool)

(assert (=> b!816068 (=> (not res!557202) (not e!452630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44890 (_ BitVec 32)) Bool)

(assert (=> b!816068 (= res!557202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816069 () Bool)

(declare-fun e!452627 () Bool)

(assert (=> b!816069 (= e!452629 (and e!452627 mapRes!23104))))

(declare-fun condMapEmpty!23104 () Bool)

(declare-fun mapDefault!23104 () ValueCell!6757)

