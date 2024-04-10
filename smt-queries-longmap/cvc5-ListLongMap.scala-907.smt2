; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20538 () Bool)

(assert start!20538)

(declare-fun b_free!5197 () Bool)

(declare-fun b_next!5197 () Bool)

(assert (=> start!20538 (= b_free!5197 (not b_next!5197))))

(declare-fun tp!18622 () Bool)

(declare-fun b_and!11943 () Bool)

(assert (=> start!20538 (= tp!18622 b_and!11943)))

(declare-fun b!204183 () Bool)

(declare-fun res!98315 () Bool)

(declare-fun e!133620 () Bool)

(assert (=> b!204183 (=> (not res!98315) (not e!133620))))

(declare-datatypes ((array!9325 0))(
  ( (array!9326 (arr!4413 (Array (_ BitVec 32) (_ BitVec 64))) (size!4738 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9325)

(declare-datatypes ((List!2800 0))(
  ( (Nil!2797) (Cons!2796 (h!3438 (_ BitVec 64)) (t!7731 List!2800)) )
))
(declare-fun arrayNoDuplicates!0 (array!9325 (_ BitVec 32) List!2800) Bool)

(assert (=> b!204183 (= res!98315 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2797))))

(declare-fun b!204184 () Bool)

(declare-fun res!98314 () Bool)

(assert (=> b!204184 (=> (not res!98314) (not e!133620))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9325 (_ BitVec 32)) Bool)

(assert (=> b!204184 (= res!98314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204185 () Bool)

(declare-fun res!98318 () Bool)

(assert (=> b!204185 (=> (not res!98318) (not e!133620))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6385 0))(
  ( (V!6386 (val!2571 Int)) )
))
(declare-datatypes ((ValueCell!2183 0))(
  ( (ValueCellFull!2183 (v!4541 V!6385)) (EmptyCell!2183) )
))
(declare-datatypes ((array!9327 0))(
  ( (array!9328 (arr!4414 (Array (_ BitVec 32) ValueCell!2183)) (size!4739 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9327)

(assert (=> b!204185 (= res!98318 (and (= (size!4739 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4738 _keys!825) (size!4739 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204186 () Bool)

(declare-fun e!133617 () Bool)

(declare-fun e!133619 () Bool)

(assert (=> b!204186 (= e!133617 e!133619)))

(declare-fun res!98317 () Bool)

(assert (=> b!204186 (=> res!98317 e!133619)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!204186 (= res!98317 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3900 0))(
  ( (tuple2!3901 (_1!1961 (_ BitVec 64)) (_2!1961 V!6385)) )
))
(declare-datatypes ((List!2801 0))(
  ( (Nil!2798) (Cons!2797 (h!3439 tuple2!3900) (t!7732 List!2801)) )
))
(declare-datatypes ((ListLongMap!2813 0))(
  ( (ListLongMap!2814 (toList!1422 List!2801)) )
))
(declare-fun lt!103366 () ListLongMap!2813)

(declare-fun lt!103362 () ListLongMap!2813)

(assert (=> b!204186 (= lt!103366 lt!103362)))

(declare-fun lt!103370 () ListLongMap!2813)

(declare-fun lt!103360 () tuple2!3900)

(declare-fun +!449 (ListLongMap!2813 tuple2!3900) ListLongMap!2813)

(assert (=> b!204186 (= lt!103362 (+!449 lt!103370 lt!103360))))

(declare-fun lt!103371 () ListLongMap!2813)

(declare-fun lt!103365 () ListLongMap!2813)

(assert (=> b!204186 (= lt!103371 lt!103365)))

(declare-fun lt!103369 () ListLongMap!2813)

(assert (=> b!204186 (= lt!103365 (+!449 lt!103369 lt!103360))))

(declare-fun lt!103367 () ListLongMap!2813)

(assert (=> b!204186 (= lt!103366 (+!449 lt!103367 lt!103360))))

(declare-fun zeroValue!615 () V!6385)

(assert (=> b!204186 (= lt!103360 (tuple2!3901 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8648 () Bool)

(declare-fun mapRes!8648 () Bool)

(assert (=> mapIsEmpty!8648 mapRes!8648))

(declare-fun mapNonEmpty!8648 () Bool)

(declare-fun tp!18623 () Bool)

(declare-fun e!133616 () Bool)

(assert (=> mapNonEmpty!8648 (= mapRes!8648 (and tp!18623 e!133616))))

(declare-fun mapRest!8648 () (Array (_ BitVec 32) ValueCell!2183))

(declare-fun mapValue!8648 () ValueCell!2183)

(declare-fun mapKey!8648 () (_ BitVec 32))

(assert (=> mapNonEmpty!8648 (= (arr!4414 _values!649) (store mapRest!8648 mapKey!8648 mapValue!8648))))

(declare-fun b!204187 () Bool)

(declare-fun res!98312 () Bool)

(assert (=> b!204187 (=> (not res!98312) (not e!133620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204187 (= res!98312 (validKeyInArray!0 k!843))))

(declare-fun b!204188 () Bool)

(declare-fun res!98319 () Bool)

(assert (=> b!204188 (=> (not res!98319) (not e!133620))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204188 (= res!98319 (= (select (arr!4413 _keys!825) i!601) k!843))))

(declare-fun b!204189 () Bool)

(assert (=> b!204189 (= e!133620 (not e!133617))))

(declare-fun res!98313 () Bool)

(assert (=> b!204189 (=> res!98313 e!133617)))

(assert (=> b!204189 (= res!98313 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6385)

(declare-fun getCurrentListMap!996 (array!9325 array!9327 (_ BitVec 32) (_ BitVec 32) V!6385 V!6385 (_ BitVec 32) Int) ListLongMap!2813)

(assert (=> b!204189 (= lt!103371 (getCurrentListMap!996 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103361 () array!9327)

(assert (=> b!204189 (= lt!103366 (getCurrentListMap!996 _keys!825 lt!103361 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204189 (and (= lt!103367 lt!103370) (= lt!103370 lt!103367))))

(declare-fun lt!103363 () tuple2!3900)

(assert (=> b!204189 (= lt!103370 (+!449 lt!103369 lt!103363))))

(declare-fun v!520 () V!6385)

(assert (=> b!204189 (= lt!103363 (tuple2!3901 k!843 v!520))))

(declare-datatypes ((Unit!6192 0))(
  ( (Unit!6193) )
))
(declare-fun lt!103364 () Unit!6192)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!109 (array!9325 array!9327 (_ BitVec 32) (_ BitVec 32) V!6385 V!6385 (_ BitVec 32) (_ BitVec 64) V!6385 (_ BitVec 32) Int) Unit!6192)

(assert (=> b!204189 (= lt!103364 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!109 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!370 (array!9325 array!9327 (_ BitVec 32) (_ BitVec 32) V!6385 V!6385 (_ BitVec 32) Int) ListLongMap!2813)

(assert (=> b!204189 (= lt!103367 (getCurrentListMapNoExtraKeys!370 _keys!825 lt!103361 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204189 (= lt!103361 (array!9328 (store (arr!4414 _values!649) i!601 (ValueCellFull!2183 v!520)) (size!4739 _values!649)))))

(assert (=> b!204189 (= lt!103369 (getCurrentListMapNoExtraKeys!370 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!98320 () Bool)

(assert (=> start!20538 (=> (not res!98320) (not e!133620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20538 (= res!98320 (validMask!0 mask!1149))))

(assert (=> start!20538 e!133620))

(declare-fun e!133618 () Bool)

(declare-fun array_inv!2915 (array!9327) Bool)

(assert (=> start!20538 (and (array_inv!2915 _values!649) e!133618)))

(assert (=> start!20538 true))

(declare-fun tp_is_empty!5053 () Bool)

(assert (=> start!20538 tp_is_empty!5053))

(declare-fun array_inv!2916 (array!9325) Bool)

(assert (=> start!20538 (array_inv!2916 _keys!825)))

(assert (=> start!20538 tp!18622))

(declare-fun b!204190 () Bool)

(assert (=> b!204190 (= e!133619 true)))

(assert (=> b!204190 (= lt!103362 (+!449 lt!103365 lt!103363))))

(declare-fun lt!103368 () Unit!6192)

(declare-fun addCommutativeForDiffKeys!158 (ListLongMap!2813 (_ BitVec 64) V!6385 (_ BitVec 64) V!6385) Unit!6192)

(assert (=> b!204190 (= lt!103368 (addCommutativeForDiffKeys!158 lt!103369 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!204191 () Bool)

(declare-fun e!133622 () Bool)

(assert (=> b!204191 (= e!133618 (and e!133622 mapRes!8648))))

(declare-fun condMapEmpty!8648 () Bool)

(declare-fun mapDefault!8648 () ValueCell!2183)

