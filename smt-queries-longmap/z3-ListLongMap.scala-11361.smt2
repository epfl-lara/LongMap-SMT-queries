; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132482 () Bool)

(assert start!132482)

(declare-fun b_free!31783 () Bool)

(declare-fun b_next!31783 () Bool)

(assert (=> start!132482 (= b_free!31783 (not b_next!31783))))

(declare-fun tp!111600 () Bool)

(declare-fun b_and!51195 () Bool)

(assert (=> start!132482 (= tp!111600 b_and!51195)))

(declare-fun mapIsEmpty!58792 () Bool)

(declare-fun mapRes!58792 () Bool)

(assert (=> mapIsEmpty!58792 mapRes!58792))

(declare-datatypes ((array!103444 0))(
  ( (array!103445 (arr!49917 (Array (_ BitVec 32) (_ BitVec 64))) (size!50468 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103444)

(declare-datatypes ((V!59189 0))(
  ( (V!59190 (val!19107 Int)) )
))
(declare-fun zeroValue!436 () V!59189)

(declare-fun defaultEntry!478 () Int)

(declare-fun bm!70247 () Bool)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18119 0))(
  ( (ValueCellFull!18119 (v!21900 V!59189)) (EmptyCell!18119) )
))
(declare-datatypes ((array!103446 0))(
  ( (array!103447 (arr!49918 (Array (_ BitVec 32) ValueCell!18119)) (size!50469 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103446)

(declare-fun minValue!436 () V!59189)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((tuple2!24654 0))(
  ( (tuple2!24655 (_1!12338 (_ BitVec 64)) (_2!12338 V!59189)) )
))
(declare-datatypes ((List!36128 0))(
  ( (Nil!36125) (Cons!36124 (h!37587 tuple2!24654) (t!50814 List!36128)) )
))
(declare-datatypes ((ListLongMap!22271 0))(
  ( (ListLongMap!22272 (toList!11151 List!36128)) )
))
(declare-fun call!70253 () ListLongMap!22271)

(declare-fun getCurrentListMapNoExtraKeys!6624 (array!103444 array!103446 (_ BitVec 32) (_ BitVec 32) V!59189 V!59189 (_ BitVec 32) Int) ListLongMap!22271)

(assert (=> bm!70247 (= call!70253 (getCurrentListMapNoExtraKeys!6624 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550669 () Bool)

(declare-fun e!863305 () Bool)

(declare-fun tp_is_empty!38059 () Bool)

(assert (=> b!1550669 (= e!863305 tp_is_empty!38059)))

(declare-fun b!1550670 () Bool)

(declare-fun res!1061890 () Bool)

(declare-fun e!863309 () Bool)

(assert (=> b!1550670 (=> (not res!1061890) (not e!863309))))

(assert (=> b!1550670 (= res!1061890 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50468 _keys!618))))))

(declare-fun b!1550671 () Bool)

(declare-fun res!1061888 () Bool)

(assert (=> b!1550671 (=> (not res!1061888) (not e!863309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103444 (_ BitVec 32)) Bool)

(assert (=> b!1550671 (= res!1061888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1550672 () Bool)

(declare-fun c!142953 () Bool)

(declare-fun lt!668085 () Bool)

(assert (=> b!1550672 (= c!142953 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668085))))

(declare-fun e!863303 () ListLongMap!22271)

(declare-fun e!863310 () ListLongMap!22271)

(assert (=> b!1550672 (= e!863303 e!863310)))

(declare-fun res!1061894 () Bool)

(assert (=> start!132482 (=> (not res!1061894) (not e!863309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132482 (= res!1061894 (validMask!0 mask!926))))

(assert (=> start!132482 e!863309))

(declare-fun array_inv!39079 (array!103444) Bool)

(assert (=> start!132482 (array_inv!39079 _keys!618)))

(assert (=> start!132482 tp_is_empty!38059))

(assert (=> start!132482 true))

(assert (=> start!132482 tp!111600))

(declare-fun e!863307 () Bool)

(declare-fun array_inv!39080 (array!103446) Bool)

(assert (=> start!132482 (and (array_inv!39080 _values!470) e!863307)))

(declare-fun b!1550673 () Bool)

(declare-fun e!863304 () ListLongMap!22271)

(assert (=> b!1550673 (= e!863304 e!863303)))

(declare-fun c!142954 () Bool)

(assert (=> b!1550673 (= c!142954 (and (not lt!668085) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1550674 () Bool)

(declare-fun call!70250 () ListLongMap!22271)

(assert (=> b!1550674 (= e!863310 call!70250)))

(declare-fun b!1550675 () Bool)

(declare-fun res!1061893 () Bool)

(declare-fun e!863308 () Bool)

(assert (=> b!1550675 (=> (not res!1061893) (not e!863308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1550675 (= res!1061893 (validKeyInArray!0 (select (arr!49917 _keys!618) from!762)))))

(declare-fun b!1550676 () Bool)

(declare-fun res!1061891 () Bool)

(assert (=> b!1550676 (=> (not res!1061891) (not e!863309))))

(assert (=> b!1550676 (= res!1061891 (and (= (size!50469 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50468 _keys!618) (size!50469 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1550677 () Bool)

(declare-fun call!70251 () ListLongMap!22271)

(assert (=> b!1550677 (= e!863310 call!70251)))

(declare-fun b!1550678 () Bool)

(assert (=> b!1550678 (= e!863307 (and e!863305 mapRes!58792))))

(declare-fun condMapEmpty!58792 () Bool)

(declare-fun mapDefault!58792 () ValueCell!18119)

(assert (=> b!1550678 (= condMapEmpty!58792 (= (arr!49918 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18119)) mapDefault!58792)))))

(declare-fun bm!70248 () Bool)

(declare-fun call!70252 () ListLongMap!22271)

(assert (=> bm!70248 (= call!70251 call!70252)))

(declare-fun bm!70249 () Bool)

(declare-fun call!70254 () ListLongMap!22271)

(assert (=> bm!70249 (= call!70250 call!70254)))

(declare-fun b!1550679 () Bool)

(declare-fun res!1061892 () Bool)

(assert (=> b!1550679 (=> (not res!1061892) (not e!863309))))

(declare-datatypes ((List!36129 0))(
  ( (Nil!36126) (Cons!36125 (h!37588 (_ BitVec 64)) (t!50815 List!36129)) )
))
(declare-fun arrayNoDuplicates!0 (array!103444 (_ BitVec 32) List!36129) Bool)

(assert (=> b!1550679 (= res!1061892 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36126))))

(declare-fun mapNonEmpty!58792 () Bool)

(declare-fun tp!111601 () Bool)

(declare-fun e!863302 () Bool)

(assert (=> mapNonEmpty!58792 (= mapRes!58792 (and tp!111601 e!863302))))

(declare-fun mapRest!58792 () (Array (_ BitVec 32) ValueCell!18119))

(declare-fun mapValue!58792 () ValueCell!18119)

(declare-fun mapKey!58792 () (_ BitVec 32))

(assert (=> mapNonEmpty!58792 (= (arr!49918 _values!470) (store mapRest!58792 mapKey!58792 mapValue!58792))))

(declare-fun b!1550680 () Bool)

(assert (=> b!1550680 (= e!863309 e!863308)))

(declare-fun res!1061889 () Bool)

(assert (=> b!1550680 (=> (not res!1061889) (not e!863308))))

(assert (=> b!1550680 (= res!1061889 (bvslt from!762 (size!50468 _keys!618)))))

(declare-fun lt!668092 () ListLongMap!22271)

(assert (=> b!1550680 (= lt!668092 e!863304)))

(declare-fun c!142952 () Bool)

(assert (=> b!1550680 (= c!142952 (and (not lt!668085) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1550680 (= lt!668085 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1550681 () Bool)

(assert (=> b!1550681 (= e!863302 tp_is_empty!38059)))

(declare-fun bm!70250 () Bool)

(declare-fun +!4993 (ListLongMap!22271 tuple2!24654) ListLongMap!22271)

(assert (=> bm!70250 (= call!70254 (+!4993 (ite c!142952 call!70253 (ite c!142954 call!70252 call!70251)) (ite (or c!142952 c!142954) (tuple2!24655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1550682 () Bool)

(assert (=> b!1550682 (= e!863308 (not true))))

(declare-fun lt!668084 () V!59189)

(declare-fun lt!668089 () ListLongMap!22271)

(declare-fun apply!1074 (ListLongMap!22271 (_ BitVec 64)) V!59189)

(assert (=> b!1550682 (= (apply!1074 lt!668089 (select (arr!49917 _keys!618) from!762)) lt!668084)))

(declare-fun lt!668091 () ListLongMap!22271)

(declare-datatypes ((Unit!51513 0))(
  ( (Unit!51514) )
))
(declare-fun lt!668087 () Unit!51513)

(declare-fun addApplyDifferent!603 (ListLongMap!22271 (_ BitVec 64) V!59189 (_ BitVec 64)) Unit!51513)

(assert (=> b!1550682 (= lt!668087 (addApplyDifferent!603 lt!668091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49917 _keys!618) from!762)))))

(declare-fun lt!668086 () V!59189)

(assert (=> b!1550682 (= lt!668086 lt!668084)))

(assert (=> b!1550682 (= lt!668084 (apply!1074 lt!668091 (select (arr!49917 _keys!618) from!762)))))

(assert (=> b!1550682 (= lt!668086 (apply!1074 (+!4993 lt!668091 (tuple2!24655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49917 _keys!618) from!762)))))

(declare-fun lt!668088 () Unit!51513)

(assert (=> b!1550682 (= lt!668088 (addApplyDifferent!603 lt!668091 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49917 _keys!618) from!762)))))

(declare-fun contains!10122 (ListLongMap!22271 (_ BitVec 64)) Bool)

(assert (=> b!1550682 (contains!10122 lt!668089 (select (arr!49917 _keys!618) from!762))))

(assert (=> b!1550682 (= lt!668089 (+!4993 lt!668091 (tuple2!24655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!668090 () Unit!51513)

(declare-fun addStillContains!1264 (ListLongMap!22271 (_ BitVec 64) V!59189 (_ BitVec 64)) Unit!51513)

(assert (=> b!1550682 (= lt!668090 (addStillContains!1264 lt!668091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49917 _keys!618) from!762)))))

(assert (=> b!1550682 (= lt!668091 (getCurrentListMapNoExtraKeys!6624 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550683 () Bool)

(assert (=> b!1550683 (= e!863304 (+!4993 call!70254 (tuple2!24655 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!70251 () Bool)

(assert (=> bm!70251 (= call!70252 call!70253)))

(declare-fun b!1550684 () Bool)

(assert (=> b!1550684 (= e!863303 call!70250)))

(assert (= (and start!132482 res!1061894) b!1550676))

(assert (= (and b!1550676 res!1061891) b!1550671))

(assert (= (and b!1550671 res!1061888) b!1550679))

(assert (= (and b!1550679 res!1061892) b!1550670))

(assert (= (and b!1550670 res!1061890) b!1550680))

(assert (= (and b!1550680 c!142952) b!1550683))

(assert (= (and b!1550680 (not c!142952)) b!1550673))

(assert (= (and b!1550673 c!142954) b!1550684))

(assert (= (and b!1550673 (not c!142954)) b!1550672))

(assert (= (and b!1550672 c!142953) b!1550674))

(assert (= (and b!1550672 (not c!142953)) b!1550677))

(assert (= (or b!1550674 b!1550677) bm!70248))

(assert (= (or b!1550684 bm!70248) bm!70251))

(assert (= (or b!1550684 b!1550674) bm!70249))

(assert (= (or b!1550683 bm!70251) bm!70247))

(assert (= (or b!1550683 bm!70249) bm!70250))

(assert (= (and b!1550680 res!1061889) b!1550675))

(assert (= (and b!1550675 res!1061893) b!1550682))

(assert (= (and b!1550678 condMapEmpty!58792) mapIsEmpty!58792))

(assert (= (and b!1550678 (not condMapEmpty!58792)) mapNonEmpty!58792))

(get-info :version)

(assert (= (and mapNonEmpty!58792 ((_ is ValueCellFull!18119) mapValue!58792)) b!1550681))

(assert (= (and b!1550678 ((_ is ValueCellFull!18119) mapDefault!58792)) b!1550669))

(assert (= start!132482 b!1550678))

(declare-fun m!1429929 () Bool)

(assert (=> bm!70247 m!1429929))

(declare-fun m!1429931 () Bool)

(assert (=> b!1550679 m!1429931))

(declare-fun m!1429933 () Bool)

(assert (=> b!1550682 m!1429933))

(declare-fun m!1429935 () Bool)

(assert (=> b!1550682 m!1429935))

(assert (=> b!1550682 m!1429933))

(assert (=> b!1550682 m!1429933))

(declare-fun m!1429937 () Bool)

(assert (=> b!1550682 m!1429937))

(declare-fun m!1429939 () Bool)

(assert (=> b!1550682 m!1429939))

(assert (=> b!1550682 m!1429933))

(declare-fun m!1429941 () Bool)

(assert (=> b!1550682 m!1429941))

(assert (=> b!1550682 m!1429933))

(declare-fun m!1429943 () Bool)

(assert (=> b!1550682 m!1429943))

(assert (=> b!1550682 m!1429933))

(declare-fun m!1429945 () Bool)

(assert (=> b!1550682 m!1429945))

(assert (=> b!1550682 m!1429929))

(assert (=> b!1550682 m!1429933))

(declare-fun m!1429947 () Bool)

(assert (=> b!1550682 m!1429947))

(assert (=> b!1550682 m!1429939))

(assert (=> b!1550682 m!1429933))

(declare-fun m!1429949 () Bool)

(assert (=> b!1550682 m!1429949))

(declare-fun m!1429951 () Bool)

(assert (=> b!1550682 m!1429951))

(declare-fun m!1429953 () Bool)

(assert (=> bm!70250 m!1429953))

(declare-fun m!1429955 () Bool)

(assert (=> mapNonEmpty!58792 m!1429955))

(declare-fun m!1429957 () Bool)

(assert (=> start!132482 m!1429957))

(declare-fun m!1429959 () Bool)

(assert (=> start!132482 m!1429959))

(declare-fun m!1429961 () Bool)

(assert (=> start!132482 m!1429961))

(declare-fun m!1429963 () Bool)

(assert (=> b!1550671 m!1429963))

(declare-fun m!1429965 () Bool)

(assert (=> b!1550683 m!1429965))

(assert (=> b!1550675 m!1429933))

(assert (=> b!1550675 m!1429933))

(declare-fun m!1429967 () Bool)

(assert (=> b!1550675 m!1429967))

(check-sat (not b!1550682) tp_is_empty!38059 (not b!1550671) (not b_next!31783) (not b!1550683) b_and!51195 (not b!1550675) (not bm!70250) (not b!1550679) (not start!132482) (not mapNonEmpty!58792) (not bm!70247))
(check-sat b_and!51195 (not b_next!31783))
