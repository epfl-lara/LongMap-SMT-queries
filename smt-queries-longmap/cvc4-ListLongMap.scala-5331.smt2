; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71250 () Bool)

(assert start!71250)

(declare-fun b_free!13397 () Bool)

(declare-fun b_next!13397 () Bool)

(assert (=> start!71250 (= b_free!13397 (not b_next!13397))))

(declare-fun tp!46954 () Bool)

(declare-fun b_and!22335 () Bool)

(assert (=> start!71250 (= tp!46954 b_and!22335)))

(declare-fun res!564080 () Bool)

(declare-fun e!461066 () Bool)

(assert (=> start!71250 (=> (not res!564080) (not e!461066))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71250 (= res!564080 (validMask!0 mask!1312))))

(assert (=> start!71250 e!461066))

(declare-fun tp_is_empty!15107 () Bool)

(assert (=> start!71250 tp_is_empty!15107))

(declare-datatypes ((array!46382 0))(
  ( (array!46383 (arr!22235 (Array (_ BitVec 32) (_ BitVec 64))) (size!22656 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46382)

(declare-fun array_inv!17717 (array!46382) Bool)

(assert (=> start!71250 (array_inv!17717 _keys!976)))

(assert (=> start!71250 true))

(declare-datatypes ((V!25143 0))(
  ( (V!25144 (val!7601 Int)) )
))
(declare-datatypes ((ValueCell!7138 0))(
  ( (ValueCellFull!7138 (v!10036 V!25143)) (EmptyCell!7138) )
))
(declare-datatypes ((array!46384 0))(
  ( (array!46385 (arr!22236 (Array (_ BitVec 32) ValueCell!7138)) (size!22657 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46384)

(declare-fun e!461067 () Bool)

(declare-fun array_inv!17718 (array!46384) Bool)

(assert (=> start!71250 (and (array_inv!17718 _values!788) e!461067)))

(assert (=> start!71250 tp!46954))

(declare-fun b!827617 () Bool)

(declare-fun res!564077 () Bool)

(assert (=> b!827617 (=> (not res!564077) (not e!461066))))

(declare-datatypes ((List!15871 0))(
  ( (Nil!15868) (Cons!15867 (h!16996 (_ BitVec 64)) (t!22220 List!15871)) )
))
(declare-fun arrayNoDuplicates!0 (array!46382 (_ BitVec 32) List!15871) Bool)

(assert (=> b!827617 (= res!564077 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15868))))

(declare-fun b!827618 () Bool)

(declare-fun res!564079 () Bool)

(assert (=> b!827618 (=> (not res!564079) (not e!461066))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827618 (= res!564079 (and (= (size!22657 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22656 _keys!976) (size!22657 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827619 () Bool)

(declare-fun e!461068 () Bool)

(assert (=> b!827619 (= e!461068 tp_is_empty!15107)))

(declare-fun b!827620 () Bool)

(declare-fun res!564078 () Bool)

(assert (=> b!827620 (=> (not res!564078) (not e!461066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46382 (_ BitVec 32)) Bool)

(assert (=> b!827620 (= res!564078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24289 () Bool)

(declare-fun mapRes!24289 () Bool)

(declare-fun tp!46953 () Bool)

(declare-fun e!461069 () Bool)

(assert (=> mapNonEmpty!24289 (= mapRes!24289 (and tp!46953 e!461069))))

(declare-fun mapKey!24289 () (_ BitVec 32))

(declare-fun mapRest!24289 () (Array (_ BitVec 32) ValueCell!7138))

(declare-fun mapValue!24289 () ValueCell!7138)

(assert (=> mapNonEmpty!24289 (= (arr!22236 _values!788) (store mapRest!24289 mapKey!24289 mapValue!24289))))

(declare-fun mapIsEmpty!24289 () Bool)

(assert (=> mapIsEmpty!24289 mapRes!24289))

(declare-fun b!827621 () Bool)

(assert (=> b!827621 (= e!461067 (and e!461068 mapRes!24289))))

(declare-fun condMapEmpty!24289 () Bool)

(declare-fun mapDefault!24289 () ValueCell!7138)

