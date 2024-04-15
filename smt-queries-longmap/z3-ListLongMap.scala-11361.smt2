; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132020 () Bool)

(assert start!132020)

(declare-fun b_free!31783 () Bool)

(declare-fun b_next!31783 () Bool)

(assert (=> start!132020 (= b_free!31783 (not b_next!31783))))

(declare-fun tp!111601 () Bool)

(declare-fun b_and!51175 () Bool)

(assert (=> start!132020 (= tp!111601 b_and!51175)))

(declare-fun b!1547920 () Bool)

(declare-fun c!142065 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun lt!666892 () Bool)

(assert (=> b!1547920 (= c!142065 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666892))))

(declare-datatypes ((V!59189 0))(
  ( (V!59190 (val!19107 Int)) )
))
(declare-datatypes ((tuple2!24670 0))(
  ( (tuple2!24671 (_1!12346 (_ BitVec 64)) (_2!12346 V!59189)) )
))
(declare-datatypes ((List!36136 0))(
  ( (Nil!36133) (Cons!36132 (h!37578 tuple2!24670) (t!50822 List!36136)) )
))
(declare-datatypes ((ListLongMap!22279 0))(
  ( (ListLongMap!22280 (toList!11155 List!36136)) )
))
(declare-fun e!861600 () ListLongMap!22279)

(declare-fun e!861603 () ListLongMap!22279)

(assert (=> b!1547920 (= e!861600 e!861603)))

(declare-fun b!1547921 () Bool)

(declare-fun call!70066 () ListLongMap!22279)

(assert (=> b!1547921 (= e!861603 call!70066)))

(declare-fun b!1547922 () Bool)

(declare-fun res!1060902 () Bool)

(declare-fun e!861596 () Bool)

(assert (=> b!1547922 (=> (not res!1060902) (not e!861596))))

