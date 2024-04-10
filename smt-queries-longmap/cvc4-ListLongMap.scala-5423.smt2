; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72326 () Bool)

(assert start!72326)

(declare-fun b!837944 () Bool)

(declare-fun e!467743 () Bool)

(declare-fun tp_is_empty!15377 () Bool)

(assert (=> b!837944 (= e!467743 tp_is_empty!15377)))

(declare-fun b!837945 () Bool)

(declare-fun e!467741 () Bool)

(assert (=> b!837945 (= e!467741 tp_is_empty!15377)))

(declare-fun b!837946 () Bool)

(declare-fun res!569835 () Bool)

(declare-fun e!467740 () Bool)

(assert (=> b!837946 (=> (not res!569835) (not e!467740))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837946 (= res!569835 (validMask!0 mask!1196))))

(declare-fun b!837947 () Bool)

(assert (=> b!837947 (= e!467740 false)))

(declare-fun lt!380632 () Bool)

(declare-datatypes ((array!47048 0))(
  ( (array!47049 (arr!22555 (Array (_ BitVec 32) (_ BitVec 64))) (size!22995 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47048)

(declare-datatypes ((List!16043 0))(
  ( (Nil!16040) (Cons!16039 (h!17170 (_ BitVec 64)) (t!22414 List!16043)) )
))
(declare-fun arrayNoDuplicates!0 (array!47048 (_ BitVec 32) List!16043) Bool)

(assert (=> b!837947 (= lt!380632 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16040))))

(declare-fun res!569834 () Bool)

(assert (=> start!72326 (=> (not res!569834) (not e!467740))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72326 (= res!569834 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22995 _keys!868))))))

(assert (=> start!72326 e!467740))

(assert (=> start!72326 true))

(declare-fun array_inv!17974 (array!47048) Bool)

(assert (=> start!72326 (array_inv!17974 _keys!868)))

(declare-datatypes ((V!25549 0))(
  ( (V!25550 (val!7736 Int)) )
))
(declare-datatypes ((ValueCell!7249 0))(
  ( (ValueCellFull!7249 (v!10161 V!25549)) (EmptyCell!7249) )
))
(declare-datatypes ((array!47050 0))(
  ( (array!47051 (arr!22556 (Array (_ BitVec 32) ValueCell!7249)) (size!22996 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47050)

(declare-fun e!467739 () Bool)

(declare-fun array_inv!17975 (array!47050) Bool)

(assert (=> start!72326 (and (array_inv!17975 _values!688) e!467739)))

(declare-fun mapIsEmpty!24665 () Bool)

(declare-fun mapRes!24665 () Bool)

(assert (=> mapIsEmpty!24665 mapRes!24665))

(declare-fun b!837948 () Bool)

(declare-fun res!569837 () Bool)

(assert (=> b!837948 (=> (not res!569837) (not e!467740))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837948 (= res!569837 (and (= (size!22996 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22995 _keys!868) (size!22996 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24665 () Bool)

(declare-fun tp!47659 () Bool)

(assert (=> mapNonEmpty!24665 (= mapRes!24665 (and tp!47659 e!467741))))

(declare-fun mapKey!24665 () (_ BitVec 32))

(declare-fun mapRest!24665 () (Array (_ BitVec 32) ValueCell!7249))

(declare-fun mapValue!24665 () ValueCell!7249)

(assert (=> mapNonEmpty!24665 (= (arr!22556 _values!688) (store mapRest!24665 mapKey!24665 mapValue!24665))))

(declare-fun b!837949 () Bool)

(assert (=> b!837949 (= e!467739 (and e!467743 mapRes!24665))))

(declare-fun condMapEmpty!24665 () Bool)

(declare-fun mapDefault!24665 () ValueCell!7249)

