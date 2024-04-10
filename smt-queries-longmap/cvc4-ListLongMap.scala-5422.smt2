; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72320 () Bool)

(assert start!72320)

(declare-fun res!569800 () Bool)

(declare-fun e!467696 () Bool)

(assert (=> start!72320 (=> (not res!569800) (not e!467696))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47038 0))(
  ( (array!47039 (arr!22550 (Array (_ BitVec 32) (_ BitVec 64))) (size!22990 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47038)

(assert (=> start!72320 (= res!569800 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22990 _keys!868))))))

(assert (=> start!72320 e!467696))

(assert (=> start!72320 true))

(declare-fun array_inv!17970 (array!47038) Bool)

(assert (=> start!72320 (array_inv!17970 _keys!868)))

(declare-datatypes ((V!25541 0))(
  ( (V!25542 (val!7733 Int)) )
))
(declare-datatypes ((ValueCell!7246 0))(
  ( (ValueCellFull!7246 (v!10158 V!25541)) (EmptyCell!7246) )
))
(declare-datatypes ((array!47040 0))(
  ( (array!47041 (arr!22551 (Array (_ BitVec 32) ValueCell!7246)) (size!22991 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47040)

(declare-fun e!467695 () Bool)

(declare-fun array_inv!17971 (array!47040) Bool)

(assert (=> start!72320 (and (array_inv!17971 _values!688) e!467695)))

(declare-fun b!837881 () Bool)

(declare-fun res!569798 () Bool)

(assert (=> b!837881 (=> (not res!569798) (not e!467696))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47038 (_ BitVec 32)) Bool)

(assert (=> b!837881 (= res!569798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837882 () Bool)

(declare-fun e!467697 () Bool)

(declare-fun tp_is_empty!15371 () Bool)

(assert (=> b!837882 (= e!467697 tp_is_empty!15371)))

(declare-fun b!837883 () Bool)

(declare-fun res!569801 () Bool)

(assert (=> b!837883 (=> (not res!569801) (not e!467696))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837883 (= res!569801 (and (= (size!22991 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22990 _keys!868) (size!22991 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24656 () Bool)

(declare-fun mapRes!24656 () Bool)

(declare-fun tp!47650 () Bool)

(assert (=> mapNonEmpty!24656 (= mapRes!24656 (and tp!47650 e!467697))))

(declare-fun mapRest!24656 () (Array (_ BitVec 32) ValueCell!7246))

(declare-fun mapValue!24656 () ValueCell!7246)

(declare-fun mapKey!24656 () (_ BitVec 32))

(assert (=> mapNonEmpty!24656 (= (arr!22551 _values!688) (store mapRest!24656 mapKey!24656 mapValue!24656))))

(declare-fun b!837884 () Bool)

(declare-fun e!467694 () Bool)

(assert (=> b!837884 (= e!467695 (and e!467694 mapRes!24656))))

(declare-fun condMapEmpty!24656 () Bool)

(declare-fun mapDefault!24656 () ValueCell!7246)

