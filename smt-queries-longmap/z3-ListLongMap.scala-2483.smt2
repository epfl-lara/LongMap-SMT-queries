; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38702 () Bool)

(assert start!38702)

(declare-fun b_free!9253 () Bool)

(declare-fun b_next!9253 () Bool)

(assert (=> start!38702 (= b_free!9253 (not b_next!9253))))

(declare-fun tp!32882 () Bool)

(declare-fun b_and!16653 () Bool)

(assert (=> start!38702 (= tp!32882 b_and!16653)))

(declare-datatypes ((V!14619 0))(
  ( (V!14620 (val!5112 Int)) )
))
(declare-fun minValue!515 () V!14619)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6660 0))(
  ( (tuple2!6661 (_1!3341 (_ BitVec 64)) (_2!3341 V!14619)) )
))
(declare-datatypes ((List!6582 0))(
  ( (Nil!6579) (Cons!6578 (h!7434 tuple2!6660) (t!11748 List!6582)) )
))
(declare-datatypes ((ListLongMap!5575 0))(
  ( (ListLongMap!5576 (toList!2803 List!6582)) )
))
(declare-fun call!28411 () ListLongMap!5575)

(declare-datatypes ((ValueCell!4724 0))(
  ( (ValueCellFull!4724 (v!7360 V!14619)) (EmptyCell!4724) )
))
(declare-datatypes ((array!24154 0))(
  ( (array!24155 (arr!11526 (Array (_ BitVec 32) ValueCell!4724)) (size!11878 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24154)

(declare-fun zeroValue!515 () V!14619)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54813 () Bool)

(declare-datatypes ((array!24156 0))(
  ( (array!24157 (arr!11527 (Array (_ BitVec 32) (_ BitVec 64))) (size!11879 (_ BitVec 32))) )
))
(declare-fun lt!188003 () array!24156)

(declare-fun v!412 () V!14619)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!24156)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28407 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1057 (array!24156 array!24154 (_ BitVec 32) (_ BitVec 32) V!14619 V!14619 (_ BitVec 32) Int) ListLongMap!5575)

(assert (=> bm!28407 (= call!28411 (getCurrentListMapNoExtraKeys!1057 (ite c!54813 lt!188003 _keys!709) (ite c!54813 (array!24155 (store (arr!11526 _values!549) i!563 (ValueCellFull!4724 v!412)) (size!11878 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16824 () Bool)

(declare-fun mapRes!16824 () Bool)

(assert (=> mapIsEmpty!16824 mapRes!16824))

(declare-fun call!28410 () ListLongMap!5575)

(declare-fun bm!28408 () Bool)

(assert (=> bm!28408 (= call!28410 (getCurrentListMapNoExtraKeys!1057 (ite c!54813 _keys!709 lt!188003) (ite c!54813 _values!549 (array!24155 (store (arr!11526 _values!549) i!563 (ValueCellFull!4724 v!412)) (size!11878 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402861 () Bool)

(declare-fun res!232129 () Bool)

(declare-fun e!242630 () Bool)

(assert (=> b!402861 (=> (not res!232129) (not e!242630))))

(declare-datatypes ((List!6583 0))(
  ( (Nil!6580) (Cons!6579 (h!7435 (_ BitVec 64)) (t!11749 List!6583)) )
))
(declare-fun arrayNoDuplicates!0 (array!24156 (_ BitVec 32) List!6583) Bool)

(assert (=> b!402861 (= res!232129 (arrayNoDuplicates!0 lt!188003 #b00000000000000000000000000000000 Nil!6580))))

(declare-fun b!402862 () Bool)

(declare-fun res!232126 () Bool)

(declare-fun e!242629 () Bool)

(assert (=> b!402862 (=> (not res!232126) (not e!242629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24156 (_ BitVec 32)) Bool)

(assert (=> b!402862 (= res!232126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!232132 () Bool)

(assert (=> start!38702 (=> (not res!232132) (not e!242629))))

(assert (=> start!38702 (= res!232132 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11879 _keys!709))))))

(assert (=> start!38702 e!242629))

(declare-fun tp_is_empty!10135 () Bool)

(assert (=> start!38702 tp_is_empty!10135))

(assert (=> start!38702 tp!32882))

(assert (=> start!38702 true))

(declare-fun e!242626 () Bool)

(declare-fun array_inv!8510 (array!24154) Bool)

(assert (=> start!38702 (and (array_inv!8510 _values!549) e!242626)))

(declare-fun array_inv!8511 (array!24156) Bool)

(assert (=> start!38702 (array_inv!8511 _keys!709)))

(declare-fun mapNonEmpty!16824 () Bool)

(declare-fun tp!32883 () Bool)

(declare-fun e!242628 () Bool)

(assert (=> mapNonEmpty!16824 (= mapRes!16824 (and tp!32883 e!242628))))

(declare-fun mapKey!16824 () (_ BitVec 32))

(declare-fun mapValue!16824 () ValueCell!4724)

(declare-fun mapRest!16824 () (Array (_ BitVec 32) ValueCell!4724))

(assert (=> mapNonEmpty!16824 (= (arr!11526 _values!549) (store mapRest!16824 mapKey!16824 mapValue!16824))))

(declare-fun b!402863 () Bool)

(declare-fun e!242632 () Bool)

(assert (=> b!402863 (= e!242632 (= call!28410 call!28411))))

(declare-fun b!402864 () Bool)

(assert (=> b!402864 (= e!242629 e!242630)))

(declare-fun res!232124 () Bool)

(assert (=> b!402864 (=> (not res!232124) (not e!242630))))

(assert (=> b!402864 (= res!232124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188003 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!402864 (= lt!188003 (array!24157 (store (arr!11527 _keys!709) i!563 k0!794) (size!11879 _keys!709)))))

(declare-fun b!402865 () Bool)

(declare-fun res!232131 () Bool)

(assert (=> b!402865 (=> (not res!232131) (not e!242629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402865 (= res!232131 (validKeyInArray!0 k0!794))))

(declare-fun b!402866 () Bool)

(declare-fun res!232130 () Bool)

(assert (=> b!402866 (=> (not res!232130) (not e!242629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402866 (= res!232130 (validMask!0 mask!1025))))

(declare-fun b!402867 () Bool)

(declare-fun res!232127 () Bool)

(assert (=> b!402867 (=> (not res!232127) (not e!242630))))

(assert (=> b!402867 (= res!232127 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11879 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402868 () Bool)

(declare-fun res!232123 () Bool)

(assert (=> b!402868 (=> (not res!232123) (not e!242629))))

(assert (=> b!402868 (= res!232123 (and (= (size!11878 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11879 _keys!709) (size!11878 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402869 () Bool)

(assert (=> b!402869 (= e!242628 tp_is_empty!10135)))

(declare-fun b!402870 () Bool)

(declare-fun res!232134 () Bool)

(assert (=> b!402870 (=> (not res!232134) (not e!242629))))

(assert (=> b!402870 (= res!232134 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6580))))

(declare-fun b!402871 () Bool)

(declare-fun res!232133 () Bool)

(assert (=> b!402871 (=> (not res!232133) (not e!242629))))

(assert (=> b!402871 (= res!232133 (or (= (select (arr!11527 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11527 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402872 () Bool)

(declare-fun res!232125 () Bool)

(assert (=> b!402872 (=> (not res!232125) (not e!242629))))

(declare-fun arrayContainsKey!0 (array!24156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402872 (= res!232125 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402873 () Bool)

(declare-fun e!242631 () Bool)

(assert (=> b!402873 (= e!242631 tp_is_empty!10135)))

(declare-fun b!402874 () Bool)

(declare-fun res!232128 () Bool)

(assert (=> b!402874 (=> (not res!232128) (not e!242629))))

(assert (=> b!402874 (= res!232128 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11879 _keys!709))))))

(declare-fun b!402875 () Bool)

(declare-fun +!1145 (ListLongMap!5575 tuple2!6660) ListLongMap!5575)

(assert (=> b!402875 (= e!242632 (= call!28411 (+!1145 call!28410 (tuple2!6661 k0!794 v!412))))))

(declare-fun b!402876 () Bool)

(assert (=> b!402876 (= e!242630 (not true))))

(assert (=> b!402876 e!242632))

(assert (=> b!402876 (= c!54813 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12179 0))(
  ( (Unit!12180) )
))
(declare-fun lt!188004 () Unit!12179)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!357 (array!24156 array!24154 (_ BitVec 32) (_ BitVec 32) V!14619 V!14619 (_ BitVec 32) (_ BitVec 64) V!14619 (_ BitVec 32) Int) Unit!12179)

(assert (=> b!402876 (= lt!188004 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!357 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402877 () Bool)

(assert (=> b!402877 (= e!242626 (and e!242631 mapRes!16824))))

(declare-fun condMapEmpty!16824 () Bool)

(declare-fun mapDefault!16824 () ValueCell!4724)

(assert (=> b!402877 (= condMapEmpty!16824 (= (arr!11526 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4724)) mapDefault!16824)))))

(assert (= (and start!38702 res!232132) b!402866))

(assert (= (and b!402866 res!232130) b!402868))

(assert (= (and b!402868 res!232123) b!402862))

(assert (= (and b!402862 res!232126) b!402870))

(assert (= (and b!402870 res!232134) b!402874))

(assert (= (and b!402874 res!232128) b!402865))

(assert (= (and b!402865 res!232131) b!402871))

(assert (= (and b!402871 res!232133) b!402872))

(assert (= (and b!402872 res!232125) b!402864))

(assert (= (and b!402864 res!232124) b!402861))

(assert (= (and b!402861 res!232129) b!402867))

(assert (= (and b!402867 res!232127) b!402876))

(assert (= (and b!402876 c!54813) b!402875))

(assert (= (and b!402876 (not c!54813)) b!402863))

(assert (= (or b!402875 b!402863) bm!28407))

(assert (= (or b!402875 b!402863) bm!28408))

(assert (= (and b!402877 condMapEmpty!16824) mapIsEmpty!16824))

(assert (= (and b!402877 (not condMapEmpty!16824)) mapNonEmpty!16824))

(get-info :version)

(assert (= (and mapNonEmpty!16824 ((_ is ValueCellFull!4724) mapValue!16824)) b!402869))

(assert (= (and b!402877 ((_ is ValueCellFull!4724) mapDefault!16824)) b!402873))

(assert (= start!38702 b!402877))

(declare-fun m!396507 () Bool)

(assert (=> b!402870 m!396507))

(declare-fun m!396509 () Bool)

(assert (=> bm!28408 m!396509))

(declare-fun m!396511 () Bool)

(assert (=> bm!28408 m!396511))

(declare-fun m!396513 () Bool)

(assert (=> b!402865 m!396513))

(declare-fun m!396515 () Bool)

(assert (=> mapNonEmpty!16824 m!396515))

(declare-fun m!396517 () Bool)

(assert (=> b!402875 m!396517))

(declare-fun m!396519 () Bool)

(assert (=> b!402864 m!396519))

(declare-fun m!396521 () Bool)

(assert (=> b!402864 m!396521))

(declare-fun m!396523 () Bool)

(assert (=> b!402876 m!396523))

(declare-fun m!396525 () Bool)

(assert (=> b!402862 m!396525))

(declare-fun m!396527 () Bool)

(assert (=> b!402871 m!396527))

(assert (=> bm!28407 m!396509))

(declare-fun m!396529 () Bool)

(assert (=> bm!28407 m!396529))

(declare-fun m!396531 () Bool)

(assert (=> start!38702 m!396531))

(declare-fun m!396533 () Bool)

(assert (=> start!38702 m!396533))

(declare-fun m!396535 () Bool)

(assert (=> b!402861 m!396535))

(declare-fun m!396537 () Bool)

(assert (=> b!402866 m!396537))

(declare-fun m!396539 () Bool)

(assert (=> b!402872 m!396539))

(check-sat (not b!402875) (not bm!28407) (not b!402865) b_and!16653 (not b!402872) (not b!402876) (not b!402866) (not mapNonEmpty!16824) (not b!402864) (not b!402870) (not b!402862) (not b_next!9253) (not b!402861) (not bm!28408) tp_is_empty!10135 (not start!38702))
(check-sat b_and!16653 (not b_next!9253))
