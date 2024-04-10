; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20650 () Bool)

(assert start!20650)

(declare-fun b_free!5309 () Bool)

(declare-fun b_next!5309 () Bool)

(assert (=> start!20650 (= b_free!5309 (not b_next!5309))))

(declare-fun tp!18959 () Bool)

(declare-fun b_and!12055 () Bool)

(assert (=> start!20650 (= tp!18959 b_and!12055)))

(declare-fun b!206208 () Bool)

(declare-fun e!134796 () Bool)

(declare-fun e!134795 () Bool)

(assert (=> b!206208 (= e!134796 e!134795)))

(declare-fun res!99838 () Bool)

(assert (=> b!206208 (=> res!99838 e!134795)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!206208 (= res!99838 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6533 0))(
  ( (V!6534 (val!2627 Int)) )
))
(declare-datatypes ((tuple2!3990 0))(
  ( (tuple2!3991 (_1!2006 (_ BitVec 64)) (_2!2006 V!6533)) )
))
(declare-datatypes ((List!2882 0))(
  ( (Nil!2879) (Cons!2878 (h!3520 tuple2!3990) (t!7813 List!2882)) )
))
(declare-datatypes ((ListLongMap!2903 0))(
  ( (ListLongMap!2904 (toList!1467 List!2882)) )
))
(declare-fun lt!105342 () ListLongMap!2903)

(declare-fun lt!105348 () ListLongMap!2903)

(assert (=> b!206208 (= lt!105342 lt!105348)))

(declare-fun lt!105343 () ListLongMap!2903)

(declare-fun lt!105344 () tuple2!3990)

(declare-fun +!494 (ListLongMap!2903 tuple2!3990) ListLongMap!2903)

(assert (=> b!206208 (= lt!105348 (+!494 lt!105343 lt!105344))))

(declare-fun lt!105347 () ListLongMap!2903)

(declare-fun lt!105346 () ListLongMap!2903)

(assert (=> b!206208 (= lt!105347 lt!105346)))

(declare-fun lt!105340 () ListLongMap!2903)

(assert (=> b!206208 (= lt!105346 (+!494 lt!105340 lt!105344))))

(declare-fun lt!105351 () ListLongMap!2903)

(assert (=> b!206208 (= lt!105347 (+!494 lt!105351 lt!105344))))

(declare-fun minValue!615 () V!6533)

