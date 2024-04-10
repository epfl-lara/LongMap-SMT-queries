; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20924 () Bool)

(assert start!20924)

(declare-fun b_free!5537 () Bool)

(declare-fun b_next!5537 () Bool)

(assert (=> start!20924 (= b_free!5537 (not b_next!5537))))

(declare-fun tp!19657 () Bool)

(declare-fun b_and!12307 () Bool)

(assert (=> start!20924 (= tp!19657 b_and!12307)))

(declare-fun b!210134 () Bool)

(declare-fun res!102491 () Bool)

(declare-fun e!136860 () Bool)

(assert (=> b!210134 (=> (not res!102491) (not e!136860))))

(declare-datatypes ((array!9997 0))(
  ( (array!9998 (arr!4747 (Array (_ BitVec 32) (_ BitVec 64))) (size!5072 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9997)

(declare-datatypes ((List!3042 0))(
  ( (Nil!3039) (Cons!3038 (h!3680 (_ BitVec 64)) (t!7977 List!3042)) )
))
(declare-fun arrayNoDuplicates!0 (array!9997 (_ BitVec 32) List!3042) Bool)

(assert (=> b!210134 (= res!102491 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3039))))

(declare-fun mapNonEmpty!9173 () Bool)

(declare-fun mapRes!9173 () Bool)

(declare-fun tp!19658 () Bool)

(declare-fun e!136857 () Bool)

(assert (=> mapNonEmpty!9173 (= mapRes!9173 (and tp!19658 e!136857))))

(declare-datatypes ((V!6845 0))(
  ( (V!6846 (val!2744 Int)) )
))
(declare-datatypes ((ValueCell!2356 0))(
  ( (ValueCellFull!2356 (v!4722 V!6845)) (EmptyCell!2356) )
))
(declare-fun mapRest!9173 () (Array (_ BitVec 32) ValueCell!2356))

(declare-datatypes ((array!9999 0))(
  ( (array!10000 (arr!4748 (Array (_ BitVec 32) ValueCell!2356)) (size!5073 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9999)

(declare-fun mapKey!9173 () (_ BitVec 32))

(declare-fun mapValue!9173 () ValueCell!2356)

(assert (=> mapNonEmpty!9173 (= (arr!4748 _values!649) (store mapRest!9173 mapKey!9173 mapValue!9173))))

(declare-fun b!210135 () Bool)

(declare-fun res!102497 () Bool)

(assert (=> b!210135 (=> (not res!102497) (not e!136860))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9997 (_ BitVec 32)) Bool)

(assert (=> b!210135 (= res!102497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210136 () Bool)

(declare-fun e!136858 () Bool)

(assert (=> b!210136 (= e!136860 (not e!136858))))

(declare-fun res!102492 () Bool)

(assert (=> b!210136 (=> res!102492 e!136858)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210136 (= res!102492 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6845)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6845)

(declare-datatypes ((tuple2!4148 0))(
  ( (tuple2!4149 (_1!2085 (_ BitVec 64)) (_2!2085 V!6845)) )
))
(declare-datatypes ((List!3043 0))(
  ( (Nil!3040) (Cons!3039 (h!3681 tuple2!4148) (t!7978 List!3043)) )
))
(declare-datatypes ((ListLongMap!3061 0))(
  ( (ListLongMap!3062 (toList!1546 List!3043)) )
))
(declare-fun lt!107550 () ListLongMap!3061)

(declare-fun getCurrentListMap!1083 (array!9997 array!9999 (_ BitVec 32) (_ BitVec 32) V!6845 V!6845 (_ BitVec 32) Int) ListLongMap!3061)

(assert (=> b!210136 (= lt!107550 (getCurrentListMap!1083 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107554 () ListLongMap!3061)

(declare-fun lt!107551 () array!9999)

(assert (=> b!210136 (= lt!107554 (getCurrentListMap!1083 _keys!825 lt!107551 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107553 () ListLongMap!3061)

(declare-fun lt!107548 () ListLongMap!3061)

(assert (=> b!210136 (and (= lt!107553 lt!107548) (= lt!107548 lt!107553))))

(declare-fun lt!107549 () ListLongMap!3061)

(declare-fun v!520 () V!6845)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!549 (ListLongMap!3061 tuple2!4148) ListLongMap!3061)

(assert (=> b!210136 (= lt!107548 (+!549 lt!107549 (tuple2!4149 k!843 v!520)))))

(declare-datatypes ((Unit!6386 0))(
  ( (Unit!6387) )
))
(declare-fun lt!107546 () Unit!6386)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!200 (array!9997 array!9999 (_ BitVec 32) (_ BitVec 32) V!6845 V!6845 (_ BitVec 32) (_ BitVec 64) V!6845 (_ BitVec 32) Int) Unit!6386)

(assert (=> b!210136 (= lt!107546 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!200 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!485 (array!9997 array!9999 (_ BitVec 32) (_ BitVec 32) V!6845 V!6845 (_ BitVec 32) Int) ListLongMap!3061)

(assert (=> b!210136 (= lt!107553 (getCurrentListMapNoExtraKeys!485 _keys!825 lt!107551 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210136 (= lt!107551 (array!10000 (store (arr!4748 _values!649) i!601 (ValueCellFull!2356 v!520)) (size!5073 _values!649)))))

(assert (=> b!210136 (= lt!107549 (getCurrentListMapNoExtraKeys!485 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210137 () Bool)

(declare-fun tp_is_empty!5399 () Bool)

(assert (=> b!210137 (= e!136857 tp_is_empty!5399)))

(declare-fun b!210138 () Bool)

(declare-fun lt!107547 () tuple2!4148)

(declare-fun lt!107552 () tuple2!4148)

(declare-fun e!136863 () Bool)

(assert (=> b!210138 (= e!136863 (= lt!107550 (+!549 (+!549 lt!107549 lt!107552) lt!107547)))))

(declare-fun b!210139 () Bool)

(declare-fun e!136862 () Bool)

(assert (=> b!210139 (= e!136862 tp_is_empty!5399)))

(declare-fun b!210140 () Bool)

(declare-fun res!102493 () Bool)

(assert (=> b!210140 (=> (not res!102493) (not e!136860))))

(assert (=> b!210140 (= res!102493 (= (select (arr!4747 _keys!825) i!601) k!843))))

(declare-fun b!210141 () Bool)

(declare-fun res!102490 () Bool)

(assert (=> b!210141 (=> (not res!102490) (not e!136860))))

(assert (=> b!210141 (= res!102490 (and (= (size!5073 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5072 _keys!825) (size!5073 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210142 () Bool)

(declare-fun e!136861 () Bool)

(assert (=> b!210142 (= e!136861 (and e!136862 mapRes!9173))))

(declare-fun condMapEmpty!9173 () Bool)

(declare-fun mapDefault!9173 () ValueCell!2356)

