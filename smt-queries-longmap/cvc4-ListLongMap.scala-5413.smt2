; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72244 () Bool)

(assert start!72244)

(declare-fun mapIsEmpty!24569 () Bool)

(declare-fun mapRes!24569 () Bool)

(assert (=> mapIsEmpty!24569 mapRes!24569))

(declare-fun b!837226 () Bool)

(declare-fun e!467233 () Bool)

(declare-fun tp_is_empty!15317 () Bool)

(assert (=> b!837226 (= e!467233 tp_is_empty!15317)))

(declare-fun res!569418 () Bool)

(declare-fun e!467234 () Bool)

(assert (=> start!72244 (=> (not res!569418) (not e!467234))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!46934 0))(
  ( (array!46935 (arr!22500 (Array (_ BitVec 32) (_ BitVec 64))) (size!22940 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46934)

(assert (=> start!72244 (= res!569418 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22940 _keys!868))))))

(assert (=> start!72244 e!467234))

(assert (=> start!72244 true))

(declare-fun array_inv!17938 (array!46934) Bool)

(assert (=> start!72244 (array_inv!17938 _keys!868)))

(declare-datatypes ((V!25469 0))(
  ( (V!25470 (val!7706 Int)) )
))
(declare-datatypes ((ValueCell!7219 0))(
  ( (ValueCellFull!7219 (v!10130 V!25469)) (EmptyCell!7219) )
))
(declare-datatypes ((array!46936 0))(
  ( (array!46937 (arr!22501 (Array (_ BitVec 32) ValueCell!7219)) (size!22941 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46936)

(declare-fun e!467231 () Bool)

(declare-fun array_inv!17939 (array!46936) Bool)

(assert (=> start!72244 (and (array_inv!17939 _values!688) e!467231)))

(declare-fun b!837227 () Bool)

(declare-datatypes ((List!16022 0))(
  ( (Nil!16019) (Cons!16018 (h!17149 (_ BitVec 64)) (t!22393 List!16022)) )
))
(declare-fun noDuplicate!1296 (List!16022) Bool)

(assert (=> b!837227 (= e!467234 (not (noDuplicate!1296 Nil!16019)))))

(declare-fun mapNonEmpty!24569 () Bool)

(declare-fun tp!47563 () Bool)

(assert (=> mapNonEmpty!24569 (= mapRes!24569 (and tp!47563 e!467233))))

(declare-fun mapValue!24569 () ValueCell!7219)

(declare-fun mapKey!24569 () (_ BitVec 32))

(declare-fun mapRest!24569 () (Array (_ BitVec 32) ValueCell!7219))

(assert (=> mapNonEmpty!24569 (= (arr!22501 _values!688) (store mapRest!24569 mapKey!24569 mapValue!24569))))

(declare-fun b!837228 () Bool)

(declare-fun res!569414 () Bool)

(assert (=> b!837228 (=> (not res!569414) (not e!467234))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!837228 (= res!569414 (and (= (size!22941 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22940 _keys!868) (size!22941 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837229 () Bool)

(declare-fun e!467230 () Bool)

(assert (=> b!837229 (= e!467231 (and e!467230 mapRes!24569))))

(declare-fun condMapEmpty!24569 () Bool)

(declare-fun mapDefault!24569 () ValueCell!7219)

