; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20658 () Bool)

(assert start!20658)

(declare-fun b_free!5317 () Bool)

(declare-fun b_next!5317 () Bool)

(assert (=> start!20658 (= b_free!5317 (not b_next!5317))))

(declare-fun tp!18982 () Bool)

(declare-fun b_and!12063 () Bool)

(assert (=> start!20658 (= tp!18982 b_and!12063)))

(declare-fun b!206352 () Bool)

(declare-fun res!99945 () Bool)

(declare-fun e!134876 () Bool)

(assert (=> b!206352 (=> (not res!99945) (not e!134876))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9557 0))(
  ( (array!9558 (arr!4529 (Array (_ BitVec 32) (_ BitVec 64))) (size!4854 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9557)

(assert (=> b!206352 (= res!99945 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4854 _keys!825))))))

(declare-fun b!206353 () Bool)

(declare-fun e!134881 () Bool)

(declare-fun e!134877 () Bool)

(assert (=> b!206353 (= e!134881 e!134877)))

(declare-fun res!99947 () Bool)

(assert (=> b!206353 (=> res!99947 e!134877)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!206353 (= res!99947 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6545 0))(
  ( (V!6546 (val!2631 Int)) )
))
(declare-datatypes ((tuple2!3998 0))(
  ( (tuple2!3999 (_1!2010 (_ BitVec 64)) (_2!2010 V!6545)) )
))
(declare-datatypes ((List!2889 0))(
  ( (Nil!2886) (Cons!2885 (h!3527 tuple2!3998) (t!7820 List!2889)) )
))
(declare-datatypes ((ListLongMap!2911 0))(
  ( (ListLongMap!2912 (toList!1471 List!2889)) )
))
(declare-fun lt!105494 () ListLongMap!2911)

(declare-fun lt!105485 () ListLongMap!2911)

(assert (=> b!206353 (= lt!105494 lt!105485)))

(declare-fun lt!105493 () ListLongMap!2911)

(declare-fun lt!105487 () tuple2!3998)

(declare-fun +!498 (ListLongMap!2911 tuple2!3998) ListLongMap!2911)

(assert (=> b!206353 (= lt!105485 (+!498 lt!105493 lt!105487))))

(declare-fun lt!105489 () ListLongMap!2911)

(declare-fun lt!105495 () ListLongMap!2911)

(assert (=> b!206353 (= lt!105489 lt!105495)))

(declare-fun lt!105488 () ListLongMap!2911)

(assert (=> b!206353 (= lt!105495 (+!498 lt!105488 lt!105487))))

(declare-fun lt!105491 () ListLongMap!2911)

(assert (=> b!206353 (= lt!105489 (+!498 lt!105491 lt!105487))))

(declare-fun minValue!615 () V!6545)

