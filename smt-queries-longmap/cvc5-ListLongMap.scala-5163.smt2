; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69952 () Bool)

(assert start!69952)

(declare-fun b_free!12385 () Bool)

(declare-fun b_next!12385 () Bool)

(assert (=> start!69952 (= b_free!12385 (not b_next!12385))))

(declare-fun tp!43866 () Bool)

(declare-fun b_and!21153 () Bool)

(assert (=> start!69952 (= tp!43866 b_and!21153)))

(declare-fun b!813124 () Bool)

(declare-fun res!555543 () Bool)

(declare-fun e!450524 () Bool)

(assert (=> b!813124 (=> (not res!555543) (not e!450524))))

(declare-datatypes ((array!44402 0))(
  ( (array!44403 (arr!21262 (Array (_ BitVec 32) (_ BitVec 64))) (size!21683 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44402)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23795 0))(
  ( (V!23796 (val!7095 Int)) )
))
(declare-datatypes ((ValueCell!6632 0))(
  ( (ValueCellFull!6632 (v!9522 V!23795)) (EmptyCell!6632) )
))
(declare-datatypes ((array!44404 0))(
  ( (array!44405 (arr!21263 (Array (_ BitVec 32) ValueCell!6632)) (size!21684 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44404)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813124 (= res!555543 (and (= (size!21684 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21683 _keys!976) (size!21684 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813125 () Bool)

(declare-fun res!555542 () Bool)

(assert (=> b!813125 (=> (not res!555542) (not e!450524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44402 (_ BitVec 32)) Bool)

(assert (=> b!813125 (= res!555542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813126 () Bool)

(declare-fun res!555540 () Bool)

(assert (=> b!813126 (=> (not res!555540) (not e!450524))))

(declare-datatypes ((List!15123 0))(
  ( (Nil!15120) (Cons!15119 (h!16248 (_ BitVec 64)) (t!21438 List!15123)) )
))
(declare-fun arrayNoDuplicates!0 (array!44402 (_ BitVec 32) List!15123) Bool)

(assert (=> b!813126 (= res!555540 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15120))))

(declare-fun b!813127 () Bool)

(declare-fun e!450522 () Bool)

(declare-fun tp_is_empty!14095 () Bool)

(assert (=> b!813127 (= e!450522 tp_is_empty!14095)))

(declare-fun b!813128 () Bool)

(declare-fun e!450523 () Bool)

(declare-fun mapRes!22720 () Bool)

(assert (=> b!813128 (= e!450523 (and e!450522 mapRes!22720))))

(declare-fun condMapEmpty!22720 () Bool)

(declare-fun mapDefault!22720 () ValueCell!6632)

