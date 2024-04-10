; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72212 () Bool)

(assert start!72212)

(declare-fun b!836966 () Bool)

(declare-fun res!569277 () Bool)

(declare-fun e!467039 () Bool)

(assert (=> b!836966 (=> (not res!569277) (not e!467039))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836966 (= res!569277 (validMask!0 mask!1196))))

(declare-fun res!569276 () Bool)

(assert (=> start!72212 (=> (not res!569276) (not e!467039))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46886 0))(
  ( (array!46887 (arr!22477 (Array (_ BitVec 32) (_ BitVec 64))) (size!22917 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46886)

(assert (=> start!72212 (= res!569276 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22917 _keys!868))))))

(assert (=> start!72212 e!467039))

(assert (=> start!72212 true))

(declare-fun array_inv!17924 (array!46886) Bool)

(assert (=> start!72212 (array_inv!17924 _keys!868)))

(declare-datatypes ((V!25437 0))(
  ( (V!25438 (val!7694 Int)) )
))
(declare-datatypes ((ValueCell!7207 0))(
  ( (ValueCellFull!7207 (v!10118 V!25437)) (EmptyCell!7207) )
))
(declare-datatypes ((array!46888 0))(
  ( (array!46889 (arr!22478 (Array (_ BitVec 32) ValueCell!7207)) (size!22918 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46888)

(declare-fun e!467037 () Bool)

(declare-fun array_inv!17925 (array!46888) Bool)

(assert (=> start!72212 (and (array_inv!17925 _values!688) e!467037)))

(declare-fun mapIsEmpty!24530 () Bool)

(declare-fun mapRes!24530 () Bool)

(assert (=> mapIsEmpty!24530 mapRes!24530))

(declare-fun b!836967 () Bool)

(declare-fun e!467038 () Bool)

(declare-fun tp_is_empty!15293 () Bool)

(assert (=> b!836967 (= e!467038 tp_is_empty!15293)))

(declare-fun b!836968 () Bool)

(assert (=> b!836968 (= e!467037 (and e!467038 mapRes!24530))))

(declare-fun condMapEmpty!24530 () Bool)

(declare-fun mapDefault!24530 () ValueCell!7207)

