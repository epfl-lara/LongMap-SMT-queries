; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72214 () Bool)

(assert start!72214)

(declare-fun b!836981 () Bool)

(declare-fun res!569282 () Bool)

(declare-fun e!467051 () Bool)

(assert (=> b!836981 (=> (not res!569282) (not e!467051))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836981 (= res!569282 (validMask!0 mask!1196))))

(declare-fun b!836982 () Bool)

(declare-fun e!467053 () Bool)

(declare-fun tp_is_empty!15295 () Bool)

(assert (=> b!836982 (= e!467053 tp_is_empty!15295)))

(declare-fun mapNonEmpty!24533 () Bool)

(declare-fun mapRes!24533 () Bool)

(declare-fun tp!47527 () Bool)

(assert (=> mapNonEmpty!24533 (= mapRes!24533 (and tp!47527 e!467053))))

(declare-datatypes ((V!25441 0))(
  ( (V!25442 (val!7695 Int)) )
))
(declare-datatypes ((ValueCell!7208 0))(
  ( (ValueCellFull!7208 (v!10119 V!25441)) (EmptyCell!7208) )
))
(declare-fun mapRest!24533 () (Array (_ BitVec 32) ValueCell!7208))

(declare-fun mapValue!24533 () ValueCell!7208)

(declare-datatypes ((array!46890 0))(
  ( (array!46891 (arr!22479 (Array (_ BitVec 32) ValueCell!7208)) (size!22919 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46890)

(declare-fun mapKey!24533 () (_ BitVec 32))

(assert (=> mapNonEmpty!24533 (= (arr!22479 _values!688) (store mapRest!24533 mapKey!24533 mapValue!24533))))

(declare-fun res!569283 () Bool)

(assert (=> start!72214 (=> (not res!569283) (not e!467051))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46892 0))(
  ( (array!46893 (arr!22480 (Array (_ BitVec 32) (_ BitVec 64))) (size!22920 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46892)

(assert (=> start!72214 (= res!569283 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22920 _keys!868))))))

(assert (=> start!72214 e!467051))

(assert (=> start!72214 true))

(declare-fun array_inv!17926 (array!46892) Bool)

(assert (=> start!72214 (array_inv!17926 _keys!868)))

(declare-fun e!467052 () Bool)

(declare-fun array_inv!17927 (array!46890) Bool)

(assert (=> start!72214 (and (array_inv!17927 _values!688) e!467052)))

(declare-fun b!836983 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!836983 (= e!467051 (and (= (size!22919 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22920 _keys!868) (size!22919 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011) (= (size!22920 _keys!868) (bvadd #b00000000000000000000000000000001 mask!1196)) (bvsgt #b00000000000000000000000000000000 (size!22920 _keys!868))))))

(declare-fun b!836984 () Bool)

(declare-fun e!467050 () Bool)

(assert (=> b!836984 (= e!467050 tp_is_empty!15295)))

(declare-fun mapIsEmpty!24533 () Bool)

(assert (=> mapIsEmpty!24533 mapRes!24533))

(declare-fun b!836985 () Bool)

(assert (=> b!836985 (= e!467052 (and e!467050 mapRes!24533))))

(declare-fun condMapEmpty!24533 () Bool)

(declare-fun mapDefault!24533 () ValueCell!7208)

