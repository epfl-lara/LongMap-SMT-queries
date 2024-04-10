; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70146 () Bool)

(assert start!70146)

(declare-fun b_free!12553 () Bool)

(declare-fun b_next!12553 () Bool)

(assert (=> start!70146 (= b_free!12553 (not b_next!12553))))

(declare-fun tp!44376 () Bool)

(declare-fun b_and!21333 () Bool)

(assert (=> start!70146 (= tp!44376 b_and!21333)))

(declare-fun res!556608 () Bool)

(declare-fun e!451886 () Bool)

(assert (=> start!70146 (=> (not res!556608) (not e!451886))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70146 (= res!556608 (validMask!0 mask!1312))))

(assert (=> start!70146 e!451886))

(declare-fun tp_is_empty!14263 () Bool)

(assert (=> start!70146 tp_is_empty!14263))

(declare-datatypes ((array!44730 0))(
  ( (array!44731 (arr!21424 (Array (_ BitVec 32) (_ BitVec 64))) (size!21845 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44730)

(declare-fun array_inv!17143 (array!44730) Bool)

(assert (=> start!70146 (array_inv!17143 _keys!976)))

(assert (=> start!70146 true))

(declare-datatypes ((V!24019 0))(
  ( (V!24020 (val!7179 Int)) )
))
(declare-datatypes ((ValueCell!6716 0))(
  ( (ValueCellFull!6716 (v!9606 V!24019)) (EmptyCell!6716) )
))
(declare-datatypes ((array!44732 0))(
  ( (array!44733 (arr!21425 (Array (_ BitVec 32) ValueCell!6716)) (size!21846 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44732)

(declare-fun e!451885 () Bool)

(declare-fun array_inv!17144 (array!44732) Bool)

(assert (=> start!70146 (and (array_inv!17144 _values!788) e!451885)))

(assert (=> start!70146 tp!44376))

(declare-fun b!815046 () Bool)

(declare-fun res!556606 () Bool)

(assert (=> b!815046 (=> (not res!556606) (not e!451886))))

(declare-datatypes ((List!15244 0))(
  ( (Nil!15241) (Cons!15240 (h!16369 (_ BitVec 64)) (t!21563 List!15244)) )
))
(declare-fun arrayNoDuplicates!0 (array!44730 (_ BitVec 32) List!15244) Bool)

(assert (=> b!815046 (= res!556606 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15241))))

(declare-fun b!815047 () Bool)

(assert (=> b!815047 (= e!451886 (not true))))

(declare-datatypes ((tuple2!9412 0))(
  ( (tuple2!9413 (_1!4717 (_ BitVec 64)) (_2!4717 V!24019)) )
))
(declare-datatypes ((List!15245 0))(
  ( (Nil!15242) (Cons!15241 (h!16370 tuple2!9412) (t!21564 List!15245)) )
))
(declare-datatypes ((ListLongMap!8235 0))(
  ( (ListLongMap!8236 (toList!4133 List!15245)) )
))
(declare-fun lt!364881 () ListLongMap!8235)

(declare-fun lt!364880 () ListLongMap!8235)

(assert (=> b!815047 (= lt!364881 lt!364880)))

(declare-fun zeroValueBefore!34 () V!24019)

(declare-datatypes ((Unit!27764 0))(
  ( (Unit!27765) )
))
(declare-fun lt!364882 () Unit!27764)

(declare-fun zeroValueAfter!34 () V!24019)

(declare-fun minValue!754 () V!24019)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!293 (array!44730 array!44732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24019 V!24019 V!24019 V!24019 (_ BitVec 32) Int) Unit!27764)

(assert (=> b!815047 (= lt!364882 (lemmaNoChangeToArrayThenSameMapNoExtras!293 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2183 (array!44730 array!44732 (_ BitVec 32) (_ BitVec 32) V!24019 V!24019 (_ BitVec 32) Int) ListLongMap!8235)

(assert (=> b!815047 (= lt!364880 (getCurrentListMapNoExtraKeys!2183 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815047 (= lt!364881 (getCurrentListMapNoExtraKeys!2183 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815048 () Bool)

(declare-fun res!556609 () Bool)

(assert (=> b!815048 (=> (not res!556609) (not e!451886))))

(assert (=> b!815048 (= res!556609 (and (= (size!21846 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21845 _keys!976) (size!21846 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815049 () Bool)

(declare-fun res!556607 () Bool)

(assert (=> b!815049 (=> (not res!556607) (not e!451886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44730 (_ BitVec 32)) Bool)

(assert (=> b!815049 (= res!556607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22978 () Bool)

(declare-fun mapRes!22978 () Bool)

(assert (=> mapIsEmpty!22978 mapRes!22978))

(declare-fun b!815050 () Bool)

(declare-fun e!451887 () Bool)

(assert (=> b!815050 (= e!451887 tp_is_empty!14263)))

(declare-fun b!815051 () Bool)

(declare-fun e!451884 () Bool)

(assert (=> b!815051 (= e!451885 (and e!451884 mapRes!22978))))

(declare-fun condMapEmpty!22978 () Bool)

(declare-fun mapDefault!22978 () ValueCell!6716)

