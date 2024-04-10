; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20454 () Bool)

(assert start!20454)

(declare-fun b_free!5113 () Bool)

(declare-fun b_next!5113 () Bool)

(assert (=> start!20454 (= b_free!5113 (not b_next!5113))))

(declare-fun tp!18370 () Bool)

(declare-fun b_and!11859 () Bool)

(assert (=> start!20454 (= tp!18370 b_and!11859)))

(declare-fun b!202671 () Bool)

(declare-fun res!97186 () Bool)

(declare-fun e!132739 () Bool)

(assert (=> b!202671 (=> (not res!97186) (not e!132739))))

(declare-datatypes ((array!9163 0))(
  ( (array!9164 (arr!4332 (Array (_ BitVec 32) (_ BitVec 64))) (size!4657 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9163)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6273 0))(
  ( (V!6274 (val!2529 Int)) )
))
(declare-datatypes ((ValueCell!2141 0))(
  ( (ValueCellFull!2141 (v!4499 V!6273)) (EmptyCell!2141) )
))
(declare-datatypes ((array!9165 0))(
  ( (array!9166 (arr!4333 (Array (_ BitVec 32) ValueCell!2141)) (size!4658 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9165)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!202671 (= res!97186 (and (= (size!4658 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4657 _keys!825) (size!4658 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!97179 () Bool)

(assert (=> start!20454 (=> (not res!97179) (not e!132739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20454 (= res!97179 (validMask!0 mask!1149))))

(assert (=> start!20454 e!132739))

(declare-fun e!132735 () Bool)

(declare-fun array_inv!2859 (array!9165) Bool)

(assert (=> start!20454 (and (array_inv!2859 _values!649) e!132735)))

(assert (=> start!20454 true))

(declare-fun tp_is_empty!4969 () Bool)

(assert (=> start!20454 tp_is_empty!4969))

(declare-fun array_inv!2860 (array!9163) Bool)

(assert (=> start!20454 (array_inv!2860 _keys!825)))

(assert (=> start!20454 tp!18370))

(declare-fun mapNonEmpty!8522 () Bool)

(declare-fun mapRes!8522 () Bool)

(declare-fun tp!18371 () Bool)

(declare-fun e!132738 () Bool)

(assert (=> mapNonEmpty!8522 (= mapRes!8522 (and tp!18371 e!132738))))

(declare-fun mapValue!8522 () ValueCell!2141)

(declare-fun mapRest!8522 () (Array (_ BitVec 32) ValueCell!2141))

(declare-fun mapKey!8522 () (_ BitVec 32))

(assert (=> mapNonEmpty!8522 (= (arr!4333 _values!649) (store mapRest!8522 mapKey!8522 mapValue!8522))))

(declare-fun mapIsEmpty!8522 () Bool)

(assert (=> mapIsEmpty!8522 mapRes!8522))

(declare-fun b!202672 () Bool)

(assert (=> b!202672 (= e!132738 tp_is_empty!4969)))

(declare-fun b!202673 () Bool)

(declare-fun res!97182 () Bool)

(assert (=> b!202673 (=> (not res!97182) (not e!132739))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202673 (= res!97182 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4657 _keys!825))))))

(declare-fun b!202674 () Bool)

(declare-fun e!132736 () Bool)

(assert (=> b!202674 (= e!132735 (and e!132736 mapRes!8522))))

(declare-fun condMapEmpty!8522 () Bool)

(declare-fun mapDefault!8522 () ValueCell!2141)

