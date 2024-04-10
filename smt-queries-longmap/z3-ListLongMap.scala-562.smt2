; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15216 () Bool)

(assert start!15216)

(declare-fun b!146613 () Bool)

(declare-fun b_free!3137 () Bool)

(declare-fun b_next!3137 () Bool)

(assert (=> b!146613 (= b_free!3137 (not b_next!3137))))

(declare-fun tp!11915 () Bool)

(declare-fun b_and!9191 () Bool)

(assert (=> b!146613 (= tp!11915 b_and!9191)))

(declare-fun b!146618 () Bool)

(declare-fun b_free!3139 () Bool)

(declare-fun b_next!3139 () Bool)

(assert (=> b!146618 (= b_free!3139 (not b_next!3139))))

(declare-fun tp!11916 () Bool)

(declare-fun b_and!9193 () Bool)

(assert (=> b!146618 (= tp!11916 b_and!9193)))

(declare-fun b!146610 () Bool)

(declare-fun e!95728 () Bool)

(declare-fun tp_is_empty!2985 () Bool)

(assert (=> b!146610 (= e!95728 tp_is_empty!2985)))

(declare-fun b!146611 () Bool)

(declare-datatypes ((Unit!4633 0))(
  ( (Unit!4634) )
))
(declare-fun e!95724 () Unit!4633)

(declare-fun Unit!4635 () Unit!4633)

(assert (=> b!146611 (= e!95724 Unit!4635)))

(declare-fun lt!77200 () Unit!4633)

