; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132440 () Bool)

(assert start!132440)

(declare-fun b_free!31741 () Bool)

(declare-fun b_next!31741 () Bool)

(assert (=> start!132440 (= b_free!31741 (not b_next!31741))))

(declare-fun tp!111474 () Bool)

(declare-fun b_and!51153 () Bool)

(assert (=> start!132440 (= tp!111474 b_and!51153)))

(declare-fun b!1549661 () Bool)

(declare-fun e!862735 () Bool)

(declare-fun e!862741 () Bool)

(assert (=> b!1549661 (= e!862735 e!862741)))

(declare-fun res!1061447 () Bool)

(assert (=> b!1549661 (=> (not res!1061447) (not e!862741))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103360 0))(
  ( (array!103361 (arr!49875 (Array (_ BitVec 32) (_ BitVec 64))) (size!50426 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103360)

(assert (=> b!1549661 (= res!1061447 (bvslt from!762 (size!50426 _keys!618)))))

(declare-datatypes ((V!59133 0))(
  ( (V!59134 (val!19086 Int)) )
))
(declare-datatypes ((tuple2!24612 0))(
  ( (tuple2!24613 (_1!12317 (_ BitVec 64)) (_2!12317 V!59133)) )
))
(declare-datatypes ((List!36092 0))(
  ( (Nil!36089) (Cons!36088 (h!37551 tuple2!24612) (t!50778 List!36092)) )
))
(declare-datatypes ((ListLongMap!22229 0))(
  ( (ListLongMap!22230 (toList!11130 List!36092)) )
))
(declare-fun lt!667719 () ListLongMap!22229)

(declare-fun e!862737 () ListLongMap!22229)

(assert (=> b!1549661 (= lt!667719 e!862737)))

(declare-fun c!142764 () Bool)

(declare-fun lt!667720 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1549661 (= c!142764 (and (not lt!667720) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1549661 (= lt!667720 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!58729 () Bool)

(declare-fun mapRes!58729 () Bool)

(assert (=> mapIsEmpty!58729 mapRes!58729))

(declare-fun b!1549662 () Bool)

(assert (=> b!1549662 (= e!862741 (not true))))

(declare-fun lt!667718 () ListLongMap!22229)

(declare-fun minValue!436 () V!59133)

(declare-fun apply!1057 (ListLongMap!22229 (_ BitVec 64)) V!59133)

(declare-fun +!4973 (ListLongMap!22229 tuple2!24612) ListLongMap!22229)

(assert (=> b!1549662 (= (apply!1057 (+!4973 lt!667718 (tuple2!24613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49875 _keys!618) from!762)) (apply!1057 lt!667718 (select (arr!49875 _keys!618) from!762)))))

(declare-datatypes ((Unit!51479 0))(
  ( (Unit!51480) )
))
(declare-fun lt!667716 () Unit!51479)

(declare-fun addApplyDifferent!586 (ListLongMap!22229 (_ BitVec 64) V!59133 (_ BitVec 64)) Unit!51479)

(assert (=> b!1549662 (= lt!667716 (addApplyDifferent!586 lt!667718 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49875 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59133)

(declare-fun contains!10105 (ListLongMap!22229 (_ BitVec 64)) Bool)

(assert (=> b!1549662 (contains!10105 (+!4973 lt!667718 (tuple2!24613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49875 _keys!618) from!762))))

(declare-fun lt!667717 () Unit!51479)

(declare-fun addStillContains!1247 (ListLongMap!22229 (_ BitVec 64) V!59133 (_ BitVec 64)) Unit!51479)

(assert (=> b!1549662 (= lt!667717 (addStillContains!1247 lt!667718 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49875 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18098 0))(
  ( (ValueCellFull!18098 (v!21879 V!59133)) (EmptyCell!18098) )
))
(declare-datatypes ((array!103362 0))(
  ( (array!103363 (arr!49876 (Array (_ BitVec 32) ValueCell!18098)) (size!50427 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103362)

(declare-fun getCurrentListMapNoExtraKeys!6604 (array!103360 array!103362 (_ BitVec 32) (_ BitVec 32) V!59133 V!59133 (_ BitVec 32) Int) ListLongMap!22229)

(assert (=> b!1549662 (= lt!667718 (getCurrentListMapNoExtraKeys!6604 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549663 () Bool)

(declare-fun res!1061453 () Bool)

(assert (=> b!1549663 (=> (not res!1061453) (not e!862741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1549663 (= res!1061453 (validKeyInArray!0 (select (arr!49875 _keys!618) from!762)))))

(declare-fun res!1061452 () Bool)

(assert (=> start!132440 (=> (not res!1061452) (not e!862735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132440 (= res!1061452 (validMask!0 mask!926))))

(assert (=> start!132440 e!862735))

(declare-fun array_inv!39051 (array!103360) Bool)

(assert (=> start!132440 (array_inv!39051 _keys!618)))

(declare-fun tp_is_empty!38017 () Bool)

(assert (=> start!132440 tp_is_empty!38017))

(assert (=> start!132440 true))

(assert (=> start!132440 tp!111474))

(declare-fun e!862740 () Bool)

(declare-fun array_inv!39052 (array!103362) Bool)

(assert (=> start!132440 (and (array_inv!39052 _values!470) e!862740)))

(declare-fun b!1549664 () Bool)

(declare-fun e!862742 () ListLongMap!22229)

(declare-fun call!69935 () ListLongMap!22229)

(assert (=> b!1549664 (= e!862742 call!69935)))

(declare-fun b!1549665 () Bool)

(assert (=> b!1549665 (= e!862737 e!862742)))

(declare-fun c!142763 () Bool)

(assert (=> b!1549665 (= c!142763 (and (not lt!667720) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1549666 () Bool)

(declare-fun e!862738 () Bool)

(assert (=> b!1549666 (= e!862738 tp_is_empty!38017)))

(declare-fun b!1549667 () Bool)

(declare-fun res!1061450 () Bool)

(assert (=> b!1549667 (=> (not res!1061450) (not e!862735))))

(assert (=> b!1549667 (= res!1061450 (and (= (size!50427 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50426 _keys!618) (size!50427 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549668 () Bool)

(declare-fun res!1061449 () Bool)

(assert (=> b!1549668 (=> (not res!1061449) (not e!862735))))

(assert (=> b!1549668 (= res!1061449 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50426 _keys!618))))))

(declare-fun b!1549669 () Bool)

(declare-fun e!862736 () ListLongMap!22229)

(declare-fun call!69937 () ListLongMap!22229)

(assert (=> b!1549669 (= e!862736 call!69937)))

(declare-fun bm!69932 () Bool)

(declare-fun call!69938 () ListLongMap!22229)

(assert (=> bm!69932 (= call!69937 call!69938)))

(declare-fun b!1549670 () Bool)

(declare-fun res!1061448 () Bool)

(assert (=> b!1549670 (=> (not res!1061448) (not e!862735))))

(declare-datatypes ((List!36093 0))(
  ( (Nil!36090) (Cons!36089 (h!37552 (_ BitVec 64)) (t!50779 List!36093)) )
))
(declare-fun arrayNoDuplicates!0 (array!103360 (_ BitVec 32) List!36093) Bool)

(assert (=> b!1549670 (= res!1061448 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36090))))

(declare-fun bm!69933 () Bool)

(declare-fun call!69939 () ListLongMap!22229)

(assert (=> bm!69933 (= call!69938 call!69939)))

(declare-fun b!1549671 () Bool)

(declare-fun call!69936 () ListLongMap!22229)

(assert (=> b!1549671 (= e!862737 (+!4973 call!69936 (tuple2!24613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun bm!69934 () Bool)

(assert (=> bm!69934 (= call!69935 call!69936)))

(declare-fun b!1549672 () Bool)

(declare-fun c!142765 () Bool)

(assert (=> b!1549672 (= c!142765 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!667720))))

(assert (=> b!1549672 (= e!862742 e!862736)))

(declare-fun b!1549673 () Bool)

(declare-fun res!1061451 () Bool)

(assert (=> b!1549673 (=> (not res!1061451) (not e!862735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103360 (_ BitVec 32)) Bool)

(assert (=> b!1549673 (= res!1061451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1549674 () Bool)

(assert (=> b!1549674 (= e!862736 call!69935)))

(declare-fun bm!69935 () Bool)

(assert (=> bm!69935 (= call!69936 (+!4973 (ite c!142764 call!69939 (ite c!142763 call!69938 call!69937)) (ite (or c!142764 c!142763) (tuple2!24613 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun mapNonEmpty!58729 () Bool)

(declare-fun tp!111475 () Bool)

(assert (=> mapNonEmpty!58729 (= mapRes!58729 (and tp!111475 e!862738))))

(declare-fun mapValue!58729 () ValueCell!18098)

(declare-fun mapKey!58729 () (_ BitVec 32))

(declare-fun mapRest!58729 () (Array (_ BitVec 32) ValueCell!18098))

(assert (=> mapNonEmpty!58729 (= (arr!49876 _values!470) (store mapRest!58729 mapKey!58729 mapValue!58729))))

(declare-fun bm!69936 () Bool)

(assert (=> bm!69936 (= call!69939 (getCurrentListMapNoExtraKeys!6604 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1549675 () Bool)

(declare-fun e!862743 () Bool)

(assert (=> b!1549675 (= e!862743 tp_is_empty!38017)))

(declare-fun b!1549676 () Bool)

(assert (=> b!1549676 (= e!862740 (and e!862743 mapRes!58729))))

(declare-fun condMapEmpty!58729 () Bool)

(declare-fun mapDefault!58729 () ValueCell!18098)

(assert (=> b!1549676 (= condMapEmpty!58729 (= (arr!49876 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18098)) mapDefault!58729)))))

(assert (= (and start!132440 res!1061452) b!1549667))

(assert (= (and b!1549667 res!1061450) b!1549673))

(assert (= (and b!1549673 res!1061451) b!1549670))

(assert (= (and b!1549670 res!1061448) b!1549668))

(assert (= (and b!1549668 res!1061449) b!1549661))

(assert (= (and b!1549661 c!142764) b!1549671))

(assert (= (and b!1549661 (not c!142764)) b!1549665))

(assert (= (and b!1549665 c!142763) b!1549664))

(assert (= (and b!1549665 (not c!142763)) b!1549672))

(assert (= (and b!1549672 c!142765) b!1549674))

(assert (= (and b!1549672 (not c!142765)) b!1549669))

(assert (= (or b!1549674 b!1549669) bm!69932))

(assert (= (or b!1549664 bm!69932) bm!69933))

(assert (= (or b!1549664 b!1549674) bm!69934))

(assert (= (or b!1549671 bm!69933) bm!69936))

(assert (= (or b!1549671 bm!69934) bm!69935))

(assert (= (and b!1549661 res!1061447) b!1549663))

(assert (= (and b!1549663 res!1061453) b!1549662))

(assert (= (and b!1549676 condMapEmpty!58729) mapIsEmpty!58729))

(assert (= (and b!1549676 (not condMapEmpty!58729)) mapNonEmpty!58729))

(get-info :version)

(assert (= (and mapNonEmpty!58729 ((_ is ValueCellFull!18098) mapValue!58729)) b!1549666))

(assert (= (and b!1549676 ((_ is ValueCellFull!18098) mapDefault!58729)) b!1549675))

(assert (= start!132440 b!1549676))

(declare-fun m!1429155 () Bool)

(assert (=> b!1549663 m!1429155))

(assert (=> b!1549663 m!1429155))

(declare-fun m!1429157 () Bool)

(assert (=> b!1549663 m!1429157))

(assert (=> b!1549662 m!1429155))

(declare-fun m!1429159 () Bool)

(assert (=> b!1549662 m!1429159))

(declare-fun m!1429161 () Bool)

(assert (=> b!1549662 m!1429161))

(assert (=> b!1549662 m!1429155))

(declare-fun m!1429163 () Bool)

(assert (=> b!1549662 m!1429163))

(declare-fun m!1429165 () Bool)

(assert (=> b!1549662 m!1429165))

(assert (=> b!1549662 m!1429155))

(assert (=> b!1549662 m!1429155))

(declare-fun m!1429167 () Bool)

(assert (=> b!1549662 m!1429167))

(assert (=> b!1549662 m!1429155))

(declare-fun m!1429169 () Bool)

(assert (=> b!1549662 m!1429169))

(declare-fun m!1429171 () Bool)

(assert (=> b!1549662 m!1429171))

(assert (=> b!1549662 m!1429161))

(assert (=> b!1549662 m!1429171))

(assert (=> b!1549662 m!1429155))

(declare-fun m!1429173 () Bool)

(assert (=> b!1549662 m!1429173))

(assert (=> bm!69936 m!1429165))

(declare-fun m!1429175 () Bool)

(assert (=> b!1549671 m!1429175))

(declare-fun m!1429177 () Bool)

(assert (=> start!132440 m!1429177))

(declare-fun m!1429179 () Bool)

(assert (=> start!132440 m!1429179))

(declare-fun m!1429181 () Bool)

(assert (=> start!132440 m!1429181))

(declare-fun m!1429183 () Bool)

(assert (=> b!1549673 m!1429183))

(declare-fun m!1429185 () Bool)

(assert (=> bm!69935 m!1429185))

(declare-fun m!1429187 () Bool)

(assert (=> mapNonEmpty!58729 m!1429187))

(declare-fun m!1429189 () Bool)

(assert (=> b!1549670 m!1429189))

(check-sat (not b!1549671) (not bm!69936) (not b_next!31741) (not b!1549670) tp_is_empty!38017 (not b!1549663) (not mapNonEmpty!58729) b_and!51153 (not b!1549662) (not start!132440) (not b!1549673) (not bm!69935))
(check-sat b_and!51153 (not b_next!31741))
