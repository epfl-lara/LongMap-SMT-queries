; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21176 () Bool)

(assert start!21176)

(declare-fun b_free!5627 () Bool)

(declare-fun b_next!5627 () Bool)

(assert (=> start!21176 (= b_free!5627 (not b_next!5627))))

(declare-fun tp!19952 () Bool)

(declare-fun b_and!12493 () Bool)

(assert (=> start!21176 (= tp!19952 b_and!12493)))

(declare-fun b!213260 () Bool)

(declare-fun e!138717 () Bool)

(declare-fun e!138712 () Bool)

(assert (=> b!213260 (= e!138717 e!138712)))

(declare-fun res!104347 () Bool)

(assert (=> b!213260 (=> res!104347 e!138712)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!213260 (= res!104347 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6965 0))(
  ( (V!6966 (val!2789 Int)) )
))
(declare-datatypes ((tuple2!4224 0))(
  ( (tuple2!4225 (_1!2123 (_ BitVec 64)) (_2!2123 V!6965)) )
))
(declare-datatypes ((List!3110 0))(
  ( (Nil!3107) (Cons!3106 (h!3748 tuple2!4224) (t!8061 List!3110)) )
))
(declare-datatypes ((ListLongMap!3137 0))(
  ( (ListLongMap!3138 (toList!1584 List!3110)) )
))
(declare-fun lt!110147 () ListLongMap!3137)

(declare-fun lt!110141 () ListLongMap!3137)

(assert (=> b!213260 (= lt!110147 lt!110141)))

(declare-fun lt!110138 () ListLongMap!3137)

(declare-fun lt!110143 () tuple2!4224)

(declare-fun +!587 (ListLongMap!3137 tuple2!4224) ListLongMap!3137)

(assert (=> b!213260 (= lt!110141 (+!587 lt!110138 lt!110143))))

(declare-fun lt!110149 () ListLongMap!3137)

(declare-fun lt!110139 () ListLongMap!3137)

(assert (=> b!213260 (= lt!110149 lt!110139)))

(declare-fun lt!110145 () ListLongMap!3137)

(assert (=> b!213260 (= lt!110139 (+!587 lt!110145 lt!110143))))

(declare-fun lt!110146 () ListLongMap!3137)

(assert (=> b!213260 (= lt!110149 (+!587 lt!110146 lt!110143))))

(declare-fun minValue!615 () V!6965)

(assert (=> b!213260 (= lt!110143 (tuple2!4225 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213261 () Bool)

(declare-fun e!138716 () Bool)

(declare-fun tp_is_empty!5489 () Bool)

(assert (=> b!213261 (= e!138716 tp_is_empty!5489)))

(declare-fun b!213262 () Bool)

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2401 0))(
  ( (ValueCellFull!2401 (v!4799 V!6965)) (EmptyCell!2401) )
))
(declare-datatypes ((array!10183 0))(
  ( (array!10184 (arr!4832 (Array (_ BitVec 32) ValueCell!2401)) (size!5157 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10183)

(assert (=> b!213262 (= e!138712 (bvslt i!601 (size!5157 _values!649)))))

(declare-fun lt!110148 () tuple2!4224)

(assert (=> b!213262 (= lt!110139 (+!587 lt!110141 lt!110148))))

(declare-datatypes ((Unit!6466 0))(
  ( (Unit!6467) )
))
(declare-fun lt!110140 () Unit!6466)

(declare-fun v!520 () V!6965)

(declare-fun addCommutativeForDiffKeys!209 (ListLongMap!3137 (_ BitVec 64) V!6965 (_ BitVec 64) V!6965) Unit!6466)

(assert (=> b!213262 (= lt!110140 (addCommutativeForDiffKeys!209 lt!110138 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213263 () Bool)

(declare-fun res!104354 () Bool)

(declare-fun e!138714 () Bool)

(assert (=> b!213263 (=> (not res!104354) (not e!138714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213263 (= res!104354 (validKeyInArray!0 k!843))))

(declare-fun b!213264 () Bool)

(declare-fun res!104348 () Bool)

(assert (=> b!213264 (=> (not res!104348) (not e!138714))))

(declare-datatypes ((array!10185 0))(
  ( (array!10186 (arr!4833 (Array (_ BitVec 32) (_ BitVec 64))) (size!5158 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10185)

(assert (=> b!213264 (= res!104348 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5158 _keys!825))))))

(declare-fun mapIsEmpty!9332 () Bool)

(declare-fun mapRes!9332 () Bool)

(assert (=> mapIsEmpty!9332 mapRes!9332))

(declare-fun b!213265 () Bool)

(declare-fun res!104349 () Bool)

(assert (=> b!213265 (=> (not res!104349) (not e!138714))))

(declare-datatypes ((List!3111 0))(
  ( (Nil!3108) (Cons!3107 (h!3749 (_ BitVec 64)) (t!8062 List!3111)) )
))
(declare-fun arrayNoDuplicates!0 (array!10185 (_ BitVec 32) List!3111) Bool)

(assert (=> b!213265 (= res!104349 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3108))))

(declare-fun b!213266 () Bool)

(declare-fun e!138711 () Bool)

(assert (=> b!213266 (= e!138711 (and e!138716 mapRes!9332))))

(declare-fun condMapEmpty!9332 () Bool)

(declare-fun mapDefault!9332 () ValueCell!2401)

