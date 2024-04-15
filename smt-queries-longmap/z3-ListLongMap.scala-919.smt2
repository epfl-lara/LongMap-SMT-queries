; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20614 () Bool)

(assert start!20614)

(declare-fun b_free!5269 () Bool)

(declare-fun b_next!5269 () Bool)

(assert (=> start!20614 (= b_free!5269 (not b_next!5269))))

(declare-fun tp!18839 () Bool)

(declare-fun b_and!11989 () Bool)

(assert (=> start!20614 (= tp!18839 b_and!11989)))

(declare-fun b!205341 () Bool)

(declare-fun res!99199 () Bool)

(declare-fun e!134276 () Bool)

(assert (=> b!205341 (=> (not res!99199) (not e!134276))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205341 (= res!99199 (validKeyInArray!0 k0!843))))

(declare-fun b!205342 () Bool)

(declare-fun e!134272 () Bool)

(declare-fun tp_is_empty!5125 () Bool)

(assert (=> b!205342 (= e!134272 tp_is_empty!5125)))

(declare-fun b!205343 () Bool)

(declare-fun res!99200 () Bool)

(assert (=> b!205343 (=> (not res!99200) (not e!134276))))

(declare-datatypes ((array!9449 0))(
  ( (array!9450 (arr!4474 (Array (_ BitVec 32) (_ BitVec 64))) (size!4800 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9449)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6481 0))(
  ( (V!6482 (val!2607 Int)) )
))
(declare-datatypes ((ValueCell!2219 0))(
  ( (ValueCellFull!2219 (v!4571 V!6481)) (EmptyCell!2219) )
))
(declare-datatypes ((array!9451 0))(
  ( (array!9452 (arr!4475 (Array (_ BitVec 32) ValueCell!2219)) (size!4801 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9451)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205343 (= res!99200 (and (= (size!4801 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4800 _keys!825) (size!4801 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205344 () Bool)

(declare-fun res!99203 () Bool)

(assert (=> b!205344 (=> (not res!99203) (not e!134276))))

(declare-datatypes ((List!2840 0))(
  ( (Nil!2837) (Cons!2836 (h!3478 (_ BitVec 64)) (t!7762 List!2840)) )
))
(declare-fun arrayNoDuplicates!0 (array!9449 (_ BitVec 32) List!2840) Bool)

(assert (=> b!205344 (= res!99203 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2837))))

(declare-fun b!205345 () Bool)

(declare-fun res!99202 () Bool)

(assert (=> b!205345 (=> (not res!99202) (not e!134276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9449 (_ BitVec 32)) Bool)

(assert (=> b!205345 (= res!99202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205346 () Bool)

(declare-fun res!99206 () Bool)

(assert (=> b!205346 (=> (not res!99206) (not e!134276))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205346 (= res!99206 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4800 _keys!825))))))

(declare-fun b!205347 () Bool)

(declare-fun e!134273 () Bool)

(declare-fun e!134277 () Bool)

(assert (=> b!205347 (= e!134273 e!134277)))

(declare-fun res!99205 () Bool)

(assert (=> b!205347 (=> res!99205 e!134277)))

(assert (=> b!205347 (= res!99205 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3938 0))(
  ( (tuple2!3939 (_1!1980 (_ BitVec 64)) (_2!1980 V!6481)) )
))
(declare-datatypes ((List!2841 0))(
  ( (Nil!2838) (Cons!2837 (h!3479 tuple2!3938) (t!7763 List!2841)) )
))
(declare-datatypes ((ListLongMap!2841 0))(
  ( (ListLongMap!2842 (toList!1436 List!2841)) )
))
(declare-fun lt!104448 () ListLongMap!2841)

(declare-fun lt!104445 () ListLongMap!2841)

(assert (=> b!205347 (= lt!104448 lt!104445)))

(declare-fun lt!104439 () ListLongMap!2841)

(declare-fun lt!104449 () tuple2!3938)

(declare-fun +!485 (ListLongMap!2841 tuple2!3938) ListLongMap!2841)

(assert (=> b!205347 (= lt!104445 (+!485 lt!104439 lt!104449))))

(declare-fun lt!104442 () ListLongMap!2841)

(declare-fun lt!104443 () ListLongMap!2841)

(assert (=> b!205347 (= lt!104442 lt!104443)))

(declare-fun lt!104446 () ListLongMap!2841)

(assert (=> b!205347 (= lt!104443 (+!485 lt!104446 lt!104449))))

(declare-fun lt!104440 () ListLongMap!2841)

(assert (=> b!205347 (= lt!104442 (+!485 lt!104440 lt!104449))))

(declare-fun minValue!615 () V!6481)

(assert (=> b!205347 (= lt!104449 (tuple2!3939 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!99204 () Bool)

(assert (=> start!20614 (=> (not res!99204) (not e!134276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20614 (= res!99204 (validMask!0 mask!1149))))

(assert (=> start!20614 e!134276))

(declare-fun e!134275 () Bool)

(declare-fun array_inv!2939 (array!9451) Bool)

(assert (=> start!20614 (and (array_inv!2939 _values!649) e!134275)))

(assert (=> start!20614 true))

(assert (=> start!20614 tp_is_empty!5125))

(declare-fun array_inv!2940 (array!9449) Bool)

(assert (=> start!20614 (array_inv!2940 _keys!825)))

(assert (=> start!20614 tp!18839))

(declare-fun b!205348 () Bool)

(declare-fun res!99201 () Bool)

(assert (=> b!205348 (=> (not res!99201) (not e!134276))))

(assert (=> b!205348 (= res!99201 (= (select (arr!4474 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8756 () Bool)

(declare-fun mapRes!8756 () Bool)

(declare-fun tp!18838 () Bool)

(assert (=> mapNonEmpty!8756 (= mapRes!8756 (and tp!18838 e!134272))))

(declare-fun mapKey!8756 () (_ BitVec 32))

(declare-fun mapValue!8756 () ValueCell!2219)

(declare-fun mapRest!8756 () (Array (_ BitVec 32) ValueCell!2219))

(assert (=> mapNonEmpty!8756 (= (arr!4475 _values!649) (store mapRest!8756 mapKey!8756 mapValue!8756))))

(declare-fun b!205349 () Bool)

(declare-fun e!134271 () Bool)

(assert (=> b!205349 (= e!134271 tp_is_empty!5125)))

(declare-fun mapIsEmpty!8756 () Bool)

(assert (=> mapIsEmpty!8756 mapRes!8756))

(declare-fun b!205350 () Bool)

(assert (=> b!205350 (= e!134276 (not e!134273))))

(declare-fun res!99198 () Bool)

(assert (=> b!205350 (=> res!99198 e!134273)))

(assert (=> b!205350 (= res!99198 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6481)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!981 (array!9449 array!9451 (_ BitVec 32) (_ BitVec 32) V!6481 V!6481 (_ BitVec 32) Int) ListLongMap!2841)

(assert (=> b!205350 (= lt!104448 (getCurrentListMap!981 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104450 () array!9451)

(assert (=> b!205350 (= lt!104442 (getCurrentListMap!981 _keys!825 lt!104450 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205350 (and (= lt!104440 lt!104446) (= lt!104446 lt!104440))))

(declare-fun lt!104447 () tuple2!3938)

(assert (=> b!205350 (= lt!104446 (+!485 lt!104439 lt!104447))))

(declare-fun v!520 () V!6481)

(assert (=> b!205350 (= lt!104447 (tuple2!3939 k0!843 v!520))))

(declare-datatypes ((Unit!6212 0))(
  ( (Unit!6213) )
))
(declare-fun lt!104444 () Unit!6212)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!140 (array!9449 array!9451 (_ BitVec 32) (_ BitVec 32) V!6481 V!6481 (_ BitVec 32) (_ BitVec 64) V!6481 (_ BitVec 32) Int) Unit!6212)

(assert (=> b!205350 (= lt!104444 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!140 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!391 (array!9449 array!9451 (_ BitVec 32) (_ BitVec 32) V!6481 V!6481 (_ BitVec 32) Int) ListLongMap!2841)

(assert (=> b!205350 (= lt!104440 (getCurrentListMapNoExtraKeys!391 _keys!825 lt!104450 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205350 (= lt!104450 (array!9452 (store (arr!4475 _values!649) i!601 (ValueCellFull!2219 v!520)) (size!4801 _values!649)))))

(assert (=> b!205350 (= lt!104439 (getCurrentListMapNoExtraKeys!391 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205351 () Bool)

(assert (=> b!205351 (= e!134275 (and e!134271 mapRes!8756))))

(declare-fun condMapEmpty!8756 () Bool)

(declare-fun mapDefault!8756 () ValueCell!2219)

(assert (=> b!205351 (= condMapEmpty!8756 (= (arr!4475 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2219)) mapDefault!8756)))))

(declare-fun b!205352 () Bool)

(assert (=> b!205352 (= e!134277 true)))

(assert (=> b!205352 (= lt!104443 (+!485 lt!104445 lt!104447))))

(declare-fun lt!104441 () Unit!6212)

(declare-fun addCommutativeForDiffKeys!174 (ListLongMap!2841 (_ BitVec 64) V!6481 (_ BitVec 64) V!6481) Unit!6212)

(assert (=> b!205352 (= lt!104441 (addCommutativeForDiffKeys!174 lt!104439 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20614 res!99204) b!205343))

(assert (= (and b!205343 res!99200) b!205345))

(assert (= (and b!205345 res!99202) b!205344))

(assert (= (and b!205344 res!99203) b!205346))

(assert (= (and b!205346 res!99206) b!205341))

(assert (= (and b!205341 res!99199) b!205348))

(assert (= (and b!205348 res!99201) b!205350))

(assert (= (and b!205350 (not res!99198)) b!205347))

(assert (= (and b!205347 (not res!99205)) b!205352))

(assert (= (and b!205351 condMapEmpty!8756) mapIsEmpty!8756))

(assert (= (and b!205351 (not condMapEmpty!8756)) mapNonEmpty!8756))

(get-info :version)

(assert (= (and mapNonEmpty!8756 ((_ is ValueCellFull!2219) mapValue!8756)) b!205342))

(assert (= (and b!205351 ((_ is ValueCellFull!2219) mapDefault!8756)) b!205349))

(assert (= start!20614 b!205351))

(declare-fun m!232503 () Bool)

(assert (=> mapNonEmpty!8756 m!232503))

(declare-fun m!232505 () Bool)

(assert (=> b!205352 m!232505))

(declare-fun m!232507 () Bool)

(assert (=> b!205352 m!232507))

(declare-fun m!232509 () Bool)

(assert (=> b!205348 m!232509))

(declare-fun m!232511 () Bool)

(assert (=> start!20614 m!232511))

(declare-fun m!232513 () Bool)

(assert (=> start!20614 m!232513))

(declare-fun m!232515 () Bool)

(assert (=> start!20614 m!232515))

(declare-fun m!232517 () Bool)

(assert (=> b!205341 m!232517))

(declare-fun m!232519 () Bool)

(assert (=> b!205344 m!232519))

(declare-fun m!232521 () Bool)

(assert (=> b!205350 m!232521))

(declare-fun m!232523 () Bool)

(assert (=> b!205350 m!232523))

(declare-fun m!232525 () Bool)

(assert (=> b!205350 m!232525))

(declare-fun m!232527 () Bool)

(assert (=> b!205350 m!232527))

(declare-fun m!232529 () Bool)

(assert (=> b!205350 m!232529))

(declare-fun m!232531 () Bool)

(assert (=> b!205350 m!232531))

(declare-fun m!232533 () Bool)

(assert (=> b!205350 m!232533))

(declare-fun m!232535 () Bool)

(assert (=> b!205347 m!232535))

(declare-fun m!232537 () Bool)

(assert (=> b!205347 m!232537))

(declare-fun m!232539 () Bool)

(assert (=> b!205347 m!232539))

(declare-fun m!232541 () Bool)

(assert (=> b!205345 m!232541))

(check-sat b_and!11989 (not start!20614) (not b!205344) (not b!205352) (not b!205345) (not b!205341) (not mapNonEmpty!8756) (not b!205350) (not b_next!5269) tp_is_empty!5125 (not b!205347))
(check-sat b_and!11989 (not b_next!5269))