(assert (=> b!206353 (= lt!105487 (tuple2!3999 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206354 () Bool)

(declare-fun res!99946 () Bool)

(assert (=> b!206354 (=> (not res!99946) (not e!134876))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9557 (_ BitVec 32)) Bool)

(assert (=> b!206354 (= res!99946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206355 () Bool)

(declare-fun res!99941 () Bool)

(assert (=> b!206355 (=> (not res!99941) (not e!134876))))

(declare-datatypes ((List!2890 0))(
  ( (Nil!2887) (Cons!2886 (h!3528 (_ BitVec 64)) (t!7821 List!2890)) )
))
(declare-fun arrayNoDuplicates!0 (array!9557 (_ BitVec 32) List!2890) Bool)

(assert (=> b!206355 (= res!99941 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2887))))

(declare-fun res!99948 () Bool)

(assert (=> start!20658 (=> (not res!99948) (not e!134876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20658 (= res!99948 (validMask!0 mask!1149))))

(assert (=> start!20658 e!134876))

(declare-datatypes ((ValueCell!2243 0))(
  ( (ValueCellFull!2243 (v!4601 V!6545)) (EmptyCell!2243) )
))
(declare-datatypes ((array!9559 0))(
  ( (array!9560 (arr!4530 (Array (_ BitVec 32) ValueCell!2243)) (size!4855 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9559)

(declare-fun e!134880 () Bool)

(declare-fun array_inv!2995 (array!9559) Bool)

(assert (=> start!20658 (and (array_inv!2995 _values!649) e!134880)))

(assert (=> start!20658 true))

(declare-fun tp_is_empty!5173 () Bool)

(assert (=> start!20658 tp_is_empty!5173))

(declare-fun array_inv!2996 (array!9557) Bool)

(assert (=> start!20658 (array_inv!2996 _keys!825)))

(assert (=> start!20658 tp!18982))

(declare-fun mapNonEmpty!8828 () Bool)

(declare-fun mapRes!8828 () Bool)

(declare-fun tp!18983 () Bool)

(declare-fun e!134882 () Bool)

(assert (=> mapNonEmpty!8828 (= mapRes!8828 (and tp!18983 e!134882))))

(declare-fun mapRest!8828 () (Array (_ BitVec 32) ValueCell!2243))

(declare-fun mapValue!8828 () ValueCell!2243)

(declare-fun mapKey!8828 () (_ BitVec 32))

(assert (=> mapNonEmpty!8828 (= (arr!4530 _values!649) (store mapRest!8828 mapKey!8828 mapValue!8828))))

(declare-fun b!206356 () Bool)

(assert (=> b!206356 (= e!134876 (not e!134881))))

(declare-fun res!99943 () Bool)

(assert (=> b!206356 (=> res!99943 e!134881)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206356 (= res!99943 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6545)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1038 (array!9557 array!9559 (_ BitVec 32) (_ BitVec 32) V!6545 V!6545 (_ BitVec 32) Int) ListLongMap!2911)

(assert (=> b!206356 (= lt!105494 (getCurrentListMap!1038 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105486 () array!9559)

(assert (=> b!206356 (= lt!105489 (getCurrentListMap!1038 _keys!825 lt!105486 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206356 (and (= lt!105491 lt!105488) (= lt!105488 lt!105491))))

(declare-fun lt!105490 () tuple2!3998)

(assert (=> b!206356 (= lt!105488 (+!498 lt!105493 lt!105490))))

(declare-fun v!520 () V!6545)

(assert (=> b!206356 (= lt!105490 (tuple2!3999 k!843 v!520))))

(declare-datatypes ((Unit!6284 0))(
  ( (Unit!6285) )
))
(declare-fun lt!105492 () Unit!6284)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!151 (array!9557 array!9559 (_ BitVec 32) (_ BitVec 32) V!6545 V!6545 (_ BitVec 32) (_ BitVec 64) V!6545 (_ BitVec 32) Int) Unit!6284)

(assert (=> b!206356 (= lt!105492 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!151 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!412 (array!9557 array!9559 (_ BitVec 32) (_ BitVec 32) V!6545 V!6545 (_ BitVec 32) Int) ListLongMap!2911)

(assert (=> b!206356 (= lt!105491 (getCurrentListMapNoExtraKeys!412 _keys!825 lt!105486 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206356 (= lt!105486 (array!9560 (store (arr!4530 _values!649) i!601 (ValueCellFull!2243 v!520)) (size!4855 _values!649)))))

(assert (=> b!206356 (= lt!105493 (getCurrentListMapNoExtraKeys!412 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206357 () Bool)

(assert (=> b!206357 (= e!134882 tp_is_empty!5173)))

(declare-fun b!206358 () Bool)

(declare-fun res!99942 () Bool)

(assert (=> b!206358 (=> (not res!99942) (not e!134876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206358 (= res!99942 (validKeyInArray!0 k!843))))

(declare-fun b!206359 () Bool)

(declare-fun res!99944 () Bool)

(assert (=> b!206359 (=> (not res!99944) (not e!134876))))

(assert (=> b!206359 (= res!99944 (= (select (arr!4529 _keys!825) i!601) k!843))))

(declare-fun b!206360 () Bool)

(declare-fun e!134878 () Bool)

(assert (=> b!206360 (= e!134878 tp_is_empty!5173)))

(declare-fun b!206361 () Bool)

(declare-fun res!99949 () Bool)

(assert (=> b!206361 (=> (not res!99949) (not e!134876))))

(assert (=> b!206361 (= res!99949 (and (= (size!4855 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4854 _keys!825) (size!4855 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206362 () Bool)

(assert (=> b!206362 (= e!134877 (bvsle #b00000000000000000000000000000000 (size!4854 _keys!825)))))

(assert (=> b!206362 (= lt!105495 (+!498 lt!105485 lt!105490))))

(declare-fun lt!105484 () Unit!6284)

(declare-fun addCommutativeForDiffKeys!196 (ListLongMap!2911 (_ BitVec 64) V!6545 (_ BitVec 64) V!6545) Unit!6284)

(assert (=> b!206362 (= lt!105484 (addCommutativeForDiffKeys!196 lt!105493 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8828 () Bool)

(assert (=> mapIsEmpty!8828 mapRes!8828))

(declare-fun b!206363 () Bool)

(assert (=> b!206363 (= e!134880 (and e!134878 mapRes!8828))))

(declare-fun condMapEmpty!8828 () Bool)

(declare-fun mapDefault!8828 () ValueCell!2243)

