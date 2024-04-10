; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38150 () Bool)

(assert start!38150)

(declare-fun b_free!9031 () Bool)

(declare-fun b_next!9031 () Bool)

(assert (=> start!38150 (= b_free!9031 (not b_next!9031))))

(declare-fun tp!31874 () Bool)

(declare-fun b_and!16393 () Bool)

(assert (=> start!38150 (= tp!31874 b_and!16393)))

(declare-fun mapNonEmpty!16149 () Bool)

(declare-fun mapRes!16149 () Bool)

(declare-fun tp!31875 () Bool)

(declare-fun e!238089 () Bool)

(assert (=> mapNonEmpty!16149 (= mapRes!16149 (and tp!31875 e!238089))))

(declare-datatypes ((V!14043 0))(
  ( (V!14044 (val!4896 Int)) )
))
(declare-datatypes ((ValueCell!4508 0))(
  ( (ValueCellFull!4508 (v!7133 V!14043)) (EmptyCell!4508) )
))
(declare-fun mapRest!16149 () (Array (_ BitVec 32) ValueCell!4508))

(declare-datatypes ((array!23313 0))(
  ( (array!23314 (arr!11115 (Array (_ BitVec 32) ValueCell!4508)) (size!11467 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23313)

(declare-fun mapKey!16149 () (_ BitVec 32))

(declare-fun mapValue!16149 () ValueCell!4508)

(assert (=> mapNonEmpty!16149 (= (arr!11115 _values!506) (store mapRest!16149 mapKey!16149 mapValue!16149))))

(declare-fun b!393209 () Bool)

(declare-fun res!225258 () Bool)

(declare-fun e!238086 () Bool)

(assert (=> b!393209 (=> (not res!225258) (not e!238086))))

(declare-datatypes ((array!23315 0))(
  ( (array!23316 (arr!11116 (Array (_ BitVec 32) (_ BitVec 64))) (size!11468 (_ BitVec 32))) )
))
(declare-fun lt!186034 () array!23315)

(declare-datatypes ((List!6459 0))(
  ( (Nil!6456) (Cons!6455 (h!7311 (_ BitVec 64)) (t!11629 List!6459)) )
))
(declare-fun arrayNoDuplicates!0 (array!23315 (_ BitVec 32) List!6459) Bool)

(assert (=> b!393209 (= res!225258 (arrayNoDuplicates!0 lt!186034 #b00000000000000000000000000000000 Nil!6456))))

(declare-fun b!393211 () Bool)

(declare-fun e!238088 () Bool)

(assert (=> b!393211 (= e!238088 e!238086)))

(declare-fun res!225249 () Bool)

(assert (=> b!393211 (=> (not res!225249) (not e!238086))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23315 (_ BitVec 32)) Bool)

(assert (=> b!393211 (= res!225249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186034 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23315)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!393211 (= lt!186034 (array!23316 (store (arr!11116 _keys!658) i!548 k!778) (size!11468 _keys!658)))))

(declare-fun b!393212 () Bool)

(declare-fun res!225253 () Bool)

(assert (=> b!393212 (=> (not res!225253) (not e!238088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393212 (= res!225253 (validKeyInArray!0 k!778))))

(declare-fun b!393213 () Bool)

(declare-fun e!238092 () Bool)

(declare-fun tp_is_empty!9703 () Bool)

(assert (=> b!393213 (= e!238092 tp_is_empty!9703)))

(declare-fun b!393214 () Bool)

(declare-fun e!238090 () Bool)

(declare-fun e!238091 () Bool)

(assert (=> b!393214 (= e!238090 e!238091)))

(declare-fun res!225250 () Bool)

(assert (=> b!393214 (=> res!225250 e!238091)))

(assert (=> b!393214 (= res!225250 (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6606 0))(
  ( (tuple2!6607 (_1!3314 (_ BitVec 64)) (_2!3314 V!14043)) )
))
(declare-datatypes ((List!6460 0))(
  ( (Nil!6457) (Cons!6456 (h!7312 tuple2!6606) (t!11630 List!6460)) )
))
(declare-datatypes ((ListLongMap!5519 0))(
  ( (ListLongMap!5520 (toList!2775 List!6460)) )
))
(declare-fun lt!186025 () ListLongMap!5519)

(declare-fun lt!186033 () ListLongMap!5519)

(assert (=> b!393214 (= lt!186025 lt!186033)))

(declare-fun lt!186029 () ListLongMap!5519)

(declare-fun lt!186028 () tuple2!6606)

(declare-fun +!1070 (ListLongMap!5519 tuple2!6606) ListLongMap!5519)

(assert (=> b!393214 (= lt!186033 (+!1070 lt!186029 lt!186028))))

(declare-fun lt!186037 () ListLongMap!5519)

(declare-fun lt!186026 () ListLongMap!5519)

(assert (=> b!393214 (= lt!186037 lt!186026)))

(declare-fun lt!186036 () ListLongMap!5519)

(assert (=> b!393214 (= lt!186026 (+!1070 lt!186036 lt!186028))))

(declare-fun lt!186031 () ListLongMap!5519)

(assert (=> b!393214 (= lt!186037 (+!1070 lt!186031 lt!186028))))

(declare-fun minValue!472 () V!14043)

(assert (=> b!393214 (= lt!186028 (tuple2!6607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!393215 () Bool)

(assert (=> b!393215 (= e!238089 tp_is_empty!9703)))

(declare-fun b!393216 () Bool)

(declare-fun res!225254 () Bool)

(assert (=> b!393216 (=> (not res!225254) (not e!238088))))

(declare-fun arrayContainsKey!0 (array!23315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393216 (= res!225254 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!393217 () Bool)

(declare-fun e!238087 () Bool)

(assert (=> b!393217 (= e!238087 (and e!238092 mapRes!16149))))

(declare-fun condMapEmpty!16149 () Bool)

(declare-fun mapDefault!16149 () ValueCell!4508)

