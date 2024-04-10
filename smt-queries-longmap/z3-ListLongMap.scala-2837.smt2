; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40988 () Bool)

(assert start!40988)

(declare-fun b_free!10923 () Bool)

(declare-fun b_next!10923 () Bool)

(assert (=> start!40988 (= b_free!10923 (not b_next!10923))))

(declare-fun tp!38596 () Bool)

(declare-fun b_and!19065 () Bool)

(assert (=> start!40988 (= tp!38596 b_and!19065)))

(declare-fun res!272335 () Bool)

(declare-fun e!266671 () Bool)

(assert (=> start!40988 (=> (not res!272335) (not e!266671))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28325 0))(
  ( (array!28326 (arr!13606 (Array (_ BitVec 32) (_ BitVec 64))) (size!13958 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28325)

(assert (=> start!40988 (= res!272335 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13958 _keys!709))))))

(assert (=> start!40988 e!266671))

(declare-fun tp_is_empty!12261 () Bool)

(assert (=> start!40988 tp_is_empty!12261))

(assert (=> start!40988 tp!38596))

(assert (=> start!40988 true))

(declare-datatypes ((V!17453 0))(
  ( (V!17454 (val!6175 Int)) )
))
(declare-datatypes ((ValueCell!5787 0))(
  ( (ValueCellFull!5787 (v!8441 V!17453)) (EmptyCell!5787) )
))
(declare-datatypes ((array!28327 0))(
  ( (array!28328 (arr!13607 (Array (_ BitVec 32) ValueCell!5787)) (size!13959 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28327)

(declare-fun e!266669 () Bool)

(declare-fun array_inv!9860 (array!28327) Bool)

(assert (=> start!40988 (and (array_inv!9860 _values!549) e!266669)))

(declare-fun array_inv!9861 (array!28325) Bool)

(assert (=> start!40988 (array_inv!9861 _keys!709)))

(declare-fun b!456397 () Bool)

(declare-fun res!272344 () Bool)

(assert (=> b!456397 (=> (not res!272344) (not e!266671))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456397 (= res!272344 (validKeyInArray!0 k0!794))))

(declare-fun b!456398 () Bool)

(declare-fun e!266666 () Bool)

(assert (=> b!456398 (= e!266671 e!266666)))

(declare-fun res!272341 () Bool)

(assert (=> b!456398 (=> (not res!272341) (not e!266666))))

(declare-fun lt!206538 () array!28325)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28325 (_ BitVec 32)) Bool)

(assert (=> b!456398 (= res!272341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206538 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456398 (= lt!206538 (array!28326 (store (arr!13606 _keys!709) i!563 k0!794) (size!13958 _keys!709)))))

(declare-fun b!456399 () Bool)

(declare-fun res!272343 () Bool)

(assert (=> b!456399 (=> (not res!272343) (not e!266671))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!456399 (= res!272343 (and (= (size!13959 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13958 _keys!709) (size!13959 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456400 () Bool)

(declare-fun res!272336 () Bool)

(assert (=> b!456400 (=> (not res!272336) (not e!266671))))

(assert (=> b!456400 (= res!272336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456401 () Bool)

(declare-fun e!266667 () Bool)

(assert (=> b!456401 (= e!266667 (not (bvslt from!863 (size!13958 _keys!709))))))

(declare-fun minValue!515 () V!17453)

(declare-fun lt!206539 () array!28327)

(declare-fun zeroValue!515 () V!17453)

(declare-fun v!412 () V!17453)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8136 0))(
  ( (tuple2!8137 (_1!4079 (_ BitVec 64)) (_2!4079 V!17453)) )
))
(declare-datatypes ((List!8208 0))(
  ( (Nil!8205) (Cons!8204 (h!9060 tuple2!8136) (t!14036 List!8208)) )
))
(declare-datatypes ((ListLongMap!7049 0))(
  ( (ListLongMap!7050 (toList!3540 List!8208)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1723 (array!28325 array!28327 (_ BitVec 32) (_ BitVec 32) V!17453 V!17453 (_ BitVec 32) Int) ListLongMap!7049)

(declare-fun +!1577 (ListLongMap!7049 tuple2!8136) ListLongMap!7049)

(assert (=> b!456401 (= (getCurrentListMapNoExtraKeys!1723 lt!206538 lt!206539 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1577 (getCurrentListMapNoExtraKeys!1723 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8137 k0!794 v!412)))))

(declare-datatypes ((Unit!13276 0))(
  ( (Unit!13277) )
))
(declare-fun lt!206537 () Unit!13276)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!737 (array!28325 array!28327 (_ BitVec 32) (_ BitVec 32) V!17453 V!17453 (_ BitVec 32) (_ BitVec 64) V!17453 (_ BitVec 32) Int) Unit!13276)

(assert (=> b!456401 (= lt!206537 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!737 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456402 () Bool)

(declare-fun e!266668 () Bool)

(assert (=> b!456402 (= e!266668 tp_is_empty!12261)))

(declare-fun b!456403 () Bool)

(declare-fun res!272338 () Bool)

(assert (=> b!456403 (=> (not res!272338) (not e!266671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456403 (= res!272338 (validMask!0 mask!1025))))

(declare-fun b!456404 () Bool)

(declare-fun res!272340 () Bool)

(assert (=> b!456404 (=> (not res!272340) (not e!266671))))

(declare-datatypes ((List!8209 0))(
  ( (Nil!8206) (Cons!8205 (h!9061 (_ BitVec 64)) (t!14037 List!8209)) )
))
(declare-fun arrayNoDuplicates!0 (array!28325 (_ BitVec 32) List!8209) Bool)

(assert (=> b!456404 (= res!272340 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8206))))

(declare-fun b!456405 () Bool)

(declare-fun res!272339 () Bool)

(assert (=> b!456405 (=> (not res!272339) (not e!266671))))

(assert (=> b!456405 (= res!272339 (or (= (select (arr!13606 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13606 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20032 () Bool)

(declare-fun mapRes!20032 () Bool)

(assert (=> mapIsEmpty!20032 mapRes!20032))

(declare-fun b!456406 () Bool)

(assert (=> b!456406 (= e!266666 e!266667)))

(declare-fun res!272337 () Bool)

(assert (=> b!456406 (=> (not res!272337) (not e!266667))))

(assert (=> b!456406 (= res!272337 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206536 () ListLongMap!7049)

(assert (=> b!456406 (= lt!206536 (getCurrentListMapNoExtraKeys!1723 lt!206538 lt!206539 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456406 (= lt!206539 (array!28328 (store (arr!13607 _values!549) i!563 (ValueCellFull!5787 v!412)) (size!13959 _values!549)))))

(declare-fun lt!206540 () ListLongMap!7049)

(assert (=> b!456406 (= lt!206540 (getCurrentListMapNoExtraKeys!1723 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456407 () Bool)

(declare-fun res!272333 () Bool)

(assert (=> b!456407 (=> (not res!272333) (not e!266671))))

(declare-fun arrayContainsKey!0 (array!28325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456407 (= res!272333 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456408 () Bool)

(declare-fun e!266670 () Bool)

(assert (=> b!456408 (= e!266669 (and e!266670 mapRes!20032))))

(declare-fun condMapEmpty!20032 () Bool)

(declare-fun mapDefault!20032 () ValueCell!5787)

(assert (=> b!456408 (= condMapEmpty!20032 (= (arr!13607 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5787)) mapDefault!20032)))))

(declare-fun b!456409 () Bool)

(declare-fun res!272334 () Bool)

(assert (=> b!456409 (=> (not res!272334) (not e!266666))))

(assert (=> b!456409 (= res!272334 (bvsle from!863 i!563))))

(declare-fun b!456410 () Bool)

(declare-fun res!272345 () Bool)

(assert (=> b!456410 (=> (not res!272345) (not e!266671))))

(assert (=> b!456410 (= res!272345 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13958 _keys!709))))))

(declare-fun mapNonEmpty!20032 () Bool)

(declare-fun tp!38595 () Bool)

(assert (=> mapNonEmpty!20032 (= mapRes!20032 (and tp!38595 e!266668))))

(declare-fun mapRest!20032 () (Array (_ BitVec 32) ValueCell!5787))

(declare-fun mapKey!20032 () (_ BitVec 32))

(declare-fun mapValue!20032 () ValueCell!5787)

(assert (=> mapNonEmpty!20032 (= (arr!13607 _values!549) (store mapRest!20032 mapKey!20032 mapValue!20032))))

(declare-fun b!456411 () Bool)

(assert (=> b!456411 (= e!266670 tp_is_empty!12261)))

(declare-fun b!456412 () Bool)

(declare-fun res!272342 () Bool)

(assert (=> b!456412 (=> (not res!272342) (not e!266666))))

(assert (=> b!456412 (= res!272342 (arrayNoDuplicates!0 lt!206538 #b00000000000000000000000000000000 Nil!8206))))

(assert (= (and start!40988 res!272335) b!456403))

(assert (= (and b!456403 res!272338) b!456399))

(assert (= (and b!456399 res!272343) b!456400))

(assert (= (and b!456400 res!272336) b!456404))

(assert (= (and b!456404 res!272340) b!456410))

(assert (= (and b!456410 res!272345) b!456397))

(assert (= (and b!456397 res!272344) b!456405))

(assert (= (and b!456405 res!272339) b!456407))

(assert (= (and b!456407 res!272333) b!456398))

(assert (= (and b!456398 res!272341) b!456412))

(assert (= (and b!456412 res!272342) b!456409))

(assert (= (and b!456409 res!272334) b!456406))

(assert (= (and b!456406 res!272337) b!456401))

(assert (= (and b!456408 condMapEmpty!20032) mapIsEmpty!20032))

(assert (= (and b!456408 (not condMapEmpty!20032)) mapNonEmpty!20032))

(get-info :version)

(assert (= (and mapNonEmpty!20032 ((_ is ValueCellFull!5787) mapValue!20032)) b!456402))

(assert (= (and b!456408 ((_ is ValueCellFull!5787) mapDefault!20032)) b!456411))

(assert (= start!40988 b!456408))

(declare-fun m!439869 () Bool)

(assert (=> b!456403 m!439869))

(declare-fun m!439871 () Bool)

(assert (=> b!456412 m!439871))

(declare-fun m!439873 () Bool)

(assert (=> b!456401 m!439873))

(declare-fun m!439875 () Bool)

(assert (=> b!456401 m!439875))

(assert (=> b!456401 m!439875))

(declare-fun m!439877 () Bool)

(assert (=> b!456401 m!439877))

(declare-fun m!439879 () Bool)

(assert (=> b!456401 m!439879))

(declare-fun m!439881 () Bool)

(assert (=> mapNonEmpty!20032 m!439881))

(declare-fun m!439883 () Bool)

(assert (=> b!456406 m!439883))

(declare-fun m!439885 () Bool)

(assert (=> b!456406 m!439885))

(declare-fun m!439887 () Bool)

(assert (=> b!456406 m!439887))

(declare-fun m!439889 () Bool)

(assert (=> b!456400 m!439889))

(declare-fun m!439891 () Bool)

(assert (=> b!456404 m!439891))

(declare-fun m!439893 () Bool)

(assert (=> b!456405 m!439893))

(declare-fun m!439895 () Bool)

(assert (=> b!456407 m!439895))

(declare-fun m!439897 () Bool)

(assert (=> start!40988 m!439897))

(declare-fun m!439899 () Bool)

(assert (=> start!40988 m!439899))

(declare-fun m!439901 () Bool)

(assert (=> b!456397 m!439901))

(declare-fun m!439903 () Bool)

(assert (=> b!456398 m!439903))

(declare-fun m!439905 () Bool)

(assert (=> b!456398 m!439905))

(check-sat (not b!456400) (not b_next!10923) b_and!19065 (not b!456406) (not b!456404) tp_is_empty!12261 (not b!456412) (not b!456401) (not b!456397) (not mapNonEmpty!20032) (not b!456398) (not start!40988) (not b!456407) (not b!456403))
(check-sat b_and!19065 (not b_next!10923))
