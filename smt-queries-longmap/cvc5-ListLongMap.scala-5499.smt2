; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72778 () Bool)

(assert start!72778)

(declare-fun b!844634 () Bool)

(declare-fun e!471454 () Bool)

(declare-fun tp_is_empty!15829 () Bool)

(assert (=> b!844634 (= e!471454 tp_is_empty!15829)))

(declare-fun b!844635 () Bool)

(declare-fun res!573845 () Bool)

(declare-fun e!471457 () Bool)

(assert (=> b!844635 (=> (not res!573845) (not e!471457))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26153 0))(
  ( (V!26154 (val!7962 Int)) )
))
(declare-datatypes ((ValueCell!7475 0))(
  ( (ValueCellFull!7475 (v!10387 V!26153)) (EmptyCell!7475) )
))
(declare-datatypes ((array!47888 0))(
  ( (array!47889 (arr!22975 (Array (_ BitVec 32) ValueCell!7475)) (size!23415 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47888)

(declare-datatypes ((array!47890 0))(
  ( (array!47891 (arr!22976 (Array (_ BitVec 32) (_ BitVec 64))) (size!23416 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47890)

(assert (=> b!844635 (= res!573845 (and (= (size!23415 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23416 _keys!868) (size!23415 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844636 () Bool)

(assert (=> b!844636 (= e!471457 false)))

(declare-fun lt!381310 () Bool)

(declare-datatypes ((List!16279 0))(
  ( (Nil!16276) (Cons!16275 (h!17406 (_ BitVec 64)) (t!22650 List!16279)) )
))
(declare-fun arrayNoDuplicates!0 (array!47890 (_ BitVec 32) List!16279) Bool)

(assert (=> b!844636 (= lt!381310 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16276))))

(declare-fun b!844637 () Bool)

(declare-fun e!471455 () Bool)

(declare-fun mapRes!25343 () Bool)

(assert (=> b!844637 (= e!471455 (and e!471454 mapRes!25343))))

(declare-fun condMapEmpty!25343 () Bool)

(declare-fun mapDefault!25343 () ValueCell!7475)