(assert (=> b!206208 (= lt!105344 (tuple2!3991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206209 () Bool)

(declare-fun e!134798 () Bool)

(assert (=> b!206209 (= e!134798 (not e!134796))))

(declare-fun res!99840 () Bool)

(assert (=> b!206209 (=> res!99840 e!134796)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206209 (= res!99840 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2239 0))(
  ( (ValueCellFull!2239 (v!4597 V!6533)) (EmptyCell!2239) )
))
(declare-datatypes ((array!9541 0))(
  ( (array!9542 (arr!4521 (Array (_ BitVec 32) ValueCell!2239)) (size!4846 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9541)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6533)

(declare-datatypes ((array!9543 0))(
  ( (array!9544 (arr!4522 (Array (_ BitVec 32) (_ BitVec 64))) (size!4847 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9543)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1035 (array!9543 array!9541 (_ BitVec 32) (_ BitVec 32) V!6533 V!6533 (_ BitVec 32) Int) ListLongMap!2903)

(assert (=> b!206209 (= lt!105342 (getCurrentListMap!1035 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105350 () array!9541)

(assert (=> b!206209 (= lt!105347 (getCurrentListMap!1035 _keys!825 lt!105350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206209 (and (= lt!105351 lt!105340) (= lt!105340 lt!105351))))

(declare-fun lt!105345 () tuple2!3990)

(assert (=> b!206209 (= lt!105340 (+!494 lt!105343 lt!105345))))

(declare-fun v!520 () V!6533)

(assert (=> b!206209 (= lt!105345 (tuple2!3991 k!843 v!520))))

(declare-datatypes ((Unit!6276 0))(
  ( (Unit!6277) )
))
(declare-fun lt!105341 () Unit!6276)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!148 (array!9543 array!9541 (_ BitVec 32) (_ BitVec 32) V!6533 V!6533 (_ BitVec 32) (_ BitVec 64) V!6533 (_ BitVec 32) Int) Unit!6276)

(assert (=> b!206209 (= lt!105341 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!148 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!409 (array!9543 array!9541 (_ BitVec 32) (_ BitVec 32) V!6533 V!6533 (_ BitVec 32) Int) ListLongMap!2903)

(assert (=> b!206209 (= lt!105351 (getCurrentListMapNoExtraKeys!409 _keys!825 lt!105350 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206209 (= lt!105350 (array!9542 (store (arr!4521 _values!649) i!601 (ValueCellFull!2239 v!520)) (size!4846 _values!649)))))

(assert (=> b!206209 (= lt!105343 (getCurrentListMapNoExtraKeys!409 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206210 () Bool)

(declare-fun res!99833 () Bool)

(assert (=> b!206210 (=> (not res!99833) (not e!134798))))

(declare-datatypes ((List!2883 0))(
  ( (Nil!2880) (Cons!2879 (h!3521 (_ BitVec 64)) (t!7814 List!2883)) )
))
(declare-fun arrayNoDuplicates!0 (array!9543 (_ BitVec 32) List!2883) Bool)

(assert (=> b!206210 (= res!99833 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2880))))

(declare-fun b!206211 () Bool)

(declare-fun e!134797 () Bool)

(declare-fun tp_is_empty!5165 () Bool)

(assert (=> b!206211 (= e!134797 tp_is_empty!5165)))

(declare-fun b!206212 () Bool)

(assert (=> b!206212 (= e!134795 true)))

(assert (=> b!206212 (= lt!105346 (+!494 lt!105348 lt!105345))))

(declare-fun lt!105349 () Unit!6276)

(declare-fun addCommutativeForDiffKeys!192 (ListLongMap!2903 (_ BitVec 64) V!6533 (_ BitVec 64) V!6533) Unit!6276)

(assert (=> b!206212 (= lt!105349 (addCommutativeForDiffKeys!192 lt!105343 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!99834 () Bool)

(assert (=> start!20650 (=> (not res!99834) (not e!134798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20650 (= res!99834 (validMask!0 mask!1149))))

(assert (=> start!20650 e!134798))

(declare-fun e!134794 () Bool)

(declare-fun array_inv!2989 (array!9541) Bool)

(assert (=> start!20650 (and (array_inv!2989 _values!649) e!134794)))

(assert (=> start!20650 true))

(assert (=> start!20650 tp_is_empty!5165))

(declare-fun array_inv!2990 (array!9543) Bool)

(assert (=> start!20650 (array_inv!2990 _keys!825)))

(assert (=> start!20650 tp!18959))

(declare-fun mapIsEmpty!8816 () Bool)

(declare-fun mapRes!8816 () Bool)

(assert (=> mapIsEmpty!8816 mapRes!8816))

(declare-fun mapNonEmpty!8816 () Bool)

(declare-fun tp!18958 () Bool)

(declare-fun e!134792 () Bool)

(assert (=> mapNonEmpty!8816 (= mapRes!8816 (and tp!18958 e!134792))))

(declare-fun mapRest!8816 () (Array (_ BitVec 32) ValueCell!2239))

(declare-fun mapKey!8816 () (_ BitVec 32))

(declare-fun mapValue!8816 () ValueCell!2239)

(assert (=> mapNonEmpty!8816 (= (arr!4521 _values!649) (store mapRest!8816 mapKey!8816 mapValue!8816))))

(declare-fun b!206213 () Bool)

(declare-fun res!99836 () Bool)

(assert (=> b!206213 (=> (not res!99836) (not e!134798))))

(assert (=> b!206213 (= res!99836 (= (select (arr!4522 _keys!825) i!601) k!843))))

(declare-fun b!206214 () Bool)

(declare-fun res!99841 () Bool)

(assert (=> b!206214 (=> (not res!99841) (not e!134798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206214 (= res!99841 (validKeyInArray!0 k!843))))

(declare-fun b!206215 () Bool)

(declare-fun res!99837 () Bool)

(assert (=> b!206215 (=> (not res!99837) (not e!134798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9543 (_ BitVec 32)) Bool)

(assert (=> b!206215 (= res!99837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206216 () Bool)

(declare-fun res!99835 () Bool)

(assert (=> b!206216 (=> (not res!99835) (not e!134798))))

(assert (=> b!206216 (= res!99835 (and (= (size!4846 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4847 _keys!825) (size!4846 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206217 () Bool)

(assert (=> b!206217 (= e!134792 tp_is_empty!5165)))

(declare-fun b!206218 () Bool)

(assert (=> b!206218 (= e!134794 (and e!134797 mapRes!8816))))

(declare-fun condMapEmpty!8816 () Bool)

(declare-fun mapDefault!8816 () ValueCell!2239)

