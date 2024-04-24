; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132560 () Bool)

(assert start!132560)

(declare-fun b_free!31861 () Bool)

(declare-fun b_next!31861 () Bool)

(assert (=> start!132560 (= b_free!31861 (not b_next!31861))))

(declare-fun tp!111834 () Bool)

(declare-fun b_and!51285 () Bool)

(assert (=> start!132560 (= tp!111834 b_and!51285)))

(declare-fun b!1552679 () Bool)

(declare-datatypes ((V!59293 0))(
  ( (V!59294 (val!19146 Int)) )
))
(declare-datatypes ((tuple2!24724 0))(
  ( (tuple2!24725 (_1!12373 (_ BitVec 64)) (_2!12373 V!59293)) )
))
(declare-datatypes ((List!36185 0))(
  ( (Nil!36182) (Cons!36181 (h!37644 tuple2!24724) (t!50883 List!36185)) )
))
(declare-datatypes ((ListLongMap!22341 0))(
  ( (ListLongMap!22342 (toList!11186 List!36185)) )
))
(declare-fun e!864455 () ListLongMap!22341)

(declare-fun call!70844 () ListLongMap!22341)

(assert (=> b!1552679 (= e!864455 call!70844)))

(declare-fun b!1552680 () Bool)

(declare-fun e!864460 () Bool)

(declare-fun e!864459 () Bool)

(assert (=> b!1552680 (= e!864460 e!864459)))

(declare-fun res!1062762 () Bool)

(assert (=> b!1552680 (=> (not res!1062762) (not e!864459))))

(declare-fun from!762 () (_ BitVec 32))

