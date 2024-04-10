; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72836 () Bool)

(assert start!72836)

(declare-fun b_free!13751 () Bool)

(declare-fun b_next!13751 () Bool)

(assert (=> start!72836 (= b_free!13751 (not b_next!13751))))

(declare-fun tp!48757 () Bool)

(declare-fun b_and!22837 () Bool)

(assert (=> start!72836 (= tp!48757 b_and!22837)))

(declare-fun b!845275 () Bool)

(declare-fun res!574225 () Bool)

(declare-fun e!471889 () Bool)

(assert (=> b!845275 (=> (not res!574225) (not e!471889))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47994 0))(
  ( (array!47995 (arr!23028 (Array (_ BitVec 32) (_ BitVec 64))) (size!23468 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47994)

(assert (=> b!845275 (= res!574225 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23468 _keys!868))))))

(declare-fun res!574227 () Bool)

(assert (=> start!72836 (=> (not res!574227) (not e!471889))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72836 (= res!574227 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23468 _keys!868))))))

(assert (=> start!72836 e!471889))

(assert (=> start!72836 true))

(assert (=> start!72836 tp!48757))

(declare-fun array_inv!18300 (array!47994) Bool)

(assert (=> start!72836 (array_inv!18300 _keys!868)))

(declare-datatypes ((V!26229 0))(
  ( (V!26230 (val!7991 Int)) )
))
(declare-datatypes ((ValueCell!7504 0))(
  ( (ValueCellFull!7504 (v!10416 V!26229)) (EmptyCell!7504) )
))
(declare-datatypes ((array!47996 0))(
  ( (array!47997 (arr!23029 (Array (_ BitVec 32) ValueCell!7504)) (size!23469 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47996)

(declare-fun e!471888 () Bool)

(declare-fun array_inv!18301 (array!47996) Bool)

(assert (=> start!72836 (and (array_inv!18301 _values!688) e!471888)))

(declare-fun tp_is_empty!15887 () Bool)

(assert (=> start!72836 tp_is_empty!15887))

(declare-fun b!845276 () Bool)

(declare-fun res!574229 () Bool)

(assert (=> b!845276 (=> (not res!574229) (not e!471889))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!845276 (= res!574229 (and (= (select (arr!23028 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!845277 () Bool)

(declare-fun res!574228 () Bool)

(assert (=> b!845277 (=> (not res!574228) (not e!471889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845277 (= res!574228 (validKeyInArray!0 k!854))))

(declare-fun b!845278 () Bool)

(declare-fun e!471891 () Bool)

(declare-fun mapRes!25430 () Bool)

(assert (=> b!845278 (= e!471888 (and e!471891 mapRes!25430))))

(declare-fun condMapEmpty!25430 () Bool)

(declare-fun mapDefault!25430 () ValueCell!7504)

