; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132458 () Bool)

(assert start!132458)

(declare-fun b_free!31759 () Bool)

(declare-fun b_next!31759 () Bool)

(assert (=> start!132458 (= b_free!31759 (not b_next!31759))))

(declare-fun tp!111528 () Bool)

(declare-fun b_and!51171 () Bool)

(assert (=> start!132458 (= tp!111528 b_and!51171)))

(declare-fun b!1550093 () Bool)

(declare-fun e!862979 () Bool)

(assert (=> b!1550093 (= e!862979 (not true))))

(declare-datatypes ((array!103396 0))(
  ( (array!103397 (arr!49893 (Array (_ BitVec 32) (_ BitVec 64))) (size!50444 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103396)

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((V!59157 0))(
  ( (V!59158 (val!19095 Int)) )
))
(declare-fun minValue!436 () V!59157)

(declare-datatypes ((tuple2!24630 0))(
  ( (tuple2!24631 (_1!12326 (_ BitVec 64)) (_2!12326 V!59157)) )
))
(declare-datatypes ((List!36107 0))(
  ( (Nil!36104) (Cons!36103 (h!37566 tuple2!24630) (t!50793 List!36107)) )
))
(declare-datatypes ((ListLongMap!22247 0))(
  ( (ListLongMap!22248 (toList!11139 List!36107)) )
))
(declare-fun lt!667852 () ListLongMap!22247)

(declare-fun apply!1064 (ListLongMap!22247 (_ BitVec 64)) V!59157)

(declare-fun +!4982 (ListLongMap!22247 tuple2!24630) ListLongMap!22247)

(assert (=> b!1550093 (= (apply!1064 (+!4982 lt!667852 (tuple2!24631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49893 _keys!618) from!762)) (apply!1064 lt!667852 (select (arr!49893 _keys!618) from!762)))))

(declare-datatypes ((Unit!51493 0))(
  ( (Unit!51494) )
))
(declare-fun lt!667851 () Unit!51493)

(declare-fun addApplyDifferent!593 (ListLongMap!22247 (_ BitVec 64) V!59157 (_ BitVec 64)) Unit!51493)

(assert (=> b!1550093 (= lt!667851 (addApplyDifferent!593 lt!667852 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49893 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59157)

(declare-fun contains!10112 (ListLongMap!22247 (_ BitVec 64)) Bool)

(assert (=> b!1550093 (contains!10112 (+!4982 lt!667852 (tuple2!24631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49893 _keys!618) from!762))))

(declare-fun lt!667853 () Unit!51493)

(declare-fun addStillContains!1254 (ListLongMap!22247 (_ BitVec 64) V!59157 (_ BitVec 64)) Unit!51493)

(assert (=> b!1550093 (= lt!667853 (addStillContains!1254 lt!667852 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49893 _keys!618) from!762)))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18107 0))(
  ( (ValueCellFull!18107 (v!21888 V!59157)) (EmptyCell!18107) )
))
(declare-datatypes ((array!103398 0))(
  ( (array!103399 (arr!49894 (Array (_ BitVec 32) ValueCell!18107)) (size!50445 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103398)

(declare-fun getCurrentListMapNoExtraKeys!6613 (array!103396 array!103398 (_ BitVec 32) (_ BitVec 32) V!59157 V!59157 (_ BitVec 32) Int) ListLongMap!22247)

(assert (=> b!1550093 (= lt!667852 (getCurrentListMapNoExtraKeys!6613 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550094 () Bool)

(declare-fun res!1061637 () Bool)

(declare-fun e!862978 () Bool)

(assert (=> b!1550094 (=> (not res!1061637) (not e!862978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103396 (_ BitVec 32)) Bool)

(assert (=> b!1550094 (= res!1061637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550095 () Bool)

(declare-fun e!862983 () Bool)

(declare-fun e!862985 () Bool)

(declare-fun mapRes!58756 () Bool)

(assert (=> b!1550095 (= e!862983 (and e!862985 mapRes!58756))))

(declare-fun condMapEmpty!58756 () Bool)

(declare-fun mapDefault!58756 () ValueCell!18107)

(assert (=> b!1550095 (= condMapEmpty!58756 (= (arr!49894 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18107)) mapDefault!58756)))))

(declare-fun b!1550096 () Bool)

(declare-fun e!862986 () Bool)

(declare-fun tp_is_empty!38035 () Bool)

(assert (=> b!1550096 (= e!862986 tp_is_empty!38035)))

(declare-fun b!1550097 () Bool)

(declare-fun e!862981 () ListLongMap!22247)

(declare-fun call!70071 () ListLongMap!22247)

(assert (=> b!1550097 (= e!862981 (+!4982 call!70071 (tuple2!24631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70067 () Bool)

(declare-fun call!70074 () ListLongMap!22247)

(assert (=> bm!70067 (= call!70074 call!70071)))

(declare-fun b!1550098 () Bool)

(declare-fun e!862982 () ListLongMap!22247)

(assert (=> b!1550098 (= e!862982 call!70074)))

(declare-fun b!1550099 () Bool)

(declare-fun res!1061638 () Bool)

(assert (=> b!1550099 (=> (not res!1061638) (not e!862978))))

(assert (=> b!1550099 (= res!1061638 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50444 _keys!618))))))

(declare-fun bm!70068 () Bool)

(declare-fun call!70073 () ListLongMap!22247)

(assert (=> bm!70068 (= call!70073 (getCurrentListMapNoExtraKeys!6613 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70069 () Bool)

(declare-fun call!70072 () ListLongMap!22247)

(declare-fun call!70070 () ListLongMap!22247)

(assert (=> bm!70069 (= call!70072 call!70070)))

(declare-fun b!1550100 () Bool)

(assert (=> b!1550100 (= e!862978 e!862979)))

(declare-fun res!1061639 () Bool)

(assert (=> b!1550100 (=> (not res!1061639) (not e!862979))))

(assert (=> b!1550100 (= res!1061639 (bvslt from!762 (size!50444 _keys!618)))))

(declare-fun lt!667855 () ListLongMap!22247)

(assert (=> b!1550100 (= lt!667855 e!862981)))

(declare-fun c!142844 () Bool)

(declare-fun lt!667854 () Bool)

(assert (=> b!1550100 (= c!142844 (and (not lt!667854) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550100 (= lt!667854 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!70070 () Bool)

(assert (=> bm!70070 (= call!70070 call!70073)))

(declare-fun b!1550101 () Bool)

(declare-fun res!1061642 () Bool)

(assert (=> b!1550101 (=> (not res!1061642) (not e!862979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550101 (= res!1061642 (validKeyInArray!0 (select (arr!49893 _keys!618) from!762)))))

(declare-fun mapIsEmpty!58756 () Bool)

(assert (=> mapIsEmpty!58756 mapRes!58756))

(declare-fun c!142845 () Bool)

(declare-fun bm!70071 () Bool)

(assert (=> bm!70071 (= call!70071 (+!4982 (ite c!142844 call!70073 (ite c!142845 call!70070 call!70072)) (ite (or c!142844 c!142845) (tuple2!24631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24631 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1061640 () Bool)

(assert (=> start!132458 (=> (not res!1061640) (not e!862978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132458 (= res!1061640 (validMask!0 mask!926))))

(assert (=> start!132458 e!862978))

(declare-fun array_inv!39065 (array!103396) Bool)

(assert (=> start!132458 (array_inv!39065 _keys!618)))

(assert (=> start!132458 tp_is_empty!38035))

(assert (=> start!132458 true))

(assert (=> start!132458 tp!111528))

(declare-fun array_inv!39066 (array!103398) Bool)

(assert (=> start!132458 (and (array_inv!39066 _values!470) e!862983)))

(declare-fun mapNonEmpty!58756 () Bool)

(declare-fun tp!111529 () Bool)

(assert (=> mapNonEmpty!58756 (= mapRes!58756 (and tp!111529 e!862986))))

(declare-fun mapKey!58756 () (_ BitVec 32))

(declare-fun mapRest!58756 () (Array (_ BitVec 32) ValueCell!18107))

(declare-fun mapValue!58756 () ValueCell!18107)

(assert (=> mapNonEmpty!58756 (= (arr!49894 _values!470) (store mapRest!58756 mapKey!58756 mapValue!58756))))

(declare-fun b!1550102 () Bool)

(assert (=> b!1550102 (= e!862982 call!70072)))

(declare-fun b!1550103 () Bool)

(declare-fun e!862984 () ListLongMap!22247)

(assert (=> b!1550103 (= e!862984 call!70074)))

(declare-fun b!1550104 () Bool)

(declare-fun res!1061636 () Bool)

(assert (=> b!1550104 (=> (not res!1061636) (not e!862978))))

(assert (=> b!1550104 (= res!1061636 (and (= (size!50445 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50444 _keys!618) (size!50445 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550105 () Bool)

(assert (=> b!1550105 (= e!862985 tp_is_empty!38035)))

(declare-fun b!1550106 () Bool)

(assert (=> b!1550106 (= e!862981 e!862984)))

(assert (=> b!1550106 (= c!142845 (and (not lt!667854) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550107 () Bool)

(declare-fun c!142846 () Bool)

(assert (=> b!1550107 (= c!142846 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667854))))

(assert (=> b!1550107 (= e!862984 e!862982)))

(declare-fun b!1550108 () Bool)

(declare-fun res!1061641 () Bool)

(assert (=> b!1550108 (=> (not res!1061641) (not e!862978))))

(declare-datatypes ((List!36108 0))(
  ( (Nil!36105) (Cons!36104 (h!37567 (_ BitVec 64)) (t!50794 List!36108)) )
))
(declare-fun arrayNoDuplicates!0 (array!103396 (_ BitVec 32) List!36108) Bool)

(assert (=> b!1550108 (= res!1061641 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36105))))

(assert (= (and start!132458 res!1061640) b!1550104))

(assert (= (and b!1550104 res!1061636) b!1550094))

(assert (= (and b!1550094 res!1061637) b!1550108))

(assert (= (and b!1550108 res!1061641) b!1550099))

(assert (= (and b!1550099 res!1061638) b!1550100))

(assert (= (and b!1550100 c!142844) b!1550097))

(assert (= (and b!1550100 (not c!142844)) b!1550106))

(assert (= (and b!1550106 c!142845) b!1550103))

(assert (= (and b!1550106 (not c!142845)) b!1550107))

(assert (= (and b!1550107 c!142846) b!1550098))

(assert (= (and b!1550107 (not c!142846)) b!1550102))

(assert (= (or b!1550098 b!1550102) bm!70069))

(assert (= (or b!1550103 bm!70069) bm!70070))

(assert (= (or b!1550103 b!1550098) bm!70067))

(assert (= (or b!1550097 bm!70070) bm!70068))

(assert (= (or b!1550097 bm!70067) bm!70071))

(assert (= (and b!1550100 res!1061639) b!1550101))

(assert (= (and b!1550101 res!1061642) b!1550093))

(assert (= (and b!1550095 condMapEmpty!58756) mapIsEmpty!58756))

(assert (= (and b!1550095 (not condMapEmpty!58756)) mapNonEmpty!58756))

(get-info :version)

(assert (= (and mapNonEmpty!58756 ((_ is ValueCellFull!18107) mapValue!58756)) b!1550096))

(assert (= (and b!1550095 ((_ is ValueCellFull!18107) mapDefault!58756)) b!1550105))

(assert (= start!132458 b!1550095))

(declare-fun m!1429479 () Bool)

(assert (=> start!132458 m!1429479))

(declare-fun m!1429481 () Bool)

(assert (=> start!132458 m!1429481))

(declare-fun m!1429483 () Bool)

(assert (=> start!132458 m!1429483))

(declare-fun m!1429485 () Bool)

(assert (=> b!1550093 m!1429485))

(declare-fun m!1429487 () Bool)

(assert (=> b!1550093 m!1429487))

(declare-fun m!1429489 () Bool)

(assert (=> b!1550093 m!1429489))

(declare-fun m!1429491 () Bool)

(assert (=> b!1550093 m!1429491))

(assert (=> b!1550093 m!1429487))

(declare-fun m!1429493 () Bool)

(assert (=> b!1550093 m!1429493))

(declare-fun m!1429495 () Bool)

(assert (=> b!1550093 m!1429495))

(assert (=> b!1550093 m!1429487))

(declare-fun m!1429497 () Bool)

(assert (=> b!1550093 m!1429497))

(assert (=> b!1550093 m!1429487))

(assert (=> b!1550093 m!1429487))

(declare-fun m!1429499 () Bool)

(assert (=> b!1550093 m!1429499))

(assert (=> b!1550093 m!1429485))

(assert (=> b!1550093 m!1429491))

(assert (=> b!1550093 m!1429487))

(declare-fun m!1429501 () Bool)

(assert (=> b!1550093 m!1429501))

(declare-fun m!1429503 () Bool)

(assert (=> b!1550108 m!1429503))

(declare-fun m!1429505 () Bool)

(assert (=> b!1550097 m!1429505))

(assert (=> b!1550101 m!1429487))

(assert (=> b!1550101 m!1429487))

(declare-fun m!1429507 () Bool)

(assert (=> b!1550101 m!1429507))

(assert (=> bm!70068 m!1429495))

(declare-fun m!1429509 () Bool)

(assert (=> bm!70071 m!1429509))

(declare-fun m!1429511 () Bool)

(assert (=> b!1550094 m!1429511))

(declare-fun m!1429513 () Bool)

(assert (=> mapNonEmpty!58756 m!1429513))

(check-sat (not b!1550101) (not b!1550093) b_and!51171 (not mapNonEmpty!58756) tp_is_empty!38035 (not b!1550108) (not b!1550097) (not bm!70071) (not start!132458) (not b!1550094) (not bm!70068) (not b_next!31759))
(check-sat b_and!51171 (not b_next!31759))
