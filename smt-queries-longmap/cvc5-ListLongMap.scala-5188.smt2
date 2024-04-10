; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70128 () Bool)

(assert start!70128)

(declare-fun b_free!12535 () Bool)

(declare-fun b_next!12535 () Bool)

(assert (=> start!70128 (= b_free!12535 (not b_next!12535))))

(declare-fun tp!44322 () Bool)

(declare-fun b_and!21315 () Bool)

(assert (=> start!70128 (= tp!44322 b_and!21315)))

(declare-fun b!814857 () Bool)

(declare-fun e!451751 () Bool)

(assert (=> b!814857 (= e!451751 (not true))))

(declare-datatypes ((V!23995 0))(
  ( (V!23996 (val!7170 Int)) )
))
(declare-datatypes ((tuple2!9398 0))(
  ( (tuple2!9399 (_1!4710 (_ BitVec 64)) (_2!4710 V!23995)) )
))
(declare-datatypes ((List!15231 0))(
  ( (Nil!15228) (Cons!15227 (h!16356 tuple2!9398) (t!21550 List!15231)) )
))
(declare-datatypes ((ListLongMap!8221 0))(
  ( (ListLongMap!8222 (toList!4126 List!15231)) )
))
(declare-fun lt!364800 () ListLongMap!8221)

(declare-fun lt!364801 () ListLongMap!8221)

(assert (=> b!814857 (= lt!364800 lt!364801)))

(declare-datatypes ((Unit!27750 0))(
  ( (Unit!27751) )
))
(declare-fun lt!364799 () Unit!27750)

(declare-fun zeroValueBefore!34 () V!23995)

(declare-datatypes ((array!44694 0))(
  ( (array!44695 (arr!21406 (Array (_ BitVec 32) (_ BitVec 64))) (size!21827 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44694)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23995)

(declare-fun minValue!754 () V!23995)

(declare-datatypes ((ValueCell!6707 0))(
  ( (ValueCellFull!6707 (v!9597 V!23995)) (EmptyCell!6707) )
))
(declare-datatypes ((array!44696 0))(
  ( (array!44697 (arr!21407 (Array (_ BitVec 32) ValueCell!6707)) (size!21828 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44696)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!286 (array!44694 array!44696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23995 V!23995 V!23995 V!23995 (_ BitVec 32) Int) Unit!27750)

(assert (=> b!814857 (= lt!364799 (lemmaNoChangeToArrayThenSameMapNoExtras!286 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2176 (array!44694 array!44696 (_ BitVec 32) (_ BitVec 32) V!23995 V!23995 (_ BitVec 32) Int) ListLongMap!8221)

(assert (=> b!814857 (= lt!364801 (getCurrentListMapNoExtraKeys!2176 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814857 (= lt!364800 (getCurrentListMapNoExtraKeys!2176 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22951 () Bool)

(declare-fun mapRes!22951 () Bool)

(declare-fun tp!44323 () Bool)

(declare-fun e!451749 () Bool)

(assert (=> mapNonEmpty!22951 (= mapRes!22951 (and tp!44323 e!451749))))

(declare-fun mapKey!22951 () (_ BitVec 32))

(declare-fun mapValue!22951 () ValueCell!6707)

(declare-fun mapRest!22951 () (Array (_ BitVec 32) ValueCell!6707))

(assert (=> mapNonEmpty!22951 (= (arr!21407 _values!788) (store mapRest!22951 mapKey!22951 mapValue!22951))))

(declare-fun res!556498 () Bool)

(assert (=> start!70128 (=> (not res!556498) (not e!451751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70128 (= res!556498 (validMask!0 mask!1312))))

(assert (=> start!70128 e!451751))

(declare-fun tp_is_empty!14245 () Bool)

(assert (=> start!70128 tp_is_empty!14245))

(declare-fun array_inv!17125 (array!44694) Bool)

(assert (=> start!70128 (array_inv!17125 _keys!976)))

(assert (=> start!70128 true))

(declare-fun e!451753 () Bool)

(declare-fun array_inv!17126 (array!44696) Bool)

(assert (=> start!70128 (and (array_inv!17126 _values!788) e!451753)))

(assert (=> start!70128 tp!44322))

(declare-fun b!814858 () Bool)

(declare-fun res!556501 () Bool)

(assert (=> b!814858 (=> (not res!556501) (not e!451751))))

(declare-datatypes ((List!15232 0))(
  ( (Nil!15229) (Cons!15228 (h!16357 (_ BitVec 64)) (t!21551 List!15232)) )
))
(declare-fun arrayNoDuplicates!0 (array!44694 (_ BitVec 32) List!15232) Bool)

(assert (=> b!814858 (= res!556501 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15229))))

(declare-fun b!814859 () Bool)

(assert (=> b!814859 (= e!451749 tp_is_empty!14245)))

(declare-fun b!814860 () Bool)

(declare-fun e!451750 () Bool)

(assert (=> b!814860 (= e!451753 (and e!451750 mapRes!22951))))

(declare-fun condMapEmpty!22951 () Bool)

(declare-fun mapDefault!22951 () ValueCell!6707)

