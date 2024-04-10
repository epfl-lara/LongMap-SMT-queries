; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72808 () Bool)

(assert start!72808)

(declare-fun mapNonEmpty!25388 () Bool)

(declare-fun mapRes!25388 () Bool)

(declare-fun tp!48706 () Bool)

(declare-fun e!471681 () Bool)

(assert (=> mapNonEmpty!25388 (= mapRes!25388 (and tp!48706 e!471681))))

(declare-fun mapKey!25388 () (_ BitVec 32))

(declare-datatypes ((V!26193 0))(
  ( (V!26194 (val!7977 Int)) )
))
(declare-datatypes ((ValueCell!7490 0))(
  ( (ValueCellFull!7490 (v!10402 V!26193)) (EmptyCell!7490) )
))
(declare-datatypes ((array!47944 0))(
  ( (array!47945 (arr!23003 (Array (_ BitVec 32) ValueCell!7490)) (size!23443 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47944)

(declare-fun mapRest!25388 () (Array (_ BitVec 32) ValueCell!7490))

(declare-fun mapValue!25388 () ValueCell!7490)

(assert (=> mapNonEmpty!25388 (= (arr!23003 _values!688) (store mapRest!25388 mapKey!25388 mapValue!25388))))

(declare-fun b!844949 () Bool)

(declare-fun res!574025 () Bool)

(declare-fun e!471678 () Bool)

(assert (=> b!844949 (=> (not res!574025) (not e!471678))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47946 0))(
  ( (array!47947 (arr!23004 (Array (_ BitVec 32) (_ BitVec 64))) (size!23444 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47946)

(assert (=> b!844949 (= res!574025 (and (= (size!23443 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23444 _keys!868) (size!23443 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844950 () Bool)

(declare-fun tp_is_empty!15859 () Bool)

(assert (=> b!844950 (= e!471681 tp_is_empty!15859)))

(declare-fun b!844951 () Bool)

(declare-fun e!471682 () Bool)

(assert (=> b!844951 (= e!471682 tp_is_empty!15859)))

(declare-fun b!844952 () Bool)

(declare-fun res!574024 () Bool)

(assert (=> b!844952 (=> (not res!574024) (not e!471678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844952 (= res!574024 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25388 () Bool)

(assert (=> mapIsEmpty!25388 mapRes!25388))

(declare-fun res!574022 () Bool)

(assert (=> start!72808 (=> (not res!574022) (not e!471678))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72808 (= res!574022 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23444 _keys!868))))))

(assert (=> start!72808 e!471678))

(assert (=> start!72808 true))

(declare-fun array_inv!18286 (array!47946) Bool)

(assert (=> start!72808 (array_inv!18286 _keys!868)))

(declare-fun e!471680 () Bool)

(declare-fun array_inv!18287 (array!47944) Bool)

(assert (=> start!72808 (and (array_inv!18287 _values!688) e!471680)))

(declare-fun b!844953 () Bool)

(assert (=> b!844953 (= e!471680 (and e!471682 mapRes!25388))))

(declare-fun condMapEmpty!25388 () Bool)

(declare-fun mapDefault!25388 () ValueCell!7490)

