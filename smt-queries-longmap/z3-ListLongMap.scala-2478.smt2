; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38672 () Bool)

(assert start!38672)

(declare-fun b_free!9223 () Bool)

(declare-fun b_next!9223 () Bool)

(assert (=> start!38672 (= b_free!9223 (not b_next!9223))))

(declare-fun tp!32793 () Bool)

(declare-fun b_and!16623 () Bool)

(assert (=> start!38672 (= tp!32793 b_and!16623)))

(declare-fun b!402096 () Bool)

(declare-fun e!242311 () Bool)

(assert (=> b!402096 (= e!242311 (not true))))

(declare-fun e!242316 () Bool)

(assert (=> b!402096 e!242316))

(declare-fun c!54768 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402096 (= c!54768 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12153 0))(
  ( (Unit!12154) )
))
(declare-fun lt!187913 () Unit!12153)

(declare-datatypes ((V!14579 0))(
  ( (V!14580 (val!5097 Int)) )
))
(declare-fun minValue!515 () V!14579)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4709 0))(
  ( (ValueCellFull!4709 (v!7345 V!14579)) (EmptyCell!4709) )
))
(declare-datatypes ((array!24094 0))(
  ( (array!24095 (arr!11496 (Array (_ BitVec 32) ValueCell!4709)) (size!11848 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24094)

(declare-fun zeroValue!515 () V!14579)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14579)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24096 0))(
  ( (array!24097 (arr!11497 (Array (_ BitVec 32) (_ BitVec 64))) (size!11849 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24096)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!344 (array!24096 array!24094 (_ BitVec 32) (_ BitVec 32) V!14579 V!14579 (_ BitVec 32) (_ BitVec 64) V!14579 (_ BitVec 32) Int) Unit!12153)

(assert (=> b!402096 (= lt!187913 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!344 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402097 () Bool)

(declare-fun e!242315 () Bool)

(declare-fun e!242313 () Bool)

(declare-fun mapRes!16779 () Bool)

(assert (=> b!402097 (= e!242315 (and e!242313 mapRes!16779))))

(declare-fun condMapEmpty!16779 () Bool)

(declare-fun mapDefault!16779 () ValueCell!4709)

(assert (=> b!402097 (= condMapEmpty!16779 (= (arr!11496 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4709)) mapDefault!16779)))))

(declare-fun b!402098 () Bool)

(declare-fun res!231587 () Bool)

(declare-fun e!242317 () Bool)

(assert (=> b!402098 (=> (not res!231587) (not e!242317))))

(assert (=> b!402098 (= res!231587 (or (= (select (arr!11497 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11497 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402099 () Bool)

(declare-fun res!231589 () Bool)

(assert (=> b!402099 (=> (not res!231589) (not e!242317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402099 (= res!231589 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16779 () Bool)

(declare-fun tp!32792 () Bool)

(declare-fun e!242314 () Bool)

(assert (=> mapNonEmpty!16779 (= mapRes!16779 (and tp!32792 e!242314))))

(declare-fun mapValue!16779 () ValueCell!4709)

(declare-fun mapKey!16779 () (_ BitVec 32))

(declare-fun mapRest!16779 () (Array (_ BitVec 32) ValueCell!4709))

(assert (=> mapNonEmpty!16779 (= (arr!11496 _values!549) (store mapRest!16779 mapKey!16779 mapValue!16779))))

(declare-fun b!402101 () Bool)

(declare-fun res!231592 () Bool)

(assert (=> b!402101 (=> (not res!231592) (not e!242317))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24096 (_ BitVec 32)) Bool)

(assert (=> b!402101 (= res!231592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-datatypes ((tuple2!6634 0))(
  ( (tuple2!6635 (_1!3328 (_ BitVec 64)) (_2!3328 V!14579)) )
))
(declare-datatypes ((List!6555 0))(
  ( (Nil!6552) (Cons!6551 (h!7407 tuple2!6634) (t!11721 List!6555)) )
))
(declare-datatypes ((ListLongMap!5549 0))(
  ( (ListLongMap!5550 (toList!2790 List!6555)) )
))
(declare-fun call!28320 () ListLongMap!5549)

(declare-fun bm!28317 () Bool)

(declare-fun lt!187914 () array!24096)

(declare-fun getCurrentListMapNoExtraKeys!1045 (array!24096 array!24094 (_ BitVec 32) (_ BitVec 32) V!14579 V!14579 (_ BitVec 32) Int) ListLongMap!5549)

(assert (=> bm!28317 (= call!28320 (getCurrentListMapNoExtraKeys!1045 (ite c!54768 lt!187914 _keys!709) (ite c!54768 (array!24095 (store (arr!11496 _values!549) i!563 (ValueCellFull!4709 v!412)) (size!11848 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402102 () Bool)

(declare-fun tp_is_empty!10105 () Bool)

(assert (=> b!402102 (= e!242314 tp_is_empty!10105)))

(declare-fun b!402103 () Bool)

(assert (=> b!402103 (= e!242317 e!242311)))

(declare-fun res!231593 () Bool)

(assert (=> b!402103 (=> (not res!231593) (not e!242311))))

(assert (=> b!402103 (= res!231593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187914 mask!1025))))

(assert (=> b!402103 (= lt!187914 (array!24097 (store (arr!11497 _keys!709) i!563 k0!794) (size!11849 _keys!709)))))

(declare-fun b!402104 () Bool)

(declare-fun res!231591 () Bool)

(assert (=> b!402104 (=> (not res!231591) (not e!242317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402104 (= res!231591 (validKeyInArray!0 k0!794))))

(declare-fun b!402105 () Bool)

(declare-fun call!28321 () ListLongMap!5549)

(declare-fun +!1133 (ListLongMap!5549 tuple2!6634) ListLongMap!5549)

(assert (=> b!402105 (= e!242316 (= call!28320 (+!1133 call!28321 (tuple2!6635 k0!794 v!412))))))

(declare-fun b!402106 () Bool)

(declare-fun res!231590 () Bool)

(assert (=> b!402106 (=> (not res!231590) (not e!242317))))

(declare-datatypes ((List!6556 0))(
  ( (Nil!6553) (Cons!6552 (h!7408 (_ BitVec 64)) (t!11722 List!6556)) )
))
(declare-fun arrayNoDuplicates!0 (array!24096 (_ BitVec 32) List!6556) Bool)

(assert (=> b!402106 (= res!231590 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6553))))

(declare-fun b!402107 () Bool)

(declare-fun res!231584 () Bool)

(assert (=> b!402107 (=> (not res!231584) (not e!242311))))

(assert (=> b!402107 (= res!231584 (arrayNoDuplicates!0 lt!187914 #b00000000000000000000000000000000 Nil!6553))))

(declare-fun b!402108 () Bool)

(declare-fun res!231594 () Bool)

(assert (=> b!402108 (=> (not res!231594) (not e!242317))))

(assert (=> b!402108 (= res!231594 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11849 _keys!709))))))

(declare-fun bm!28318 () Bool)

(assert (=> bm!28318 (= call!28321 (getCurrentListMapNoExtraKeys!1045 (ite c!54768 _keys!709 lt!187914) (ite c!54768 _values!549 (array!24095 (store (arr!11496 _values!549) i!563 (ValueCellFull!4709 v!412)) (size!11848 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402109 () Bool)

(declare-fun res!231583 () Bool)

(assert (=> b!402109 (=> (not res!231583) (not e!242311))))

(assert (=> b!402109 (= res!231583 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11849 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402100 () Bool)

(assert (=> b!402100 (= e!242313 tp_is_empty!10105)))

(declare-fun res!231588 () Bool)

(assert (=> start!38672 (=> (not res!231588) (not e!242317))))

(assert (=> start!38672 (= res!231588 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11849 _keys!709))))))

(assert (=> start!38672 e!242317))

(assert (=> start!38672 tp_is_empty!10105))

(assert (=> start!38672 tp!32793))

(assert (=> start!38672 true))

(declare-fun array_inv!8490 (array!24094) Bool)

(assert (=> start!38672 (and (array_inv!8490 _values!549) e!242315)))

(declare-fun array_inv!8491 (array!24096) Bool)

(assert (=> start!38672 (array_inv!8491 _keys!709)))

(declare-fun mapIsEmpty!16779 () Bool)

(assert (=> mapIsEmpty!16779 mapRes!16779))

(declare-fun b!402110 () Bool)

(assert (=> b!402110 (= e!242316 (= call!28321 call!28320))))

(declare-fun b!402111 () Bool)

(declare-fun res!231585 () Bool)

(assert (=> b!402111 (=> (not res!231585) (not e!242317))))

(declare-fun arrayContainsKey!0 (array!24096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402111 (= res!231585 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402112 () Bool)

(declare-fun res!231586 () Bool)

(assert (=> b!402112 (=> (not res!231586) (not e!242317))))

(assert (=> b!402112 (= res!231586 (and (= (size!11848 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11849 _keys!709) (size!11848 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38672 res!231588) b!402099))

(assert (= (and b!402099 res!231589) b!402112))

(assert (= (and b!402112 res!231586) b!402101))

(assert (= (and b!402101 res!231592) b!402106))

(assert (= (and b!402106 res!231590) b!402108))

(assert (= (and b!402108 res!231594) b!402104))

(assert (= (and b!402104 res!231591) b!402098))

(assert (= (and b!402098 res!231587) b!402111))

(assert (= (and b!402111 res!231585) b!402103))

(assert (= (and b!402103 res!231593) b!402107))

(assert (= (and b!402107 res!231584) b!402109))

(assert (= (and b!402109 res!231583) b!402096))

(assert (= (and b!402096 c!54768) b!402105))

(assert (= (and b!402096 (not c!54768)) b!402110))

(assert (= (or b!402105 b!402110) bm!28317))

(assert (= (or b!402105 b!402110) bm!28318))

(assert (= (and b!402097 condMapEmpty!16779) mapIsEmpty!16779))

(assert (= (and b!402097 (not condMapEmpty!16779)) mapNonEmpty!16779))

(get-info :version)

(assert (= (and mapNonEmpty!16779 ((_ is ValueCellFull!4709) mapValue!16779)) b!402102))

(assert (= (and b!402097 ((_ is ValueCellFull!4709) mapDefault!16779)) b!402100))

(assert (= start!38672 b!402097))

(declare-fun m!395997 () Bool)

(assert (=> b!402098 m!395997))

(declare-fun m!395999 () Bool)

(assert (=> b!402105 m!395999))

(declare-fun m!396001 () Bool)

(assert (=> b!402104 m!396001))

(declare-fun m!396003 () Bool)

(assert (=> b!402106 m!396003))

(declare-fun m!396005 () Bool)

(assert (=> b!402099 m!396005))

(declare-fun m!396007 () Bool)

(assert (=> b!402107 m!396007))

(declare-fun m!396009 () Bool)

(assert (=> bm!28318 m!396009))

(declare-fun m!396011 () Bool)

(assert (=> bm!28318 m!396011))

(assert (=> bm!28317 m!396009))

(declare-fun m!396013 () Bool)

(assert (=> bm!28317 m!396013))

(declare-fun m!396015 () Bool)

(assert (=> mapNonEmpty!16779 m!396015))

(declare-fun m!396017 () Bool)

(assert (=> b!402103 m!396017))

(declare-fun m!396019 () Bool)

(assert (=> b!402103 m!396019))

(declare-fun m!396021 () Bool)

(assert (=> start!38672 m!396021))

(declare-fun m!396023 () Bool)

(assert (=> start!38672 m!396023))

(declare-fun m!396025 () Bool)

(assert (=> b!402111 m!396025))

(declare-fun m!396027 () Bool)

(assert (=> b!402096 m!396027))

(declare-fun m!396029 () Bool)

(assert (=> b!402101 m!396029))

(check-sat b_and!16623 (not bm!28317) (not b!402101) (not bm!28318) (not b!402107) tp_is_empty!10105 (not b!402106) (not b!402099) (not b!402104) (not mapNonEmpty!16779) (not b!402105) (not b!402111) (not start!38672) (not b!402103) (not b_next!9223) (not b!402096))
(check-sat b_and!16623 (not b_next!9223))
