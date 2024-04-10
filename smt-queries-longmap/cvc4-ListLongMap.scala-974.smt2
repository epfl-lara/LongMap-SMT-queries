; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21086 () Bool)

(assert start!21086)

(declare-fun b_free!5597 () Bool)

(declare-fun b_next!5597 () Bool)

(assert (=> start!21086 (= b_free!5597 (not b_next!5597))))

(declare-fun tp!19853 () Bool)

(declare-fun b_and!12427 () Bool)

(assert (=> start!21086 (= tp!19853 b_and!12427)))

(declare-fun b!212163 () Bool)

(declare-fun e!138060 () Bool)

(declare-fun tp_is_empty!5459 () Bool)

(assert (=> b!212163 (= e!138060 tp_is_empty!5459)))

(declare-fun b!212164 () Bool)

(declare-fun res!103713 () Bool)

(declare-fun e!138064 () Bool)

(assert (=> b!212164 (=> (not res!103713) (not e!138064))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212164 (= res!103713 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!9278 () Bool)

(declare-fun mapRes!9278 () Bool)

(declare-fun tp!19852 () Bool)

(declare-fun e!138062 () Bool)

(assert (=> mapNonEmpty!9278 (= mapRes!9278 (and tp!19852 e!138062))))

(declare-datatypes ((V!6925 0))(
  ( (V!6926 (val!2774 Int)) )
))
(declare-datatypes ((ValueCell!2386 0))(
  ( (ValueCellFull!2386 (v!4772 V!6925)) (EmptyCell!2386) )
))
(declare-fun mapValue!9278 () ValueCell!2386)

(declare-fun mapRest!9278 () (Array (_ BitVec 32) ValueCell!2386))

(declare-fun mapKey!9278 () (_ BitVec 32))

(declare-datatypes ((array!10121 0))(
  ( (array!10122 (arr!4804 (Array (_ BitVec 32) ValueCell!2386)) (size!5129 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10121)

(assert (=> mapNonEmpty!9278 (= (arr!4804 _values!649) (store mapRest!9278 mapKey!9278 mapValue!9278))))

(declare-fun b!212165 () Bool)

(declare-fun e!138063 () Bool)

(declare-fun e!138065 () Bool)

(assert (=> b!212165 (= e!138063 e!138065)))

(declare-fun res!103714 () Bool)

(assert (=> b!212165 (=> res!103714 e!138065)))

(assert (=> b!212165 (= res!103714 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4198 0))(
  ( (tuple2!4199 (_1!2110 (_ BitVec 64)) (_2!2110 V!6925)) )
))
(declare-datatypes ((List!3088 0))(
  ( (Nil!3085) (Cons!3084 (h!3726 tuple2!4198) (t!8033 List!3088)) )
))
(declare-datatypes ((ListLongMap!3111 0))(
  ( (ListLongMap!3112 (toList!1571 List!3088)) )
))
(declare-fun lt!109306 () ListLongMap!3111)

(declare-fun lt!109303 () ListLongMap!3111)

(assert (=> b!212165 (= lt!109306 lt!109303)))

(declare-fun lt!109305 () ListLongMap!3111)

(declare-fun lt!109313 () tuple2!4198)

(declare-fun +!574 (ListLongMap!3111 tuple2!4198) ListLongMap!3111)

(assert (=> b!212165 (= lt!109303 (+!574 lt!109305 lt!109313))))

(declare-fun lt!109307 () ListLongMap!3111)

(declare-fun lt!109311 () ListLongMap!3111)

(assert (=> b!212165 (= lt!109307 lt!109311)))

(declare-fun lt!109312 () ListLongMap!3111)

(assert (=> b!212165 (= lt!109311 (+!574 lt!109312 lt!109313))))

(declare-fun lt!109304 () ListLongMap!3111)

(assert (=> b!212165 (= lt!109306 (+!574 lt!109304 lt!109313))))

(declare-fun zeroValue!615 () V!6925)

(assert (=> b!212165 (= lt!109313 (tuple2!4199 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!212166 () Bool)

(declare-fun res!103717 () Bool)

(assert (=> b!212166 (=> (not res!103717) (not e!138064))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!10123 0))(
  ( (array!10124 (arr!4805 (Array (_ BitVec 32) (_ BitVec 64))) (size!5130 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10123)

(assert (=> b!212166 (= res!103717 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5130 _keys!825))))))

(declare-fun b!212167 () Bool)

(declare-fun res!103711 () Bool)

(assert (=> b!212167 (=> (not res!103711) (not e!138064))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10123 (_ BitVec 32)) Bool)

(assert (=> b!212167 (= res!103711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212169 () Bool)

(assert (=> b!212169 (= e!138062 tp_is_empty!5459)))

(declare-fun b!212170 () Bool)

(declare-fun res!103709 () Bool)

(assert (=> b!212170 (=> (not res!103709) (not e!138064))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212170 (= res!103709 (and (= (size!5129 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5130 _keys!825) (size!5129 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212171 () Bool)

(assert (=> b!212171 (= e!138064 (not e!138063))))

(declare-fun res!103715 () Bool)

(assert (=> b!212171 (=> res!103715 e!138063)))

(assert (=> b!212171 (= res!103715 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6925)

(declare-fun getCurrentListMap!1104 (array!10123 array!10121 (_ BitVec 32) (_ BitVec 32) V!6925 V!6925 (_ BitVec 32) Int) ListLongMap!3111)

(assert (=> b!212171 (= lt!109307 (getCurrentListMap!1104 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109308 () array!10121)

(assert (=> b!212171 (= lt!109306 (getCurrentListMap!1104 _keys!825 lt!109308 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212171 (and (= lt!109304 lt!109305) (= lt!109305 lt!109304))))

(declare-fun lt!109309 () tuple2!4198)

(assert (=> b!212171 (= lt!109305 (+!574 lt!109312 lt!109309))))

(declare-fun v!520 () V!6925)

(assert (=> b!212171 (= lt!109309 (tuple2!4199 k!843 v!520))))

(declare-datatypes ((Unit!6442 0))(
  ( (Unit!6443) )
))
(declare-fun lt!109314 () Unit!6442)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!221 (array!10123 array!10121 (_ BitVec 32) (_ BitVec 32) V!6925 V!6925 (_ BitVec 32) (_ BitVec 64) V!6925 (_ BitVec 32) Int) Unit!6442)

(assert (=> b!212171 (= lt!109314 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!221 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!506 (array!10123 array!10121 (_ BitVec 32) (_ BitVec 32) V!6925 V!6925 (_ BitVec 32) Int) ListLongMap!3111)

(assert (=> b!212171 (= lt!109304 (getCurrentListMapNoExtraKeys!506 _keys!825 lt!109308 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212171 (= lt!109308 (array!10122 (store (arr!4804 _values!649) i!601 (ValueCellFull!2386 v!520)) (size!5129 _values!649)))))

(assert (=> b!212171 (= lt!109312 (getCurrentListMapNoExtraKeys!506 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212172 () Bool)

(assert (=> b!212172 (= e!138065 (= (+!574 lt!109307 lt!109309) lt!109306))))

(assert (=> b!212172 (= lt!109303 (+!574 lt!109311 lt!109309))))

(declare-fun lt!109310 () Unit!6442)

(declare-fun addCommutativeForDiffKeys!207 (ListLongMap!3111 (_ BitVec 64) V!6925 (_ BitVec 64) V!6925) Unit!6442)

(assert (=> b!212172 (= lt!109310 (addCommutativeForDiffKeys!207 lt!109312 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!9278 () Bool)

(assert (=> mapIsEmpty!9278 mapRes!9278))

(declare-fun b!212173 () Bool)

(declare-fun res!103712 () Bool)

(assert (=> b!212173 (=> (not res!103712) (not e!138064))))

(assert (=> b!212173 (= res!103712 (= (select (arr!4805 _keys!825) i!601) k!843))))

(declare-fun b!212174 () Bool)

(declare-fun e!138061 () Bool)

(assert (=> b!212174 (= e!138061 (and e!138060 mapRes!9278))))

(declare-fun condMapEmpty!9278 () Bool)

(declare-fun mapDefault!9278 () ValueCell!2386)