(declare-datatypes ((V!3627 0))(
  ( (V!3628 (val!1537 Int)) )
))
(declare-datatypes ((array!5015 0))(
  ( (array!5016 (arr!2369 (Array (_ BitVec 32) (_ BitVec 64))) (size!2645 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1149 0))(
  ( (ValueCellFull!1149 (v!3363 V!3627)) (EmptyCell!1149) )
))
(declare-datatypes ((array!5017 0))(
  ( (array!5018 (arr!2370 (Array (_ BitVec 32) ValueCell!1149)) (size!2646 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1206 0))(
  ( (LongMapFixedSize!1207 (defaultEntry!3019 Int) (mask!7399 (_ BitVec 32)) (extraKeys!2764 (_ BitVec 32)) (zeroValue!2864 V!3627) (minValue!2864 V!3627) (_size!652 (_ BitVec 32)) (_keys!4788 array!5015) (_values!3002 array!5017) (_vacant!652 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!988 0))(
  ( (Cell!989 (v!3364 LongMapFixedSize!1206)) )
))
(declare-datatypes ((LongMap!988 0))(
  ( (LongMap!989 (underlying!505 Cell!988)) )
))
(declare-fun thiss!992 () LongMap!988)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!156 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 (_ BitVec 64) (_ BitVec 32) Int) Unit!4633)

(assert (=> b!146611 (= lt!77200 (lemmaListMapContainsThenArrayContainsFrom!156 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!5015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146611 (arrayContainsKey!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!77198 () Unit!4633)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!5015 (_ BitVec 32) (_ BitVec 32)) Unit!4633)

(assert (=> b!146611 (= lt!77198 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1783 0))(
  ( (Nil!1780) (Cons!1779 (h!2387 (_ BitVec 64)) (t!6504 List!1783)) )
))
(declare-fun arrayNoDuplicates!0 (array!5015 (_ BitVec 32) List!1783) Bool)

(assert (=> b!146611 (arrayNoDuplicates!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) from!355 Nil!1780)))

(declare-fun lt!77194 () Unit!4633)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!5015 (_ BitVec 32) (_ BitVec 64) List!1783) Unit!4633)

(assert (=> b!146611 (= lt!77194 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (Cons!1779 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) Nil!1780)))))

(assert (=> b!146611 false))

(declare-fun mapIsEmpty!5027 () Bool)

(declare-fun mapRes!5027 () Bool)

(assert (=> mapIsEmpty!5027 mapRes!5027))

(declare-fun b!146612 () Bool)

(declare-fun e!95718 () Bool)

(declare-fun e!95723 () Bool)

(assert (=> b!146612 (= e!95718 e!95723)))

(declare-fun res!69742 () Bool)

(assert (=> b!146612 (=> res!69742 e!95723)))

(declare-datatypes ((tuple2!2770 0))(
  ( (tuple2!2771 (_1!1396 Bool) (_2!1396 LongMapFixedSize!1206)) )
))
(declare-fun lt!77195 () tuple2!2770)

(assert (=> b!146612 (= res!69742 (not (_1!1396 lt!77195)))))

(declare-fun lt!77190 () tuple2!2770)

(declare-fun repackFrom!18 (LongMap!988 LongMapFixedSize!1206 (_ BitVec 32)) tuple2!2770)

(assert (=> b!146612 (= lt!77195 (repackFrom!18 thiss!992 (_2!1396 lt!77190) (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun e!95721 () Bool)

(declare-fun e!95727 () Bool)

(declare-fun array_inv!1489 (array!5015) Bool)

(declare-fun array_inv!1490 (array!5017) Bool)

(assert (=> b!146613 (= e!95721 (and tp!11915 tp_is_empty!2985 (array_inv!1489 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (array_inv!1490 (_values!3002 (v!3364 (underlying!505 thiss!992)))) e!95727))))

(declare-fun mapNonEmpty!5027 () Bool)

(declare-fun tp!11913 () Bool)

(assert (=> mapNonEmpty!5027 (= mapRes!5027 (and tp!11913 e!95728))))

(declare-fun mapValue!5027 () ValueCell!1149)

(declare-fun mapRest!5027 () (Array (_ BitVec 32) ValueCell!1149))

(declare-fun mapKey!5028 () (_ BitVec 32))

(assert (=> mapNonEmpty!5027 (= (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) (store mapRest!5027 mapKey!5028 mapValue!5027))))

(declare-fun b!146614 () Bool)

(declare-fun e!95720 () Bool)

(declare-fun e!95719 () Bool)

(declare-fun mapRes!5028 () Bool)

(assert (=> b!146614 (= e!95720 (and e!95719 mapRes!5028))))

(declare-fun condMapEmpty!5027 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1206)

(declare-fun mapDefault!5028 () ValueCell!1149)

(assert (=> b!146614 (= condMapEmpty!5027 (= (arr!2370 (_values!3002 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1149)) mapDefault!5028)))))

(declare-fun b!146616 () Bool)

(declare-fun res!69747 () Bool)

(declare-fun e!95709 () Bool)

(assert (=> b!146616 (=> (not res!69747) (not e!95709))))

(assert (=> b!146616 (= res!69747 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun b!146617 () Bool)

(declare-fun e!95716 () Bool)

(assert (=> b!146617 (= e!95723 e!95716)))

(declare-fun res!69741 () Bool)

(assert (=> b!146617 (=> (not res!69741) (not e!95716))))

(declare-fun valid!588 (LongMapFixedSize!1206) Bool)

(assert (=> b!146617 (= res!69741 (valid!588 (_2!1396 lt!77195)))))

(declare-fun e!95711 () Bool)

(assert (=> b!146618 (= e!95711 (and tp!11916 tp_is_empty!2985 (array_inv!1489 (_keys!4788 newMap!16)) (array_inv!1490 (_values!3002 newMap!16)) e!95720))))

(declare-fun b!146619 () Bool)

(declare-fun Unit!4636 () Unit!4633)

(assert (=> b!146619 (= e!95724 Unit!4636)))

(declare-fun b!146620 () Bool)

(declare-fun e!95722 () Bool)

(assert (=> b!146620 (= e!95722 (not e!95718))))

(declare-fun res!69743 () Bool)

(assert (=> b!146620 (=> res!69743 e!95718)))

(declare-datatypes ((tuple2!2772 0))(
  ( (tuple2!2773 (_1!1397 (_ BitVec 64)) (_2!1397 V!3627)) )
))
(declare-datatypes ((List!1784 0))(
  ( (Nil!1781) (Cons!1780 (h!2388 tuple2!2772) (t!6505 List!1784)) )
))
(declare-datatypes ((ListLongMap!1783 0))(
  ( (ListLongMap!1784 (toList!907 List!1784)) )
))
(declare-fun getCurrentListMap!576 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 (_ BitVec 32) Int) ListLongMap!1783)

(declare-fun map!1475 (LongMapFixedSize!1206) ListLongMap!1783)

(assert (=> b!146620 (= res!69743 (not (= (getCurrentListMap!576 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))) (map!1475 (_2!1396 lt!77190)))))))

(declare-fun lt!77207 () ListLongMap!1783)

(declare-fun lt!77196 () tuple2!2772)

(declare-fun lt!77204 () tuple2!2772)

(declare-fun lt!77202 () ListLongMap!1783)

(declare-fun +!187 (ListLongMap!1783 tuple2!2772) ListLongMap!1783)

(assert (=> b!146620 (= (+!187 lt!77207 lt!77204) (+!187 (+!187 lt!77202 lt!77204) lt!77196))))

(assert (=> b!146620 (= lt!77204 (tuple2!2773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77191 () V!3627)

(declare-fun lt!77197 () Unit!4633)

(declare-fun addCommutativeForDiffKeys!80 (ListLongMap!1783 (_ BitVec 64) V!3627 (_ BitVec 64) V!3627) Unit!4633)

(assert (=> b!146620 (= lt!77197 (addCommutativeForDiffKeys!80 lt!77202 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77193 () ListLongMap!1783)

(assert (=> b!146620 (= lt!77193 lt!77207)))

(assert (=> b!146620 (= lt!77207 (+!187 lt!77202 lt!77196))))

(declare-fun lt!77206 () ListLongMap!1783)

(declare-fun lt!77189 () tuple2!2772)

(assert (=> b!146620 (= lt!77193 (+!187 lt!77206 lt!77189))))

(declare-fun lt!77199 () ListLongMap!1783)

(assert (=> b!146620 (= lt!77202 (+!187 lt!77199 lt!77189))))

(assert (=> b!146620 (= lt!77189 (tuple2!2773 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> b!146620 (= lt!77206 (+!187 lt!77199 lt!77196))))

(assert (=> b!146620 (= lt!77196 (tuple2!2773 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191))))

(declare-fun lt!77205 () Unit!4633)

(assert (=> b!146620 (= lt!77205 (addCommutativeForDiffKeys!80 lt!77199 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!155 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 (_ BitVec 32) Int) ListLongMap!1783)

(assert (=> b!146620 (= lt!77199 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146621 () Bool)

(declare-fun res!69738 () Bool)

(assert (=> b!146621 (=> (not res!69738) (not e!95709))))

(assert (=> b!146621 (= res!69738 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7399 newMap!16)) (_size!652 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun mapNonEmpty!5028 () Bool)

(declare-fun tp!11914 () Bool)

(declare-fun e!95726 () Bool)

(assert (=> mapNonEmpty!5028 (= mapRes!5028 (and tp!11914 e!95726))))

(declare-fun mapKey!5027 () (_ BitVec 32))

(declare-fun mapRest!5028 () (Array (_ BitVec 32) ValueCell!1149))

(declare-fun mapValue!5028 () ValueCell!1149)

(assert (=> mapNonEmpty!5028 (= (arr!2370 (_values!3002 newMap!16)) (store mapRest!5028 mapKey!5027 mapValue!5028))))

(declare-fun b!146622 () Bool)

(declare-fun e!95715 () Bool)

(assert (=> b!146622 (= e!95709 e!95715)))

(declare-fun res!69740 () Bool)

(assert (=> b!146622 (=> (not res!69740) (not e!95715))))

(declare-fun lt!77192 () ListLongMap!1783)

(declare-fun lt!77203 () ListLongMap!1783)

(assert (=> b!146622 (= res!69740 (= lt!77192 lt!77203))))

(assert (=> b!146622 (= lt!77203 (map!1475 newMap!16))))

(assert (=> b!146622 (= lt!77192 (getCurrentListMap!576 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun mapIsEmpty!5028 () Bool)

(assert (=> mapIsEmpty!5028 mapRes!5028))

(declare-fun b!146623 () Bool)

(declare-fun e!95712 () Bool)

(assert (=> b!146623 (= e!95715 e!95712)))

(declare-fun res!69745 () Bool)

(assert (=> b!146623 (=> (not res!69745) (not e!95712))))

(assert (=> b!146623 (= res!69745 (and (not (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1578 (ValueCell!1149 V!3627) V!3627)

(declare-fun dynLambda!460 (Int (_ BitVec 64)) V!3627)

(assert (=> b!146623 (= lt!77191 (get!1578 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146624 () Bool)

(declare-fun e!95717 () Bool)

(assert (=> b!146624 (= e!95717 tp_is_empty!2985)))

(declare-fun b!146625 () Bool)

(assert (=> b!146625 (= e!95716 (= (map!1475 (_2!1396 lt!77195)) (map!1475 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun res!69746 () Bool)

(assert (=> start!15216 (=> (not res!69746) (not e!95709))))

(declare-fun valid!589 (LongMap!988) Bool)

(assert (=> start!15216 (= res!69746 (valid!589 thiss!992))))

(assert (=> start!15216 e!95709))

(declare-fun e!95725 () Bool)

(assert (=> start!15216 e!95725))

(assert (=> start!15216 true))

(assert (=> start!15216 e!95711))

(declare-fun b!146615 () Bool)

(assert (=> b!146615 (= e!95727 (and e!95717 mapRes!5027))))

(declare-fun condMapEmpty!5028 () Bool)

(declare-fun mapDefault!5027 () ValueCell!1149)

(assert (=> b!146615 (= condMapEmpty!5028 (= (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1149)) mapDefault!5027)))))

(declare-fun b!146626 () Bool)

(declare-fun e!95710 () Bool)

(assert (=> b!146626 (= e!95710 e!95721)))

(declare-fun b!146627 () Bool)

(assert (=> b!146627 (= e!95725 e!95710)))

(declare-fun b!146628 () Bool)

(assert (=> b!146628 (= e!95719 tp_is_empty!2985)))

(declare-fun b!146629 () Bool)

(declare-fun res!69744 () Bool)

(assert (=> b!146629 (=> (not res!69744) (not e!95709))))

(assert (=> b!146629 (= res!69744 (valid!588 newMap!16))))

(declare-fun b!146630 () Bool)

(assert (=> b!146630 (= e!95712 e!95722)))

(declare-fun res!69739 () Bool)

(assert (=> b!146630 (=> (not res!69739) (not e!95722))))

(assert (=> b!146630 (= res!69739 (and (_1!1396 lt!77190) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!77201 () Unit!4633)

(assert (=> b!146630 (= lt!77201 e!95724)))

(declare-fun c!27644 () Bool)

(declare-fun contains!952 (ListLongMap!1783 (_ BitVec 64)) Bool)

(assert (=> b!146630 (= c!27644 (contains!952 lt!77203 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun update!227 (LongMapFixedSize!1206 (_ BitVec 64) V!3627) tuple2!2770)

(assert (=> b!146630 (= lt!77190 (update!227 newMap!16 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191))))

(declare-fun b!146631 () Bool)

(assert (=> b!146631 (= e!95726 tp_is_empty!2985)))

(assert (= (and start!15216 res!69746) b!146616))

(assert (= (and b!146616 res!69747) b!146629))

(assert (= (and b!146629 res!69744) b!146621))

(assert (= (and b!146621 res!69738) b!146622))

(assert (= (and b!146622 res!69740) b!146623))

(assert (= (and b!146623 res!69745) b!146630))

(assert (= (and b!146630 c!27644) b!146611))

(assert (= (and b!146630 (not c!27644)) b!146619))

(assert (= (and b!146630 res!69739) b!146620))

(assert (= (and b!146620 (not res!69743)) b!146612))

(assert (= (and b!146612 (not res!69742)) b!146617))

(assert (= (and b!146617 res!69741) b!146625))

(assert (= (and b!146615 condMapEmpty!5028) mapIsEmpty!5027))

(assert (= (and b!146615 (not condMapEmpty!5028)) mapNonEmpty!5027))

(get-info :version)

(assert (= (and mapNonEmpty!5027 ((_ is ValueCellFull!1149) mapValue!5027)) b!146610))

(assert (= (and b!146615 ((_ is ValueCellFull!1149) mapDefault!5027)) b!146624))

(assert (= b!146613 b!146615))

(assert (= b!146626 b!146613))

(assert (= b!146627 b!146626))

(assert (= start!15216 b!146627))

(assert (= (and b!146614 condMapEmpty!5027) mapIsEmpty!5028))

(assert (= (and b!146614 (not condMapEmpty!5027)) mapNonEmpty!5028))

(assert (= (and mapNonEmpty!5028 ((_ is ValueCellFull!1149) mapValue!5028)) b!146631))

(assert (= (and b!146614 ((_ is ValueCellFull!1149) mapDefault!5028)) b!146628))

(assert (= b!146618 b!146614))

(assert (= start!15216 b!146618))

(declare-fun b_lambda!6561 () Bool)

(assert (=> (not b_lambda!6561) (not b!146623)))

(declare-fun t!6501 () Bool)

(declare-fun tb!2681 () Bool)

(assert (=> (and b!146613 (= (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))) t!6501) tb!2681))

(declare-fun result!4377 () Bool)

(assert (=> tb!2681 (= result!4377 tp_is_empty!2985)))

(assert (=> b!146623 t!6501))

(declare-fun b_and!9195 () Bool)

(assert (= b_and!9191 (and (=> t!6501 result!4377) b_and!9195)))

(declare-fun tb!2683 () Bool)

(declare-fun t!6503 () Bool)

(assert (=> (and b!146618 (= (defaultEntry!3019 newMap!16) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))) t!6503) tb!2683))

(declare-fun result!4381 () Bool)

(assert (= result!4381 result!4377))

(assert (=> b!146623 t!6503))

(declare-fun b_and!9197 () Bool)

(assert (= b_and!9193 (and (=> t!6503 result!4381) b_and!9197)))

(declare-fun m!176389 () Bool)

(assert (=> b!146620 m!176389))

(declare-fun m!176391 () Bool)

(assert (=> b!146620 m!176391))

(declare-fun m!176393 () Bool)

(assert (=> b!146620 m!176393))

(declare-fun m!176395 () Bool)

(assert (=> b!146620 m!176395))

(declare-fun m!176397 () Bool)

(assert (=> b!146620 m!176397))

(declare-fun m!176399 () Bool)

(assert (=> b!146620 m!176399))

(declare-fun m!176401 () Bool)

(assert (=> b!146620 m!176401))

(declare-fun m!176403 () Bool)

(assert (=> b!146620 m!176403))

(declare-fun m!176405 () Bool)

(assert (=> b!146620 m!176405))

(assert (=> b!146620 m!176403))

(declare-fun m!176407 () Bool)

(assert (=> b!146620 m!176407))

(declare-fun m!176409 () Bool)

(assert (=> b!146620 m!176409))

(assert (=> b!146620 m!176403))

(declare-fun m!176411 () Bool)

(assert (=> b!146620 m!176411))

(assert (=> b!146620 m!176391))

(declare-fun m!176413 () Bool)

(assert (=> b!146620 m!176413))

(assert (=> b!146623 m!176403))

(declare-fun m!176415 () Bool)

(assert (=> b!146623 m!176415))

(declare-fun m!176417 () Bool)

(assert (=> b!146623 m!176417))

(assert (=> b!146623 m!176415))

(assert (=> b!146623 m!176417))

(declare-fun m!176419 () Bool)

(assert (=> b!146623 m!176419))

(declare-fun m!176421 () Bool)

(assert (=> b!146612 m!176421))

(assert (=> b!146630 m!176403))

(assert (=> b!146630 m!176403))

(declare-fun m!176423 () Bool)

(assert (=> b!146630 m!176423))

(assert (=> b!146630 m!176403))

(declare-fun m!176425 () Bool)

(assert (=> b!146630 m!176425))

(declare-fun m!176427 () Bool)

(assert (=> mapNonEmpty!5028 m!176427))

(declare-fun m!176429 () Bool)

(assert (=> mapNonEmpty!5027 m!176429))

(declare-fun m!176431 () Bool)

(assert (=> b!146611 m!176431))

(declare-fun m!176433 () Bool)

(assert (=> b!146611 m!176433))

(assert (=> b!146611 m!176403))

(declare-fun m!176435 () Bool)

(assert (=> b!146611 m!176435))

(assert (=> b!146611 m!176403))

(assert (=> b!146611 m!176403))

(declare-fun m!176437 () Bool)

(assert (=> b!146611 m!176437))

(assert (=> b!146611 m!176403))

(declare-fun m!176439 () Bool)

(assert (=> b!146611 m!176439))

(declare-fun m!176441 () Bool)

(assert (=> b!146618 m!176441))

(declare-fun m!176443 () Bool)

(assert (=> b!146618 m!176443))

(declare-fun m!176445 () Bool)

(assert (=> b!146617 m!176445))

(declare-fun m!176447 () Bool)

(assert (=> b!146613 m!176447))

(declare-fun m!176449 () Bool)

(assert (=> b!146613 m!176449))

(declare-fun m!176451 () Bool)

(assert (=> b!146625 m!176451))

(declare-fun m!176453 () Bool)

(assert (=> b!146625 m!176453))

(declare-fun m!176455 () Bool)

(assert (=> b!146622 m!176455))

(declare-fun m!176457 () Bool)

(assert (=> b!146622 m!176457))

(declare-fun m!176459 () Bool)

(assert (=> b!146629 m!176459))

(declare-fun m!176461 () Bool)

(assert (=> start!15216 m!176461))

(check-sat (not mapNonEmpty!5028) b_and!9197 (not b!146617) (not b!146620) (not b!146618) (not b!146625) (not b!146630) (not b!146612) (not b_next!3139) (not b!146629) (not b!146613) (not mapNonEmpty!5027) (not b!146623) b_and!9195 (not start!15216) (not b!146622) (not b!146611) tp_is_empty!2985 (not b_next!3137) (not b_lambda!6561))
(check-sat b_and!9195 b_and!9197 (not b_next!3137) (not b_next!3139))
(get-model)

(declare-fun b_lambda!6565 () Bool)

(assert (= b_lambda!6561 (or (and b!146613 b_free!3137) (and b!146618 b_free!3139 (= (defaultEntry!3019 newMap!16) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))))) b_lambda!6565)))

(check-sat (not mapNonEmpty!5028) b_and!9197 (not b_lambda!6565) (not b!146617) (not b!146620) (not b!146618) (not b!146625) (not b!146630) (not b!146612) (not b_next!3139) (not b_next!3137) (not b!146629) (not b!146613) (not mapNonEmpty!5027) (not b!146623) b_and!9195 (not start!15216) (not b!146622) (not b!146611) tp_is_empty!2985)
(check-sat b_and!9195 b_and!9197 (not b_next!3137) (not b_next!3139))
(get-model)

(declare-fun d!46327 () Bool)

(declare-fun c!27650 () Bool)

(assert (=> d!46327 (= c!27650 ((_ is ValueCellFull!1149) (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun e!95791 () V!3627)

(assert (=> d!46327 (= (get!1578 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!95791)))

(declare-fun b!146706 () Bool)

(declare-fun get!1579 (ValueCell!1149 V!3627) V!3627)

(assert (=> b!146706 (= e!95791 (get!1579 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!146707 () Bool)

(declare-fun get!1580 (ValueCell!1149 V!3627) V!3627)

(assert (=> b!146707 (= e!95791 (get!1580 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46327 c!27650) b!146706))

(assert (= (and d!46327 (not c!27650)) b!146707))

(assert (=> b!146706 m!176415))

(assert (=> b!146706 m!176417))

(declare-fun m!176537 () Bool)

(assert (=> b!146706 m!176537))

(assert (=> b!146707 m!176415))

(assert (=> b!146707 m!176417))

(declare-fun m!176539 () Bool)

(assert (=> b!146707 m!176539))

(assert (=> b!146623 d!46327))

(declare-fun d!46329 () Bool)

(declare-fun res!69784 () Bool)

(declare-fun e!95794 () Bool)

(assert (=> d!46329 (=> (not res!69784) (not e!95794))))

(declare-fun simpleValid!101 (LongMapFixedSize!1206) Bool)

(assert (=> d!46329 (= res!69784 (simpleValid!101 (_2!1396 lt!77195)))))

(assert (=> d!46329 (= (valid!588 (_2!1396 lt!77195)) e!95794)))

(declare-fun b!146714 () Bool)

(declare-fun res!69785 () Bool)

(assert (=> b!146714 (=> (not res!69785) (not e!95794))))

(declare-fun arrayCountValidKeys!0 (array!5015 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!146714 (= res!69785 (= (arrayCountValidKeys!0 (_keys!4788 (_2!1396 lt!77195)) #b00000000000000000000000000000000 (size!2645 (_keys!4788 (_2!1396 lt!77195)))) (_size!652 (_2!1396 lt!77195))))))

(declare-fun b!146715 () Bool)

(declare-fun res!69786 () Bool)

(assert (=> b!146715 (=> (not res!69786) (not e!95794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5015 (_ BitVec 32)) Bool)

(assert (=> b!146715 (= res!69786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4788 (_2!1396 lt!77195)) (mask!7399 (_2!1396 lt!77195))))))

(declare-fun b!146716 () Bool)

(assert (=> b!146716 (= e!95794 (arrayNoDuplicates!0 (_keys!4788 (_2!1396 lt!77195)) #b00000000000000000000000000000000 Nil!1780))))

(assert (= (and d!46329 res!69784) b!146714))

(assert (= (and b!146714 res!69785) b!146715))

(assert (= (and b!146715 res!69786) b!146716))

(declare-fun m!176541 () Bool)

(assert (=> d!46329 m!176541))

(declare-fun m!176543 () Bool)

(assert (=> b!146714 m!176543))

(declare-fun m!176545 () Bool)

(assert (=> b!146715 m!176545))

(declare-fun m!176547 () Bool)

(assert (=> b!146716 m!176547))

(assert (=> b!146617 d!46329))

(declare-fun d!46331 () Bool)

(assert (=> d!46331 (= (map!1475 (_2!1396 lt!77195)) (getCurrentListMap!576 (_keys!4788 (_2!1396 lt!77195)) (_values!3002 (_2!1396 lt!77195)) (mask!7399 (_2!1396 lt!77195)) (extraKeys!2764 (_2!1396 lt!77195)) (zeroValue!2864 (_2!1396 lt!77195)) (minValue!2864 (_2!1396 lt!77195)) #b00000000000000000000000000000000 (defaultEntry!3019 (_2!1396 lt!77195))))))

(declare-fun bs!6143 () Bool)

(assert (= bs!6143 d!46331))

(declare-fun m!176549 () Bool)

(assert (=> bs!6143 m!176549))

(assert (=> b!146625 d!46331))

(declare-fun d!46333 () Bool)

(assert (=> d!46333 (= (map!1475 (v!3364 (underlying!505 thiss!992))) (getCurrentListMap!576 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun bs!6144 () Bool)

(assert (= bs!6144 d!46333))

(declare-fun m!176551 () Bool)

(assert (=> bs!6144 m!176551))

(assert (=> b!146625 d!46333))

(declare-fun d!46335 () Bool)

(assert (=> d!46335 (= (array_inv!1489 (_keys!4788 newMap!16)) (bvsge (size!2645 (_keys!4788 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!146618 d!46335))

(declare-fun d!46337 () Bool)

(assert (=> d!46337 (= (array_inv!1490 (_values!3002 newMap!16)) (bvsge (size!2646 (_values!3002 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!146618 d!46337))

(declare-fun d!46339 () Bool)

(declare-fun e!95797 () Bool)

(assert (=> d!46339 e!95797))

(declare-fun res!69791 () Bool)

(assert (=> d!46339 (=> (not res!69791) (not e!95797))))

(declare-fun lt!77275 () ListLongMap!1783)

(assert (=> d!46339 (= res!69791 (contains!952 lt!77275 (_1!1397 lt!77189)))))

(declare-fun lt!77273 () List!1784)

(assert (=> d!46339 (= lt!77275 (ListLongMap!1784 lt!77273))))

(declare-fun lt!77276 () Unit!4633)

(declare-fun lt!77274 () Unit!4633)

(assert (=> d!46339 (= lt!77276 lt!77274)))

(declare-datatypes ((Option!187 0))(
  ( (Some!186 (v!3368 V!3627)) (None!185) )
))
(declare-fun getValueByKey!181 (List!1784 (_ BitVec 64)) Option!187)

(assert (=> d!46339 (= (getValueByKey!181 lt!77273 (_1!1397 lt!77189)) (Some!186 (_2!1397 lt!77189)))))

(declare-fun lemmaContainsTupThenGetReturnValue!94 (List!1784 (_ BitVec 64) V!3627) Unit!4633)

(assert (=> d!46339 (= lt!77274 (lemmaContainsTupThenGetReturnValue!94 lt!77273 (_1!1397 lt!77189) (_2!1397 lt!77189)))))

(declare-fun insertStrictlySorted!97 (List!1784 (_ BitVec 64) V!3627) List!1784)

(assert (=> d!46339 (= lt!77273 (insertStrictlySorted!97 (toList!907 lt!77199) (_1!1397 lt!77189) (_2!1397 lt!77189)))))

(assert (=> d!46339 (= (+!187 lt!77199 lt!77189) lt!77275)))

(declare-fun b!146721 () Bool)

(declare-fun res!69792 () Bool)

(assert (=> b!146721 (=> (not res!69792) (not e!95797))))

(assert (=> b!146721 (= res!69792 (= (getValueByKey!181 (toList!907 lt!77275) (_1!1397 lt!77189)) (Some!186 (_2!1397 lt!77189))))))

(declare-fun b!146722 () Bool)

(declare-fun contains!954 (List!1784 tuple2!2772) Bool)

(assert (=> b!146722 (= e!95797 (contains!954 (toList!907 lt!77275) lt!77189))))

(assert (= (and d!46339 res!69791) b!146721))

(assert (= (and b!146721 res!69792) b!146722))

(declare-fun m!176553 () Bool)

(assert (=> d!46339 m!176553))

(declare-fun m!176555 () Bool)

(assert (=> d!46339 m!176555))

(declare-fun m!176557 () Bool)

(assert (=> d!46339 m!176557))

(declare-fun m!176559 () Bool)

(assert (=> d!46339 m!176559))

(declare-fun m!176561 () Bool)

(assert (=> b!146721 m!176561))

(declare-fun m!176563 () Bool)

(assert (=> b!146722 m!176563))

(assert (=> b!146620 d!46339))

(declare-fun d!46341 () Bool)

(assert (=> d!46341 (= (+!187 (+!187 lt!77199 (tuple2!2773 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191)) (tuple2!2773 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))))) (+!187 (+!187 lt!77199 (tuple2!2773 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))))) (tuple2!2773 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191)))))

(declare-fun lt!77279 () Unit!4633)

(declare-fun choose!900 (ListLongMap!1783 (_ BitVec 64) V!3627 (_ BitVec 64) V!3627) Unit!4633)

(assert (=> d!46341 (= lt!77279 (choose!900 lt!77199 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> d!46341 (not (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46341 (= (addCommutativeForDiffKeys!80 lt!77199 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))) lt!77279)))

(declare-fun bs!6145 () Bool)

(assert (= bs!6145 d!46341))

(declare-fun m!176565 () Bool)

(assert (=> bs!6145 m!176565))

(assert (=> bs!6145 m!176403))

(declare-fun m!176567 () Bool)

(assert (=> bs!6145 m!176567))

(declare-fun m!176569 () Bool)

(assert (=> bs!6145 m!176569))

(assert (=> bs!6145 m!176569))

(declare-fun m!176571 () Bool)

(assert (=> bs!6145 m!176571))

(assert (=> bs!6145 m!176565))

(declare-fun m!176573 () Bool)

(assert (=> bs!6145 m!176573))

(assert (=> b!146620 d!46341))

(declare-fun d!46343 () Bool)

(declare-fun e!95798 () Bool)

(assert (=> d!46343 e!95798))

(declare-fun res!69793 () Bool)

(assert (=> d!46343 (=> (not res!69793) (not e!95798))))

(declare-fun lt!77282 () ListLongMap!1783)

(assert (=> d!46343 (= res!69793 (contains!952 lt!77282 (_1!1397 lt!77196)))))

(declare-fun lt!77280 () List!1784)

(assert (=> d!46343 (= lt!77282 (ListLongMap!1784 lt!77280))))

(declare-fun lt!77283 () Unit!4633)

(declare-fun lt!77281 () Unit!4633)

(assert (=> d!46343 (= lt!77283 lt!77281)))

(assert (=> d!46343 (= (getValueByKey!181 lt!77280 (_1!1397 lt!77196)) (Some!186 (_2!1397 lt!77196)))))

(assert (=> d!46343 (= lt!77281 (lemmaContainsTupThenGetReturnValue!94 lt!77280 (_1!1397 lt!77196) (_2!1397 lt!77196)))))

(assert (=> d!46343 (= lt!77280 (insertStrictlySorted!97 (toList!907 lt!77202) (_1!1397 lt!77196) (_2!1397 lt!77196)))))

(assert (=> d!46343 (= (+!187 lt!77202 lt!77196) lt!77282)))

(declare-fun b!146723 () Bool)

(declare-fun res!69794 () Bool)

(assert (=> b!146723 (=> (not res!69794) (not e!95798))))

(assert (=> b!146723 (= res!69794 (= (getValueByKey!181 (toList!907 lt!77282) (_1!1397 lt!77196)) (Some!186 (_2!1397 lt!77196))))))

(declare-fun b!146724 () Bool)

(assert (=> b!146724 (= e!95798 (contains!954 (toList!907 lt!77282) lt!77196))))

(assert (= (and d!46343 res!69793) b!146723))

(assert (= (and b!146723 res!69794) b!146724))

(declare-fun m!176575 () Bool)

(assert (=> d!46343 m!176575))

(declare-fun m!176577 () Bool)

(assert (=> d!46343 m!176577))

(declare-fun m!176579 () Bool)

(assert (=> d!46343 m!176579))

(declare-fun m!176581 () Bool)

(assert (=> d!46343 m!176581))

(declare-fun m!176583 () Bool)

(assert (=> b!146723 m!176583))

(declare-fun m!176585 () Bool)

(assert (=> b!146724 m!176585))

(assert (=> b!146620 d!46343))

(declare-fun d!46345 () Bool)

(declare-fun e!95799 () Bool)

(assert (=> d!46345 e!95799))

(declare-fun res!69795 () Bool)

(assert (=> d!46345 (=> (not res!69795) (not e!95799))))

(declare-fun lt!77286 () ListLongMap!1783)

(assert (=> d!46345 (= res!69795 (contains!952 lt!77286 (_1!1397 lt!77204)))))

(declare-fun lt!77284 () List!1784)

(assert (=> d!46345 (= lt!77286 (ListLongMap!1784 lt!77284))))

(declare-fun lt!77287 () Unit!4633)

(declare-fun lt!77285 () Unit!4633)

(assert (=> d!46345 (= lt!77287 lt!77285)))

(assert (=> d!46345 (= (getValueByKey!181 lt!77284 (_1!1397 lt!77204)) (Some!186 (_2!1397 lt!77204)))))

(assert (=> d!46345 (= lt!77285 (lemmaContainsTupThenGetReturnValue!94 lt!77284 (_1!1397 lt!77204) (_2!1397 lt!77204)))))

(assert (=> d!46345 (= lt!77284 (insertStrictlySorted!97 (toList!907 lt!77207) (_1!1397 lt!77204) (_2!1397 lt!77204)))))

(assert (=> d!46345 (= (+!187 lt!77207 lt!77204) lt!77286)))

(declare-fun b!146725 () Bool)

(declare-fun res!69796 () Bool)

(assert (=> b!146725 (=> (not res!69796) (not e!95799))))

(assert (=> b!146725 (= res!69796 (= (getValueByKey!181 (toList!907 lt!77286) (_1!1397 lt!77204)) (Some!186 (_2!1397 lt!77204))))))

(declare-fun b!146726 () Bool)

(assert (=> b!146726 (= e!95799 (contains!954 (toList!907 lt!77286) lt!77204))))

(assert (= (and d!46345 res!69795) b!146725))

(assert (= (and b!146725 res!69796) b!146726))

(declare-fun m!176587 () Bool)

(assert (=> d!46345 m!176587))

(declare-fun m!176589 () Bool)

(assert (=> d!46345 m!176589))

(declare-fun m!176591 () Bool)

(assert (=> d!46345 m!176591))

(declare-fun m!176593 () Bool)

(assert (=> d!46345 m!176593))

(declare-fun m!176595 () Bool)

(assert (=> b!146725 m!176595))

(declare-fun m!176597 () Bool)

(assert (=> b!146726 m!176597))

(assert (=> b!146620 d!46345))

(declare-fun bm!16344 () Bool)

(declare-fun call!16347 () ListLongMap!1783)

(assert (=> bm!16344 (= call!16347 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146751 () Bool)

(declare-fun lt!77307 () ListLongMap!1783)

(declare-fun e!95814 () Bool)

(assert (=> b!146751 (= e!95814 (= lt!77307 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146752 () Bool)

(declare-fun e!95817 () ListLongMap!1783)

(declare-fun e!95815 () ListLongMap!1783)

(assert (=> b!146752 (= e!95817 e!95815)))

(declare-fun c!27660 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!146752 (= c!27660 (validKeyInArray!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!146753 () Bool)

(declare-fun res!69808 () Bool)

(declare-fun e!95820 () Bool)

(assert (=> b!146753 (=> (not res!69808) (not e!95820))))

(assert (=> b!146753 (= res!69808 (not (contains!952 lt!77307 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!46347 () Bool)

(assert (=> d!46347 e!95820))

(declare-fun res!69805 () Bool)

(assert (=> d!46347 (=> (not res!69805) (not e!95820))))

(assert (=> d!46347 (= res!69805 (not (contains!952 lt!77307 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46347 (= lt!77307 e!95817)))

(declare-fun c!27662 () Bool)

(assert (=> d!46347 (= c!27662 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!46347 (validMask!0 (mask!7399 (v!3364 (underlying!505 thiss!992))))))

(assert (=> d!46347 (= (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))) lt!77307)))

(declare-fun b!146754 () Bool)

(declare-fun e!95818 () Bool)

(declare-fun e!95819 () Bool)

(assert (=> b!146754 (= e!95818 e!95819)))

(assert (=> b!146754 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun res!69807 () Bool)

(assert (=> b!146754 (= res!69807 (contains!952 lt!77307 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!146754 (=> (not res!69807) (not e!95819))))

(declare-fun b!146755 () Bool)

(declare-fun lt!77305 () Unit!4633)

(declare-fun lt!77302 () Unit!4633)

(assert (=> b!146755 (= lt!77305 lt!77302)))

(declare-fun lt!77306 () V!3627)

(declare-fun lt!77303 () ListLongMap!1783)

(declare-fun lt!77304 () (_ BitVec 64))

(declare-fun lt!77308 () (_ BitVec 64))

(assert (=> b!146755 (not (contains!952 (+!187 lt!77303 (tuple2!2773 lt!77308 lt!77306)) lt!77304))))

(declare-fun addStillNotContains!68 (ListLongMap!1783 (_ BitVec 64) V!3627 (_ BitVec 64)) Unit!4633)

(assert (=> b!146755 (= lt!77302 (addStillNotContains!68 lt!77303 lt!77308 lt!77306 lt!77304))))

(assert (=> b!146755 (= lt!77304 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!146755 (= lt!77306 (get!1578 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146755 (= lt!77308 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!146755 (= lt!77303 call!16347)))

(assert (=> b!146755 (= e!95815 (+!187 call!16347 (tuple2!2773 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1578 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!146756 () Bool)

(assert (=> b!146756 (= e!95817 (ListLongMap!1784 Nil!1781))))

(declare-fun b!146757 () Bool)

(assert (=> b!146757 (= e!95818 e!95814)))

(declare-fun c!27659 () Bool)

(assert (=> b!146757 (= c!27659 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146758 () Bool)

(declare-fun e!95816 () Bool)

(assert (=> b!146758 (= e!95816 (validKeyInArray!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!146758 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!146759 () Bool)

(assert (=> b!146759 (= e!95815 call!16347)))

(declare-fun b!146760 () Bool)

(assert (=> b!146760 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> b!146760 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2646 (_values!3002 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun apply!125 (ListLongMap!1783 (_ BitVec 64)) V!3627)

(assert (=> b!146760 (= e!95819 (= (apply!125 lt!77307 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1578 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!146761 () Bool)

(declare-fun isEmpty!426 (ListLongMap!1783) Bool)

(assert (=> b!146761 (= e!95814 (isEmpty!426 lt!77307))))

(declare-fun b!146762 () Bool)

(assert (=> b!146762 (= e!95820 e!95818)))

(declare-fun c!27661 () Bool)

(assert (=> b!146762 (= c!27661 e!95816)))

(declare-fun res!69806 () Bool)

(assert (=> b!146762 (=> (not res!69806) (not e!95816))))

(assert (=> b!146762 (= res!69806 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(assert (= (and d!46347 c!27662) b!146756))

(assert (= (and d!46347 (not c!27662)) b!146752))

(assert (= (and b!146752 c!27660) b!146755))

(assert (= (and b!146752 (not c!27660)) b!146759))

(assert (= (or b!146755 b!146759) bm!16344))

(assert (= (and d!46347 res!69805) b!146753))

(assert (= (and b!146753 res!69808) b!146762))

(assert (= (and b!146762 res!69806) b!146758))

(assert (= (and b!146762 c!27661) b!146754))

(assert (= (and b!146762 (not c!27661)) b!146757))

(assert (= (and b!146754 res!69807) b!146760))

(assert (= (and b!146757 c!27659) b!146751))

(assert (= (and b!146757 (not c!27659)) b!146761))

(declare-fun b_lambda!6567 () Bool)

(assert (=> (not b_lambda!6567) (not b!146755)))

(assert (=> b!146755 t!6501))

(declare-fun b_and!9207 () Bool)

(assert (= b_and!9195 (and (=> t!6501 result!4377) b_and!9207)))

(assert (=> b!146755 t!6503))

(declare-fun b_and!9209 () Bool)

(assert (= b_and!9197 (and (=> t!6503 result!4381) b_and!9209)))

(declare-fun b_lambda!6569 () Bool)

(assert (=> (not b_lambda!6569) (not b!146760)))

(assert (=> b!146760 t!6501))

(declare-fun b_and!9211 () Bool)

(assert (= b_and!9207 (and (=> t!6501 result!4377) b_and!9211)))

(assert (=> b!146760 t!6503))

(declare-fun b_and!9213 () Bool)

(assert (= b_and!9209 (and (=> t!6503 result!4381) b_and!9213)))

(declare-fun m!176599 () Bool)

(assert (=> b!146754 m!176599))

(assert (=> b!146754 m!176599))

(declare-fun m!176601 () Bool)

(assert (=> b!146754 m!176601))

(assert (=> b!146752 m!176599))

(assert (=> b!146752 m!176599))

(declare-fun m!176603 () Bool)

(assert (=> b!146752 m!176603))

(declare-fun m!176605 () Bool)

(assert (=> b!146760 m!176605))

(assert (=> b!146760 m!176599))

(assert (=> b!146760 m!176605))

(assert (=> b!146760 m!176417))

(declare-fun m!176607 () Bool)

(assert (=> b!146760 m!176607))

(assert (=> b!146760 m!176417))

(assert (=> b!146760 m!176599))

(declare-fun m!176609 () Bool)

(assert (=> b!146760 m!176609))

(declare-fun m!176611 () Bool)

(assert (=> b!146753 m!176611))

(declare-fun m!176613 () Bool)

(assert (=> b!146751 m!176613))

(assert (=> bm!16344 m!176613))

(assert (=> b!146758 m!176599))

(assert (=> b!146758 m!176599))

(assert (=> b!146758 m!176603))

(declare-fun m!176615 () Bool)

(assert (=> b!146761 m!176615))

(declare-fun m!176617 () Bool)

(assert (=> d!46347 m!176617))

(declare-fun m!176619 () Bool)

(assert (=> d!46347 m!176619))

(declare-fun m!176621 () Bool)

(assert (=> b!146755 m!176621))

(declare-fun m!176623 () Bool)

(assert (=> b!146755 m!176623))

(assert (=> b!146755 m!176621))

(declare-fun m!176625 () Bool)

(assert (=> b!146755 m!176625))

(assert (=> b!146755 m!176605))

(assert (=> b!146755 m!176599))

(declare-fun m!176627 () Bool)

(assert (=> b!146755 m!176627))

(assert (=> b!146755 m!176605))

(assert (=> b!146755 m!176417))

(assert (=> b!146755 m!176607))

(assert (=> b!146755 m!176417))

(assert (=> b!146620 d!46347))

(declare-fun d!46349 () Bool)

(declare-fun e!95821 () Bool)

(assert (=> d!46349 e!95821))

(declare-fun res!69809 () Bool)

(assert (=> d!46349 (=> (not res!69809) (not e!95821))))

(declare-fun lt!77311 () ListLongMap!1783)

(assert (=> d!46349 (= res!69809 (contains!952 lt!77311 (_1!1397 lt!77189)))))

(declare-fun lt!77309 () List!1784)

(assert (=> d!46349 (= lt!77311 (ListLongMap!1784 lt!77309))))

(declare-fun lt!77312 () Unit!4633)

(declare-fun lt!77310 () Unit!4633)

(assert (=> d!46349 (= lt!77312 lt!77310)))

(assert (=> d!46349 (= (getValueByKey!181 lt!77309 (_1!1397 lt!77189)) (Some!186 (_2!1397 lt!77189)))))

(assert (=> d!46349 (= lt!77310 (lemmaContainsTupThenGetReturnValue!94 lt!77309 (_1!1397 lt!77189) (_2!1397 lt!77189)))))

(assert (=> d!46349 (= lt!77309 (insertStrictlySorted!97 (toList!907 lt!77206) (_1!1397 lt!77189) (_2!1397 lt!77189)))))

(assert (=> d!46349 (= (+!187 lt!77206 lt!77189) lt!77311)))

(declare-fun b!146763 () Bool)

(declare-fun res!69810 () Bool)

(assert (=> b!146763 (=> (not res!69810) (not e!95821))))

(assert (=> b!146763 (= res!69810 (= (getValueByKey!181 (toList!907 lt!77311) (_1!1397 lt!77189)) (Some!186 (_2!1397 lt!77189))))))

(declare-fun b!146764 () Bool)

(assert (=> b!146764 (= e!95821 (contains!954 (toList!907 lt!77311) lt!77189))))

(assert (= (and d!46349 res!69809) b!146763))

(assert (= (and b!146763 res!69810) b!146764))

(declare-fun m!176629 () Bool)

(assert (=> d!46349 m!176629))

(declare-fun m!176631 () Bool)

(assert (=> d!46349 m!176631))

(declare-fun m!176633 () Bool)

(assert (=> d!46349 m!176633))

(declare-fun m!176635 () Bool)

(assert (=> d!46349 m!176635))

(declare-fun m!176637 () Bool)

(assert (=> b!146763 m!176637))

(declare-fun m!176639 () Bool)

(assert (=> b!146764 m!176639))

(assert (=> b!146620 d!46349))

(declare-fun d!46351 () Bool)

(declare-fun e!95822 () Bool)

(assert (=> d!46351 e!95822))

(declare-fun res!69811 () Bool)

(assert (=> d!46351 (=> (not res!69811) (not e!95822))))

(declare-fun lt!77315 () ListLongMap!1783)

(assert (=> d!46351 (= res!69811 (contains!952 lt!77315 (_1!1397 lt!77196)))))

(declare-fun lt!77313 () List!1784)

(assert (=> d!46351 (= lt!77315 (ListLongMap!1784 lt!77313))))

(declare-fun lt!77316 () Unit!4633)

(declare-fun lt!77314 () Unit!4633)

(assert (=> d!46351 (= lt!77316 lt!77314)))

(assert (=> d!46351 (= (getValueByKey!181 lt!77313 (_1!1397 lt!77196)) (Some!186 (_2!1397 lt!77196)))))

(assert (=> d!46351 (= lt!77314 (lemmaContainsTupThenGetReturnValue!94 lt!77313 (_1!1397 lt!77196) (_2!1397 lt!77196)))))

(assert (=> d!46351 (= lt!77313 (insertStrictlySorted!97 (toList!907 (+!187 lt!77202 lt!77204)) (_1!1397 lt!77196) (_2!1397 lt!77196)))))

(assert (=> d!46351 (= (+!187 (+!187 lt!77202 lt!77204) lt!77196) lt!77315)))

(declare-fun b!146765 () Bool)

(declare-fun res!69812 () Bool)

(assert (=> b!146765 (=> (not res!69812) (not e!95822))))

(assert (=> b!146765 (= res!69812 (= (getValueByKey!181 (toList!907 lt!77315) (_1!1397 lt!77196)) (Some!186 (_2!1397 lt!77196))))))

(declare-fun b!146766 () Bool)

(assert (=> b!146766 (= e!95822 (contains!954 (toList!907 lt!77315) lt!77196))))

(assert (= (and d!46351 res!69811) b!146765))

(assert (= (and b!146765 res!69812) b!146766))

(declare-fun m!176641 () Bool)

(assert (=> d!46351 m!176641))

(declare-fun m!176643 () Bool)

(assert (=> d!46351 m!176643))

(declare-fun m!176645 () Bool)

(assert (=> d!46351 m!176645))

(declare-fun m!176647 () Bool)

(assert (=> d!46351 m!176647))

(declare-fun m!176649 () Bool)

(assert (=> b!146765 m!176649))

(declare-fun m!176651 () Bool)

(assert (=> b!146766 m!176651))

(assert (=> b!146620 d!46351))

(declare-fun b!146809 () Bool)

(declare-fun e!95852 () Bool)

(assert (=> b!146809 (= e!95852 (validKeyInArray!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun bm!16359 () Bool)

(declare-fun call!16364 () ListLongMap!1783)

(assert (=> bm!16359 (= call!16364 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146810 () Bool)

(declare-fun e!95859 () ListLongMap!1783)

(declare-fun call!16368 () ListLongMap!1783)

(assert (=> b!146810 (= e!95859 call!16368)))

(declare-fun b!146811 () Bool)

(declare-fun res!69838 () Bool)

(declare-fun e!95857 () Bool)

(assert (=> b!146811 (=> (not res!69838) (not e!95857))))

(declare-fun e!95855 () Bool)

(assert (=> b!146811 (= res!69838 e!95855)))

(declare-fun res!69837 () Bool)

(assert (=> b!146811 (=> res!69837 e!95855)))

(assert (=> b!146811 (= res!69837 (not e!95852))))

(declare-fun res!69835 () Bool)

(assert (=> b!146811 (=> (not res!69835) (not e!95852))))

(assert (=> b!146811 (= res!69835 (bvslt from!355 (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146812 () Bool)

(declare-fun e!95854 () Bool)

(declare-fun call!16363 () Bool)

(assert (=> b!146812 (= e!95854 (not call!16363))))

(declare-fun b!146813 () Bool)

(declare-fun e!95849 () Bool)

(declare-fun e!95861 () Bool)

(assert (=> b!146813 (= e!95849 e!95861)))

(declare-fun res!69833 () Bool)

(declare-fun call!16362 () Bool)

(assert (=> b!146813 (= res!69833 call!16362)))

(assert (=> b!146813 (=> (not res!69833) (not e!95861))))

(declare-fun d!46353 () Bool)

(assert (=> d!46353 e!95857))

(declare-fun res!69836 () Bool)

(assert (=> d!46353 (=> (not res!69836) (not e!95857))))

(assert (=> d!46353 (= res!69836 (or (bvsge from!355 (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))) (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))))

(declare-fun lt!77371 () ListLongMap!1783)

(declare-fun lt!77368 () ListLongMap!1783)

(assert (=> d!46353 (= lt!77371 lt!77368)))

(declare-fun lt!77367 () Unit!4633)

(declare-fun e!95858 () Unit!4633)

(assert (=> d!46353 (= lt!77367 e!95858)))

(declare-fun c!27675 () Bool)

(declare-fun e!95860 () Bool)

(assert (=> d!46353 (= c!27675 e!95860)))

(declare-fun res!69839 () Bool)

(assert (=> d!46353 (=> (not res!69839) (not e!95860))))

(assert (=> d!46353 (= res!69839 (bvslt from!355 (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun e!95850 () ListLongMap!1783)

(assert (=> d!46353 (= lt!77368 e!95850)))

(declare-fun c!27678 () Bool)

(assert (=> d!46353 (= c!27678 (and (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46353 (validMask!0 (mask!7399 (v!3364 (underlying!505 thiss!992))))))

(assert (=> d!46353 (= (getCurrentListMap!576 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))) lt!77371)))

(declare-fun bm!16360 () Bool)

(declare-fun call!16367 () ListLongMap!1783)

(assert (=> bm!16360 (= call!16367 call!16364)))

(declare-fun b!146814 () Bool)

(declare-fun call!16366 () ListLongMap!1783)

(assert (=> b!146814 (= e!95859 call!16366)))

(declare-fun b!146815 () Bool)

(declare-fun e!95853 () Bool)

(assert (=> b!146815 (= e!95853 (= (apply!125 lt!77371 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun e!95856 () Bool)

(declare-fun b!146816 () Bool)

(assert (=> b!146816 (= e!95856 (= (apply!125 lt!77371 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)) (get!1578 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) from!355) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!146816 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2646 (_values!3002 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> b!146816 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146817 () Bool)

(assert (=> b!146817 (= e!95849 (not call!16362))))

(declare-fun b!146818 () Bool)

(declare-fun e!95851 () ListLongMap!1783)

(assert (=> b!146818 (= e!95850 e!95851)))

(declare-fun c!27676 () Bool)

(assert (=> b!146818 (= c!27676 (and (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!146819 () Bool)

(declare-fun call!16365 () ListLongMap!1783)

(assert (=> b!146819 (= e!95850 (+!187 call!16365 (tuple2!2773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146820 () Bool)

(declare-fun res!69834 () Bool)

(assert (=> b!146820 (=> (not res!69834) (not e!95857))))

(assert (=> b!146820 (= res!69834 e!95854)))

(declare-fun c!27677 () Bool)

(assert (=> b!146820 (= c!27677 (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!146821 () Bool)

(declare-fun c!27680 () Bool)

(assert (=> b!146821 (= c!27680 (and (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!146821 (= e!95851 e!95859)))

(declare-fun b!146822 () Bool)

(assert (=> b!146822 (= e!95861 (= (apply!125 lt!77371 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!146823 () Bool)

(assert (=> b!146823 (= e!95851 call!16366)))

(declare-fun b!146824 () Bool)

(assert (=> b!146824 (= e!95857 e!95849)))

(declare-fun c!27679 () Bool)

(assert (=> b!146824 (= c!27679 (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!146825 () Bool)

(declare-fun lt!77365 () Unit!4633)

(assert (=> b!146825 (= e!95858 lt!77365)))

(declare-fun lt!77379 () ListLongMap!1783)

(assert (=> b!146825 (= lt!77379 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77372 () (_ BitVec 64))

(assert (=> b!146825 (= lt!77372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77364 () (_ BitVec 64))

(assert (=> b!146825 (= lt!77364 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355))))

(declare-fun lt!77380 () Unit!4633)

(declare-fun addStillContains!101 (ListLongMap!1783 (_ BitVec 64) V!3627 (_ BitVec 64)) Unit!4633)

(assert (=> b!146825 (= lt!77380 (addStillContains!101 lt!77379 lt!77372 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) lt!77364))))

(assert (=> b!146825 (contains!952 (+!187 lt!77379 (tuple2!2773 lt!77372 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))))) lt!77364)))

(declare-fun lt!77377 () Unit!4633)

(assert (=> b!146825 (= lt!77377 lt!77380)))

(declare-fun lt!77374 () ListLongMap!1783)

(assert (=> b!146825 (= lt!77374 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77381 () (_ BitVec 64))

(assert (=> b!146825 (= lt!77381 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77369 () (_ BitVec 64))

(assert (=> b!146825 (= lt!77369 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355))))

(declare-fun lt!77366 () Unit!4633)

(declare-fun addApplyDifferent!101 (ListLongMap!1783 (_ BitVec 64) V!3627 (_ BitVec 64)) Unit!4633)

(assert (=> b!146825 (= lt!77366 (addApplyDifferent!101 lt!77374 lt!77381 (minValue!2864 (v!3364 (underlying!505 thiss!992))) lt!77369))))

(assert (=> b!146825 (= (apply!125 (+!187 lt!77374 (tuple2!2773 lt!77381 (minValue!2864 (v!3364 (underlying!505 thiss!992))))) lt!77369) (apply!125 lt!77374 lt!77369))))

(declare-fun lt!77375 () Unit!4633)

(assert (=> b!146825 (= lt!77375 lt!77366)))

(declare-fun lt!77361 () ListLongMap!1783)

(assert (=> b!146825 (= lt!77361 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77378 () (_ BitVec 64))

(assert (=> b!146825 (= lt!77378 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77362 () (_ BitVec 64))

(assert (=> b!146825 (= lt!77362 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355))))

(declare-fun lt!77373 () Unit!4633)

(assert (=> b!146825 (= lt!77373 (addApplyDifferent!101 lt!77361 lt!77378 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) lt!77362))))

(assert (=> b!146825 (= (apply!125 (+!187 lt!77361 (tuple2!2773 lt!77378 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))))) lt!77362) (apply!125 lt!77361 lt!77362))))

(declare-fun lt!77376 () Unit!4633)

(assert (=> b!146825 (= lt!77376 lt!77373)))

(declare-fun lt!77363 () ListLongMap!1783)

(assert (=> b!146825 (= lt!77363 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) from!355 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77382 () (_ BitVec 64))

(assert (=> b!146825 (= lt!77382 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77370 () (_ BitVec 64))

(assert (=> b!146825 (= lt!77370 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355))))

(assert (=> b!146825 (= lt!77365 (addApplyDifferent!101 lt!77363 lt!77382 (minValue!2864 (v!3364 (underlying!505 thiss!992))) lt!77370))))

(assert (=> b!146825 (= (apply!125 (+!187 lt!77363 (tuple2!2773 lt!77382 (minValue!2864 (v!3364 (underlying!505 thiss!992))))) lt!77370) (apply!125 lt!77363 lt!77370))))

(declare-fun bm!16361 () Bool)

(assert (=> bm!16361 (= call!16363 (contains!952 lt!77371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!146826 () Bool)

(assert (=> b!146826 (= e!95860 (validKeyInArray!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146827 () Bool)

(assert (=> b!146827 (= e!95855 e!95856)))

(declare-fun res!69832 () Bool)

(assert (=> b!146827 (=> (not res!69832) (not e!95856))))

(assert (=> b!146827 (= res!69832 (contains!952 lt!77371 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (=> b!146827 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun bm!16362 () Bool)

(assert (=> bm!16362 (= call!16366 call!16365)))

(declare-fun b!146828 () Bool)

(declare-fun Unit!4640 () Unit!4633)

(assert (=> b!146828 (= e!95858 Unit!4640)))

(declare-fun b!146829 () Bool)

(assert (=> b!146829 (= e!95854 e!95853)))

(declare-fun res!69831 () Bool)

(assert (=> b!146829 (= res!69831 call!16363)))

(assert (=> b!146829 (=> (not res!69831) (not e!95853))))

(declare-fun bm!16363 () Bool)

(assert (=> bm!16363 (= call!16368 call!16367)))

(declare-fun bm!16364 () Bool)

(assert (=> bm!16364 (= call!16362 (contains!952 lt!77371 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16365 () Bool)

(assert (=> bm!16365 (= call!16365 (+!187 (ite c!27678 call!16364 (ite c!27676 call!16367 call!16368)) (ite (or c!27678 c!27676) (tuple2!2773 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))) (tuple2!2773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))))

(assert (= (and d!46353 c!27678) b!146819))

(assert (= (and d!46353 (not c!27678)) b!146818))

(assert (= (and b!146818 c!27676) b!146823))

(assert (= (and b!146818 (not c!27676)) b!146821))

(assert (= (and b!146821 c!27680) b!146814))

(assert (= (and b!146821 (not c!27680)) b!146810))

(assert (= (or b!146814 b!146810) bm!16363))

(assert (= (or b!146823 bm!16363) bm!16360))

(assert (= (or b!146823 b!146814) bm!16362))

(assert (= (or b!146819 bm!16360) bm!16359))

(assert (= (or b!146819 bm!16362) bm!16365))

(assert (= (and d!46353 res!69839) b!146826))

(assert (= (and d!46353 c!27675) b!146825))

(assert (= (and d!46353 (not c!27675)) b!146828))

(assert (= (and d!46353 res!69836) b!146811))

(assert (= (and b!146811 res!69835) b!146809))

(assert (= (and b!146811 (not res!69837)) b!146827))

(assert (= (and b!146827 res!69832) b!146816))

(assert (= (and b!146811 res!69838) b!146820))

(assert (= (and b!146820 c!27677) b!146829))

(assert (= (and b!146820 (not c!27677)) b!146812))

(assert (= (and b!146829 res!69831) b!146815))

(assert (= (or b!146829 b!146812) bm!16361))

(assert (= (and b!146820 res!69834) b!146824))

(assert (= (and b!146824 c!27679) b!146813))

(assert (= (and b!146824 (not c!27679)) b!146817))

(assert (= (and b!146813 res!69833) b!146822))

(assert (= (or b!146813 b!146817) bm!16364))

(declare-fun b_lambda!6571 () Bool)

(assert (=> (not b_lambda!6571) (not b!146816)))

(assert (=> b!146816 t!6501))

(declare-fun b_and!9215 () Bool)

(assert (= b_and!9211 (and (=> t!6501 result!4377) b_and!9215)))

(assert (=> b!146816 t!6503))

(declare-fun b_and!9217 () Bool)

(assert (= b_and!9213 (and (=> t!6503 result!4381) b_and!9217)))

(declare-fun m!176653 () Bool)

(assert (=> bm!16364 m!176653))

(declare-fun m!176655 () Bool)

(assert (=> b!146819 m!176655))

(declare-fun m!176657 () Bool)

(assert (=> b!146822 m!176657))

(assert (=> b!146816 m!176403))

(declare-fun m!176659 () Bool)

(assert (=> b!146816 m!176659))

(assert (=> b!146816 m!176403))

(assert (=> b!146816 m!176415))

(assert (=> b!146816 m!176415))

(assert (=> b!146816 m!176417))

(assert (=> b!146816 m!176419))

(assert (=> b!146816 m!176417))

(declare-fun m!176661 () Bool)

(assert (=> b!146825 m!176661))

(declare-fun m!176663 () Bool)

(assert (=> b!146825 m!176663))

(declare-fun m!176665 () Bool)

(assert (=> b!146825 m!176665))

(assert (=> b!146825 m!176665))

(declare-fun m!176667 () Bool)

(assert (=> b!146825 m!176667))

(declare-fun m!176669 () Bool)

(assert (=> b!146825 m!176669))

(declare-fun m!176671 () Bool)

(assert (=> b!146825 m!176671))

(declare-fun m!176673 () Bool)

(assert (=> b!146825 m!176673))

(assert (=> b!146825 m!176671))

(declare-fun m!176675 () Bool)

(assert (=> b!146825 m!176675))

(assert (=> b!146825 m!176403))

(declare-fun m!176677 () Bool)

(assert (=> b!146825 m!176677))

(declare-fun m!176679 () Bool)

(assert (=> b!146825 m!176679))

(declare-fun m!176681 () Bool)

(assert (=> b!146825 m!176681))

(declare-fun m!176683 () Bool)

(assert (=> b!146825 m!176683))

(assert (=> b!146825 m!176683))

(declare-fun m!176685 () Bool)

(assert (=> b!146825 m!176685))

(declare-fun m!176687 () Bool)

(assert (=> b!146825 m!176687))

(declare-fun m!176689 () Bool)

(assert (=> b!146825 m!176689))

(assert (=> b!146825 m!176689))

(declare-fun m!176691 () Bool)

(assert (=> b!146825 m!176691))

(declare-fun m!176693 () Bool)

(assert (=> b!146815 m!176693))

(assert (=> bm!16359 m!176687))

(assert (=> b!146826 m!176403))

(assert (=> b!146826 m!176403))

(declare-fun m!176695 () Bool)

(assert (=> b!146826 m!176695))

(declare-fun m!176697 () Bool)

(assert (=> bm!16361 m!176697))

(assert (=> b!146827 m!176403))

(assert (=> b!146827 m!176403))

(declare-fun m!176699 () Bool)

(assert (=> b!146827 m!176699))

(assert (=> d!46353 m!176619))

(assert (=> b!146809 m!176403))

(assert (=> b!146809 m!176403))

(assert (=> b!146809 m!176695))

(declare-fun m!176701 () Bool)

(assert (=> bm!16365 m!176701))

(assert (=> b!146620 d!46353))

(declare-fun d!46355 () Bool)

(assert (=> d!46355 (= (map!1475 (_2!1396 lt!77190)) (getCurrentListMap!576 (_keys!4788 (_2!1396 lt!77190)) (_values!3002 (_2!1396 lt!77190)) (mask!7399 (_2!1396 lt!77190)) (extraKeys!2764 (_2!1396 lt!77190)) (zeroValue!2864 (_2!1396 lt!77190)) (minValue!2864 (_2!1396 lt!77190)) #b00000000000000000000000000000000 (defaultEntry!3019 (_2!1396 lt!77190))))))

(declare-fun bs!6146 () Bool)

(assert (= bs!6146 d!46355))

(declare-fun m!176703 () Bool)

(assert (=> bs!6146 m!176703))

(assert (=> b!146620 d!46355))

(declare-fun d!46357 () Bool)

(declare-fun e!95862 () Bool)

(assert (=> d!46357 e!95862))

(declare-fun res!69840 () Bool)

(assert (=> d!46357 (=> (not res!69840) (not e!95862))))

(declare-fun lt!77385 () ListLongMap!1783)

(assert (=> d!46357 (= res!69840 (contains!952 lt!77385 (_1!1397 lt!77204)))))

(declare-fun lt!77383 () List!1784)

(assert (=> d!46357 (= lt!77385 (ListLongMap!1784 lt!77383))))

(declare-fun lt!77386 () Unit!4633)

(declare-fun lt!77384 () Unit!4633)

(assert (=> d!46357 (= lt!77386 lt!77384)))

(assert (=> d!46357 (= (getValueByKey!181 lt!77383 (_1!1397 lt!77204)) (Some!186 (_2!1397 lt!77204)))))

(assert (=> d!46357 (= lt!77384 (lemmaContainsTupThenGetReturnValue!94 lt!77383 (_1!1397 lt!77204) (_2!1397 lt!77204)))))

(assert (=> d!46357 (= lt!77383 (insertStrictlySorted!97 (toList!907 lt!77202) (_1!1397 lt!77204) (_2!1397 lt!77204)))))

(assert (=> d!46357 (= (+!187 lt!77202 lt!77204) lt!77385)))

(declare-fun b!146830 () Bool)

(declare-fun res!69841 () Bool)

(assert (=> b!146830 (=> (not res!69841) (not e!95862))))

(assert (=> b!146830 (= res!69841 (= (getValueByKey!181 (toList!907 lt!77385) (_1!1397 lt!77204)) (Some!186 (_2!1397 lt!77204))))))

(declare-fun b!146831 () Bool)

(assert (=> b!146831 (= e!95862 (contains!954 (toList!907 lt!77385) lt!77204))))

(assert (= (and d!46357 res!69840) b!146830))

(assert (= (and b!146830 res!69841) b!146831))

(declare-fun m!176705 () Bool)

(assert (=> d!46357 m!176705))

(declare-fun m!176707 () Bool)

(assert (=> d!46357 m!176707))

(declare-fun m!176709 () Bool)

(assert (=> d!46357 m!176709))

(declare-fun m!176711 () Bool)

(assert (=> d!46357 m!176711))

(declare-fun m!176713 () Bool)

(assert (=> b!146830 m!176713))

(declare-fun m!176715 () Bool)

(assert (=> b!146831 m!176715))

(assert (=> b!146620 d!46357))

(declare-fun d!46359 () Bool)

(assert (=> d!46359 (= (+!187 (+!187 lt!77202 (tuple2!2773 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191)) (tuple2!2773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992))))) (+!187 (+!187 lt!77202 (tuple2!2773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992))))) (tuple2!2773 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191)))))

(declare-fun lt!77387 () Unit!4633)

(assert (=> d!46359 (= lt!77387 (choose!900 lt!77202 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> d!46359 (not (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46359 (= (addCommutativeForDiffKeys!80 lt!77202 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992)))) lt!77387)))

(declare-fun bs!6147 () Bool)

(assert (= bs!6147 d!46359))

(declare-fun m!176717 () Bool)

(assert (=> bs!6147 m!176717))

(assert (=> bs!6147 m!176403))

(declare-fun m!176719 () Bool)

(assert (=> bs!6147 m!176719))

(declare-fun m!176721 () Bool)

(assert (=> bs!6147 m!176721))

(assert (=> bs!6147 m!176721))

(declare-fun m!176723 () Bool)

(assert (=> bs!6147 m!176723))

(assert (=> bs!6147 m!176717))

(declare-fun m!176725 () Bool)

(assert (=> bs!6147 m!176725))

(assert (=> b!146620 d!46359))

(declare-fun d!46361 () Bool)

(declare-fun e!95863 () Bool)

(assert (=> d!46361 e!95863))

(declare-fun res!69842 () Bool)

(assert (=> d!46361 (=> (not res!69842) (not e!95863))))

(declare-fun lt!77390 () ListLongMap!1783)

(assert (=> d!46361 (= res!69842 (contains!952 lt!77390 (_1!1397 lt!77196)))))

(declare-fun lt!77388 () List!1784)

(assert (=> d!46361 (= lt!77390 (ListLongMap!1784 lt!77388))))

(declare-fun lt!77391 () Unit!4633)

(declare-fun lt!77389 () Unit!4633)

(assert (=> d!46361 (= lt!77391 lt!77389)))

(assert (=> d!46361 (= (getValueByKey!181 lt!77388 (_1!1397 lt!77196)) (Some!186 (_2!1397 lt!77196)))))

(assert (=> d!46361 (= lt!77389 (lemmaContainsTupThenGetReturnValue!94 lt!77388 (_1!1397 lt!77196) (_2!1397 lt!77196)))))

(assert (=> d!46361 (= lt!77388 (insertStrictlySorted!97 (toList!907 lt!77199) (_1!1397 lt!77196) (_2!1397 lt!77196)))))

(assert (=> d!46361 (= (+!187 lt!77199 lt!77196) lt!77390)))

(declare-fun b!146832 () Bool)

(declare-fun res!69843 () Bool)

(assert (=> b!146832 (=> (not res!69843) (not e!95863))))

(assert (=> b!146832 (= res!69843 (= (getValueByKey!181 (toList!907 lt!77390) (_1!1397 lt!77196)) (Some!186 (_2!1397 lt!77196))))))

(declare-fun b!146833 () Bool)

(assert (=> b!146833 (= e!95863 (contains!954 (toList!907 lt!77390) lt!77196))))

(assert (= (and d!46361 res!69842) b!146832))

(assert (= (and b!146832 res!69843) b!146833))

(declare-fun m!176727 () Bool)

(assert (=> d!46361 m!176727))

(declare-fun m!176729 () Bool)

(assert (=> d!46361 m!176729))

(declare-fun m!176731 () Bool)

(assert (=> d!46361 m!176731))

(declare-fun m!176733 () Bool)

(assert (=> d!46361 m!176733))

(declare-fun m!176735 () Bool)

(assert (=> b!146832 m!176735))

(declare-fun m!176737 () Bool)

(assert (=> b!146833 m!176737))

(assert (=> b!146620 d!46361))

(declare-fun d!46363 () Bool)

(assert (=> d!46363 (not (arrayContainsKey!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77394 () Unit!4633)

(declare-fun choose!68 (array!5015 (_ BitVec 32) (_ BitVec 64) List!1783) Unit!4633)

(assert (=> d!46363 (= lt!77394 (choose!68 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (Cons!1779 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) Nil!1780)))))

(assert (=> d!46363 (bvslt (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46363 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (Cons!1779 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) Nil!1780)) lt!77394)))

(declare-fun bs!6148 () Bool)

(assert (= bs!6148 d!46363))

(assert (=> bs!6148 m!176403))

(assert (=> bs!6148 m!176437))

(assert (=> bs!6148 m!176403))

(declare-fun m!176739 () Bool)

(assert (=> bs!6148 m!176739))

(assert (=> b!146611 d!46363))

(declare-fun d!46365 () Bool)

(assert (=> d!46365 (arrayNoDuplicates!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) from!355 Nil!1780)))

(declare-fun lt!77397 () Unit!4633)

(declare-fun choose!39 (array!5015 (_ BitVec 32) (_ BitVec 32)) Unit!4633)

(assert (=> d!46365 (= lt!77397 (choose!39 (_keys!4788 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!46365 (bvslt (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46365 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 from!355) lt!77397)))

(declare-fun bs!6149 () Bool)

(assert (= bs!6149 d!46365))

(assert (=> bs!6149 m!176433))

(declare-fun m!176741 () Bool)

(assert (=> bs!6149 m!176741))

(assert (=> b!146611 d!46365))

(declare-fun d!46367 () Bool)

(declare-fun res!69848 () Bool)

(declare-fun e!95868 () Bool)

(assert (=> d!46367 (=> res!69848 e!95868)))

(assert (=> d!46367 (= res!69848 (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (=> d!46367 (= (arrayContainsKey!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!95868)))

(declare-fun b!146838 () Bool)

(declare-fun e!95869 () Bool)

(assert (=> b!146838 (= e!95868 e!95869)))

(declare-fun res!69849 () Bool)

(assert (=> b!146838 (=> (not res!69849) (not e!95869))))

(assert (=> b!146838 (= res!69849 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!146839 () Bool)

(assert (=> b!146839 (= e!95869 (arrayContainsKey!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!46367 (not res!69848)) b!146838))

(assert (= (and b!146838 res!69849) b!146839))

(assert (=> d!46367 m!176599))

(assert (=> b!146839 m!176403))

(declare-fun m!176743 () Bool)

(assert (=> b!146839 m!176743))

(assert (=> b!146611 d!46367))

(declare-fun d!46369 () Bool)

(declare-fun e!95872 () Bool)

(assert (=> d!46369 e!95872))

(declare-fun c!27683 () Bool)

(assert (=> d!46369 (= c!27683 (and (not (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77400 () Unit!4633)

(declare-fun choose!901 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 (_ BitVec 64) (_ BitVec 32) Int) Unit!4633)

(assert (=> d!46369 (= lt!77400 (choose!901 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> d!46369 (validMask!0 (mask!7399 (v!3364 (underlying!505 thiss!992))))))

(assert (=> d!46369 (= (lemmaListMapContainsThenArrayContainsFrom!156 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))) lt!77400)))

(declare-fun b!146844 () Bool)

(assert (=> b!146844 (= e!95872 (arrayContainsKey!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!146845 () Bool)

(assert (=> b!146845 (= e!95872 (ite (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46369 c!27683) b!146844))

(assert (= (and d!46369 (not c!27683)) b!146845))

(assert (=> d!46369 m!176403))

(declare-fun m!176745 () Bool)

(assert (=> d!46369 m!176745))

(assert (=> d!46369 m!176619))

(assert (=> b!146844 m!176403))

(assert (=> b!146844 m!176437))

(assert (=> b!146611 d!46369))

(declare-fun d!46371 () Bool)

(declare-fun res!69857 () Bool)

(declare-fun e!95883 () Bool)

(assert (=> d!46371 (=> res!69857 e!95883)))

(assert (=> d!46371 (= res!69857 (bvsge from!355 (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> d!46371 (= (arrayNoDuplicates!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) from!355 Nil!1780) e!95883)))

(declare-fun b!146856 () Bool)

(declare-fun e!95881 () Bool)

(assert (=> b!146856 (= e!95883 e!95881)))

(declare-fun res!69856 () Bool)

(assert (=> b!146856 (=> (not res!69856) (not e!95881))))

(declare-fun e!95884 () Bool)

(assert (=> b!146856 (= res!69856 (not e!95884))))

(declare-fun res!69858 () Bool)

(assert (=> b!146856 (=> (not res!69858) (not e!95884))))

(assert (=> b!146856 (= res!69858 (validKeyInArray!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146857 () Bool)

(declare-fun e!95882 () Bool)

(assert (=> b!146857 (= e!95881 e!95882)))

(declare-fun c!27686 () Bool)

(assert (=> b!146857 (= c!27686 (validKeyInArray!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun bm!16368 () Bool)

(declare-fun call!16371 () Bool)

(assert (=> bm!16368 (= call!16371 (arrayNoDuplicates!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27686 (Cons!1779 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) Nil!1780) Nil!1780)))))

(declare-fun b!146858 () Bool)

(declare-fun contains!955 (List!1783 (_ BitVec 64)) Bool)

(assert (=> b!146858 (= e!95884 (contains!955 Nil!1780 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146859 () Bool)

(assert (=> b!146859 (= e!95882 call!16371)))

(declare-fun b!146860 () Bool)

(assert (=> b!146860 (= e!95882 call!16371)))

(assert (= (and d!46371 (not res!69857)) b!146856))

(assert (= (and b!146856 res!69858) b!146858))

(assert (= (and b!146856 res!69856) b!146857))

(assert (= (and b!146857 c!27686) b!146859))

(assert (= (and b!146857 (not c!27686)) b!146860))

(assert (= (or b!146859 b!146860) bm!16368))

(assert (=> b!146856 m!176403))

(assert (=> b!146856 m!176403))

(assert (=> b!146856 m!176695))

(assert (=> b!146857 m!176403))

(assert (=> b!146857 m!176403))

(assert (=> b!146857 m!176695))

(assert (=> bm!16368 m!176403))

(declare-fun m!176747 () Bool)

(assert (=> bm!16368 m!176747))

(assert (=> b!146858 m!176403))

(assert (=> b!146858 m!176403))

(declare-fun m!176749 () Bool)

(assert (=> b!146858 m!176749))

(assert (=> b!146611 d!46371))

(declare-fun d!46373 () Bool)

(declare-fun e!95889 () Bool)

(assert (=> d!46373 e!95889))

(declare-fun res!69861 () Bool)

(assert (=> d!46373 (=> res!69861 e!95889)))

(declare-fun lt!77412 () Bool)

(assert (=> d!46373 (= res!69861 (not lt!77412))))

(declare-fun lt!77409 () Bool)

(assert (=> d!46373 (= lt!77412 lt!77409)))

(declare-fun lt!77411 () Unit!4633)

(declare-fun e!95890 () Unit!4633)

(assert (=> d!46373 (= lt!77411 e!95890)))

(declare-fun c!27689 () Bool)

(assert (=> d!46373 (= c!27689 lt!77409)))

(declare-fun containsKey!185 (List!1784 (_ BitVec 64)) Bool)

(assert (=> d!46373 (= lt!77409 (containsKey!185 (toList!907 lt!77203) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (=> d!46373 (= (contains!952 lt!77203 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)) lt!77412)))

(declare-fun b!146867 () Bool)

(declare-fun lt!77410 () Unit!4633)

(assert (=> b!146867 (= e!95890 lt!77410)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!133 (List!1784 (_ BitVec 64)) Unit!4633)

(assert (=> b!146867 (= lt!77410 (lemmaContainsKeyImpliesGetValueByKeyDefined!133 (toList!907 lt!77203) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun isDefined!134 (Option!187) Bool)

(assert (=> b!146867 (isDefined!134 (getValueByKey!181 (toList!907 lt!77203) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146868 () Bool)

(declare-fun Unit!4641 () Unit!4633)

(assert (=> b!146868 (= e!95890 Unit!4641)))

(declare-fun b!146869 () Bool)

(assert (=> b!146869 (= e!95889 (isDefined!134 (getValueByKey!181 (toList!907 lt!77203) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355))))))

(assert (= (and d!46373 c!27689) b!146867))

(assert (= (and d!46373 (not c!27689)) b!146868))

(assert (= (and d!46373 (not res!69861)) b!146869))

(assert (=> d!46373 m!176403))

(declare-fun m!176751 () Bool)

(assert (=> d!46373 m!176751))

(assert (=> b!146867 m!176403))

(declare-fun m!176753 () Bool)

(assert (=> b!146867 m!176753))

(assert (=> b!146867 m!176403))

(declare-fun m!176755 () Bool)

(assert (=> b!146867 m!176755))

(assert (=> b!146867 m!176755))

(declare-fun m!176757 () Bool)

(assert (=> b!146867 m!176757))

(assert (=> b!146869 m!176403))

(assert (=> b!146869 m!176755))

(assert (=> b!146869 m!176755))

(assert (=> b!146869 m!176757))

(assert (=> b!146630 d!46373))

(declare-fun bm!16417 () Bool)

(declare-fun call!16435 () ListLongMap!1783)

(declare-fun call!16427 () ListLongMap!1783)

(assert (=> bm!16417 (= call!16435 call!16427)))

(declare-fun b!146950 () Bool)

(declare-fun e!95943 () Unit!4633)

(declare-fun lt!77490 () Unit!4633)

(assert (=> b!146950 (= e!95943 lt!77490)))

(declare-fun call!16433 () Unit!4633)

(assert (=> b!146950 (= lt!77490 call!16433)))

(declare-datatypes ((SeekEntryResult!284 0))(
  ( (MissingZero!284 (index!3303 (_ BitVec 32))) (Found!284 (index!3304 (_ BitVec 32))) (Intermediate!284 (undefined!1096 Bool) (index!3305 (_ BitVec 32)) (x!16710 (_ BitVec 32))) (Undefined!284) (MissingVacant!284 (index!3306 (_ BitVec 32))) )
))
(declare-fun lt!77473 () SeekEntryResult!284)

(declare-fun call!16441 () SeekEntryResult!284)

(assert (=> b!146950 (= lt!77473 call!16441)))

(declare-fun res!69890 () Bool)

(assert (=> b!146950 (= res!69890 ((_ is Found!284) lt!77473))))

(declare-fun e!95940 () Bool)

(assert (=> b!146950 (=> (not res!69890) (not e!95940))))

(assert (=> b!146950 e!95940))

(declare-fun b!146951 () Bool)

(declare-fun e!95939 () Bool)

(declare-fun call!16437 () Bool)

(assert (=> b!146951 (= e!95939 (not call!16437))))

(declare-fun bm!16418 () Bool)

(declare-fun call!16428 () Bool)

(assert (=> bm!16418 (= call!16437 call!16428)))

(declare-fun bm!16419 () Bool)

(declare-fun call!16434 () ListLongMap!1783)

(declare-fun lt!77468 () tuple2!2770)

(assert (=> bm!16419 (= call!16434 (map!1475 (_2!1396 lt!77468)))))

(declare-fun call!16443 () ListLongMap!1783)

(declare-fun call!16439 () ListLongMap!1783)

(declare-fun c!27725 () Bool)

(declare-fun c!27719 () Bool)

(declare-fun bm!16420 () Bool)

(assert (=> bm!16420 (= call!16439 (+!187 (ite c!27725 call!16435 call!16443) (ite c!27725 (ite c!27719 (tuple2!2773 #b0000000000000000000000000000000000000000000000000000000000000000 lt!77191) (tuple2!2773 #b1000000000000000000000000000000000000000000000000000000000000000 lt!77191)) (tuple2!2773 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191))))))

(declare-fun b!146952 () Bool)

(declare-fun e!95941 () Bool)

(declare-fun lt!77489 () SeekEntryResult!284)

(assert (=> b!146952 (= e!95941 ((_ is Undefined!284) lt!77489))))

(declare-fun bm!16421 () Bool)

(declare-fun call!16421 () Bool)

(assert (=> bm!16421 (= call!16421 call!16428)))

(declare-fun b!146953 () Bool)

(declare-fun e!95949 () ListLongMap!1783)

(declare-fun call!16438 () ListLongMap!1783)

(assert (=> b!146953 (= e!95949 call!16438)))

(declare-fun b!146954 () Bool)

(declare-fun e!95936 () Unit!4633)

(declare-fun lt!77467 () Unit!4633)

(assert (=> b!146954 (= e!95936 lt!77467)))

(declare-fun call!16442 () Unit!4633)

(assert (=> b!146954 (= lt!77467 call!16442)))

(declare-fun call!16420 () SeekEntryResult!284)

(assert (=> b!146954 (= lt!77489 call!16420)))

(declare-fun c!27723 () Bool)

(assert (=> b!146954 (= c!27723 ((_ is MissingZero!284) lt!77489))))

(declare-fun e!95948 () Bool)

(assert (=> b!146954 e!95948))

(declare-fun b!146955 () Bool)

(declare-fun res!69892 () Bool)

(declare-fun e!95933 () Bool)

(assert (=> b!146955 (=> (not res!69892) (not e!95933))))

(declare-fun lt!77471 () SeekEntryResult!284)

(assert (=> b!146955 (= res!69892 (= (select (arr!2369 (_keys!4788 newMap!16)) (index!3303 lt!77471)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!146956 () Bool)

(declare-fun e!95944 () Bool)

(declare-fun e!95953 () Bool)

(assert (=> b!146956 (= e!95944 e!95953)))

(declare-fun res!69895 () Bool)

(assert (=> b!146956 (= res!69895 (contains!952 call!16434 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(assert (=> b!146956 (=> (not res!69895) (not e!95953))))

(declare-fun b!146957 () Bool)

(declare-fun Unit!4642 () Unit!4633)

(assert (=> b!146957 (= e!95943 Unit!4642)))

(declare-fun lt!77488 () Unit!4633)

(assert (=> b!146957 (= lt!77488 call!16442)))

(assert (=> b!146957 (= lt!77471 call!16441)))

(declare-fun c!27728 () Bool)

(assert (=> b!146957 (= c!27728 ((_ is MissingZero!284) lt!77471))))

(declare-fun e!95947 () Bool)

(assert (=> b!146957 e!95947))

(declare-fun lt!77475 () Unit!4633)

(assert (=> b!146957 (= lt!77475 lt!77488)))

(assert (=> b!146957 false))

(declare-fun bm!16422 () Bool)

(assert (=> bm!16422 (= call!16438 call!16427)))

(declare-fun b!146958 () Bool)

(declare-fun e!95945 () Bool)

(assert (=> b!146958 (= e!95945 (not call!16437))))

(declare-fun b!146959 () Bool)

(declare-fun e!95942 () Bool)

(declare-fun e!95935 () Bool)

(assert (=> b!146959 (= e!95942 e!95935)))

(declare-fun res!69903 () Bool)

(declare-fun call!16430 () Bool)

(assert (=> b!146959 (= res!69903 call!16430)))

(assert (=> b!146959 (=> (not res!69903) (not e!95935))))

(declare-fun b!146960 () Bool)

(declare-fun res!69902 () Bool)

(assert (=> b!146960 (=> (not res!69902) (not e!95933))))

(assert (=> b!146960 (= res!69902 call!16430)))

(assert (=> b!146960 (= e!95947 e!95933)))

(declare-fun b!146961 () Bool)

(declare-fun lt!77477 () Unit!4633)

(declare-fun lt!77481 () Unit!4633)

(assert (=> b!146961 (= lt!77477 lt!77481)))

(declare-fun call!16432 () ListLongMap!1783)

(declare-fun call!16424 () ListLongMap!1783)

(assert (=> b!146961 (= call!16432 call!16424)))

(declare-fun lt!77474 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!70 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 V!3627 Int) Unit!4633)

(assert (=> b!146961 (= lt!77481 (lemmaChangeLongMinValueKeyThenAddPairToListMap!70 (_keys!4788 newMap!16) (_values!3002 newMap!16) (mask!7399 newMap!16) (extraKeys!2764 newMap!16) lt!77474 (zeroValue!2864 newMap!16) (minValue!2864 newMap!16) lt!77191 (defaultEntry!3019 newMap!16)))))

(assert (=> b!146961 (= lt!77474 (bvor (extraKeys!2764 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!95952 () tuple2!2770)

(assert (=> b!146961 (= e!95952 (tuple2!2771 true (LongMapFixedSize!1207 (defaultEntry!3019 newMap!16) (mask!7399 newMap!16) (bvor (extraKeys!2764 newMap!16) #b00000000000000000000000000000010) (zeroValue!2864 newMap!16) lt!77191 (_size!652 newMap!16) (_keys!4788 newMap!16) (_values!3002 newMap!16) (_vacant!652 newMap!16))))))

(declare-fun b!146962 () Bool)

(declare-fun res!69900 () Bool)

(declare-fun call!16429 () Bool)

(assert (=> b!146962 (= res!69900 call!16429)))

(assert (=> b!146962 (=> (not res!69900) (not e!95940))))

(declare-fun bm!16423 () Bool)

(declare-fun call!16431 () tuple2!2770)

(declare-fun c!27726 () Bool)

(declare-fun lt!77480 () SeekEntryResult!284)

(declare-fun updateHelperNewKey!70 (LongMapFixedSize!1206 (_ BitVec 64) V!3627 (_ BitVec 32)) tuple2!2770)

(assert (=> bm!16423 (= call!16431 (updateHelperNewKey!70 newMap!16 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191 (ite c!27726 (index!3306 lt!77480) (index!3303 lt!77480))))))

(declare-fun b!146963 () Bool)

(assert (=> b!146963 (= e!95933 (not call!16421))))

(declare-fun b!146964 () Bool)

(declare-fun c!27721 () Bool)

(assert (=> b!146964 (= c!27721 ((_ is MissingVacant!284) lt!77489))))

(assert (=> b!146964 (= e!95948 e!95941)))

(declare-fun b!146965 () Bool)

(declare-fun res!69894 () Bool)

(assert (=> b!146965 (=> (not res!69894) (not e!95945))))

(assert (=> b!146965 (= res!69894 (= (select (arr!2369 (_keys!4788 newMap!16)) (index!3303 lt!77489)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!146966 () Bool)

(declare-fun res!69898 () Bool)

(assert (=> b!146966 (= res!69898 (= (select (arr!2369 (_keys!4788 newMap!16)) (index!3306 lt!77489)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!146966 (=> (not res!69898) (not e!95939))))

(declare-fun b!146967 () Bool)

(declare-fun e!95937 () tuple2!2770)

(assert (=> b!146967 (= e!95937 e!95952)))

(assert (=> b!146967 (= c!27719 (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!146968 () Bool)

(assert (=> b!146968 (= e!95935 (not call!16421))))

(declare-fun b!146969 () Bool)

(declare-fun lt!77472 () tuple2!2770)

(assert (=> b!146969 (= lt!77472 call!16431)))

(declare-fun e!95951 () tuple2!2770)

(assert (=> b!146969 (= e!95951 (tuple2!2771 (_1!1396 lt!77472) (_2!1396 lt!77472)))))

(declare-fun bm!16424 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!70 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 (_ BitVec 64) Int) Unit!4633)

(assert (=> bm!16424 (= call!16433 (lemmaInListMapThenSeekEntryOrOpenFindsIt!70 (_keys!4788 newMap!16) (_values!3002 newMap!16) (mask!7399 newMap!16) (extraKeys!2764 newMap!16) (zeroValue!2864 newMap!16) (minValue!2864 newMap!16) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (defaultEntry!3019 newMap!16)))))

(declare-fun b!146970 () Bool)

(declare-fun e!95950 () tuple2!2770)

(assert (=> b!146970 (= e!95950 e!95951)))

(declare-fun c!27717 () Bool)

(assert (=> b!146970 (= c!27717 ((_ is MissingZero!284) lt!77480))))

(declare-fun b!146971 () Bool)

(declare-fun res!69897 () Bool)

(assert (=> b!146971 (=> (not res!69897) (not e!95945))))

(declare-fun call!16436 () Bool)

(assert (=> b!146971 (= res!69897 call!16436)))

(assert (=> b!146971 (= e!95948 e!95945)))

(declare-fun call!16423 () SeekEntryResult!284)

(declare-fun bm!16425 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5015 (_ BitVec 32)) SeekEntryResult!284)

(assert (=> bm!16425 (= call!16423 (seekEntryOrOpen!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (_keys!4788 newMap!16) (mask!7399 newMap!16)))))

(declare-fun d!46375 () Bool)

(declare-fun e!95934 () Bool)

(assert (=> d!46375 e!95934))

(declare-fun res!69899 () Bool)

(assert (=> d!46375 (=> (not res!69899) (not e!95934))))

(assert (=> d!46375 (= res!69899 (valid!588 (_2!1396 lt!77468)))))

(assert (=> d!46375 (= lt!77468 e!95937)))

(assert (=> d!46375 (= c!27725 (= (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (bvneg (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355))))))

(assert (=> d!46375 (valid!588 newMap!16)))

(assert (=> d!46375 (= (update!227 newMap!16 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191) lt!77468)))

(declare-fun bm!16426 () Bool)

(declare-fun call!16425 () Bool)

(declare-fun call!16440 () Bool)

(assert (=> bm!16426 (= call!16425 call!16440)))

(declare-fun bm!16427 () Bool)

(declare-fun c!27718 () Bool)

(assert (=> bm!16427 (= call!16427 (getCurrentListMap!576 (_keys!4788 newMap!16) (ite (or c!27725 c!27718) (_values!3002 newMap!16) (array!5018 (store (arr!2370 (_values!3002 newMap!16)) (index!3304 lt!77480) (ValueCellFull!1149 lt!77191)) (size!2646 (_values!3002 newMap!16)))) (mask!7399 newMap!16) (extraKeys!2764 newMap!16) (zeroValue!2864 newMap!16) (minValue!2864 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3019 newMap!16)))))

(declare-fun bm!16428 () Bool)

(assert (=> bm!16428 (= call!16429 call!16440)))

(declare-fun b!146972 () Bool)

(declare-fun c!27722 () Bool)

(assert (=> b!146972 (= c!27722 ((_ is MissingVacant!284) lt!77471))))

(assert (=> b!146972 (= e!95947 e!95942)))

(declare-fun bm!16429 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!70 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 (_ BitVec 64) Int) Unit!4633)

(assert (=> bm!16429 (= call!16442 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!70 (_keys!4788 newMap!16) (_values!3002 newMap!16) (mask!7399 newMap!16) (extraKeys!2764 newMap!16) (zeroValue!2864 newMap!16) (minValue!2864 newMap!16) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (defaultEntry!3019 newMap!16)))))

(declare-fun b!146973 () Bool)

(declare-fun call!16422 () ListLongMap!1783)

(assert (=> b!146973 (= e!95953 (= call!16434 (+!187 call!16422 (tuple2!2773 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191))))))

(declare-fun b!146974 () Bool)

(assert (=> b!146974 (= e!95944 (= call!16434 call!16422))))

(declare-fun b!146975 () Bool)

(declare-fun lt!77483 () Unit!4633)

(assert (=> b!146975 (= lt!77483 e!95936)))

(declare-fun c!27720 () Bool)

(declare-fun call!16426 () Bool)

(assert (=> b!146975 (= c!27720 call!16426)))

(declare-fun e!95938 () tuple2!2770)

(assert (=> b!146975 (= e!95938 (tuple2!2771 false newMap!16))))

(declare-fun lt!77485 () SeekEntryResult!284)

(declare-fun bm!16430 () Bool)

(declare-fun c!27724 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16430 (= call!16440 (inRange!0 (ite c!27718 (ite c!27720 (index!3304 lt!77485) (ite c!27723 (index!3303 lt!77489) (index!3306 lt!77489))) (ite c!27724 (index!3304 lt!77473) (ite c!27728 (index!3303 lt!77471) (index!3306 lt!77471)))) (mask!7399 newMap!16)))))

(declare-fun b!146976 () Bool)

(declare-fun res!69893 () Bool)

(assert (=> b!146976 (= res!69893 (= (select (arr!2369 (_keys!4788 newMap!16)) (index!3306 lt!77471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!146976 (=> (not res!69893) (not e!95935))))

(declare-fun b!146977 () Bool)

(assert (=> b!146977 (= e!95934 e!95944)))

(declare-fun c!27727 () Bool)

(assert (=> b!146977 (= c!27727 (_1!1396 lt!77468))))

(declare-fun b!146978 () Bool)

(assert (=> b!146978 (= e!95949 call!16443)))

(declare-fun bm!16431 () Bool)

(assert (=> bm!16431 (= call!16436 call!16425)))

(declare-fun bm!16432 () Bool)

(declare-fun c!27716 () Bool)

(assert (=> bm!16432 (= c!27716 c!27718)))

(assert (=> bm!16432 (= call!16426 (contains!952 e!95949 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146979 () Bool)

(assert (=> b!146979 (= e!95940 (= (select (arr!2369 (_keys!4788 newMap!16)) (index!3304 lt!77473)) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun bm!16433 () Bool)

(assert (=> bm!16433 (= call!16420 call!16423)))

(declare-fun bm!16434 () Bool)

(assert (=> bm!16434 (= call!16441 call!16423)))

(declare-fun bm!16435 () Bool)

(assert (=> bm!16435 (= call!16430 call!16429)))

(declare-fun b!146980 () Bool)

(declare-fun lt!77492 () Unit!4633)

(declare-fun lt!77482 () Unit!4633)

(assert (=> b!146980 (= lt!77492 lt!77482)))

(declare-fun lt!77491 () array!5017)

(assert (=> b!146980 (contains!952 (getCurrentListMap!576 (_keys!4788 newMap!16) lt!77491 (mask!7399 newMap!16) (extraKeys!2764 newMap!16) (zeroValue!2864 newMap!16) (minValue!2864 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3019 newMap!16)) (select (arr!2369 (_keys!4788 newMap!16)) (index!3304 lt!77480)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!131 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 (_ BitVec 32) Int) Unit!4633)

(assert (=> b!146980 (= lt!77482 (lemmaValidKeyInArrayIsInListMap!131 (_keys!4788 newMap!16) lt!77491 (mask!7399 newMap!16) (extraKeys!2764 newMap!16) (zeroValue!2864 newMap!16) (minValue!2864 newMap!16) (index!3304 lt!77480) (defaultEntry!3019 newMap!16)))))

(assert (=> b!146980 (= lt!77491 (array!5018 (store (arr!2370 (_values!3002 newMap!16)) (index!3304 lt!77480) (ValueCellFull!1149 lt!77191)) (size!2646 (_values!3002 newMap!16))))))

(declare-fun lt!77493 () Unit!4633)

(declare-fun lt!77484 () Unit!4633)

(assert (=> b!146980 (= lt!77493 lt!77484)))

(assert (=> b!146980 (= call!16439 call!16438)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!70 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 (_ BitVec 32) (_ BitVec 64) V!3627 Int) Unit!4633)

(assert (=> b!146980 (= lt!77484 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!70 (_keys!4788 newMap!16) (_values!3002 newMap!16) (mask!7399 newMap!16) (extraKeys!2764 newMap!16) (zeroValue!2864 newMap!16) (minValue!2864 newMap!16) (index!3304 lt!77480) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) lt!77191 (defaultEntry!3019 newMap!16)))))

(declare-fun lt!77487 () Unit!4633)

(assert (=> b!146980 (= lt!77487 e!95943)))

(assert (=> b!146980 (= c!27724 call!16426)))

(assert (=> b!146980 (= e!95951 (tuple2!2771 true (LongMapFixedSize!1207 (defaultEntry!3019 newMap!16) (mask!7399 newMap!16) (extraKeys!2764 newMap!16) (zeroValue!2864 newMap!16) (minValue!2864 newMap!16) (_size!652 newMap!16) (_keys!4788 newMap!16) (array!5018 (store (arr!2370 (_values!3002 newMap!16)) (index!3304 lt!77480) (ValueCellFull!1149 lt!77191)) (size!2646 (_values!3002 newMap!16))) (_vacant!652 newMap!16))))))

(declare-fun b!146981 () Bool)

(declare-fun Unit!4643 () Unit!4633)

(assert (=> b!146981 (= e!95936 Unit!4643)))

(declare-fun lt!77470 () Unit!4633)

(assert (=> b!146981 (= lt!77470 call!16433)))

(assert (=> b!146981 (= lt!77485 call!16420)))

(declare-fun res!69891 () Bool)

(assert (=> b!146981 (= res!69891 ((_ is Found!284) lt!77485))))

(declare-fun e!95946 () Bool)

(assert (=> b!146981 (=> (not res!69891) (not e!95946))))

(assert (=> b!146981 e!95946))

(declare-fun lt!77476 () Unit!4633)

(assert (=> b!146981 (= lt!77476 lt!77470)))

(assert (=> b!146981 false))

(declare-fun b!146982 () Bool)

(declare-fun lt!77469 () tuple2!2770)

(assert (=> b!146982 (= e!95950 (tuple2!2771 (_1!1396 lt!77469) (_2!1396 lt!77469)))))

(assert (=> b!146982 (= lt!77469 call!16431)))

(declare-fun b!146983 () Bool)

(assert (=> b!146983 (= e!95941 e!95939)))

(declare-fun res!69901 () Bool)

(assert (=> b!146983 (= res!69901 call!16436)))

(assert (=> b!146983 (=> (not res!69901) (not e!95939))))

(declare-fun b!146984 () Bool)

(assert (=> b!146984 (= c!27726 ((_ is MissingVacant!284) lt!77480))))

(assert (=> b!146984 (= e!95938 e!95950)))

(declare-fun b!146985 () Bool)

(declare-fun res!69896 () Bool)

(assert (=> b!146985 (= res!69896 call!16425)))

(assert (=> b!146985 (=> (not res!69896) (not e!95946))))

(declare-fun bm!16436 () Bool)

(assert (=> bm!16436 (= call!16432 call!16439)))

(declare-fun lt!77479 () (_ BitVec 32))

(declare-fun bm!16437 () Bool)

(assert (=> bm!16437 (= call!16443 (getCurrentListMap!576 (_keys!4788 newMap!16) (_values!3002 newMap!16) (mask!7399 newMap!16) (ite c!27725 (ite c!27719 lt!77479 lt!77474) (extraKeys!2764 newMap!16)) (ite (and c!27725 c!27719) lt!77191 (zeroValue!2864 newMap!16)) (ite c!27725 (ite c!27719 (minValue!2864 newMap!16) lt!77191) (minValue!2864 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!3019 newMap!16)))))

(declare-fun b!146986 () Bool)

(assert (=> b!146986 (= e!95946 (= (select (arr!2369 (_keys!4788 newMap!16)) (index!3304 lt!77485)) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355)))))

(declare-fun b!146987 () Bool)

(declare-fun lt!77486 () Unit!4633)

(declare-fun lt!77478 () Unit!4633)

(assert (=> b!146987 (= lt!77486 lt!77478)))

(assert (=> b!146987 (= call!16432 call!16424)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!70 (array!5015 array!5017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3627 V!3627 V!3627 Int) Unit!4633)

(assert (=> b!146987 (= lt!77478 (lemmaChangeZeroKeyThenAddPairToListMap!70 (_keys!4788 newMap!16) (_values!3002 newMap!16) (mask!7399 newMap!16) (extraKeys!2764 newMap!16) lt!77479 (zeroValue!2864 newMap!16) lt!77191 (minValue!2864 newMap!16) (defaultEntry!3019 newMap!16)))))

(assert (=> b!146987 (= lt!77479 (bvor (extraKeys!2764 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!146987 (= e!95952 (tuple2!2771 true (LongMapFixedSize!1207 (defaultEntry!3019 newMap!16) (mask!7399 newMap!16) (bvor (extraKeys!2764 newMap!16) #b00000000000000000000000000000001) lt!77191 (minValue!2864 newMap!16) (_size!652 newMap!16) (_keys!4788 newMap!16) (_values!3002 newMap!16) (_vacant!652 newMap!16))))))

(declare-fun bm!16438 () Bool)

(assert (=> bm!16438 (= call!16428 (arrayContainsKey!0 (_keys!4788 newMap!16) (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!16439 () Bool)

(assert (=> bm!16439 (= call!16424 call!16443)))

(declare-fun b!146988 () Bool)

(assert (=> b!146988 (= e!95937 e!95938)))

(assert (=> b!146988 (= lt!77480 (seekEntryOrOpen!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) from!355) (_keys!4788 newMap!16) (mask!7399 newMap!16)))))

(assert (=> b!146988 (= c!27718 ((_ is Undefined!284) lt!77480))))

(declare-fun bm!16440 () Bool)

(assert (=> bm!16440 (= call!16422 (map!1475 newMap!16))))

(declare-fun b!146989 () Bool)

(assert (=> b!146989 (= e!95942 ((_ is Undefined!284) lt!77471))))

(assert (= (and d!46375 c!27725) b!146967))

(assert (= (and d!46375 (not c!27725)) b!146988))

(assert (= (and b!146967 c!27719) b!146987))

(assert (= (and b!146967 (not c!27719)) b!146961))

(assert (= (or b!146987 b!146961) bm!16439))

(assert (= (or b!146987 b!146961) bm!16417))

(assert (= (or b!146987 b!146961) bm!16436))

(assert (= (and b!146988 c!27718) b!146975))

(assert (= (and b!146988 (not c!27718)) b!146984))

(assert (= (and b!146975 c!27720) b!146981))

(assert (= (and b!146975 (not c!27720)) b!146954))

(assert (= (and b!146981 res!69891) b!146985))

(assert (= (and b!146985 res!69896) b!146986))

(assert (= (and b!146954 c!27723) b!146971))

(assert (= (and b!146954 (not c!27723)) b!146964))

(assert (= (and b!146971 res!69897) b!146965))

(assert (= (and b!146965 res!69894) b!146958))

(assert (= (and b!146964 c!27721) b!146983))

(assert (= (and b!146964 (not c!27721)) b!146952))

(assert (= (and b!146983 res!69901) b!146966))

(assert (= (and b!146966 res!69898) b!146951))

(assert (= (or b!146971 b!146983) bm!16431))

(assert (= (or b!146958 b!146951) bm!16418))

(assert (= (or b!146985 bm!16431) bm!16426))

(assert (= (or b!146981 b!146954) bm!16433))

(assert (= (and b!146984 c!27726) b!146982))

(assert (= (and b!146984 (not c!27726)) b!146970))

(assert (= (and b!146970 c!27717) b!146969))

(assert (= (and b!146970 (not c!27717)) b!146980))

(assert (= (and b!146980 c!27724) b!146950))

(assert (= (and b!146980 (not c!27724)) b!146957))

(assert (= (and b!146950 res!69890) b!146962))

(assert (= (and b!146962 res!69900) b!146979))

(assert (= (and b!146957 c!27728) b!146960))

(assert (= (and b!146957 (not c!27728)) b!146972))

(assert (= (and b!146960 res!69902) b!146955))

(assert (= (and b!146955 res!69892) b!146963))

(assert (= (and b!146972 c!27722) b!146959))

(assert (= (and b!146972 (not c!27722)) b!146989))

(assert (= (and b!146959 res!69903) b!146976))

(assert (= (and b!146976 res!69893) b!146968))

(assert (= (or b!146960 b!146959) bm!16435))

(assert (= (or b!146963 b!146968) bm!16421))

(assert (= (or b!146962 bm!16435) bm!16428))

(assert (= (or b!146950 b!146957) bm!16434))

(assert (= (or b!146982 b!146969) bm!16423))

(assert (= (or bm!16426 bm!16428) bm!16430))

(assert (= (or bm!16433 bm!16434) bm!16425))

(assert (= (or b!146981 b!146950) bm!16424))

(assert (= (or bm!16418 bm!16421) bm!16438))

(assert (= (or b!146954 b!146957) bm!16429))

(assert (= (or b!146975 b!146980) bm!16422))

(assert (= (or b!146975 b!146980) bm!16432))

(assert (= (and bm!16432 c!27716) b!146953))

(assert (= (and bm!16432 (not c!27716)) b!146978))

(assert (= (or bm!16417 bm!16422) bm!16427))

(assert (= (or bm!16439 b!146978 b!146980) bm!16437))

(assert (= (or bm!16436 b!146980) bm!16420))

(assert (= (and d!46375 res!69899) b!146977))

(assert (= (and b!146977 c!27727) b!146956))

(assert (= (and b!146977 (not c!27727)) b!146974))

(assert (= (and b!146956 res!69895) b!146973))

(assert (= (or b!146956 b!146973 b!146974) bm!16419))

(assert (= (or b!146973 b!146974) bm!16440))

(declare-fun m!176759 () Bool)

(assert (=> bm!16427 m!176759))

(declare-fun m!176761 () Bool)

(assert (=> bm!16427 m!176761))

(assert (=> b!146956 m!176403))

(declare-fun m!176763 () Bool)

(assert (=> b!146956 m!176763))

(declare-fun m!176765 () Bool)

(assert (=> b!146961 m!176765))

(assert (=> b!146988 m!176403))

(declare-fun m!176767 () Bool)

(assert (=> b!146988 m!176767))

(declare-fun m!176769 () Bool)

(assert (=> b!146965 m!176769))

(assert (=> bm!16424 m!176403))

(declare-fun m!176771 () Bool)

(assert (=> bm!16424 m!176771))

(declare-fun m!176773 () Bool)

(assert (=> bm!16420 m!176773))

(assert (=> bm!16425 m!176403))

(assert (=> bm!16425 m!176767))

(declare-fun m!176775 () Bool)

(assert (=> b!146987 m!176775))

(assert (=> bm!16429 m!176403))

(declare-fun m!176777 () Bool)

(assert (=> bm!16429 m!176777))

(declare-fun m!176779 () Bool)

(assert (=> bm!16437 m!176779))

(assert (=> bm!16440 m!176455))

(declare-fun m!176781 () Bool)

(assert (=> b!146980 m!176781))

(declare-fun m!176783 () Bool)

(assert (=> b!146980 m!176783))

(declare-fun m!176785 () Bool)

(assert (=> b!146980 m!176785))

(assert (=> b!146980 m!176403))

(declare-fun m!176787 () Bool)

(assert (=> b!146980 m!176787))

(assert (=> b!146980 m!176759))

(assert (=> b!146980 m!176785))

(assert (=> b!146980 m!176781))

(declare-fun m!176789 () Bool)

(assert (=> b!146980 m!176789))

(declare-fun m!176791 () Bool)

(assert (=> bm!16430 m!176791))

(assert (=> bm!16438 m!176403))

(declare-fun m!176793 () Bool)

(assert (=> bm!16438 m!176793))

(declare-fun m!176795 () Bool)

(assert (=> b!146976 m!176795))

(assert (=> bm!16432 m!176403))

(declare-fun m!176797 () Bool)

(assert (=> bm!16432 m!176797))

(declare-fun m!176799 () Bool)

(assert (=> b!146979 m!176799))

(declare-fun m!176801 () Bool)

(assert (=> bm!16419 m!176801))

(declare-fun m!176803 () Bool)

(assert (=> b!146955 m!176803))

(declare-fun m!176805 () Bool)

(assert (=> b!146973 m!176805))

(assert (=> bm!16423 m!176403))

(declare-fun m!176807 () Bool)

(assert (=> bm!16423 m!176807))

(declare-fun m!176809 () Bool)

(assert (=> b!146966 m!176809))

(declare-fun m!176811 () Bool)

(assert (=> d!46375 m!176811))

(assert (=> d!46375 m!176459))

(declare-fun m!176813 () Bool)

(assert (=> b!146986 m!176813))

(assert (=> b!146630 d!46375))

(declare-fun d!46377 () Bool)

(declare-fun res!69904 () Bool)

(declare-fun e!95954 () Bool)

(assert (=> d!46377 (=> (not res!69904) (not e!95954))))

(assert (=> d!46377 (= res!69904 (simpleValid!101 newMap!16))))

(assert (=> d!46377 (= (valid!588 newMap!16) e!95954)))

(declare-fun b!146990 () Bool)

(declare-fun res!69905 () Bool)

(assert (=> b!146990 (=> (not res!69905) (not e!95954))))

(assert (=> b!146990 (= res!69905 (= (arrayCountValidKeys!0 (_keys!4788 newMap!16) #b00000000000000000000000000000000 (size!2645 (_keys!4788 newMap!16))) (_size!652 newMap!16)))))

(declare-fun b!146991 () Bool)

(declare-fun res!69906 () Bool)

(assert (=> b!146991 (=> (not res!69906) (not e!95954))))

(assert (=> b!146991 (= res!69906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4788 newMap!16) (mask!7399 newMap!16)))))

(declare-fun b!146992 () Bool)

(assert (=> b!146992 (= e!95954 (arrayNoDuplicates!0 (_keys!4788 newMap!16) #b00000000000000000000000000000000 Nil!1780))))

(assert (= (and d!46377 res!69904) b!146990))

(assert (= (and b!146990 res!69905) b!146991))

(assert (= (and b!146991 res!69906) b!146992))

(declare-fun m!176815 () Bool)

(assert (=> d!46377 m!176815))

(declare-fun m!176817 () Bool)

(assert (=> b!146990 m!176817))

(declare-fun m!176819 () Bool)

(assert (=> b!146991 m!176819))

(declare-fun m!176821 () Bool)

(assert (=> b!146992 m!176821))

(assert (=> b!146629 d!46377))

(declare-fun d!46379 () Bool)

(assert (=> d!46379 (= (array_inv!1489 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvsge (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!146613 d!46379))

(declare-fun d!46381 () Bool)

(assert (=> d!46381 (= (array_inv!1490 (_values!3002 (v!3364 (underlying!505 thiss!992)))) (bvsge (size!2646 (_values!3002 (v!3364 (underlying!505 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!146613 d!46381))

(declare-fun d!46383 () Bool)

(declare-fun e!95973 () Bool)

(assert (=> d!46383 e!95973))

(declare-fun res!69912 () Bool)

(assert (=> d!46383 (=> res!69912 e!95973)))

(declare-fun lt!77589 () tuple2!2770)

(assert (=> d!46383 (= res!69912 (not (_1!1396 lt!77589)))))

(declare-fun e!95971 () tuple2!2770)

(assert (=> d!46383 (= lt!77589 e!95971)))

(declare-fun c!27742 () Bool)

(declare-fun lt!77562 () (_ BitVec 64))

(assert (=> d!46383 (= c!27742 (and (not (= lt!77562 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77562 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77575 () ListLongMap!1783)

(assert (=> d!46383 (= lt!77575 (map!1475 (_2!1396 lt!77190)))))

(declare-fun lt!77567 () V!3627)

(assert (=> d!46383 (= lt!77567 (get!1578 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46383 (= lt!77562 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvsub from!355 #b00000000000000000000000000000001)))))

(assert (=> d!46383 (valid!589 thiss!992)))

(assert (=> d!46383 (= (repackFrom!18 thiss!992 (_2!1396 lt!77190) (bvsub from!355 #b00000000000000000000000000000001)) lt!77589)))

(declare-fun b!147021 () Bool)

(declare-fun e!95974 () Unit!4633)

(declare-fun Unit!4644 () Unit!4633)

(assert (=> b!147021 (= e!95974 Unit!4644)))

(declare-fun call!16472 () ListLongMap!1783)

(declare-fun lt!77564 () ListLongMap!1783)

(declare-fun lt!77583 () (_ BitVec 64))

(declare-fun lt!77566 () ListLongMap!1783)

(declare-fun bm!16467 () Bool)

(declare-fun c!27741 () Bool)

(assert (=> bm!16467 (= call!16472 (+!187 (ite c!27741 lt!77564 lt!77566) (ite c!27741 (tuple2!2773 lt!77583 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))) (tuple2!2773 lt!77562 lt!77567))))))

(declare-fun b!147022 () Bool)

(declare-fun e!95976 () tuple2!2770)

(declare-fun lt!77570 () tuple2!2770)

(assert (=> b!147022 (= e!95976 (tuple2!2771 false (_2!1396 lt!77570)))))

(declare-fun b!147023 () Bool)

(declare-fun e!95977 () tuple2!2770)

(declare-fun lt!77568 () tuple2!2770)

(assert (=> b!147023 (= e!95977 (tuple2!2771 (_1!1396 lt!77568) (_2!1396 lt!77568)))))

(declare-fun call!16477 () ListLongMap!1783)

(assert (=> b!147023 (= lt!77564 call!16477)))

(assert (=> b!147023 (= lt!77583 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77578 () Unit!4633)

(declare-fun call!16478 () Unit!4633)

(assert (=> b!147023 (= lt!77578 call!16478)))

(declare-fun call!16474 () ListLongMap!1783)

(declare-fun call!16471 () ListLongMap!1783)

(assert (=> b!147023 (= call!16474 call!16471)))

(declare-fun lt!77588 () Unit!4633)

(assert (=> b!147023 (= lt!77588 lt!77578)))

(declare-fun lt!77574 () ListLongMap!1783)

(declare-fun call!16481 () ListLongMap!1783)

(assert (=> b!147023 (= lt!77574 call!16481)))

(declare-fun lt!77558 () (_ BitVec 64))

(assert (=> b!147023 (= lt!77558 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77577 () Unit!4633)

(declare-fun call!16475 () Unit!4633)

(assert (=> b!147023 (= lt!77577 call!16475)))

(declare-fun call!16482 () ListLongMap!1783)

(declare-fun call!16473 () ListLongMap!1783)

(assert (=> b!147023 (= call!16482 call!16473)))

(declare-fun lt!77571 () Unit!4633)

(assert (=> b!147023 (= lt!77571 lt!77577)))

(declare-fun call!16470 () tuple2!2770)

(assert (=> b!147023 (= lt!77568 call!16470)))

(declare-fun lt!77580 () (_ BitVec 64))

(declare-fun bm!16468 () Bool)

(assert (=> bm!16468 (= call!16478 (addCommutativeForDiffKeys!80 (ite c!27741 lt!77564 lt!77566) lt!77562 lt!77567 (ite c!27741 lt!77583 lt!77580) (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!147024 () Bool)

(declare-fun e!95978 () Bool)

(assert (=> b!147024 (= e!95978 (ite (= lt!77562 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!147025 () Bool)

(declare-fun e!95975 () tuple2!2770)

(assert (=> b!147025 (= e!95971 e!95975)))

(declare-fun c!27746 () Bool)

(assert (=> b!147025 (= c!27746 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun call!16479 () ListLongMap!1783)

(declare-fun call!16480 () ListLongMap!1783)

(declare-fun bm!16469 () Bool)

(declare-fun lt!77585 () (_ BitVec 64))

(assert (=> bm!16469 (= call!16482 (+!187 (ite c!27741 call!16480 call!16479) (ite c!27741 (tuple2!2773 lt!77558 (minValue!2864 (v!3364 (underlying!505 thiss!992)))) (tuple2!2773 lt!77585 (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun b!147026 () Bool)

(assert (=> b!147026 false))

(declare-fun lt!77573 () Unit!4633)

(declare-fun lt!77579 () Unit!4633)

(assert (=> b!147026 (= lt!77573 lt!77579)))

(declare-fun lt!77587 () (_ BitVec 32))

(assert (=> b!147026 (not (arrayContainsKey!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) lt!77562 lt!77587))))

(assert (=> b!147026 (= lt!77579 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) lt!77587 lt!77562 (Cons!1779 lt!77562 Nil!1780)))))

(assert (=> b!147026 (= lt!77587 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun lt!77576 () Unit!4633)

(declare-fun lt!77559 () Unit!4633)

(assert (=> b!147026 (= lt!77576 lt!77559)))

(assert (=> b!147026 (arrayNoDuplicates!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (bvsub from!355 #b00000000000000000000000000000001) Nil!1780)))

(assert (=> b!147026 (= lt!77559 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000000 (bvsub from!355 #b00000000000000000000000000000001)))))

(declare-fun lt!77560 () Unit!4633)

(declare-fun lt!77582 () Unit!4633)

(assert (=> b!147026 (= lt!77560 lt!77582)))

(assert (=> b!147026 e!95978))

(declare-fun c!27744 () Bool)

(assert (=> b!147026 (= c!27744 (and (not (= lt!77562 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77562 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77581 () (_ BitVec 32))

(assert (=> b!147026 (= lt!77582 (lemmaListMapContainsThenArrayContainsFrom!156 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) lt!77562 lt!77581 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(assert (=> b!147026 (= lt!77581 (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001))))

(declare-fun Unit!4645 () Unit!4633)

(assert (=> b!147026 (= e!95974 Unit!4645)))

(declare-fun bm!16470 () Bool)

(declare-fun lt!77569 () ListLongMap!1783)

(assert (=> bm!16470 (= call!16479 (+!187 (ite c!27741 lt!77564 lt!77569) (tuple2!2773 lt!77562 lt!77567)))))

(declare-fun b!147027 () Bool)

(assert (=> b!147027 (= e!95975 (tuple2!2771 true (_2!1396 lt!77190)))))

(declare-fun bm!16471 () Bool)

(assert (=> bm!16471 (= call!16477 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!147028 () Bool)

(declare-fun e!95972 () Bool)

(assert (=> b!147028 (= e!95973 e!95972)))

(declare-fun res!69911 () Bool)

(assert (=> b!147028 (=> (not res!69911) (not e!95972))))

(assert (=> b!147028 (= res!69911 (valid!588 (_2!1396 lt!77589)))))

(declare-fun call!16476 () ListLongMap!1783)

(declare-fun bm!16472 () Bool)

(assert (=> bm!16472 (= call!16473 (+!187 (ite c!27741 call!16476 call!16480) (tuple2!2773 lt!77562 lt!77567)))))

(declare-fun b!147029 () Bool)

(assert (=> b!147029 (= e!95971 e!95976)))

(assert (=> b!147029 (= lt!77570 (update!227 (_2!1396 lt!77190) lt!77562 lt!77567))))

(declare-fun c!27743 () Bool)

(assert (=> b!147029 (= c!27743 (contains!952 lt!77575 lt!77562))))

(declare-fun lt!77584 () Unit!4633)

(assert (=> b!147029 (= lt!77584 e!95974)))

(declare-fun c!27745 () Bool)

(assert (=> b!147029 (= c!27745 (_1!1396 lt!77570))))

(declare-fun b!147030 () Bool)

(assert (=> b!147030 (= e!95978 (arrayContainsKey!0 (_keys!4788 (v!3364 (underlying!505 thiss!992))) lt!77562 lt!77581))))

(declare-fun b!147031 () Bool)

(assert (=> b!147031 (= e!95972 (= (map!1475 (_2!1396 lt!77589)) (map!1475 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun bm!16473 () Bool)

(assert (=> bm!16473 (= call!16471 (+!187 (ite c!27741 call!16472 call!16476) (tuple2!2773 lt!77562 lt!77567)))))

(declare-fun b!147032 () Bool)

(assert (=> b!147032 (= e!95977 (tuple2!2771 true (_2!1396 lt!77570)))))

(assert (=> b!147032 (= lt!77566 call!16477)))

(assert (=> b!147032 (= lt!77580 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77565 () Unit!4633)

(assert (=> b!147032 (= lt!77565 call!16478)))

(assert (=> b!147032 (= call!16474 call!16471)))

(declare-fun lt!77572 () Unit!4633)

(assert (=> b!147032 (= lt!77572 lt!77565)))

(assert (=> b!147032 (= lt!77569 call!16481)))

(assert (=> b!147032 (= lt!77585 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77563 () Unit!4633)

(assert (=> b!147032 (= lt!77563 call!16475)))

(assert (=> b!147032 (= call!16482 call!16473)))

(declare-fun lt!77561 () Unit!4633)

(assert (=> b!147032 (= lt!77561 lt!77563)))

(declare-fun bm!16474 () Bool)

(assert (=> bm!16474 (= call!16474 (+!187 (ite c!27741 call!16479 call!16472) (ite c!27741 (tuple2!2773 lt!77583 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))) (tuple2!2773 lt!77580 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun bm!16475 () Bool)

(assert (=> bm!16475 (= call!16470 (repackFrom!18 thiss!992 (ite c!27742 (_2!1396 lt!77570) (_2!1396 lt!77190)) (bvsub (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(declare-fun bm!16476 () Bool)

(assert (=> bm!16476 (= call!16476 (+!187 (ite c!27741 lt!77574 lt!77566) (ite c!27741 (tuple2!2773 lt!77558 (minValue!2864 (v!3364 (underlying!505 thiss!992)))) (tuple2!2773 lt!77580 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))))))))

(declare-fun b!147033 () Bool)

(declare-fun lt!77586 () tuple2!2770)

(assert (=> b!147033 (= lt!77586 call!16470)))

(assert (=> b!147033 (= e!95975 (tuple2!2771 (_1!1396 lt!77586) (_2!1396 lt!77586)))))

(declare-fun b!147034 () Bool)

(assert (=> b!147034 (= c!27741 (bvsgt (bvsub from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!147034 (= e!95976 e!95977)))

(declare-fun bm!16477 () Bool)

(assert (=> bm!16477 (= call!16475 (addCommutativeForDiffKeys!80 (ite c!27741 lt!77574 lt!77569) lt!77562 lt!77567 (ite c!27741 lt!77558 lt!77585) (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun bm!16478 () Bool)

(assert (=> bm!16478 (= call!16481 (+!187 call!16477 (tuple2!2773 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun bm!16479 () Bool)

(assert (=> bm!16479 (= call!16480 (+!187 (ite c!27741 lt!77574 lt!77569) (ite c!27741 (tuple2!2773 lt!77562 lt!77567) (tuple2!2773 lt!77585 (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))))

(assert (= (and d!46383 c!27742) b!147029))

(assert (= (and d!46383 (not c!27742)) b!147025))

(assert (= (and b!147029 c!27743) b!147026))

(assert (= (and b!147029 (not c!27743)) b!147021))

(assert (= (and b!147026 c!27744) b!147030))

(assert (= (and b!147026 (not c!27744)) b!147024))

(assert (= (and b!147029 c!27745) b!147034))

(assert (= (and b!147029 (not c!27745)) b!147022))

(assert (= (and b!147034 c!27741) b!147023))

(assert (= (and b!147034 (not c!27741)) b!147032))

(assert (= (or b!147023 b!147032) bm!16477))

(assert (= (or b!147023 b!147032) bm!16468))

(assert (= (or b!147023 b!147032) bm!16479))

(assert (= (or b!147023 b!147032) bm!16467))

(assert (= (or b!147023 b!147032) bm!16476))

(assert (= (or b!147023 b!147032) bm!16470))

(assert (= (or b!147023 b!147032) bm!16471))

(assert (= (or b!147023 b!147032) bm!16474))

(assert (= (or b!147023 b!147032) bm!16472))

(assert (= (or b!147023 b!147032) bm!16473))

(assert (= (or b!147023 b!147032) bm!16478))

(assert (= (or b!147023 b!147032) bm!16469))

(assert (= (and b!147025 c!27746) b!147033))

(assert (= (and b!147025 (not c!27746)) b!147027))

(assert (= (or b!147023 b!147033) bm!16475))

(assert (= (and d!46383 (not res!69912)) b!147028))

(assert (= (and b!147028 res!69911) b!147031))

(declare-fun b_lambda!6573 () Bool)

(assert (=> (not b_lambda!6573) (not d!46383)))

(assert (=> d!46383 t!6501))

(declare-fun b_and!9219 () Bool)

(assert (= b_and!9215 (and (=> t!6501 result!4377) b_and!9219)))

(assert (=> d!46383 t!6503))

(declare-fun b_and!9221 () Bool)

(assert (= b_and!9217 (and (=> t!6503 result!4381) b_and!9221)))

(declare-fun m!176823 () Bool)

(assert (=> b!147030 m!176823))

(declare-fun m!176825 () Bool)

(assert (=> bm!16471 m!176825))

(declare-fun m!176827 () Bool)

(assert (=> bm!16479 m!176827))

(declare-fun m!176829 () Bool)

(assert (=> b!147028 m!176829))

(declare-fun m!176831 () Bool)

(assert (=> bm!16477 m!176831))

(declare-fun m!176833 () Bool)

(assert (=> b!147031 m!176833))

(assert (=> b!147031 m!176453))

(declare-fun m!176835 () Bool)

(assert (=> bm!16468 m!176835))

(declare-fun m!176837 () Bool)

(assert (=> bm!16476 m!176837))

(declare-fun m!176839 () Bool)

(assert (=> bm!16467 m!176839))

(declare-fun m!176841 () Bool)

(assert (=> b!147026 m!176841))

(declare-fun m!176843 () Bool)

(assert (=> b!147026 m!176843))

(declare-fun m!176845 () Bool)

(assert (=> b!147026 m!176845))

(declare-fun m!176847 () Bool)

(assert (=> b!147026 m!176847))

(declare-fun m!176849 () Bool)

(assert (=> b!147026 m!176849))

(declare-fun m!176851 () Bool)

(assert (=> bm!16474 m!176851))

(assert (=> d!46383 m!176417))

(declare-fun m!176853 () Bool)

(assert (=> d!46383 m!176853))

(declare-fun m!176855 () Bool)

(assert (=> d!46383 m!176855))

(assert (=> d!46383 m!176417))

(declare-fun m!176857 () Bool)

(assert (=> d!46383 m!176857))

(assert (=> d!46383 m!176461))

(assert (=> d!46383 m!176401))

(assert (=> d!46383 m!176855))

(declare-fun m!176859 () Bool)

(assert (=> bm!16469 m!176859))

(declare-fun m!176861 () Bool)

(assert (=> b!147029 m!176861))

(declare-fun m!176863 () Bool)

(assert (=> b!147029 m!176863))

(declare-fun m!176865 () Bool)

(assert (=> bm!16473 m!176865))

(declare-fun m!176867 () Bool)

(assert (=> bm!16472 m!176867))

(declare-fun m!176869 () Bool)

(assert (=> bm!16475 m!176869))

(declare-fun m!176871 () Bool)

(assert (=> bm!16470 m!176871))

(declare-fun m!176873 () Bool)

(assert (=> bm!16478 m!176873))

(assert (=> b!146612 d!46383))

(declare-fun d!46385 () Bool)

(assert (=> d!46385 (= (valid!589 thiss!992) (valid!588 (v!3364 (underlying!505 thiss!992))))))

(declare-fun bs!6150 () Bool)

(assert (= bs!6150 d!46385))

(declare-fun m!176875 () Bool)

(assert (=> bs!6150 m!176875))

(assert (=> start!15216 d!46385))

(declare-fun d!46387 () Bool)

(assert (=> d!46387 (= (map!1475 newMap!16) (getCurrentListMap!576 (_keys!4788 newMap!16) (_values!3002 newMap!16) (mask!7399 newMap!16) (extraKeys!2764 newMap!16) (zeroValue!2864 newMap!16) (minValue!2864 newMap!16) #b00000000000000000000000000000000 (defaultEntry!3019 newMap!16)))))

(declare-fun bs!6151 () Bool)

(assert (= bs!6151 d!46387))

(declare-fun m!176877 () Bool)

(assert (=> bs!6151 m!176877))

(assert (=> b!146622 d!46387))

(declare-fun b!147035 () Bool)

(declare-fun e!95982 () Bool)

(assert (=> b!147035 (= e!95982 (validKeyInArray!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!16480 () Bool)

(declare-fun call!16485 () ListLongMap!1783)

(assert (=> bm!16480 (= call!16485 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!147036 () Bool)

(declare-fun e!95989 () ListLongMap!1783)

(declare-fun call!16489 () ListLongMap!1783)

(assert (=> b!147036 (= e!95989 call!16489)))

(declare-fun b!147037 () Bool)

(declare-fun res!69920 () Bool)

(declare-fun e!95987 () Bool)

(assert (=> b!147037 (=> (not res!69920) (not e!95987))))

(declare-fun e!95985 () Bool)

(assert (=> b!147037 (= res!69920 e!95985)))

(declare-fun res!69919 () Bool)

(assert (=> b!147037 (=> res!69919 e!95985)))

(assert (=> b!147037 (= res!69919 (not e!95982))))

(declare-fun res!69917 () Bool)

(assert (=> b!147037 (=> (not res!69917) (not e!95982))))

(assert (=> b!147037 (= res!69917 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!147038 () Bool)

(declare-fun e!95984 () Bool)

(declare-fun call!16484 () Bool)

(assert (=> b!147038 (= e!95984 (not call!16484))))

(declare-fun b!147039 () Bool)

(declare-fun e!95979 () Bool)

(declare-fun e!95991 () Bool)

(assert (=> b!147039 (= e!95979 e!95991)))

(declare-fun res!69915 () Bool)

(declare-fun call!16483 () Bool)

(assert (=> b!147039 (= res!69915 call!16483)))

(assert (=> b!147039 (=> (not res!69915) (not e!95991))))

(declare-fun d!46389 () Bool)

(assert (=> d!46389 e!95987))

(declare-fun res!69918 () Bool)

(assert (=> d!46389 (=> (not res!69918) (not e!95987))))

(assert (=> d!46389 (= res!69918 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))))

(declare-fun lt!77600 () ListLongMap!1783)

(declare-fun lt!77597 () ListLongMap!1783)

(assert (=> d!46389 (= lt!77600 lt!77597)))

(declare-fun lt!77596 () Unit!4633)

(declare-fun e!95988 () Unit!4633)

(assert (=> d!46389 (= lt!77596 e!95988)))

(declare-fun c!27747 () Bool)

(declare-fun e!95990 () Bool)

(assert (=> d!46389 (= c!27747 e!95990)))

(declare-fun res!69921 () Bool)

(assert (=> d!46389 (=> (not res!69921) (not e!95990))))

(assert (=> d!46389 (= res!69921 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun e!95980 () ListLongMap!1783)

(assert (=> d!46389 (= lt!77597 e!95980)))

(declare-fun c!27750 () Bool)

(assert (=> d!46389 (= c!27750 (and (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46389 (validMask!0 (mask!7399 (v!3364 (underlying!505 thiss!992))))))

(assert (=> d!46389 (= (getCurrentListMap!576 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))) lt!77600)))

(declare-fun bm!16481 () Bool)

(declare-fun call!16488 () ListLongMap!1783)

(assert (=> bm!16481 (= call!16488 call!16485)))

(declare-fun b!147040 () Bool)

(declare-fun call!16487 () ListLongMap!1783)

(assert (=> b!147040 (= e!95989 call!16487)))

(declare-fun b!147041 () Bool)

(declare-fun e!95983 () Bool)

(assert (=> b!147041 (= e!95983 (= (apply!125 lt!77600 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun e!95986 () Bool)

(declare-fun b!147042 () Bool)

(assert (=> b!147042 (= e!95986 (= (apply!125 lt!77600 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1578 (select (arr!2370 (_values!3002 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!460 (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!147042 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2646 (_values!3002 (v!3364 (underlying!505 thiss!992))))))))

(assert (=> b!147042 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!147043 () Bool)

(assert (=> b!147043 (= e!95979 (not call!16483))))

(declare-fun b!147044 () Bool)

(declare-fun e!95981 () ListLongMap!1783)

(assert (=> b!147044 (= e!95980 e!95981)))

(declare-fun c!27748 () Bool)

(assert (=> b!147044 (= c!27748 (and (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!147045 () Bool)

(declare-fun call!16486 () ListLongMap!1783)

(assert (=> b!147045 (= e!95980 (+!187 call!16486 (tuple2!2773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun b!147046 () Bool)

(declare-fun res!69916 () Bool)

(assert (=> b!147046 (=> (not res!69916) (not e!95987))))

(assert (=> b!147046 (= res!69916 e!95984)))

(declare-fun c!27749 () Bool)

(assert (=> b!147046 (= c!27749 (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!147047 () Bool)

(declare-fun c!27752 () Bool)

(assert (=> b!147047 (= c!27752 (and (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!147047 (= e!95981 e!95989)))

(declare-fun b!147048 () Bool)

(assert (=> b!147048 (= e!95991 (= (apply!125 lt!77600 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun b!147049 () Bool)

(assert (=> b!147049 (= e!95981 call!16487)))

(declare-fun b!147050 () Bool)

(assert (=> b!147050 (= e!95987 e!95979)))

(declare-fun c!27751 () Bool)

(assert (=> b!147050 (= c!27751 (not (= (bvand (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!147051 () Bool)

(declare-fun lt!77594 () Unit!4633)

(assert (=> b!147051 (= e!95988 lt!77594)))

(declare-fun lt!77608 () ListLongMap!1783)

(assert (=> b!147051 (= lt!77608 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77601 () (_ BitVec 64))

(assert (=> b!147051 (= lt!77601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77593 () (_ BitVec 64))

(assert (=> b!147051 (= lt!77593 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77609 () Unit!4633)

(assert (=> b!147051 (= lt!77609 (addStillContains!101 lt!77608 lt!77601 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) lt!77593))))

(assert (=> b!147051 (contains!952 (+!187 lt!77608 (tuple2!2773 lt!77601 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))))) lt!77593)))

(declare-fun lt!77606 () Unit!4633)

(assert (=> b!147051 (= lt!77606 lt!77609)))

(declare-fun lt!77603 () ListLongMap!1783)

(assert (=> b!147051 (= lt!77603 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77610 () (_ BitVec 64))

(assert (=> b!147051 (= lt!77610 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77598 () (_ BitVec 64))

(assert (=> b!147051 (= lt!77598 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77595 () Unit!4633)

(assert (=> b!147051 (= lt!77595 (addApplyDifferent!101 lt!77603 lt!77610 (minValue!2864 (v!3364 (underlying!505 thiss!992))) lt!77598))))

(assert (=> b!147051 (= (apply!125 (+!187 lt!77603 (tuple2!2773 lt!77610 (minValue!2864 (v!3364 (underlying!505 thiss!992))))) lt!77598) (apply!125 lt!77603 lt!77598))))

(declare-fun lt!77604 () Unit!4633)

(assert (=> b!147051 (= lt!77604 lt!77595)))

(declare-fun lt!77590 () ListLongMap!1783)

(assert (=> b!147051 (= lt!77590 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77607 () (_ BitVec 64))

(assert (=> b!147051 (= lt!77607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77591 () (_ BitVec 64))

(assert (=> b!147051 (= lt!77591 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!77602 () Unit!4633)

(assert (=> b!147051 (= lt!77602 (addApplyDifferent!101 lt!77590 lt!77607 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) lt!77591))))

(assert (=> b!147051 (= (apply!125 (+!187 lt!77590 (tuple2!2773 lt!77607 (zeroValue!2864 (v!3364 (underlying!505 thiss!992))))) lt!77591) (apply!125 lt!77590 lt!77591))))

(declare-fun lt!77605 () Unit!4633)

(assert (=> b!147051 (= lt!77605 lt!77602)))

(declare-fun lt!77592 () ListLongMap!1783)

(assert (=> b!147051 (= lt!77592 (getCurrentListMapNoExtraKeys!155 (_keys!4788 (v!3364 (underlying!505 thiss!992))) (_values!3002 (v!3364 (underlying!505 thiss!992))) (mask!7399 (v!3364 (underlying!505 thiss!992))) (extraKeys!2764 (v!3364 (underlying!505 thiss!992))) (zeroValue!2864 (v!3364 (underlying!505 thiss!992))) (minValue!2864 (v!3364 (underlying!505 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992)))))))

(declare-fun lt!77611 () (_ BitVec 64))

(assert (=> b!147051 (= lt!77611 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77599 () (_ BitVec 64))

(assert (=> b!147051 (= lt!77599 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!147051 (= lt!77594 (addApplyDifferent!101 lt!77592 lt!77611 (minValue!2864 (v!3364 (underlying!505 thiss!992))) lt!77599))))

(assert (=> b!147051 (= (apply!125 (+!187 lt!77592 (tuple2!2773 lt!77611 (minValue!2864 (v!3364 (underlying!505 thiss!992))))) lt!77599) (apply!125 lt!77592 lt!77599))))

(declare-fun bm!16482 () Bool)

(assert (=> bm!16482 (= call!16484 (contains!952 lt!77600 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!147052 () Bool)

(assert (=> b!147052 (= e!95990 (validKeyInArray!0 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!147053 () Bool)

(assert (=> b!147053 (= e!95985 e!95986)))

(declare-fun res!69914 () Bool)

(assert (=> b!147053 (=> (not res!69914) (not e!95986))))

(assert (=> b!147053 (= res!69914 (contains!952 lt!77600 (select (arr!2369 (_keys!4788 (v!3364 (underlying!505 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!147053 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2645 (_keys!4788 (v!3364 (underlying!505 thiss!992))))))))

(declare-fun bm!16483 () Bool)

(assert (=> bm!16483 (= call!16487 call!16486)))

(declare-fun b!147054 () Bool)

(declare-fun Unit!4646 () Unit!4633)

(assert (=> b!147054 (= e!95988 Unit!4646)))

(declare-fun b!147055 () Bool)

(assert (=> b!147055 (= e!95984 e!95983)))

(declare-fun res!69913 () Bool)

(assert (=> b!147055 (= res!69913 call!16484)))

(assert (=> b!147055 (=> (not res!69913) (not e!95983))))

(declare-fun bm!16484 () Bool)

(assert (=> bm!16484 (= call!16489 call!16488)))

(declare-fun bm!16485 () Bool)

(assert (=> bm!16485 (= call!16483 (contains!952 lt!77600 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16486 () Bool)

(assert (=> bm!16486 (= call!16486 (+!187 (ite c!27750 call!16485 (ite c!27748 call!16488 call!16489)) (ite (or c!27750 c!27748) (tuple2!2773 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2864 (v!3364 (underlying!505 thiss!992)))) (tuple2!2773 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2864 (v!3364 (underlying!505 thiss!992)))))))))

(assert (= (and d!46389 c!27750) b!147045))

(assert (= (and d!46389 (not c!27750)) b!147044))

(assert (= (and b!147044 c!27748) b!147049))

(assert (= (and b!147044 (not c!27748)) b!147047))

(assert (= (and b!147047 c!27752) b!147040))

(assert (= (and b!147047 (not c!27752)) b!147036))

(assert (= (or b!147040 b!147036) bm!16484))

(assert (= (or b!147049 bm!16484) bm!16481))

(assert (= (or b!147049 b!147040) bm!16483))

(assert (= (or b!147045 bm!16481) bm!16480))

(assert (= (or b!147045 bm!16483) bm!16486))

(assert (= (and d!46389 res!69921) b!147052))

(assert (= (and d!46389 c!27747) b!147051))

(assert (= (and d!46389 (not c!27747)) b!147054))

(assert (= (and d!46389 res!69918) b!147037))

(assert (= (and b!147037 res!69917) b!147035))

(assert (= (and b!147037 (not res!69919)) b!147053))

(assert (= (and b!147053 res!69914) b!147042))

(assert (= (and b!147037 res!69920) b!147046))

(assert (= (and b!147046 c!27749) b!147055))

(assert (= (and b!147046 (not c!27749)) b!147038))

(assert (= (and b!147055 res!69913) b!147041))

(assert (= (or b!147055 b!147038) bm!16482))

(assert (= (and b!147046 res!69916) b!147050))

(assert (= (and b!147050 c!27751) b!147039))

(assert (= (and b!147050 (not c!27751)) b!147043))

(assert (= (and b!147039 res!69915) b!147048))

(assert (= (or b!147039 b!147043) bm!16485))

(declare-fun b_lambda!6575 () Bool)

(assert (=> (not b_lambda!6575) (not b!147042)))

(assert (=> b!147042 t!6501))

(declare-fun b_and!9223 () Bool)

(assert (= b_and!9219 (and (=> t!6501 result!4377) b_and!9223)))

(assert (=> b!147042 t!6503))

(declare-fun b_and!9225 () Bool)

(assert (= b_and!9221 (and (=> t!6503 result!4381) b_and!9225)))

(declare-fun m!176879 () Bool)

(assert (=> bm!16485 m!176879))

(declare-fun m!176881 () Bool)

(assert (=> b!147045 m!176881))

(declare-fun m!176883 () Bool)

(assert (=> b!147048 m!176883))

(assert (=> b!147042 m!176599))

(declare-fun m!176885 () Bool)

(assert (=> b!147042 m!176885))

(assert (=> b!147042 m!176599))

(assert (=> b!147042 m!176605))

(assert (=> b!147042 m!176605))

(assert (=> b!147042 m!176417))

(assert (=> b!147042 m!176607))

(assert (=> b!147042 m!176417))

(declare-fun m!176887 () Bool)

(assert (=> b!147051 m!176887))

(declare-fun m!176889 () Bool)

(assert (=> b!147051 m!176889))

(declare-fun m!176891 () Bool)

(assert (=> b!147051 m!176891))

(assert (=> b!147051 m!176891))

(declare-fun m!176893 () Bool)

(assert (=> b!147051 m!176893))

(declare-fun m!176895 () Bool)

(assert (=> b!147051 m!176895))

(declare-fun m!176897 () Bool)

(assert (=> b!147051 m!176897))

(declare-fun m!176899 () Bool)

(assert (=> b!147051 m!176899))

(assert (=> b!147051 m!176897))

(declare-fun m!176901 () Bool)

(assert (=> b!147051 m!176901))

(assert (=> b!147051 m!176599))

(declare-fun m!176903 () Bool)

(assert (=> b!147051 m!176903))

(declare-fun m!176905 () Bool)

(assert (=> b!147051 m!176905))

(declare-fun m!176907 () Bool)

(assert (=> b!147051 m!176907))

(declare-fun m!176909 () Bool)

(assert (=> b!147051 m!176909))

(assert (=> b!147051 m!176909))

(declare-fun m!176911 () Bool)

(assert (=> b!147051 m!176911))

(assert (=> b!147051 m!176409))

(declare-fun m!176913 () Bool)

(assert (=> b!147051 m!176913))

(assert (=> b!147051 m!176913))

(declare-fun m!176915 () Bool)

(assert (=> b!147051 m!176915))

(declare-fun m!176917 () Bool)

(assert (=> b!147041 m!176917))

(assert (=> bm!16480 m!176409))

(assert (=> b!147052 m!176599))

(assert (=> b!147052 m!176599))

(assert (=> b!147052 m!176603))

(declare-fun m!176919 () Bool)

(assert (=> bm!16482 m!176919))

(assert (=> b!147053 m!176599))

(assert (=> b!147053 m!176599))

(declare-fun m!176921 () Bool)

(assert (=> b!147053 m!176921))

(assert (=> d!46389 m!176619))

(assert (=> b!147035 m!176599))

(assert (=> b!147035 m!176599))

(assert (=> b!147035 m!176603))

(declare-fun m!176923 () Bool)

(assert (=> bm!16486 m!176923))

(assert (=> b!146622 d!46389))

(declare-fun mapIsEmpty!5037 () Bool)

(declare-fun mapRes!5037 () Bool)

(assert (=> mapIsEmpty!5037 mapRes!5037))

(declare-fun condMapEmpty!5037 () Bool)

(declare-fun mapDefault!5037 () ValueCell!1149)

(assert (=> mapNonEmpty!5028 (= condMapEmpty!5037 (= mapRest!5028 ((as const (Array (_ BitVec 32) ValueCell!1149)) mapDefault!5037)))))

(declare-fun e!95997 () Bool)

(assert (=> mapNonEmpty!5028 (= tp!11914 (and e!95997 mapRes!5037))))

(declare-fun mapNonEmpty!5037 () Bool)

(declare-fun tp!11931 () Bool)

(declare-fun e!95996 () Bool)

(assert (=> mapNonEmpty!5037 (= mapRes!5037 (and tp!11931 e!95996))))

(declare-fun mapKey!5037 () (_ BitVec 32))

(declare-fun mapRest!5037 () (Array (_ BitVec 32) ValueCell!1149))

(declare-fun mapValue!5037 () ValueCell!1149)

(assert (=> mapNonEmpty!5037 (= mapRest!5028 (store mapRest!5037 mapKey!5037 mapValue!5037))))

(declare-fun b!147062 () Bool)

(assert (=> b!147062 (= e!95996 tp_is_empty!2985)))

(declare-fun b!147063 () Bool)

(assert (=> b!147063 (= e!95997 tp_is_empty!2985)))

(assert (= (and mapNonEmpty!5028 condMapEmpty!5037) mapIsEmpty!5037))

(assert (= (and mapNonEmpty!5028 (not condMapEmpty!5037)) mapNonEmpty!5037))

(assert (= (and mapNonEmpty!5037 ((_ is ValueCellFull!1149) mapValue!5037)) b!147062))

(assert (= (and mapNonEmpty!5028 ((_ is ValueCellFull!1149) mapDefault!5037)) b!147063))

(declare-fun m!176925 () Bool)

(assert (=> mapNonEmpty!5037 m!176925))

(declare-fun mapIsEmpty!5038 () Bool)

(declare-fun mapRes!5038 () Bool)

(assert (=> mapIsEmpty!5038 mapRes!5038))

(declare-fun condMapEmpty!5038 () Bool)

(declare-fun mapDefault!5038 () ValueCell!1149)

(assert (=> mapNonEmpty!5027 (= condMapEmpty!5038 (= mapRest!5027 ((as const (Array (_ BitVec 32) ValueCell!1149)) mapDefault!5038)))))

(declare-fun e!95999 () Bool)

(assert (=> mapNonEmpty!5027 (= tp!11913 (and e!95999 mapRes!5038))))

(declare-fun mapNonEmpty!5038 () Bool)

(declare-fun tp!11932 () Bool)

(declare-fun e!95998 () Bool)

(assert (=> mapNonEmpty!5038 (= mapRes!5038 (and tp!11932 e!95998))))

(declare-fun mapValue!5038 () ValueCell!1149)

(declare-fun mapRest!5038 () (Array (_ BitVec 32) ValueCell!1149))

(declare-fun mapKey!5038 () (_ BitVec 32))

(assert (=> mapNonEmpty!5038 (= mapRest!5027 (store mapRest!5038 mapKey!5038 mapValue!5038))))

(declare-fun b!147064 () Bool)

(assert (=> b!147064 (= e!95998 tp_is_empty!2985)))

(declare-fun b!147065 () Bool)

(assert (=> b!147065 (= e!95999 tp_is_empty!2985)))

(assert (= (and mapNonEmpty!5027 condMapEmpty!5038) mapIsEmpty!5038))

(assert (= (and mapNonEmpty!5027 (not condMapEmpty!5038)) mapNonEmpty!5038))

(assert (= (and mapNonEmpty!5038 ((_ is ValueCellFull!1149) mapValue!5038)) b!147064))

(assert (= (and mapNonEmpty!5027 ((_ is ValueCellFull!1149) mapDefault!5038)) b!147065))

(declare-fun m!176927 () Bool)

(assert (=> mapNonEmpty!5038 m!176927))

(declare-fun b_lambda!6577 () Bool)

(assert (= b_lambda!6569 (or (and b!146613 b_free!3137) (and b!146618 b_free!3139 (= (defaultEntry!3019 newMap!16) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))))) b_lambda!6577)))

(declare-fun b_lambda!6579 () Bool)

(assert (= b_lambda!6567 (or (and b!146613 b_free!3137) (and b!146618 b_free!3139 (= (defaultEntry!3019 newMap!16) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))))) b_lambda!6579)))

(declare-fun b_lambda!6581 () Bool)

(assert (= b_lambda!6573 (or (and b!146613 b_free!3137) (and b!146618 b_free!3139 (= (defaultEntry!3019 newMap!16) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))))) b_lambda!6581)))

(declare-fun b_lambda!6583 () Bool)

(assert (= b_lambda!6575 (or (and b!146613 b_free!3137) (and b!146618 b_free!3139 (= (defaultEntry!3019 newMap!16) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))))) b_lambda!6583)))

(declare-fun b_lambda!6585 () Bool)

(assert (= b_lambda!6571 (or (and b!146613 b_free!3137) (and b!146618 b_free!3139 (= (defaultEntry!3019 newMap!16) (defaultEntry!3019 (v!3364 (underlying!505 thiss!992))))) b_lambda!6585)))

(check-sat (not b!146839) (not bm!16423) (not d!46377) (not b_lambda!6585) (not bm!16359) (not b!147048) (not bm!16440) (not d!46333) (not bm!16429) (not bm!16480) (not b!146815) (not d!46365) (not b!146830) (not bm!16476) (not b!146988) (not b!146858) (not d!46389) (not b!146715) (not d!46387) (not bm!16427) (not d!46341) (not b!147031) (not mapNonEmpty!5038) (not b!146961) (not d!46385) (not b_lambda!6583) (not d!46347) (not d!46359) (not bm!16482) (not b!146844) (not b_lambda!6565) (not bm!16474) (not bm!16472) (not b!146825) (not d!46375) (not b!146869) (not b!147028) (not b!146765) (not b!147045) (not b!146721) (not bm!16364) (not bm!16467) (not b!147026) (not bm!16473) (not b!146867) (not b!147035) (not b!147053) (not d!46353) (not bm!16471) (not b!146755) (not d!46343) (not b!146827) (not b_lambda!6577) (not b!146856) (not b!146857) (not d!46351) (not d!46331) (not bm!16419) (not d!46357) (not d!46373) (not b!146724) (not b!146987) (not b!146716) (not b!146706) (not b!146754) (not bm!16468) (not b!146826) (not b!146822) (not b!147041) (not bm!16361) (not b!146751) (not bm!16469) (not bm!16470) (not b!146760) (not b!146832) (not d!46363) (not b!146758) (not b!146753) (not b!146752) (not bm!16479) (not b!146726) (not d!46361) tp_is_empty!2985 (not b!146723) (not bm!16430) (not d!46339) (not b_lambda!6581) (not b!146992) (not bm!16477) (not b!146973) (not b!146831) (not b!146956) (not b!147030) (not bm!16475) (not b!146809) (not b!147042) (not bm!16424) (not b!146714) (not bm!16486) (not b!146766) (not bm!16365) (not d!46383) b_and!9223 (not b!146725) (not bm!16432) (not b!146833) (not bm!16368) (not b_lambda!6579) (not b!146764) (not b!147051) (not bm!16485) (not b!147052) (not b!146980) (not d!46345) (not d!46329) (not b_next!3139) (not bm!16437) (not bm!16478) (not b!146761) (not d!46349) (not d!46355) (not b_next!3137) (not b!146722) (not b!146990) (not b!146816) (not b!146991) (not bm!16425) (not b!146763) (not b!147029) (not b!146707) (not mapNonEmpty!5037) (not d!46369) (not bm!16420) (not b!146819) (not bm!16344) (not bm!16438) b_and!9225)
(check-sat b_and!9223 b_and!9225 (not b_next!3137) (not b_next!3139))
