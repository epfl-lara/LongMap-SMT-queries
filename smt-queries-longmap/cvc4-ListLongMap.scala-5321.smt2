; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71170 () Bool)

(assert start!71170)

(declare-fun b_free!13337 () Bool)

(declare-fun b_next!13337 () Bool)

(assert (=> start!71170 (= b_free!13337 (not b_next!13337))))

(declare-fun tp!46771 () Bool)

(declare-fun b_and!22263 () Bool)

(assert (=> start!71170 (= tp!46771 b_and!22263)))

(declare-fun b!826724 () Bool)

(declare-fun res!563561 () Bool)

(declare-fun e!460434 () Bool)

(assert (=> b!826724 (=> (not res!563561) (not e!460434))))

(declare-datatypes ((array!46272 0))(
  ( (array!46273 (arr!22181 (Array (_ BitVec 32) (_ BitVec 64))) (size!22602 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46272)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25063 0))(
  ( (V!25064 (val!7571 Int)) )
))
(declare-datatypes ((ValueCell!7108 0))(
  ( (ValueCellFull!7108 (v!10005 V!25063)) (EmptyCell!7108) )
))
(declare-datatypes ((array!46274 0))(
  ( (array!46275 (arr!22182 (Array (_ BitVec 32) ValueCell!7108)) (size!22603 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46274)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826724 (= res!563561 (and (= (size!22603 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22602 _keys!976) (size!22603 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826725 () Bool)

(declare-fun e!460435 () Bool)

(declare-fun tp_is_empty!15047 () Bool)

(assert (=> b!826725 (= e!460435 tp_is_empty!15047)))

(declare-fun mapNonEmpty!24196 () Bool)

(declare-fun mapRes!24196 () Bool)

(declare-fun tp!46770 () Bool)

(assert (=> mapNonEmpty!24196 (= mapRes!24196 (and tp!46770 e!460435))))

(declare-fun mapKey!24196 () (_ BitVec 32))

(declare-fun mapRest!24196 () (Array (_ BitVec 32) ValueCell!7108))

(declare-fun mapValue!24196 () ValueCell!7108)

(assert (=> mapNonEmpty!24196 (= (arr!22182 _values!788) (store mapRest!24196 mapKey!24196 mapValue!24196))))

(declare-fun b!826726 () Bool)

(declare-fun res!563556 () Bool)

(assert (=> b!826726 (=> (not res!563556) (not e!460434))))

(declare-datatypes ((List!15831 0))(
  ( (Nil!15828) (Cons!15827 (h!16956 (_ BitVec 64)) (t!22178 List!15831)) )
))
(declare-fun arrayNoDuplicates!0 (array!46272 (_ BitVec 32) List!15831) Bool)

(assert (=> b!826726 (= res!563556 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15828))))

(declare-fun mapIsEmpty!24196 () Bool)

(assert (=> mapIsEmpty!24196 mapRes!24196))

(declare-fun b!826727 () Bool)

(declare-fun res!563557 () Bool)

(assert (=> b!826727 (=> (not res!563557) (not e!460434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46272 (_ BitVec 32)) Bool)

(assert (=> b!826727 (= res!563557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826728 () Bool)

(declare-fun e!460428 () Bool)

(declare-fun e!460433 () Bool)

(assert (=> b!826728 (= e!460428 (and e!460433 mapRes!24196))))

(declare-fun condMapEmpty!24196 () Bool)

(declare-fun mapDefault!24196 () ValueCell!7108)

