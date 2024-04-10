; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70094 () Bool)

(assert start!70094)

(declare-fun b_free!12515 () Bool)

(declare-fun b_next!12515 () Bool)

(assert (=> start!70094 (= b_free!12515 (not b_next!12515))))

(declare-fun tp!44260 () Bool)

(declare-fun b_and!21287 () Bool)

(assert (=> start!70094 (= tp!44260 b_and!21287)))

(declare-fun b!814562 () Bool)

(declare-fun res!556347 () Bool)

(declare-fun e!451548 () Bool)

(assert (=> b!814562 (=> (not res!556347) (not e!451548))))

(declare-datatypes ((array!44652 0))(
  ( (array!44653 (arr!21386 (Array (_ BitVec 32) (_ BitVec 64))) (size!21807 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44652)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44652 (_ BitVec 32)) Bool)

(assert (=> b!814562 (= res!556347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814563 () Bool)

(declare-fun res!556348 () Bool)

(assert (=> b!814563 (=> (not res!556348) (not e!451548))))

(declare-datatypes ((List!15217 0))(
  ( (Nil!15214) (Cons!15213 (h!16342 (_ BitVec 64)) (t!21534 List!15217)) )
))
(declare-fun arrayNoDuplicates!0 (array!44652 (_ BitVec 32) List!15217) Bool)

(assert (=> b!814563 (= res!556348 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15214))))

(declare-fun b!814564 () Bool)

(declare-fun res!556350 () Bool)

(assert (=> b!814564 (=> (not res!556350) (not e!451548))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23967 0))(
  ( (V!23968 (val!7160 Int)) )
))
(declare-datatypes ((ValueCell!6697 0))(
  ( (ValueCellFull!6697 (v!9587 V!23967)) (EmptyCell!6697) )
))
(declare-datatypes ((array!44654 0))(
  ( (array!44655 (arr!21387 (Array (_ BitVec 32) ValueCell!6697)) (size!21808 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44654)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814564 (= res!556350 (and (= (size!21808 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21807 _keys!976) (size!21808 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814566 () Bool)

(declare-fun e!451547 () Bool)

(declare-fun tp_is_empty!14225 () Bool)

(assert (=> b!814566 (= e!451547 tp_is_empty!14225)))

(declare-fun b!814567 () Bool)

(declare-fun e!451544 () Bool)

(assert (=> b!814567 (= e!451544 tp_is_empty!14225)))

(declare-fun b!814568 () Bool)

(assert (=> b!814568 (= e!451548 (not true))))

(declare-datatypes ((tuple2!9386 0))(
  ( (tuple2!9387 (_1!4704 (_ BitVec 64)) (_2!4704 V!23967)) )
))
(declare-datatypes ((List!15218 0))(
  ( (Nil!15215) (Cons!15214 (h!16343 tuple2!9386) (t!21535 List!15218)) )
))
(declare-datatypes ((ListLongMap!8209 0))(
  ( (ListLongMap!8210 (toList!4120 List!15218)) )
))
(declare-fun lt!364669 () ListLongMap!8209)

(declare-fun lt!364670 () ListLongMap!8209)

(assert (=> b!814568 (= lt!364669 lt!364670)))

(declare-fun zeroValueBefore!34 () V!23967)

(declare-fun zeroValueAfter!34 () V!23967)

(declare-fun minValue!754 () V!23967)

(declare-datatypes ((Unit!27738 0))(
  ( (Unit!27739) )
))
(declare-fun lt!364671 () Unit!27738)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!280 (array!44652 array!44654 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23967 V!23967 V!23967 V!23967 (_ BitVec 32) Int) Unit!27738)

(assert (=> b!814568 (= lt!364671 (lemmaNoChangeToArrayThenSameMapNoExtras!280 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2170 (array!44652 array!44654 (_ BitVec 32) (_ BitVec 32) V!23967 V!23967 (_ BitVec 32) Int) ListLongMap!8209)

(assert (=> b!814568 (= lt!364670 (getCurrentListMapNoExtraKeys!2170 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814568 (= lt!364669 (getCurrentListMapNoExtraKeys!2170 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!556349 () Bool)

(assert (=> start!70094 (=> (not res!556349) (not e!451548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70094 (= res!556349 (validMask!0 mask!1312))))

(assert (=> start!70094 e!451548))

(assert (=> start!70094 tp_is_empty!14225))

(declare-fun array_inv!17113 (array!44652) Bool)

(assert (=> start!70094 (array_inv!17113 _keys!976)))

(assert (=> start!70094 true))

(declare-fun e!451546 () Bool)

(declare-fun array_inv!17114 (array!44654) Bool)

(assert (=> start!70094 (and (array_inv!17114 _values!788) e!451546)))

(assert (=> start!70094 tp!44260))

(declare-fun b!814565 () Bool)

(declare-fun mapRes!22918 () Bool)

(assert (=> b!814565 (= e!451546 (and e!451544 mapRes!22918))))

(declare-fun condMapEmpty!22918 () Bool)

(declare-fun mapDefault!22918 () ValueCell!6697)

