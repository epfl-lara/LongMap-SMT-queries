; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78872 () Bool)

(assert start!78872)

(declare-fun b_free!17085 () Bool)

(declare-fun b_next!17085 () Bool)

(assert (=> start!78872 (= b_free!17085 (not b_next!17085))))

(declare-fun tp!59695 () Bool)

(declare-fun b_and!27907 () Bool)

(assert (=> start!78872 (= tp!59695 b_and!27907)))

(declare-fun b!921707 () Bool)

(declare-fun e!517211 () Bool)

(declare-fun tp_is_empty!19593 () Bool)

(assert (=> b!921707 (= e!517211 tp_is_empty!19593)))

(declare-fun mapIsEmpty!31146 () Bool)

(declare-fun mapRes!31146 () Bool)

(assert (=> mapIsEmpty!31146 mapRes!31146))

(declare-fun b!921708 () Bool)

(declare-fun e!517210 () Bool)

(declare-fun e!517213 () Bool)

(assert (=> b!921708 (= e!517210 (and e!517213 mapRes!31146))))

(declare-fun condMapEmpty!31146 () Bool)

(declare-datatypes ((V!31089 0))(
  ( (V!31090 (val!9847 Int)) )
))
(declare-datatypes ((ValueCell!9315 0))(
  ( (ValueCellFull!9315 (v!12365 V!31089)) (EmptyCell!9315) )
))
(declare-datatypes ((array!55164 0))(
  ( (array!55165 (arr!26527 (Array (_ BitVec 32) ValueCell!9315)) (size!26986 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55164)

(declare-fun mapDefault!31146 () ValueCell!9315)

(assert (=> b!921708 (= condMapEmpty!31146 (= (arr!26527 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9315)) mapDefault!31146)))))

(declare-fun b!921709 () Bool)

(declare-fun e!517212 () Bool)

(declare-fun e!517208 () Bool)

(assert (=> b!921709 (= e!517212 (not e!517208))))

(declare-fun res!621580 () Bool)

(assert (=> b!921709 (=> res!621580 e!517208)))

(declare-datatypes ((array!55166 0))(
  ( (array!55167 (arr!26528 (Array (_ BitVec 32) (_ BitVec 64))) (size!26987 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55166)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921709 (= res!621580 (or (bvsge (size!26987 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26987 _keys!1487))))))

(declare-fun e!517205 () Bool)

(assert (=> b!921709 e!517205))

(declare-fun c!96129 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!921709 (= c!96129 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31098 0))(
  ( (Unit!31099) )
))
(declare-fun lt!413828 () Unit!31098)

(declare-fun zeroValue!1173 () V!31089)

(declare-fun minValue!1173 () V!31089)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!182 (array!55166 array!55164 (_ BitVec 32) (_ BitVec 32) V!31089 V!31089 (_ BitVec 64) (_ BitVec 32) Int) Unit!31098)

(assert (=> b!921709 (= lt!413828 (lemmaListMapContainsThenArrayContainsFrom!182 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(declare-datatypes ((List!18612 0))(
  ( (Nil!18609) (Cons!18608 (h!19754 (_ BitVec 64)) (t!26427 List!18612)) )
))
(declare-fun arrayNoDuplicates!0 (array!55166 (_ BitVec 32) List!18612) Bool)

(assert (=> b!921709 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18609)))

(declare-fun lt!413822 () Unit!31098)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55166 (_ BitVec 32) (_ BitVec 32)) Unit!31098)

(assert (=> b!921709 (= lt!413822 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12808 0))(
  ( (tuple2!12809 (_1!6415 (_ BitVec 64)) (_2!6415 V!31089)) )
))
(declare-datatypes ((List!18613 0))(
  ( (Nil!18610) (Cons!18609 (h!19755 tuple2!12808) (t!26428 List!18613)) )
))
(declare-datatypes ((ListLongMap!11505 0))(
  ( (ListLongMap!11506 (toList!5768 List!18613)) )
))
(declare-fun lt!413829 () ListLongMap!11505)

(declare-fun lt!413830 () tuple2!12808)

(declare-fun contains!4830 (ListLongMap!11505 (_ BitVec 64)) Bool)

(declare-fun +!2675 (ListLongMap!11505 tuple2!12808) ListLongMap!11505)

(assert (=> b!921709 (contains!4830 (+!2675 lt!413829 lt!413830) k0!1099)))

(declare-fun lt!413823 () (_ BitVec 64))

(declare-fun lt!413826 () Unit!31098)

(declare-fun lt!413824 () V!31089)

(declare-fun addStillContains!399 (ListLongMap!11505 (_ BitVec 64) V!31089 (_ BitVec 64)) Unit!31098)

(assert (=> b!921709 (= lt!413826 (addStillContains!399 lt!413829 lt!413823 lt!413824 k0!1099))))

(declare-fun getCurrentListMap!3022 (array!55166 array!55164 (_ BitVec 32) (_ BitVec 32) V!31089 V!31089 (_ BitVec 32) Int) ListLongMap!11505)

(assert (=> b!921709 (= (getCurrentListMap!3022 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2675 (getCurrentListMap!3022 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413830))))

(assert (=> b!921709 (= lt!413830 (tuple2!12809 lt!413823 lt!413824))))

(declare-fun get!13926 (ValueCell!9315 V!31089) V!31089)

(declare-fun dynLambda!1464 (Int (_ BitVec 64)) V!31089)

(assert (=> b!921709 (= lt!413824 (get!13926 (select (arr!26527 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1464 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413825 () Unit!31098)

(declare-fun lemmaListMapRecursiveValidKeyArray!65 (array!55166 array!55164 (_ BitVec 32) (_ BitVec 32) V!31089 V!31089 (_ BitVec 32) Int) Unit!31098)

(assert (=> b!921709 (= lt!413825 (lemmaListMapRecursiveValidKeyArray!65 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921710 () Bool)

(declare-fun e!517207 () Bool)

(declare-fun e!517209 () Bool)

(assert (=> b!921710 (= e!517207 e!517209)))

(declare-fun res!621579 () Bool)

(assert (=> b!921710 (=> (not res!621579) (not e!517209))))

(assert (=> b!921710 (= res!621579 (contains!4830 lt!413829 k0!1099))))

(assert (=> b!921710 (= lt!413829 (getCurrentListMap!3022 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921711 () Bool)

(assert (=> b!921711 (= e!517208 true)))

(declare-fun lt!413827 () Bool)

(declare-fun contains!4831 (List!18612 (_ BitVec 64)) Bool)

(assert (=> b!921711 (= lt!413827 (contains!4831 Nil!18609 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921712 () Bool)

(assert (=> b!921712 (= e!517205 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921713 () Bool)

(declare-fun res!621576 () Bool)

(assert (=> b!921713 (=> (not res!621576) (not e!517209))))

(assert (=> b!921713 (= res!621576 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31146 () Bool)

(declare-fun tp!59696 () Bool)

(assert (=> mapNonEmpty!31146 (= mapRes!31146 (and tp!59696 e!517211))))

(declare-fun mapKey!31146 () (_ BitVec 32))

(declare-fun mapValue!31146 () ValueCell!9315)

(declare-fun mapRest!31146 () (Array (_ BitVec 32) ValueCell!9315))

(assert (=> mapNonEmpty!31146 (= (arr!26527 _values!1231) (store mapRest!31146 mapKey!31146 mapValue!31146))))

(declare-fun b!921714 () Bool)

(declare-fun arrayContainsKey!0 (array!55166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921714 (= e!517205 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!921715 () Bool)

(declare-fun res!621582 () Bool)

(assert (=> b!921715 (=> (not res!621582) (not e!517207))))

(assert (=> b!921715 (= res!621582 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18609))))

(declare-fun b!921716 () Bool)

(declare-fun res!621578 () Bool)

(assert (=> b!921716 (=> (not res!621578) (not e!517207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55166 (_ BitVec 32)) Bool)

(assert (=> b!921716 (= res!621578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!621581 () Bool)

(assert (=> start!78872 (=> (not res!621581) (not e!517207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78872 (= res!621581 (validMask!0 mask!1881))))

(assert (=> start!78872 e!517207))

(assert (=> start!78872 true))

(assert (=> start!78872 tp_is_empty!19593))

(declare-fun array_inv!20666 (array!55164) Bool)

(assert (=> start!78872 (and (array_inv!20666 _values!1231) e!517210)))

(assert (=> start!78872 tp!59695))

(declare-fun array_inv!20667 (array!55166) Bool)

(assert (=> start!78872 (array_inv!20667 _keys!1487)))

(declare-fun b!921717 () Bool)

(assert (=> b!921717 (= e!517213 tp_is_empty!19593)))

(declare-fun b!921718 () Bool)

(declare-fun res!621575 () Bool)

(assert (=> b!921718 (=> (not res!621575) (not e!517209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921718 (= res!621575 (validKeyInArray!0 k0!1099))))

(declare-fun b!921719 () Bool)

(declare-fun res!621577 () Bool)

(assert (=> b!921719 (=> (not res!621577) (not e!517207))))

(assert (=> b!921719 (= res!621577 (and (= (size!26986 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26987 _keys!1487) (size!26986 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921720 () Bool)

(declare-fun res!621571 () Bool)

(assert (=> b!921720 (=> (not res!621571) (not e!517209))))

(declare-fun v!791 () V!31089)

(declare-fun apply!607 (ListLongMap!11505 (_ BitVec 64)) V!31089)

(assert (=> b!921720 (= res!621571 (= (apply!607 lt!413829 k0!1099) v!791))))

(declare-fun b!921721 () Bool)

(declare-fun res!621574 () Bool)

(assert (=> b!921721 (=> res!621574 e!517208)))

(declare-fun noDuplicate!1348 (List!18612) Bool)

(assert (=> b!921721 (= res!621574 (not (noDuplicate!1348 Nil!18609)))))

(declare-fun b!921722 () Bool)

(declare-fun res!621583 () Bool)

(assert (=> b!921722 (=> (not res!621583) (not e!517207))))

(assert (=> b!921722 (= res!621583 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26987 _keys!1487))))))

(declare-fun b!921723 () Bool)

(assert (=> b!921723 (= e!517209 e!517212)))

(declare-fun res!621573 () Bool)

(assert (=> b!921723 (=> (not res!621573) (not e!517212))))

(assert (=> b!921723 (= res!621573 (validKeyInArray!0 lt!413823))))

(assert (=> b!921723 (= lt!413823 (select (arr!26528 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!921724 () Bool)

(declare-fun res!621572 () Bool)

(assert (=> b!921724 (=> res!621572 e!517208)))

(assert (=> b!921724 (= res!621572 (contains!4831 Nil!18609 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!78872 res!621581) b!921719))

(assert (= (and b!921719 res!621577) b!921716))

(assert (= (and b!921716 res!621578) b!921715))

(assert (= (and b!921715 res!621582) b!921722))

(assert (= (and b!921722 res!621583) b!921710))

(assert (= (and b!921710 res!621579) b!921720))

(assert (= (and b!921720 res!621571) b!921713))

(assert (= (and b!921713 res!621576) b!921718))

(assert (= (and b!921718 res!621575) b!921723))

(assert (= (and b!921723 res!621573) b!921709))

(assert (= (and b!921709 c!96129) b!921714))

(assert (= (and b!921709 (not c!96129)) b!921712))

(assert (= (and b!921709 (not res!621580)) b!921721))

(assert (= (and b!921721 (not res!621574)) b!921724))

(assert (= (and b!921724 (not res!621572)) b!921711))

(assert (= (and b!921708 condMapEmpty!31146) mapIsEmpty!31146))

(assert (= (and b!921708 (not condMapEmpty!31146)) mapNonEmpty!31146))

(get-info :version)

(assert (= (and mapNonEmpty!31146 ((_ is ValueCellFull!9315) mapValue!31146)) b!921707))

(assert (= (and b!921708 ((_ is ValueCellFull!9315) mapDefault!31146)) b!921717))

(assert (= start!78872 b!921708))

(declare-fun b_lambda!13587 () Bool)

(assert (=> (not b_lambda!13587) (not b!921709)))

(declare-fun t!26426 () Bool)

(declare-fun tb!5665 () Bool)

(assert (=> (and start!78872 (= defaultEntry!1235 defaultEntry!1235) t!26426) tb!5665))

(declare-fun result!11153 () Bool)

(assert (=> tb!5665 (= result!11153 tp_is_empty!19593)))

(assert (=> b!921709 t!26426))

(declare-fun b_and!27909 () Bool)

(assert (= b_and!27907 (and (=> t!26426 result!11153) b_and!27909)))

(declare-fun m!855673 () Bool)

(assert (=> b!921715 m!855673))

(declare-fun m!855675 () Bool)

(assert (=> b!921723 m!855675))

(declare-fun m!855677 () Bool)

(assert (=> b!921723 m!855677))

(declare-fun m!855679 () Bool)

(assert (=> b!921724 m!855679))

(declare-fun m!855681 () Bool)

(assert (=> mapNonEmpty!31146 m!855681))

(declare-fun m!855683 () Bool)

(assert (=> b!921720 m!855683))

(declare-fun m!855685 () Bool)

(assert (=> b!921711 m!855685))

(declare-fun m!855687 () Bool)

(assert (=> b!921721 m!855687))

(declare-fun m!855689 () Bool)

(assert (=> b!921714 m!855689))

(declare-fun m!855691 () Bool)

(assert (=> start!78872 m!855691))

(declare-fun m!855693 () Bool)

(assert (=> start!78872 m!855693))

(declare-fun m!855695 () Bool)

(assert (=> start!78872 m!855695))

(declare-fun m!855697 () Bool)

(assert (=> b!921718 m!855697))

(declare-fun m!855699 () Bool)

(assert (=> b!921716 m!855699))

(declare-fun m!855701 () Bool)

(assert (=> b!921710 m!855701))

(declare-fun m!855703 () Bool)

(assert (=> b!921710 m!855703))

(declare-fun m!855705 () Bool)

(assert (=> b!921709 m!855705))

(declare-fun m!855707 () Bool)

(assert (=> b!921709 m!855707))

(declare-fun m!855709 () Bool)

(assert (=> b!921709 m!855709))

(declare-fun m!855711 () Bool)

(assert (=> b!921709 m!855711))

(declare-fun m!855713 () Bool)

(assert (=> b!921709 m!855713))

(declare-fun m!855715 () Bool)

(assert (=> b!921709 m!855715))

(declare-fun m!855717 () Bool)

(assert (=> b!921709 m!855717))

(declare-fun m!855719 () Bool)

(assert (=> b!921709 m!855719))

(assert (=> b!921709 m!855711))

(assert (=> b!921709 m!855713))

(declare-fun m!855721 () Bool)

(assert (=> b!921709 m!855721))

(declare-fun m!855723 () Bool)

(assert (=> b!921709 m!855723))

(declare-fun m!855725 () Bool)

(assert (=> b!921709 m!855725))

(assert (=> b!921709 m!855705))

(declare-fun m!855727 () Bool)

(assert (=> b!921709 m!855727))

(declare-fun m!855729 () Bool)

(assert (=> b!921709 m!855729))

(assert (=> b!921709 m!855717))

(check-sat (not start!78872) (not b!921723) (not b_next!17085) (not b!921715) (not b!921716) (not b!921724) (not b!921711) (not b!921709) (not b!921720) (not b!921721) tp_is_empty!19593 (not b!921714) (not b_lambda!13587) (not mapNonEmpty!31146) (not b!921718) b_and!27909 (not b!921710))
(check-sat b_and!27909 (not b_next!17085))
