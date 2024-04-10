; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70112 () Bool)

(assert start!70112)

(declare-fun b_free!12533 () Bool)

(declare-fun b_next!12533 () Bool)

(assert (=> start!70112 (= b_free!12533 (not b_next!12533))))

(declare-fun tp!44314 () Bool)

(declare-fun b_and!21305 () Bool)

(assert (=> start!70112 (= tp!44314 b_and!21305)))

(declare-fun mapNonEmpty!22945 () Bool)

(declare-fun mapRes!22945 () Bool)

(declare-fun tp!44313 () Bool)

(declare-fun e!451679 () Bool)

(assert (=> mapNonEmpty!22945 (= mapRes!22945 (and tp!44313 e!451679))))

(declare-datatypes ((V!23991 0))(
  ( (V!23992 (val!7169 Int)) )
))
(declare-datatypes ((ValueCell!6706 0))(
  ( (ValueCellFull!6706 (v!9596 V!23991)) (EmptyCell!6706) )
))
(declare-fun mapValue!22945 () ValueCell!6706)

(declare-fun mapRest!22945 () (Array (_ BitVec 32) ValueCell!6706))

(declare-datatypes ((array!44688 0))(
  ( (array!44689 (arr!21404 (Array (_ BitVec 32) ValueCell!6706)) (size!21825 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44688)

(declare-fun mapKey!22945 () (_ BitVec 32))

(assert (=> mapNonEmpty!22945 (= (arr!21404 _values!788) (store mapRest!22945 mapKey!22945 mapValue!22945))))

(declare-fun b!814751 () Bool)

(declare-fun e!451680 () Bool)

(declare-fun tp_is_empty!14243 () Bool)

(assert (=> b!814751 (= e!451680 tp_is_empty!14243)))

(declare-fun b!814752 () Bool)

(declare-fun res!556458 () Bool)

(declare-fun e!451682 () Bool)

(assert (=> b!814752 (=> (not res!556458) (not e!451682))))

(declare-datatypes ((array!44690 0))(
  ( (array!44691 (arr!21405 (Array (_ BitVec 32) (_ BitVec 64))) (size!21826 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44690)

(declare-datatypes ((List!15230 0))(
  ( (Nil!15227) (Cons!15226 (h!16355 (_ BitVec 64)) (t!21547 List!15230)) )
))
(declare-fun arrayNoDuplicates!0 (array!44690 (_ BitVec 32) List!15230) Bool)

(assert (=> b!814752 (= res!556458 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15227))))

(declare-fun b!814753 () Bool)

(declare-fun res!556455 () Bool)

(assert (=> b!814753 (=> (not res!556455) (not e!451682))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44690 (_ BitVec 32)) Bool)

(assert (=> b!814753 (= res!556455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556456 () Bool)

(assert (=> start!70112 (=> (not res!556456) (not e!451682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70112 (= res!556456 (validMask!0 mask!1312))))

(assert (=> start!70112 e!451682))

(assert (=> start!70112 tp_is_empty!14243))

(declare-fun array_inv!17123 (array!44690) Bool)

(assert (=> start!70112 (array_inv!17123 _keys!976)))

(assert (=> start!70112 true))

(declare-fun e!451681 () Bool)

(declare-fun array_inv!17124 (array!44688) Bool)

(assert (=> start!70112 (and (array_inv!17124 _values!788) e!451681)))

(assert (=> start!70112 tp!44314))

(declare-fun b!814754 () Bool)

(declare-fun res!556457 () Bool)

(assert (=> b!814754 (=> (not res!556457) (not e!451682))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814754 (= res!556457 (and (= (size!21825 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21826 _keys!976) (size!21825 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22945 () Bool)

(assert (=> mapIsEmpty!22945 mapRes!22945))

(declare-fun b!814755 () Bool)

(assert (=> b!814755 (= e!451679 tp_is_empty!14243)))

(declare-fun b!814756 () Bool)

(assert (=> b!814756 (= e!451681 (and e!451680 mapRes!22945))))

(declare-fun condMapEmpty!22945 () Bool)

(declare-fun mapDefault!22945 () ValueCell!6706)

