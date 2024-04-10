; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72734 () Bool)

(assert start!72734)

(declare-fun mapNonEmpty!25277 () Bool)

(declare-fun mapRes!25277 () Bool)

(declare-fun tp!48595 () Bool)

(declare-fun e!471127 () Bool)

(assert (=> mapNonEmpty!25277 (= mapRes!25277 (and tp!48595 e!471127))))

(declare-datatypes ((V!26093 0))(
  ( (V!26094 (val!7940 Int)) )
))
(declare-datatypes ((ValueCell!7453 0))(
  ( (ValueCellFull!7453 (v!10365 V!26093)) (EmptyCell!7453) )
))
(declare-fun mapRest!25277 () (Array (_ BitVec 32) ValueCell!7453))

(declare-fun mapKey!25277 () (_ BitVec 32))

(declare-datatypes ((array!47808 0))(
  ( (array!47809 (arr!22935 (Array (_ BitVec 32) ValueCell!7453)) (size!23375 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47808)

(declare-fun mapValue!25277 () ValueCell!7453)

(assert (=> mapNonEmpty!25277 (= (arr!22935 _values!688) (store mapRest!25277 mapKey!25277 mapValue!25277))))

(declare-fun b!844172 () Bool)

(declare-fun res!573578 () Bool)

(declare-fun e!471123 () Bool)

(assert (=> b!844172 (=> (not res!573578) (not e!471123))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47810 0))(
  ( (array!47811 (arr!22936 (Array (_ BitVec 32) (_ BitVec 64))) (size!23376 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47810)

(assert (=> b!844172 (= res!573578 (and (= (size!23375 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23376 _keys!868) (size!23375 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844173 () Bool)

(assert (=> b!844173 (= e!471123 false)))

(declare-fun lt!381244 () Bool)

(declare-datatypes ((List!16263 0))(
  ( (Nil!16260) (Cons!16259 (h!17390 (_ BitVec 64)) (t!22634 List!16263)) )
))
(declare-fun arrayNoDuplicates!0 (array!47810 (_ BitVec 32) List!16263) Bool)

(assert (=> b!844173 (= lt!381244 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16260))))

(declare-fun b!844174 () Bool)

(declare-fun tp_is_empty!15785 () Bool)

(assert (=> b!844174 (= e!471127 tp_is_empty!15785)))

(declare-fun res!573580 () Bool)

(assert (=> start!72734 (=> (not res!573580) (not e!471123))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72734 (= res!573580 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23376 _keys!868))))))

(assert (=> start!72734 e!471123))

(assert (=> start!72734 true))

(declare-fun array_inv!18240 (array!47810) Bool)

(assert (=> start!72734 (array_inv!18240 _keys!868)))

(declare-fun e!471124 () Bool)

(declare-fun array_inv!18241 (array!47808) Bool)

(assert (=> start!72734 (and (array_inv!18241 _values!688) e!471124)))

(declare-fun b!844175 () Bool)

(declare-fun e!471125 () Bool)

(assert (=> b!844175 (= e!471124 (and e!471125 mapRes!25277))))

(declare-fun condMapEmpty!25277 () Bool)

(declare-fun mapDefault!25277 () ValueCell!7453)

