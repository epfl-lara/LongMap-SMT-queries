; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72568 () Bool)

(assert start!72568)

(declare-fun b!842429 () Bool)

(declare-fun res!572582 () Bool)

(declare-fun e!469881 () Bool)

(assert (=> b!842429 (=> (not res!572582) (not e!469881))))

(declare-datatypes ((array!47512 0))(
  ( (array!47513 (arr!22787 (Array (_ BitVec 32) (_ BitVec 64))) (size!23227 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47512)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47512 (_ BitVec 32)) Bool)

(assert (=> b!842429 (= res!572582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842430 () Bool)

(declare-fun e!469880 () Bool)

(declare-fun tp_is_empty!15619 () Bool)

(assert (=> b!842430 (= e!469880 tp_is_empty!15619)))

(declare-fun mapNonEmpty!25028 () Bool)

(declare-fun mapRes!25028 () Bool)

(declare-fun tp!48346 () Bool)

(declare-fun e!469882 () Bool)

(assert (=> mapNonEmpty!25028 (= mapRes!25028 (and tp!48346 e!469882))))

(declare-datatypes ((V!25873 0))(
  ( (V!25874 (val!7857 Int)) )
))
(declare-datatypes ((ValueCell!7370 0))(
  ( (ValueCellFull!7370 (v!10282 V!25873)) (EmptyCell!7370) )
))
(declare-fun mapRest!25028 () (Array (_ BitVec 32) ValueCell!7370))

(declare-fun mapValue!25028 () ValueCell!7370)

(declare-fun mapKey!25028 () (_ BitVec 32))

(declare-datatypes ((array!47514 0))(
  ( (array!47515 (arr!22788 (Array (_ BitVec 32) ValueCell!7370)) (size!23228 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47514)

(assert (=> mapNonEmpty!25028 (= (arr!22788 _values!688) (store mapRest!25028 mapKey!25028 mapValue!25028))))

(declare-fun b!842431 () Bool)

(assert (=> b!842431 (= e!469882 tp_is_empty!15619)))

(declare-fun b!842432 () Bool)

(declare-fun res!572585 () Bool)

(assert (=> b!842432 (=> (not res!572585) (not e!469881))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842432 (= res!572585 (and (= (size!23228 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23227 _keys!868) (size!23228 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!842433 () Bool)

(declare-fun res!572584 () Bool)

(assert (=> b!842433 (=> (not res!572584) (not e!469881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842433 (= res!572584 (validMask!0 mask!1196))))

(declare-fun res!572583 () Bool)

(assert (=> start!72568 (=> (not res!572583) (not e!469881))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72568 (= res!572583 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23227 _keys!868))))))

(assert (=> start!72568 e!469881))

(assert (=> start!72568 true))

(declare-fun array_inv!18134 (array!47512) Bool)

(assert (=> start!72568 (array_inv!18134 _keys!868)))

(declare-fun e!469878 () Bool)

(declare-fun array_inv!18135 (array!47514) Bool)

(assert (=> start!72568 (and (array_inv!18135 _values!688) e!469878)))

(declare-fun mapIsEmpty!25028 () Bool)

(assert (=> mapIsEmpty!25028 mapRes!25028))

(declare-fun b!842434 () Bool)

(assert (=> b!842434 (= e!469878 (and e!469880 mapRes!25028))))

(declare-fun condMapEmpty!25028 () Bool)

(declare-fun mapDefault!25028 () ValueCell!7370)

