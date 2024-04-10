; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42206 () Bool)

(assert start!42206)

(declare-fun b_free!11725 () Bool)

(declare-fun b_next!11725 () Bool)

(assert (=> start!42206 (= b_free!11725 (not b_next!11725))))

(declare-fun tp!41199 () Bool)

(declare-fun b_and!20155 () Bool)

(assert (=> start!42206 (= tp!41199 b_and!20155)))

(declare-fun b!471078 () Bool)

(declare-fun res!281448 () Bool)

(declare-fun e!276047 () Bool)

(assert (=> b!471078 (=> (not res!281448) (not e!276047))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30071 0))(
  ( (array!30072 (arr!14458 (Array (_ BitVec 32) (_ BitVec 64))) (size!14810 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30071)

(declare-datatypes ((V!18643 0))(
  ( (V!18644 (val!6621 Int)) )
))
(declare-datatypes ((ValueCell!6233 0))(
  ( (ValueCellFull!6233 (v!8912 V!18643)) (EmptyCell!6233) )
))
(declare-datatypes ((array!30073 0))(
  ( (array!30074 (arr!14459 (Array (_ BitVec 32) ValueCell!6233)) (size!14811 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30073)

(assert (=> b!471078 (= res!281448 (and (= (size!14811 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14810 _keys!1025) (size!14811 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471079 () Bool)

(declare-fun e!276050 () Bool)

(declare-fun tp_is_empty!13153 () Bool)

(assert (=> b!471079 (= e!276050 tp_is_empty!13153)))

(declare-fun res!281449 () Bool)

(assert (=> start!42206 (=> (not res!281449) (not e!276047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42206 (= res!281449 (validMask!0 mask!1365))))

(assert (=> start!42206 e!276047))

(assert (=> start!42206 tp_is_empty!13153))

(assert (=> start!42206 tp!41199))

(assert (=> start!42206 true))

(declare-fun array_inv!10428 (array!30071) Bool)

(assert (=> start!42206 (array_inv!10428 _keys!1025)))

(declare-fun e!276046 () Bool)

(declare-fun array_inv!10429 (array!30073) Bool)

(assert (=> start!42206 (and (array_inv!10429 _values!833) e!276046)))

(declare-fun mapIsEmpty!21433 () Bool)

(declare-fun mapRes!21433 () Bool)

(assert (=> mapIsEmpty!21433 mapRes!21433))

(declare-fun mapNonEmpty!21433 () Bool)

(declare-fun tp!41200 () Bool)

(declare-fun e!276049 () Bool)

(assert (=> mapNonEmpty!21433 (= mapRes!21433 (and tp!41200 e!276049))))

(declare-fun mapKey!21433 () (_ BitVec 32))

(declare-fun mapRest!21433 () (Array (_ BitVec 32) ValueCell!6233))

(declare-fun mapValue!21433 () ValueCell!6233)

(assert (=> mapNonEmpty!21433 (= (arr!14459 _values!833) (store mapRest!21433 mapKey!21433 mapValue!21433))))

(declare-fun b!471080 () Bool)

(assert (=> b!471080 (= e!276046 (and e!276050 mapRes!21433))))

(declare-fun condMapEmpty!21433 () Bool)

(declare-fun mapDefault!21433 () ValueCell!6233)

