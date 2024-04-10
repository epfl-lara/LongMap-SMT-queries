; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72274 () Bool)

(assert start!72274)

(declare-fun b!837398 () Bool)

(declare-fun e!467351 () Bool)

(declare-fun tp_is_empty!15325 () Bool)

(assert (=> b!837398 (= e!467351 tp_is_empty!15325)))

(declare-fun mapNonEmpty!24587 () Bool)

(declare-fun mapRes!24587 () Bool)

(declare-fun tp!47581 () Bool)

(declare-fun e!467353 () Bool)

(assert (=> mapNonEmpty!24587 (= mapRes!24587 (and tp!47581 e!467353))))

(declare-datatypes ((V!25481 0))(
  ( (V!25482 (val!7710 Int)) )
))
(declare-datatypes ((ValueCell!7223 0))(
  ( (ValueCellFull!7223 (v!10135 V!25481)) (EmptyCell!7223) )
))
(declare-fun mapValue!24587 () ValueCell!7223)

(declare-fun mapKey!24587 () (_ BitVec 32))

(declare-fun mapRest!24587 () (Array (_ BitVec 32) ValueCell!7223))

(declare-datatypes ((array!46950 0))(
  ( (array!46951 (arr!22506 (Array (_ BitVec 32) ValueCell!7223)) (size!22946 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46950)

(assert (=> mapNonEmpty!24587 (= (arr!22506 _values!688) (store mapRest!24587 mapKey!24587 mapValue!24587))))

(declare-fun mapIsEmpty!24587 () Bool)

(assert (=> mapIsEmpty!24587 mapRes!24587))

(declare-fun b!837400 () Bool)

(declare-fun res!569525 () Bool)

(declare-fun e!467352 () Bool)

(assert (=> b!837400 (=> (not res!569525) (not e!467352))))

(declare-datatypes ((array!46952 0))(
  ( (array!46953 (arr!22507 (Array (_ BitVec 32) (_ BitVec 64))) (size!22947 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46952)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46952 (_ BitVec 32)) Bool)

(assert (=> b!837400 (= res!569525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837401 () Bool)

(declare-fun res!569524 () Bool)

(assert (=> b!837401 (=> (not res!569524) (not e!467352))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837401 (= res!569524 (and (= (size!22946 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22947 _keys!868) (size!22946 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837402 () Bool)

(assert (=> b!837402 (= e!467353 tp_is_empty!15325)))

(declare-fun b!837403 () Bool)

(assert (=> b!837403 (= e!467352 false)))

(declare-fun lt!380554 () Bool)

(declare-datatypes ((List!16026 0))(
  ( (Nil!16023) (Cons!16022 (h!17153 (_ BitVec 64)) (t!22397 List!16026)) )
))
(declare-fun arrayNoDuplicates!0 (array!46952 (_ BitVec 32) List!16026) Bool)

(assert (=> b!837403 (= lt!380554 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16023))))

(declare-fun b!837404 () Bool)

(declare-fun res!569523 () Bool)

(assert (=> b!837404 (=> (not res!569523) (not e!467352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837404 (= res!569523 (validMask!0 mask!1196))))

(declare-fun res!569522 () Bool)

(assert (=> start!72274 (=> (not res!569522) (not e!467352))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72274 (= res!569522 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22947 _keys!868))))))

(assert (=> start!72274 e!467352))

(assert (=> start!72274 true))

(declare-fun array_inv!17942 (array!46952) Bool)

(assert (=> start!72274 (array_inv!17942 _keys!868)))

(declare-fun e!467350 () Bool)

(declare-fun array_inv!17943 (array!46950) Bool)

(assert (=> start!72274 (and (array_inv!17943 _values!688) e!467350)))

(declare-fun b!837399 () Bool)

(assert (=> b!837399 (= e!467350 (and e!467351 mapRes!24587))))

(declare-fun condMapEmpty!24587 () Bool)

(declare-fun mapDefault!24587 () ValueCell!7223)

