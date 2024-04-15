; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132092 () Bool)

(assert start!132092)

(declare-fun b_free!31855 () Bool)

(declare-fun b_next!31855 () Bool)

(assert (=> start!132092 (= b_free!31855 (not b_next!31855))))

(declare-fun tp!111818 () Bool)

(declare-fun b_and!51259 () Bool)

(assert (=> start!132092 (= tp!111818 b_and!51259)))

(declare-fun b!1549800 () Bool)

(declare-datatypes ((V!59285 0))(
  ( (V!59286 (val!19143 Int)) )
))
(declare-datatypes ((tuple2!24738 0))(
  ( (tuple2!24739 (_1!12380 (_ BitVec 64)) (_2!12380 V!59285)) )
))
(declare-datatypes ((List!36193 0))(
  ( (Nil!36190) (Cons!36189 (h!37635 tuple2!24738) (t!50891 List!36193)) )
))
(declare-datatypes ((ListLongMap!22347 0))(
  ( (ListLongMap!22348 (toList!11189 List!36193)) )
))
(declare-fun e!862677 () ListLongMap!22347)

(declare-fun call!70617 () ListLongMap!22347)

(declare-fun minValue!436 () V!59285)

(declare-fun +!5006 (ListLongMap!22347 tuple2!24738) ListLongMap!22347)

