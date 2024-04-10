; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132012 () Bool)

(assert start!132012)

(declare-fun b_free!31725 () Bool)

(declare-fun b_next!31725 () Bool)

(assert (=> start!132012 (= b_free!31725 (not b_next!31725))))

(declare-fun tp!111427 () Bool)

(declare-fun b_and!51135 () Bool)

(assert (=> start!132012 (= tp!111427 b_and!51135)))

(declare-fun bm!69662 () Bool)

(declare-datatypes ((V!59111 0))(
  ( (V!59112 (val!19078 Int)) )
))
(declare-datatypes ((tuple2!24536 0))(
  ( (tuple2!24537 (_1!12279 (_ BitVec 64)) (_2!12279 V!59111)) )
))
(declare-datatypes ((List!36038 0))(
  ( (Nil!36035) (Cons!36034 (h!37479 tuple2!24536) (t!50732 List!36038)) )
))
(declare-datatypes ((ListLongMap!22145 0))(
  ( (ListLongMap!22146 (toList!11088 List!36038)) )
))
(declare-fun call!69669 () ListLongMap!22145)

(declare-fun call!69666 () ListLongMap!22145)

(assert (=> bm!69662 (= call!69669 call!69666)))

(declare-fun b!1546841 () Bool)

(declare-fun e!861012 () Bool)

(declare-fun tp_is_empty!38001 () Bool)

(assert (=> b!1546841 (= e!861012 tp_is_empty!38001)))

(declare-fun b!1546842 () Bool)

(declare-fun e!861018 () ListLongMap!22145)

(declare-fun e!861016 () ListLongMap!22145)

(assert (=> b!1546842 (= e!861018 e!861016)))

(declare-fun c!141893 () Bool)

