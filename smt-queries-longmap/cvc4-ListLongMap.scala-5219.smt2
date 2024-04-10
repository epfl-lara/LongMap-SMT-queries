; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70368 () Bool)

(assert start!70368)

(declare-fun b_free!12725 () Bool)

(declare-fun b_next!12725 () Bool)

(assert (=> start!70368 (= b_free!12725 (not b_next!12725))))

(declare-fun tp!44902 () Bool)

(declare-fun b_and!21537 () Bool)

(assert (=> start!70368 (= tp!44902 b_and!21537)))

(declare-fun mapIsEmpty!23245 () Bool)

(declare-fun mapRes!23245 () Bool)

(assert (=> mapIsEmpty!23245 mapRes!23245))

(declare-fun mapNonEmpty!23245 () Bool)

(declare-fun tp!44901 () Bool)

(declare-fun e!453611 () Bool)

(assert (=> mapNonEmpty!23245 (= mapRes!23245 (and tp!44901 e!453611))))

(declare-datatypes ((V!24247 0))(
  ( (V!24248 (val!7265 Int)) )
))
(declare-datatypes ((ValueCell!6802 0))(
  ( (ValueCellFull!6802 (v!9694 V!24247)) (EmptyCell!6802) )
))
(declare-fun mapValue!23245 () ValueCell!6802)

(declare-datatypes ((array!45070 0))(
  ( (array!45071 (arr!21591 (Array (_ BitVec 32) ValueCell!6802)) (size!22012 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45070)

(declare-fun mapKey!23245 () (_ BitVec 32))

(declare-fun mapRest!23245 () (Array (_ BitVec 32) ValueCell!6802))

(assert (=> mapNonEmpty!23245 (= (arr!21591 _values!788) (store mapRest!23245 mapKey!23245 mapValue!23245))))

(declare-fun res!557996 () Bool)

(declare-fun e!453613 () Bool)

(assert (=> start!70368 (=> (not res!557996) (not e!453613))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70368 (= res!557996 (validMask!0 mask!1312))))

(assert (=> start!70368 e!453613))

(declare-fun tp_is_empty!14435 () Bool)

(assert (=> start!70368 tp_is_empty!14435))

(declare-datatypes ((array!45072 0))(
  ( (array!45073 (arr!21592 (Array (_ BitVec 32) (_ BitVec 64))) (size!22013 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45072)

(declare-fun array_inv!17275 (array!45072) Bool)

(assert (=> start!70368 (array_inv!17275 _keys!976)))

(assert (=> start!70368 true))

(declare-fun e!453615 () Bool)

(declare-fun array_inv!17276 (array!45070) Bool)

(assert (=> start!70368 (and (array_inv!17276 _values!788) e!453615)))

(assert (=> start!70368 tp!44902))

(declare-fun b!817467 () Bool)

(declare-fun res!557995 () Bool)

(assert (=> b!817467 (=> (not res!557995) (not e!453613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45072 (_ BitVec 32)) Bool)

(assert (=> b!817467 (= res!557995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817468 () Bool)

(declare-fun e!453612 () Bool)

(assert (=> b!817468 (= e!453612 tp_is_empty!14435)))

(declare-fun b!817469 () Bool)

(declare-fun res!557998 () Bool)

(assert (=> b!817469 (=> (not res!557998) (not e!453613))))

(declare-datatypes ((List!15378 0))(
  ( (Nil!15375) (Cons!15374 (h!16503 (_ BitVec 64)) (t!21703 List!15378)) )
))
(declare-fun arrayNoDuplicates!0 (array!45072 (_ BitVec 32) List!15378) Bool)

(assert (=> b!817469 (= res!557998 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15375))))

(declare-fun b!817470 () Bool)

(declare-fun res!557997 () Bool)

(assert (=> b!817470 (=> (not res!557997) (not e!453613))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817470 (= res!557997 (and (= (size!22012 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22013 _keys!976) (size!22012 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817471 () Bool)

(assert (=> b!817471 (= e!453615 (and e!453612 mapRes!23245))))

(declare-fun condMapEmpty!23245 () Bool)

(declare-fun mapDefault!23245 () ValueCell!6802)

