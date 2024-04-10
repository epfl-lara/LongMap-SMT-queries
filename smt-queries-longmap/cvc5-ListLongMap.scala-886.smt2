; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20412 () Bool)

(assert start!20412)

(declare-fun b_free!5071 () Bool)

(declare-fun b_next!5071 () Bool)

(assert (=> start!20412 (= b_free!5071 (not b_next!5071))))

(declare-fun tp!18244 () Bool)

(declare-fun b_and!11817 () Bool)

(assert (=> start!20412 (= tp!18244 b_and!11817)))

(declare-fun b!201906 () Bool)

(declare-fun res!96602 () Bool)

(declare-fun e!132297 () Bool)

(assert (=> b!201906 (=> (not res!96602) (not e!132297))))

(declare-datatypes ((array!9083 0))(
  ( (array!9084 (arr!4292 (Array (_ BitVec 32) (_ BitVec 64))) (size!4617 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9083)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9083 (_ BitVec 32)) Bool)

(assert (=> b!201906 (= res!96602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201907 () Bool)

(declare-fun e!132293 () Bool)

(assert (=> b!201907 (= e!132293 true)))

(declare-datatypes ((V!6217 0))(
  ( (V!6218 (val!2508 Int)) )
))
(declare-datatypes ((tuple2!3800 0))(
  ( (tuple2!3801 (_1!1911 (_ BitVec 64)) (_2!1911 V!6217)) )
))
(declare-datatypes ((List!2711 0))(
  ( (Nil!2708) (Cons!2707 (h!3349 tuple2!3800) (t!7642 List!2711)) )
))
(declare-datatypes ((ListLongMap!2713 0))(
  ( (ListLongMap!2714 (toList!1372 List!2711)) )
))
(declare-fun lt!100995 () ListLongMap!2713)

(declare-fun lt!100999 () ListLongMap!2713)

(declare-fun lt!101001 () tuple2!3800)

(declare-fun lt!100994 () tuple2!3800)

(declare-fun +!399 (ListLongMap!2713 tuple2!3800) ListLongMap!2713)

(assert (=> b!201907 (= (+!399 lt!100995 lt!100994) (+!399 lt!100999 lt!101001))))

(declare-datatypes ((Unit!6098 0))(
  ( (Unit!6099) )
))
(declare-fun lt!100997 () Unit!6098)

(declare-fun minValue!615 () V!6217)

(declare-fun v!520 () V!6217)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun lt!101004 () ListLongMap!2713)

(declare-fun addCommutativeForDiffKeys!120 (ListLongMap!2713 (_ BitVec 64) V!6217 (_ BitVec 64) V!6217) Unit!6098)

(assert (=> b!201907 (= lt!100997 (addCommutativeForDiffKeys!120 lt!101004 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8459 () Bool)

(declare-fun mapRes!8459 () Bool)

(assert (=> mapIsEmpty!8459 mapRes!8459))

(declare-fun b!201908 () Bool)

(declare-fun e!132298 () Bool)

(declare-fun tp_is_empty!4927 () Bool)

(assert (=> b!201908 (= e!132298 tp_is_empty!4927)))

(declare-fun b!201909 () Bool)

(declare-fun res!96603 () Bool)

(assert (=> b!201909 (=> (not res!96603) (not e!132297))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201909 (= res!96603 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4617 _keys!825))))))

(declare-fun b!201910 () Bool)

(declare-fun e!132294 () Bool)

(assert (=> b!201910 (= e!132294 (and e!132298 mapRes!8459))))

(declare-fun condMapEmpty!8459 () Bool)

(declare-datatypes ((ValueCell!2120 0))(
  ( (ValueCellFull!2120 (v!4478 V!6217)) (EmptyCell!2120) )
))
(declare-datatypes ((array!9085 0))(
  ( (array!9086 (arr!4293 (Array (_ BitVec 32) ValueCell!2120)) (size!4618 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9085)

(declare-fun mapDefault!8459 () ValueCell!2120)

