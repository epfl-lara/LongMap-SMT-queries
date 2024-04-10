; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20848 () Bool)

(assert start!20848)

(declare-fun b_free!5501 () Bool)

(declare-fun b_next!5501 () Bool)

(assert (=> start!20848 (= b_free!5501 (not b_next!5501))))

(declare-fun tp!19543 () Bool)

(declare-fun b_and!12247 () Bool)

(assert (=> start!20848 (= tp!19543 b_and!12247)))

(declare-fun b!209180 () Bool)

(declare-fun res!101920 () Bool)

(declare-fun e!136319 () Bool)

(assert (=> b!209180 (=> (not res!101920) (not e!136319))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209180 (= res!101920 (validKeyInArray!0 k!843))))

(declare-fun b!209181 () Bool)

(declare-fun res!101919 () Bool)

(assert (=> b!209181 (=> (not res!101919) (not e!136319))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9925 0))(
  ( (array!9926 (arr!4713 (Array (_ BitVec 32) (_ BitVec 64))) (size!5038 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9925)

(assert (=> b!209181 (= res!101919 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5038 _keys!825))))))

(declare-fun b!209182 () Bool)

(declare-fun res!101915 () Bool)

(assert (=> b!209182 (=> (not res!101915) (not e!136319))))

(declare-datatypes ((List!3017 0))(
  ( (Nil!3014) (Cons!3013 (h!3655 (_ BitVec 64)) (t!7948 List!3017)) )
))
(declare-fun arrayNoDuplicates!0 (array!9925 (_ BitVec 32) List!3017) Bool)

(assert (=> b!209182 (= res!101915 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3014))))

(declare-fun b!209183 () Bool)

(declare-fun e!136317 () Bool)

(declare-fun tp_is_empty!5363 () Bool)

(assert (=> b!209183 (= e!136317 tp_is_empty!5363)))

(declare-fun b!209185 () Bool)

(assert (=> b!209185 (= e!136319 false)))

(declare-datatypes ((V!6797 0))(
  ( (V!6798 (val!2726 Int)) )
))
(declare-datatypes ((ValueCell!2338 0))(
  ( (ValueCellFull!2338 (v!4696 V!6797)) (EmptyCell!2338) )
))
(declare-datatypes ((array!9927 0))(
  ( (array!9928 (arr!4714 (Array (_ BitVec 32) ValueCell!2338)) (size!5039 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9927)

(declare-datatypes ((tuple2!4122 0))(
  ( (tuple2!4123 (_1!2072 (_ BitVec 64)) (_2!2072 V!6797)) )
))
(declare-datatypes ((List!3018 0))(
  ( (Nil!3015) (Cons!3014 (h!3656 tuple2!4122) (t!7949 List!3018)) )
))
(declare-datatypes ((ListLongMap!3035 0))(
  ( (ListLongMap!3036 (toList!1533 List!3018)) )
))
(declare-fun lt!106935 () ListLongMap!3035)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!6797)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6797)

(declare-fun zeroValue!615 () V!6797)

(declare-fun getCurrentListMapNoExtraKeys!474 (array!9925 array!9927 (_ BitVec 32) (_ BitVec 32) V!6797 V!6797 (_ BitVec 32) Int) ListLongMap!3035)

(assert (=> b!209185 (= lt!106935 (getCurrentListMapNoExtraKeys!474 _keys!825 (array!9928 (store (arr!4714 _values!649) i!601 (ValueCellFull!2338 v!520)) (size!5039 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106934 () ListLongMap!3035)

(assert (=> b!209185 (= lt!106934 (getCurrentListMapNoExtraKeys!474 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9113 () Bool)

(declare-fun mapRes!9113 () Bool)

(declare-fun tp!19544 () Bool)

(assert (=> mapNonEmpty!9113 (= mapRes!9113 (and tp!19544 e!136317))))

(declare-fun mapKey!9113 () (_ BitVec 32))

(declare-fun mapValue!9113 () ValueCell!2338)

(declare-fun mapRest!9113 () (Array (_ BitVec 32) ValueCell!2338))

(assert (=> mapNonEmpty!9113 (= (arr!4714 _values!649) (store mapRest!9113 mapKey!9113 mapValue!9113))))

(declare-fun b!209186 () Bool)

(declare-fun res!101917 () Bool)

(assert (=> b!209186 (=> (not res!101917) (not e!136319))))

(assert (=> b!209186 (= res!101917 (= (select (arr!4713 _keys!825) i!601) k!843))))

(declare-fun b!209187 () Bool)

(declare-fun e!136316 () Bool)

(assert (=> b!209187 (= e!136316 tp_is_empty!5363)))

(declare-fun b!209188 () Bool)

(declare-fun e!136318 () Bool)

(assert (=> b!209188 (= e!136318 (and e!136316 mapRes!9113))))

(declare-fun condMapEmpty!9113 () Bool)

(declare-fun mapDefault!9113 () ValueCell!2338)

