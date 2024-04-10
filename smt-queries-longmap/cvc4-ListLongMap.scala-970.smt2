; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21022 () Bool)

(assert start!21022)

(declare-fun b_free!5573 () Bool)

(declare-fun b_next!5573 () Bool)

(assert (=> start!21022 (= b_free!5573 (not b_next!5573))))

(declare-fun tp!19775 () Bool)

(declare-fun b_and!12379 () Bool)

(assert (=> start!21022 (= tp!19775 b_and!12379)))

(declare-fun b!211345 () Bool)

(declare-fun res!103216 () Bool)

(declare-fun e!137574 () Bool)

(assert (=> b!211345 (=> (not res!103216) (not e!137574))))

(declare-datatypes ((array!10071 0))(
  ( (array!10072 (arr!4781 (Array (_ BitVec 32) (_ BitVec 64))) (size!5106 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10071)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!6893 0))(
  ( (V!6894 (val!2762 Int)) )
))
(declare-datatypes ((ValueCell!2374 0))(
  ( (ValueCellFull!2374 (v!4752 V!6893)) (EmptyCell!2374) )
))
(declare-datatypes ((array!10073 0))(
  ( (array!10074 (arr!4782 (Array (_ BitVec 32) ValueCell!2374)) (size!5107 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10073)

(assert (=> b!211345 (= res!103216 (and (= (size!5107 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5106 _keys!825) (size!5107 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211346 () Bool)

(declare-fun e!137571 () Bool)

(declare-fun tp_is_empty!5435 () Bool)

(assert (=> b!211346 (= e!137571 tp_is_empty!5435)))

(declare-fun b!211347 () Bool)

(declare-fun res!103219 () Bool)

(assert (=> b!211347 (=> (not res!103219) (not e!137574))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211347 (= res!103219 (validKeyInArray!0 k!843))))

(declare-fun mapIsEmpty!9236 () Bool)

(declare-fun mapRes!9236 () Bool)

(assert (=> mapIsEmpty!9236 mapRes!9236))

(declare-fun b!211348 () Bool)

(declare-fun e!137575 () Bool)

(assert (=> b!211348 (= e!137574 (not e!137575))))

(declare-fun res!103215 () Bool)

(assert (=> b!211348 (=> res!103215 e!137575)))

(assert (=> b!211348 (= res!103215 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4176 0))(
  ( (tuple2!4177 (_1!2099 (_ BitVec 64)) (_2!2099 V!6893)) )
))
(declare-datatypes ((List!3068 0))(
  ( (Nil!3065) (Cons!3064 (h!3706 tuple2!4176) (t!8009 List!3068)) )
))
(declare-datatypes ((ListLongMap!3089 0))(
  ( (ListLongMap!3090 (toList!1560 List!3068)) )
))
(declare-fun lt!108647 () ListLongMap!3089)

(declare-fun zeroValue!615 () V!6893)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6893)

(declare-fun getCurrentListMap!1094 (array!10071 array!10073 (_ BitVec 32) (_ BitVec 32) V!6893 V!6893 (_ BitVec 32) Int) ListLongMap!3089)

(assert (=> b!211348 (= lt!108647 (getCurrentListMap!1094 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108651 () ListLongMap!3089)

(declare-fun lt!108652 () array!10073)

(assert (=> b!211348 (= lt!108651 (getCurrentListMap!1094 _keys!825 lt!108652 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108654 () ListLongMap!3089)

(declare-fun lt!108653 () ListLongMap!3089)

(assert (=> b!211348 (and (= lt!108654 lt!108653) (= lt!108653 lt!108654))))

(declare-fun v!520 () V!6893)

(declare-fun lt!108649 () ListLongMap!3089)

(declare-fun +!563 (ListLongMap!3089 tuple2!4176) ListLongMap!3089)

(assert (=> b!211348 (= lt!108653 (+!563 lt!108649 (tuple2!4177 k!843 v!520)))))

(declare-datatypes ((Unit!6418 0))(
  ( (Unit!6419) )
))
(declare-fun lt!108650 () Unit!6418)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!211 (array!10071 array!10073 (_ BitVec 32) (_ BitVec 32) V!6893 V!6893 (_ BitVec 32) (_ BitVec 64) V!6893 (_ BitVec 32) Int) Unit!6418)

(assert (=> b!211348 (= lt!108650 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!211 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!496 (array!10071 array!10073 (_ BitVec 32) (_ BitVec 32) V!6893 V!6893 (_ BitVec 32) Int) ListLongMap!3089)

(assert (=> b!211348 (= lt!108654 (getCurrentListMapNoExtraKeys!496 _keys!825 lt!108652 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211348 (= lt!108652 (array!10074 (store (arr!4782 _values!649) i!601 (ValueCellFull!2374 v!520)) (size!5107 _values!649)))))

(assert (=> b!211348 (= lt!108649 (getCurrentListMapNoExtraKeys!496 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9236 () Bool)

(declare-fun tp!19774 () Bool)

(declare-fun e!137576 () Bool)

(assert (=> mapNonEmpty!9236 (= mapRes!9236 (and tp!19774 e!137576))))

(declare-fun mapRest!9236 () (Array (_ BitVec 32) ValueCell!2374))

(declare-fun mapValue!9236 () ValueCell!2374)

(declare-fun mapKey!9236 () (_ BitVec 32))

(assert (=> mapNonEmpty!9236 (= (arr!4782 _values!649) (store mapRest!9236 mapKey!9236 mapValue!9236))))

(declare-fun b!211350 () Bool)

(declare-fun res!103217 () Bool)

(assert (=> b!211350 (=> (not res!103217) (not e!137574))))

(assert (=> b!211350 (= res!103217 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5106 _keys!825))))))

(declare-fun b!211351 () Bool)

(declare-fun e!137573 () Bool)

(assert (=> b!211351 (= e!137573 (and e!137571 mapRes!9236))))

(declare-fun condMapEmpty!9236 () Bool)

(declare-fun mapDefault!9236 () ValueCell!2374)