(declare-datatypes ((array!103248 0))(
  ( (array!103249 (arr!49827 (Array (_ BitVec 32) (_ BitVec 64))) (size!50379 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103248)

(declare-datatypes ((List!36137 0))(
  ( (Nil!36134) (Cons!36133 (h!37579 (_ BitVec 64)) (t!50823 List!36137)) )
))
(declare-fun arrayNoDuplicates!0 (array!103248 (_ BitVec 32) List!36137) Bool)

(assert (=> b!1547922 (= res!1060902 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36134))))

(declare-fun b!1547923 () Bool)

(declare-fun e!861601 () Bool)

(assert (=> b!1547923 (= e!861601 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666897 () V!59189)

(declare-fun lt!666898 () ListLongMap!22279)

(declare-fun apply!1061 (ListLongMap!22279 (_ BitVec 64)) V!59189)

(assert (=> b!1547923 (= (apply!1061 lt!666898 (select (arr!49827 _keys!618) from!762)) lt!666897)))

(declare-fun zeroValue!436 () V!59189)

(declare-datatypes ((Unit!51419 0))(
  ( (Unit!51420) )
))
(declare-fun lt!666893 () Unit!51419)

(declare-fun lt!666894 () ListLongMap!22279)

(declare-fun addApplyDifferent!599 (ListLongMap!22279 (_ BitVec 64) V!59189 (_ BitVec 64)) Unit!51419)

(assert (=> b!1547923 (= lt!666893 (addApplyDifferent!599 lt!666894 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49827 _keys!618) from!762)))))

(declare-fun lt!666896 () V!59189)

(assert (=> b!1547923 (= lt!666896 lt!666897)))

(assert (=> b!1547923 (= lt!666897 (apply!1061 lt!666894 (select (arr!49827 _keys!618) from!762)))))

(declare-fun minValue!436 () V!59189)

(declare-fun +!4980 (ListLongMap!22279 tuple2!24670) ListLongMap!22279)

(assert (=> b!1547923 (= lt!666896 (apply!1061 (+!4980 lt!666894 (tuple2!24671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49827 _keys!618) from!762)))))

(declare-fun lt!666890 () Unit!51419)

(assert (=> b!1547923 (= lt!666890 (addApplyDifferent!599 lt!666894 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49827 _keys!618) from!762)))))

(declare-fun contains!10036 (ListLongMap!22279 (_ BitVec 64)) Bool)

(assert (=> b!1547923 (contains!10036 lt!666898 (select (arr!49827 _keys!618) from!762))))

(assert (=> b!1547923 (= lt!666898 (+!4980 lt!666894 (tuple2!24671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun lt!666891 () Unit!51419)

(declare-fun addStillContains!1259 (ListLongMap!22279 (_ BitVec 64) V!59189 (_ BitVec 64)) Unit!51419)

(assert (=> b!1547923 (= lt!666891 (addStillContains!1259 lt!666894 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49827 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18119 0))(
  ( (ValueCellFull!18119 (v!21904 V!59189)) (EmptyCell!18119) )
))
(declare-datatypes ((array!103250 0))(
  ( (array!103251 (arr!49828 (Array (_ BitVec 32) ValueCell!18119)) (size!50380 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103250)

(declare-fun getCurrentListMapNoExtraKeys!6608 (array!103248 array!103250 (_ BitVec 32) (_ BitVec 32) V!59189 V!59189 (_ BitVec 32) Int) ListLongMap!22279)

(assert (=> b!1547923 (= lt!666894 (getCurrentListMapNoExtraKeys!6608 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70062 () Bool)

(declare-fun call!70067 () ListLongMap!22279)

(declare-fun call!70065 () ListLongMap!22279)

(assert (=> bm!70062 (= call!70067 call!70065)))

(declare-fun b!1547924 () Bool)

(assert (=> b!1547924 (= e!861596 e!861601)))

(declare-fun res!1060905 () Bool)

(assert (=> b!1547924 (=> (not res!1060905) (not e!861601))))

(assert (=> b!1547924 (= res!1060905 (bvslt from!762 (size!50379 _keys!618)))))

(declare-fun lt!666895 () ListLongMap!22279)

(declare-fun e!861598 () ListLongMap!22279)

(assert (=> b!1547924 (= lt!666895 e!861598)))

(declare-fun c!142063 () Bool)

(assert (=> b!1547924 (= c!142063 (and (not lt!666892) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547924 (= lt!666892 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547925 () Bool)

(assert (=> b!1547925 (= e!861598 (+!4980 call!70065 (tuple2!24671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547926 () Bool)

(assert (=> b!1547926 (= e!861598 e!861600)))

(declare-fun c!142064 () Bool)

(assert (=> b!1547926 (= c!142064 (and (not lt!666892) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1547927 () Bool)

(declare-fun res!1060901 () Bool)

(assert (=> b!1547927 (=> (not res!1060901) (not e!861596))))

(assert (=> b!1547927 (= res!1060901 (and (= (size!50380 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50379 _keys!618) (size!50380 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun call!70068 () ListLongMap!22279)

(declare-fun call!70069 () ListLongMap!22279)

(declare-fun bm!70063 () Bool)

(assert (=> bm!70063 (= call!70065 (+!4980 (ite c!142063 call!70068 (ite c!142064 call!70069 call!70066)) (ite (or c!142063 c!142064) (tuple2!24671 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24671 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1547928 () Bool)

(declare-fun e!861602 () Bool)

(declare-fun e!861599 () Bool)

(declare-fun mapRes!58792 () Bool)

(assert (=> b!1547928 (= e!861602 (and e!861599 mapRes!58792))))

(declare-fun condMapEmpty!58792 () Bool)

(declare-fun mapDefault!58792 () ValueCell!18119)

(assert (=> b!1547928 (= condMapEmpty!58792 (= (arr!49828 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18119)) mapDefault!58792)))))

(declare-fun b!1547929 () Bool)

(assert (=> b!1547929 (= e!861603 call!70067)))

(declare-fun bm!70064 () Bool)

(assert (=> bm!70064 (= call!70066 call!70069)))

(declare-fun b!1547930 () Bool)

(declare-fun res!1060899 () Bool)

(assert (=> b!1547930 (=> (not res!1060899) (not e!861596))))

(assert (=> b!1547930 (= res!1060899 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50379 _keys!618))))))

(declare-fun bm!70065 () Bool)

(assert (=> bm!70065 (= call!70069 call!70068)))

(declare-fun b!1547931 () Bool)

(declare-fun e!861597 () Bool)

(declare-fun tp_is_empty!38059 () Bool)

(assert (=> b!1547931 (= e!861597 tp_is_empty!38059)))

(declare-fun mapNonEmpty!58792 () Bool)

(declare-fun tp!111602 () Bool)

(assert (=> mapNonEmpty!58792 (= mapRes!58792 (and tp!111602 e!861597))))

(declare-fun mapRest!58792 () (Array (_ BitVec 32) ValueCell!18119))

(declare-fun mapKey!58792 () (_ BitVec 32))

(declare-fun mapValue!58792 () ValueCell!18119)

(assert (=> mapNonEmpty!58792 (= (arr!49828 _values!470) (store mapRest!58792 mapKey!58792 mapValue!58792))))

(declare-fun b!1547932 () Bool)

(declare-fun res!1060900 () Bool)

(assert (=> b!1547932 (=> (not res!1060900) (not e!861601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547932 (= res!1060900 (validKeyInArray!0 (select (arr!49827 _keys!618) from!762)))))

(declare-fun res!1060904 () Bool)

(assert (=> start!132020 (=> (not res!1060904) (not e!861596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132020 (= res!1060904 (validMask!0 mask!926))))

(assert (=> start!132020 e!861596))

(declare-fun array_inv!38955 (array!103248) Bool)

(assert (=> start!132020 (array_inv!38955 _keys!618)))

(assert (=> start!132020 tp_is_empty!38059))

(assert (=> start!132020 true))

(assert (=> start!132020 tp!111601))

(declare-fun array_inv!38956 (array!103250) Bool)

(assert (=> start!132020 (and (array_inv!38956 _values!470) e!861602)))

(declare-fun bm!70066 () Bool)

(assert (=> bm!70066 (= call!70068 (getCurrentListMapNoExtraKeys!6608 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1547933 () Bool)

(assert (=> b!1547933 (= e!861599 tp_is_empty!38059)))

(declare-fun b!1547934 () Bool)

(assert (=> b!1547934 (= e!861600 call!70067)))

(declare-fun mapIsEmpty!58792 () Bool)

(assert (=> mapIsEmpty!58792 mapRes!58792))

(declare-fun b!1547935 () Bool)

(declare-fun res!1060903 () Bool)

(assert (=> b!1547935 (=> (not res!1060903) (not e!861596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103248 (_ BitVec 32)) Bool)

(assert (=> b!1547935 (= res!1060903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!132020 res!1060904) b!1547927))

(assert (= (and b!1547927 res!1060901) b!1547935))

(assert (= (and b!1547935 res!1060903) b!1547922))

(assert (= (and b!1547922 res!1060902) b!1547930))

(assert (= (and b!1547930 res!1060899) b!1547924))

(assert (= (and b!1547924 c!142063) b!1547925))

(assert (= (and b!1547924 (not c!142063)) b!1547926))

(assert (= (and b!1547926 c!142064) b!1547934))

(assert (= (and b!1547926 (not c!142064)) b!1547920))

(assert (= (and b!1547920 c!142065) b!1547929))

(assert (= (and b!1547920 (not c!142065)) b!1547921))

(assert (= (or b!1547929 b!1547921) bm!70064))

(assert (= (or b!1547934 bm!70064) bm!70065))

(assert (= (or b!1547934 b!1547929) bm!70062))

(assert (= (or b!1547925 bm!70065) bm!70066))

(assert (= (or b!1547925 bm!70062) bm!70063))

(assert (= (and b!1547924 res!1060905) b!1547932))

(assert (= (and b!1547932 res!1060900) b!1547923))

(assert (= (and b!1547928 condMapEmpty!58792) mapIsEmpty!58792))

(assert (= (and b!1547928 (not condMapEmpty!58792)) mapNonEmpty!58792))

(get-info :version)

(assert (= (and mapNonEmpty!58792 ((_ is ValueCellFull!18119) mapValue!58792)) b!1547931))

(assert (= (and b!1547928 ((_ is ValueCellFull!18119) mapDefault!58792)) b!1547933))

(assert (= start!132020 b!1547928))

(declare-fun m!1426779 () Bool)

(assert (=> b!1547932 m!1426779))

(assert (=> b!1547932 m!1426779))

(declare-fun m!1426781 () Bool)

(assert (=> b!1547932 m!1426781))

(declare-fun m!1426783 () Bool)

(assert (=> mapNonEmpty!58792 m!1426783))

(declare-fun m!1426785 () Bool)

(assert (=> b!1547935 m!1426785))

(declare-fun m!1426787 () Bool)

(assert (=> b!1547923 m!1426787))

(assert (=> b!1547923 m!1426779))

(declare-fun m!1426789 () Bool)

(assert (=> b!1547923 m!1426789))

(declare-fun m!1426791 () Bool)

(assert (=> b!1547923 m!1426791))

(assert (=> b!1547923 m!1426779))

(assert (=> b!1547923 m!1426779))

(declare-fun m!1426793 () Bool)

(assert (=> b!1547923 m!1426793))

(assert (=> b!1547923 m!1426779))

(declare-fun m!1426795 () Bool)

(assert (=> b!1547923 m!1426795))

(assert (=> b!1547923 m!1426779))

(declare-fun m!1426797 () Bool)

(assert (=> b!1547923 m!1426797))

(declare-fun m!1426799 () Bool)

(assert (=> b!1547923 m!1426799))

(assert (=> b!1547923 m!1426779))

(declare-fun m!1426801 () Bool)

(assert (=> b!1547923 m!1426801))

(assert (=> b!1547923 m!1426799))

(assert (=> b!1547923 m!1426779))

(declare-fun m!1426803 () Bool)

(assert (=> b!1547923 m!1426803))

(assert (=> b!1547923 m!1426779))

(declare-fun m!1426805 () Bool)

(assert (=> b!1547923 m!1426805))

(declare-fun m!1426807 () Bool)

(assert (=> b!1547925 m!1426807))

(declare-fun m!1426809 () Bool)

(assert (=> start!132020 m!1426809))

(declare-fun m!1426811 () Bool)

(assert (=> start!132020 m!1426811))

(declare-fun m!1426813 () Bool)

(assert (=> start!132020 m!1426813))

(declare-fun m!1426815 () Bool)

(assert (=> b!1547922 m!1426815))

(declare-fun m!1426817 () Bool)

(assert (=> bm!70063 m!1426817))

(assert (=> bm!70066 m!1426791))

(check-sat (not bm!70066) (not b!1547922) (not mapNonEmpty!58792) (not bm!70063) (not b!1547923) (not b!1547925) (not b!1547932) (not start!132020) tp_is_empty!38059 b_and!51175 (not b_next!31783) (not b!1547935))
(check-sat b_and!51175 (not b_next!31783))
