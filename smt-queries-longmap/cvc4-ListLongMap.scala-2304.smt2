; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37290 () Bool)

(assert start!37290)

(declare-fun b_free!8417 () Bool)

(declare-fun b_next!8417 () Bool)

(assert (=> start!37290 (= b_free!8417 (not b_next!8417))))

(declare-fun tp!29966 () Bool)

(declare-fun b_and!15659 () Bool)

(assert (=> start!37290 (= tp!29966 b_and!15659)))

(declare-fun b!377826 () Bool)

(declare-fun res!213856 () Bool)

(declare-fun e!230002 () Bool)

(assert (=> b!377826 (=> (not res!213856) (not e!230002))))

(declare-datatypes ((array!22057 0))(
  ( (array!22058 (arr!10497 (Array (_ BitVec 32) (_ BitVec 64))) (size!10849 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22057)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22057 (_ BitVec 32)) Bool)

(assert (=> b!377826 (= res!213856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15162 () Bool)

(declare-fun mapRes!15162 () Bool)

(declare-fun tp!29967 () Bool)

(declare-fun e!230006 () Bool)

(assert (=> mapNonEmpty!15162 (= mapRes!15162 (and tp!29967 e!230006))))

(declare-datatypes ((V!13191 0))(
  ( (V!13192 (val!4577 Int)) )
))
(declare-datatypes ((ValueCell!4189 0))(
  ( (ValueCellFull!4189 (v!6774 V!13191)) (EmptyCell!4189) )
))
(declare-fun mapValue!15162 () ValueCell!4189)

(declare-datatypes ((array!22059 0))(
  ( (array!22060 (arr!10498 (Array (_ BitVec 32) ValueCell!4189)) (size!10850 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22059)

(declare-fun mapRest!15162 () (Array (_ BitVec 32) ValueCell!4189))

(declare-fun mapKey!15162 () (_ BitVec 32))

(assert (=> mapNonEmpty!15162 (= (arr!10498 _values!506) (store mapRest!15162 mapKey!15162 mapValue!15162))))

(declare-fun mapIsEmpty!15162 () Bool)

(assert (=> mapIsEmpty!15162 mapRes!15162))

(declare-fun b!377827 () Bool)

(declare-fun e!230003 () Bool)

(assert (=> b!377827 (= e!230003 true)))

(declare-datatypes ((tuple2!6106 0))(
  ( (tuple2!6107 (_1!3064 (_ BitVec 64)) (_2!3064 V!13191)) )
))
(declare-datatypes ((List!5945 0))(
  ( (Nil!5942) (Cons!5941 (h!6797 tuple2!6106) (t!11095 List!5945)) )
))
(declare-datatypes ((ListLongMap!5019 0))(
  ( (ListLongMap!5020 (toList!2525 List!5945)) )
))
(declare-fun lt!175830 () ListLongMap!5019)

(declare-fun lt!175838 () ListLongMap!5019)

(declare-fun lt!175839 () tuple2!6106)

(declare-fun +!871 (ListLongMap!5019 tuple2!6106) ListLongMap!5019)

(assert (=> b!377827 (= lt!175830 (+!871 lt!175838 lt!175839))))

(declare-fun v!373 () V!13191)

(declare-fun lt!175842 () ListLongMap!5019)

(declare-datatypes ((Unit!11644 0))(
  ( (Unit!11645) )
))
(declare-fun lt!175831 () Unit!11644)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13191)

(declare-fun addCommutativeForDiffKeys!279 (ListLongMap!5019 (_ BitVec 64) V!13191 (_ BitVec 64) V!13191) Unit!11644)

(assert (=> b!377827 (= lt!175831 (addCommutativeForDiffKeys!279 lt!175842 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377828 () Bool)

(declare-fun e!230001 () Bool)

(declare-fun e!230005 () Bool)

(assert (=> b!377828 (= e!230001 (and e!230005 mapRes!15162))))

(declare-fun condMapEmpty!15162 () Bool)

(declare-fun mapDefault!15162 () ValueCell!4189)