(assert (=> b!1549800 (= e!862677 (+!5006 call!70617 (tuple2!24739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1549801 () Bool)

(declare-fun e!862674 () ListLongMap!22347)

(declare-fun call!70618 () ListLongMap!22347)

(assert (=> b!1549801 (= e!862674 call!70618)))

(declare-fun bm!70611 () Bool)

(assert (=> bm!70611 (= call!70618 call!70617)))

(declare-fun b!1549802 () Bool)

(declare-fun c!142425 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!667938 () Bool)

(assert (=> b!1549802 (= c!142425 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667938))))

(declare-fun e!862679 () ListLongMap!22347)

(assert (=> b!1549802 (= e!862679 e!862674)))

(declare-datatypes ((array!103382 0))(
  ( (array!103383 (arr!49894 (Array (_ BitVec 32) (_ BitVec 64))) (size!50446 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103382)

(declare-fun zeroValue!436 () V!59285)

(declare-fun defaultEntry!478 () Int)

(declare-fun call!70616 () ListLongMap!22347)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18155 0))(
  ( (ValueCellFull!18155 (v!21940 V!59285)) (EmptyCell!18155) )
))
(declare-datatypes ((array!103384 0))(
  ( (array!103385 (arr!49895 (Array (_ BitVec 32) ValueCell!18155)) (size!50447 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103384)

(declare-fun bm!70612 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6631 (array!103382 array!103384 (_ BitVec 32) (_ BitVec 32) V!59285 V!59285 (_ BitVec 32) Int) ListLongMap!22347)

(assert (=> bm!70612 (= call!70616 (getCurrentListMapNoExtraKeys!6631 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549803 () Bool)

(declare-fun e!862673 () Bool)

(declare-fun tp_is_empty!38131 () Bool)

(assert (=> b!1549803 (= e!862673 tp_is_empty!38131)))

(declare-fun res!1061723 () Bool)

(declare-fun e!862678 () Bool)

(assert (=> start!132092 (=> (not res!1061723) (not e!862678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132092 (= res!1061723 (validMask!0 mask!926))))

(assert (=> start!132092 e!862678))

(declare-fun array_inv!38997 (array!103382) Bool)

(assert (=> start!132092 (array_inv!38997 _keys!618)))

(assert (=> start!132092 tp_is_empty!38131))

(assert (=> start!132092 true))

(assert (=> start!132092 tp!111818))

(declare-fun e!862675 () Bool)

(declare-fun array_inv!38998 (array!103384) Bool)

(assert (=> start!132092 (and (array_inv!38998 _values!470) e!862675)))

(declare-fun bm!70613 () Bool)

(declare-fun c!142423 () Bool)

(declare-fun c!142424 () Bool)

(declare-fun call!70614 () ListLongMap!22347)

(declare-fun call!70615 () ListLongMap!22347)

(assert (=> bm!70613 (= call!70617 (+!5006 (ite c!142424 call!70616 (ite c!142423 call!70615 call!70614)) (ite (or c!142424 c!142423) (tuple2!24739 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!70614 () Bool)

(assert (=> bm!70614 (= call!70614 call!70615)))

(declare-fun mapIsEmpty!58900 () Bool)

(declare-fun mapRes!58900 () Bool)

(assert (=> mapIsEmpty!58900 mapRes!58900))

(declare-fun b!1549804 () Bool)

(assert (=> b!1549804 (= e!862675 (and e!862673 mapRes!58900))))

(declare-fun condMapEmpty!58900 () Bool)

(declare-fun mapDefault!58900 () ValueCell!18155)

(assert (=> b!1549804 (= condMapEmpty!58900 (= (arr!49895 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18155)) mapDefault!58900)))))

(declare-fun bm!70615 () Bool)

(assert (=> bm!70615 (= call!70615 call!70616)))

(declare-fun b!1549805 () Bool)

(assert (=> b!1549805 (= e!862679 call!70618)))

(declare-fun b!1549806 () Bool)

(declare-fun res!1061726 () Bool)

(assert (=> b!1549806 (=> (not res!1061726) (not e!862678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103382 (_ BitVec 32)) Bool)

(assert (=> b!1549806 (= res!1061726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58900 () Bool)

(declare-fun tp!111817 () Bool)

(declare-fun e!862676 () Bool)

(assert (=> mapNonEmpty!58900 (= mapRes!58900 (and tp!111817 e!862676))))

(declare-fun mapRest!58900 () (Array (_ BitVec 32) ValueCell!18155))

(declare-fun mapKey!58900 () (_ BitVec 32))

(declare-fun mapValue!58900 () ValueCell!18155)

(assert (=> mapNonEmpty!58900 (= (arr!49895 _values!470) (store mapRest!58900 mapKey!58900 mapValue!58900))))

(declare-fun b!1549807 () Bool)

(assert (=> b!1549807 (= e!862678 false)))

(declare-fun lt!667939 () ListLongMap!22347)

(assert (=> b!1549807 (= lt!667939 e!862677)))

(assert (=> b!1549807 (= c!142424 (and (not lt!667938) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549807 (= lt!667938 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1549808 () Bool)

(assert (=> b!1549808 (= e!862677 e!862679)))

(assert (=> b!1549808 (= c!142423 (and (not lt!667938) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549809 () Bool)

(assert (=> b!1549809 (= e!862674 call!70614)))

(declare-fun b!1549810 () Bool)

(declare-fun res!1061727 () Bool)

(assert (=> b!1549810 (=> (not res!1061727) (not e!862678))))

(assert (=> b!1549810 (= res!1061727 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50446 _keys!618))))))

(declare-fun b!1549811 () Bool)

(assert (=> b!1549811 (= e!862676 tp_is_empty!38131)))

(declare-fun b!1549812 () Bool)

(declare-fun res!1061724 () Bool)

(assert (=> b!1549812 (=> (not res!1061724) (not e!862678))))

(declare-datatypes ((List!36194 0))(
  ( (Nil!36191) (Cons!36190 (h!37636 (_ BitVec 64)) (t!50892 List!36194)) )
))
(declare-fun arrayNoDuplicates!0 (array!103382 (_ BitVec 32) List!36194) Bool)

(assert (=> b!1549812 (= res!1061724 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36191))))

(declare-fun b!1549813 () Bool)

(declare-fun res!1061725 () Bool)

(assert (=> b!1549813 (=> (not res!1061725) (not e!862678))))

(assert (=> b!1549813 (= res!1061725 (and (= (size!50447 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50446 _keys!618) (size!50447 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132092 res!1061723) b!1549813))

(assert (= (and b!1549813 res!1061725) b!1549806))

(assert (= (and b!1549806 res!1061726) b!1549812))

(assert (= (and b!1549812 res!1061724) b!1549810))

(assert (= (and b!1549810 res!1061727) b!1549807))

(assert (= (and b!1549807 c!142424) b!1549800))

(assert (= (and b!1549807 (not c!142424)) b!1549808))

(assert (= (and b!1549808 c!142423) b!1549805))

(assert (= (and b!1549808 (not c!142423)) b!1549802))

(assert (= (and b!1549802 c!142425) b!1549801))

(assert (= (and b!1549802 (not c!142425)) b!1549809))

(assert (= (or b!1549801 b!1549809) bm!70614))

(assert (= (or b!1549805 bm!70614) bm!70615))

(assert (= (or b!1549805 b!1549801) bm!70611))

(assert (= (or b!1549800 bm!70615) bm!70612))

(assert (= (or b!1549800 bm!70611) bm!70613))

(assert (= (and b!1549804 condMapEmpty!58900) mapIsEmpty!58900))

(assert (= (and b!1549804 (not condMapEmpty!58900)) mapNonEmpty!58900))

(get-info :version)

(assert (= (and mapNonEmpty!58900 ((_ is ValueCellFull!18155) mapValue!58900)) b!1549811))

(assert (= (and b!1549804 ((_ is ValueCellFull!18155) mapDefault!58900)) b!1549803))

(assert (= start!132092 b!1549804))

(declare-fun m!1428315 () Bool)

(assert (=> b!1549806 m!1428315))

(declare-fun m!1428317 () Bool)

(assert (=> bm!70613 m!1428317))

(declare-fun m!1428319 () Bool)

(assert (=> bm!70612 m!1428319))

(declare-fun m!1428321 () Bool)

(assert (=> mapNonEmpty!58900 m!1428321))

(declare-fun m!1428323 () Bool)

(assert (=> b!1549800 m!1428323))

(declare-fun m!1428325 () Bool)

(assert (=> start!132092 m!1428325))

(declare-fun m!1428327 () Bool)

(assert (=> start!132092 m!1428327))

(declare-fun m!1428329 () Bool)

(assert (=> start!132092 m!1428329))

(declare-fun m!1428331 () Bool)

(assert (=> b!1549812 m!1428331))

(check-sat (not b!1549806) tp_is_empty!38131 (not mapNonEmpty!58900) (not start!132092) b_and!51259 (not b!1549812) (not b!1549800) (not b_next!31855) (not bm!70613) (not bm!70612))
(check-sat b_and!51259 (not b_next!31855))
