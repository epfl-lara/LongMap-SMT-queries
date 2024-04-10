; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70144 () Bool)

(assert start!70144)

(declare-fun b_free!12551 () Bool)

(declare-fun b_next!12551 () Bool)

(assert (=> start!70144 (= b_free!12551 (not b_next!12551))))

(declare-fun tp!44370 () Bool)

(declare-fun b_and!21331 () Bool)

(assert (=> start!70144 (= tp!44370 b_and!21331)))

(declare-fun b!815025 () Bool)

(declare-fun res!556597 () Bool)

(declare-fun e!451871 () Bool)

(assert (=> b!815025 (=> (not res!556597) (not e!451871))))

(declare-datatypes ((array!44726 0))(
  ( (array!44727 (arr!21422 (Array (_ BitVec 32) (_ BitVec 64))) (size!21843 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44726)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24015 0))(
  ( (V!24016 (val!7178 Int)) )
))
(declare-datatypes ((ValueCell!6715 0))(
  ( (ValueCellFull!6715 (v!9605 V!24015)) (EmptyCell!6715) )
))
(declare-datatypes ((array!44728 0))(
  ( (array!44729 (arr!21423 (Array (_ BitVec 32) ValueCell!6715)) (size!21844 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44728)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815025 (= res!556597 (and (= (size!21844 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21843 _keys!976) (size!21844 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556594 () Bool)

(assert (=> start!70144 (=> (not res!556594) (not e!451871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70144 (= res!556594 (validMask!0 mask!1312))))

(assert (=> start!70144 e!451871))

(declare-fun tp_is_empty!14261 () Bool)

(assert (=> start!70144 tp_is_empty!14261))

(declare-fun array_inv!17141 (array!44726) Bool)

(assert (=> start!70144 (array_inv!17141 _keys!976)))

(assert (=> start!70144 true))

(declare-fun e!451870 () Bool)

(declare-fun array_inv!17142 (array!44728) Bool)

(assert (=> start!70144 (and (array_inv!17142 _values!788) e!451870)))

(assert (=> start!70144 tp!44370))

(declare-fun mapIsEmpty!22975 () Bool)

(declare-fun mapRes!22975 () Bool)

(assert (=> mapIsEmpty!22975 mapRes!22975))

(declare-fun b!815026 () Bool)

(declare-fun res!556596 () Bool)

(assert (=> b!815026 (=> (not res!556596) (not e!451871))))

(declare-datatypes ((List!15243 0))(
  ( (Nil!15240) (Cons!15239 (h!16368 (_ BitVec 64)) (t!21562 List!15243)) )
))
(declare-fun arrayNoDuplicates!0 (array!44726 (_ BitVec 32) List!15243) Bool)

(assert (=> b!815026 (= res!556596 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15240))))

(declare-fun b!815027 () Bool)

(declare-fun e!451873 () Bool)

(assert (=> b!815027 (= e!451873 tp_is_empty!14261)))

(declare-fun mapNonEmpty!22975 () Bool)

(declare-fun tp!44371 () Bool)

(assert (=> mapNonEmpty!22975 (= mapRes!22975 (and tp!44371 e!451873))))

(declare-fun mapValue!22975 () ValueCell!6715)

(declare-fun mapRest!22975 () (Array (_ BitVec 32) ValueCell!6715))

(declare-fun mapKey!22975 () (_ BitVec 32))

(assert (=> mapNonEmpty!22975 (= (arr!21423 _values!788) (store mapRest!22975 mapKey!22975 mapValue!22975))))

(declare-fun b!815028 () Bool)

(declare-fun e!451872 () Bool)

(assert (=> b!815028 (= e!451870 (and e!451872 mapRes!22975))))

(declare-fun condMapEmpty!22975 () Bool)

(declare-fun mapDefault!22975 () ValueCell!6715)

