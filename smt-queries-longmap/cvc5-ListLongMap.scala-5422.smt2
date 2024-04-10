; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72316 () Bool)

(assert start!72316)

(declare-fun mapNonEmpty!24650 () Bool)

(declare-fun mapRes!24650 () Bool)

(declare-fun tp!47644 () Bool)

(declare-fun e!467665 () Bool)

(assert (=> mapNonEmpty!24650 (= mapRes!24650 (and tp!47644 e!467665))))

(declare-datatypes ((V!25537 0))(
  ( (V!25538 (val!7731 Int)) )
))
(declare-datatypes ((ValueCell!7244 0))(
  ( (ValueCellFull!7244 (v!10156 V!25537)) (EmptyCell!7244) )
))
(declare-fun mapRest!24650 () (Array (_ BitVec 32) ValueCell!7244))

(declare-datatypes ((array!47030 0))(
  ( (array!47031 (arr!22546 (Array (_ BitVec 32) ValueCell!7244)) (size!22986 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47030)

(declare-fun mapValue!24650 () ValueCell!7244)

(declare-fun mapKey!24650 () (_ BitVec 32))

(assert (=> mapNonEmpty!24650 (= (arr!22546 _values!688) (store mapRest!24650 mapKey!24650 mapValue!24650))))

(declare-fun b!837839 () Bool)

(declare-fun res!569775 () Bool)

(declare-fun e!467666 () Bool)

(assert (=> b!837839 (=> (not res!569775) (not e!467666))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837839 (= res!569775 (validMask!0 mask!1196))))

(declare-fun b!837841 () Bool)

(declare-fun res!569776 () Bool)

(assert (=> b!837841 (=> (not res!569776) (not e!467666))))

(declare-datatypes ((array!47032 0))(
  ( (array!47033 (arr!22547 (Array (_ BitVec 32) (_ BitVec 64))) (size!22987 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47032)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47032 (_ BitVec 32)) Bool)

(assert (=> b!837841 (= res!569776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837842 () Bool)

(declare-fun e!467664 () Bool)

(declare-fun tp_is_empty!15367 () Bool)

(assert (=> b!837842 (= e!467664 tp_is_empty!15367)))

(declare-fun b!837843 () Bool)

(assert (=> b!837843 (= e!467666 false)))

(declare-fun lt!380617 () Bool)

(declare-datatypes ((List!16040 0))(
  ( (Nil!16037) (Cons!16036 (h!17167 (_ BitVec 64)) (t!22411 List!16040)) )
))
(declare-fun arrayNoDuplicates!0 (array!47032 (_ BitVec 32) List!16040) Bool)

(assert (=> b!837843 (= lt!380617 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16037))))

(declare-fun b!837844 () Bool)

(declare-fun res!569774 () Bool)

(assert (=> b!837844 (=> (not res!569774) (not e!467666))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837844 (= res!569774 (and (= (size!22986 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22987 _keys!868) (size!22986 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837840 () Bool)

(assert (=> b!837840 (= e!467665 tp_is_empty!15367)))

(declare-fun res!569777 () Bool)

(assert (=> start!72316 (=> (not res!569777) (not e!467666))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72316 (= res!569777 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22987 _keys!868))))))

(assert (=> start!72316 e!467666))

(assert (=> start!72316 true))

(declare-fun array_inv!17966 (array!47032) Bool)

(assert (=> start!72316 (array_inv!17966 _keys!868)))

(declare-fun e!467668 () Bool)

(declare-fun array_inv!17967 (array!47030) Bool)

(assert (=> start!72316 (and (array_inv!17967 _values!688) e!467668)))

(declare-fun b!837845 () Bool)

(assert (=> b!837845 (= e!467668 (and e!467664 mapRes!24650))))

(declare-fun condMapEmpty!24650 () Bool)

(declare-fun mapDefault!24650 () ValueCell!7244)

