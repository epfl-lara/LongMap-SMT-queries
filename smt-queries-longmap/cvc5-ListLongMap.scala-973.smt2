; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21076 () Bool)

(assert start!21076)

(declare-fun b_free!5587 () Bool)

(declare-fun b_next!5587 () Bool)

(assert (=> start!21076 (= b_free!5587 (not b_next!5587))))

(declare-fun tp!19823 () Bool)

(declare-fun b_and!12417 () Bool)

(assert (=> start!21076 (= tp!19823 b_and!12417)))

(declare-fun b!211983 () Bool)

(declare-fun e!137958 () Bool)

(declare-fun e!137955 () Bool)

(assert (=> b!211983 (= e!137958 e!137955)))

(declare-fun res!103578 () Bool)

(assert (=> b!211983 (=> res!103578 e!137955)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!211983 (= res!103578 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6913 0))(
  ( (V!6914 (val!2769 Int)) )
))
(declare-datatypes ((tuple2!4188 0))(
  ( (tuple2!4189 (_1!2105 (_ BitVec 64)) (_2!2105 V!6913)) )
))
(declare-datatypes ((List!3079 0))(
  ( (Nil!3076) (Cons!3075 (h!3717 tuple2!4188) (t!8024 List!3079)) )
))
(declare-datatypes ((ListLongMap!3101 0))(
  ( (ListLongMap!3102 (toList!1566 List!3079)) )
))
(declare-fun lt!109129 () ListLongMap!3101)

(declare-fun lt!109133 () ListLongMap!3101)

(assert (=> b!211983 (= lt!109129 lt!109133)))

(declare-fun lt!109131 () ListLongMap!3101)

(declare-fun lt!109124 () tuple2!4188)

(declare-fun +!569 (ListLongMap!3101 tuple2!4188) ListLongMap!3101)

(assert (=> b!211983 (= lt!109133 (+!569 lt!109131 lt!109124))))

(declare-fun lt!109127 () ListLongMap!3101)

(declare-fun lt!109134 () ListLongMap!3101)

(assert (=> b!211983 (= lt!109127 lt!109134)))

(declare-fun lt!109126 () ListLongMap!3101)

(assert (=> b!211983 (= lt!109134 (+!569 lt!109126 lt!109124))))

(declare-fun lt!109123 () ListLongMap!3101)

(assert (=> b!211983 (= lt!109129 (+!569 lt!109123 lt!109124))))

(declare-fun zeroValue!615 () V!6913)

(assert (=> b!211983 (= lt!109124 (tuple2!4189 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211984 () Bool)

(declare-fun res!103574 () Bool)

(declare-fun e!137954 () Bool)

(assert (=> b!211984 (=> (not res!103574) (not e!137954))))

(declare-datatypes ((array!10101 0))(
  ( (array!10102 (arr!4794 (Array (_ BitVec 32) (_ BitVec 64))) (size!5119 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10101)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2381 0))(
  ( (ValueCellFull!2381 (v!4767 V!6913)) (EmptyCell!2381) )
))
(declare-datatypes ((array!10103 0))(
  ( (array!10104 (arr!4795 (Array (_ BitVec 32) ValueCell!2381)) (size!5120 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10103)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!211984 (= res!103574 (and (= (size!5120 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5119 _keys!825) (size!5120 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211985 () Bool)

(declare-fun res!103576 () Bool)

(assert (=> b!211985 (=> (not res!103576) (not e!137954))))

(declare-datatypes ((List!3080 0))(
  ( (Nil!3077) (Cons!3076 (h!3718 (_ BitVec 64)) (t!8025 List!3080)) )
))
(declare-fun arrayNoDuplicates!0 (array!10101 (_ BitVec 32) List!3080) Bool)

(assert (=> b!211985 (= res!103576 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3077))))

(declare-fun b!211986 () Bool)

(declare-fun res!103577 () Bool)

(assert (=> b!211986 (=> (not res!103577) (not e!137954))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!211986 (= res!103577 (= (select (arr!4794 _keys!825) i!601) k!843))))

(declare-fun mapIsEmpty!9263 () Bool)

(declare-fun mapRes!9263 () Bool)

(assert (=> mapIsEmpty!9263 mapRes!9263))

(declare-fun b!211987 () Bool)

(declare-fun res!103582 () Bool)

(assert (=> b!211987 (=> (not res!103582) (not e!137954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10101 (_ BitVec 32)) Bool)

(assert (=> b!211987 (= res!103582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211988 () Bool)

(assert (=> b!211988 (= e!137955 (bvslt i!601 (size!5120 _values!649)))))

(declare-fun lt!109130 () tuple2!4188)

(assert (=> b!211988 (= lt!109133 (+!569 lt!109134 lt!109130))))

(declare-datatypes ((Unit!6432 0))(
  ( (Unit!6433) )
))
(declare-fun lt!109125 () Unit!6432)

(declare-fun v!520 () V!6913)

(declare-fun addCommutativeForDiffKeys!203 (ListLongMap!3101 (_ BitVec 64) V!6913 (_ BitVec 64) V!6913) Unit!6432)

(assert (=> b!211988 (= lt!109125 (addCommutativeForDiffKeys!203 lt!109126 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211989 () Bool)

(assert (=> b!211989 (= e!137954 (not e!137958))))

(declare-fun res!103579 () Bool)

(assert (=> b!211989 (=> res!103579 e!137958)))

(assert (=> b!211989 (= res!103579 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6913)

(declare-fun getCurrentListMap!1099 (array!10101 array!10103 (_ BitVec 32) (_ BitVec 32) V!6913 V!6913 (_ BitVec 32) Int) ListLongMap!3101)

(assert (=> b!211989 (= lt!109127 (getCurrentListMap!1099 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109132 () array!10103)

(assert (=> b!211989 (= lt!109129 (getCurrentListMap!1099 _keys!825 lt!109132 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211989 (and (= lt!109123 lt!109131) (= lt!109131 lt!109123))))

(assert (=> b!211989 (= lt!109131 (+!569 lt!109126 lt!109130))))

(assert (=> b!211989 (= lt!109130 (tuple2!4189 k!843 v!520))))

(declare-fun lt!109128 () Unit!6432)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!216 (array!10101 array!10103 (_ BitVec 32) (_ BitVec 32) V!6913 V!6913 (_ BitVec 32) (_ BitVec 64) V!6913 (_ BitVec 32) Int) Unit!6432)

(assert (=> b!211989 (= lt!109128 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!216 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!501 (array!10101 array!10103 (_ BitVec 32) (_ BitVec 32) V!6913 V!6913 (_ BitVec 32) Int) ListLongMap!3101)

(assert (=> b!211989 (= lt!109123 (getCurrentListMapNoExtraKeys!501 _keys!825 lt!109132 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211989 (= lt!109132 (array!10104 (store (arr!4795 _values!649) i!601 (ValueCellFull!2381 v!520)) (size!5120 _values!649)))))

(assert (=> b!211989 (= lt!109126 (getCurrentListMapNoExtraKeys!501 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211990 () Bool)

(declare-fun e!137957 () Bool)

(declare-fun e!137956 () Bool)

(assert (=> b!211990 (= e!137957 (and e!137956 mapRes!9263))))

(declare-fun condMapEmpty!9263 () Bool)

(declare-fun mapDefault!9263 () ValueCell!2381)