(declare-datatypes ((array!103596 0))(
  ( (array!103597 (arr!49993 (Array (_ BitVec 32) (_ BitVec 64))) (size!50544 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103596)

(assert (=> b!1552680 (= res!1062762 (bvslt from!762 (size!50544 _keys!618)))))

(declare-fun lt!669153 () ListLongMap!22341)

(declare-fun e!864461 () ListLongMap!22341)

(assert (=> b!1552680 (= lt!669153 e!864461)))

(declare-fun c!143340 () Bool)

(declare-fun lt!669154 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1552680 (= c!143340 (and (not lt!669154) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1552680 (= lt!669154 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!436 () V!59293)

(declare-fun defaultEntry!478 () Int)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18158 0))(
  ( (ValueCellFull!18158 (v!21939 V!59293)) (EmptyCell!18158) )
))
(declare-datatypes ((array!103598 0))(
  ( (array!103599 (arr!49994 (Array (_ BitVec 32) ValueCell!18158)) (size!50545 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103598)

(declare-fun minValue!436 () V!59293)

(declare-fun call!70848 () ListLongMap!22341)

(declare-fun bm!70841 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6652 (array!103596 array!103598 (_ BitVec 32) (_ BitVec 32) V!59293 V!59293 (_ BitVec 32) Int) ListLongMap!22341)

(assert (=> bm!70841 (= call!70848 (getCurrentListMapNoExtraKeys!6652 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1552681 () Bool)

(declare-fun res!1062766 () Bool)

(assert (=> b!1552681 (=> (not res!1062766) (not e!864459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1552681 (= res!1062766 (validKeyInArray!0 (select (arr!49993 _keys!618) from!762)))))

(declare-fun b!1552682 () Bool)

(declare-fun e!864458 () ListLongMap!22341)

(assert (=> b!1552682 (= e!864461 e!864458)))

(declare-fun c!143341 () Bool)

(assert (=> b!1552682 (= c!143341 (and (not lt!669154) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1552683 () Bool)

(declare-fun c!143339 () Bool)

(assert (=> b!1552683 (= c!143339 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!669154))))

(assert (=> b!1552683 (= e!864458 e!864455)))

(declare-fun res!1062764 () Bool)

(assert (=> start!132560 (=> (not res!1062764) (not e!864460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132560 (= res!1062764 (validMask!0 mask!926))))

(assert (=> start!132560 e!864460))

(declare-fun array_inv!39131 (array!103596) Bool)

(assert (=> start!132560 (array_inv!39131 _keys!618)))

(declare-fun tp_is_empty!38137 () Bool)

(assert (=> start!132560 tp_is_empty!38137))

(assert (=> start!132560 true))

(assert (=> start!132560 tp!111834))

(declare-fun e!864457 () Bool)

(declare-fun array_inv!39132 (array!103598) Bool)

(assert (=> start!132560 (and (array_inv!39132 _values!470) e!864457)))

(declare-fun mapNonEmpty!58909 () Bool)

(declare-fun mapRes!58909 () Bool)

(declare-fun tp!111835 () Bool)

(declare-fun e!864456 () Bool)

(assert (=> mapNonEmpty!58909 (= mapRes!58909 (and tp!111835 e!864456))))

(declare-fun mapKey!58909 () (_ BitVec 32))

(declare-fun mapValue!58909 () ValueCell!18158)

(declare-fun mapRest!58909 () (Array (_ BitVec 32) ValueCell!18158))

(assert (=> mapNonEmpty!58909 (= (arr!49994 _values!470) (store mapRest!58909 mapKey!58909 mapValue!58909))))

(declare-fun b!1552684 () Bool)

(declare-fun res!1062761 () Bool)

(assert (=> b!1552684 (=> (not res!1062761) (not e!864460))))

(assert (=> b!1552684 (= res!1062761 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50544 _keys!618))))))

(declare-fun b!1552685 () Bool)

(assert (=> b!1552685 (= e!864456 tp_is_empty!38137)))

(declare-fun b!1552686 () Bool)

(declare-fun call!70846 () ListLongMap!22341)

(assert (=> b!1552686 (= e!864458 call!70846)))

(declare-fun bm!70842 () Bool)

(declare-fun call!70847 () ListLongMap!22341)

(assert (=> bm!70842 (= call!70846 call!70847)))

(declare-fun b!1552687 () Bool)

(declare-fun res!1062765 () Bool)

(assert (=> b!1552687 (=> (not res!1062765) (not e!864460))))

(assert (=> b!1552687 (= res!1062765 (and (= (size!50545 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50544 _keys!618) (size!50545 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1552688 () Bool)

(declare-fun res!1062767 () Bool)

(assert (=> b!1552688 (=> (not res!1062767) (not e!864460))))

(declare-datatypes ((List!36186 0))(
  ( (Nil!36183) (Cons!36182 (h!37645 (_ BitVec 64)) (t!50884 List!36186)) )
))
(declare-fun arrayNoDuplicates!0 (array!103596 (_ BitVec 32) List!36186) Bool)

(assert (=> b!1552688 (= res!1062767 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36183))))

(declare-fun bm!70843 () Bool)

(declare-fun call!70845 () ListLongMap!22341)

(assert (=> bm!70843 (= call!70845 call!70848)))

(declare-fun bm!70844 () Bool)

(declare-fun +!5019 (ListLongMap!22341 tuple2!24724) ListLongMap!22341)

(assert (=> bm!70844 (= call!70847 (+!5019 (ite c!143340 call!70848 (ite c!143341 call!70845 call!70844)) (ite (or c!143340 c!143341) (tuple2!24725 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1552689 () Bool)

(assert (=> b!1552689 (= e!864461 (+!5019 call!70847 (tuple2!24725 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun mapIsEmpty!58909 () Bool)

(assert (=> mapIsEmpty!58909 mapRes!58909))

(declare-fun b!1552690 () Bool)

(declare-fun e!864454 () Bool)

(assert (=> b!1552690 (= e!864457 (and e!864454 mapRes!58909))))

(declare-fun condMapEmpty!58909 () Bool)

(declare-fun mapDefault!58909 () ValueCell!18158)

(assert (=> b!1552690 (= condMapEmpty!58909 (= (arr!49994 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18158)) mapDefault!58909)))))

(declare-fun b!1552691 () Bool)

(assert (=> b!1552691 (= e!864455 call!70846)))

(declare-fun b!1552692 () Bool)

(assert (=> b!1552692 (= e!864454 tp_is_empty!38137)))

(declare-fun b!1552693 () Bool)

(assert (=> b!1552693 (= e!864459 false)))

(declare-fun lt!669152 () ListLongMap!22341)

(assert (=> b!1552693 (= lt!669152 (getCurrentListMapNoExtraKeys!6652 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!70845 () Bool)

(assert (=> bm!70845 (= call!70844 call!70845)))

(declare-fun b!1552694 () Bool)

(declare-fun res!1062763 () Bool)

(assert (=> b!1552694 (=> (not res!1062763) (not e!864460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103596 (_ BitVec 32)) Bool)

(assert (=> b!1552694 (= res!1062763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!132560 res!1062764) b!1552687))

(assert (= (and b!1552687 res!1062765) b!1552694))

(assert (= (and b!1552694 res!1062763) b!1552688))

(assert (= (and b!1552688 res!1062767) b!1552684))

(assert (= (and b!1552684 res!1062761) b!1552680))

(assert (= (and b!1552680 c!143340) b!1552689))

(assert (= (and b!1552680 (not c!143340)) b!1552682))

(assert (= (and b!1552682 c!143341) b!1552686))

(assert (= (and b!1552682 (not c!143341)) b!1552683))

(assert (= (and b!1552683 c!143339) b!1552691))

(assert (= (and b!1552683 (not c!143339)) b!1552679))

(assert (= (or b!1552691 b!1552679) bm!70845))

(assert (= (or b!1552686 bm!70845) bm!70843))

(assert (= (or b!1552686 b!1552691) bm!70842))

(assert (= (or b!1552689 bm!70843) bm!70841))

(assert (= (or b!1552689 bm!70842) bm!70844))

(assert (= (and b!1552680 res!1062762) b!1552681))

(assert (= (and b!1552681 res!1062766) b!1552693))

(assert (= (and b!1552690 condMapEmpty!58909) mapIsEmpty!58909))

(assert (= (and b!1552690 (not condMapEmpty!58909)) mapNonEmpty!58909))

(get-info :version)

(assert (= (and mapNonEmpty!58909 ((_ is ValueCellFull!18158) mapValue!58909)) b!1552685))

(assert (= (and b!1552690 ((_ is ValueCellFull!18158) mapDefault!58909)) b!1552692))

(assert (= start!132560 b!1552690))

(declare-fun m!1431519 () Bool)

(assert (=> start!132560 m!1431519))

(declare-fun m!1431521 () Bool)

(assert (=> start!132560 m!1431521))

(declare-fun m!1431523 () Bool)

(assert (=> start!132560 m!1431523))

(declare-fun m!1431525 () Bool)

(assert (=> b!1552693 m!1431525))

(declare-fun m!1431527 () Bool)

(assert (=> b!1552694 m!1431527))

(declare-fun m!1431529 () Bool)

(assert (=> mapNonEmpty!58909 m!1431529))

(declare-fun m!1431531 () Bool)

(assert (=> b!1552681 m!1431531))

(assert (=> b!1552681 m!1431531))

(declare-fun m!1431533 () Bool)

(assert (=> b!1552681 m!1431533))

(declare-fun m!1431535 () Bool)

(assert (=> b!1552688 m!1431535))

(declare-fun m!1431537 () Bool)

(assert (=> bm!70844 m!1431537))

(assert (=> bm!70841 m!1431525))

(declare-fun m!1431539 () Bool)

(assert (=> b!1552689 m!1431539))

(check-sat (not b!1552689) b_and!51285 (not bm!70844) (not b!1552681) (not b!1552693) (not b!1552688) (not b!1552694) (not bm!70841) (not start!132560) (not mapNonEmpty!58909) (not b_next!31861) tp_is_empty!38137)
(check-sat b_and!51285 (not b_next!31861))
