; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72892 () Bool)

(assert start!72892)

(declare-fun b_free!13807 () Bool)

(declare-fun b_next!13807 () Bool)

(assert (=> start!72892 (= b_free!13807 (not b_next!13807))))

(declare-fun tp!48924 () Bool)

(declare-fun b_and!22893 () Bool)

(assert (=> start!72892 (= tp!48924 b_and!22893)))

(declare-fun b!846199 () Bool)

(declare-fun e!472311 () Bool)

(declare-fun tp_is_empty!15943 () Bool)

(assert (=> b!846199 (= e!472311 tp_is_empty!15943)))

(declare-fun b!846200 () Bool)

(declare-fun res!574899 () Bool)

(declare-fun e!472309 () Bool)

(assert (=> b!846200 (=> (not res!574899) (not e!472309))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!846200 (= res!574899 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25514 () Bool)

(declare-fun mapRes!25514 () Bool)

(assert (=> mapIsEmpty!25514 mapRes!25514))

(declare-fun res!574895 () Bool)

(assert (=> start!72892 (=> (not res!574895) (not e!472309))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48100 0))(
  ( (array!48101 (arr!23081 (Array (_ BitVec 32) (_ BitVec 64))) (size!23521 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48100)

(assert (=> start!72892 (= res!574895 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23521 _keys!868))))))

(assert (=> start!72892 e!472309))

(assert (=> start!72892 tp_is_empty!15943))

(assert (=> start!72892 true))

(assert (=> start!72892 tp!48924))

(declare-fun array_inv!18338 (array!48100) Bool)

(assert (=> start!72892 (array_inv!18338 _keys!868)))

(declare-datatypes ((V!26305 0))(
  ( (V!26306 (val!8019 Int)) )
))
(declare-datatypes ((ValueCell!7532 0))(
  ( (ValueCellFull!7532 (v!10444 V!26305)) (EmptyCell!7532) )
))
(declare-datatypes ((array!48102 0))(
  ( (array!48103 (arr!23082 (Array (_ BitVec 32) ValueCell!7532)) (size!23522 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48102)

(declare-fun e!472310 () Bool)

(declare-fun array_inv!18339 (array!48102) Bool)

(assert (=> start!72892 (and (array_inv!18339 _values!688) e!472310)))

(declare-fun b!846201 () Bool)

(declare-fun e!472308 () Bool)

(assert (=> b!846201 (= e!472308 tp_is_empty!15943)))

(declare-fun b!846202 () Bool)

(declare-fun res!574896 () Bool)

(assert (=> b!846202 (=> (not res!574896) (not e!472309))))

(declare-datatypes ((List!16334 0))(
  ( (Nil!16331) (Cons!16330 (h!17461 (_ BitVec 64)) (t!22705 List!16334)) )
))
(declare-fun arrayNoDuplicates!0 (array!48100 (_ BitVec 32) List!16334) Bool)

(assert (=> b!846202 (= res!574896 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16331))))

(declare-fun mapNonEmpty!25514 () Bool)

(declare-fun tp!48925 () Bool)

(assert (=> mapNonEmpty!25514 (= mapRes!25514 (and tp!48925 e!472308))))

(declare-fun mapRest!25514 () (Array (_ BitVec 32) ValueCell!7532))

(declare-fun mapValue!25514 () ValueCell!7532)

(declare-fun mapKey!25514 () (_ BitVec 32))

(assert (=> mapNonEmpty!25514 (= (arr!23082 _values!688) (store mapRest!25514 mapKey!25514 mapValue!25514))))

(declare-fun b!846203 () Bool)

(declare-fun res!574897 () Bool)

(assert (=> b!846203 (=> (not res!574897) (not e!472309))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!846203 (= res!574897 (and (= (size!23522 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23521 _keys!868) (size!23522 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!846204 () Bool)

(declare-fun res!574901 () Bool)

(assert (=> b!846204 (=> (not res!574901) (not e!472309))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!846204 (= res!574901 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23521 _keys!868))))))

(declare-fun b!846205 () Bool)

(declare-fun res!574894 () Bool)

(assert (=> b!846205 (=> (not res!574894) (not e!472309))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!846205 (= res!574894 (and (= (select (arr!23081 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!846206 () Bool)

(assert (=> b!846206 (= e!472310 (and e!472311 mapRes!25514))))

(declare-fun condMapEmpty!25514 () Bool)

(declare-fun mapDefault!25514 () ValueCell!7532)

