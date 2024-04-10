; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20482 () Bool)

(assert start!20482)

(declare-fun b_free!5141 () Bool)

(declare-fun b_next!5141 () Bool)

(assert (=> start!20482 (= b_free!5141 (not b_next!5141))))

(declare-fun tp!18454 () Bool)

(declare-fun b_and!11887 () Bool)

(assert (=> start!20482 (= tp!18454 b_and!11887)))

(declare-fun b!203175 () Bool)

(declare-fun res!97556 () Bool)

(declare-fun e!133033 () Bool)

(assert (=> b!203175 (=> (not res!97556) (not e!133033))))

(declare-datatypes ((array!9219 0))(
  ( (array!9220 (arr!4360 (Array (_ BitVec 32) (_ BitVec 64))) (size!4685 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9219)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9219 (_ BitVec 32)) Bool)

(assert (=> b!203175 (= res!97556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203176 () Bool)

(declare-fun e!133034 () Bool)

(declare-fun tp_is_empty!4997 () Bool)

(assert (=> b!203176 (= e!133034 tp_is_empty!4997)))

(declare-fun res!97557 () Bool)

(assert (=> start!20482 (=> (not res!97557) (not e!133033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20482 (= res!97557 (validMask!0 mask!1149))))

(assert (=> start!20482 e!133033))

(declare-datatypes ((V!6309 0))(
  ( (V!6310 (val!2543 Int)) )
))
(declare-datatypes ((ValueCell!2155 0))(
  ( (ValueCellFull!2155 (v!4513 V!6309)) (EmptyCell!2155) )
))
(declare-datatypes ((array!9221 0))(
  ( (array!9222 (arr!4361 (Array (_ BitVec 32) ValueCell!2155)) (size!4686 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9221)

(declare-fun e!133031 () Bool)

(declare-fun array_inv!2883 (array!9221) Bool)

(assert (=> start!20482 (and (array_inv!2883 _values!649) e!133031)))

(assert (=> start!20482 true))

(assert (=> start!20482 tp_is_empty!4997))

(declare-fun array_inv!2884 (array!9219) Bool)

(assert (=> start!20482 (array_inv!2884 _keys!825)))

(assert (=> start!20482 tp!18454))

(declare-fun b!203177 () Bool)

(declare-fun e!133029 () Bool)

(assert (=> b!203177 (= e!133029 true)))

(declare-datatypes ((tuple2!3858 0))(
  ( (tuple2!3859 (_1!1940 (_ BitVec 64)) (_2!1940 V!6309)) )
))
(declare-datatypes ((List!2762 0))(
  ( (Nil!2759) (Cons!2758 (h!3400 tuple2!3858) (t!7693 List!2762)) )
))
(declare-datatypes ((ListLongMap!2771 0))(
  ( (ListLongMap!2772 (toList!1401 List!2762)) )
))
(declare-fun lt!102356 () ListLongMap!2771)

(declare-fun lt!102363 () ListLongMap!2771)

(declare-fun lt!102357 () tuple2!3858)

(declare-fun +!428 (ListLongMap!2771 tuple2!3858) ListLongMap!2771)

(assert (=> b!203177 (= lt!102356 (+!428 lt!102363 lt!102357))))

(declare-fun lt!102354 () ListLongMap!2771)

(declare-fun v!520 () V!6309)

(declare-datatypes ((Unit!6150 0))(
  ( (Unit!6151) )
))
(declare-fun lt!102352 () Unit!6150)

(declare-fun zeroValue!615 () V!6309)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!143 (ListLongMap!2771 (_ BitVec 64) V!6309 (_ BitVec 64) V!6309) Unit!6150)

(assert (=> b!203177 (= lt!102352 (addCommutativeForDiffKeys!143 lt!102354 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203178 () Bool)

(declare-fun e!133028 () Bool)

(assert (=> b!203178 (= e!133028 tp_is_empty!4997)))

(declare-fun b!203179 () Bool)

(declare-fun mapRes!8564 () Bool)

(assert (=> b!203179 (= e!133031 (and e!133034 mapRes!8564))))

(declare-fun condMapEmpty!8564 () Bool)

(declare-fun mapDefault!8564 () ValueCell!2155)

