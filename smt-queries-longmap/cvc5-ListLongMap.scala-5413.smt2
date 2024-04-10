; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72240 () Bool)

(assert start!72240)

(declare-fun b!837178 () Bool)

(declare-fun res!569387 () Bool)

(declare-fun e!467203 () Bool)

(assert (=> b!837178 (=> (not res!569387) (not e!467203))))

(declare-datatypes ((array!46926 0))(
  ( (array!46927 (arr!22496 (Array (_ BitVec 32) (_ BitVec 64))) (size!22936 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46926)

(assert (=> b!837178 (= res!569387 (and (bvsle #b00000000000000000000000000000000 (size!22936 _keys!868)) (bvslt (size!22936 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun b!837180 () Bool)

(declare-fun res!569384 () Bool)

(assert (=> b!837180 (=> (not res!569384) (not e!467203))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837180 (= res!569384 (validMask!0 mask!1196))))

(declare-fun b!837181 () Bool)

(declare-fun res!569388 () Bool)

(assert (=> b!837181 (=> (not res!569388) (not e!467203))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25465 0))(
  ( (V!25466 (val!7704 Int)) )
))
(declare-datatypes ((ValueCell!7217 0))(
  ( (ValueCellFull!7217 (v!10128 V!25465)) (EmptyCell!7217) )
))
(declare-datatypes ((array!46928 0))(
  ( (array!46929 (arr!22497 (Array (_ BitVec 32) ValueCell!7217)) (size!22937 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46928)

(assert (=> b!837181 (= res!569388 (and (= (size!22937 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22936 _keys!868) (size!22937 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!24563 () Bool)

(declare-fun mapRes!24563 () Bool)

(assert (=> mapIsEmpty!24563 mapRes!24563))

(declare-fun b!837182 () Bool)

(declare-fun e!467204 () Bool)

(declare-fun tp_is_empty!15313 () Bool)

(assert (=> b!837182 (= e!467204 tp_is_empty!15313)))

(declare-fun mapNonEmpty!24563 () Bool)

(declare-fun tp!47557 () Bool)

(declare-fun e!467201 () Bool)

(assert (=> mapNonEmpty!24563 (= mapRes!24563 (and tp!47557 e!467201))))

(declare-fun mapRest!24563 () (Array (_ BitVec 32) ValueCell!7217))

(declare-fun mapKey!24563 () (_ BitVec 32))

(declare-fun mapValue!24563 () ValueCell!7217)

(assert (=> mapNonEmpty!24563 (= (arr!22497 _values!688) (store mapRest!24563 mapKey!24563 mapValue!24563))))

(declare-fun b!837183 () Bool)

(declare-fun res!569386 () Bool)

(assert (=> b!837183 (=> (not res!569386) (not e!467203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46926 (_ BitVec 32)) Bool)

(assert (=> b!837183 (= res!569386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837179 () Bool)

(assert (=> b!837179 (= e!467201 tp_is_empty!15313)))

(declare-fun res!569385 () Bool)

(assert (=> start!72240 (=> (not res!569385) (not e!467203))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72240 (= res!569385 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22936 _keys!868))))))

(assert (=> start!72240 e!467203))

(assert (=> start!72240 true))

(declare-fun array_inv!17934 (array!46926) Bool)

(assert (=> start!72240 (array_inv!17934 _keys!868)))

(declare-fun e!467200 () Bool)

(declare-fun array_inv!17935 (array!46928) Bool)

(assert (=> start!72240 (and (array_inv!17935 _values!688) e!467200)))

(declare-fun b!837184 () Bool)

(assert (=> b!837184 (= e!467200 (and e!467204 mapRes!24563))))

(declare-fun condMapEmpty!24563 () Bool)

(declare-fun mapDefault!24563 () ValueCell!7217)

