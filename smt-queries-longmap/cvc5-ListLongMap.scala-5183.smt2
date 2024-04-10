; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70084 () Bool)

(assert start!70084)

(declare-fun b_free!12505 () Bool)

(declare-fun b_next!12505 () Bool)

(assert (=> start!70084 (= b_free!12505 (not b_next!12505))))

(declare-fun tp!44229 () Bool)

(declare-fun b_and!21277 () Bool)

(assert (=> start!70084 (= tp!44229 b_and!21277)))

(declare-fun res!556288 () Bool)

(declare-fun e!451469 () Bool)

(assert (=> start!70084 (=> (not res!556288) (not e!451469))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70084 (= res!556288 (validMask!0 mask!1312))))

(assert (=> start!70084 e!451469))

(declare-fun tp_is_empty!14215 () Bool)

(assert (=> start!70084 tp_is_empty!14215))

(declare-datatypes ((array!44632 0))(
  ( (array!44633 (arr!21376 (Array (_ BitVec 32) (_ BitVec 64))) (size!21797 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44632)

(declare-fun array_inv!17105 (array!44632) Bool)

(assert (=> start!70084 (array_inv!17105 _keys!976)))

(assert (=> start!70084 true))

(declare-datatypes ((V!23955 0))(
  ( (V!23956 (val!7155 Int)) )
))
(declare-datatypes ((ValueCell!6692 0))(
  ( (ValueCellFull!6692 (v!9582 V!23955)) (EmptyCell!6692) )
))
(declare-datatypes ((array!44634 0))(
  ( (array!44635 (arr!21377 (Array (_ BitVec 32) ValueCell!6692)) (size!21798 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44634)

(declare-fun e!451472 () Bool)

(declare-fun array_inv!17106 (array!44634) Bool)

(assert (=> start!70084 (and (array_inv!17106 _values!788) e!451472)))

(assert (=> start!70084 tp!44229))

(declare-fun b!814457 () Bool)

(declare-fun res!556287 () Bool)

(assert (=> b!814457 (=> (not res!556287) (not e!451469))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814457 (= res!556287 (and (= (size!21798 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21797 _keys!976) (size!21798 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814458 () Bool)

(declare-fun e!451471 () Bool)

(declare-fun mapRes!22903 () Bool)

(assert (=> b!814458 (= e!451472 (and e!451471 mapRes!22903))))

(declare-fun condMapEmpty!22903 () Bool)

(declare-fun mapDefault!22903 () ValueCell!6692)

