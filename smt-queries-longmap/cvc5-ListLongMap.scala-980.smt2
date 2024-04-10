; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21178 () Bool)

(assert start!21178)

(declare-fun b_free!5629 () Bool)

(declare-fun b_next!5629 () Bool)

(assert (=> start!21178 (= b_free!5629 (not b_next!5629))))

(declare-fun tp!19958 () Bool)

(declare-fun b_and!12495 () Bool)

(assert (=> start!21178 (= tp!19958 b_and!12495)))

(declare-fun mapNonEmpty!9335 () Bool)

(declare-fun mapRes!9335 () Bool)

(declare-fun tp!19957 () Bool)

(declare-fun e!138734 () Bool)

(assert (=> mapNonEmpty!9335 (= mapRes!9335 (and tp!19957 e!138734))))

(declare-fun mapKey!9335 () (_ BitVec 32))

(declare-datatypes ((V!6969 0))(
  ( (V!6970 (val!2790 Int)) )
))
(declare-datatypes ((ValueCell!2402 0))(
  ( (ValueCellFull!2402 (v!4800 V!6969)) (EmptyCell!2402) )
))
(declare-fun mapRest!9335 () (Array (_ BitVec 32) ValueCell!2402))

(declare-datatypes ((array!10187 0))(
  ( (array!10188 (arr!4834 (Array (_ BitVec 32) ValueCell!2402)) (size!5159 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10187)

(declare-fun mapValue!9335 () ValueCell!2402)

(assert (=> mapNonEmpty!9335 (= (arr!4834 _values!649) (store mapRest!9335 mapKey!9335 mapValue!9335))))

(declare-fun res!104374 () Bool)

(declare-fun e!138737 () Bool)

(assert (=> start!21178 (=> (not res!104374) (not e!138737))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21178 (= res!104374 (validMask!0 mask!1149))))

(assert (=> start!21178 e!138737))

(declare-fun e!138738 () Bool)

(declare-fun array_inv!3197 (array!10187) Bool)

(assert (=> start!21178 (and (array_inv!3197 _values!649) e!138738)))

(assert (=> start!21178 true))

(declare-fun tp_is_empty!5491 () Bool)

(assert (=> start!21178 tp_is_empty!5491))

(declare-datatypes ((array!10189 0))(
  ( (array!10190 (arr!4835 (Array (_ BitVec 32) (_ BitVec 64))) (size!5160 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10189)

(declare-fun array_inv!3198 (array!10189) Bool)

(assert (=> start!21178 (array_inv!3198 _keys!825)))

(assert (=> start!21178 tp!19958))

(declare-fun b!213296 () Bool)

(declare-fun e!138732 () Bool)

(assert (=> b!213296 (= e!138732 tp_is_empty!5491)))

(declare-fun b!213297 () Bool)

(declare-fun res!104377 () Bool)

(assert (=> b!213297 (=> (not res!104377) (not e!138737))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213297 (= res!104377 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5160 _keys!825))))))

(declare-fun b!213298 () Bool)

(declare-fun res!104381 () Bool)

(assert (=> b!213298 (=> (not res!104381) (not e!138737))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!213298 (= res!104381 (= (select (arr!4835 _keys!825) i!601) k!843))))

(declare-fun e!138735 () Bool)

(declare-fun b!213299 () Bool)

(declare-datatypes ((tuple2!4226 0))(
  ( (tuple2!4227 (_1!2124 (_ BitVec 64)) (_2!2124 V!6969)) )
))
(declare-datatypes ((List!3112 0))(
  ( (Nil!3109) (Cons!3108 (h!3750 tuple2!4226) (t!8063 List!3112)) )
))
(declare-datatypes ((ListLongMap!3139 0))(
  ( (ListLongMap!3140 (toList!1585 List!3112)) )
))
(declare-fun lt!110177 () ListLongMap!3139)

(declare-fun lt!110182 () ListLongMap!3139)

(declare-fun lt!110175 () tuple2!4226)

(declare-fun +!588 (ListLongMap!3139 tuple2!4226) ListLongMap!3139)

(assert (=> b!213299 (= e!138735 (= (+!588 lt!110177 lt!110175) lt!110182))))

(declare-fun lt!110183 () ListLongMap!3139)

(declare-fun lt!110174 () ListLongMap!3139)

(assert (=> b!213299 (= lt!110183 (+!588 lt!110174 lt!110175))))

(declare-fun minValue!615 () V!6969)

(declare-fun lt!110178 () ListLongMap!3139)

(declare-fun v!520 () V!6969)

(declare-datatypes ((Unit!6468 0))(
  ( (Unit!6469) )
))
(declare-fun lt!110179 () Unit!6468)

(declare-fun addCommutativeForDiffKeys!210 (ListLongMap!3139 (_ BitVec 64) V!6969 (_ BitVec 64) V!6969) Unit!6468)

(assert (=> b!213299 (= lt!110179 (addCommutativeForDiffKeys!210 lt!110178 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!213300 () Bool)

(declare-fun res!104375 () Bool)

(assert (=> b!213300 (=> (not res!104375) (not e!138737))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!213300 (= res!104375 (and (= (size!5159 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5160 _keys!825) (size!5159 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!213301 () Bool)

(declare-fun e!138736 () Bool)

(assert (=> b!213301 (= e!138736 e!138735)))

(declare-fun res!104376 () Bool)

(assert (=> b!213301 (=> res!104376 e!138735)))

(assert (=> b!213301 (= res!104376 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!213301 (= lt!110177 lt!110174)))

(declare-fun lt!110185 () tuple2!4226)

(assert (=> b!213301 (= lt!110174 (+!588 lt!110178 lt!110185))))

(assert (=> b!213301 (= lt!110182 lt!110183)))

(declare-fun lt!110180 () ListLongMap!3139)

(assert (=> b!213301 (= lt!110183 (+!588 lt!110180 lt!110185))))

(declare-fun lt!110184 () ListLongMap!3139)

(assert (=> b!213301 (= lt!110182 (+!588 lt!110184 lt!110185))))

(assert (=> b!213301 (= lt!110185 (tuple2!4227 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!9335 () Bool)

(assert (=> mapIsEmpty!9335 mapRes!9335))

(declare-fun b!213302 () Bool)

(declare-fun res!104378 () Bool)

(assert (=> b!213302 (=> (not res!104378) (not e!138737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213302 (= res!104378 (validKeyInArray!0 k!843))))

(declare-fun b!213303 () Bool)

(assert (=> b!213303 (= e!138734 tp_is_empty!5491)))

(declare-fun b!213304 () Bool)

(declare-fun res!104379 () Bool)

(assert (=> b!213304 (=> (not res!104379) (not e!138737))))

(declare-datatypes ((List!3113 0))(
  ( (Nil!3110) (Cons!3109 (h!3751 (_ BitVec 64)) (t!8064 List!3113)) )
))
(declare-fun arrayNoDuplicates!0 (array!10189 (_ BitVec 32) List!3113) Bool)

(assert (=> b!213304 (= res!104379 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3110))))

(declare-fun b!213305 () Bool)

(assert (=> b!213305 (= e!138737 (not e!138736))))

(declare-fun res!104380 () Bool)

(assert (=> b!213305 (=> res!104380 e!138736)))

(assert (=> b!213305 (= res!104380 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6969)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1113 (array!10189 array!10187 (_ BitVec 32) (_ BitVec 32) V!6969 V!6969 (_ BitVec 32) Int) ListLongMap!3139)

(assert (=> b!213305 (= lt!110177 (getCurrentListMap!1113 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110181 () array!10187)

(assert (=> b!213305 (= lt!110182 (getCurrentListMap!1113 _keys!825 lt!110181 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213305 (and (= lt!110184 lt!110180) (= lt!110180 lt!110184))))

(assert (=> b!213305 (= lt!110180 (+!588 lt!110178 lt!110175))))

(assert (=> b!213305 (= lt!110175 (tuple2!4227 k!843 v!520))))

(declare-fun lt!110176 () Unit!6468)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!230 (array!10189 array!10187 (_ BitVec 32) (_ BitVec 32) V!6969 V!6969 (_ BitVec 32) (_ BitVec 64) V!6969 (_ BitVec 32) Int) Unit!6468)

(assert (=> b!213305 (= lt!110176 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!230 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!515 (array!10189 array!10187 (_ BitVec 32) (_ BitVec 32) V!6969 V!6969 (_ BitVec 32) Int) ListLongMap!3139)

(assert (=> b!213305 (= lt!110184 (getCurrentListMapNoExtraKeys!515 _keys!825 lt!110181 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213305 (= lt!110181 (array!10188 (store (arr!4834 _values!649) i!601 (ValueCellFull!2402 v!520)) (size!5159 _values!649)))))

(assert (=> b!213305 (= lt!110178 (getCurrentListMapNoExtraKeys!515 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213306 () Bool)

(assert (=> b!213306 (= e!138738 (and e!138732 mapRes!9335))))

(declare-fun condMapEmpty!9335 () Bool)

(declare-fun mapDefault!9335 () ValueCell!2402)