(declare-fun lt!666691 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1546842 (= c!141893 (and (not lt!666691) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1546843 () Bool)

(declare-fun c!141892 () Bool)

(assert (=> b!1546843 (= c!141892 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666691))))

(declare-fun e!861013 () ListLongMap!22145)

(assert (=> b!1546843 (= e!861016 e!861013)))

(declare-fun mapIsEmpty!58705 () Bool)

(declare-fun mapRes!58705 () Bool)

(assert (=> mapIsEmpty!58705 mapRes!58705))

(declare-fun b!1546844 () Bool)

(declare-fun res!1060423 () Bool)

(declare-fun e!861015 () Bool)

(assert (=> b!1546844 (=> (not res!1060423) (not e!861015))))

(declare-datatypes ((array!103202 0))(
  ( (array!103203 (arr!49803 (Array (_ BitVec 32) (_ BitVec 64))) (size!50353 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103202)

(declare-datatypes ((List!36039 0))(
  ( (Nil!36036) (Cons!36035 (h!37480 (_ BitVec 64)) (t!50733 List!36039)) )
))
(declare-fun arrayNoDuplicates!0 (array!103202 (_ BitVec 32) List!36039) Bool)

(assert (=> b!1546844 (= res!1060423 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36036))))

(declare-fun b!1546845 () Bool)

(declare-fun minValue!436 () V!59111)

(declare-fun +!4920 (ListLongMap!22145 tuple2!24536) ListLongMap!22145)

(assert (=> b!1546845 (= e!861018 (+!4920 call!69666 (tuple2!24537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1546846 () Bool)

(declare-fun e!861011 () Bool)

(declare-fun e!861010 () Bool)

(assert (=> b!1546846 (= e!861011 (and e!861010 mapRes!58705))))

(declare-fun condMapEmpty!58705 () Bool)

(declare-datatypes ((ValueCell!18090 0))(
  ( (ValueCellFull!18090 (v!21879 V!59111)) (EmptyCell!18090) )
))
(declare-datatypes ((array!103204 0))(
  ( (array!103205 (arr!49804 (Array (_ BitVec 32) ValueCell!18090)) (size!50354 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103204)

(declare-fun mapDefault!58705 () ValueCell!18090)

(assert (=> b!1546846 (= condMapEmpty!58705 (= (arr!49804 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18090)) mapDefault!58705)))))

(declare-fun b!1546847 () Bool)

(declare-fun res!1060424 () Bool)

(assert (=> b!1546847 (=> (not res!1060424) (not e!861015))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103202 (_ BitVec 32)) Bool)

(assert (=> b!1546847 (= res!1060424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1546848 () Bool)

(declare-fun res!1060422 () Bool)

(declare-fun e!861017 () Bool)

(assert (=> b!1546848 (=> (not res!1060422) (not e!861017))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1546848 (= res!1060422 (validKeyInArray!0 (select (arr!49803 _keys!618) from!762)))))

(declare-fun b!1546849 () Bool)

(assert (=> b!1546849 (= e!861013 call!69669)))

(declare-fun b!1546850 () Bool)

(assert (=> b!1546850 (= e!861017 (not true))))

(declare-fun lt!666690 () ListLongMap!22145)

(declare-fun apply!1043 (ListLongMap!22145 (_ BitVec 64)) V!59111)

(assert (=> b!1546850 (= (apply!1043 (+!4920 lt!666690 (tuple2!24537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49803 _keys!618) from!762)) (apply!1043 lt!666690 (select (arr!49803 _keys!618) from!762)))))

(declare-datatypes ((Unit!51536 0))(
  ( (Unit!51537) )
))
(declare-fun lt!666689 () Unit!51536)

(declare-fun addApplyDifferent!585 (ListLongMap!22145 (_ BitVec 64) V!59111 (_ BitVec 64)) Unit!51536)

(assert (=> b!1546850 (= lt!666689 (addApplyDifferent!585 lt!666690 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49803 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59111)

(declare-fun contains!10050 (ListLongMap!22145 (_ BitVec 64)) Bool)

(assert (=> b!1546850 (contains!10050 (+!4920 lt!666690 (tuple2!24537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49803 _keys!618) from!762))))

(declare-fun lt!666692 () Unit!51536)

(declare-fun addStillContains!1238 (ListLongMap!22145 (_ BitVec 64) V!59111 (_ BitVec 64)) Unit!51536)

(assert (=> b!1546850 (= lt!666692 (addStillContains!1238 lt!666690 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49803 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6549 (array!103202 array!103204 (_ BitVec 32) (_ BitVec 32) V!59111 V!59111 (_ BitVec 32) Int) ListLongMap!22145)

(assert (=> b!1546850 (= lt!666690 (getCurrentListMapNoExtraKeys!6549 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun res!1060421 () Bool)

(assert (=> start!132012 (=> (not res!1060421) (not e!861015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132012 (= res!1060421 (validMask!0 mask!926))))

(assert (=> start!132012 e!861015))

(declare-fun array_inv!38735 (array!103202) Bool)

(assert (=> start!132012 (array_inv!38735 _keys!618)))

(assert (=> start!132012 tp_is_empty!38001))

(assert (=> start!132012 true))

(assert (=> start!132012 tp!111427))

(declare-fun array_inv!38736 (array!103204) Bool)

(assert (=> start!132012 (and (array_inv!38736 _values!470) e!861011)))

(declare-fun b!1546851 () Bool)

(declare-fun res!1060419 () Bool)

(assert (=> b!1546851 (=> (not res!1060419) (not e!861015))))

(assert (=> b!1546851 (= res!1060419 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50353 _keys!618))))))

(declare-fun b!1546852 () Bool)

(assert (=> b!1546852 (= e!861010 tp_is_empty!38001)))

(declare-fun b!1546853 () Bool)

(assert (=> b!1546853 (= e!861016 call!69669)))

(declare-fun b!1546854 () Bool)

(declare-fun res!1060420 () Bool)

(assert (=> b!1546854 (=> (not res!1060420) (not e!861015))))

(assert (=> b!1546854 (= res!1060420 (and (= (size!50354 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50353 _keys!618) (size!50354 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1546855 () Bool)

(declare-fun call!69667 () ListLongMap!22145)

(assert (=> b!1546855 (= e!861013 call!69667)))

(declare-fun bm!69663 () Bool)

(declare-fun call!69665 () ListLongMap!22145)

(assert (=> bm!69663 (= call!69667 call!69665)))

(declare-fun bm!69664 () Bool)

(declare-fun call!69668 () ListLongMap!22145)

(assert (=> bm!69664 (= call!69668 (getCurrentListMapNoExtraKeys!6549 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapNonEmpty!58705 () Bool)

(declare-fun tp!111426 () Bool)

(assert (=> mapNonEmpty!58705 (= mapRes!58705 (and tp!111426 e!861012))))

(declare-fun mapRest!58705 () (Array (_ BitVec 32) ValueCell!18090))

(declare-fun mapValue!58705 () ValueCell!18090)

(declare-fun mapKey!58705 () (_ BitVec 32))

(assert (=> mapNonEmpty!58705 (= (arr!49804 _values!470) (store mapRest!58705 mapKey!58705 mapValue!58705))))

(declare-fun b!1546856 () Bool)

(assert (=> b!1546856 (= e!861015 e!861017)))

(declare-fun res!1060425 () Bool)

(assert (=> b!1546856 (=> (not res!1060425) (not e!861017))))

(assert (=> b!1546856 (= res!1060425 (bvslt from!762 (size!50353 _keys!618)))))

(declare-fun lt!666688 () ListLongMap!22145)

(assert (=> b!1546856 (= lt!666688 e!861018)))

(declare-fun c!141891 () Bool)

(assert (=> b!1546856 (= c!141891 (and (not lt!666691) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1546856 (= lt!666691 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!69665 () Bool)

(assert (=> bm!69665 (= call!69666 (+!4920 (ite c!141891 call!69668 (ite c!141893 call!69665 call!69667)) (ite (or c!141891 c!141893) (tuple2!24537 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24537 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun bm!69666 () Bool)

(assert (=> bm!69666 (= call!69665 call!69668)))

(assert (= (and start!132012 res!1060421) b!1546854))

(assert (= (and b!1546854 res!1060420) b!1546847))

(assert (= (and b!1546847 res!1060424) b!1546844))

(assert (= (and b!1546844 res!1060423) b!1546851))

(assert (= (and b!1546851 res!1060419) b!1546856))

(assert (= (and b!1546856 c!141891) b!1546845))

(assert (= (and b!1546856 (not c!141891)) b!1546842))

(assert (= (and b!1546842 c!141893) b!1546853))

(assert (= (and b!1546842 (not c!141893)) b!1546843))

(assert (= (and b!1546843 c!141892) b!1546849))

(assert (= (and b!1546843 (not c!141892)) b!1546855))

(assert (= (or b!1546849 b!1546855) bm!69663))

(assert (= (or b!1546853 bm!69663) bm!69666))

(assert (= (or b!1546853 b!1546849) bm!69662))

(assert (= (or b!1546845 bm!69666) bm!69664))

(assert (= (or b!1546845 bm!69662) bm!69665))

(assert (= (and b!1546856 res!1060425) b!1546848))

(assert (= (and b!1546848 res!1060422) b!1546850))

(assert (= (and b!1546846 condMapEmpty!58705) mapIsEmpty!58705))

(assert (= (and b!1546846 (not condMapEmpty!58705)) mapNonEmpty!58705))

(get-info :version)

(assert (= (and mapNonEmpty!58705 ((_ is ValueCellFull!18090) mapValue!58705)) b!1546841))

(assert (= (and b!1546846 ((_ is ValueCellFull!18090) mapDefault!58705)) b!1546852))

(assert (= start!132012 b!1546846))

(declare-fun m!1426609 () Bool)

(assert (=> bm!69665 m!1426609))

(declare-fun m!1426611 () Bool)

(assert (=> start!132012 m!1426611))

(declare-fun m!1426613 () Bool)

(assert (=> start!132012 m!1426613))

(declare-fun m!1426615 () Bool)

(assert (=> start!132012 m!1426615))

(declare-fun m!1426617 () Bool)

(assert (=> b!1546845 m!1426617))

(declare-fun m!1426619 () Bool)

(assert (=> b!1546850 m!1426619))

(declare-fun m!1426621 () Bool)

(assert (=> b!1546850 m!1426621))

(declare-fun m!1426623 () Bool)

(assert (=> b!1546850 m!1426623))

(declare-fun m!1426625 () Bool)

(assert (=> b!1546850 m!1426625))

(assert (=> b!1546850 m!1426619))

(assert (=> b!1546850 m!1426623))

(declare-fun m!1426627 () Bool)

(assert (=> b!1546850 m!1426627))

(assert (=> b!1546850 m!1426623))

(declare-fun m!1426629 () Bool)

(assert (=> b!1546850 m!1426629))

(declare-fun m!1426631 () Bool)

(assert (=> b!1546850 m!1426631))

(assert (=> b!1546850 m!1426623))

(assert (=> b!1546850 m!1426623))

(declare-fun m!1426633 () Bool)

(assert (=> b!1546850 m!1426633))

(assert (=> b!1546850 m!1426623))

(declare-fun m!1426635 () Bool)

(assert (=> b!1546850 m!1426635))

(assert (=> b!1546850 m!1426621))

(declare-fun m!1426637 () Bool)

(assert (=> b!1546844 m!1426637))

(declare-fun m!1426639 () Bool)

(assert (=> mapNonEmpty!58705 m!1426639))

(declare-fun m!1426641 () Bool)

(assert (=> b!1546847 m!1426641))

(assert (=> b!1546848 m!1426623))

(assert (=> b!1546848 m!1426623))

(declare-fun m!1426643 () Bool)

(assert (=> b!1546848 m!1426643))

(assert (=> bm!69664 m!1426631))

(check-sat (not b!1546845) (not b!1546847) b_and!51135 tp_is_empty!38001 (not mapNonEmpty!58705) (not bm!69665) (not b!1546844) (not bm!69664) (not b!1546848) (not start!132012) (not b_next!31725) (not b!1546850))
(check-sat b_and!51135 (not b_next!31725))
