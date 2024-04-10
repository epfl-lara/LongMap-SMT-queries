; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20612 () Bool)

(assert start!20612)

(declare-fun b_free!5271 () Bool)

(declare-fun b_next!5271 () Bool)

(assert (=> start!20612 (= b_free!5271 (not b_next!5271))))

(declare-fun tp!18845 () Bool)

(declare-fun b_and!12017 () Bool)

(assert (=> start!20612 (= tp!18845 b_and!12017)))

(declare-fun b!205524 () Bool)

(declare-fun res!99320 () Bool)

(declare-fun e!134394 () Bool)

(assert (=> b!205524 (=> (not res!99320) (not e!134394))))

(declare-datatypes ((array!9467 0))(
  ( (array!9468 (arr!4484 (Array (_ BitVec 32) (_ BitVec 64))) (size!4809 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9467)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6483 0))(
  ( (V!6484 (val!2608 Int)) )
))
(declare-datatypes ((ValueCell!2220 0))(
  ( (ValueCellFull!2220 (v!4578 V!6483)) (EmptyCell!2220) )
))
(declare-datatypes ((array!9469 0))(
  ( (array!9470 (arr!4485 (Array (_ BitVec 32) ValueCell!2220)) (size!4810 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9469)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205524 (= res!99320 (and (= (size!4810 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4809 _keys!825) (size!4810 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!99325 () Bool)

(assert (=> start!20612 (=> (not res!99325) (not e!134394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20612 (= res!99325 (validMask!0 mask!1149))))

(assert (=> start!20612 e!134394))

(declare-fun e!134397 () Bool)

(declare-fun array_inv!2965 (array!9469) Bool)

(assert (=> start!20612 (and (array_inv!2965 _values!649) e!134397)))

(assert (=> start!20612 true))

(declare-fun tp_is_empty!5127 () Bool)

(assert (=> start!20612 tp_is_empty!5127))

(declare-fun array_inv!2966 (array!9467) Bool)

(assert (=> start!20612 (array_inv!2966 _keys!825)))

(assert (=> start!20612 tp!18845))

(declare-fun b!205525 () Bool)

(declare-fun e!134398 () Bool)

(declare-fun mapRes!8759 () Bool)

(assert (=> b!205525 (= e!134397 (and e!134398 mapRes!8759))))

(declare-fun condMapEmpty!8759 () Bool)

(declare-fun mapDefault!8759 () ValueCell!2220)

(assert (=> b!205525 (= condMapEmpty!8759 (= (arr!4485 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2220)) mapDefault!8759)))))

(declare-fun b!205526 () Bool)

(declare-fun res!99321 () Bool)

(assert (=> b!205526 (=> (not res!99321) (not e!134394))))

(declare-datatypes ((List!2854 0))(
  ( (Nil!2851) (Cons!2850 (h!3492 (_ BitVec 64)) (t!7785 List!2854)) )
))
(declare-fun arrayNoDuplicates!0 (array!9467 (_ BitVec 32) List!2854) Bool)

(assert (=> b!205526 (= res!99321 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2851))))

(declare-fun b!205527 () Bool)

(declare-fun e!134399 () Bool)

(assert (=> b!205527 (= e!134399 tp_is_empty!5127)))

(declare-fun b!205528 () Bool)

(declare-fun res!99323 () Bool)

(assert (=> b!205528 (=> (not res!99323) (not e!134394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9467 (_ BitVec 32)) Bool)

(assert (=> b!205528 (= res!99323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205529 () Bool)

(declare-fun res!99327 () Bool)

(assert (=> b!205529 (=> (not res!99327) (not e!134394))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205529 (= res!99327 (validKeyInArray!0 k0!843))))

(declare-fun b!205530 () Bool)

(assert (=> b!205530 (= e!134398 tp_is_empty!5127)))

(declare-fun mapIsEmpty!8759 () Bool)

(assert (=> mapIsEmpty!8759 mapRes!8759))

(declare-fun b!205531 () Bool)

(declare-fun e!134395 () Bool)

(assert (=> b!205531 (= e!134395 true)))

(declare-datatypes ((tuple2!3958 0))(
  ( (tuple2!3959 (_1!1990 (_ BitVec 64)) (_2!1990 V!6483)) )
))
(declare-datatypes ((List!2855 0))(
  ( (Nil!2852) (Cons!2851 (h!3493 tuple2!3958) (t!7786 List!2855)) )
))
(declare-datatypes ((ListLongMap!2871 0))(
  ( (ListLongMap!2872 (toList!1451 List!2855)) )
))
(declare-fun lt!104666 () ListLongMap!2871)

(declare-fun lt!104662 () ListLongMap!2871)

(declare-fun lt!104667 () tuple2!3958)

(declare-fun +!478 (ListLongMap!2871 tuple2!3958) ListLongMap!2871)

(assert (=> b!205531 (= lt!104666 (+!478 lt!104662 lt!104667))))

(declare-fun lt!104657 () ListLongMap!2871)

(declare-fun minValue!615 () V!6483)

(declare-datatypes ((Unit!6248 0))(
  ( (Unit!6249) )
))
(declare-fun lt!104665 () Unit!6248)

(declare-fun v!520 () V!6483)

(declare-fun addCommutativeForDiffKeys!178 (ListLongMap!2871 (_ BitVec 64) V!6483 (_ BitVec 64) V!6483) Unit!6248)

(assert (=> b!205531 (= lt!104665 (addCommutativeForDiffKeys!178 lt!104657 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8759 () Bool)

(declare-fun tp!18844 () Bool)

(assert (=> mapNonEmpty!8759 (= mapRes!8759 (and tp!18844 e!134399))))

(declare-fun mapValue!8759 () ValueCell!2220)

(declare-fun mapKey!8759 () (_ BitVec 32))

(declare-fun mapRest!8759 () (Array (_ BitVec 32) ValueCell!2220))

(assert (=> mapNonEmpty!8759 (= (arr!4485 _values!649) (store mapRest!8759 mapKey!8759 mapValue!8759))))

(declare-fun b!205532 () Bool)

(declare-fun res!99324 () Bool)

(assert (=> b!205532 (=> (not res!99324) (not e!134394))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205532 (= res!99324 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4809 _keys!825))))))

(declare-fun b!205533 () Bool)

(declare-fun e!134396 () Bool)

(assert (=> b!205533 (= e!134394 (not e!134396))))

(declare-fun res!99322 () Bool)

(assert (=> b!205533 (=> res!99322 e!134396)))

(assert (=> b!205533 (= res!99322 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!104664 () ListLongMap!2871)

(declare-fun zeroValue!615 () V!6483)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1022 (array!9467 array!9469 (_ BitVec 32) (_ BitVec 32) V!6483 V!6483 (_ BitVec 32) Int) ListLongMap!2871)

(assert (=> b!205533 (= lt!104664 (getCurrentListMap!1022 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104656 () array!9469)

(declare-fun lt!104661 () ListLongMap!2871)

(assert (=> b!205533 (= lt!104661 (getCurrentListMap!1022 _keys!825 lt!104656 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104658 () ListLongMap!2871)

(declare-fun lt!104663 () ListLongMap!2871)

(assert (=> b!205533 (and (= lt!104658 lt!104663) (= lt!104663 lt!104658))))

(assert (=> b!205533 (= lt!104663 (+!478 lt!104657 lt!104667))))

(assert (=> b!205533 (= lt!104667 (tuple2!3959 k0!843 v!520))))

(declare-fun lt!104660 () Unit!6248)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!135 (array!9467 array!9469 (_ BitVec 32) (_ BitVec 32) V!6483 V!6483 (_ BitVec 32) (_ BitVec 64) V!6483 (_ BitVec 32) Int) Unit!6248)

(assert (=> b!205533 (= lt!104660 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!135 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!396 (array!9467 array!9469 (_ BitVec 32) (_ BitVec 32) V!6483 V!6483 (_ BitVec 32) Int) ListLongMap!2871)

(assert (=> b!205533 (= lt!104658 (getCurrentListMapNoExtraKeys!396 _keys!825 lt!104656 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205533 (= lt!104656 (array!9470 (store (arr!4485 _values!649) i!601 (ValueCellFull!2220 v!520)) (size!4810 _values!649)))))

(assert (=> b!205533 (= lt!104657 (getCurrentListMapNoExtraKeys!396 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205534 () Bool)

(declare-fun res!99326 () Bool)

(assert (=> b!205534 (=> (not res!99326) (not e!134394))))

(assert (=> b!205534 (= res!99326 (= (select (arr!4484 _keys!825) i!601) k0!843))))

(declare-fun b!205535 () Bool)

(assert (=> b!205535 (= e!134396 e!134395)))

(declare-fun res!99328 () Bool)

(assert (=> b!205535 (=> res!99328 e!134395)))

(assert (=> b!205535 (= res!99328 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205535 (= lt!104664 lt!104662)))

(declare-fun lt!104659 () tuple2!3958)

(assert (=> b!205535 (= lt!104662 (+!478 lt!104657 lt!104659))))

(assert (=> b!205535 (= lt!104661 lt!104666)))

(assert (=> b!205535 (= lt!104666 (+!478 lt!104663 lt!104659))))

(assert (=> b!205535 (= lt!104661 (+!478 lt!104658 lt!104659))))

(assert (=> b!205535 (= lt!104659 (tuple2!3959 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20612 res!99325) b!205524))

(assert (= (and b!205524 res!99320) b!205528))

(assert (= (and b!205528 res!99323) b!205526))

(assert (= (and b!205526 res!99321) b!205532))

(assert (= (and b!205532 res!99324) b!205529))

(assert (= (and b!205529 res!99327) b!205534))

(assert (= (and b!205534 res!99326) b!205533))

(assert (= (and b!205533 (not res!99322)) b!205535))

(assert (= (and b!205535 (not res!99328)) b!205531))

(assert (= (and b!205525 condMapEmpty!8759) mapIsEmpty!8759))

(assert (= (and b!205525 (not condMapEmpty!8759)) mapNonEmpty!8759))

(get-info :version)

(assert (= (and mapNonEmpty!8759 ((_ is ValueCellFull!2220) mapValue!8759)) b!205527))

(assert (= (and b!205525 ((_ is ValueCellFull!2220) mapDefault!8759)) b!205530))

(assert (= start!20612 b!205525))

(declare-fun m!233159 () Bool)

(assert (=> b!205533 m!233159))

(declare-fun m!233161 () Bool)

(assert (=> b!205533 m!233161))

(declare-fun m!233163 () Bool)

(assert (=> b!205533 m!233163))

(declare-fun m!233165 () Bool)

(assert (=> b!205533 m!233165))

(declare-fun m!233167 () Bool)

(assert (=> b!205533 m!233167))

(declare-fun m!233169 () Bool)

(assert (=> b!205533 m!233169))

(declare-fun m!233171 () Bool)

(assert (=> b!205533 m!233171))

(declare-fun m!233173 () Bool)

(assert (=> b!205534 m!233173))

(declare-fun m!233175 () Bool)

(assert (=> b!205526 m!233175))

(declare-fun m!233177 () Bool)

(assert (=> b!205529 m!233177))

(declare-fun m!233179 () Bool)

(assert (=> b!205535 m!233179))

(declare-fun m!233181 () Bool)

(assert (=> b!205535 m!233181))

(declare-fun m!233183 () Bool)

(assert (=> b!205535 m!233183))

(declare-fun m!233185 () Bool)

(assert (=> mapNonEmpty!8759 m!233185))

(declare-fun m!233187 () Bool)

(assert (=> start!20612 m!233187))

(declare-fun m!233189 () Bool)

(assert (=> start!20612 m!233189))

(declare-fun m!233191 () Bool)

(assert (=> start!20612 m!233191))

(declare-fun m!233193 () Bool)

(assert (=> b!205528 m!233193))

(declare-fun m!233195 () Bool)

(assert (=> b!205531 m!233195))

(declare-fun m!233197 () Bool)

(assert (=> b!205531 m!233197))

(check-sat (not b!205533) (not b!205531) (not b!205526) (not b_next!5271) (not b!205535) (not start!20612) b_and!12017 (not b!205528) (not mapNonEmpty!8759) (not b!205529) tp_is_empty!5127)
(check-sat b_and!12017 (not b_next!5271))
