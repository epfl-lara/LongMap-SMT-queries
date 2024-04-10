; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72208 () Bool)

(assert start!72208)

(declare-fun b!836936 () Bool)

(declare-fun e!467005 () Bool)

(declare-fun tp_is_empty!15289 () Bool)

(assert (=> b!836936 (= e!467005 tp_is_empty!15289)))

(declare-fun mapIsEmpty!24524 () Bool)

(declare-fun mapRes!24524 () Bool)

(assert (=> mapIsEmpty!24524 mapRes!24524))

(declare-fun b!836937 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun e!467008 () Bool)

(declare-datatypes ((array!46878 0))(
  ( (array!46879 (arr!22473 (Array (_ BitVec 32) (_ BitVec 64))) (size!22913 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46878)

(declare-datatypes ((V!25433 0))(
  ( (V!25434 (val!7692 Int)) )
))
(declare-datatypes ((ValueCell!7205 0))(
  ( (ValueCellFull!7205 (v!10116 V!25433)) (EmptyCell!7205) )
))
(declare-datatypes ((array!46880 0))(
  ( (array!46881 (arr!22474 (Array (_ BitVec 32) ValueCell!7205)) (size!22914 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46880)

(assert (=> b!836937 (= e!467008 (and (= (size!22914 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22913 _keys!868) (size!22914 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011) (not (= (size!22913 _keys!868) (bvadd #b00000000000000000000000000000001 mask!1196)))))))

(declare-fun res!569265 () Bool)

(assert (=> start!72208 (=> (not res!569265) (not e!467008))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72208 (= res!569265 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22913 _keys!868))))))

(assert (=> start!72208 e!467008))

(assert (=> start!72208 true))

(declare-fun array_inv!17920 (array!46878) Bool)

(assert (=> start!72208 (array_inv!17920 _keys!868)))

(declare-fun e!467006 () Bool)

(declare-fun array_inv!17921 (array!46880) Bool)

(assert (=> start!72208 (and (array_inv!17921 _values!688) e!467006)))

(declare-fun mapNonEmpty!24524 () Bool)

(declare-fun tp!47518 () Bool)

(declare-fun e!467009 () Bool)

(assert (=> mapNonEmpty!24524 (= mapRes!24524 (and tp!47518 e!467009))))

(declare-fun mapRest!24524 () (Array (_ BitVec 32) ValueCell!7205))

(declare-fun mapValue!24524 () ValueCell!7205)

(declare-fun mapKey!24524 () (_ BitVec 32))

(assert (=> mapNonEmpty!24524 (= (arr!22474 _values!688) (store mapRest!24524 mapKey!24524 mapValue!24524))))

(declare-fun b!836938 () Bool)

(declare-fun res!569264 () Bool)

(assert (=> b!836938 (=> (not res!569264) (not e!467008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!836938 (= res!569264 (validMask!0 mask!1196))))

(declare-fun b!836939 () Bool)

(assert (=> b!836939 (= e!467006 (and e!467005 mapRes!24524))))

(declare-fun condMapEmpty!24524 () Bool)

(declare-fun mapDefault!24524 () ValueCell!7205)

