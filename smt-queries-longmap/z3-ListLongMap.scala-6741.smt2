; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84622 () Bool)

(assert start!84622)

(declare-fun b_free!20005 () Bool)

(declare-fun b_next!20005 () Bool)

(assert (=> start!84622 (= b_free!20005 (not b_next!20005))))

(declare-fun tp!69796 () Bool)

(declare-fun b_and!32087 () Bool)

(assert (=> start!84622 (= tp!69796 b_and!32087)))

(declare-fun mapIsEmpty!36866 () Bool)

(declare-fun mapRes!36866 () Bool)

(assert (=> mapIsEmpty!36866 mapRes!36866))

(declare-fun b!988708 () Bool)

(declare-fun res!661170 () Bool)

(declare-fun e!557584 () Bool)

(assert (=> b!988708 (=> (not res!661170) (not e!557584))))

(declare-datatypes ((array!62446 0))(
  ( (array!62447 (arr!30074 (Array (_ BitVec 32) (_ BitVec 64))) (size!30554 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62446)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62446 (_ BitVec 32)) Bool)

(assert (=> b!988708 (= res!661170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988709 () Bool)

(declare-fun res!661163 () Bool)

(assert (=> b!988709 (=> (not res!661163) (not e!557584))))

(declare-datatypes ((V!35945 0))(
  ( (V!35946 (val!11661 Int)) )
))
(declare-datatypes ((ValueCell!11129 0))(
  ( (ValueCellFull!11129 (v!14222 V!35945)) (EmptyCell!11129) )
))
(declare-datatypes ((array!62448 0))(
  ( (array!62449 (arr!30075 (Array (_ BitVec 32) ValueCell!11129)) (size!30555 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62448)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988709 (= res!661163 (and (= (size!30555 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30554 _keys!1544) (size!30555 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36866 () Bool)

(declare-fun tp!69797 () Bool)

(declare-fun e!557581 () Bool)

(assert (=> mapNonEmpty!36866 (= mapRes!36866 (and tp!69797 e!557581))))

(declare-fun mapRest!36866 () (Array (_ BitVec 32) ValueCell!11129))

(declare-fun mapKey!36866 () (_ BitVec 32))

(declare-fun mapValue!36866 () ValueCell!11129)

(assert (=> mapNonEmpty!36866 (= (arr!30075 _values!1278) (store mapRest!36866 mapKey!36866 mapValue!36866))))

(declare-fun b!988710 () Bool)

(declare-fun e!557580 () Bool)

(assert (=> b!988710 (= e!557584 (not e!557580))))

(declare-fun res!661169 () Bool)

(assert (=> b!988710 (=> res!661169 e!557580)))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!988710 (= res!661169 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30074 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14880 0))(
  ( (tuple2!14881 (_1!7451 (_ BitVec 64)) (_2!7451 V!35945)) )
))
(declare-datatypes ((List!20786 0))(
  ( (Nil!20783) (Cons!20782 (h!21950 tuple2!14880) (t!29711 List!20786)) )
))
(declare-datatypes ((ListLongMap!13579 0))(
  ( (ListLongMap!13580 (toList!6805 List!20786)) )
))
(declare-fun lt!438406 () ListLongMap!13579)

(declare-fun lt!438403 () tuple2!14880)

(declare-fun lt!438401 () ListLongMap!13579)

(declare-fun lt!438398 () tuple2!14880)

(declare-fun +!3104 (ListLongMap!13579 tuple2!14880) ListLongMap!13579)

(assert (=> b!988710 (= (+!3104 lt!438401 lt!438398) (+!3104 lt!438406 lt!438403))))

(declare-fun lt!438402 () ListLongMap!13579)

(assert (=> b!988710 (= lt!438406 (+!3104 lt!438402 lt!438398))))

(declare-fun lt!438405 () V!35945)

(assert (=> b!988710 (= lt!438398 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))

(assert (=> b!988710 (= lt!438401 (+!3104 lt!438402 lt!438403))))

(declare-fun minValue!1220 () V!35945)

(assert (=> b!988710 (= lt!438403 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32782 0))(
  ( (Unit!32783) )
))
(declare-fun lt!438404 () Unit!32782)

(declare-fun addCommutativeForDiffKeys!707 (ListLongMap!13579 (_ BitVec 64) V!35945 (_ BitVec 64) V!35945) Unit!32782)

(assert (=> b!988710 (= lt!438404 (addCommutativeForDiffKeys!707 lt!438402 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30074 _keys!1544) from!1932) lt!438405))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15628 (ValueCell!11129 V!35945) V!35945)

(declare-fun dynLambda!1887 (Int (_ BitVec 64)) V!35945)

(assert (=> b!988710 (= lt!438405 (get!15628 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!438397 () ListLongMap!13579)

(declare-fun lt!438400 () tuple2!14880)

(assert (=> b!988710 (= lt!438402 (+!3104 lt!438397 lt!438400))))

(declare-fun zeroValue!1220 () V!35945)

(assert (=> b!988710 (= lt!438400 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3533 (array!62446 array!62448 (_ BitVec 32) (_ BitVec 32) V!35945 V!35945 (_ BitVec 32) Int) ListLongMap!13579)

(assert (=> b!988710 (= lt!438397 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988712 () Bool)

(declare-fun res!661168 () Bool)

(assert (=> b!988712 (=> (not res!661168) (not e!557584))))

(assert (=> b!988712 (= res!661168 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30554 _keys!1544))))))

(declare-fun b!988713 () Bool)

(declare-fun e!557579 () Bool)

(declare-fun tp_is_empty!23221 () Bool)

(assert (=> b!988713 (= e!557579 tp_is_empty!23221)))

(declare-fun b!988714 () Bool)

(declare-fun res!661167 () Bool)

(assert (=> b!988714 (=> (not res!661167) (not e!557584))))

(assert (=> b!988714 (= res!661167 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!661166 () Bool)

(assert (=> start!84622 (=> (not res!661166) (not e!557584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84622 (= res!661166 (validMask!0 mask!1948))))

(assert (=> start!84622 e!557584))

(assert (=> start!84622 true))

(assert (=> start!84622 tp_is_empty!23221))

(declare-fun e!557583 () Bool)

(declare-fun array_inv!23259 (array!62448) Bool)

(assert (=> start!84622 (and (array_inv!23259 _values!1278) e!557583)))

(assert (=> start!84622 tp!69796))

(declare-fun array_inv!23260 (array!62446) Bool)

(assert (=> start!84622 (array_inv!23260 _keys!1544)))

(declare-fun b!988711 () Bool)

(declare-fun res!661165 () Bool)

(assert (=> b!988711 (=> (not res!661165) (not e!557584))))

(declare-datatypes ((List!20787 0))(
  ( (Nil!20784) (Cons!20783 (h!21951 (_ BitVec 64)) (t!29712 List!20787)) )
))
(declare-fun arrayNoDuplicates!0 (array!62446 (_ BitVec 32) List!20787) Bool)

(assert (=> b!988711 (= res!661165 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20784))))

(declare-fun b!988715 () Bool)

(declare-fun getCurrentListMap!3865 (array!62446 array!62448 (_ BitVec 32) (_ BitVec 32) V!35945 V!35945 (_ BitVec 32) Int) ListLongMap!13579)

(assert (=> b!988715 (= e!557580 (= (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3104 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438398)))))

(assert (=> b!988715 (= lt!438406 (+!3104 (+!3104 lt!438397 lt!438398) lt!438400))))

(declare-fun lt!438399 () Unit!32782)

(assert (=> b!988715 (= lt!438399 (addCommutativeForDiffKeys!707 lt!438397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30074 _keys!1544) from!1932) lt!438405))))

(declare-fun b!988716 () Bool)

(assert (=> b!988716 (= e!557583 (and e!557579 mapRes!36866))))

(declare-fun condMapEmpty!36866 () Bool)

(declare-fun mapDefault!36866 () ValueCell!11129)

(assert (=> b!988716 (= condMapEmpty!36866 (= (arr!30075 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11129)) mapDefault!36866)))))

(declare-fun b!988717 () Bool)

(assert (=> b!988717 (= e!557581 tp_is_empty!23221)))

(declare-fun b!988718 () Bool)

(declare-fun res!661164 () Bool)

(assert (=> b!988718 (=> (not res!661164) (not e!557584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988718 (= res!661164 (validKeyInArray!0 (select (arr!30074 _keys!1544) from!1932)))))

(assert (= (and start!84622 res!661166) b!988709))

(assert (= (and b!988709 res!661163) b!988708))

(assert (= (and b!988708 res!661170) b!988711))

(assert (= (and b!988711 res!661165) b!988712))

(assert (= (and b!988712 res!661168) b!988718))

(assert (= (and b!988718 res!661164) b!988714))

(assert (= (and b!988714 res!661167) b!988710))

(assert (= (and b!988710 (not res!661169)) b!988715))

(assert (= (and b!988716 condMapEmpty!36866) mapIsEmpty!36866))

(assert (= (and b!988716 (not condMapEmpty!36866)) mapNonEmpty!36866))

(get-info :version)

(assert (= (and mapNonEmpty!36866 ((_ is ValueCellFull!11129) mapValue!36866)) b!988717))

(assert (= (and b!988716 ((_ is ValueCellFull!11129) mapDefault!36866)) b!988713))

(assert (= start!84622 b!988716))

(declare-fun b_lambda!15051 () Bool)

(assert (=> (not b_lambda!15051) (not b!988710)))

(declare-fun t!29710 () Bool)

(declare-fun tb!6775 () Bool)

(assert (=> (and start!84622 (= defaultEntry!1281 defaultEntry!1281) t!29710) tb!6775))

(declare-fun result!13551 () Bool)

(assert (=> tb!6775 (= result!13551 tp_is_empty!23221)))

(assert (=> b!988710 t!29710))

(declare-fun b_and!32089 () Bool)

(assert (= b_and!32087 (and (=> t!29710 result!13551) b_and!32089)))

(declare-fun m!915785 () Bool)

(assert (=> b!988718 m!915785))

(assert (=> b!988718 m!915785))

(declare-fun m!915787 () Bool)

(assert (=> b!988718 m!915787))

(assert (=> b!988715 m!915785))

(declare-fun m!915789 () Bool)

(assert (=> b!988715 m!915789))

(declare-fun m!915791 () Bool)

(assert (=> b!988715 m!915791))

(declare-fun m!915793 () Bool)

(assert (=> b!988715 m!915793))

(assert (=> b!988715 m!915785))

(declare-fun m!915795 () Bool)

(assert (=> b!988715 m!915795))

(assert (=> b!988715 m!915793))

(declare-fun m!915797 () Bool)

(assert (=> b!988715 m!915797))

(declare-fun m!915799 () Bool)

(assert (=> b!988715 m!915799))

(assert (=> b!988715 m!915789))

(declare-fun m!915801 () Bool)

(assert (=> start!84622 m!915801))

(declare-fun m!915803 () Bool)

(assert (=> start!84622 m!915803))

(declare-fun m!915805 () Bool)

(assert (=> start!84622 m!915805))

(assert (=> b!988710 m!915785))

(declare-fun m!915807 () Bool)

(assert (=> b!988710 m!915807))

(assert (=> b!988710 m!915785))

(declare-fun m!915809 () Bool)

(assert (=> b!988710 m!915809))

(declare-fun m!915811 () Bool)

(assert (=> b!988710 m!915811))

(declare-fun m!915813 () Bool)

(assert (=> b!988710 m!915813))

(declare-fun m!915815 () Bool)

(assert (=> b!988710 m!915815))

(declare-fun m!915817 () Bool)

(assert (=> b!988710 m!915817))

(declare-fun m!915819 () Bool)

(assert (=> b!988710 m!915819))

(declare-fun m!915821 () Bool)

(assert (=> b!988710 m!915821))

(declare-fun m!915823 () Bool)

(assert (=> b!988710 m!915823))

(assert (=> b!988710 m!915809))

(assert (=> b!988710 m!915823))

(declare-fun m!915825 () Bool)

(assert (=> b!988710 m!915825))

(declare-fun m!915827 () Bool)

(assert (=> mapNonEmpty!36866 m!915827))

(declare-fun m!915829 () Bool)

(assert (=> b!988708 m!915829))

(declare-fun m!915831 () Bool)

(assert (=> b!988711 m!915831))

(check-sat (not b_lambda!15051) (not b!988711) (not b!988718) (not b!988710) (not b!988708) b_and!32089 (not b!988715) (not b_next!20005) (not start!84622) tp_is_empty!23221 (not mapNonEmpty!36866))
(check-sat b_and!32089 (not b_next!20005))
(get-model)

(declare-fun b_lambda!15057 () Bool)

(assert (= b_lambda!15051 (or (and start!84622 b_free!20005) b_lambda!15057)))

(check-sat (not b!988711) (not b!988718) (not b!988710) (not b!988708) b_and!32089 (not b!988715) (not b_next!20005) (not start!84622) tp_is_empty!23221 (not mapNonEmpty!36866) (not b_lambda!15057))
(check-sat b_and!32089 (not b_next!20005))
(get-model)

(declare-fun d!117281 () Bool)

(assert (=> d!117281 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84622 d!117281))

(declare-fun d!117283 () Bool)

(assert (=> d!117283 (= (array_inv!23259 _values!1278) (bvsge (size!30555 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84622 d!117283))

(declare-fun d!117285 () Bool)

(assert (=> d!117285 (= (array_inv!23260 _keys!1544) (bvsge (size!30554 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84622 d!117285))

(declare-fun d!117287 () Bool)

(assert (=> d!117287 (= (+!3104 (+!3104 lt!438402 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (+!3104 (+!3104 lt!438402 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun lt!438469 () Unit!32782)

(declare-fun choose!1611 (ListLongMap!13579 (_ BitVec 64) V!35945 (_ BitVec 64) V!35945) Unit!32782)

(assert (=> d!117287 (= lt!438469 (choose!1611 lt!438402 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30074 _keys!1544) from!1932) lt!438405))))

(assert (=> d!117287 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30074 _keys!1544) from!1932)))))

(assert (=> d!117287 (= (addCommutativeForDiffKeys!707 lt!438402 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30074 _keys!1544) from!1932) lt!438405) lt!438469)))

(declare-fun bs!28044 () Bool)

(assert (= bs!28044 d!117287))

(assert (=> bs!28044 m!915785))

(declare-fun m!915929 () Bool)

(assert (=> bs!28044 m!915929))

(declare-fun m!915931 () Bool)

(assert (=> bs!28044 m!915931))

(declare-fun m!915933 () Bool)

(assert (=> bs!28044 m!915933))

(assert (=> bs!28044 m!915933))

(declare-fun m!915935 () Bool)

(assert (=> bs!28044 m!915935))

(assert (=> bs!28044 m!915931))

(declare-fun m!915937 () Bool)

(assert (=> bs!28044 m!915937))

(assert (=> b!988710 d!117287))

(declare-fun d!117289 () Bool)

(declare-fun c!100346 () Bool)

(assert (=> d!117289 (= c!100346 ((_ is ValueCellFull!11129) (select (arr!30075 _values!1278) from!1932)))))

(declare-fun e!557623 () V!35945)

(assert (=> d!117289 (= (get!15628 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557623)))

(declare-fun b!988795 () Bool)

(declare-fun get!15631 (ValueCell!11129 V!35945) V!35945)

(assert (=> b!988795 (= e!557623 (get!15631 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988796 () Bool)

(declare-fun get!15632 (ValueCell!11129 V!35945) V!35945)

(assert (=> b!988796 (= e!557623 (get!15632 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117289 c!100346) b!988795))

(assert (= (and d!117289 (not c!100346)) b!988796))

(assert (=> b!988795 m!915809))

(assert (=> b!988795 m!915823))

(declare-fun m!915939 () Bool)

(assert (=> b!988795 m!915939))

(assert (=> b!988796 m!915809))

(assert (=> b!988796 m!915823))

(declare-fun m!915941 () Bool)

(assert (=> b!988796 m!915941))

(assert (=> b!988710 d!117289))

(declare-fun b!988821 () Bool)

(declare-fun res!661227 () Bool)

(declare-fun e!557638 () Bool)

(assert (=> b!988821 (=> (not res!661227) (not e!557638))))

(declare-fun lt!438484 () ListLongMap!13579)

(declare-fun contains!5735 (ListLongMap!13579 (_ BitVec 64)) Bool)

(assert (=> b!988821 (= res!661227 (not (contains!5735 lt!438484 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988822 () Bool)

(declare-fun e!557643 () Bool)

(declare-fun e!557642 () Bool)

(assert (=> b!988822 (= e!557643 e!557642)))

(assert (=> b!988822 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))

(declare-fun res!661229 () Bool)

(assert (=> b!988822 (= res!661229 (contains!5735 lt!438484 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988822 (=> (not res!661229) (not e!557642))))

(declare-fun b!988823 () Bool)

(declare-fun e!557644 () ListLongMap!13579)

(declare-fun call!41859 () ListLongMap!13579)

(assert (=> b!988823 (= e!557644 call!41859)))

(declare-fun b!988824 () Bool)

(assert (=> b!988824 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))

(assert (=> b!988824 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30555 _values!1278)))))

(declare-fun apply!902 (ListLongMap!13579 (_ BitVec 64)) V!35945)

(assert (=> b!988824 (= e!557642 (= (apply!902 lt!438484 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!988825 () Bool)

(declare-fun e!557641 () Bool)

(assert (=> b!988825 (= e!557641 (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988825 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!988826 () Bool)

(declare-fun e!557640 () ListLongMap!13579)

(assert (=> b!988826 (= e!557640 (ListLongMap!13580 Nil!20783))))

(declare-fun b!988827 () Bool)

(declare-fun e!557639 () Bool)

(declare-fun isEmpty!726 (ListLongMap!13579) Bool)

(assert (=> b!988827 (= e!557639 (isEmpty!726 lt!438484))))

(declare-fun bm!41856 () Bool)

(assert (=> bm!41856 (= call!41859 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988828 () Bool)

(assert (=> b!988828 (= e!557638 e!557643)))

(declare-fun c!100358 () Bool)

(assert (=> b!988828 (= c!100358 e!557641)))

(declare-fun res!661228 () Bool)

(assert (=> b!988828 (=> (not res!661228) (not e!557641))))

(assert (=> b!988828 (= res!661228 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))

(declare-fun b!988829 () Bool)

(declare-fun lt!438485 () Unit!32782)

(declare-fun lt!438487 () Unit!32782)

(assert (=> b!988829 (= lt!438485 lt!438487)))

(declare-fun lt!438490 () ListLongMap!13579)

(declare-fun lt!438488 () (_ BitVec 64))

(declare-fun lt!438486 () (_ BitVec 64))

(declare-fun lt!438489 () V!35945)

(assert (=> b!988829 (not (contains!5735 (+!3104 lt!438490 (tuple2!14881 lt!438488 lt!438489)) lt!438486))))

(declare-fun addStillNotContains!234 (ListLongMap!13579 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32782)

(assert (=> b!988829 (= lt!438487 (addStillNotContains!234 lt!438490 lt!438488 lt!438489 lt!438486))))

(assert (=> b!988829 (= lt!438486 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988829 (= lt!438489 (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988829 (= lt!438488 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!988829 (= lt!438490 call!41859)))

(assert (=> b!988829 (= e!557644 (+!3104 call!41859 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!988831 () Bool)

(assert (=> b!988831 (= e!557643 e!557639)))

(declare-fun c!100356 () Bool)

(assert (=> b!988831 (= c!100356 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))

(declare-fun b!988832 () Bool)

(assert (=> b!988832 (= e!557640 e!557644)))

(declare-fun c!100355 () Bool)

(assert (=> b!988832 (= c!100355 (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun d!117291 () Bool)

(assert (=> d!117291 e!557638))

(declare-fun res!661230 () Bool)

(assert (=> d!117291 (=> (not res!661230) (not e!557638))))

(assert (=> d!117291 (= res!661230 (not (contains!5735 lt!438484 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117291 (= lt!438484 e!557640)))

(declare-fun c!100357 () Bool)

(assert (=> d!117291 (= c!100357 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))

(assert (=> d!117291 (validMask!0 mask!1948)))

(assert (=> d!117291 (= (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438484)))

(declare-fun b!988830 () Bool)

(assert (=> b!988830 (= e!557639 (= lt!438484 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(assert (= (and d!117291 c!100357) b!988826))

(assert (= (and d!117291 (not c!100357)) b!988832))

(assert (= (and b!988832 c!100355) b!988829))

(assert (= (and b!988832 (not c!100355)) b!988823))

(assert (= (or b!988829 b!988823) bm!41856))

(assert (= (and d!117291 res!661230) b!988821))

(assert (= (and b!988821 res!661227) b!988828))

(assert (= (and b!988828 res!661228) b!988825))

(assert (= (and b!988828 c!100358) b!988822))

(assert (= (and b!988828 (not c!100358)) b!988831))

(assert (= (and b!988822 res!661229) b!988824))

(assert (= (and b!988831 c!100356) b!988830))

(assert (= (and b!988831 (not c!100356)) b!988827))

(declare-fun b_lambda!15059 () Bool)

(assert (=> (not b_lambda!15059) (not b!988824)))

(assert (=> b!988824 t!29710))

(declare-fun b_and!32099 () Bool)

(assert (= b_and!32089 (and (=> t!29710 result!13551) b_and!32099)))

(declare-fun b_lambda!15061 () Bool)

(assert (=> (not b_lambda!15061) (not b!988829)))

(assert (=> b!988829 t!29710))

(declare-fun b_and!32101 () Bool)

(assert (= b_and!32099 (and (=> t!29710 result!13551) b_and!32101)))

(declare-fun m!915943 () Bool)

(assert (=> b!988830 m!915943))

(declare-fun m!915945 () Bool)

(assert (=> b!988822 m!915945))

(assert (=> b!988822 m!915945))

(declare-fun m!915947 () Bool)

(assert (=> b!988822 m!915947))

(declare-fun m!915949 () Bool)

(assert (=> b!988821 m!915949))

(assert (=> b!988825 m!915945))

(assert (=> b!988825 m!915945))

(declare-fun m!915951 () Bool)

(assert (=> b!988825 m!915951))

(declare-fun m!915953 () Bool)

(assert (=> b!988827 m!915953))

(declare-fun m!915955 () Bool)

(assert (=> d!117291 m!915955))

(assert (=> d!117291 m!915801))

(assert (=> b!988832 m!915945))

(assert (=> b!988832 m!915945))

(assert (=> b!988832 m!915951))

(assert (=> bm!41856 m!915943))

(assert (=> b!988824 m!915823))

(assert (=> b!988824 m!915945))

(declare-fun m!915957 () Bool)

(assert (=> b!988824 m!915957))

(declare-fun m!915959 () Bool)

(assert (=> b!988824 m!915959))

(assert (=> b!988824 m!915959))

(assert (=> b!988824 m!915823))

(declare-fun m!915961 () Bool)

(assert (=> b!988824 m!915961))

(assert (=> b!988824 m!915945))

(declare-fun m!915963 () Bool)

(assert (=> b!988829 m!915963))

(declare-fun m!915965 () Bool)

(assert (=> b!988829 m!915965))

(declare-fun m!915967 () Bool)

(assert (=> b!988829 m!915967))

(assert (=> b!988829 m!915823))

(assert (=> b!988829 m!915959))

(assert (=> b!988829 m!915959))

(assert (=> b!988829 m!915823))

(assert (=> b!988829 m!915961))

(assert (=> b!988829 m!915965))

(assert (=> b!988829 m!915945))

(declare-fun m!915969 () Bool)

(assert (=> b!988829 m!915969))

(assert (=> b!988710 d!117291))

(declare-fun d!117293 () Bool)

(declare-fun e!557647 () Bool)

(assert (=> d!117293 e!557647))

(declare-fun res!661236 () Bool)

(assert (=> d!117293 (=> (not res!661236) (not e!557647))))

(declare-fun lt!438502 () ListLongMap!13579)

(assert (=> d!117293 (= res!661236 (contains!5735 lt!438502 (_1!7451 lt!438398)))))

(declare-fun lt!438501 () List!20786)

(assert (=> d!117293 (= lt!438502 (ListLongMap!13580 lt!438501))))

(declare-fun lt!438499 () Unit!32782)

(declare-fun lt!438500 () Unit!32782)

(assert (=> d!117293 (= lt!438499 lt!438500)))

(declare-datatypes ((Option!516 0))(
  ( (Some!515 (v!14225 V!35945)) (None!514) )
))
(declare-fun getValueByKey!510 (List!20786 (_ BitVec 64)) Option!516)

(assert (=> d!117293 (= (getValueByKey!510 lt!438501 (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398)))))

(declare-fun lemmaContainsTupThenGetReturnValue!272 (List!20786 (_ BitVec 64) V!35945) Unit!32782)

(assert (=> d!117293 (= lt!438500 (lemmaContainsTupThenGetReturnValue!272 lt!438501 (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(declare-fun insertStrictlySorted!329 (List!20786 (_ BitVec 64) V!35945) List!20786)

(assert (=> d!117293 (= lt!438501 (insertStrictlySorted!329 (toList!6805 lt!438401) (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(assert (=> d!117293 (= (+!3104 lt!438401 lt!438398) lt!438502)))

(declare-fun b!988837 () Bool)

(declare-fun res!661235 () Bool)

(assert (=> b!988837 (=> (not res!661235) (not e!557647))))

(assert (=> b!988837 (= res!661235 (= (getValueByKey!510 (toList!6805 lt!438502) (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398))))))

(declare-fun b!988838 () Bool)

(declare-fun contains!5736 (List!20786 tuple2!14880) Bool)

(assert (=> b!988838 (= e!557647 (contains!5736 (toList!6805 lt!438502) lt!438398))))

(assert (= (and d!117293 res!661236) b!988837))

(assert (= (and b!988837 res!661235) b!988838))

(declare-fun m!915971 () Bool)

(assert (=> d!117293 m!915971))

(declare-fun m!915973 () Bool)

(assert (=> d!117293 m!915973))

(declare-fun m!915975 () Bool)

(assert (=> d!117293 m!915975))

(declare-fun m!915977 () Bool)

(assert (=> d!117293 m!915977))

(declare-fun m!915979 () Bool)

(assert (=> b!988837 m!915979))

(declare-fun m!915981 () Bool)

(assert (=> b!988838 m!915981))

(assert (=> b!988710 d!117293))

(declare-fun d!117295 () Bool)

(declare-fun e!557648 () Bool)

(assert (=> d!117295 e!557648))

(declare-fun res!661238 () Bool)

(assert (=> d!117295 (=> (not res!661238) (not e!557648))))

(declare-fun lt!438506 () ListLongMap!13579)

(assert (=> d!117295 (= res!661238 (contains!5735 lt!438506 (_1!7451 lt!438400)))))

(declare-fun lt!438505 () List!20786)

(assert (=> d!117295 (= lt!438506 (ListLongMap!13580 lt!438505))))

(declare-fun lt!438503 () Unit!32782)

(declare-fun lt!438504 () Unit!32782)

(assert (=> d!117295 (= lt!438503 lt!438504)))

(assert (=> d!117295 (= (getValueByKey!510 lt!438505 (_1!7451 lt!438400)) (Some!515 (_2!7451 lt!438400)))))

(assert (=> d!117295 (= lt!438504 (lemmaContainsTupThenGetReturnValue!272 lt!438505 (_1!7451 lt!438400) (_2!7451 lt!438400)))))

(assert (=> d!117295 (= lt!438505 (insertStrictlySorted!329 (toList!6805 lt!438397) (_1!7451 lt!438400) (_2!7451 lt!438400)))))

(assert (=> d!117295 (= (+!3104 lt!438397 lt!438400) lt!438506)))

(declare-fun b!988839 () Bool)

(declare-fun res!661237 () Bool)

(assert (=> b!988839 (=> (not res!661237) (not e!557648))))

(assert (=> b!988839 (= res!661237 (= (getValueByKey!510 (toList!6805 lt!438506) (_1!7451 lt!438400)) (Some!515 (_2!7451 lt!438400))))))

(declare-fun b!988840 () Bool)

(assert (=> b!988840 (= e!557648 (contains!5736 (toList!6805 lt!438506) lt!438400))))

(assert (= (and d!117295 res!661238) b!988839))

(assert (= (and b!988839 res!661237) b!988840))

(declare-fun m!915983 () Bool)

(assert (=> d!117295 m!915983))

(declare-fun m!915985 () Bool)

(assert (=> d!117295 m!915985))

(declare-fun m!915987 () Bool)

(assert (=> d!117295 m!915987))

(declare-fun m!915989 () Bool)

(assert (=> d!117295 m!915989))

(declare-fun m!915991 () Bool)

(assert (=> b!988839 m!915991))

(declare-fun m!915993 () Bool)

(assert (=> b!988840 m!915993))

(assert (=> b!988710 d!117295))

(declare-fun d!117297 () Bool)

(declare-fun e!557649 () Bool)

(assert (=> d!117297 e!557649))

(declare-fun res!661240 () Bool)

(assert (=> d!117297 (=> (not res!661240) (not e!557649))))

(declare-fun lt!438510 () ListLongMap!13579)

(assert (=> d!117297 (= res!661240 (contains!5735 lt!438510 (_1!7451 lt!438398)))))

(declare-fun lt!438509 () List!20786)

(assert (=> d!117297 (= lt!438510 (ListLongMap!13580 lt!438509))))

(declare-fun lt!438507 () Unit!32782)

(declare-fun lt!438508 () Unit!32782)

(assert (=> d!117297 (= lt!438507 lt!438508)))

(assert (=> d!117297 (= (getValueByKey!510 lt!438509 (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398)))))

(assert (=> d!117297 (= lt!438508 (lemmaContainsTupThenGetReturnValue!272 lt!438509 (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(assert (=> d!117297 (= lt!438509 (insertStrictlySorted!329 (toList!6805 lt!438402) (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(assert (=> d!117297 (= (+!3104 lt!438402 lt!438398) lt!438510)))

(declare-fun b!988841 () Bool)

(declare-fun res!661239 () Bool)

(assert (=> b!988841 (=> (not res!661239) (not e!557649))))

(assert (=> b!988841 (= res!661239 (= (getValueByKey!510 (toList!6805 lt!438510) (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398))))))

(declare-fun b!988842 () Bool)

(assert (=> b!988842 (= e!557649 (contains!5736 (toList!6805 lt!438510) lt!438398))))

(assert (= (and d!117297 res!661240) b!988841))

(assert (= (and b!988841 res!661239) b!988842))

(declare-fun m!915995 () Bool)

(assert (=> d!117297 m!915995))

(declare-fun m!915997 () Bool)

(assert (=> d!117297 m!915997))

(declare-fun m!915999 () Bool)

(assert (=> d!117297 m!915999))

(declare-fun m!916001 () Bool)

(assert (=> d!117297 m!916001))

(declare-fun m!916003 () Bool)

(assert (=> b!988841 m!916003))

(declare-fun m!916005 () Bool)

(assert (=> b!988842 m!916005))

(assert (=> b!988710 d!117297))

(declare-fun d!117299 () Bool)

(declare-fun e!557650 () Bool)

(assert (=> d!117299 e!557650))

(declare-fun res!661242 () Bool)

(assert (=> d!117299 (=> (not res!661242) (not e!557650))))

(declare-fun lt!438514 () ListLongMap!13579)

(assert (=> d!117299 (= res!661242 (contains!5735 lt!438514 (_1!7451 lt!438403)))))

(declare-fun lt!438513 () List!20786)

(assert (=> d!117299 (= lt!438514 (ListLongMap!13580 lt!438513))))

(declare-fun lt!438511 () Unit!32782)

(declare-fun lt!438512 () Unit!32782)

(assert (=> d!117299 (= lt!438511 lt!438512)))

(assert (=> d!117299 (= (getValueByKey!510 lt!438513 (_1!7451 lt!438403)) (Some!515 (_2!7451 lt!438403)))))

(assert (=> d!117299 (= lt!438512 (lemmaContainsTupThenGetReturnValue!272 lt!438513 (_1!7451 lt!438403) (_2!7451 lt!438403)))))

(assert (=> d!117299 (= lt!438513 (insertStrictlySorted!329 (toList!6805 lt!438406) (_1!7451 lt!438403) (_2!7451 lt!438403)))))

(assert (=> d!117299 (= (+!3104 lt!438406 lt!438403) lt!438514)))

(declare-fun b!988843 () Bool)

(declare-fun res!661241 () Bool)

(assert (=> b!988843 (=> (not res!661241) (not e!557650))))

(assert (=> b!988843 (= res!661241 (= (getValueByKey!510 (toList!6805 lt!438514) (_1!7451 lt!438403)) (Some!515 (_2!7451 lt!438403))))))

(declare-fun b!988844 () Bool)

(assert (=> b!988844 (= e!557650 (contains!5736 (toList!6805 lt!438514) lt!438403))))

(assert (= (and d!117299 res!661242) b!988843))

(assert (= (and b!988843 res!661241) b!988844))

(declare-fun m!916007 () Bool)

(assert (=> d!117299 m!916007))

(declare-fun m!916009 () Bool)

(assert (=> d!117299 m!916009))

(declare-fun m!916011 () Bool)

(assert (=> d!117299 m!916011))

(declare-fun m!916013 () Bool)

(assert (=> d!117299 m!916013))

(declare-fun m!916015 () Bool)

(assert (=> b!988843 m!916015))

(declare-fun m!916017 () Bool)

(assert (=> b!988844 m!916017))

(assert (=> b!988710 d!117299))

(declare-fun d!117301 () Bool)

(declare-fun e!557651 () Bool)

(assert (=> d!117301 e!557651))

(declare-fun res!661244 () Bool)

(assert (=> d!117301 (=> (not res!661244) (not e!557651))))

(declare-fun lt!438518 () ListLongMap!13579)

(assert (=> d!117301 (= res!661244 (contains!5735 lt!438518 (_1!7451 lt!438403)))))

(declare-fun lt!438517 () List!20786)

(assert (=> d!117301 (= lt!438518 (ListLongMap!13580 lt!438517))))

(declare-fun lt!438515 () Unit!32782)

(declare-fun lt!438516 () Unit!32782)

(assert (=> d!117301 (= lt!438515 lt!438516)))

(assert (=> d!117301 (= (getValueByKey!510 lt!438517 (_1!7451 lt!438403)) (Some!515 (_2!7451 lt!438403)))))

(assert (=> d!117301 (= lt!438516 (lemmaContainsTupThenGetReturnValue!272 lt!438517 (_1!7451 lt!438403) (_2!7451 lt!438403)))))

(assert (=> d!117301 (= lt!438517 (insertStrictlySorted!329 (toList!6805 lt!438402) (_1!7451 lt!438403) (_2!7451 lt!438403)))))

(assert (=> d!117301 (= (+!3104 lt!438402 lt!438403) lt!438518)))

(declare-fun b!988845 () Bool)

(declare-fun res!661243 () Bool)

(assert (=> b!988845 (=> (not res!661243) (not e!557651))))

(assert (=> b!988845 (= res!661243 (= (getValueByKey!510 (toList!6805 lt!438518) (_1!7451 lt!438403)) (Some!515 (_2!7451 lt!438403))))))

(declare-fun b!988846 () Bool)

(assert (=> b!988846 (= e!557651 (contains!5736 (toList!6805 lt!438518) lt!438403))))

(assert (= (and d!117301 res!661244) b!988845))

(assert (= (and b!988845 res!661243) b!988846))

(declare-fun m!916019 () Bool)

(assert (=> d!117301 m!916019))

(declare-fun m!916021 () Bool)

(assert (=> d!117301 m!916021))

(declare-fun m!916023 () Bool)

(assert (=> d!117301 m!916023))

(declare-fun m!916025 () Bool)

(assert (=> d!117301 m!916025))

(declare-fun m!916027 () Bool)

(assert (=> b!988845 m!916027))

(declare-fun m!916029 () Bool)

(assert (=> b!988846 m!916029))

(assert (=> b!988710 d!117301))

(declare-fun d!117303 () Bool)

(declare-fun e!557652 () Bool)

(assert (=> d!117303 e!557652))

(declare-fun res!661246 () Bool)

(assert (=> d!117303 (=> (not res!661246) (not e!557652))))

(declare-fun lt!438522 () ListLongMap!13579)

(assert (=> d!117303 (= res!661246 (contains!5735 lt!438522 (_1!7451 lt!438398)))))

(declare-fun lt!438521 () List!20786)

(assert (=> d!117303 (= lt!438522 (ListLongMap!13580 lt!438521))))

(declare-fun lt!438519 () Unit!32782)

(declare-fun lt!438520 () Unit!32782)

(assert (=> d!117303 (= lt!438519 lt!438520)))

(assert (=> d!117303 (= (getValueByKey!510 lt!438521 (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398)))))

(assert (=> d!117303 (= lt!438520 (lemmaContainsTupThenGetReturnValue!272 lt!438521 (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(assert (=> d!117303 (= lt!438521 (insertStrictlySorted!329 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(assert (=> d!117303 (= (+!3104 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438398) lt!438522)))

(declare-fun b!988847 () Bool)

(declare-fun res!661245 () Bool)

(assert (=> b!988847 (=> (not res!661245) (not e!557652))))

(assert (=> b!988847 (= res!661245 (= (getValueByKey!510 (toList!6805 lt!438522) (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398))))))

(declare-fun b!988848 () Bool)

(assert (=> b!988848 (= e!557652 (contains!5736 (toList!6805 lt!438522) lt!438398))))

(assert (= (and d!117303 res!661246) b!988847))

(assert (= (and b!988847 res!661245) b!988848))

(declare-fun m!916031 () Bool)

(assert (=> d!117303 m!916031))

(declare-fun m!916033 () Bool)

(assert (=> d!117303 m!916033))

(declare-fun m!916035 () Bool)

(assert (=> d!117303 m!916035))

(declare-fun m!916037 () Bool)

(assert (=> d!117303 m!916037))

(declare-fun m!916039 () Bool)

(assert (=> b!988847 m!916039))

(declare-fun m!916041 () Bool)

(assert (=> b!988848 m!916041))

(assert (=> b!988715 d!117303))

(declare-fun d!117305 () Bool)

(assert (=> d!117305 (= (+!3104 (+!3104 lt!438397 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (+!3104 (+!3104 lt!438397 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun lt!438523 () Unit!32782)

(assert (=> d!117305 (= lt!438523 (choose!1611 lt!438397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30074 _keys!1544) from!1932) lt!438405))))

(assert (=> d!117305 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30074 _keys!1544) from!1932)))))

(assert (=> d!117305 (= (addCommutativeForDiffKeys!707 lt!438397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30074 _keys!1544) from!1932) lt!438405) lt!438523)))

(declare-fun bs!28045 () Bool)

(assert (= bs!28045 d!117305))

(assert (=> bs!28045 m!915785))

(declare-fun m!916043 () Bool)

(assert (=> bs!28045 m!916043))

(declare-fun m!916045 () Bool)

(assert (=> bs!28045 m!916045))

(declare-fun m!916047 () Bool)

(assert (=> bs!28045 m!916047))

(assert (=> bs!28045 m!916047))

(declare-fun m!916049 () Bool)

(assert (=> bs!28045 m!916049))

(assert (=> bs!28045 m!916045))

(declare-fun m!916051 () Bool)

(assert (=> bs!28045 m!916051))

(assert (=> b!988715 d!117305))

(declare-fun bm!41871 () Bool)

(declare-fun call!41878 () ListLongMap!13579)

(declare-fun call!41877 () ListLongMap!13579)

(assert (=> bm!41871 (= call!41878 call!41877)))

(declare-fun bm!41872 () Bool)

(declare-fun call!41880 () ListLongMap!13579)

(assert (=> bm!41872 (= call!41880 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun bm!41873 () Bool)

(declare-fun call!41875 () Bool)

(declare-fun lt!438585 () ListLongMap!13579)

(assert (=> bm!41873 (= call!41875 (contains!5735 lt!438585 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988891 () Bool)

(declare-fun e!557684 () ListLongMap!13579)

(declare-fun e!557682 () ListLongMap!13579)

(assert (=> b!988891 (= e!557684 e!557682)))

(declare-fun c!100373 () Bool)

(assert (=> b!988891 (= c!100373 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!557685 () Bool)

(declare-fun b!988892 () Bool)

(assert (=> b!988892 (= e!557685 (= (apply!902 lt!438585 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988892 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30555 _values!1278)))))

(assert (=> b!988892 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))

(declare-fun b!988893 () Bool)

(declare-fun e!557686 () Bool)

(declare-fun e!557689 () Bool)

(assert (=> b!988893 (= e!557686 e!557689)))

(declare-fun res!661272 () Bool)

(assert (=> b!988893 (= res!661272 call!41875)))

(assert (=> b!988893 (=> (not res!661272) (not e!557689))))

(declare-fun b!988894 () Bool)

(declare-fun e!557680 () Bool)

(assert (=> b!988894 (= e!557680 (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988895 () Bool)

(declare-fun e!557688 () Bool)

(declare-fun e!557691 () Bool)

(assert (=> b!988895 (= e!557688 e!557691)))

(declare-fun res!661266 () Bool)

(declare-fun call!41879 () Bool)

(assert (=> b!988895 (= res!661266 call!41879)))

(assert (=> b!988895 (=> (not res!661266) (not e!557691))))

(declare-fun b!988896 () Bool)

(declare-fun c!100371 () Bool)

(assert (=> b!988896 (= c!100371 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!557679 () ListLongMap!13579)

(assert (=> b!988896 (= e!557682 e!557679)))

(declare-fun b!988897 () Bool)

(declare-fun res!661269 () Bool)

(declare-fun e!557687 () Bool)

(assert (=> b!988897 (=> (not res!661269) (not e!557687))))

(assert (=> b!988897 (= res!661269 e!557688)))

(declare-fun c!100372 () Bool)

(assert (=> b!988897 (= c!100372 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!988898 () Bool)

(assert (=> b!988898 (= e!557687 e!557686)))

(declare-fun c!100376 () Bool)

(assert (=> b!988898 (= c!100376 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!988899 () Bool)

(assert (=> b!988899 (= e!557689 (= (apply!902 lt!438585 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!988900 () Bool)

(declare-fun e!557683 () Bool)

(assert (=> b!988900 (= e!557683 (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun bm!41875 () Bool)

(declare-fun call!41876 () ListLongMap!13579)

(assert (=> bm!41875 (= call!41876 call!41880)))

(declare-fun b!988901 () Bool)

(declare-fun e!557690 () Unit!32782)

(declare-fun Unit!32788 () Unit!32782)

(assert (=> b!988901 (= e!557690 Unit!32788)))

(declare-fun b!988902 () Bool)

(declare-fun lt!438571 () Unit!32782)

(assert (=> b!988902 (= e!557690 lt!438571)))

(declare-fun lt!438572 () ListLongMap!13579)

(assert (=> b!988902 (= lt!438572 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438576 () (_ BitVec 64))

(assert (=> b!988902 (= lt!438576 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438580 () (_ BitVec 64))

(assert (=> b!988902 (= lt!438580 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438582 () Unit!32782)

(declare-fun addStillContains!614 (ListLongMap!13579 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32782)

(assert (=> b!988902 (= lt!438582 (addStillContains!614 lt!438572 lt!438576 zeroValue!1220 lt!438580))))

(assert (=> b!988902 (contains!5735 (+!3104 lt!438572 (tuple2!14881 lt!438576 zeroValue!1220)) lt!438580)))

(declare-fun lt!438569 () Unit!32782)

(assert (=> b!988902 (= lt!438569 lt!438582)))

(declare-fun lt!438574 () ListLongMap!13579)

(assert (=> b!988902 (= lt!438574 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438587 () (_ BitVec 64))

(assert (=> b!988902 (= lt!438587 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438568 () (_ BitVec 64))

(assert (=> b!988902 (= lt!438568 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438575 () Unit!32782)

(declare-fun addApplyDifferent!470 (ListLongMap!13579 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32782)

(assert (=> b!988902 (= lt!438575 (addApplyDifferent!470 lt!438574 lt!438587 minValue!1220 lt!438568))))

(assert (=> b!988902 (= (apply!902 (+!3104 lt!438574 (tuple2!14881 lt!438587 minValue!1220)) lt!438568) (apply!902 lt!438574 lt!438568))))

(declare-fun lt!438570 () Unit!32782)

(assert (=> b!988902 (= lt!438570 lt!438575)))

(declare-fun lt!438589 () ListLongMap!13579)

(assert (=> b!988902 (= lt!438589 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438578 () (_ BitVec 64))

(assert (=> b!988902 (= lt!438578 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438588 () (_ BitVec 64))

(assert (=> b!988902 (= lt!438588 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(declare-fun lt!438573 () Unit!32782)

(assert (=> b!988902 (= lt!438573 (addApplyDifferent!470 lt!438589 lt!438578 zeroValue!1220 lt!438588))))

(assert (=> b!988902 (= (apply!902 (+!3104 lt!438589 (tuple2!14881 lt!438578 zeroValue!1220)) lt!438588) (apply!902 lt!438589 lt!438588))))

(declare-fun lt!438584 () Unit!32782)

(assert (=> b!988902 (= lt!438584 lt!438573)))

(declare-fun lt!438579 () ListLongMap!13579)

(assert (=> b!988902 (= lt!438579 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438577 () (_ BitVec 64))

(assert (=> b!988902 (= lt!438577 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438586 () (_ BitVec 64))

(assert (=> b!988902 (= lt!438586 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!988902 (= lt!438571 (addApplyDifferent!470 lt!438579 lt!438577 minValue!1220 lt!438586))))

(assert (=> b!988902 (= (apply!902 (+!3104 lt!438579 (tuple2!14881 lt!438577 minValue!1220)) lt!438586) (apply!902 lt!438579 lt!438586))))

(declare-fun b!988903 () Bool)

(assert (=> b!988903 (= e!557691 (= (apply!902 lt!438585 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!988904 () Bool)

(assert (=> b!988904 (= e!557686 (not call!41875))))

(declare-fun b!988905 () Bool)

(declare-fun call!41874 () ListLongMap!13579)

(assert (=> b!988905 (= e!557679 call!41874)))

(declare-fun bm!41876 () Bool)

(assert (=> bm!41876 (= call!41879 (contains!5735 lt!438585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988906 () Bool)

(declare-fun res!661270 () Bool)

(assert (=> b!988906 (=> (not res!661270) (not e!557687))))

(declare-fun e!557681 () Bool)

(assert (=> b!988906 (= res!661270 e!557681)))

(declare-fun res!661267 () Bool)

(assert (=> b!988906 (=> res!661267 e!557681)))

(assert (=> b!988906 (= res!661267 (not e!557680))))

(declare-fun res!661265 () Bool)

(assert (=> b!988906 (=> (not res!661265) (not e!557680))))

(assert (=> b!988906 (= res!661265 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))

(declare-fun b!988907 () Bool)

(assert (=> b!988907 (= e!557682 call!41878)))

(declare-fun b!988908 () Bool)

(assert (=> b!988908 (= e!557679 call!41878)))

(declare-fun b!988909 () Bool)

(assert (=> b!988909 (= e!557681 e!557685)))

(declare-fun res!661273 () Bool)

(assert (=> b!988909 (=> (not res!661273) (not e!557685))))

(assert (=> b!988909 (= res!661273 (contains!5735 lt!438585 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988909 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))

(declare-fun bm!41877 () Bool)

(assert (=> bm!41877 (= call!41874 call!41876)))

(declare-fun b!988910 () Bool)

(assert (=> b!988910 (= e!557688 (not call!41879))))

(declare-fun b!988911 () Bool)

(assert (=> b!988911 (= e!557684 (+!3104 call!41877 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun bm!41874 () Bool)

(declare-fun c!100375 () Bool)

(assert (=> bm!41874 (= call!41877 (+!3104 (ite c!100375 call!41880 (ite c!100373 call!41876 call!41874)) (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun d!117307 () Bool)

(assert (=> d!117307 e!557687))

(declare-fun res!661268 () Bool)

(assert (=> d!117307 (=> (not res!661268) (not e!557687))))

(assert (=> d!117307 (= res!661268 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))))

(declare-fun lt!438583 () ListLongMap!13579)

(assert (=> d!117307 (= lt!438585 lt!438583)))

(declare-fun lt!438581 () Unit!32782)

(assert (=> d!117307 (= lt!438581 e!557690)))

(declare-fun c!100374 () Bool)

(assert (=> d!117307 (= c!100374 e!557683)))

(declare-fun res!661271 () Bool)

(assert (=> d!117307 (=> (not res!661271) (not e!557683))))

(assert (=> d!117307 (= res!661271 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30554 _keys!1544)))))

(assert (=> d!117307 (= lt!438583 e!557684)))

(assert (=> d!117307 (= c!100375 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117307 (validMask!0 mask!1948)))

(assert (=> d!117307 (= (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438585)))

(assert (= (and d!117307 c!100375) b!988911))

(assert (= (and d!117307 (not c!100375)) b!988891))

(assert (= (and b!988891 c!100373) b!988907))

(assert (= (and b!988891 (not c!100373)) b!988896))

(assert (= (and b!988896 c!100371) b!988908))

(assert (= (and b!988896 (not c!100371)) b!988905))

(assert (= (or b!988908 b!988905) bm!41877))

(assert (= (or b!988907 bm!41877) bm!41875))

(assert (= (or b!988907 b!988908) bm!41871))

(assert (= (or b!988911 bm!41875) bm!41872))

(assert (= (or b!988911 bm!41871) bm!41874))

(assert (= (and d!117307 res!661271) b!988900))

(assert (= (and d!117307 c!100374) b!988902))

(assert (= (and d!117307 (not c!100374)) b!988901))

(assert (= (and d!117307 res!661268) b!988906))

(assert (= (and b!988906 res!661265) b!988894))

(assert (= (and b!988906 (not res!661267)) b!988909))

(assert (= (and b!988909 res!661273) b!988892))

(assert (= (and b!988906 res!661270) b!988897))

(assert (= (and b!988897 c!100372) b!988895))

(assert (= (and b!988897 (not c!100372)) b!988910))

(assert (= (and b!988895 res!661266) b!988903))

(assert (= (or b!988895 b!988910) bm!41876))

(assert (= (and b!988897 res!661269) b!988898))

(assert (= (and b!988898 c!100376) b!988893))

(assert (= (and b!988898 (not c!100376)) b!988904))

(assert (= (and b!988893 res!661272) b!988899))

(assert (= (or b!988893 b!988904) bm!41873))

(declare-fun b_lambda!15063 () Bool)

(assert (=> (not b_lambda!15063) (not b!988892)))

(assert (=> b!988892 t!29710))

(declare-fun b_and!32103 () Bool)

(assert (= b_and!32101 (and (=> t!29710 result!13551) b_and!32103)))

(declare-fun m!916053 () Bool)

(assert (=> bm!41876 m!916053))

(assert (=> b!988909 m!915945))

(assert (=> b!988909 m!915945))

(declare-fun m!916055 () Bool)

(assert (=> b!988909 m!916055))

(assert (=> b!988892 m!915945))

(assert (=> b!988892 m!915959))

(assert (=> b!988892 m!915823))

(assert (=> b!988892 m!915961))

(assert (=> b!988892 m!915823))

(assert (=> b!988892 m!915959))

(assert (=> b!988892 m!915945))

(declare-fun m!916057 () Bool)

(assert (=> b!988892 m!916057))

(declare-fun m!916059 () Bool)

(assert (=> b!988911 m!916059))

(assert (=> b!988900 m!915945))

(assert (=> b!988900 m!915945))

(assert (=> b!988900 m!915951))

(declare-fun m!916061 () Bool)

(assert (=> b!988902 m!916061))

(assert (=> b!988902 m!915815))

(declare-fun m!916063 () Bool)

(assert (=> b!988902 m!916063))

(declare-fun m!916065 () Bool)

(assert (=> b!988902 m!916065))

(declare-fun m!916067 () Bool)

(assert (=> b!988902 m!916067))

(assert (=> b!988902 m!915945))

(declare-fun m!916069 () Bool)

(assert (=> b!988902 m!916069))

(assert (=> b!988902 m!916069))

(declare-fun m!916071 () Bool)

(assert (=> b!988902 m!916071))

(declare-fun m!916073 () Bool)

(assert (=> b!988902 m!916073))

(declare-fun m!916075 () Bool)

(assert (=> b!988902 m!916075))

(declare-fun m!916077 () Bool)

(assert (=> b!988902 m!916077))

(assert (=> b!988902 m!916063))

(declare-fun m!916079 () Bool)

(assert (=> b!988902 m!916079))

(assert (=> b!988902 m!916061))

(declare-fun m!916081 () Bool)

(assert (=> b!988902 m!916081))

(declare-fun m!916083 () Bool)

(assert (=> b!988902 m!916083))

(declare-fun m!916085 () Bool)

(assert (=> b!988902 m!916085))

(assert (=> b!988902 m!916073))

(declare-fun m!916087 () Bool)

(assert (=> b!988902 m!916087))

(declare-fun m!916089 () Bool)

(assert (=> b!988902 m!916089))

(declare-fun m!916091 () Bool)

(assert (=> bm!41873 m!916091))

(assert (=> bm!41872 m!915815))

(assert (=> d!117307 m!915801))

(declare-fun m!916093 () Bool)

(assert (=> b!988899 m!916093))

(declare-fun m!916095 () Bool)

(assert (=> b!988903 m!916095))

(assert (=> b!988894 m!915945))

(assert (=> b!988894 m!915945))

(assert (=> b!988894 m!915951))

(declare-fun m!916097 () Bool)

(assert (=> bm!41874 m!916097))

(assert (=> b!988715 d!117307))

(declare-fun d!117309 () Bool)

(declare-fun e!557692 () Bool)

(assert (=> d!117309 e!557692))

(declare-fun res!661275 () Bool)

(assert (=> d!117309 (=> (not res!661275) (not e!557692))))

(declare-fun lt!438593 () ListLongMap!13579)

(assert (=> d!117309 (= res!661275 (contains!5735 lt!438593 (_1!7451 lt!438398)))))

(declare-fun lt!438592 () List!20786)

(assert (=> d!117309 (= lt!438593 (ListLongMap!13580 lt!438592))))

(declare-fun lt!438590 () Unit!32782)

(declare-fun lt!438591 () Unit!32782)

(assert (=> d!117309 (= lt!438590 lt!438591)))

(assert (=> d!117309 (= (getValueByKey!510 lt!438592 (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398)))))

(assert (=> d!117309 (= lt!438591 (lemmaContainsTupThenGetReturnValue!272 lt!438592 (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(assert (=> d!117309 (= lt!438592 (insertStrictlySorted!329 (toList!6805 lt!438397) (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(assert (=> d!117309 (= (+!3104 lt!438397 lt!438398) lt!438593)))

(declare-fun b!988912 () Bool)

(declare-fun res!661274 () Bool)

(assert (=> b!988912 (=> (not res!661274) (not e!557692))))

(assert (=> b!988912 (= res!661274 (= (getValueByKey!510 (toList!6805 lt!438593) (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398))))))

(declare-fun b!988913 () Bool)

(assert (=> b!988913 (= e!557692 (contains!5736 (toList!6805 lt!438593) lt!438398))))

(assert (= (and d!117309 res!661275) b!988912))

(assert (= (and b!988912 res!661274) b!988913))

(declare-fun m!916099 () Bool)

(assert (=> d!117309 m!916099))

(declare-fun m!916101 () Bool)

(assert (=> d!117309 m!916101))

(declare-fun m!916103 () Bool)

(assert (=> d!117309 m!916103))

(declare-fun m!916105 () Bool)

(assert (=> d!117309 m!916105))

(declare-fun m!916107 () Bool)

(assert (=> b!988912 m!916107))

(declare-fun m!916109 () Bool)

(assert (=> b!988913 m!916109))

(assert (=> b!988715 d!117309))

(declare-fun bm!41878 () Bool)

(declare-fun call!41885 () ListLongMap!13579)

(declare-fun call!41884 () ListLongMap!13579)

(assert (=> bm!41878 (= call!41885 call!41884)))

(declare-fun call!41887 () ListLongMap!13579)

(declare-fun bm!41879 () Bool)

(assert (=> bm!41879 (= call!41887 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun bm!41880 () Bool)

(declare-fun call!41882 () Bool)

(declare-fun lt!438611 () ListLongMap!13579)

(assert (=> bm!41880 (= call!41882 (contains!5735 lt!438611 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988914 () Bool)

(declare-fun e!557698 () ListLongMap!13579)

(declare-fun e!557696 () ListLongMap!13579)

(assert (=> b!988914 (= e!557698 e!557696)))

(declare-fun c!100379 () Bool)

(assert (=> b!988914 (= c!100379 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!988915 () Bool)

(declare-fun e!557699 () Bool)

(assert (=> b!988915 (= e!557699 (= (apply!902 lt!438611 (select (arr!30074 _keys!1544) from!1932)) (get!15628 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988915 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30555 _values!1278)))))

(assert (=> b!988915 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30554 _keys!1544)))))

(declare-fun b!988916 () Bool)

(declare-fun e!557700 () Bool)

(declare-fun e!557703 () Bool)

(assert (=> b!988916 (= e!557700 e!557703)))

(declare-fun res!661283 () Bool)

(assert (=> b!988916 (= res!661283 call!41882)))

(assert (=> b!988916 (=> (not res!661283) (not e!557703))))

(declare-fun b!988917 () Bool)

(declare-fun e!557694 () Bool)

(assert (=> b!988917 (= e!557694 (validKeyInArray!0 (select (arr!30074 _keys!1544) from!1932)))))

(declare-fun b!988918 () Bool)

(declare-fun e!557702 () Bool)

(declare-fun e!557705 () Bool)

(assert (=> b!988918 (= e!557702 e!557705)))

(declare-fun res!661277 () Bool)

(declare-fun call!41886 () Bool)

(assert (=> b!988918 (= res!661277 call!41886)))

(assert (=> b!988918 (=> (not res!661277) (not e!557705))))

(declare-fun b!988919 () Bool)

(declare-fun c!100377 () Bool)

(assert (=> b!988919 (= c!100377 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!557693 () ListLongMap!13579)

(assert (=> b!988919 (= e!557696 e!557693)))

(declare-fun b!988920 () Bool)

(declare-fun res!661280 () Bool)

(declare-fun e!557701 () Bool)

(assert (=> b!988920 (=> (not res!661280) (not e!557701))))

(assert (=> b!988920 (= res!661280 e!557702)))

(declare-fun c!100378 () Bool)

(assert (=> b!988920 (= c!100378 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!988921 () Bool)

(assert (=> b!988921 (= e!557701 e!557700)))

(declare-fun c!100382 () Bool)

(assert (=> b!988921 (= c!100382 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!988922 () Bool)

(assert (=> b!988922 (= e!557703 (= (apply!902 lt!438611 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1220))))

(declare-fun b!988923 () Bool)

(declare-fun e!557697 () Bool)

(assert (=> b!988923 (= e!557697 (validKeyInArray!0 (select (arr!30074 _keys!1544) from!1932)))))

(declare-fun bm!41882 () Bool)

(declare-fun call!41883 () ListLongMap!13579)

(assert (=> bm!41882 (= call!41883 call!41887)))

(declare-fun b!988924 () Bool)

(declare-fun e!557704 () Unit!32782)

(declare-fun Unit!32789 () Unit!32782)

(assert (=> b!988924 (= e!557704 Unit!32789)))

(declare-fun b!988925 () Bool)

(declare-fun lt!438597 () Unit!32782)

(assert (=> b!988925 (= e!557704 lt!438597)))

(declare-fun lt!438598 () ListLongMap!13579)

(assert (=> b!988925 (= lt!438598 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438602 () (_ BitVec 64))

(assert (=> b!988925 (= lt!438602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438606 () (_ BitVec 64))

(assert (=> b!988925 (= lt!438606 (select (arr!30074 _keys!1544) from!1932))))

(declare-fun lt!438608 () Unit!32782)

(assert (=> b!988925 (= lt!438608 (addStillContains!614 lt!438598 lt!438602 zeroValue!1220 lt!438606))))

(assert (=> b!988925 (contains!5735 (+!3104 lt!438598 (tuple2!14881 lt!438602 zeroValue!1220)) lt!438606)))

(declare-fun lt!438595 () Unit!32782)

(assert (=> b!988925 (= lt!438595 lt!438608)))

(declare-fun lt!438600 () ListLongMap!13579)

(assert (=> b!988925 (= lt!438600 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438613 () (_ BitVec 64))

(assert (=> b!988925 (= lt!438613 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438594 () (_ BitVec 64))

(assert (=> b!988925 (= lt!438594 (select (arr!30074 _keys!1544) from!1932))))

(declare-fun lt!438601 () Unit!32782)

(assert (=> b!988925 (= lt!438601 (addApplyDifferent!470 lt!438600 lt!438613 minValue!1220 lt!438594))))

(assert (=> b!988925 (= (apply!902 (+!3104 lt!438600 (tuple2!14881 lt!438613 minValue!1220)) lt!438594) (apply!902 lt!438600 lt!438594))))

(declare-fun lt!438596 () Unit!32782)

(assert (=> b!988925 (= lt!438596 lt!438601)))

(declare-fun lt!438615 () ListLongMap!13579)

(assert (=> b!988925 (= lt!438615 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438604 () (_ BitVec 64))

(assert (=> b!988925 (= lt!438604 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438614 () (_ BitVec 64))

(assert (=> b!988925 (= lt!438614 (select (arr!30074 _keys!1544) from!1932))))

(declare-fun lt!438599 () Unit!32782)

(assert (=> b!988925 (= lt!438599 (addApplyDifferent!470 lt!438615 lt!438604 zeroValue!1220 lt!438614))))

(assert (=> b!988925 (= (apply!902 (+!3104 lt!438615 (tuple2!14881 lt!438604 zeroValue!1220)) lt!438614) (apply!902 lt!438615 lt!438614))))

(declare-fun lt!438610 () Unit!32782)

(assert (=> b!988925 (= lt!438610 lt!438599)))

(declare-fun lt!438605 () ListLongMap!13579)

(assert (=> b!988925 (= lt!438605 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281))))

(declare-fun lt!438603 () (_ BitVec 64))

(assert (=> b!988925 (= lt!438603 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!438612 () (_ BitVec 64))

(assert (=> b!988925 (= lt!438612 (select (arr!30074 _keys!1544) from!1932))))

(assert (=> b!988925 (= lt!438597 (addApplyDifferent!470 lt!438605 lt!438603 minValue!1220 lt!438612))))

(assert (=> b!988925 (= (apply!902 (+!3104 lt!438605 (tuple2!14881 lt!438603 minValue!1220)) lt!438612) (apply!902 lt!438605 lt!438612))))

(declare-fun b!988926 () Bool)

(assert (=> b!988926 (= e!557705 (= (apply!902 lt!438611 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1220))))

(declare-fun b!988927 () Bool)

(assert (=> b!988927 (= e!557700 (not call!41882))))

(declare-fun b!988928 () Bool)

(declare-fun call!41881 () ListLongMap!13579)

(assert (=> b!988928 (= e!557693 call!41881)))

(declare-fun bm!41883 () Bool)

(assert (=> bm!41883 (= call!41886 (contains!5735 lt!438611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!988929 () Bool)

(declare-fun res!661281 () Bool)

(assert (=> b!988929 (=> (not res!661281) (not e!557701))))

(declare-fun e!557695 () Bool)

(assert (=> b!988929 (= res!661281 e!557695)))

(declare-fun res!661278 () Bool)

(assert (=> b!988929 (=> res!661278 e!557695)))

(assert (=> b!988929 (= res!661278 (not e!557694))))

(declare-fun res!661276 () Bool)

(assert (=> b!988929 (=> (not res!661276) (not e!557694))))

(assert (=> b!988929 (= res!661276 (bvslt from!1932 (size!30554 _keys!1544)))))

(declare-fun b!988930 () Bool)

(assert (=> b!988930 (= e!557696 call!41885)))

(declare-fun b!988931 () Bool)

(assert (=> b!988931 (= e!557693 call!41885)))

(declare-fun b!988932 () Bool)

(assert (=> b!988932 (= e!557695 e!557699)))

(declare-fun res!661284 () Bool)

(assert (=> b!988932 (=> (not res!661284) (not e!557699))))

(assert (=> b!988932 (= res!661284 (contains!5735 lt!438611 (select (arr!30074 _keys!1544) from!1932)))))

(assert (=> b!988932 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30554 _keys!1544)))))

(declare-fun bm!41884 () Bool)

(assert (=> bm!41884 (= call!41881 call!41883)))

(declare-fun b!988933 () Bool)

(assert (=> b!988933 (= e!557702 (not call!41886))))

(declare-fun b!988934 () Bool)

(assert (=> b!988934 (= e!557698 (+!3104 call!41884 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun c!100381 () Bool)

(declare-fun bm!41881 () Bool)

(assert (=> bm!41881 (= call!41884 (+!3104 (ite c!100381 call!41887 (ite c!100379 call!41883 call!41881)) (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun d!117311 () Bool)

(assert (=> d!117311 e!557701))

(declare-fun res!661279 () Bool)

(assert (=> d!117311 (=> (not res!661279) (not e!557701))))

(assert (=> d!117311 (= res!661279 (or (bvsge from!1932 (size!30554 _keys!1544)) (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30554 _keys!1544)))))))

(declare-fun lt!438609 () ListLongMap!13579)

(assert (=> d!117311 (= lt!438611 lt!438609)))

(declare-fun lt!438607 () Unit!32782)

(assert (=> d!117311 (= lt!438607 e!557704)))

(declare-fun c!100380 () Bool)

(assert (=> d!117311 (= c!100380 e!557697)))

(declare-fun res!661282 () Bool)

(assert (=> d!117311 (=> (not res!661282) (not e!557697))))

(assert (=> d!117311 (= res!661282 (bvslt from!1932 (size!30554 _keys!1544)))))

(assert (=> d!117311 (= lt!438609 e!557698)))

(assert (=> d!117311 (= c!100381 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!117311 (validMask!0 mask!1948)))

(assert (=> d!117311 (= (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!438611)))

(assert (= (and d!117311 c!100381) b!988934))

(assert (= (and d!117311 (not c!100381)) b!988914))

(assert (= (and b!988914 c!100379) b!988930))

(assert (= (and b!988914 (not c!100379)) b!988919))

(assert (= (and b!988919 c!100377) b!988931))

(assert (= (and b!988919 (not c!100377)) b!988928))

(assert (= (or b!988931 b!988928) bm!41884))

(assert (= (or b!988930 bm!41884) bm!41882))

(assert (= (or b!988930 b!988931) bm!41878))

(assert (= (or b!988934 bm!41882) bm!41879))

(assert (= (or b!988934 bm!41878) bm!41881))

(assert (= (and d!117311 res!661282) b!988923))

(assert (= (and d!117311 c!100380) b!988925))

(assert (= (and d!117311 (not c!100380)) b!988924))

(assert (= (and d!117311 res!661279) b!988929))

(assert (= (and b!988929 res!661276) b!988917))

(assert (= (and b!988929 (not res!661278)) b!988932))

(assert (= (and b!988932 res!661284) b!988915))

(assert (= (and b!988929 res!661281) b!988920))

(assert (= (and b!988920 c!100378) b!988918))

(assert (= (and b!988920 (not c!100378)) b!988933))

(assert (= (and b!988918 res!661277) b!988926))

(assert (= (or b!988918 b!988933) bm!41883))

(assert (= (and b!988920 res!661280) b!988921))

(assert (= (and b!988921 c!100382) b!988916))

(assert (= (and b!988921 (not c!100382)) b!988927))

(assert (= (and b!988916 res!661283) b!988922))

(assert (= (or b!988916 b!988927) bm!41880))

(declare-fun b_lambda!15065 () Bool)

(assert (=> (not b_lambda!15065) (not b!988915)))

(assert (=> b!988915 t!29710))

(declare-fun b_and!32105 () Bool)

(assert (= b_and!32103 (and (=> t!29710 result!13551) b_and!32105)))

(declare-fun m!916111 () Bool)

(assert (=> bm!41883 m!916111))

(assert (=> b!988932 m!915785))

(assert (=> b!988932 m!915785))

(declare-fun m!916113 () Bool)

(assert (=> b!988932 m!916113))

(assert (=> b!988915 m!915785))

(assert (=> b!988915 m!915809))

(assert (=> b!988915 m!915823))

(assert (=> b!988915 m!915825))

(assert (=> b!988915 m!915823))

(assert (=> b!988915 m!915809))

(assert (=> b!988915 m!915785))

(declare-fun m!916115 () Bool)

(assert (=> b!988915 m!916115))

(declare-fun m!916117 () Bool)

(assert (=> b!988934 m!916117))

(assert (=> b!988923 m!915785))

(assert (=> b!988923 m!915785))

(assert (=> b!988923 m!915787))

(declare-fun m!916119 () Bool)

(assert (=> b!988925 m!916119))

(declare-fun m!916121 () Bool)

(assert (=> b!988925 m!916121))

(declare-fun m!916123 () Bool)

(assert (=> b!988925 m!916123))

(declare-fun m!916125 () Bool)

(assert (=> b!988925 m!916125))

(declare-fun m!916127 () Bool)

(assert (=> b!988925 m!916127))

(assert (=> b!988925 m!915785))

(declare-fun m!916129 () Bool)

(assert (=> b!988925 m!916129))

(assert (=> b!988925 m!916129))

(declare-fun m!916131 () Bool)

(assert (=> b!988925 m!916131))

(declare-fun m!916133 () Bool)

(assert (=> b!988925 m!916133))

(declare-fun m!916135 () Bool)

(assert (=> b!988925 m!916135))

(declare-fun m!916137 () Bool)

(assert (=> b!988925 m!916137))

(assert (=> b!988925 m!916123))

(declare-fun m!916139 () Bool)

(assert (=> b!988925 m!916139))

(assert (=> b!988925 m!916119))

(declare-fun m!916141 () Bool)

(assert (=> b!988925 m!916141))

(declare-fun m!916143 () Bool)

(assert (=> b!988925 m!916143))

(declare-fun m!916145 () Bool)

(assert (=> b!988925 m!916145))

(assert (=> b!988925 m!916133))

(declare-fun m!916147 () Bool)

(assert (=> b!988925 m!916147))

(declare-fun m!916149 () Bool)

(assert (=> b!988925 m!916149))

(declare-fun m!916151 () Bool)

(assert (=> bm!41880 m!916151))

(assert (=> bm!41879 m!916121))

(assert (=> d!117311 m!915801))

(declare-fun m!916153 () Bool)

(assert (=> b!988922 m!916153))

(declare-fun m!916155 () Bool)

(assert (=> b!988926 m!916155))

(assert (=> b!988917 m!915785))

(assert (=> b!988917 m!915785))

(assert (=> b!988917 m!915787))

(declare-fun m!916157 () Bool)

(assert (=> bm!41881 m!916157))

(assert (=> b!988715 d!117311))

(declare-fun d!117313 () Bool)

(declare-fun e!557706 () Bool)

(assert (=> d!117313 e!557706))

(declare-fun res!661286 () Bool)

(assert (=> d!117313 (=> (not res!661286) (not e!557706))))

(declare-fun lt!438619 () ListLongMap!13579)

(assert (=> d!117313 (= res!661286 (contains!5735 lt!438619 (_1!7451 lt!438400)))))

(declare-fun lt!438618 () List!20786)

(assert (=> d!117313 (= lt!438619 (ListLongMap!13580 lt!438618))))

(declare-fun lt!438616 () Unit!32782)

(declare-fun lt!438617 () Unit!32782)

(assert (=> d!117313 (= lt!438616 lt!438617)))

(assert (=> d!117313 (= (getValueByKey!510 lt!438618 (_1!7451 lt!438400)) (Some!515 (_2!7451 lt!438400)))))

(assert (=> d!117313 (= lt!438617 (lemmaContainsTupThenGetReturnValue!272 lt!438618 (_1!7451 lt!438400) (_2!7451 lt!438400)))))

(assert (=> d!117313 (= lt!438618 (insertStrictlySorted!329 (toList!6805 (+!3104 lt!438397 lt!438398)) (_1!7451 lt!438400) (_2!7451 lt!438400)))))

(assert (=> d!117313 (= (+!3104 (+!3104 lt!438397 lt!438398) lt!438400) lt!438619)))

(declare-fun b!988935 () Bool)

(declare-fun res!661285 () Bool)

(assert (=> b!988935 (=> (not res!661285) (not e!557706))))

(assert (=> b!988935 (= res!661285 (= (getValueByKey!510 (toList!6805 lt!438619) (_1!7451 lt!438400)) (Some!515 (_2!7451 lt!438400))))))

(declare-fun b!988936 () Bool)

(assert (=> b!988936 (= e!557706 (contains!5736 (toList!6805 lt!438619) lt!438400))))

(assert (= (and d!117313 res!661286) b!988935))

(assert (= (and b!988935 res!661285) b!988936))

(declare-fun m!916159 () Bool)

(assert (=> d!117313 m!916159))

(declare-fun m!916161 () Bool)

(assert (=> d!117313 m!916161))

(declare-fun m!916163 () Bool)

(assert (=> d!117313 m!916163))

(declare-fun m!916165 () Bool)

(assert (=> d!117313 m!916165))

(declare-fun m!916167 () Bool)

(assert (=> b!988935 m!916167))

(declare-fun m!916169 () Bool)

(assert (=> b!988936 m!916169))

(assert (=> b!988715 d!117313))

(declare-fun d!117315 () Bool)

(assert (=> d!117315 (= (validKeyInArray!0 (select (arr!30074 _keys!1544) from!1932)) (and (not (= (select (arr!30074 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30074 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988718 d!117315))

(declare-fun b!988945 () Bool)

(declare-fun e!557715 () Bool)

(declare-fun e!557714 () Bool)

(assert (=> b!988945 (= e!557715 e!557714)))

(declare-fun c!100385 () Bool)

(assert (=> b!988945 (= c!100385 (validKeyInArray!0 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117317 () Bool)

(declare-fun res!661291 () Bool)

(assert (=> d!117317 (=> res!661291 e!557715)))

(assert (=> d!117317 (= res!661291 (bvsge #b00000000000000000000000000000000 (size!30554 _keys!1544)))))

(assert (=> d!117317 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!557715)))

(declare-fun b!988946 () Bool)

(declare-fun e!557713 () Bool)

(declare-fun call!41890 () Bool)

(assert (=> b!988946 (= e!557713 call!41890)))

(declare-fun b!988947 () Bool)

(assert (=> b!988947 (= e!557714 call!41890)))

(declare-fun bm!41887 () Bool)

(assert (=> bm!41887 (= call!41890 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!988948 () Bool)

(assert (=> b!988948 (= e!557714 e!557713)))

(declare-fun lt!438627 () (_ BitVec 64))

(assert (=> b!988948 (= lt!438627 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!438626 () Unit!32782)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62446 (_ BitVec 64) (_ BitVec 32)) Unit!32782)

(assert (=> b!988948 (= lt!438626 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438627 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!988948 (arrayContainsKey!0 _keys!1544 lt!438627 #b00000000000000000000000000000000)))

(declare-fun lt!438628 () Unit!32782)

(assert (=> b!988948 (= lt!438628 lt!438626)))

(declare-fun res!661292 () Bool)

(declare-datatypes ((SeekEntryResult!9163 0))(
  ( (MissingZero!9163 (index!39023 (_ BitVec 32))) (Found!9163 (index!39024 (_ BitVec 32))) (Intermediate!9163 (undefined!9975 Bool) (index!39025 (_ BitVec 32)) (x!85967 (_ BitVec 32))) (Undefined!9163) (MissingVacant!9163 (index!39026 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62446 (_ BitVec 32)) SeekEntryResult!9163)

(assert (=> b!988948 (= res!661292 (= (seekEntryOrOpen!0 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9163 #b00000000000000000000000000000000)))))

(assert (=> b!988948 (=> (not res!661292) (not e!557713))))

(assert (= (and d!117317 (not res!661291)) b!988945))

(assert (= (and b!988945 c!100385) b!988948))

(assert (= (and b!988945 (not c!100385)) b!988947))

(assert (= (and b!988948 res!661292) b!988946))

(assert (= (or b!988946 b!988947) bm!41887))

(declare-fun m!916171 () Bool)

(assert (=> b!988945 m!916171))

(assert (=> b!988945 m!916171))

(declare-fun m!916173 () Bool)

(assert (=> b!988945 m!916173))

(declare-fun m!916175 () Bool)

(assert (=> bm!41887 m!916175))

(assert (=> b!988948 m!916171))

(declare-fun m!916177 () Bool)

(assert (=> b!988948 m!916177))

(declare-fun m!916179 () Bool)

(assert (=> b!988948 m!916179))

(assert (=> b!988948 m!916171))

(declare-fun m!916181 () Bool)

(assert (=> b!988948 m!916181))

(assert (=> b!988708 d!117317))

(declare-fun b!988959 () Bool)

(declare-fun e!557726 () Bool)

(declare-fun e!557727 () Bool)

(assert (=> b!988959 (= e!557726 e!557727)))

(declare-fun res!661299 () Bool)

(assert (=> b!988959 (=> (not res!661299) (not e!557727))))

(declare-fun e!557725 () Bool)

(assert (=> b!988959 (= res!661299 (not e!557725))))

(declare-fun res!661301 () Bool)

(assert (=> b!988959 (=> (not res!661301) (not e!557725))))

(assert (=> b!988959 (= res!661301 (validKeyInArray!0 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!117319 () Bool)

(declare-fun res!661300 () Bool)

(assert (=> d!117319 (=> res!661300 e!557726)))

(assert (=> d!117319 (= res!661300 (bvsge #b00000000000000000000000000000000 (size!30554 _keys!1544)))))

(assert (=> d!117319 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20784) e!557726)))

(declare-fun b!988960 () Bool)

(declare-fun e!557724 () Bool)

(declare-fun call!41893 () Bool)

(assert (=> b!988960 (= e!557724 call!41893)))

(declare-fun bm!41890 () Bool)

(declare-fun c!100388 () Bool)

(assert (=> bm!41890 (= call!41893 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100388 (Cons!20783 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) Nil!20784) Nil!20784)))))

(declare-fun b!988961 () Bool)

(assert (=> b!988961 (= e!557724 call!41893)))

(declare-fun b!988962 () Bool)

(declare-fun contains!5737 (List!20787 (_ BitVec 64)) Bool)

(assert (=> b!988962 (= e!557725 (contains!5737 Nil!20784 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988963 () Bool)

(assert (=> b!988963 (= e!557727 e!557724)))

(assert (=> b!988963 (= c!100388 (validKeyInArray!0 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117319 (not res!661300)) b!988959))

(assert (= (and b!988959 res!661301) b!988962))

(assert (= (and b!988959 res!661299) b!988963))

(assert (= (and b!988963 c!100388) b!988960))

(assert (= (and b!988963 (not c!100388)) b!988961))

(assert (= (or b!988960 b!988961) bm!41890))

(assert (=> b!988959 m!916171))

(assert (=> b!988959 m!916171))

(assert (=> b!988959 m!916173))

(assert (=> bm!41890 m!916171))

(declare-fun m!916183 () Bool)

(assert (=> bm!41890 m!916183))

(assert (=> b!988962 m!916171))

(assert (=> b!988962 m!916171))

(declare-fun m!916185 () Bool)

(assert (=> b!988962 m!916185))

(assert (=> b!988963 m!916171))

(assert (=> b!988963 m!916171))

(assert (=> b!988963 m!916173))

(assert (=> b!988711 d!117319))

(declare-fun b!988970 () Bool)

(declare-fun e!557733 () Bool)

(assert (=> b!988970 (= e!557733 tp_is_empty!23221)))

(declare-fun mapNonEmpty!36875 () Bool)

(declare-fun mapRes!36875 () Bool)

(declare-fun tp!69812 () Bool)

(assert (=> mapNonEmpty!36875 (= mapRes!36875 (and tp!69812 e!557733))))

(declare-fun mapRest!36875 () (Array (_ BitVec 32) ValueCell!11129))

(declare-fun mapKey!36875 () (_ BitVec 32))

(declare-fun mapValue!36875 () ValueCell!11129)

(assert (=> mapNonEmpty!36875 (= mapRest!36866 (store mapRest!36875 mapKey!36875 mapValue!36875))))

(declare-fun mapIsEmpty!36875 () Bool)

(assert (=> mapIsEmpty!36875 mapRes!36875))

(declare-fun condMapEmpty!36875 () Bool)

(declare-fun mapDefault!36875 () ValueCell!11129)

(assert (=> mapNonEmpty!36866 (= condMapEmpty!36875 (= mapRest!36866 ((as const (Array (_ BitVec 32) ValueCell!11129)) mapDefault!36875)))))

(declare-fun e!557732 () Bool)

(assert (=> mapNonEmpty!36866 (= tp!69797 (and e!557732 mapRes!36875))))

(declare-fun b!988971 () Bool)

(assert (=> b!988971 (= e!557732 tp_is_empty!23221)))

(assert (= (and mapNonEmpty!36866 condMapEmpty!36875) mapIsEmpty!36875))

(assert (= (and mapNonEmpty!36866 (not condMapEmpty!36875)) mapNonEmpty!36875))

(assert (= (and mapNonEmpty!36875 ((_ is ValueCellFull!11129) mapValue!36875)) b!988970))

(assert (= (and mapNonEmpty!36866 ((_ is ValueCellFull!11129) mapDefault!36875)) b!988971))

(declare-fun m!916187 () Bool)

(assert (=> mapNonEmpty!36875 m!916187))

(declare-fun b_lambda!15067 () Bool)

(assert (= b_lambda!15065 (or (and start!84622 b_free!20005) b_lambda!15067)))

(declare-fun b_lambda!15069 () Bool)

(assert (= b_lambda!15061 (or (and start!84622 b_free!20005) b_lambda!15069)))

(declare-fun b_lambda!15071 () Bool)

(assert (= b_lambda!15063 (or (and start!84622 b_free!20005) b_lambda!15071)))

(declare-fun b_lambda!15073 () Bool)

(assert (= b_lambda!15059 (or (and start!84622 b_free!20005) b_lambda!15073)))

(check-sat (not bm!41856) (not b!988900) (not b!988925) (not b!988846) (not d!117293) (not b!988847) (not d!117305) (not b!988827) (not bm!41883) (not b!988844) (not d!117311) (not b!988824) (not b!988962) (not b!988915) (not b!988945) (not b!988894) (not bm!41887) (not d!117297) (not b!988922) (not bm!41876) (not mapNonEmpty!36875) (not b!988963) (not d!117291) (not b!988839) (not d!117307) (not b!988848) (not b!988795) b_and!32105 (not b_lambda!15067) (not bm!41873) (not b!988821) (not b!988934) (not b!988840) (not b!988842) (not b!988796) (not b!988829) (not b_lambda!15073) (not bm!41879) (not b!988892) (not b!988913) (not b!988841) (not b!988837) (not bm!41890) (not bm!41874) (not b!988923) (not b!988838) (not b!988926) (not b!988912) (not b!988959) (not b_next!20005) (not b!988911) (not bm!41872) (not d!117309) (not b!988917) (not d!117301) (not b!988822) (not bm!41881) (not b!988902) (not b_lambda!15071) (not d!117303) (not b!988845) tp_is_empty!23221 (not bm!41880) (not b!988830) (not b!988948) (not d!117287) (not d!117299) (not b_lambda!15069) (not d!117295) (not b!988935) (not b!988843) (not b!988932) (not b_lambda!15057) (not d!117313) (not b!988909) (not b!988825) (not b!988899) (not b!988936) (not b!988832) (not b!988903))
(check-sat b_and!32105 (not b_next!20005))
(get-model)

(declare-fun d!117321 () Bool)

(declare-fun lt!438631 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!418 (List!20786) (InoxSet tuple2!14880))

(assert (=> d!117321 (= lt!438631 (select (content!418 (toList!6805 lt!438522)) lt!438398))))

(declare-fun e!557738 () Bool)

(assert (=> d!117321 (= lt!438631 e!557738)))

(declare-fun res!661306 () Bool)

(assert (=> d!117321 (=> (not res!661306) (not e!557738))))

(assert (=> d!117321 (= res!661306 ((_ is Cons!20782) (toList!6805 lt!438522)))))

(assert (=> d!117321 (= (contains!5736 (toList!6805 lt!438522) lt!438398) lt!438631)))

(declare-fun b!988976 () Bool)

(declare-fun e!557739 () Bool)

(assert (=> b!988976 (= e!557738 e!557739)))

(declare-fun res!661307 () Bool)

(assert (=> b!988976 (=> res!661307 e!557739)))

(assert (=> b!988976 (= res!661307 (= (h!21950 (toList!6805 lt!438522)) lt!438398))))

(declare-fun b!988977 () Bool)

(assert (=> b!988977 (= e!557739 (contains!5736 (t!29711 (toList!6805 lt!438522)) lt!438398))))

(assert (= (and d!117321 res!661306) b!988976))

(assert (= (and b!988976 (not res!661307)) b!988977))

(declare-fun m!916189 () Bool)

(assert (=> d!117321 m!916189))

(declare-fun m!916191 () Bool)

(assert (=> d!117321 m!916191))

(declare-fun m!916193 () Bool)

(assert (=> b!988977 m!916193))

(assert (=> b!988848 d!117321))

(declare-fun d!117323 () Bool)

(declare-fun get!15633 (Option!516) V!35945)

(assert (=> d!117323 (= (apply!902 lt!438484 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15633 (getValueByKey!510 (toList!6805 lt!438484) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28046 () Bool)

(assert (= bs!28046 d!117323))

(assert (=> bs!28046 m!915945))

(declare-fun m!916195 () Bool)

(assert (=> bs!28046 m!916195))

(assert (=> bs!28046 m!916195))

(declare-fun m!916197 () Bool)

(assert (=> bs!28046 m!916197))

(assert (=> b!988824 d!117323))

(declare-fun d!117325 () Bool)

(declare-fun c!100389 () Bool)

(assert (=> d!117325 (= c!100389 ((_ is ValueCellFull!11129) (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun e!557740 () V!35945)

(assert (=> d!117325 (= (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!557740)))

(declare-fun b!988978 () Bool)

(assert (=> b!988978 (= e!557740 (get!15631 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988979 () Bool)

(assert (=> b!988979 (= e!557740 (get!15632 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117325 c!100389) b!988978))

(assert (= (and d!117325 (not c!100389)) b!988979))

(assert (=> b!988978 m!915959))

(assert (=> b!988978 m!915823))

(declare-fun m!916199 () Bool)

(assert (=> b!988978 m!916199))

(assert (=> b!988979 m!915959))

(assert (=> b!988979 m!915823))

(declare-fun m!916201 () Bool)

(assert (=> b!988979 m!916201))

(assert (=> b!988824 d!117325))

(declare-fun d!117327 () Bool)

(declare-fun e!557741 () Bool)

(assert (=> d!117327 e!557741))

(declare-fun res!661309 () Bool)

(assert (=> d!117327 (=> (not res!661309) (not e!557741))))

(declare-fun lt!438635 () ListLongMap!13579)

(assert (=> d!117327 (= res!661309 (contains!5735 lt!438635 (_1!7451 (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!438634 () List!20786)

(assert (=> d!117327 (= lt!438635 (ListLongMap!13580 lt!438634))))

(declare-fun lt!438632 () Unit!32782)

(declare-fun lt!438633 () Unit!32782)

(assert (=> d!117327 (= lt!438632 lt!438633)))

(assert (=> d!117327 (= (getValueByKey!510 lt!438634 (_1!7451 (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!515 (_2!7451 (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117327 (= lt!438633 (lemmaContainsTupThenGetReturnValue!272 lt!438634 (_1!7451 (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7451 (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117327 (= lt!438634 (insertStrictlySorted!329 (toList!6805 (ite c!100375 call!41880 (ite c!100373 call!41876 call!41874))) (_1!7451 (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7451 (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117327 (= (+!3104 (ite c!100375 call!41880 (ite c!100373 call!41876 call!41874)) (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!438635)))

(declare-fun b!988980 () Bool)

(declare-fun res!661308 () Bool)

(assert (=> b!988980 (=> (not res!661308) (not e!557741))))

(assert (=> b!988980 (= res!661308 (= (getValueByKey!510 (toList!6805 lt!438635) (_1!7451 (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!515 (_2!7451 (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!988981 () Bool)

(assert (=> b!988981 (= e!557741 (contains!5736 (toList!6805 lt!438635) (ite (or c!100375 c!100373) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117327 res!661309) b!988980))

(assert (= (and b!988980 res!661308) b!988981))

(declare-fun m!916203 () Bool)

(assert (=> d!117327 m!916203))

(declare-fun m!916205 () Bool)

(assert (=> d!117327 m!916205))

(declare-fun m!916207 () Bool)

(assert (=> d!117327 m!916207))

(declare-fun m!916209 () Bool)

(assert (=> d!117327 m!916209))

(declare-fun m!916211 () Bool)

(assert (=> b!988980 m!916211))

(declare-fun m!916213 () Bool)

(assert (=> b!988981 m!916213))

(assert (=> bm!41874 d!117327))

(declare-fun d!117329 () Bool)

(declare-fun lt!438636 () Bool)

(assert (=> d!117329 (= lt!438636 (select (content!418 (toList!6805 lt!438518)) lt!438403))))

(declare-fun e!557742 () Bool)

(assert (=> d!117329 (= lt!438636 e!557742)))

(declare-fun res!661310 () Bool)

(assert (=> d!117329 (=> (not res!661310) (not e!557742))))

(assert (=> d!117329 (= res!661310 ((_ is Cons!20782) (toList!6805 lt!438518)))))

(assert (=> d!117329 (= (contains!5736 (toList!6805 lt!438518) lt!438403) lt!438636)))

(declare-fun b!988982 () Bool)

(declare-fun e!557743 () Bool)

(assert (=> b!988982 (= e!557742 e!557743)))

(declare-fun res!661311 () Bool)

(assert (=> b!988982 (=> res!661311 e!557743)))

(assert (=> b!988982 (= res!661311 (= (h!21950 (toList!6805 lt!438518)) lt!438403))))

(declare-fun b!988983 () Bool)

(assert (=> b!988983 (= e!557743 (contains!5736 (t!29711 (toList!6805 lt!438518)) lt!438403))))

(assert (= (and d!117329 res!661310) b!988982))

(assert (= (and b!988982 (not res!661311)) b!988983))

(declare-fun m!916215 () Bool)

(assert (=> d!117329 m!916215))

(declare-fun m!916217 () Bool)

(assert (=> d!117329 m!916217))

(declare-fun m!916219 () Bool)

(assert (=> b!988983 m!916219))

(assert (=> b!988846 d!117329))

(declare-fun d!117331 () Bool)

(declare-fun lt!438637 () Bool)

(assert (=> d!117331 (= lt!438637 (select (content!418 (toList!6805 lt!438514)) lt!438403))))

(declare-fun e!557744 () Bool)

(assert (=> d!117331 (= lt!438637 e!557744)))

(declare-fun res!661312 () Bool)

(assert (=> d!117331 (=> (not res!661312) (not e!557744))))

(assert (=> d!117331 (= res!661312 ((_ is Cons!20782) (toList!6805 lt!438514)))))

(assert (=> d!117331 (= (contains!5736 (toList!6805 lt!438514) lt!438403) lt!438637)))

(declare-fun b!988984 () Bool)

(declare-fun e!557745 () Bool)

(assert (=> b!988984 (= e!557744 e!557745)))

(declare-fun res!661313 () Bool)

(assert (=> b!988984 (=> res!661313 e!557745)))

(assert (=> b!988984 (= res!661313 (= (h!21950 (toList!6805 lt!438514)) lt!438403))))

(declare-fun b!988985 () Bool)

(assert (=> b!988985 (= e!557745 (contains!5736 (t!29711 (toList!6805 lt!438514)) lt!438403))))

(assert (= (and d!117331 res!661312) b!988984))

(assert (= (and b!988984 (not res!661313)) b!988985))

(declare-fun m!916221 () Bool)

(assert (=> d!117331 m!916221))

(declare-fun m!916223 () Bool)

(assert (=> d!117331 m!916223))

(declare-fun m!916225 () Bool)

(assert (=> b!988985 m!916225))

(assert (=> b!988844 d!117331))

(declare-fun d!117333 () Bool)

(declare-fun e!557750 () Bool)

(assert (=> d!117333 e!557750))

(declare-fun res!661316 () Bool)

(assert (=> d!117333 (=> res!661316 e!557750)))

(declare-fun lt!438646 () Bool)

(assert (=> d!117333 (= res!661316 (not lt!438646))))

(declare-fun lt!438649 () Bool)

(assert (=> d!117333 (= lt!438646 lt!438649)))

(declare-fun lt!438647 () Unit!32782)

(declare-fun e!557751 () Unit!32782)

(assert (=> d!117333 (= lt!438647 e!557751)))

(declare-fun c!100392 () Bool)

(assert (=> d!117333 (= c!100392 lt!438649)))

(declare-fun containsKey!479 (List!20786 (_ BitVec 64)) Bool)

(assert (=> d!117333 (= lt!438649 (containsKey!479 (toList!6805 lt!438484) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117333 (= (contains!5735 lt!438484 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!438646)))

(declare-fun b!988992 () Bool)

(declare-fun lt!438648 () Unit!32782)

(assert (=> b!988992 (= e!557751 lt!438648)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!373 (List!20786 (_ BitVec 64)) Unit!32782)

(assert (=> b!988992 (= lt!438648 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438484) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun isDefined!381 (Option!516) Bool)

(assert (=> b!988992 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438484) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988993 () Bool)

(declare-fun Unit!32790 () Unit!32782)

(assert (=> b!988993 (= e!557751 Unit!32790)))

(declare-fun b!988994 () Bool)

(assert (=> b!988994 (= e!557750 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438484) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117333 c!100392) b!988992))

(assert (= (and d!117333 (not c!100392)) b!988993))

(assert (= (and d!117333 (not res!661316)) b!988994))

(assert (=> d!117333 m!915945))

(declare-fun m!916227 () Bool)

(assert (=> d!117333 m!916227))

(assert (=> b!988992 m!915945))

(declare-fun m!916229 () Bool)

(assert (=> b!988992 m!916229))

(assert (=> b!988992 m!915945))

(assert (=> b!988992 m!916195))

(assert (=> b!988992 m!916195))

(declare-fun m!916231 () Bool)

(assert (=> b!988992 m!916231))

(assert (=> b!988994 m!915945))

(assert (=> b!988994 m!916195))

(assert (=> b!988994 m!916195))

(assert (=> b!988994 m!916231))

(assert (=> b!988822 d!117333))

(assert (=> b!988917 d!117315))

(declare-fun d!117335 () Bool)

(assert (=> d!117335 (= (apply!902 lt!438585 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15633 (getValueByKey!510 (toList!6805 lt!438585) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28047 () Bool)

(assert (= bs!28047 d!117335))

(declare-fun m!916233 () Bool)

(assert (=> bs!28047 m!916233))

(assert (=> bs!28047 m!916233))

(declare-fun m!916235 () Bool)

(assert (=> bs!28047 m!916235))

(assert (=> b!988903 d!117335))

(declare-fun d!117337 () Bool)

(declare-fun e!557752 () Bool)

(assert (=> d!117337 e!557752))

(declare-fun res!661317 () Bool)

(assert (=> d!117337 (=> res!661317 e!557752)))

(declare-fun lt!438650 () Bool)

(assert (=> d!117337 (= res!661317 (not lt!438650))))

(declare-fun lt!438653 () Bool)

(assert (=> d!117337 (= lt!438650 lt!438653)))

(declare-fun lt!438651 () Unit!32782)

(declare-fun e!557753 () Unit!32782)

(assert (=> d!117337 (= lt!438651 e!557753)))

(declare-fun c!100393 () Bool)

(assert (=> d!117337 (= c!100393 lt!438653)))

(assert (=> d!117337 (= lt!438653 (containsKey!479 (toList!6805 lt!438506) (_1!7451 lt!438400)))))

(assert (=> d!117337 (= (contains!5735 lt!438506 (_1!7451 lt!438400)) lt!438650)))

(declare-fun b!988995 () Bool)

(declare-fun lt!438652 () Unit!32782)

(assert (=> b!988995 (= e!557753 lt!438652)))

(assert (=> b!988995 (= lt!438652 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438506) (_1!7451 lt!438400)))))

(assert (=> b!988995 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438506) (_1!7451 lt!438400)))))

(declare-fun b!988996 () Bool)

(declare-fun Unit!32791 () Unit!32782)

(assert (=> b!988996 (= e!557753 Unit!32791)))

(declare-fun b!988997 () Bool)

(assert (=> b!988997 (= e!557752 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438506) (_1!7451 lt!438400))))))

(assert (= (and d!117337 c!100393) b!988995))

(assert (= (and d!117337 (not c!100393)) b!988996))

(assert (= (and d!117337 (not res!661317)) b!988997))

(declare-fun m!916237 () Bool)

(assert (=> d!117337 m!916237))

(declare-fun m!916239 () Bool)

(assert (=> b!988995 m!916239))

(assert (=> b!988995 m!915991))

(assert (=> b!988995 m!915991))

(declare-fun m!916241 () Bool)

(assert (=> b!988995 m!916241))

(assert (=> b!988997 m!915991))

(assert (=> b!988997 m!915991))

(assert (=> b!988997 m!916241))

(assert (=> d!117295 d!117337))

(declare-fun b!989009 () Bool)

(declare-fun e!557759 () Option!516)

(assert (=> b!989009 (= e!557759 None!514)))

(declare-fun b!989006 () Bool)

(declare-fun e!557758 () Option!516)

(assert (=> b!989006 (= e!557758 (Some!515 (_2!7451 (h!21950 lt!438505))))))

(declare-fun d!117339 () Bool)

(declare-fun c!100398 () Bool)

(assert (=> d!117339 (= c!100398 (and ((_ is Cons!20782) lt!438505) (= (_1!7451 (h!21950 lt!438505)) (_1!7451 lt!438400))))))

(assert (=> d!117339 (= (getValueByKey!510 lt!438505 (_1!7451 lt!438400)) e!557758)))

(declare-fun b!989008 () Bool)

(assert (=> b!989008 (= e!557759 (getValueByKey!510 (t!29711 lt!438505) (_1!7451 lt!438400)))))

(declare-fun b!989007 () Bool)

(assert (=> b!989007 (= e!557758 e!557759)))

(declare-fun c!100399 () Bool)

(assert (=> b!989007 (= c!100399 (and ((_ is Cons!20782) lt!438505) (not (= (_1!7451 (h!21950 lt!438505)) (_1!7451 lt!438400)))))))

(assert (= (and d!117339 c!100398) b!989006))

(assert (= (and d!117339 (not c!100398)) b!989007))

(assert (= (and b!989007 c!100399) b!989008))

(assert (= (and b!989007 (not c!100399)) b!989009))

(declare-fun m!916243 () Bool)

(assert (=> b!989008 m!916243))

(assert (=> d!117295 d!117339))

(declare-fun d!117341 () Bool)

(assert (=> d!117341 (= (getValueByKey!510 lt!438505 (_1!7451 lt!438400)) (Some!515 (_2!7451 lt!438400)))))

(declare-fun lt!438656 () Unit!32782)

(declare-fun choose!1612 (List!20786 (_ BitVec 64) V!35945) Unit!32782)

(assert (=> d!117341 (= lt!438656 (choose!1612 lt!438505 (_1!7451 lt!438400) (_2!7451 lt!438400)))))

(declare-fun e!557762 () Bool)

(assert (=> d!117341 e!557762))

(declare-fun res!661322 () Bool)

(assert (=> d!117341 (=> (not res!661322) (not e!557762))))

(declare-fun isStrictlySorted!503 (List!20786) Bool)

(assert (=> d!117341 (= res!661322 (isStrictlySorted!503 lt!438505))))

(assert (=> d!117341 (= (lemmaContainsTupThenGetReturnValue!272 lt!438505 (_1!7451 lt!438400) (_2!7451 lt!438400)) lt!438656)))

(declare-fun b!989014 () Bool)

(declare-fun res!661323 () Bool)

(assert (=> b!989014 (=> (not res!661323) (not e!557762))))

(assert (=> b!989014 (= res!661323 (containsKey!479 lt!438505 (_1!7451 lt!438400)))))

(declare-fun b!989015 () Bool)

(assert (=> b!989015 (= e!557762 (contains!5736 lt!438505 (tuple2!14881 (_1!7451 lt!438400) (_2!7451 lt!438400))))))

(assert (= (and d!117341 res!661322) b!989014))

(assert (= (and b!989014 res!661323) b!989015))

(assert (=> d!117341 m!915985))

(declare-fun m!916245 () Bool)

(assert (=> d!117341 m!916245))

(declare-fun m!916247 () Bool)

(assert (=> d!117341 m!916247))

(declare-fun m!916249 () Bool)

(assert (=> b!989014 m!916249))

(declare-fun m!916251 () Bool)

(assert (=> b!989015 m!916251))

(assert (=> d!117295 d!117341))

(declare-fun b!989036 () Bool)

(declare-fun e!557775 () Bool)

(declare-fun lt!438659 () List!20786)

(assert (=> b!989036 (= e!557775 (contains!5736 lt!438659 (tuple2!14881 (_1!7451 lt!438400) (_2!7451 lt!438400))))))

(declare-fun b!989037 () Bool)

(declare-fun e!557774 () List!20786)

(declare-fun call!41902 () List!20786)

(assert (=> b!989037 (= e!557774 call!41902)))

(declare-fun b!989038 () Bool)

(declare-fun res!661328 () Bool)

(assert (=> b!989038 (=> (not res!661328) (not e!557775))))

(assert (=> b!989038 (= res!661328 (containsKey!479 lt!438659 (_1!7451 lt!438400)))))

(declare-fun b!989039 () Bool)

(declare-fun c!100411 () Bool)

(declare-fun e!557776 () List!20786)

(declare-fun c!100408 () Bool)

(assert (=> b!989039 (= e!557776 (ite c!100411 (t!29711 (toList!6805 lt!438397)) (ite c!100408 (Cons!20782 (h!21950 (toList!6805 lt!438397)) (t!29711 (toList!6805 lt!438397))) Nil!20783)))))

(declare-fun b!989040 () Bool)

(declare-fun e!557773 () List!20786)

(declare-fun call!41901 () List!20786)

(assert (=> b!989040 (= e!557773 call!41901)))

(declare-fun bm!41897 () Bool)

(assert (=> bm!41897 (= call!41902 call!41901)))

(declare-fun b!989041 () Bool)

(declare-fun e!557777 () List!20786)

(declare-fun call!41900 () List!20786)

(assert (=> b!989041 (= e!557777 call!41900)))

(declare-fun b!989042 () Bool)

(assert (=> b!989042 (= e!557774 call!41902)))

(declare-fun b!989043 () Bool)

(assert (=> b!989043 (= c!100408 (and ((_ is Cons!20782) (toList!6805 lt!438397)) (bvsgt (_1!7451 (h!21950 (toList!6805 lt!438397))) (_1!7451 lt!438400))))))

(assert (=> b!989043 (= e!557773 e!557774)))

(declare-fun d!117343 () Bool)

(assert (=> d!117343 e!557775))

(declare-fun res!661329 () Bool)

(assert (=> d!117343 (=> (not res!661329) (not e!557775))))

(assert (=> d!117343 (= res!661329 (isStrictlySorted!503 lt!438659))))

(assert (=> d!117343 (= lt!438659 e!557777)))

(declare-fun c!100409 () Bool)

(assert (=> d!117343 (= c!100409 (and ((_ is Cons!20782) (toList!6805 lt!438397)) (bvslt (_1!7451 (h!21950 (toList!6805 lt!438397))) (_1!7451 lt!438400))))))

(assert (=> d!117343 (isStrictlySorted!503 (toList!6805 lt!438397))))

(assert (=> d!117343 (= (insertStrictlySorted!329 (toList!6805 lt!438397) (_1!7451 lt!438400) (_2!7451 lt!438400)) lt!438659)))

(declare-fun b!989044 () Bool)

(assert (=> b!989044 (= e!557776 (insertStrictlySorted!329 (t!29711 (toList!6805 lt!438397)) (_1!7451 lt!438400) (_2!7451 lt!438400)))))

(declare-fun b!989045 () Bool)

(assert (=> b!989045 (= e!557777 e!557773)))

(assert (=> b!989045 (= c!100411 (and ((_ is Cons!20782) (toList!6805 lt!438397)) (= (_1!7451 (h!21950 (toList!6805 lt!438397))) (_1!7451 lt!438400))))))

(declare-fun bm!41898 () Bool)

(declare-fun $colon$colon!553 (List!20786 tuple2!14880) List!20786)

(assert (=> bm!41898 (= call!41900 ($colon$colon!553 e!557776 (ite c!100409 (h!21950 (toList!6805 lt!438397)) (tuple2!14881 (_1!7451 lt!438400) (_2!7451 lt!438400)))))))

(declare-fun c!100410 () Bool)

(assert (=> bm!41898 (= c!100410 c!100409)))

(declare-fun bm!41899 () Bool)

(assert (=> bm!41899 (= call!41901 call!41900)))

(assert (= (and d!117343 c!100409) b!989041))

(assert (= (and d!117343 (not c!100409)) b!989045))

(assert (= (and b!989045 c!100411) b!989040))

(assert (= (and b!989045 (not c!100411)) b!989043))

(assert (= (and b!989043 c!100408) b!989042))

(assert (= (and b!989043 (not c!100408)) b!989037))

(assert (= (or b!989042 b!989037) bm!41897))

(assert (= (or b!989040 bm!41897) bm!41899))

(assert (= (or b!989041 bm!41899) bm!41898))

(assert (= (and bm!41898 c!100410) b!989044))

(assert (= (and bm!41898 (not c!100410)) b!989039))

(assert (= (and d!117343 res!661329) b!989038))

(assert (= (and b!989038 res!661328) b!989036))

(declare-fun m!916253 () Bool)

(assert (=> b!989038 m!916253))

(declare-fun m!916255 () Bool)

(assert (=> b!989036 m!916255))

(declare-fun m!916257 () Bool)

(assert (=> b!989044 m!916257))

(declare-fun m!916259 () Bool)

(assert (=> d!117343 m!916259))

(declare-fun m!916261 () Bool)

(assert (=> d!117343 m!916261))

(declare-fun m!916263 () Bool)

(assert (=> bm!41898 m!916263))

(assert (=> d!117295 d!117343))

(declare-fun b!989046 () Bool)

(declare-fun e!557780 () Bool)

(declare-fun e!557781 () Bool)

(assert (=> b!989046 (= e!557780 e!557781)))

(declare-fun res!661330 () Bool)

(assert (=> b!989046 (=> (not res!661330) (not e!557781))))

(declare-fun e!557779 () Bool)

(assert (=> b!989046 (= res!661330 (not e!557779))))

(declare-fun res!661332 () Bool)

(assert (=> b!989046 (=> (not res!661332) (not e!557779))))

(assert (=> b!989046 (= res!661332 (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117345 () Bool)

(declare-fun res!661331 () Bool)

(assert (=> d!117345 (=> res!661331 e!557780)))

(assert (=> d!117345 (= res!661331 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30554 _keys!1544)))))

(assert (=> d!117345 (= (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100388 (Cons!20783 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) Nil!20784) Nil!20784)) e!557780)))

(declare-fun b!989047 () Bool)

(declare-fun e!557778 () Bool)

(declare-fun call!41903 () Bool)

(assert (=> b!989047 (= e!557778 call!41903)))

(declare-fun c!100412 () Bool)

(declare-fun bm!41900 () Bool)

(assert (=> bm!41900 (= call!41903 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!100412 (Cons!20783 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!100388 (Cons!20783 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) Nil!20784) Nil!20784)) (ite c!100388 (Cons!20783 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) Nil!20784) Nil!20784))))))

(declare-fun b!989048 () Bool)

(assert (=> b!989048 (= e!557778 call!41903)))

(declare-fun b!989049 () Bool)

(assert (=> b!989049 (= e!557779 (contains!5737 (ite c!100388 (Cons!20783 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) Nil!20784) Nil!20784) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!989050 () Bool)

(assert (=> b!989050 (= e!557781 e!557778)))

(assert (=> b!989050 (= c!100412 (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!117345 (not res!661331)) b!989046))

(assert (= (and b!989046 res!661332) b!989049))

(assert (= (and b!989046 res!661330) b!989050))

(assert (= (and b!989050 c!100412) b!989047))

(assert (= (and b!989050 (not c!100412)) b!989048))

(assert (= (or b!989047 b!989048) bm!41900))

(declare-fun m!916265 () Bool)

(assert (=> b!989046 m!916265))

(assert (=> b!989046 m!916265))

(declare-fun m!916267 () Bool)

(assert (=> b!989046 m!916267))

(assert (=> bm!41900 m!916265))

(declare-fun m!916269 () Bool)

(assert (=> bm!41900 m!916269))

(assert (=> b!989049 m!916265))

(assert (=> b!989049 m!916265))

(declare-fun m!916271 () Bool)

(assert (=> b!989049 m!916271))

(assert (=> b!989050 m!916265))

(assert (=> b!989050 m!916265))

(assert (=> b!989050 m!916267))

(assert (=> bm!41890 d!117345))

(declare-fun d!117347 () Bool)

(assert (=> d!117347 (= (validKeyInArray!0 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)) (and (not (= (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988959 d!117347))

(declare-fun d!117349 () Bool)

(declare-fun lt!438660 () Bool)

(assert (=> d!117349 (= lt!438660 (select (content!418 (toList!6805 lt!438619)) lt!438400))))

(declare-fun e!557782 () Bool)

(assert (=> d!117349 (= lt!438660 e!557782)))

(declare-fun res!661333 () Bool)

(assert (=> d!117349 (=> (not res!661333) (not e!557782))))

(assert (=> d!117349 (= res!661333 ((_ is Cons!20782) (toList!6805 lt!438619)))))

(assert (=> d!117349 (= (contains!5736 (toList!6805 lt!438619) lt!438400) lt!438660)))

(declare-fun b!989051 () Bool)

(declare-fun e!557783 () Bool)

(assert (=> b!989051 (= e!557782 e!557783)))

(declare-fun res!661334 () Bool)

(assert (=> b!989051 (=> res!661334 e!557783)))

(assert (=> b!989051 (= res!661334 (= (h!21950 (toList!6805 lt!438619)) lt!438400))))

(declare-fun b!989052 () Bool)

(assert (=> b!989052 (= e!557783 (contains!5736 (t!29711 (toList!6805 lt!438619)) lt!438400))))

(assert (= (and d!117349 res!661333) b!989051))

(assert (= (and b!989051 (not res!661334)) b!989052))

(declare-fun m!916273 () Bool)

(assert (=> d!117349 m!916273))

(declare-fun m!916275 () Bool)

(assert (=> d!117349 m!916275))

(declare-fun m!916277 () Bool)

(assert (=> b!989052 m!916277))

(assert (=> b!988936 d!117349))

(assert (=> b!988945 d!117347))

(declare-fun d!117351 () Bool)

(declare-fun e!557784 () Bool)

(assert (=> d!117351 e!557784))

(declare-fun res!661336 () Bool)

(assert (=> d!117351 (=> (not res!661336) (not e!557784))))

(declare-fun lt!438664 () ListLongMap!13579)

(assert (=> d!117351 (= res!661336 (contains!5735 lt!438664 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438663 () List!20786)

(assert (=> d!117351 (= lt!438664 (ListLongMap!13580 lt!438663))))

(declare-fun lt!438661 () Unit!32782)

(declare-fun lt!438662 () Unit!32782)

(assert (=> d!117351 (= lt!438661 lt!438662)))

(assert (=> d!117351 (= (getValueByKey!510 lt!438663 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117351 (= lt!438662 (lemmaContainsTupThenGetReturnValue!272 lt!438663 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117351 (= lt!438663 (insertStrictlySorted!329 (toList!6805 call!41884) (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117351 (= (+!3104 call!41884 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438664)))

(declare-fun b!989053 () Bool)

(declare-fun res!661335 () Bool)

(assert (=> b!989053 (=> (not res!661335) (not e!557784))))

(assert (=> b!989053 (= res!661335 (= (getValueByKey!510 (toList!6805 lt!438664) (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!989054 () Bool)

(assert (=> b!989054 (= e!557784 (contains!5736 (toList!6805 lt!438664) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117351 res!661336) b!989053))

(assert (= (and b!989053 res!661335) b!989054))

(declare-fun m!916279 () Bool)

(assert (=> d!117351 m!916279))

(declare-fun m!916281 () Bool)

(assert (=> d!117351 m!916281))

(declare-fun m!916283 () Bool)

(assert (=> d!117351 m!916283))

(declare-fun m!916285 () Bool)

(assert (=> d!117351 m!916285))

(declare-fun m!916287 () Bool)

(assert (=> b!989053 m!916287))

(declare-fun m!916289 () Bool)

(assert (=> b!989054 m!916289))

(assert (=> b!988934 d!117351))

(declare-fun d!117353 () Bool)

(declare-fun e!557785 () Bool)

(assert (=> d!117353 e!557785))

(declare-fun res!661338 () Bool)

(assert (=> d!117353 (=> (not res!661338) (not e!557785))))

(declare-fun lt!438668 () ListLongMap!13579)

(assert (=> d!117353 (= res!661338 (contains!5735 lt!438668 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!438667 () List!20786)

(assert (=> d!117353 (= lt!438668 (ListLongMap!13580 lt!438667))))

(declare-fun lt!438665 () Unit!32782)

(declare-fun lt!438666 () Unit!32782)

(assert (=> d!117353 (= lt!438665 lt!438666)))

(assert (=> d!117353 (= (getValueByKey!510 lt!438667 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117353 (= lt!438666 (lemmaContainsTupThenGetReturnValue!272 lt!438667 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117353 (= lt!438667 (insertStrictlySorted!329 (toList!6805 call!41859) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117353 (= (+!3104 call!41859 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!438668)))

(declare-fun b!989055 () Bool)

(declare-fun res!661337 () Bool)

(assert (=> b!989055 (=> (not res!661337) (not e!557785))))

(assert (=> b!989055 (= res!661337 (= (getValueByKey!510 (toList!6805 lt!438668) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!989056 () Bool)

(assert (=> b!989056 (= e!557785 (contains!5736 (toList!6805 lt!438668) (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117353 res!661338) b!989055))

(assert (= (and b!989055 res!661337) b!989056))

(declare-fun m!916291 () Bool)

(assert (=> d!117353 m!916291))

(declare-fun m!916293 () Bool)

(assert (=> d!117353 m!916293))

(declare-fun m!916295 () Bool)

(assert (=> d!117353 m!916295))

(declare-fun m!916297 () Bool)

(assert (=> d!117353 m!916297))

(declare-fun m!916299 () Bool)

(assert (=> b!989055 m!916299))

(declare-fun m!916301 () Bool)

(assert (=> b!989056 m!916301))

(assert (=> b!988829 d!117353))

(declare-fun d!117355 () Bool)

(assert (=> d!117355 (not (contains!5735 (+!3104 lt!438490 (tuple2!14881 lt!438488 lt!438489)) lt!438486))))

(declare-fun lt!438671 () Unit!32782)

(declare-fun choose!1613 (ListLongMap!13579 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32782)

(assert (=> d!117355 (= lt!438671 (choose!1613 lt!438490 lt!438488 lt!438489 lt!438486))))

(declare-fun e!557788 () Bool)

(assert (=> d!117355 e!557788))

(declare-fun res!661341 () Bool)

(assert (=> d!117355 (=> (not res!661341) (not e!557788))))

(assert (=> d!117355 (= res!661341 (not (contains!5735 lt!438490 lt!438486)))))

(assert (=> d!117355 (= (addStillNotContains!234 lt!438490 lt!438488 lt!438489 lt!438486) lt!438671)))

(declare-fun b!989060 () Bool)

(assert (=> b!989060 (= e!557788 (not (= lt!438488 lt!438486)))))

(assert (= (and d!117355 res!661341) b!989060))

(assert (=> d!117355 m!915965))

(assert (=> d!117355 m!915965))

(assert (=> d!117355 m!915967))

(declare-fun m!916303 () Bool)

(assert (=> d!117355 m!916303))

(declare-fun m!916305 () Bool)

(assert (=> d!117355 m!916305))

(assert (=> b!988829 d!117355))

(assert (=> b!988829 d!117325))

(declare-fun d!117357 () Bool)

(declare-fun e!557789 () Bool)

(assert (=> d!117357 e!557789))

(declare-fun res!661343 () Bool)

(assert (=> d!117357 (=> (not res!661343) (not e!557789))))

(declare-fun lt!438675 () ListLongMap!13579)

(assert (=> d!117357 (= res!661343 (contains!5735 lt!438675 (_1!7451 (tuple2!14881 lt!438488 lt!438489))))))

(declare-fun lt!438674 () List!20786)

(assert (=> d!117357 (= lt!438675 (ListLongMap!13580 lt!438674))))

(declare-fun lt!438672 () Unit!32782)

(declare-fun lt!438673 () Unit!32782)

(assert (=> d!117357 (= lt!438672 lt!438673)))

(assert (=> d!117357 (= (getValueByKey!510 lt!438674 (_1!7451 (tuple2!14881 lt!438488 lt!438489))) (Some!515 (_2!7451 (tuple2!14881 lt!438488 lt!438489))))))

(assert (=> d!117357 (= lt!438673 (lemmaContainsTupThenGetReturnValue!272 lt!438674 (_1!7451 (tuple2!14881 lt!438488 lt!438489)) (_2!7451 (tuple2!14881 lt!438488 lt!438489))))))

(assert (=> d!117357 (= lt!438674 (insertStrictlySorted!329 (toList!6805 lt!438490) (_1!7451 (tuple2!14881 lt!438488 lt!438489)) (_2!7451 (tuple2!14881 lt!438488 lt!438489))))))

(assert (=> d!117357 (= (+!3104 lt!438490 (tuple2!14881 lt!438488 lt!438489)) lt!438675)))

(declare-fun b!989061 () Bool)

(declare-fun res!661342 () Bool)

(assert (=> b!989061 (=> (not res!661342) (not e!557789))))

(assert (=> b!989061 (= res!661342 (= (getValueByKey!510 (toList!6805 lt!438675) (_1!7451 (tuple2!14881 lt!438488 lt!438489))) (Some!515 (_2!7451 (tuple2!14881 lt!438488 lt!438489)))))))

(declare-fun b!989062 () Bool)

(assert (=> b!989062 (= e!557789 (contains!5736 (toList!6805 lt!438675) (tuple2!14881 lt!438488 lt!438489)))))

(assert (= (and d!117357 res!661343) b!989061))

(assert (= (and b!989061 res!661342) b!989062))

(declare-fun m!916307 () Bool)

(assert (=> d!117357 m!916307))

(declare-fun m!916309 () Bool)

(assert (=> d!117357 m!916309))

(declare-fun m!916311 () Bool)

(assert (=> d!117357 m!916311))

(declare-fun m!916313 () Bool)

(assert (=> d!117357 m!916313))

(declare-fun m!916315 () Bool)

(assert (=> b!989061 m!916315))

(declare-fun m!916317 () Bool)

(assert (=> b!989062 m!916317))

(assert (=> b!988829 d!117357))

(declare-fun d!117359 () Bool)

(declare-fun e!557790 () Bool)

(assert (=> d!117359 e!557790))

(declare-fun res!661344 () Bool)

(assert (=> d!117359 (=> res!661344 e!557790)))

(declare-fun lt!438676 () Bool)

(assert (=> d!117359 (= res!661344 (not lt!438676))))

(declare-fun lt!438679 () Bool)

(assert (=> d!117359 (= lt!438676 lt!438679)))

(declare-fun lt!438677 () Unit!32782)

(declare-fun e!557791 () Unit!32782)

(assert (=> d!117359 (= lt!438677 e!557791)))

(declare-fun c!100413 () Bool)

(assert (=> d!117359 (= c!100413 lt!438679)))

(assert (=> d!117359 (= lt!438679 (containsKey!479 (toList!6805 (+!3104 lt!438490 (tuple2!14881 lt!438488 lt!438489))) lt!438486))))

(assert (=> d!117359 (= (contains!5735 (+!3104 lt!438490 (tuple2!14881 lt!438488 lt!438489)) lt!438486) lt!438676)))

(declare-fun b!989063 () Bool)

(declare-fun lt!438678 () Unit!32782)

(assert (=> b!989063 (= e!557791 lt!438678)))

(assert (=> b!989063 (= lt!438678 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 (+!3104 lt!438490 (tuple2!14881 lt!438488 lt!438489))) lt!438486))))

(assert (=> b!989063 (isDefined!381 (getValueByKey!510 (toList!6805 (+!3104 lt!438490 (tuple2!14881 lt!438488 lt!438489))) lt!438486))))

(declare-fun b!989064 () Bool)

(declare-fun Unit!32792 () Unit!32782)

(assert (=> b!989064 (= e!557791 Unit!32792)))

(declare-fun b!989065 () Bool)

(assert (=> b!989065 (= e!557790 (isDefined!381 (getValueByKey!510 (toList!6805 (+!3104 lt!438490 (tuple2!14881 lt!438488 lt!438489))) lt!438486)))))

(assert (= (and d!117359 c!100413) b!989063))

(assert (= (and d!117359 (not c!100413)) b!989064))

(assert (= (and d!117359 (not res!661344)) b!989065))

(declare-fun m!916319 () Bool)

(assert (=> d!117359 m!916319))

(declare-fun m!916321 () Bool)

(assert (=> b!989063 m!916321))

(declare-fun m!916323 () Bool)

(assert (=> b!989063 m!916323))

(assert (=> b!989063 m!916323))

(declare-fun m!916325 () Bool)

(assert (=> b!989063 m!916325))

(assert (=> b!989065 m!916323))

(assert (=> b!989065 m!916323))

(assert (=> b!989065 m!916325))

(assert (=> b!988829 d!117359))

(declare-fun b!989066 () Bool)

(declare-fun res!661345 () Bool)

(declare-fun e!557792 () Bool)

(assert (=> b!989066 (=> (not res!661345) (not e!557792))))

(declare-fun lt!438680 () ListLongMap!13579)

(assert (=> b!989066 (= res!661345 (not (contains!5735 lt!438680 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989067 () Bool)

(declare-fun e!557797 () Bool)

(declare-fun e!557796 () Bool)

(assert (=> b!989067 (= e!557797 e!557796)))

(assert (=> b!989067 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30554 _keys!1544)))))

(declare-fun res!661347 () Bool)

(assert (=> b!989067 (= res!661347 (contains!5735 lt!438680 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!989067 (=> (not res!661347) (not e!557796))))

(declare-fun b!989068 () Bool)

(declare-fun e!557798 () ListLongMap!13579)

(declare-fun call!41904 () ListLongMap!13579)

(assert (=> b!989068 (= e!557798 call!41904)))

(declare-fun b!989069 () Bool)

(assert (=> b!989069 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30554 _keys!1544)))))

(assert (=> b!989069 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30555 _values!1278)))))

(assert (=> b!989069 (= e!557796 (= (apply!902 lt!438680 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!989070 () Bool)

(declare-fun e!557795 () Bool)

(assert (=> b!989070 (= e!557795 (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(assert (=> b!989070 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!989071 () Bool)

(declare-fun e!557794 () ListLongMap!13579)

(assert (=> b!989071 (= e!557794 (ListLongMap!13580 Nil!20783))))

(declare-fun b!989072 () Bool)

(declare-fun e!557793 () Bool)

(assert (=> b!989072 (= e!557793 (isEmpty!726 lt!438680))))

(declare-fun bm!41901 () Bool)

(assert (=> bm!41901 (= call!41904 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!989073 () Bool)

(assert (=> b!989073 (= e!557792 e!557797)))

(declare-fun c!100417 () Bool)

(assert (=> b!989073 (= c!100417 e!557795)))

(declare-fun res!661346 () Bool)

(assert (=> b!989073 (=> (not res!661346) (not e!557795))))

(assert (=> b!989073 (= res!661346 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30554 _keys!1544)))))

(declare-fun b!989074 () Bool)

(declare-fun lt!438681 () Unit!32782)

(declare-fun lt!438683 () Unit!32782)

(assert (=> b!989074 (= lt!438681 lt!438683)))

(declare-fun lt!438682 () (_ BitVec 64))

(declare-fun lt!438686 () ListLongMap!13579)

(declare-fun lt!438685 () V!35945)

(declare-fun lt!438684 () (_ BitVec 64))

(assert (=> b!989074 (not (contains!5735 (+!3104 lt!438686 (tuple2!14881 lt!438684 lt!438685)) lt!438682))))

(assert (=> b!989074 (= lt!438683 (addStillNotContains!234 lt!438686 lt!438684 lt!438685 lt!438682))))

(assert (=> b!989074 (= lt!438682 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989074 (= lt!438685 (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989074 (= lt!438684 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)))))

(assert (=> b!989074 (= lt!438686 call!41904)))

(assert (=> b!989074 (= e!557798 (+!3104 call!41904 (tuple2!14881 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (get!15628 (select (arr!30075 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!989076 () Bool)

(assert (=> b!989076 (= e!557797 e!557793)))

(declare-fun c!100415 () Bool)

(assert (=> b!989076 (= c!100415 (bvslt (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30554 _keys!1544)))))

(declare-fun b!989077 () Bool)

(assert (=> b!989077 (= e!557794 e!557798)))

(declare-fun c!100414 () Bool)

(assert (=> b!989077 (= c!100414 (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001))))))

(declare-fun d!117361 () Bool)

(assert (=> d!117361 e!557792))

(declare-fun res!661348 () Bool)

(assert (=> d!117361 (=> (not res!661348) (not e!557792))))

(assert (=> d!117361 (= res!661348 (not (contains!5735 lt!438680 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117361 (= lt!438680 e!557794)))

(declare-fun c!100416 () Bool)

(assert (=> d!117361 (= c!100416 (bvsge (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) (size!30554 _keys!1544)))))

(assert (=> d!117361 (validMask!0 mask!1948)))

(assert (=> d!117361 (= (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281) lt!438680)))

(declare-fun b!989075 () Bool)

(assert (=> b!989075 (= e!557793 (= lt!438680 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1281)))))

(assert (= (and d!117361 c!100416) b!989071))

(assert (= (and d!117361 (not c!100416)) b!989077))

(assert (= (and b!989077 c!100414) b!989074))

(assert (= (and b!989077 (not c!100414)) b!989068))

(assert (= (or b!989074 b!989068) bm!41901))

(assert (= (and d!117361 res!661348) b!989066))

(assert (= (and b!989066 res!661345) b!989073))

(assert (= (and b!989073 res!661346) b!989070))

(assert (= (and b!989073 c!100417) b!989067))

(assert (= (and b!989073 (not c!100417)) b!989076))

(assert (= (and b!989067 res!661347) b!989069))

(assert (= (and b!989076 c!100415) b!989075))

(assert (= (and b!989076 (not c!100415)) b!989072))

(declare-fun b_lambda!15075 () Bool)

(assert (=> (not b_lambda!15075) (not b!989069)))

(assert (=> b!989069 t!29710))

(declare-fun b_and!32107 () Bool)

(assert (= b_and!32105 (and (=> t!29710 result!13551) b_and!32107)))

(declare-fun b_lambda!15077 () Bool)

(assert (=> (not b_lambda!15077) (not b!989074)))

(assert (=> b!989074 t!29710))

(declare-fun b_and!32109 () Bool)

(assert (= b_and!32107 (and (=> t!29710 result!13551) b_and!32109)))

(declare-fun m!916327 () Bool)

(assert (=> b!989075 m!916327))

(declare-fun m!916329 () Bool)

(assert (=> b!989067 m!916329))

(assert (=> b!989067 m!916329))

(declare-fun m!916331 () Bool)

(assert (=> b!989067 m!916331))

(declare-fun m!916333 () Bool)

(assert (=> b!989066 m!916333))

(assert (=> b!989070 m!916329))

(assert (=> b!989070 m!916329))

(declare-fun m!916335 () Bool)

(assert (=> b!989070 m!916335))

(declare-fun m!916337 () Bool)

(assert (=> b!989072 m!916337))

(declare-fun m!916339 () Bool)

(assert (=> d!117361 m!916339))

(assert (=> d!117361 m!915801))

(assert (=> b!989077 m!916329))

(assert (=> b!989077 m!916329))

(assert (=> b!989077 m!916335))

(assert (=> bm!41901 m!916327))

(assert (=> b!989069 m!915823))

(assert (=> b!989069 m!916329))

(declare-fun m!916341 () Bool)

(assert (=> b!989069 m!916341))

(declare-fun m!916343 () Bool)

(assert (=> b!989069 m!916343))

(assert (=> b!989069 m!916343))

(assert (=> b!989069 m!915823))

(declare-fun m!916345 () Bool)

(assert (=> b!989069 m!916345))

(assert (=> b!989069 m!916329))

(declare-fun m!916347 () Bool)

(assert (=> b!989074 m!916347))

(declare-fun m!916349 () Bool)

(assert (=> b!989074 m!916349))

(declare-fun m!916351 () Bool)

(assert (=> b!989074 m!916351))

(assert (=> b!989074 m!915823))

(assert (=> b!989074 m!916343))

(assert (=> b!989074 m!916343))

(assert (=> b!989074 m!915823))

(assert (=> b!989074 m!916345))

(assert (=> b!989074 m!916349))

(assert (=> b!989074 m!916329))

(declare-fun m!916353 () Bool)

(assert (=> b!989074 m!916353))

(assert (=> bm!41856 d!117361))

(declare-fun d!117363 () Bool)

(assert (=> d!117363 (= (apply!902 lt!438611 (select (arr!30074 _keys!1544) from!1932)) (get!15633 (getValueByKey!510 (toList!6805 lt!438611) (select (arr!30074 _keys!1544) from!1932))))))

(declare-fun bs!28048 () Bool)

(assert (= bs!28048 d!117363))

(assert (=> bs!28048 m!915785))

(declare-fun m!916355 () Bool)

(assert (=> bs!28048 m!916355))

(assert (=> bs!28048 m!916355))

(declare-fun m!916357 () Bool)

(assert (=> bs!28048 m!916357))

(assert (=> b!988915 d!117363))

(assert (=> b!988915 d!117289))

(declare-fun d!117365 () Bool)

(declare-fun e!557799 () Bool)

(assert (=> d!117365 e!557799))

(declare-fun res!661349 () Bool)

(assert (=> d!117365 (=> res!661349 e!557799)))

(declare-fun lt!438687 () Bool)

(assert (=> d!117365 (= res!661349 (not lt!438687))))

(declare-fun lt!438690 () Bool)

(assert (=> d!117365 (= lt!438687 lt!438690)))

(declare-fun lt!438688 () Unit!32782)

(declare-fun e!557800 () Unit!32782)

(assert (=> d!117365 (= lt!438688 e!557800)))

(declare-fun c!100418 () Bool)

(assert (=> d!117365 (= c!100418 lt!438690)))

(assert (=> d!117365 (= lt!438690 (containsKey!479 (toList!6805 lt!438611) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117365 (= (contains!5735 lt!438611 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438687)))

(declare-fun b!989078 () Bool)

(declare-fun lt!438689 () Unit!32782)

(assert (=> b!989078 (= e!557800 lt!438689)))

(assert (=> b!989078 (= lt!438689 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438611) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989078 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438611) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989079 () Bool)

(declare-fun Unit!32793 () Unit!32782)

(assert (=> b!989079 (= e!557800 Unit!32793)))

(declare-fun b!989080 () Bool)

(assert (=> b!989080 (= e!557799 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117365 c!100418) b!989078))

(assert (= (and d!117365 (not c!100418)) b!989079))

(assert (= (and d!117365 (not res!661349)) b!989080))

(declare-fun m!916359 () Bool)

(assert (=> d!117365 m!916359))

(declare-fun m!916361 () Bool)

(assert (=> b!989078 m!916361))

(declare-fun m!916363 () Bool)

(assert (=> b!989078 m!916363))

(assert (=> b!989078 m!916363))

(declare-fun m!916365 () Bool)

(assert (=> b!989078 m!916365))

(assert (=> b!989080 m!916363))

(assert (=> b!989080 m!916363))

(assert (=> b!989080 m!916365))

(assert (=> bm!41880 d!117365))

(declare-fun d!117367 () Bool)

(assert (=> d!117367 (= (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (and (not (= (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988900 d!117367))

(declare-fun d!117369 () Bool)

(assert (=> d!117369 (= (get!15632 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!988796 d!117369))

(declare-fun d!117371 () Bool)

(declare-fun e!557801 () Bool)

(assert (=> d!117371 e!557801))

(declare-fun res!661350 () Bool)

(assert (=> d!117371 (=> res!661350 e!557801)))

(declare-fun lt!438691 () Bool)

(assert (=> d!117371 (= res!661350 (not lt!438691))))

(declare-fun lt!438694 () Bool)

(assert (=> d!117371 (= lt!438691 lt!438694)))

(declare-fun lt!438692 () Unit!32782)

(declare-fun e!557802 () Unit!32782)

(assert (=> d!117371 (= lt!438692 e!557802)))

(declare-fun c!100419 () Bool)

(assert (=> d!117371 (= c!100419 lt!438694)))

(assert (=> d!117371 (= lt!438694 (containsKey!479 (toList!6805 lt!438518) (_1!7451 lt!438403)))))

(assert (=> d!117371 (= (contains!5735 lt!438518 (_1!7451 lt!438403)) lt!438691)))

(declare-fun b!989081 () Bool)

(declare-fun lt!438693 () Unit!32782)

(assert (=> b!989081 (= e!557802 lt!438693)))

(assert (=> b!989081 (= lt!438693 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438518) (_1!7451 lt!438403)))))

(assert (=> b!989081 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438518) (_1!7451 lt!438403)))))

(declare-fun b!989082 () Bool)

(declare-fun Unit!32794 () Unit!32782)

(assert (=> b!989082 (= e!557802 Unit!32794)))

(declare-fun b!989083 () Bool)

(assert (=> b!989083 (= e!557801 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438518) (_1!7451 lt!438403))))))

(assert (= (and d!117371 c!100419) b!989081))

(assert (= (and d!117371 (not c!100419)) b!989082))

(assert (= (and d!117371 (not res!661350)) b!989083))

(declare-fun m!916367 () Bool)

(assert (=> d!117371 m!916367))

(declare-fun m!916369 () Bool)

(assert (=> b!989081 m!916369))

(assert (=> b!989081 m!916027))

(assert (=> b!989081 m!916027))

(declare-fun m!916371 () Bool)

(assert (=> b!989081 m!916371))

(assert (=> b!989083 m!916027))

(assert (=> b!989083 m!916027))

(assert (=> b!989083 m!916371))

(assert (=> d!117301 d!117371))

(declare-fun b!989087 () Bool)

(declare-fun e!557804 () Option!516)

(assert (=> b!989087 (= e!557804 None!514)))

(declare-fun b!989084 () Bool)

(declare-fun e!557803 () Option!516)

(assert (=> b!989084 (= e!557803 (Some!515 (_2!7451 (h!21950 lt!438517))))))

(declare-fun d!117373 () Bool)

(declare-fun c!100420 () Bool)

(assert (=> d!117373 (= c!100420 (and ((_ is Cons!20782) lt!438517) (= (_1!7451 (h!21950 lt!438517)) (_1!7451 lt!438403))))))

(assert (=> d!117373 (= (getValueByKey!510 lt!438517 (_1!7451 lt!438403)) e!557803)))

(declare-fun b!989086 () Bool)

(assert (=> b!989086 (= e!557804 (getValueByKey!510 (t!29711 lt!438517) (_1!7451 lt!438403)))))

(declare-fun b!989085 () Bool)

(assert (=> b!989085 (= e!557803 e!557804)))

(declare-fun c!100421 () Bool)

(assert (=> b!989085 (= c!100421 (and ((_ is Cons!20782) lt!438517) (not (= (_1!7451 (h!21950 lt!438517)) (_1!7451 lt!438403)))))))

(assert (= (and d!117373 c!100420) b!989084))

(assert (= (and d!117373 (not c!100420)) b!989085))

(assert (= (and b!989085 c!100421) b!989086))

(assert (= (and b!989085 (not c!100421)) b!989087))

(declare-fun m!916373 () Bool)

(assert (=> b!989086 m!916373))

(assert (=> d!117301 d!117373))

(declare-fun d!117375 () Bool)

(assert (=> d!117375 (= (getValueByKey!510 lt!438517 (_1!7451 lt!438403)) (Some!515 (_2!7451 lt!438403)))))

(declare-fun lt!438695 () Unit!32782)

(assert (=> d!117375 (= lt!438695 (choose!1612 lt!438517 (_1!7451 lt!438403) (_2!7451 lt!438403)))))

(declare-fun e!557805 () Bool)

(assert (=> d!117375 e!557805))

(declare-fun res!661351 () Bool)

(assert (=> d!117375 (=> (not res!661351) (not e!557805))))

(assert (=> d!117375 (= res!661351 (isStrictlySorted!503 lt!438517))))

(assert (=> d!117375 (= (lemmaContainsTupThenGetReturnValue!272 lt!438517 (_1!7451 lt!438403) (_2!7451 lt!438403)) lt!438695)))

(declare-fun b!989088 () Bool)

(declare-fun res!661352 () Bool)

(assert (=> b!989088 (=> (not res!661352) (not e!557805))))

(assert (=> b!989088 (= res!661352 (containsKey!479 lt!438517 (_1!7451 lt!438403)))))

(declare-fun b!989089 () Bool)

(assert (=> b!989089 (= e!557805 (contains!5736 lt!438517 (tuple2!14881 (_1!7451 lt!438403) (_2!7451 lt!438403))))))

(assert (= (and d!117375 res!661351) b!989088))

(assert (= (and b!989088 res!661352) b!989089))

(assert (=> d!117375 m!916021))

(declare-fun m!916375 () Bool)

(assert (=> d!117375 m!916375))

(declare-fun m!916377 () Bool)

(assert (=> d!117375 m!916377))

(declare-fun m!916379 () Bool)

(assert (=> b!989088 m!916379))

(declare-fun m!916381 () Bool)

(assert (=> b!989089 m!916381))

(assert (=> d!117301 d!117375))

(declare-fun b!989090 () Bool)

(declare-fun e!557808 () Bool)

(declare-fun lt!438696 () List!20786)

(assert (=> b!989090 (= e!557808 (contains!5736 lt!438696 (tuple2!14881 (_1!7451 lt!438403) (_2!7451 lt!438403))))))

(declare-fun b!989091 () Bool)

(declare-fun e!557807 () List!20786)

(declare-fun call!41907 () List!20786)

(assert (=> b!989091 (= e!557807 call!41907)))

(declare-fun b!989092 () Bool)

(declare-fun res!661353 () Bool)

(assert (=> b!989092 (=> (not res!661353) (not e!557808))))

(assert (=> b!989092 (= res!661353 (containsKey!479 lt!438696 (_1!7451 lt!438403)))))

(declare-fun c!100422 () Bool)

(declare-fun c!100425 () Bool)

(declare-fun b!989093 () Bool)

(declare-fun e!557809 () List!20786)

(assert (=> b!989093 (= e!557809 (ite c!100425 (t!29711 (toList!6805 lt!438402)) (ite c!100422 (Cons!20782 (h!21950 (toList!6805 lt!438402)) (t!29711 (toList!6805 lt!438402))) Nil!20783)))))

(declare-fun b!989094 () Bool)

(declare-fun e!557806 () List!20786)

(declare-fun call!41906 () List!20786)

(assert (=> b!989094 (= e!557806 call!41906)))

(declare-fun bm!41902 () Bool)

(assert (=> bm!41902 (= call!41907 call!41906)))

(declare-fun b!989095 () Bool)

(declare-fun e!557810 () List!20786)

(declare-fun call!41905 () List!20786)

(assert (=> b!989095 (= e!557810 call!41905)))

(declare-fun b!989096 () Bool)

(assert (=> b!989096 (= e!557807 call!41907)))

(declare-fun b!989097 () Bool)

(assert (=> b!989097 (= c!100422 (and ((_ is Cons!20782) (toList!6805 lt!438402)) (bvsgt (_1!7451 (h!21950 (toList!6805 lt!438402))) (_1!7451 lt!438403))))))

(assert (=> b!989097 (= e!557806 e!557807)))

(declare-fun d!117377 () Bool)

(assert (=> d!117377 e!557808))

(declare-fun res!661354 () Bool)

(assert (=> d!117377 (=> (not res!661354) (not e!557808))))

(assert (=> d!117377 (= res!661354 (isStrictlySorted!503 lt!438696))))

(assert (=> d!117377 (= lt!438696 e!557810)))

(declare-fun c!100423 () Bool)

(assert (=> d!117377 (= c!100423 (and ((_ is Cons!20782) (toList!6805 lt!438402)) (bvslt (_1!7451 (h!21950 (toList!6805 lt!438402))) (_1!7451 lt!438403))))))

(assert (=> d!117377 (isStrictlySorted!503 (toList!6805 lt!438402))))

(assert (=> d!117377 (= (insertStrictlySorted!329 (toList!6805 lt!438402) (_1!7451 lt!438403) (_2!7451 lt!438403)) lt!438696)))

(declare-fun b!989098 () Bool)

(assert (=> b!989098 (= e!557809 (insertStrictlySorted!329 (t!29711 (toList!6805 lt!438402)) (_1!7451 lt!438403) (_2!7451 lt!438403)))))

(declare-fun b!989099 () Bool)

(assert (=> b!989099 (= e!557810 e!557806)))

(assert (=> b!989099 (= c!100425 (and ((_ is Cons!20782) (toList!6805 lt!438402)) (= (_1!7451 (h!21950 (toList!6805 lt!438402))) (_1!7451 lt!438403))))))

(declare-fun bm!41903 () Bool)

(assert (=> bm!41903 (= call!41905 ($colon$colon!553 e!557809 (ite c!100423 (h!21950 (toList!6805 lt!438402)) (tuple2!14881 (_1!7451 lt!438403) (_2!7451 lt!438403)))))))

(declare-fun c!100424 () Bool)

(assert (=> bm!41903 (= c!100424 c!100423)))

(declare-fun bm!41904 () Bool)

(assert (=> bm!41904 (= call!41906 call!41905)))

(assert (= (and d!117377 c!100423) b!989095))

(assert (= (and d!117377 (not c!100423)) b!989099))

(assert (= (and b!989099 c!100425) b!989094))

(assert (= (and b!989099 (not c!100425)) b!989097))

(assert (= (and b!989097 c!100422) b!989096))

(assert (= (and b!989097 (not c!100422)) b!989091))

(assert (= (or b!989096 b!989091) bm!41902))

(assert (= (or b!989094 bm!41902) bm!41904))

(assert (= (or b!989095 bm!41904) bm!41903))

(assert (= (and bm!41903 c!100424) b!989098))

(assert (= (and bm!41903 (not c!100424)) b!989093))

(assert (= (and d!117377 res!661354) b!989092))

(assert (= (and b!989092 res!661353) b!989090))

(declare-fun m!916383 () Bool)

(assert (=> b!989092 m!916383))

(declare-fun m!916385 () Bool)

(assert (=> b!989090 m!916385))

(declare-fun m!916387 () Bool)

(assert (=> b!989098 m!916387))

(declare-fun m!916389 () Bool)

(assert (=> d!117377 m!916389))

(declare-fun m!916391 () Bool)

(assert (=> d!117377 m!916391))

(declare-fun m!916393 () Bool)

(assert (=> bm!41903 m!916393))

(assert (=> d!117301 d!117377))

(declare-fun d!117379 () Bool)

(assert (=> d!117379 (= (apply!902 lt!438611 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15633 (getValueByKey!510 (toList!6805 lt!438611) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28049 () Bool)

(assert (= bs!28049 d!117379))

(assert (=> bs!28049 m!916363))

(assert (=> bs!28049 m!916363))

(declare-fun m!916395 () Bool)

(assert (=> bs!28049 m!916395))

(assert (=> b!988922 d!117379))

(declare-fun d!117381 () Bool)

(declare-fun lt!438699 () Bool)

(declare-fun content!419 (List!20787) (InoxSet (_ BitVec 64)))

(assert (=> d!117381 (= lt!438699 (select (content!419 Nil!20784) (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun e!557816 () Bool)

(assert (=> d!117381 (= lt!438699 e!557816)))

(declare-fun res!661360 () Bool)

(assert (=> d!117381 (=> (not res!661360) (not e!557816))))

(assert (=> d!117381 (= res!661360 ((_ is Cons!20783) Nil!20784))))

(assert (=> d!117381 (= (contains!5737 Nil!20784 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)) lt!438699)))

(declare-fun b!989104 () Bool)

(declare-fun e!557815 () Bool)

(assert (=> b!989104 (= e!557816 e!557815)))

(declare-fun res!661359 () Bool)

(assert (=> b!989104 (=> res!661359 e!557815)))

(assert (=> b!989104 (= res!661359 (= (h!21951 Nil!20784) (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989105 () Bool)

(assert (=> b!989105 (= e!557815 (contains!5737 (t!29712 Nil!20784) (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!117381 res!661360) b!989104))

(assert (= (and b!989104 (not res!661359)) b!989105))

(declare-fun m!916397 () Bool)

(assert (=> d!117381 m!916397))

(assert (=> d!117381 m!916171))

(declare-fun m!916399 () Bool)

(assert (=> d!117381 m!916399))

(assert (=> b!989105 m!916171))

(declare-fun m!916401 () Bool)

(assert (=> b!989105 m!916401))

(assert (=> b!988962 d!117381))

(declare-fun d!117383 () Bool)

(assert (=> d!117383 (arrayContainsKey!0 _keys!1544 lt!438627 #b00000000000000000000000000000000)))

(declare-fun lt!438702 () Unit!32782)

(declare-fun choose!13 (array!62446 (_ BitVec 64) (_ BitVec 32)) Unit!32782)

(assert (=> d!117383 (= lt!438702 (choose!13 _keys!1544 lt!438627 #b00000000000000000000000000000000))))

(assert (=> d!117383 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!117383 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438627 #b00000000000000000000000000000000) lt!438702)))

(declare-fun bs!28050 () Bool)

(assert (= bs!28050 d!117383))

(assert (=> bs!28050 m!916179))

(declare-fun m!916403 () Bool)

(assert (=> bs!28050 m!916403))

(assert (=> b!988948 d!117383))

(declare-fun d!117385 () Bool)

(declare-fun res!661365 () Bool)

(declare-fun e!557821 () Bool)

(assert (=> d!117385 (=> res!661365 e!557821)))

(assert (=> d!117385 (= res!661365 (= (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) lt!438627))))

(assert (=> d!117385 (= (arrayContainsKey!0 _keys!1544 lt!438627 #b00000000000000000000000000000000) e!557821)))

(declare-fun b!989110 () Bool)

(declare-fun e!557822 () Bool)

(assert (=> b!989110 (= e!557821 e!557822)))

(declare-fun res!661366 () Bool)

(assert (=> b!989110 (=> (not res!661366) (not e!557822))))

(assert (=> b!989110 (= res!661366 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30554 _keys!1544)))))

(declare-fun b!989111 () Bool)

(assert (=> b!989111 (= e!557822 (arrayContainsKey!0 _keys!1544 lt!438627 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!117385 (not res!661365)) b!989110))

(assert (= (and b!989110 res!661366) b!989111))

(assert (=> d!117385 m!916171))

(declare-fun m!916405 () Bool)

(assert (=> b!989111 m!916405))

(assert (=> b!988948 d!117385))

(declare-fun e!557831 () SeekEntryResult!9163)

(declare-fun b!989124 () Bool)

(declare-fun lt!438709 () SeekEntryResult!9163)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62446 (_ BitVec 32)) SeekEntryResult!9163)

(assert (=> b!989124 (= e!557831 (seekKeyOrZeroReturnVacant!0 (x!85967 lt!438709) (index!39025 lt!438709) (index!39025 lt!438709) (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(declare-fun b!989125 () Bool)

(declare-fun e!557830 () SeekEntryResult!9163)

(declare-fun e!557829 () SeekEntryResult!9163)

(assert (=> b!989125 (= e!557830 e!557829)))

(declare-fun lt!438710 () (_ BitVec 64))

(assert (=> b!989125 (= lt!438710 (select (arr!30074 _keys!1544) (index!39025 lt!438709)))))

(declare-fun c!100432 () Bool)

(assert (=> b!989125 (= c!100432 (= lt!438710 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989126 () Bool)

(assert (=> b!989126 (= e!557829 (Found!9163 (index!39025 lt!438709)))))

(declare-fun b!989127 () Bool)

(assert (=> b!989127 (= e!557830 Undefined!9163)))

(declare-fun d!117387 () Bool)

(declare-fun lt!438711 () SeekEntryResult!9163)

(assert (=> d!117387 (and (or ((_ is Undefined!9163) lt!438711) (not ((_ is Found!9163) lt!438711)) (and (bvsge (index!39024 lt!438711) #b00000000000000000000000000000000) (bvslt (index!39024 lt!438711) (size!30554 _keys!1544)))) (or ((_ is Undefined!9163) lt!438711) ((_ is Found!9163) lt!438711) (not ((_ is MissingZero!9163) lt!438711)) (and (bvsge (index!39023 lt!438711) #b00000000000000000000000000000000) (bvslt (index!39023 lt!438711) (size!30554 _keys!1544)))) (or ((_ is Undefined!9163) lt!438711) ((_ is Found!9163) lt!438711) ((_ is MissingZero!9163) lt!438711) (not ((_ is MissingVacant!9163) lt!438711)) (and (bvsge (index!39026 lt!438711) #b00000000000000000000000000000000) (bvslt (index!39026 lt!438711) (size!30554 _keys!1544)))) (or ((_ is Undefined!9163) lt!438711) (ite ((_ is Found!9163) lt!438711) (= (select (arr!30074 _keys!1544) (index!39024 lt!438711)) (select (arr!30074 _keys!1544) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9163) lt!438711) (= (select (arr!30074 _keys!1544) (index!39023 lt!438711)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9163) lt!438711) (= (select (arr!30074 _keys!1544) (index!39026 lt!438711)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!117387 (= lt!438711 e!557830)))

(declare-fun c!100434 () Bool)

(assert (=> d!117387 (= c!100434 (and ((_ is Intermediate!9163) lt!438709) (undefined!9975 lt!438709)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62446 (_ BitVec 32)) SeekEntryResult!9163)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!117387 (= lt!438709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) mask!1948) (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948))))

(assert (=> d!117387 (validMask!0 mask!1948)))

(assert (=> d!117387 (= (seekEntryOrOpen!0 (select (arr!30074 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) lt!438711)))

(declare-fun b!989128 () Bool)

(assert (=> b!989128 (= e!557831 (MissingZero!9163 (index!39025 lt!438709)))))

(declare-fun b!989129 () Bool)

(declare-fun c!100433 () Bool)

(assert (=> b!989129 (= c!100433 (= lt!438710 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989129 (= e!557829 e!557831)))

(assert (= (and d!117387 c!100434) b!989127))

(assert (= (and d!117387 (not c!100434)) b!989125))

(assert (= (and b!989125 c!100432) b!989126))

(assert (= (and b!989125 (not c!100432)) b!989129))

(assert (= (and b!989129 c!100433) b!989128))

(assert (= (and b!989129 (not c!100433)) b!989124))

(assert (=> b!989124 m!916171))

(declare-fun m!916407 () Bool)

(assert (=> b!989124 m!916407))

(declare-fun m!916409 () Bool)

(assert (=> b!989125 m!916409))

(declare-fun m!916411 () Bool)

(assert (=> d!117387 m!916411))

(assert (=> d!117387 m!916171))

(declare-fun m!916413 () Bool)

(assert (=> d!117387 m!916413))

(assert (=> d!117387 m!916171))

(assert (=> d!117387 m!916411))

(declare-fun m!916415 () Bool)

(assert (=> d!117387 m!916415))

(declare-fun m!916417 () Bool)

(assert (=> d!117387 m!916417))

(declare-fun m!916419 () Bool)

(assert (=> d!117387 m!916419))

(assert (=> d!117387 m!915801))

(assert (=> b!988948 d!117387))

(declare-fun d!117389 () Bool)

(declare-fun e!557832 () Bool)

(assert (=> d!117389 e!557832))

(declare-fun res!661367 () Bool)

(assert (=> d!117389 (=> res!661367 e!557832)))

(declare-fun lt!438712 () Bool)

(assert (=> d!117389 (= res!661367 (not lt!438712))))

(declare-fun lt!438715 () Bool)

(assert (=> d!117389 (= lt!438712 lt!438715)))

(declare-fun lt!438713 () Unit!32782)

(declare-fun e!557833 () Unit!32782)

(assert (=> d!117389 (= lt!438713 e!557833)))

(declare-fun c!100435 () Bool)

(assert (=> d!117389 (= c!100435 lt!438715)))

(assert (=> d!117389 (= lt!438715 (containsKey!479 (toList!6805 lt!438514) (_1!7451 lt!438403)))))

(assert (=> d!117389 (= (contains!5735 lt!438514 (_1!7451 lt!438403)) lt!438712)))

(declare-fun b!989130 () Bool)

(declare-fun lt!438714 () Unit!32782)

(assert (=> b!989130 (= e!557833 lt!438714)))

(assert (=> b!989130 (= lt!438714 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438514) (_1!7451 lt!438403)))))

(assert (=> b!989130 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438514) (_1!7451 lt!438403)))))

(declare-fun b!989131 () Bool)

(declare-fun Unit!32795 () Unit!32782)

(assert (=> b!989131 (= e!557833 Unit!32795)))

(declare-fun b!989132 () Bool)

(assert (=> b!989132 (= e!557832 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438514) (_1!7451 lt!438403))))))

(assert (= (and d!117389 c!100435) b!989130))

(assert (= (and d!117389 (not c!100435)) b!989131))

(assert (= (and d!117389 (not res!661367)) b!989132))

(declare-fun m!916421 () Bool)

(assert (=> d!117389 m!916421))

(declare-fun m!916423 () Bool)

(assert (=> b!989130 m!916423))

(assert (=> b!989130 m!916015))

(assert (=> b!989130 m!916015))

(declare-fun m!916425 () Bool)

(assert (=> b!989130 m!916425))

(assert (=> b!989132 m!916015))

(assert (=> b!989132 m!916015))

(assert (=> b!989132 m!916425))

(assert (=> d!117299 d!117389))

(declare-fun b!989136 () Bool)

(declare-fun e!557835 () Option!516)

(assert (=> b!989136 (= e!557835 None!514)))

(declare-fun b!989133 () Bool)

(declare-fun e!557834 () Option!516)

(assert (=> b!989133 (= e!557834 (Some!515 (_2!7451 (h!21950 lt!438513))))))

(declare-fun d!117391 () Bool)

(declare-fun c!100436 () Bool)

(assert (=> d!117391 (= c!100436 (and ((_ is Cons!20782) lt!438513) (= (_1!7451 (h!21950 lt!438513)) (_1!7451 lt!438403))))))

(assert (=> d!117391 (= (getValueByKey!510 lt!438513 (_1!7451 lt!438403)) e!557834)))

(declare-fun b!989135 () Bool)

(assert (=> b!989135 (= e!557835 (getValueByKey!510 (t!29711 lt!438513) (_1!7451 lt!438403)))))

(declare-fun b!989134 () Bool)

(assert (=> b!989134 (= e!557834 e!557835)))

(declare-fun c!100437 () Bool)

(assert (=> b!989134 (= c!100437 (and ((_ is Cons!20782) lt!438513) (not (= (_1!7451 (h!21950 lt!438513)) (_1!7451 lt!438403)))))))

(assert (= (and d!117391 c!100436) b!989133))

(assert (= (and d!117391 (not c!100436)) b!989134))

(assert (= (and b!989134 c!100437) b!989135))

(assert (= (and b!989134 (not c!100437)) b!989136))

(declare-fun m!916427 () Bool)

(assert (=> b!989135 m!916427))

(assert (=> d!117299 d!117391))

(declare-fun d!117393 () Bool)

(assert (=> d!117393 (= (getValueByKey!510 lt!438513 (_1!7451 lt!438403)) (Some!515 (_2!7451 lt!438403)))))

(declare-fun lt!438716 () Unit!32782)

(assert (=> d!117393 (= lt!438716 (choose!1612 lt!438513 (_1!7451 lt!438403) (_2!7451 lt!438403)))))

(declare-fun e!557836 () Bool)

(assert (=> d!117393 e!557836))

(declare-fun res!661368 () Bool)

(assert (=> d!117393 (=> (not res!661368) (not e!557836))))

(assert (=> d!117393 (= res!661368 (isStrictlySorted!503 lt!438513))))

(assert (=> d!117393 (= (lemmaContainsTupThenGetReturnValue!272 lt!438513 (_1!7451 lt!438403) (_2!7451 lt!438403)) lt!438716)))

(declare-fun b!989137 () Bool)

(declare-fun res!661369 () Bool)

(assert (=> b!989137 (=> (not res!661369) (not e!557836))))

(assert (=> b!989137 (= res!661369 (containsKey!479 lt!438513 (_1!7451 lt!438403)))))

(declare-fun b!989138 () Bool)

(assert (=> b!989138 (= e!557836 (contains!5736 lt!438513 (tuple2!14881 (_1!7451 lt!438403) (_2!7451 lt!438403))))))

(assert (= (and d!117393 res!661368) b!989137))

(assert (= (and b!989137 res!661369) b!989138))

(assert (=> d!117393 m!916009))

(declare-fun m!916429 () Bool)

(assert (=> d!117393 m!916429))

(declare-fun m!916431 () Bool)

(assert (=> d!117393 m!916431))

(declare-fun m!916433 () Bool)

(assert (=> b!989137 m!916433))

(declare-fun m!916435 () Bool)

(assert (=> b!989138 m!916435))

(assert (=> d!117299 d!117393))

(declare-fun b!989139 () Bool)

(declare-fun e!557839 () Bool)

(declare-fun lt!438717 () List!20786)

(assert (=> b!989139 (= e!557839 (contains!5736 lt!438717 (tuple2!14881 (_1!7451 lt!438403) (_2!7451 lt!438403))))))

(declare-fun b!989140 () Bool)

(declare-fun e!557838 () List!20786)

(declare-fun call!41910 () List!20786)

(assert (=> b!989140 (= e!557838 call!41910)))

(declare-fun b!989141 () Bool)

(declare-fun res!661370 () Bool)

(assert (=> b!989141 (=> (not res!661370) (not e!557839))))

(assert (=> b!989141 (= res!661370 (containsKey!479 lt!438717 (_1!7451 lt!438403)))))

(declare-fun e!557840 () List!20786)

(declare-fun c!100441 () Bool)

(declare-fun b!989142 () Bool)

(declare-fun c!100438 () Bool)

(assert (=> b!989142 (= e!557840 (ite c!100441 (t!29711 (toList!6805 lt!438406)) (ite c!100438 (Cons!20782 (h!21950 (toList!6805 lt!438406)) (t!29711 (toList!6805 lt!438406))) Nil!20783)))))

(declare-fun b!989143 () Bool)

(declare-fun e!557837 () List!20786)

(declare-fun call!41909 () List!20786)

(assert (=> b!989143 (= e!557837 call!41909)))

(declare-fun bm!41905 () Bool)

(assert (=> bm!41905 (= call!41910 call!41909)))

(declare-fun b!989144 () Bool)

(declare-fun e!557841 () List!20786)

(declare-fun call!41908 () List!20786)

(assert (=> b!989144 (= e!557841 call!41908)))

(declare-fun b!989145 () Bool)

(assert (=> b!989145 (= e!557838 call!41910)))

(declare-fun b!989146 () Bool)

(assert (=> b!989146 (= c!100438 (and ((_ is Cons!20782) (toList!6805 lt!438406)) (bvsgt (_1!7451 (h!21950 (toList!6805 lt!438406))) (_1!7451 lt!438403))))))

(assert (=> b!989146 (= e!557837 e!557838)))

(declare-fun d!117395 () Bool)

(assert (=> d!117395 e!557839))

(declare-fun res!661371 () Bool)

(assert (=> d!117395 (=> (not res!661371) (not e!557839))))

(assert (=> d!117395 (= res!661371 (isStrictlySorted!503 lt!438717))))

(assert (=> d!117395 (= lt!438717 e!557841)))

(declare-fun c!100439 () Bool)

(assert (=> d!117395 (= c!100439 (and ((_ is Cons!20782) (toList!6805 lt!438406)) (bvslt (_1!7451 (h!21950 (toList!6805 lt!438406))) (_1!7451 lt!438403))))))

(assert (=> d!117395 (isStrictlySorted!503 (toList!6805 lt!438406))))

(assert (=> d!117395 (= (insertStrictlySorted!329 (toList!6805 lt!438406) (_1!7451 lt!438403) (_2!7451 lt!438403)) lt!438717)))

(declare-fun b!989147 () Bool)

(assert (=> b!989147 (= e!557840 (insertStrictlySorted!329 (t!29711 (toList!6805 lt!438406)) (_1!7451 lt!438403) (_2!7451 lt!438403)))))

(declare-fun b!989148 () Bool)

(assert (=> b!989148 (= e!557841 e!557837)))

(assert (=> b!989148 (= c!100441 (and ((_ is Cons!20782) (toList!6805 lt!438406)) (= (_1!7451 (h!21950 (toList!6805 lt!438406))) (_1!7451 lt!438403))))))

(declare-fun bm!41906 () Bool)

(assert (=> bm!41906 (= call!41908 ($colon$colon!553 e!557840 (ite c!100439 (h!21950 (toList!6805 lt!438406)) (tuple2!14881 (_1!7451 lt!438403) (_2!7451 lt!438403)))))))

(declare-fun c!100440 () Bool)

(assert (=> bm!41906 (= c!100440 c!100439)))

(declare-fun bm!41907 () Bool)

(assert (=> bm!41907 (= call!41909 call!41908)))

(assert (= (and d!117395 c!100439) b!989144))

(assert (= (and d!117395 (not c!100439)) b!989148))

(assert (= (and b!989148 c!100441) b!989143))

(assert (= (and b!989148 (not c!100441)) b!989146))

(assert (= (and b!989146 c!100438) b!989145))

(assert (= (and b!989146 (not c!100438)) b!989140))

(assert (= (or b!989145 b!989140) bm!41905))

(assert (= (or b!989143 bm!41905) bm!41907))

(assert (= (or b!989144 bm!41907) bm!41906))

(assert (= (and bm!41906 c!100440) b!989147))

(assert (= (and bm!41906 (not c!100440)) b!989142))

(assert (= (and d!117395 res!661371) b!989141))

(assert (= (and b!989141 res!661370) b!989139))

(declare-fun m!916437 () Bool)

(assert (=> b!989141 m!916437))

(declare-fun m!916439 () Bool)

(assert (=> b!989139 m!916439))

(declare-fun m!916441 () Bool)

(assert (=> b!989147 m!916441))

(declare-fun m!916443 () Bool)

(assert (=> d!117395 m!916443))

(declare-fun m!916445 () Bool)

(assert (=> d!117395 m!916445))

(declare-fun m!916447 () Bool)

(assert (=> bm!41906 m!916447))

(assert (=> d!117299 d!117395))

(declare-fun d!117397 () Bool)

(declare-fun e!557842 () Bool)

(assert (=> d!117397 e!557842))

(declare-fun res!661372 () Bool)

(assert (=> d!117397 (=> res!661372 e!557842)))

(declare-fun lt!438718 () Bool)

(assert (=> d!117397 (= res!661372 (not lt!438718))))

(declare-fun lt!438721 () Bool)

(assert (=> d!117397 (= lt!438718 lt!438721)))

(declare-fun lt!438719 () Unit!32782)

(declare-fun e!557843 () Unit!32782)

(assert (=> d!117397 (= lt!438719 e!557843)))

(declare-fun c!100442 () Bool)

(assert (=> d!117397 (= c!100442 lt!438721)))

(assert (=> d!117397 (= lt!438721 (containsKey!479 (toList!6805 lt!438510) (_1!7451 lt!438398)))))

(assert (=> d!117397 (= (contains!5735 lt!438510 (_1!7451 lt!438398)) lt!438718)))

(declare-fun b!989149 () Bool)

(declare-fun lt!438720 () Unit!32782)

(assert (=> b!989149 (= e!557843 lt!438720)))

(assert (=> b!989149 (= lt!438720 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438510) (_1!7451 lt!438398)))))

(assert (=> b!989149 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438510) (_1!7451 lt!438398)))))

(declare-fun b!989150 () Bool)

(declare-fun Unit!32796 () Unit!32782)

(assert (=> b!989150 (= e!557843 Unit!32796)))

(declare-fun b!989151 () Bool)

(assert (=> b!989151 (= e!557842 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438510) (_1!7451 lt!438398))))))

(assert (= (and d!117397 c!100442) b!989149))

(assert (= (and d!117397 (not c!100442)) b!989150))

(assert (= (and d!117397 (not res!661372)) b!989151))

(declare-fun m!916449 () Bool)

(assert (=> d!117397 m!916449))

(declare-fun m!916451 () Bool)

(assert (=> b!989149 m!916451))

(assert (=> b!989149 m!916003))

(assert (=> b!989149 m!916003))

(declare-fun m!916453 () Bool)

(assert (=> b!989149 m!916453))

(assert (=> b!989151 m!916003))

(assert (=> b!989151 m!916003))

(assert (=> b!989151 m!916453))

(assert (=> d!117297 d!117397))

(declare-fun b!989155 () Bool)

(declare-fun e!557845 () Option!516)

(assert (=> b!989155 (= e!557845 None!514)))

(declare-fun b!989152 () Bool)

(declare-fun e!557844 () Option!516)

(assert (=> b!989152 (= e!557844 (Some!515 (_2!7451 (h!21950 lt!438509))))))

(declare-fun d!117399 () Bool)

(declare-fun c!100443 () Bool)

(assert (=> d!117399 (= c!100443 (and ((_ is Cons!20782) lt!438509) (= (_1!7451 (h!21950 lt!438509)) (_1!7451 lt!438398))))))

(assert (=> d!117399 (= (getValueByKey!510 lt!438509 (_1!7451 lt!438398)) e!557844)))

(declare-fun b!989154 () Bool)

(assert (=> b!989154 (= e!557845 (getValueByKey!510 (t!29711 lt!438509) (_1!7451 lt!438398)))))

(declare-fun b!989153 () Bool)

(assert (=> b!989153 (= e!557844 e!557845)))

(declare-fun c!100444 () Bool)

(assert (=> b!989153 (= c!100444 (and ((_ is Cons!20782) lt!438509) (not (= (_1!7451 (h!21950 lt!438509)) (_1!7451 lt!438398)))))))

(assert (= (and d!117399 c!100443) b!989152))

(assert (= (and d!117399 (not c!100443)) b!989153))

(assert (= (and b!989153 c!100444) b!989154))

(assert (= (and b!989153 (not c!100444)) b!989155))

(declare-fun m!916455 () Bool)

(assert (=> b!989154 m!916455))

(assert (=> d!117297 d!117399))

(declare-fun d!117401 () Bool)

(assert (=> d!117401 (= (getValueByKey!510 lt!438509 (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398)))))

(declare-fun lt!438722 () Unit!32782)

(assert (=> d!117401 (= lt!438722 (choose!1612 lt!438509 (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(declare-fun e!557846 () Bool)

(assert (=> d!117401 e!557846))

(declare-fun res!661373 () Bool)

(assert (=> d!117401 (=> (not res!661373) (not e!557846))))

(assert (=> d!117401 (= res!661373 (isStrictlySorted!503 lt!438509))))

(assert (=> d!117401 (= (lemmaContainsTupThenGetReturnValue!272 lt!438509 (_1!7451 lt!438398) (_2!7451 lt!438398)) lt!438722)))

(declare-fun b!989156 () Bool)

(declare-fun res!661374 () Bool)

(assert (=> b!989156 (=> (not res!661374) (not e!557846))))

(assert (=> b!989156 (= res!661374 (containsKey!479 lt!438509 (_1!7451 lt!438398)))))

(declare-fun b!989157 () Bool)

(assert (=> b!989157 (= e!557846 (contains!5736 lt!438509 (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398))))))

(assert (= (and d!117401 res!661373) b!989156))

(assert (= (and b!989156 res!661374) b!989157))

(assert (=> d!117401 m!915997))

(declare-fun m!916457 () Bool)

(assert (=> d!117401 m!916457))

(declare-fun m!916459 () Bool)

(assert (=> d!117401 m!916459))

(declare-fun m!916461 () Bool)

(assert (=> b!989156 m!916461))

(declare-fun m!916463 () Bool)

(assert (=> b!989157 m!916463))

(assert (=> d!117297 d!117401))

(declare-fun b!989158 () Bool)

(declare-fun e!557849 () Bool)

(declare-fun lt!438723 () List!20786)

(assert (=> b!989158 (= e!557849 (contains!5736 lt!438723 (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398))))))

(declare-fun b!989159 () Bool)

(declare-fun e!557848 () List!20786)

(declare-fun call!41913 () List!20786)

(assert (=> b!989159 (= e!557848 call!41913)))

(declare-fun b!989160 () Bool)

(declare-fun res!661375 () Bool)

(assert (=> b!989160 (=> (not res!661375) (not e!557849))))

(assert (=> b!989160 (= res!661375 (containsKey!479 lt!438723 (_1!7451 lt!438398)))))

(declare-fun c!100445 () Bool)

(declare-fun c!100448 () Bool)

(declare-fun e!557850 () List!20786)

(declare-fun b!989161 () Bool)

(assert (=> b!989161 (= e!557850 (ite c!100448 (t!29711 (toList!6805 lt!438402)) (ite c!100445 (Cons!20782 (h!21950 (toList!6805 lt!438402)) (t!29711 (toList!6805 lt!438402))) Nil!20783)))))

(declare-fun b!989162 () Bool)

(declare-fun e!557847 () List!20786)

(declare-fun call!41912 () List!20786)

(assert (=> b!989162 (= e!557847 call!41912)))

(declare-fun bm!41908 () Bool)

(assert (=> bm!41908 (= call!41913 call!41912)))

(declare-fun b!989163 () Bool)

(declare-fun e!557851 () List!20786)

(declare-fun call!41911 () List!20786)

(assert (=> b!989163 (= e!557851 call!41911)))

(declare-fun b!989164 () Bool)

(assert (=> b!989164 (= e!557848 call!41913)))

(declare-fun b!989165 () Bool)

(assert (=> b!989165 (= c!100445 (and ((_ is Cons!20782) (toList!6805 lt!438402)) (bvsgt (_1!7451 (h!21950 (toList!6805 lt!438402))) (_1!7451 lt!438398))))))

(assert (=> b!989165 (= e!557847 e!557848)))

(declare-fun d!117403 () Bool)

(assert (=> d!117403 e!557849))

(declare-fun res!661376 () Bool)

(assert (=> d!117403 (=> (not res!661376) (not e!557849))))

(assert (=> d!117403 (= res!661376 (isStrictlySorted!503 lt!438723))))

(assert (=> d!117403 (= lt!438723 e!557851)))

(declare-fun c!100446 () Bool)

(assert (=> d!117403 (= c!100446 (and ((_ is Cons!20782) (toList!6805 lt!438402)) (bvslt (_1!7451 (h!21950 (toList!6805 lt!438402))) (_1!7451 lt!438398))))))

(assert (=> d!117403 (isStrictlySorted!503 (toList!6805 lt!438402))))

(assert (=> d!117403 (= (insertStrictlySorted!329 (toList!6805 lt!438402) (_1!7451 lt!438398) (_2!7451 lt!438398)) lt!438723)))

(declare-fun b!989166 () Bool)

(assert (=> b!989166 (= e!557850 (insertStrictlySorted!329 (t!29711 (toList!6805 lt!438402)) (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(declare-fun b!989167 () Bool)

(assert (=> b!989167 (= e!557851 e!557847)))

(assert (=> b!989167 (= c!100448 (and ((_ is Cons!20782) (toList!6805 lt!438402)) (= (_1!7451 (h!21950 (toList!6805 lt!438402))) (_1!7451 lt!438398))))))

(declare-fun bm!41909 () Bool)

(assert (=> bm!41909 (= call!41911 ($colon$colon!553 e!557850 (ite c!100446 (h!21950 (toList!6805 lt!438402)) (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398)))))))

(declare-fun c!100447 () Bool)

(assert (=> bm!41909 (= c!100447 c!100446)))

(declare-fun bm!41910 () Bool)

(assert (=> bm!41910 (= call!41912 call!41911)))

(assert (= (and d!117403 c!100446) b!989163))

(assert (= (and d!117403 (not c!100446)) b!989167))

(assert (= (and b!989167 c!100448) b!989162))

(assert (= (and b!989167 (not c!100448)) b!989165))

(assert (= (and b!989165 c!100445) b!989164))

(assert (= (and b!989165 (not c!100445)) b!989159))

(assert (= (or b!989164 b!989159) bm!41908))

(assert (= (or b!989162 bm!41908) bm!41910))

(assert (= (or b!989163 bm!41910) bm!41909))

(assert (= (and bm!41909 c!100447) b!989166))

(assert (= (and bm!41909 (not c!100447)) b!989161))

(assert (= (and d!117403 res!661376) b!989160))

(assert (= (and b!989160 res!661375) b!989158))

(declare-fun m!916465 () Bool)

(assert (=> b!989160 m!916465))

(declare-fun m!916467 () Bool)

(assert (=> b!989158 m!916467))

(declare-fun m!916469 () Bool)

(assert (=> b!989166 m!916469))

(declare-fun m!916471 () Bool)

(assert (=> d!117403 m!916471))

(assert (=> d!117403 m!916391))

(declare-fun m!916473 () Bool)

(assert (=> bm!41909 m!916473))

(assert (=> d!117297 d!117403))

(assert (=> b!988894 d!117367))

(declare-fun d!117405 () Bool)

(declare-fun e!557852 () Bool)

(assert (=> d!117405 e!557852))

(declare-fun res!661377 () Bool)

(assert (=> d!117405 (=> res!661377 e!557852)))

(declare-fun lt!438724 () Bool)

(assert (=> d!117405 (= res!661377 (not lt!438724))))

(declare-fun lt!438727 () Bool)

(assert (=> d!117405 (= lt!438724 lt!438727)))

(declare-fun lt!438725 () Unit!32782)

(declare-fun e!557853 () Unit!32782)

(assert (=> d!117405 (= lt!438725 e!557853)))

(declare-fun c!100449 () Bool)

(assert (=> d!117405 (= c!100449 lt!438727)))

(assert (=> d!117405 (= lt!438727 (containsKey!479 (toList!6805 lt!438619) (_1!7451 lt!438400)))))

(assert (=> d!117405 (= (contains!5735 lt!438619 (_1!7451 lt!438400)) lt!438724)))

(declare-fun b!989168 () Bool)

(declare-fun lt!438726 () Unit!32782)

(assert (=> b!989168 (= e!557853 lt!438726)))

(assert (=> b!989168 (= lt!438726 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438619) (_1!7451 lt!438400)))))

(assert (=> b!989168 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438619) (_1!7451 lt!438400)))))

(declare-fun b!989169 () Bool)

(declare-fun Unit!32797 () Unit!32782)

(assert (=> b!989169 (= e!557853 Unit!32797)))

(declare-fun b!989170 () Bool)

(assert (=> b!989170 (= e!557852 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438619) (_1!7451 lt!438400))))))

(assert (= (and d!117405 c!100449) b!989168))

(assert (= (and d!117405 (not c!100449)) b!989169))

(assert (= (and d!117405 (not res!661377)) b!989170))

(declare-fun m!916475 () Bool)

(assert (=> d!117405 m!916475))

(declare-fun m!916477 () Bool)

(assert (=> b!989168 m!916477))

(assert (=> b!989168 m!916167))

(assert (=> b!989168 m!916167))

(declare-fun m!916479 () Bool)

(assert (=> b!989168 m!916479))

(assert (=> b!989170 m!916167))

(assert (=> b!989170 m!916167))

(assert (=> b!989170 m!916479))

(assert (=> d!117313 d!117405))

(declare-fun b!989174 () Bool)

(declare-fun e!557855 () Option!516)

(assert (=> b!989174 (= e!557855 None!514)))

(declare-fun b!989171 () Bool)

(declare-fun e!557854 () Option!516)

(assert (=> b!989171 (= e!557854 (Some!515 (_2!7451 (h!21950 lt!438618))))))

(declare-fun d!117407 () Bool)

(declare-fun c!100450 () Bool)

(assert (=> d!117407 (= c!100450 (and ((_ is Cons!20782) lt!438618) (= (_1!7451 (h!21950 lt!438618)) (_1!7451 lt!438400))))))

(assert (=> d!117407 (= (getValueByKey!510 lt!438618 (_1!7451 lt!438400)) e!557854)))

(declare-fun b!989173 () Bool)

(assert (=> b!989173 (= e!557855 (getValueByKey!510 (t!29711 lt!438618) (_1!7451 lt!438400)))))

(declare-fun b!989172 () Bool)

(assert (=> b!989172 (= e!557854 e!557855)))

(declare-fun c!100451 () Bool)

(assert (=> b!989172 (= c!100451 (and ((_ is Cons!20782) lt!438618) (not (= (_1!7451 (h!21950 lt!438618)) (_1!7451 lt!438400)))))))

(assert (= (and d!117407 c!100450) b!989171))

(assert (= (and d!117407 (not c!100450)) b!989172))

(assert (= (and b!989172 c!100451) b!989173))

(assert (= (and b!989172 (not c!100451)) b!989174))

(declare-fun m!916481 () Bool)

(assert (=> b!989173 m!916481))

(assert (=> d!117313 d!117407))

(declare-fun d!117409 () Bool)

(assert (=> d!117409 (= (getValueByKey!510 lt!438618 (_1!7451 lt!438400)) (Some!515 (_2!7451 lt!438400)))))

(declare-fun lt!438728 () Unit!32782)

(assert (=> d!117409 (= lt!438728 (choose!1612 lt!438618 (_1!7451 lt!438400) (_2!7451 lt!438400)))))

(declare-fun e!557856 () Bool)

(assert (=> d!117409 e!557856))

(declare-fun res!661378 () Bool)

(assert (=> d!117409 (=> (not res!661378) (not e!557856))))

(assert (=> d!117409 (= res!661378 (isStrictlySorted!503 lt!438618))))

(assert (=> d!117409 (= (lemmaContainsTupThenGetReturnValue!272 lt!438618 (_1!7451 lt!438400) (_2!7451 lt!438400)) lt!438728)))

(declare-fun b!989175 () Bool)

(declare-fun res!661379 () Bool)

(assert (=> b!989175 (=> (not res!661379) (not e!557856))))

(assert (=> b!989175 (= res!661379 (containsKey!479 lt!438618 (_1!7451 lt!438400)))))

(declare-fun b!989176 () Bool)

(assert (=> b!989176 (= e!557856 (contains!5736 lt!438618 (tuple2!14881 (_1!7451 lt!438400) (_2!7451 lt!438400))))))

(assert (= (and d!117409 res!661378) b!989175))

(assert (= (and b!989175 res!661379) b!989176))

(assert (=> d!117409 m!916161))

(declare-fun m!916483 () Bool)

(assert (=> d!117409 m!916483))

(declare-fun m!916485 () Bool)

(assert (=> d!117409 m!916485))

(declare-fun m!916487 () Bool)

(assert (=> b!989175 m!916487))

(declare-fun m!916489 () Bool)

(assert (=> b!989176 m!916489))

(assert (=> d!117313 d!117409))

(declare-fun b!989177 () Bool)

(declare-fun e!557859 () Bool)

(declare-fun lt!438729 () List!20786)

(assert (=> b!989177 (= e!557859 (contains!5736 lt!438729 (tuple2!14881 (_1!7451 lt!438400) (_2!7451 lt!438400))))))

(declare-fun b!989178 () Bool)

(declare-fun e!557858 () List!20786)

(declare-fun call!41916 () List!20786)

(assert (=> b!989178 (= e!557858 call!41916)))

(declare-fun b!989179 () Bool)

(declare-fun res!661380 () Bool)

(assert (=> b!989179 (=> (not res!661380) (not e!557859))))

(assert (=> b!989179 (= res!661380 (containsKey!479 lt!438729 (_1!7451 lt!438400)))))

(declare-fun e!557860 () List!20786)

(declare-fun c!100455 () Bool)

(declare-fun c!100452 () Bool)

(declare-fun b!989180 () Bool)

(assert (=> b!989180 (= e!557860 (ite c!100455 (t!29711 (toList!6805 (+!3104 lt!438397 lt!438398))) (ite c!100452 (Cons!20782 (h!21950 (toList!6805 (+!3104 lt!438397 lt!438398))) (t!29711 (toList!6805 (+!3104 lt!438397 lt!438398)))) Nil!20783)))))

(declare-fun b!989181 () Bool)

(declare-fun e!557857 () List!20786)

(declare-fun call!41915 () List!20786)

(assert (=> b!989181 (= e!557857 call!41915)))

(declare-fun bm!41911 () Bool)

(assert (=> bm!41911 (= call!41916 call!41915)))

(declare-fun b!989182 () Bool)

(declare-fun e!557861 () List!20786)

(declare-fun call!41914 () List!20786)

(assert (=> b!989182 (= e!557861 call!41914)))

(declare-fun b!989183 () Bool)

(assert (=> b!989183 (= e!557858 call!41916)))

(declare-fun b!989184 () Bool)

(assert (=> b!989184 (= c!100452 (and ((_ is Cons!20782) (toList!6805 (+!3104 lt!438397 lt!438398))) (bvsgt (_1!7451 (h!21950 (toList!6805 (+!3104 lt!438397 lt!438398)))) (_1!7451 lt!438400))))))

(assert (=> b!989184 (= e!557857 e!557858)))

(declare-fun d!117411 () Bool)

(assert (=> d!117411 e!557859))

(declare-fun res!661381 () Bool)

(assert (=> d!117411 (=> (not res!661381) (not e!557859))))

(assert (=> d!117411 (= res!661381 (isStrictlySorted!503 lt!438729))))

(assert (=> d!117411 (= lt!438729 e!557861)))

(declare-fun c!100453 () Bool)

(assert (=> d!117411 (= c!100453 (and ((_ is Cons!20782) (toList!6805 (+!3104 lt!438397 lt!438398))) (bvslt (_1!7451 (h!21950 (toList!6805 (+!3104 lt!438397 lt!438398)))) (_1!7451 lt!438400))))))

(assert (=> d!117411 (isStrictlySorted!503 (toList!6805 (+!3104 lt!438397 lt!438398)))))

(assert (=> d!117411 (= (insertStrictlySorted!329 (toList!6805 (+!3104 lt!438397 lt!438398)) (_1!7451 lt!438400) (_2!7451 lt!438400)) lt!438729)))

(declare-fun b!989185 () Bool)

(assert (=> b!989185 (= e!557860 (insertStrictlySorted!329 (t!29711 (toList!6805 (+!3104 lt!438397 lt!438398))) (_1!7451 lt!438400) (_2!7451 lt!438400)))))

(declare-fun b!989186 () Bool)

(assert (=> b!989186 (= e!557861 e!557857)))

(assert (=> b!989186 (= c!100455 (and ((_ is Cons!20782) (toList!6805 (+!3104 lt!438397 lt!438398))) (= (_1!7451 (h!21950 (toList!6805 (+!3104 lt!438397 lt!438398)))) (_1!7451 lt!438400))))))

(declare-fun bm!41912 () Bool)

(assert (=> bm!41912 (= call!41914 ($colon$colon!553 e!557860 (ite c!100453 (h!21950 (toList!6805 (+!3104 lt!438397 lt!438398))) (tuple2!14881 (_1!7451 lt!438400) (_2!7451 lt!438400)))))))

(declare-fun c!100454 () Bool)

(assert (=> bm!41912 (= c!100454 c!100453)))

(declare-fun bm!41913 () Bool)

(assert (=> bm!41913 (= call!41915 call!41914)))

(assert (= (and d!117411 c!100453) b!989182))

(assert (= (and d!117411 (not c!100453)) b!989186))

(assert (= (and b!989186 c!100455) b!989181))

(assert (= (and b!989186 (not c!100455)) b!989184))

(assert (= (and b!989184 c!100452) b!989183))

(assert (= (and b!989184 (not c!100452)) b!989178))

(assert (= (or b!989183 b!989178) bm!41911))

(assert (= (or b!989181 bm!41911) bm!41913))

(assert (= (or b!989182 bm!41913) bm!41912))

(assert (= (and bm!41912 c!100454) b!989185))

(assert (= (and bm!41912 (not c!100454)) b!989180))

(assert (= (and d!117411 res!661381) b!989179))

(assert (= (and b!989179 res!661380) b!989177))

(declare-fun m!916491 () Bool)

(assert (=> b!989179 m!916491))

(declare-fun m!916493 () Bool)

(assert (=> b!989177 m!916493))

(declare-fun m!916495 () Bool)

(assert (=> b!989185 m!916495))

(declare-fun m!916497 () Bool)

(assert (=> d!117411 m!916497))

(declare-fun m!916499 () Bool)

(assert (=> d!117411 m!916499))

(declare-fun m!916501 () Bool)

(assert (=> bm!41912 m!916501))

(assert (=> d!117313 d!117411))

(declare-fun d!117413 () Bool)

(declare-fun e!557862 () Bool)

(assert (=> d!117413 e!557862))

(declare-fun res!661382 () Bool)

(assert (=> d!117413 (=> res!661382 e!557862)))

(declare-fun lt!438730 () Bool)

(assert (=> d!117413 (= res!661382 (not lt!438730))))

(declare-fun lt!438733 () Bool)

(assert (=> d!117413 (= lt!438730 lt!438733)))

(declare-fun lt!438731 () Unit!32782)

(declare-fun e!557863 () Unit!32782)

(assert (=> d!117413 (= lt!438731 e!557863)))

(declare-fun c!100456 () Bool)

(assert (=> d!117413 (= c!100456 lt!438733)))

(assert (=> d!117413 (= lt!438733 (containsKey!479 (toList!6805 lt!438484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117413 (= (contains!5735 lt!438484 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438730)))

(declare-fun b!989187 () Bool)

(declare-fun lt!438732 () Unit!32782)

(assert (=> b!989187 (= e!557863 lt!438732)))

(assert (=> b!989187 (= lt!438732 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989187 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989188 () Bool)

(declare-fun Unit!32798 () Unit!32782)

(assert (=> b!989188 (= e!557863 Unit!32798)))

(declare-fun b!989189 () Bool)

(assert (=> b!989189 (= e!557862 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438484) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117413 c!100456) b!989187))

(assert (= (and d!117413 (not c!100456)) b!989188))

(assert (= (and d!117413 (not res!661382)) b!989189))

(declare-fun m!916503 () Bool)

(assert (=> d!117413 m!916503))

(declare-fun m!916505 () Bool)

(assert (=> b!989187 m!916505))

(declare-fun m!916507 () Bool)

(assert (=> b!989187 m!916507))

(assert (=> b!989187 m!916507))

(declare-fun m!916509 () Bool)

(assert (=> b!989187 m!916509))

(assert (=> b!989189 m!916507))

(assert (=> b!989189 m!916507))

(assert (=> b!989189 m!916509))

(assert (=> d!117291 d!117413))

(assert (=> d!117291 d!117281))

(declare-fun b!989193 () Bool)

(declare-fun e!557865 () Option!516)

(assert (=> b!989193 (= e!557865 None!514)))

(declare-fun b!989190 () Bool)

(declare-fun e!557864 () Option!516)

(assert (=> b!989190 (= e!557864 (Some!515 (_2!7451 (h!21950 (toList!6805 lt!438514)))))))

(declare-fun d!117415 () Bool)

(declare-fun c!100457 () Bool)

(assert (=> d!117415 (= c!100457 (and ((_ is Cons!20782) (toList!6805 lt!438514)) (= (_1!7451 (h!21950 (toList!6805 lt!438514))) (_1!7451 lt!438403))))))

(assert (=> d!117415 (= (getValueByKey!510 (toList!6805 lt!438514) (_1!7451 lt!438403)) e!557864)))

(declare-fun b!989192 () Bool)

(assert (=> b!989192 (= e!557865 (getValueByKey!510 (t!29711 (toList!6805 lt!438514)) (_1!7451 lt!438403)))))

(declare-fun b!989191 () Bool)

(assert (=> b!989191 (= e!557864 e!557865)))

(declare-fun c!100458 () Bool)

(assert (=> b!989191 (= c!100458 (and ((_ is Cons!20782) (toList!6805 lt!438514)) (not (= (_1!7451 (h!21950 (toList!6805 lt!438514))) (_1!7451 lt!438403)))))))

(assert (= (and d!117415 c!100457) b!989190))

(assert (= (and d!117415 (not c!100457)) b!989191))

(assert (= (and b!989191 c!100458) b!989192))

(assert (= (and b!989191 (not c!100458)) b!989193))

(declare-fun m!916511 () Bool)

(assert (=> b!989192 m!916511))

(assert (=> b!988843 d!117415))

(declare-fun d!117417 () Bool)

(assert (=> d!117417 (contains!5735 (+!3104 lt!438598 (tuple2!14881 lt!438602 zeroValue!1220)) lt!438606)))

(declare-fun lt!438736 () Unit!32782)

(declare-fun choose!1614 (ListLongMap!13579 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32782)

(assert (=> d!117417 (= lt!438736 (choose!1614 lt!438598 lt!438602 zeroValue!1220 lt!438606))))

(assert (=> d!117417 (contains!5735 lt!438598 lt!438606)))

(assert (=> d!117417 (= (addStillContains!614 lt!438598 lt!438602 zeroValue!1220 lt!438606) lt!438736)))

(declare-fun bs!28051 () Bool)

(assert (= bs!28051 d!117417))

(assert (=> bs!28051 m!916133))

(assert (=> bs!28051 m!916133))

(assert (=> bs!28051 m!916147))

(declare-fun m!916513 () Bool)

(assert (=> bs!28051 m!916513))

(declare-fun m!916515 () Bool)

(assert (=> bs!28051 m!916515))

(assert (=> b!988925 d!117417))

(declare-fun b!989195 () Bool)

(declare-fun res!661383 () Bool)

(declare-fun e!557866 () Bool)

(assert (=> b!989195 (=> (not res!661383) (not e!557866))))

(declare-fun lt!438737 () ListLongMap!13579)

(assert (=> b!989195 (= res!661383 (not (contains!5735 lt!438737 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989196 () Bool)

(declare-fun e!557871 () Bool)

(declare-fun e!557870 () Bool)

(assert (=> b!989196 (= e!557871 e!557870)))

(assert (=> b!989196 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30554 _keys!1544)))))

(declare-fun res!661385 () Bool)

(assert (=> b!989196 (= res!661385 (contains!5735 lt!438737 (select (arr!30074 _keys!1544) from!1932)))))

(assert (=> b!989196 (=> (not res!661385) (not e!557870))))

(declare-fun b!989197 () Bool)

(declare-fun e!557872 () ListLongMap!13579)

(declare-fun call!41917 () ListLongMap!13579)

(assert (=> b!989197 (= e!557872 call!41917)))

(declare-fun b!989198 () Bool)

(assert (=> b!989198 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30554 _keys!1544)))))

(assert (=> b!989198 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30555 _values!1278)))))

(assert (=> b!989198 (= e!557870 (= (apply!902 lt!438737 (select (arr!30074 _keys!1544) from!1932)) (get!15628 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!989199 () Bool)

(declare-fun e!557869 () Bool)

(assert (=> b!989199 (= e!557869 (validKeyInArray!0 (select (arr!30074 _keys!1544) from!1932)))))

(assert (=> b!989199 (bvsge from!1932 #b00000000000000000000000000000000)))

(declare-fun b!989200 () Bool)

(declare-fun e!557868 () ListLongMap!13579)

(assert (=> b!989200 (= e!557868 (ListLongMap!13580 Nil!20783))))

(declare-fun b!989201 () Bool)

(declare-fun e!557867 () Bool)

(assert (=> b!989201 (= e!557867 (isEmpty!726 lt!438737))))

(declare-fun bm!41914 () Bool)

(assert (=> bm!41914 (= call!41917 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!989202 () Bool)

(assert (=> b!989202 (= e!557866 e!557871)))

(declare-fun c!100462 () Bool)

(assert (=> b!989202 (= c!100462 e!557869)))

(declare-fun res!661384 () Bool)

(assert (=> b!989202 (=> (not res!661384) (not e!557869))))

(assert (=> b!989202 (= res!661384 (bvslt from!1932 (size!30554 _keys!1544)))))

(declare-fun b!989203 () Bool)

(declare-fun lt!438738 () Unit!32782)

(declare-fun lt!438740 () Unit!32782)

(assert (=> b!989203 (= lt!438738 lt!438740)))

(declare-fun lt!438743 () ListLongMap!13579)

(declare-fun lt!438739 () (_ BitVec 64))

(declare-fun lt!438741 () (_ BitVec 64))

(declare-fun lt!438742 () V!35945)

(assert (=> b!989203 (not (contains!5735 (+!3104 lt!438743 (tuple2!14881 lt!438741 lt!438742)) lt!438739))))

(assert (=> b!989203 (= lt!438740 (addStillNotContains!234 lt!438743 lt!438741 lt!438742 lt!438739))))

(assert (=> b!989203 (= lt!438739 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989203 (= lt!438742 (get!15628 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989203 (= lt!438741 (select (arr!30074 _keys!1544) from!1932))))

(assert (=> b!989203 (= lt!438743 call!41917)))

(assert (=> b!989203 (= e!557872 (+!3104 call!41917 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) (get!15628 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!989205 () Bool)

(assert (=> b!989205 (= e!557871 e!557867)))

(declare-fun c!100460 () Bool)

(assert (=> b!989205 (= c!100460 (bvslt from!1932 (size!30554 _keys!1544)))))

(declare-fun b!989206 () Bool)

(assert (=> b!989206 (= e!557868 e!557872)))

(declare-fun c!100459 () Bool)

(assert (=> b!989206 (= c!100459 (validKeyInArray!0 (select (arr!30074 _keys!1544) from!1932)))))

(declare-fun d!117419 () Bool)

(assert (=> d!117419 e!557866))

(declare-fun res!661386 () Bool)

(assert (=> d!117419 (=> (not res!661386) (not e!557866))))

(assert (=> d!117419 (= res!661386 (not (contains!5735 lt!438737 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117419 (= lt!438737 e!557868)))

(declare-fun c!100461 () Bool)

(assert (=> d!117419 (= c!100461 (bvsge from!1932 (size!30554 _keys!1544)))))

(assert (=> d!117419 (validMask!0 mask!1948)))

(assert (=> d!117419 (= (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) lt!438737)))

(declare-fun b!989204 () Bool)

(assert (=> b!989204 (= e!557867 (= lt!438737 (getCurrentListMapNoExtraKeys!3533 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(assert (= (and d!117419 c!100461) b!989200))

(assert (= (and d!117419 (not c!100461)) b!989206))

(assert (= (and b!989206 c!100459) b!989203))

(assert (= (and b!989206 (not c!100459)) b!989197))

(assert (= (or b!989203 b!989197) bm!41914))

(assert (= (and d!117419 res!661386) b!989195))

(assert (= (and b!989195 res!661383) b!989202))

(assert (= (and b!989202 res!661384) b!989199))

(assert (= (and b!989202 c!100462) b!989196))

(assert (= (and b!989202 (not c!100462)) b!989205))

(assert (= (and b!989196 res!661385) b!989198))

(assert (= (and b!989205 c!100460) b!989204))

(assert (= (and b!989205 (not c!100460)) b!989201))

(declare-fun b_lambda!15079 () Bool)

(assert (=> (not b_lambda!15079) (not b!989198)))

(assert (=> b!989198 t!29710))

(declare-fun b_and!32111 () Bool)

(assert (= b_and!32109 (and (=> t!29710 result!13551) b_and!32111)))

(declare-fun b_lambda!15081 () Bool)

(assert (=> (not b_lambda!15081) (not b!989203)))

(assert (=> b!989203 t!29710))

(declare-fun b_and!32113 () Bool)

(assert (= b_and!32111 (and (=> t!29710 result!13551) b_and!32113)))

(declare-fun m!916517 () Bool)

(assert (=> b!989204 m!916517))

(assert (=> b!989196 m!915785))

(assert (=> b!989196 m!915785))

(declare-fun m!916519 () Bool)

(assert (=> b!989196 m!916519))

(declare-fun m!916521 () Bool)

(assert (=> b!989195 m!916521))

(assert (=> b!989199 m!915785))

(assert (=> b!989199 m!915785))

(assert (=> b!989199 m!915787))

(declare-fun m!916523 () Bool)

(assert (=> b!989201 m!916523))

(declare-fun m!916525 () Bool)

(assert (=> d!117419 m!916525))

(assert (=> d!117419 m!915801))

(assert (=> b!989206 m!915785))

(assert (=> b!989206 m!915785))

(assert (=> b!989206 m!915787))

(assert (=> bm!41914 m!916517))

(assert (=> b!989198 m!915823))

(assert (=> b!989198 m!915785))

(declare-fun m!916527 () Bool)

(assert (=> b!989198 m!916527))

(assert (=> b!989198 m!915809))

(assert (=> b!989198 m!915809))

(assert (=> b!989198 m!915823))

(assert (=> b!989198 m!915825))

(assert (=> b!989198 m!915785))

(declare-fun m!916529 () Bool)

(assert (=> b!989203 m!916529))

(declare-fun m!916531 () Bool)

(assert (=> b!989203 m!916531))

(declare-fun m!916533 () Bool)

(assert (=> b!989203 m!916533))

(assert (=> b!989203 m!915823))

(assert (=> b!989203 m!915809))

(assert (=> b!989203 m!915809))

(assert (=> b!989203 m!915823))

(assert (=> b!989203 m!915825))

(assert (=> b!989203 m!916531))

(assert (=> b!989203 m!915785))

(declare-fun m!916535 () Bool)

(assert (=> b!989203 m!916535))

(assert (=> b!988925 d!117419))

(declare-fun d!117421 () Bool)

(assert (=> d!117421 (= (apply!902 lt!438600 lt!438594) (get!15633 (getValueByKey!510 (toList!6805 lt!438600) lt!438594)))))

(declare-fun bs!28052 () Bool)

(assert (= bs!28052 d!117421))

(declare-fun m!916537 () Bool)

(assert (=> bs!28052 m!916537))

(assert (=> bs!28052 m!916537))

(declare-fun m!916539 () Bool)

(assert (=> bs!28052 m!916539))

(assert (=> b!988925 d!117421))

(declare-fun d!117423 () Bool)

(assert (=> d!117423 (= (apply!902 (+!3104 lt!438600 (tuple2!14881 lt!438613 minValue!1220)) lt!438594) (get!15633 (getValueByKey!510 (toList!6805 (+!3104 lt!438600 (tuple2!14881 lt!438613 minValue!1220))) lt!438594)))))

(declare-fun bs!28053 () Bool)

(assert (= bs!28053 d!117423))

(declare-fun m!916541 () Bool)

(assert (=> bs!28053 m!916541))

(assert (=> bs!28053 m!916541))

(declare-fun m!916543 () Bool)

(assert (=> bs!28053 m!916543))

(assert (=> b!988925 d!117423))

(declare-fun d!117425 () Bool)

(assert (=> d!117425 (= (apply!902 (+!3104 lt!438600 (tuple2!14881 lt!438613 minValue!1220)) lt!438594) (apply!902 lt!438600 lt!438594))))

(declare-fun lt!438746 () Unit!32782)

(declare-fun choose!1615 (ListLongMap!13579 (_ BitVec 64) V!35945 (_ BitVec 64)) Unit!32782)

(assert (=> d!117425 (= lt!438746 (choose!1615 lt!438600 lt!438613 minValue!1220 lt!438594))))

(declare-fun e!557875 () Bool)

(assert (=> d!117425 e!557875))

(declare-fun res!661389 () Bool)

(assert (=> d!117425 (=> (not res!661389) (not e!557875))))

(assert (=> d!117425 (= res!661389 (contains!5735 lt!438600 lt!438594))))

(assert (=> d!117425 (= (addApplyDifferent!470 lt!438600 lt!438613 minValue!1220 lt!438594) lt!438746)))

(declare-fun b!989210 () Bool)

(assert (=> b!989210 (= e!557875 (not (= lt!438594 lt!438613)))))

(assert (= (and d!117425 res!661389) b!989210))

(assert (=> d!117425 m!916119))

(assert (=> d!117425 m!916141))

(declare-fun m!916545 () Bool)

(assert (=> d!117425 m!916545))

(declare-fun m!916547 () Bool)

(assert (=> d!117425 m!916547))

(assert (=> d!117425 m!916127))

(assert (=> d!117425 m!916119))

(assert (=> b!988925 d!117425))

(declare-fun d!117427 () Bool)

(assert (=> d!117427 (= (apply!902 (+!3104 lt!438615 (tuple2!14881 lt!438604 zeroValue!1220)) lt!438614) (apply!902 lt!438615 lt!438614))))

(declare-fun lt!438747 () Unit!32782)

(assert (=> d!117427 (= lt!438747 (choose!1615 lt!438615 lt!438604 zeroValue!1220 lt!438614))))

(declare-fun e!557876 () Bool)

(assert (=> d!117427 e!557876))

(declare-fun res!661390 () Bool)

(assert (=> d!117427 (=> (not res!661390) (not e!557876))))

(assert (=> d!117427 (= res!661390 (contains!5735 lt!438615 lt!438614))))

(assert (=> d!117427 (= (addApplyDifferent!470 lt!438615 lt!438604 zeroValue!1220 lt!438614) lt!438747)))

(declare-fun b!989211 () Bool)

(assert (=> b!989211 (= e!557876 (not (= lt!438614 lt!438604)))))

(assert (= (and d!117427 res!661390) b!989211))

(assert (=> d!117427 m!916123))

(assert (=> d!117427 m!916139))

(declare-fun m!916549 () Bool)

(assert (=> d!117427 m!916549))

(declare-fun m!916551 () Bool)

(assert (=> d!117427 m!916551))

(assert (=> d!117427 m!916143))

(assert (=> d!117427 m!916123))

(assert (=> b!988925 d!117427))

(declare-fun d!117429 () Bool)

(assert (=> d!117429 (= (apply!902 lt!438615 lt!438614) (get!15633 (getValueByKey!510 (toList!6805 lt!438615) lt!438614)))))

(declare-fun bs!28054 () Bool)

(assert (= bs!28054 d!117429))

(declare-fun m!916553 () Bool)

(assert (=> bs!28054 m!916553))

(assert (=> bs!28054 m!916553))

(declare-fun m!916555 () Bool)

(assert (=> bs!28054 m!916555))

(assert (=> b!988925 d!117429))

(declare-fun d!117431 () Bool)

(declare-fun e!557877 () Bool)

(assert (=> d!117431 e!557877))

(declare-fun res!661392 () Bool)

(assert (=> d!117431 (=> (not res!661392) (not e!557877))))

(declare-fun lt!438751 () ListLongMap!13579)

(assert (=> d!117431 (= res!661392 (contains!5735 lt!438751 (_1!7451 (tuple2!14881 lt!438604 zeroValue!1220))))))

(declare-fun lt!438750 () List!20786)

(assert (=> d!117431 (= lt!438751 (ListLongMap!13580 lt!438750))))

(declare-fun lt!438748 () Unit!32782)

(declare-fun lt!438749 () Unit!32782)

(assert (=> d!117431 (= lt!438748 lt!438749)))

(assert (=> d!117431 (= (getValueByKey!510 lt!438750 (_1!7451 (tuple2!14881 lt!438604 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438604 zeroValue!1220))))))

(assert (=> d!117431 (= lt!438749 (lemmaContainsTupThenGetReturnValue!272 lt!438750 (_1!7451 (tuple2!14881 lt!438604 zeroValue!1220)) (_2!7451 (tuple2!14881 lt!438604 zeroValue!1220))))))

(assert (=> d!117431 (= lt!438750 (insertStrictlySorted!329 (toList!6805 lt!438615) (_1!7451 (tuple2!14881 lt!438604 zeroValue!1220)) (_2!7451 (tuple2!14881 lt!438604 zeroValue!1220))))))

(assert (=> d!117431 (= (+!3104 lt!438615 (tuple2!14881 lt!438604 zeroValue!1220)) lt!438751)))

(declare-fun b!989212 () Bool)

(declare-fun res!661391 () Bool)

(assert (=> b!989212 (=> (not res!661391) (not e!557877))))

(assert (=> b!989212 (= res!661391 (= (getValueByKey!510 (toList!6805 lt!438751) (_1!7451 (tuple2!14881 lt!438604 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438604 zeroValue!1220)))))))

(declare-fun b!989213 () Bool)

(assert (=> b!989213 (= e!557877 (contains!5736 (toList!6805 lt!438751) (tuple2!14881 lt!438604 zeroValue!1220)))))

(assert (= (and d!117431 res!661392) b!989212))

(assert (= (and b!989212 res!661391) b!989213))

(declare-fun m!916557 () Bool)

(assert (=> d!117431 m!916557))

(declare-fun m!916559 () Bool)

(assert (=> d!117431 m!916559))

(declare-fun m!916561 () Bool)

(assert (=> d!117431 m!916561))

(declare-fun m!916563 () Bool)

(assert (=> d!117431 m!916563))

(declare-fun m!916565 () Bool)

(assert (=> b!989212 m!916565))

(declare-fun m!916567 () Bool)

(assert (=> b!989213 m!916567))

(assert (=> b!988925 d!117431))

(declare-fun d!117433 () Bool)

(assert (=> d!117433 (= (apply!902 (+!3104 lt!438615 (tuple2!14881 lt!438604 zeroValue!1220)) lt!438614) (get!15633 (getValueByKey!510 (toList!6805 (+!3104 lt!438615 (tuple2!14881 lt!438604 zeroValue!1220))) lt!438614)))))

(declare-fun bs!28055 () Bool)

(assert (= bs!28055 d!117433))

(declare-fun m!916569 () Bool)

(assert (=> bs!28055 m!916569))

(assert (=> bs!28055 m!916569))

(declare-fun m!916571 () Bool)

(assert (=> bs!28055 m!916571))

(assert (=> b!988925 d!117433))

(declare-fun d!117435 () Bool)

(declare-fun e!557878 () Bool)

(assert (=> d!117435 e!557878))

(declare-fun res!661393 () Bool)

(assert (=> d!117435 (=> res!661393 e!557878)))

(declare-fun lt!438752 () Bool)

(assert (=> d!117435 (= res!661393 (not lt!438752))))

(declare-fun lt!438755 () Bool)

(assert (=> d!117435 (= lt!438752 lt!438755)))

(declare-fun lt!438753 () Unit!32782)

(declare-fun e!557879 () Unit!32782)

(assert (=> d!117435 (= lt!438753 e!557879)))

(declare-fun c!100463 () Bool)

(assert (=> d!117435 (= c!100463 lt!438755)))

(assert (=> d!117435 (= lt!438755 (containsKey!479 (toList!6805 (+!3104 lt!438598 (tuple2!14881 lt!438602 zeroValue!1220))) lt!438606))))

(assert (=> d!117435 (= (contains!5735 (+!3104 lt!438598 (tuple2!14881 lt!438602 zeroValue!1220)) lt!438606) lt!438752)))

(declare-fun b!989214 () Bool)

(declare-fun lt!438754 () Unit!32782)

(assert (=> b!989214 (= e!557879 lt!438754)))

(assert (=> b!989214 (= lt!438754 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 (+!3104 lt!438598 (tuple2!14881 lt!438602 zeroValue!1220))) lt!438606))))

(assert (=> b!989214 (isDefined!381 (getValueByKey!510 (toList!6805 (+!3104 lt!438598 (tuple2!14881 lt!438602 zeroValue!1220))) lt!438606))))

(declare-fun b!989215 () Bool)

(declare-fun Unit!32799 () Unit!32782)

(assert (=> b!989215 (= e!557879 Unit!32799)))

(declare-fun b!989216 () Bool)

(assert (=> b!989216 (= e!557878 (isDefined!381 (getValueByKey!510 (toList!6805 (+!3104 lt!438598 (tuple2!14881 lt!438602 zeroValue!1220))) lt!438606)))))

(assert (= (and d!117435 c!100463) b!989214))

(assert (= (and d!117435 (not c!100463)) b!989215))

(assert (= (and d!117435 (not res!661393)) b!989216))

(declare-fun m!916573 () Bool)

(assert (=> d!117435 m!916573))

(declare-fun m!916575 () Bool)

(assert (=> b!989214 m!916575))

(declare-fun m!916577 () Bool)

(assert (=> b!989214 m!916577))

(assert (=> b!989214 m!916577))

(declare-fun m!916579 () Bool)

(assert (=> b!989214 m!916579))

(assert (=> b!989216 m!916577))

(assert (=> b!989216 m!916577))

(assert (=> b!989216 m!916579))

(assert (=> b!988925 d!117435))

(declare-fun d!117437 () Bool)

(declare-fun e!557880 () Bool)

(assert (=> d!117437 e!557880))

(declare-fun res!661395 () Bool)

(assert (=> d!117437 (=> (not res!661395) (not e!557880))))

(declare-fun lt!438759 () ListLongMap!13579)

(assert (=> d!117437 (= res!661395 (contains!5735 lt!438759 (_1!7451 (tuple2!14881 lt!438613 minValue!1220))))))

(declare-fun lt!438758 () List!20786)

(assert (=> d!117437 (= lt!438759 (ListLongMap!13580 lt!438758))))

(declare-fun lt!438756 () Unit!32782)

(declare-fun lt!438757 () Unit!32782)

(assert (=> d!117437 (= lt!438756 lt!438757)))

(assert (=> d!117437 (= (getValueByKey!510 lt!438758 (_1!7451 (tuple2!14881 lt!438613 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438613 minValue!1220))))))

(assert (=> d!117437 (= lt!438757 (lemmaContainsTupThenGetReturnValue!272 lt!438758 (_1!7451 (tuple2!14881 lt!438613 minValue!1220)) (_2!7451 (tuple2!14881 lt!438613 minValue!1220))))))

(assert (=> d!117437 (= lt!438758 (insertStrictlySorted!329 (toList!6805 lt!438600) (_1!7451 (tuple2!14881 lt!438613 minValue!1220)) (_2!7451 (tuple2!14881 lt!438613 minValue!1220))))))

(assert (=> d!117437 (= (+!3104 lt!438600 (tuple2!14881 lt!438613 minValue!1220)) lt!438759)))

(declare-fun b!989217 () Bool)

(declare-fun res!661394 () Bool)

(assert (=> b!989217 (=> (not res!661394) (not e!557880))))

(assert (=> b!989217 (= res!661394 (= (getValueByKey!510 (toList!6805 lt!438759) (_1!7451 (tuple2!14881 lt!438613 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438613 minValue!1220)))))))

(declare-fun b!989218 () Bool)

(assert (=> b!989218 (= e!557880 (contains!5736 (toList!6805 lt!438759) (tuple2!14881 lt!438613 minValue!1220)))))

(assert (= (and d!117437 res!661395) b!989217))

(assert (= (and b!989217 res!661394) b!989218))

(declare-fun m!916581 () Bool)

(assert (=> d!117437 m!916581))

(declare-fun m!916583 () Bool)

(assert (=> d!117437 m!916583))

(declare-fun m!916585 () Bool)

(assert (=> d!117437 m!916585))

(declare-fun m!916587 () Bool)

(assert (=> d!117437 m!916587))

(declare-fun m!916589 () Bool)

(assert (=> b!989217 m!916589))

(declare-fun m!916591 () Bool)

(assert (=> b!989218 m!916591))

(assert (=> b!988925 d!117437))

(declare-fun d!117439 () Bool)

(assert (=> d!117439 (= (apply!902 lt!438605 lt!438612) (get!15633 (getValueByKey!510 (toList!6805 lt!438605) lt!438612)))))

(declare-fun bs!28056 () Bool)

(assert (= bs!28056 d!117439))

(declare-fun m!916593 () Bool)

(assert (=> bs!28056 m!916593))

(assert (=> bs!28056 m!916593))

(declare-fun m!916595 () Bool)

(assert (=> bs!28056 m!916595))

(assert (=> b!988925 d!117439))

(declare-fun d!117441 () Bool)

(declare-fun e!557881 () Bool)

(assert (=> d!117441 e!557881))

(declare-fun res!661397 () Bool)

(assert (=> d!117441 (=> (not res!661397) (not e!557881))))

(declare-fun lt!438763 () ListLongMap!13579)

(assert (=> d!117441 (= res!661397 (contains!5735 lt!438763 (_1!7451 (tuple2!14881 lt!438603 minValue!1220))))))

(declare-fun lt!438762 () List!20786)

(assert (=> d!117441 (= lt!438763 (ListLongMap!13580 lt!438762))))

(declare-fun lt!438760 () Unit!32782)

(declare-fun lt!438761 () Unit!32782)

(assert (=> d!117441 (= lt!438760 lt!438761)))

(assert (=> d!117441 (= (getValueByKey!510 lt!438762 (_1!7451 (tuple2!14881 lt!438603 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438603 minValue!1220))))))

(assert (=> d!117441 (= lt!438761 (lemmaContainsTupThenGetReturnValue!272 lt!438762 (_1!7451 (tuple2!14881 lt!438603 minValue!1220)) (_2!7451 (tuple2!14881 lt!438603 minValue!1220))))))

(assert (=> d!117441 (= lt!438762 (insertStrictlySorted!329 (toList!6805 lt!438605) (_1!7451 (tuple2!14881 lt!438603 minValue!1220)) (_2!7451 (tuple2!14881 lt!438603 minValue!1220))))))

(assert (=> d!117441 (= (+!3104 lt!438605 (tuple2!14881 lt!438603 minValue!1220)) lt!438763)))

(declare-fun b!989219 () Bool)

(declare-fun res!661396 () Bool)

(assert (=> b!989219 (=> (not res!661396) (not e!557881))))

(assert (=> b!989219 (= res!661396 (= (getValueByKey!510 (toList!6805 lt!438763) (_1!7451 (tuple2!14881 lt!438603 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438603 minValue!1220)))))))

(declare-fun b!989220 () Bool)

(assert (=> b!989220 (= e!557881 (contains!5736 (toList!6805 lt!438763) (tuple2!14881 lt!438603 minValue!1220)))))

(assert (= (and d!117441 res!661397) b!989219))

(assert (= (and b!989219 res!661396) b!989220))

(declare-fun m!916597 () Bool)

(assert (=> d!117441 m!916597))

(declare-fun m!916599 () Bool)

(assert (=> d!117441 m!916599))

(declare-fun m!916601 () Bool)

(assert (=> d!117441 m!916601))

(declare-fun m!916603 () Bool)

(assert (=> d!117441 m!916603))

(declare-fun m!916605 () Bool)

(assert (=> b!989219 m!916605))

(declare-fun m!916607 () Bool)

(assert (=> b!989220 m!916607))

(assert (=> b!988925 d!117441))

(declare-fun d!117443 () Bool)

(assert (=> d!117443 (= (apply!902 (+!3104 lt!438605 (tuple2!14881 lt!438603 minValue!1220)) lt!438612) (apply!902 lt!438605 lt!438612))))

(declare-fun lt!438764 () Unit!32782)

(assert (=> d!117443 (= lt!438764 (choose!1615 lt!438605 lt!438603 minValue!1220 lt!438612))))

(declare-fun e!557882 () Bool)

(assert (=> d!117443 e!557882))

(declare-fun res!661398 () Bool)

(assert (=> d!117443 (=> (not res!661398) (not e!557882))))

(assert (=> d!117443 (= res!661398 (contains!5735 lt!438605 lt!438612))))

(assert (=> d!117443 (= (addApplyDifferent!470 lt!438605 lt!438603 minValue!1220 lt!438612) lt!438764)))

(declare-fun b!989221 () Bool)

(assert (=> b!989221 (= e!557882 (not (= lt!438612 lt!438603)))))

(assert (= (and d!117443 res!661398) b!989221))

(assert (=> d!117443 m!916129))

(assert (=> d!117443 m!916131))

(declare-fun m!916609 () Bool)

(assert (=> d!117443 m!916609))

(declare-fun m!916611 () Bool)

(assert (=> d!117443 m!916611))

(assert (=> d!117443 m!916149))

(assert (=> d!117443 m!916129))

(assert (=> b!988925 d!117443))

(declare-fun d!117445 () Bool)

(assert (=> d!117445 (= (apply!902 (+!3104 lt!438605 (tuple2!14881 lt!438603 minValue!1220)) lt!438612) (get!15633 (getValueByKey!510 (toList!6805 (+!3104 lt!438605 (tuple2!14881 lt!438603 minValue!1220))) lt!438612)))))

(declare-fun bs!28057 () Bool)

(assert (= bs!28057 d!117445))

(declare-fun m!916613 () Bool)

(assert (=> bs!28057 m!916613))

(assert (=> bs!28057 m!916613))

(declare-fun m!916615 () Bool)

(assert (=> bs!28057 m!916615))

(assert (=> b!988925 d!117445))

(declare-fun d!117447 () Bool)

(declare-fun e!557883 () Bool)

(assert (=> d!117447 e!557883))

(declare-fun res!661400 () Bool)

(assert (=> d!117447 (=> (not res!661400) (not e!557883))))

(declare-fun lt!438768 () ListLongMap!13579)

(assert (=> d!117447 (= res!661400 (contains!5735 lt!438768 (_1!7451 (tuple2!14881 lt!438602 zeroValue!1220))))))

(declare-fun lt!438767 () List!20786)

(assert (=> d!117447 (= lt!438768 (ListLongMap!13580 lt!438767))))

(declare-fun lt!438765 () Unit!32782)

(declare-fun lt!438766 () Unit!32782)

(assert (=> d!117447 (= lt!438765 lt!438766)))

(assert (=> d!117447 (= (getValueByKey!510 lt!438767 (_1!7451 (tuple2!14881 lt!438602 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438602 zeroValue!1220))))))

(assert (=> d!117447 (= lt!438766 (lemmaContainsTupThenGetReturnValue!272 lt!438767 (_1!7451 (tuple2!14881 lt!438602 zeroValue!1220)) (_2!7451 (tuple2!14881 lt!438602 zeroValue!1220))))))

(assert (=> d!117447 (= lt!438767 (insertStrictlySorted!329 (toList!6805 lt!438598) (_1!7451 (tuple2!14881 lt!438602 zeroValue!1220)) (_2!7451 (tuple2!14881 lt!438602 zeroValue!1220))))))

(assert (=> d!117447 (= (+!3104 lt!438598 (tuple2!14881 lt!438602 zeroValue!1220)) lt!438768)))

(declare-fun b!989222 () Bool)

(declare-fun res!661399 () Bool)

(assert (=> b!989222 (=> (not res!661399) (not e!557883))))

(assert (=> b!989222 (= res!661399 (= (getValueByKey!510 (toList!6805 lt!438768) (_1!7451 (tuple2!14881 lt!438602 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438602 zeroValue!1220)))))))

(declare-fun b!989223 () Bool)

(assert (=> b!989223 (= e!557883 (contains!5736 (toList!6805 lt!438768) (tuple2!14881 lt!438602 zeroValue!1220)))))

(assert (= (and d!117447 res!661400) b!989222))

(assert (= (and b!989222 res!661399) b!989223))

(declare-fun m!916617 () Bool)

(assert (=> d!117447 m!916617))

(declare-fun m!916619 () Bool)

(assert (=> d!117447 m!916619))

(declare-fun m!916621 () Bool)

(assert (=> d!117447 m!916621))

(declare-fun m!916623 () Bool)

(assert (=> d!117447 m!916623))

(declare-fun m!916625 () Bool)

(assert (=> b!989222 m!916625))

(declare-fun m!916627 () Bool)

(assert (=> b!989223 m!916627))

(assert (=> b!988925 d!117447))

(declare-fun b!989227 () Bool)

(declare-fun e!557885 () Option!516)

(assert (=> b!989227 (= e!557885 None!514)))

(declare-fun b!989224 () Bool)

(declare-fun e!557884 () Option!516)

(assert (=> b!989224 (= e!557884 (Some!515 (_2!7451 (h!21950 (toList!6805 lt!438510)))))))

(declare-fun d!117449 () Bool)

(declare-fun c!100464 () Bool)

(assert (=> d!117449 (= c!100464 (and ((_ is Cons!20782) (toList!6805 lt!438510)) (= (_1!7451 (h!21950 (toList!6805 lt!438510))) (_1!7451 lt!438398))))))

(assert (=> d!117449 (= (getValueByKey!510 (toList!6805 lt!438510) (_1!7451 lt!438398)) e!557884)))

(declare-fun b!989226 () Bool)

(assert (=> b!989226 (= e!557885 (getValueByKey!510 (t!29711 (toList!6805 lt!438510)) (_1!7451 lt!438398)))))

(declare-fun b!989225 () Bool)

(assert (=> b!989225 (= e!557884 e!557885)))

(declare-fun c!100465 () Bool)

(assert (=> b!989225 (= c!100465 (and ((_ is Cons!20782) (toList!6805 lt!438510)) (not (= (_1!7451 (h!21950 (toList!6805 lt!438510))) (_1!7451 lt!438398)))))))

(assert (= (and d!117449 c!100464) b!989224))

(assert (= (and d!117449 (not c!100464)) b!989225))

(assert (= (and b!989225 c!100465) b!989226))

(assert (= (and b!989225 (not c!100465)) b!989227))

(declare-fun m!916629 () Bool)

(assert (=> b!989226 m!916629))

(assert (=> b!988841 d!117449))

(declare-fun d!117451 () Bool)

(declare-fun e!557886 () Bool)

(assert (=> d!117451 e!557886))

(declare-fun res!661402 () Bool)

(assert (=> d!117451 (=> (not res!661402) (not e!557886))))

(declare-fun lt!438772 () ListLongMap!13579)

(assert (=> d!117451 (= res!661402 (contains!5735 lt!438772 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438771 () List!20786)

(assert (=> d!117451 (= lt!438772 (ListLongMap!13580 lt!438771))))

(declare-fun lt!438769 () Unit!32782)

(declare-fun lt!438770 () Unit!32782)

(assert (=> d!117451 (= lt!438769 lt!438770)))

(assert (=> d!117451 (= (getValueByKey!510 lt!438771 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117451 (= lt!438770 (lemmaContainsTupThenGetReturnValue!272 lt!438771 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117451 (= lt!438771 (insertStrictlySorted!329 (toList!6805 call!41877) (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117451 (= (+!3104 call!41877 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438772)))

(declare-fun b!989228 () Bool)

(declare-fun res!661401 () Bool)

(assert (=> b!989228 (=> (not res!661401) (not e!557886))))

(assert (=> b!989228 (= res!661401 (= (getValueByKey!510 (toList!6805 lt!438772) (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!989229 () Bool)

(assert (=> b!989229 (= e!557886 (contains!5736 (toList!6805 lt!438772) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117451 res!661402) b!989228))

(assert (= (and b!989228 res!661401) b!989229))

(declare-fun m!916631 () Bool)

(assert (=> d!117451 m!916631))

(declare-fun m!916633 () Bool)

(assert (=> d!117451 m!916633))

(declare-fun m!916635 () Bool)

(assert (=> d!117451 m!916635))

(declare-fun m!916637 () Bool)

(assert (=> d!117451 m!916637))

(declare-fun m!916639 () Bool)

(assert (=> b!989228 m!916639))

(declare-fun m!916641 () Bool)

(assert (=> b!989229 m!916641))

(assert (=> b!988911 d!117451))

(declare-fun b!989233 () Bool)

(declare-fun e!557888 () Option!516)

(assert (=> b!989233 (= e!557888 None!514)))

(declare-fun b!989230 () Bool)

(declare-fun e!557887 () Option!516)

(assert (=> b!989230 (= e!557887 (Some!515 (_2!7451 (h!21950 (toList!6805 lt!438506)))))))

(declare-fun d!117453 () Bool)

(declare-fun c!100466 () Bool)

(assert (=> d!117453 (= c!100466 (and ((_ is Cons!20782) (toList!6805 lt!438506)) (= (_1!7451 (h!21950 (toList!6805 lt!438506))) (_1!7451 lt!438400))))))

(assert (=> d!117453 (= (getValueByKey!510 (toList!6805 lt!438506) (_1!7451 lt!438400)) e!557887)))

(declare-fun b!989232 () Bool)

(assert (=> b!989232 (= e!557888 (getValueByKey!510 (t!29711 (toList!6805 lt!438506)) (_1!7451 lt!438400)))))

(declare-fun b!989231 () Bool)

(assert (=> b!989231 (= e!557887 e!557888)))

(declare-fun c!100467 () Bool)

(assert (=> b!989231 (= c!100467 (and ((_ is Cons!20782) (toList!6805 lt!438506)) (not (= (_1!7451 (h!21950 (toList!6805 lt!438506))) (_1!7451 lt!438400)))))))

(assert (= (and d!117453 c!100466) b!989230))

(assert (= (and d!117453 (not c!100466)) b!989231))

(assert (= (and b!989231 c!100467) b!989232))

(assert (= (and b!989231 (not c!100467)) b!989233))

(declare-fun m!916643 () Bool)

(assert (=> b!989232 m!916643))

(assert (=> b!988839 d!117453))

(declare-fun d!117455 () Bool)

(assert (=> d!117455 (= (apply!902 lt!438585 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15633 (getValueByKey!510 (toList!6805 lt!438585) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(declare-fun bs!28058 () Bool)

(assert (= bs!28058 d!117455))

(assert (=> bs!28058 m!915945))

(declare-fun m!916645 () Bool)

(assert (=> bs!28058 m!916645))

(assert (=> bs!28058 m!916645))

(declare-fun m!916647 () Bool)

(assert (=> bs!28058 m!916647))

(assert (=> b!988892 d!117455))

(assert (=> b!988892 d!117325))

(declare-fun d!117457 () Bool)

(declare-fun e!557889 () Bool)

(assert (=> d!117457 e!557889))

(declare-fun res!661404 () Bool)

(assert (=> d!117457 (=> (not res!661404) (not e!557889))))

(declare-fun lt!438776 () ListLongMap!13579)

(assert (=> d!117457 (= res!661404 (contains!5735 lt!438776 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(declare-fun lt!438775 () List!20786)

(assert (=> d!117457 (= lt!438776 (ListLongMap!13580 lt!438775))))

(declare-fun lt!438773 () Unit!32782)

(declare-fun lt!438774 () Unit!32782)

(assert (=> d!117457 (= lt!438773 lt!438774)))

(assert (=> d!117457 (= (getValueByKey!510 lt!438775 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117457 (= lt!438774 (lemmaContainsTupThenGetReturnValue!272 lt!438775 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117457 (= lt!438775 (insertStrictlySorted!329 (toList!6805 lt!438397) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117457 (= (+!3104 lt!438397 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) lt!438776)))

(declare-fun b!989234 () Bool)

(declare-fun res!661403 () Bool)

(assert (=> b!989234 (=> (not res!661403) (not e!557889))))

(assert (=> b!989234 (= res!661403 (= (getValueByKey!510 (toList!6805 lt!438776) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)))))))

(declare-fun b!989235 () Bool)

(assert (=> b!989235 (= e!557889 (contains!5736 (toList!6805 lt!438776) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)))))

(assert (= (and d!117457 res!661404) b!989234))

(assert (= (and b!989234 res!661403) b!989235))

(declare-fun m!916649 () Bool)

(assert (=> d!117457 m!916649))

(declare-fun m!916651 () Bool)

(assert (=> d!117457 m!916651))

(declare-fun m!916653 () Bool)

(assert (=> d!117457 m!916653))

(declare-fun m!916655 () Bool)

(assert (=> d!117457 m!916655))

(declare-fun m!916657 () Bool)

(assert (=> b!989234 m!916657))

(declare-fun m!916659 () Bool)

(assert (=> b!989235 m!916659))

(assert (=> d!117305 d!117457))

(declare-fun d!117459 () Bool)

(declare-fun e!557890 () Bool)

(assert (=> d!117459 e!557890))

(declare-fun res!661406 () Bool)

(assert (=> d!117459 (=> (not res!661406) (not e!557890))))

(declare-fun lt!438780 () ListLongMap!13579)

(assert (=> d!117459 (= res!661406 (contains!5735 lt!438780 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(declare-fun lt!438779 () List!20786)

(assert (=> d!117459 (= lt!438780 (ListLongMap!13580 lt!438779))))

(declare-fun lt!438777 () Unit!32782)

(declare-fun lt!438778 () Unit!32782)

(assert (=> d!117459 (= lt!438777 lt!438778)))

(assert (=> d!117459 (= (getValueByKey!510 lt!438779 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117459 (= lt!438778 (lemmaContainsTupThenGetReturnValue!272 lt!438779 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117459 (= lt!438779 (insertStrictlySorted!329 (toList!6805 (+!3104 lt!438397 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117459 (= (+!3104 (+!3104 lt!438397 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) lt!438780)))

(declare-fun b!989236 () Bool)

(declare-fun res!661405 () Bool)

(assert (=> b!989236 (=> (not res!661405) (not e!557890))))

(assert (=> b!989236 (= res!661405 (= (getValueByKey!510 (toList!6805 lt!438780) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)))))))

(declare-fun b!989237 () Bool)

(assert (=> b!989237 (= e!557890 (contains!5736 (toList!6805 lt!438780) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)))))

(assert (= (and d!117459 res!661406) b!989236))

(assert (= (and b!989236 res!661405) b!989237))

(declare-fun m!916661 () Bool)

(assert (=> d!117459 m!916661))

(declare-fun m!916663 () Bool)

(assert (=> d!117459 m!916663))

(declare-fun m!916665 () Bool)

(assert (=> d!117459 m!916665))

(declare-fun m!916667 () Bool)

(assert (=> d!117459 m!916667))

(declare-fun m!916669 () Bool)

(assert (=> b!989236 m!916669))

(declare-fun m!916671 () Bool)

(assert (=> b!989237 m!916671))

(assert (=> d!117305 d!117459))

(declare-fun d!117461 () Bool)

(declare-fun e!557891 () Bool)

(assert (=> d!117461 e!557891))

(declare-fun res!661408 () Bool)

(assert (=> d!117461 (=> (not res!661408) (not e!557891))))

(declare-fun lt!438784 () ListLongMap!13579)

(assert (=> d!117461 (= res!661408 (contains!5735 lt!438784 (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!438783 () List!20786)

(assert (=> d!117461 (= lt!438784 (ListLongMap!13580 lt!438783))))

(declare-fun lt!438781 () Unit!32782)

(declare-fun lt!438782 () Unit!32782)

(assert (=> d!117461 (= lt!438781 lt!438782)))

(assert (=> d!117461 (= (getValueByKey!510 lt!438783 (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117461 (= lt!438782 (lemmaContainsTupThenGetReturnValue!272 lt!438783 (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117461 (= lt!438783 (insertStrictlySorted!329 (toList!6805 lt!438397) (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117461 (= (+!3104 lt!438397 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!438784)))

(declare-fun b!989238 () Bool)

(declare-fun res!661407 () Bool)

(assert (=> b!989238 (=> (not res!661407) (not e!557891))))

(assert (=> b!989238 (= res!661407 (= (getValueByKey!510 (toList!6805 lt!438784) (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!989239 () Bool)

(assert (=> b!989239 (= e!557891 (contains!5736 (toList!6805 lt!438784) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117461 res!661408) b!989238))

(assert (= (and b!989238 res!661407) b!989239))

(declare-fun m!916673 () Bool)

(assert (=> d!117461 m!916673))

(declare-fun m!916675 () Bool)

(assert (=> d!117461 m!916675))

(declare-fun m!916677 () Bool)

(assert (=> d!117461 m!916677))

(declare-fun m!916679 () Bool)

(assert (=> d!117461 m!916679))

(declare-fun m!916681 () Bool)

(assert (=> b!989238 m!916681))

(declare-fun m!916683 () Bool)

(assert (=> b!989239 m!916683))

(assert (=> d!117305 d!117461))

(declare-fun d!117463 () Bool)

(declare-fun e!557892 () Bool)

(assert (=> d!117463 e!557892))

(declare-fun res!661410 () Bool)

(assert (=> d!117463 (=> (not res!661410) (not e!557892))))

(declare-fun lt!438788 () ListLongMap!13579)

(assert (=> d!117463 (= res!661410 (contains!5735 lt!438788 (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!438787 () List!20786)

(assert (=> d!117463 (= lt!438788 (ListLongMap!13580 lt!438787))))

(declare-fun lt!438785 () Unit!32782)

(declare-fun lt!438786 () Unit!32782)

(assert (=> d!117463 (= lt!438785 lt!438786)))

(assert (=> d!117463 (= (getValueByKey!510 lt!438787 (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117463 (= lt!438786 (lemmaContainsTupThenGetReturnValue!272 lt!438787 (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117463 (= lt!438787 (insertStrictlySorted!329 (toList!6805 (+!3104 lt!438397 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!117463 (= (+!3104 (+!3104 lt!438397 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!438788)))

(declare-fun b!989240 () Bool)

(declare-fun res!661409 () Bool)

(assert (=> b!989240 (=> (not res!661409) (not e!557892))))

(assert (=> b!989240 (= res!661409 (= (getValueByKey!510 (toList!6805 lt!438788) (_1!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!989241 () Bool)

(assert (=> b!989241 (= e!557892 (contains!5736 (toList!6805 lt!438788) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!117463 res!661410) b!989240))

(assert (= (and b!989240 res!661409) b!989241))

(declare-fun m!916685 () Bool)

(assert (=> d!117463 m!916685))

(declare-fun m!916687 () Bool)

(assert (=> d!117463 m!916687))

(declare-fun m!916689 () Bool)

(assert (=> d!117463 m!916689))

(declare-fun m!916691 () Bool)

(assert (=> d!117463 m!916691))

(declare-fun m!916693 () Bool)

(assert (=> b!989240 m!916693))

(declare-fun m!916695 () Bool)

(assert (=> b!989241 m!916695))

(assert (=> d!117305 d!117463))

(declare-fun d!117465 () Bool)

(assert (=> d!117465 (= (+!3104 (+!3104 lt!438397 (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (+!3104 (+!3104 lt!438397 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (=> d!117465 true))

(declare-fun _$28!184 () Unit!32782)

(assert (=> d!117465 (= (choose!1611 lt!438397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30074 _keys!1544) from!1932) lt!438405) _$28!184)))

(declare-fun bs!28059 () Bool)

(assert (= bs!28059 d!117465))

(assert (=> bs!28059 m!916045))

(assert (=> bs!28059 m!916045))

(assert (=> bs!28059 m!916051))

(assert (=> bs!28059 m!916047))

(assert (=> bs!28059 m!916047))

(assert (=> bs!28059 m!916049))

(assert (=> d!117305 d!117465))

(declare-fun d!117467 () Bool)

(declare-fun e!557893 () Bool)

(assert (=> d!117467 e!557893))

(declare-fun res!661411 () Bool)

(assert (=> d!117467 (=> res!661411 e!557893)))

(declare-fun lt!438789 () Bool)

(assert (=> d!117467 (= res!661411 (not lt!438789))))

(declare-fun lt!438792 () Bool)

(assert (=> d!117467 (= lt!438789 lt!438792)))

(declare-fun lt!438790 () Unit!32782)

(declare-fun e!557894 () Unit!32782)

(assert (=> d!117467 (= lt!438790 e!557894)))

(declare-fun c!100468 () Bool)

(assert (=> d!117467 (= c!100468 lt!438792)))

(assert (=> d!117467 (= lt!438792 (containsKey!479 (toList!6805 lt!438585) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117467 (= (contains!5735 lt!438585 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438789)))

(declare-fun b!989242 () Bool)

(declare-fun lt!438791 () Unit!32782)

(assert (=> b!989242 (= e!557894 lt!438791)))

(assert (=> b!989242 (= lt!438791 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438585) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989242 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438585) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989243 () Bool)

(declare-fun Unit!32800 () Unit!32782)

(assert (=> b!989243 (= e!557894 Unit!32800)))

(declare-fun b!989244 () Bool)

(assert (=> b!989244 (= e!557893 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117467 c!100468) b!989242))

(assert (= (and d!117467 (not c!100468)) b!989243))

(assert (= (and d!117467 (not res!661411)) b!989244))

(declare-fun m!916697 () Bool)

(assert (=> d!117467 m!916697))

(declare-fun m!916699 () Bool)

(assert (=> b!989242 m!916699))

(declare-fun m!916701 () Bool)

(assert (=> b!989242 m!916701))

(assert (=> b!989242 m!916701))

(declare-fun m!916703 () Bool)

(assert (=> b!989242 m!916703))

(assert (=> b!989244 m!916701))

(assert (=> b!989244 m!916701))

(assert (=> b!989244 m!916703))

(assert (=> bm!41873 d!117467))

(declare-fun b!989248 () Bool)

(declare-fun e!557896 () Option!516)

(assert (=> b!989248 (= e!557896 None!514)))

(declare-fun b!989245 () Bool)

(declare-fun e!557895 () Option!516)

(assert (=> b!989245 (= e!557895 (Some!515 (_2!7451 (h!21950 (toList!6805 lt!438502)))))))

(declare-fun d!117469 () Bool)

(declare-fun c!100469 () Bool)

(assert (=> d!117469 (= c!100469 (and ((_ is Cons!20782) (toList!6805 lt!438502)) (= (_1!7451 (h!21950 (toList!6805 lt!438502))) (_1!7451 lt!438398))))))

(assert (=> d!117469 (= (getValueByKey!510 (toList!6805 lt!438502) (_1!7451 lt!438398)) e!557895)))

(declare-fun b!989247 () Bool)

(assert (=> b!989247 (= e!557896 (getValueByKey!510 (t!29711 (toList!6805 lt!438502)) (_1!7451 lt!438398)))))

(declare-fun b!989246 () Bool)

(assert (=> b!989246 (= e!557895 e!557896)))

(declare-fun c!100470 () Bool)

(assert (=> b!989246 (= c!100470 (and ((_ is Cons!20782) (toList!6805 lt!438502)) (not (= (_1!7451 (h!21950 (toList!6805 lt!438502))) (_1!7451 lt!438398)))))))

(assert (= (and d!117469 c!100469) b!989245))

(assert (= (and d!117469 (not c!100469)) b!989246))

(assert (= (and b!989246 c!100470) b!989247))

(assert (= (and b!989246 (not c!100470)) b!989248))

(declare-fun m!916705 () Bool)

(assert (=> b!989247 m!916705))

(assert (=> b!988837 d!117469))

(declare-fun d!117471 () Bool)

(declare-fun e!557897 () Bool)

(assert (=> d!117471 e!557897))

(declare-fun res!661412 () Bool)

(assert (=> d!117471 (=> res!661412 e!557897)))

(declare-fun lt!438793 () Bool)

(assert (=> d!117471 (= res!661412 (not lt!438793))))

(declare-fun lt!438796 () Bool)

(assert (=> d!117471 (= lt!438793 lt!438796)))

(declare-fun lt!438794 () Unit!32782)

(declare-fun e!557898 () Unit!32782)

(assert (=> d!117471 (= lt!438794 e!557898)))

(declare-fun c!100471 () Bool)

(assert (=> d!117471 (= c!100471 lt!438796)))

(assert (=> d!117471 (= lt!438796 (containsKey!479 (toList!6805 lt!438522) (_1!7451 lt!438398)))))

(assert (=> d!117471 (= (contains!5735 lt!438522 (_1!7451 lt!438398)) lt!438793)))

(declare-fun b!989249 () Bool)

(declare-fun lt!438795 () Unit!32782)

(assert (=> b!989249 (= e!557898 lt!438795)))

(assert (=> b!989249 (= lt!438795 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438522) (_1!7451 lt!438398)))))

(assert (=> b!989249 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438522) (_1!7451 lt!438398)))))

(declare-fun b!989250 () Bool)

(declare-fun Unit!32801 () Unit!32782)

(assert (=> b!989250 (= e!557898 Unit!32801)))

(declare-fun b!989251 () Bool)

(assert (=> b!989251 (= e!557897 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438522) (_1!7451 lt!438398))))))

(assert (= (and d!117471 c!100471) b!989249))

(assert (= (and d!117471 (not c!100471)) b!989250))

(assert (= (and d!117471 (not res!661412)) b!989251))

(declare-fun m!916707 () Bool)

(assert (=> d!117471 m!916707))

(declare-fun m!916709 () Bool)

(assert (=> b!989249 m!916709))

(assert (=> b!989249 m!916039))

(assert (=> b!989249 m!916039))

(declare-fun m!916711 () Bool)

(assert (=> b!989249 m!916711))

(assert (=> b!989251 m!916039))

(assert (=> b!989251 m!916039))

(assert (=> b!989251 m!916711))

(assert (=> d!117303 d!117471))

(declare-fun b!989255 () Bool)

(declare-fun e!557900 () Option!516)

(assert (=> b!989255 (= e!557900 None!514)))

(declare-fun b!989252 () Bool)

(declare-fun e!557899 () Option!516)

(assert (=> b!989252 (= e!557899 (Some!515 (_2!7451 (h!21950 lt!438521))))))

(declare-fun d!117473 () Bool)

(declare-fun c!100472 () Bool)

(assert (=> d!117473 (= c!100472 (and ((_ is Cons!20782) lt!438521) (= (_1!7451 (h!21950 lt!438521)) (_1!7451 lt!438398))))))

(assert (=> d!117473 (= (getValueByKey!510 lt!438521 (_1!7451 lt!438398)) e!557899)))

(declare-fun b!989254 () Bool)

(assert (=> b!989254 (= e!557900 (getValueByKey!510 (t!29711 lt!438521) (_1!7451 lt!438398)))))

(declare-fun b!989253 () Bool)

(assert (=> b!989253 (= e!557899 e!557900)))

(declare-fun c!100473 () Bool)

(assert (=> b!989253 (= c!100473 (and ((_ is Cons!20782) lt!438521) (not (= (_1!7451 (h!21950 lt!438521)) (_1!7451 lt!438398)))))))

(assert (= (and d!117473 c!100472) b!989252))

(assert (= (and d!117473 (not c!100472)) b!989253))

(assert (= (and b!989253 c!100473) b!989254))

(assert (= (and b!989253 (not c!100473)) b!989255))

(declare-fun m!916713 () Bool)

(assert (=> b!989254 m!916713))

(assert (=> d!117303 d!117473))

(declare-fun d!117475 () Bool)

(assert (=> d!117475 (= (getValueByKey!510 lt!438521 (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398)))))

(declare-fun lt!438797 () Unit!32782)

(assert (=> d!117475 (= lt!438797 (choose!1612 lt!438521 (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(declare-fun e!557901 () Bool)

(assert (=> d!117475 e!557901))

(declare-fun res!661413 () Bool)

(assert (=> d!117475 (=> (not res!661413) (not e!557901))))

(assert (=> d!117475 (= res!661413 (isStrictlySorted!503 lt!438521))))

(assert (=> d!117475 (= (lemmaContainsTupThenGetReturnValue!272 lt!438521 (_1!7451 lt!438398) (_2!7451 lt!438398)) lt!438797)))

(declare-fun b!989256 () Bool)

(declare-fun res!661414 () Bool)

(assert (=> b!989256 (=> (not res!661414) (not e!557901))))

(assert (=> b!989256 (= res!661414 (containsKey!479 lt!438521 (_1!7451 lt!438398)))))

(declare-fun b!989257 () Bool)

(assert (=> b!989257 (= e!557901 (contains!5736 lt!438521 (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398))))))

(assert (= (and d!117475 res!661413) b!989256))

(assert (= (and b!989256 res!661414) b!989257))

(assert (=> d!117475 m!916033))

(declare-fun m!916715 () Bool)

(assert (=> d!117475 m!916715))

(declare-fun m!916717 () Bool)

(assert (=> d!117475 m!916717))

(declare-fun m!916719 () Bool)

(assert (=> b!989256 m!916719))

(declare-fun m!916721 () Bool)

(assert (=> b!989257 m!916721))

(assert (=> d!117303 d!117475))

(declare-fun b!989258 () Bool)

(declare-fun e!557904 () Bool)

(declare-fun lt!438798 () List!20786)

(assert (=> b!989258 (= e!557904 (contains!5736 lt!438798 (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398))))))

(declare-fun b!989259 () Bool)

(declare-fun e!557903 () List!20786)

(declare-fun call!41920 () List!20786)

(assert (=> b!989259 (= e!557903 call!41920)))

(declare-fun b!989260 () Bool)

(declare-fun res!661415 () Bool)

(assert (=> b!989260 (=> (not res!661415) (not e!557904))))

(assert (=> b!989260 (= res!661415 (containsKey!479 lt!438798 (_1!7451 lt!438398)))))

(declare-fun b!989261 () Bool)

(declare-fun c!100474 () Bool)

(declare-fun e!557905 () List!20786)

(declare-fun c!100477 () Bool)

(assert (=> b!989261 (= e!557905 (ite c!100477 (t!29711 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (ite c!100474 (Cons!20782 (h!21950 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (t!29711 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) Nil!20783)))))

(declare-fun b!989262 () Bool)

(declare-fun e!557902 () List!20786)

(declare-fun call!41919 () List!20786)

(assert (=> b!989262 (= e!557902 call!41919)))

(declare-fun bm!41915 () Bool)

(assert (=> bm!41915 (= call!41920 call!41919)))

(declare-fun b!989263 () Bool)

(declare-fun e!557906 () List!20786)

(declare-fun call!41918 () List!20786)

(assert (=> b!989263 (= e!557906 call!41918)))

(declare-fun b!989264 () Bool)

(assert (=> b!989264 (= e!557903 call!41920)))

(declare-fun b!989265 () Bool)

(assert (=> b!989265 (= c!100474 (and ((_ is Cons!20782) (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvsgt (_1!7451 (h!21950 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7451 lt!438398))))))

(assert (=> b!989265 (= e!557902 e!557903)))

(declare-fun d!117477 () Bool)

(assert (=> d!117477 e!557904))

(declare-fun res!661416 () Bool)

(assert (=> d!117477 (=> (not res!661416) (not e!557904))))

(assert (=> d!117477 (= res!661416 (isStrictlySorted!503 lt!438798))))

(assert (=> d!117477 (= lt!438798 e!557906)))

(declare-fun c!100475 () Bool)

(assert (=> d!117477 (= c!100475 (and ((_ is Cons!20782) (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (bvslt (_1!7451 (h!21950 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7451 lt!438398))))))

(assert (=> d!117477 (isStrictlySorted!503 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))))

(assert (=> d!117477 (= (insertStrictlySorted!329 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7451 lt!438398) (_2!7451 lt!438398)) lt!438798)))

(declare-fun b!989266 () Bool)

(assert (=> b!989266 (= e!557905 (insertStrictlySorted!329 (t!29711 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(declare-fun b!989267 () Bool)

(assert (=> b!989267 (= e!557906 e!557902)))

(assert (=> b!989267 (= c!100477 (and ((_ is Cons!20782) (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (= (_1!7451 (h!21950 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)))) (_1!7451 lt!438398))))))

(declare-fun bm!41916 () Bool)

(assert (=> bm!41916 (= call!41918 ($colon$colon!553 e!557905 (ite c!100475 (h!21950 (toList!6805 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))) (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398)))))))

(declare-fun c!100476 () Bool)

(assert (=> bm!41916 (= c!100476 c!100475)))

(declare-fun bm!41917 () Bool)

(assert (=> bm!41917 (= call!41919 call!41918)))

(assert (= (and d!117477 c!100475) b!989263))

(assert (= (and d!117477 (not c!100475)) b!989267))

(assert (= (and b!989267 c!100477) b!989262))

(assert (= (and b!989267 (not c!100477)) b!989265))

(assert (= (and b!989265 c!100474) b!989264))

(assert (= (and b!989265 (not c!100474)) b!989259))

(assert (= (or b!989264 b!989259) bm!41915))

(assert (= (or b!989262 bm!41915) bm!41917))

(assert (= (or b!989263 bm!41917) bm!41916))

(assert (= (and bm!41916 c!100476) b!989266))

(assert (= (and bm!41916 (not c!100476)) b!989261))

(assert (= (and d!117477 res!661416) b!989260))

(assert (= (and b!989260 res!661415) b!989258))

(declare-fun m!916723 () Bool)

(assert (=> b!989260 m!916723))

(declare-fun m!916725 () Bool)

(assert (=> b!989258 m!916725))

(declare-fun m!916727 () Bool)

(assert (=> b!989266 m!916727))

(declare-fun m!916729 () Bool)

(assert (=> d!117477 m!916729))

(declare-fun m!916731 () Bool)

(assert (=> d!117477 m!916731))

(declare-fun m!916733 () Bool)

(assert (=> bm!41916 m!916733))

(assert (=> d!117303 d!117477))

(declare-fun d!117479 () Bool)

(declare-fun lt!438799 () Bool)

(assert (=> d!117479 (= lt!438799 (select (content!418 (toList!6805 lt!438593)) lt!438398))))

(declare-fun e!557907 () Bool)

(assert (=> d!117479 (= lt!438799 e!557907)))

(declare-fun res!661417 () Bool)

(assert (=> d!117479 (=> (not res!661417) (not e!557907))))

(assert (=> d!117479 (= res!661417 ((_ is Cons!20782) (toList!6805 lt!438593)))))

(assert (=> d!117479 (= (contains!5736 (toList!6805 lt!438593) lt!438398) lt!438799)))

(declare-fun b!989268 () Bool)

(declare-fun e!557908 () Bool)

(assert (=> b!989268 (= e!557907 e!557908)))

(declare-fun res!661418 () Bool)

(assert (=> b!989268 (=> res!661418 e!557908)))

(assert (=> b!989268 (= res!661418 (= (h!21950 (toList!6805 lt!438593)) lt!438398))))

(declare-fun b!989269 () Bool)

(assert (=> b!989269 (= e!557908 (contains!5736 (t!29711 (toList!6805 lt!438593)) lt!438398))))

(assert (= (and d!117479 res!661417) b!989268))

(assert (= (and b!989268 (not res!661418)) b!989269))

(declare-fun m!916735 () Bool)

(assert (=> d!117479 m!916735))

(declare-fun m!916737 () Bool)

(assert (=> d!117479 m!916737))

(declare-fun m!916739 () Bool)

(assert (=> b!989269 m!916739))

(assert (=> b!988913 d!117479))

(assert (=> b!988825 d!117367))

(assert (=> bm!41879 d!117419))

(declare-fun d!117481 () Bool)

(assert (=> d!117481 (= (apply!902 lt!438585 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15633 (getValueByKey!510 (toList!6805 lt!438585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28060 () Bool)

(assert (= bs!28060 d!117481))

(assert (=> bs!28060 m!916701))

(assert (=> bs!28060 m!916701))

(declare-fun m!916741 () Bool)

(assert (=> bs!28060 m!916741))

(assert (=> b!988899 d!117481))

(declare-fun b!989273 () Bool)

(declare-fun e!557910 () Option!516)

(assert (=> b!989273 (= e!557910 None!514)))

(declare-fun b!989270 () Bool)

(declare-fun e!557909 () Option!516)

(assert (=> b!989270 (= e!557909 (Some!515 (_2!7451 (h!21950 (toList!6805 lt!438522)))))))

(declare-fun d!117483 () Bool)

(declare-fun c!100478 () Bool)

(assert (=> d!117483 (= c!100478 (and ((_ is Cons!20782) (toList!6805 lt!438522)) (= (_1!7451 (h!21950 (toList!6805 lt!438522))) (_1!7451 lt!438398))))))

(assert (=> d!117483 (= (getValueByKey!510 (toList!6805 lt!438522) (_1!7451 lt!438398)) e!557909)))

(declare-fun b!989272 () Bool)

(assert (=> b!989272 (= e!557910 (getValueByKey!510 (t!29711 (toList!6805 lt!438522)) (_1!7451 lt!438398)))))

(declare-fun b!989271 () Bool)

(assert (=> b!989271 (= e!557909 e!557910)))

(declare-fun c!100479 () Bool)

(assert (=> b!989271 (= c!100479 (and ((_ is Cons!20782) (toList!6805 lt!438522)) (not (= (_1!7451 (h!21950 (toList!6805 lt!438522))) (_1!7451 lt!438398)))))))

(assert (= (and d!117483 c!100478) b!989270))

(assert (= (and d!117483 (not c!100478)) b!989271))

(assert (= (and b!989271 c!100479) b!989272))

(assert (= (and b!989271 (not c!100479)) b!989273))

(declare-fun m!916743 () Bool)

(assert (=> b!989272 m!916743))

(assert (=> b!988847 d!117483))

(declare-fun b!989277 () Bool)

(declare-fun e!557912 () Option!516)

(assert (=> b!989277 (= e!557912 None!514)))

(declare-fun b!989274 () Bool)

(declare-fun e!557911 () Option!516)

(assert (=> b!989274 (= e!557911 (Some!515 (_2!7451 (h!21950 (toList!6805 lt!438518)))))))

(declare-fun d!117485 () Bool)

(declare-fun c!100480 () Bool)

(assert (=> d!117485 (= c!100480 (and ((_ is Cons!20782) (toList!6805 lt!438518)) (= (_1!7451 (h!21950 (toList!6805 lt!438518))) (_1!7451 lt!438403))))))

(assert (=> d!117485 (= (getValueByKey!510 (toList!6805 lt!438518) (_1!7451 lt!438403)) e!557911)))

(declare-fun b!989276 () Bool)

(assert (=> b!989276 (= e!557912 (getValueByKey!510 (t!29711 (toList!6805 lt!438518)) (_1!7451 lt!438403)))))

(declare-fun b!989275 () Bool)

(assert (=> b!989275 (= e!557911 e!557912)))

(declare-fun c!100481 () Bool)

(assert (=> b!989275 (= c!100481 (and ((_ is Cons!20782) (toList!6805 lt!438518)) (not (= (_1!7451 (h!21950 (toList!6805 lt!438518))) (_1!7451 lt!438403)))))))

(assert (= (and d!117485 c!100480) b!989274))

(assert (= (and d!117485 (not c!100480)) b!989275))

(assert (= (and b!989275 c!100481) b!989276))

(assert (= (and b!989275 (not c!100481)) b!989277))

(declare-fun m!916745 () Bool)

(assert (=> b!989276 m!916745))

(assert (=> b!988845 d!117485))

(declare-fun d!117487 () Bool)

(declare-fun e!557913 () Bool)

(assert (=> d!117487 e!557913))

(declare-fun res!661419 () Bool)

(assert (=> d!117487 (=> res!661419 e!557913)))

(declare-fun lt!438800 () Bool)

(assert (=> d!117487 (= res!661419 (not lt!438800))))

(declare-fun lt!438803 () Bool)

(assert (=> d!117487 (= lt!438800 lt!438803)))

(declare-fun lt!438801 () Unit!32782)

(declare-fun e!557914 () Unit!32782)

(assert (=> d!117487 (= lt!438801 e!557914)))

(declare-fun c!100482 () Bool)

(assert (=> d!117487 (= c!100482 lt!438803)))

(assert (=> d!117487 (= lt!438803 (containsKey!479 (toList!6805 lt!438611) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117487 (= (contains!5735 lt!438611 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438800)))

(declare-fun b!989278 () Bool)

(declare-fun lt!438802 () Unit!32782)

(assert (=> b!989278 (= e!557914 lt!438802)))

(assert (=> b!989278 (= lt!438802 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438611) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989278 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438611) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989279 () Bool)

(declare-fun Unit!32802 () Unit!32782)

(assert (=> b!989279 (= e!557914 Unit!32802)))

(declare-fun b!989280 () Bool)

(assert (=> b!989280 (= e!557913 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438611) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117487 c!100482) b!989278))

(assert (= (and d!117487 (not c!100482)) b!989279))

(assert (= (and d!117487 (not res!661419)) b!989280))

(declare-fun m!916747 () Bool)

(assert (=> d!117487 m!916747))

(declare-fun m!916749 () Bool)

(assert (=> b!989278 m!916749))

(declare-fun m!916751 () Bool)

(assert (=> b!989278 m!916751))

(assert (=> b!989278 m!916751))

(declare-fun m!916753 () Bool)

(assert (=> b!989278 m!916753))

(assert (=> b!989280 m!916751))

(assert (=> b!989280 m!916751))

(assert (=> b!989280 m!916753))

(assert (=> bm!41883 d!117487))

(declare-fun d!117489 () Bool)

(declare-fun e!557915 () Bool)

(assert (=> d!117489 e!557915))

(declare-fun res!661420 () Bool)

(assert (=> d!117489 (=> res!661420 e!557915)))

(declare-fun lt!438804 () Bool)

(assert (=> d!117489 (= res!661420 (not lt!438804))))

(declare-fun lt!438807 () Bool)

(assert (=> d!117489 (= lt!438804 lt!438807)))

(declare-fun lt!438805 () Unit!32782)

(declare-fun e!557916 () Unit!32782)

(assert (=> d!117489 (= lt!438805 e!557916)))

(declare-fun c!100483 () Bool)

(assert (=> d!117489 (= c!100483 lt!438807)))

(assert (=> d!117489 (= lt!438807 (containsKey!479 (toList!6805 lt!438484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117489 (= (contains!5735 lt!438484 #b1000000000000000000000000000000000000000000000000000000000000000) lt!438804)))

(declare-fun b!989281 () Bool)

(declare-fun lt!438806 () Unit!32782)

(assert (=> b!989281 (= e!557916 lt!438806)))

(assert (=> b!989281 (= lt!438806 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989281 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438484) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989282 () Bool)

(declare-fun Unit!32803 () Unit!32782)

(assert (=> b!989282 (= e!557916 Unit!32803)))

(declare-fun b!989283 () Bool)

(assert (=> b!989283 (= e!557915 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438484) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117489 c!100483) b!989281))

(assert (= (and d!117489 (not c!100483)) b!989282))

(assert (= (and d!117489 (not res!661420)) b!989283))

(declare-fun m!916755 () Bool)

(assert (=> d!117489 m!916755))

(declare-fun m!916757 () Bool)

(assert (=> b!989281 m!916757))

(declare-fun m!916759 () Bool)

(assert (=> b!989281 m!916759))

(assert (=> b!989281 m!916759))

(declare-fun m!916761 () Bool)

(assert (=> b!989281 m!916761))

(assert (=> b!989283 m!916759))

(assert (=> b!989283 m!916759))

(assert (=> b!989283 m!916761))

(assert (=> b!988821 d!117489))

(assert (=> d!117311 d!117281))

(assert (=> b!988830 d!117361))

(declare-fun d!117491 () Bool)

(assert (=> d!117491 (= (apply!902 (+!3104 lt!438589 (tuple2!14881 lt!438578 zeroValue!1220)) lt!438588) (apply!902 lt!438589 lt!438588))))

(declare-fun lt!438808 () Unit!32782)

(assert (=> d!117491 (= lt!438808 (choose!1615 lt!438589 lt!438578 zeroValue!1220 lt!438588))))

(declare-fun e!557917 () Bool)

(assert (=> d!117491 e!557917))

(declare-fun res!661421 () Bool)

(assert (=> d!117491 (=> (not res!661421) (not e!557917))))

(assert (=> d!117491 (= res!661421 (contains!5735 lt!438589 lt!438588))))

(assert (=> d!117491 (= (addApplyDifferent!470 lt!438589 lt!438578 zeroValue!1220 lt!438588) lt!438808)))

(declare-fun b!989284 () Bool)

(assert (=> b!989284 (= e!557917 (not (= lt!438588 lt!438578)))))

(assert (= (and d!117491 res!661421) b!989284))

(assert (=> d!117491 m!916063))

(assert (=> d!117491 m!916079))

(declare-fun m!916763 () Bool)

(assert (=> d!117491 m!916763))

(declare-fun m!916765 () Bool)

(assert (=> d!117491 m!916765))

(assert (=> d!117491 m!916083))

(assert (=> d!117491 m!916063))

(assert (=> b!988902 d!117491))

(declare-fun d!117493 () Bool)

(declare-fun e!557918 () Bool)

(assert (=> d!117493 e!557918))

(declare-fun res!661423 () Bool)

(assert (=> d!117493 (=> (not res!661423) (not e!557918))))

(declare-fun lt!438812 () ListLongMap!13579)

(assert (=> d!117493 (= res!661423 (contains!5735 lt!438812 (_1!7451 (tuple2!14881 lt!438577 minValue!1220))))))

(declare-fun lt!438811 () List!20786)

(assert (=> d!117493 (= lt!438812 (ListLongMap!13580 lt!438811))))

(declare-fun lt!438809 () Unit!32782)

(declare-fun lt!438810 () Unit!32782)

(assert (=> d!117493 (= lt!438809 lt!438810)))

(assert (=> d!117493 (= (getValueByKey!510 lt!438811 (_1!7451 (tuple2!14881 lt!438577 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438577 minValue!1220))))))

(assert (=> d!117493 (= lt!438810 (lemmaContainsTupThenGetReturnValue!272 lt!438811 (_1!7451 (tuple2!14881 lt!438577 minValue!1220)) (_2!7451 (tuple2!14881 lt!438577 minValue!1220))))))

(assert (=> d!117493 (= lt!438811 (insertStrictlySorted!329 (toList!6805 lt!438579) (_1!7451 (tuple2!14881 lt!438577 minValue!1220)) (_2!7451 (tuple2!14881 lt!438577 minValue!1220))))))

(assert (=> d!117493 (= (+!3104 lt!438579 (tuple2!14881 lt!438577 minValue!1220)) lt!438812)))

(declare-fun b!989285 () Bool)

(declare-fun res!661422 () Bool)

(assert (=> b!989285 (=> (not res!661422) (not e!557918))))

(assert (=> b!989285 (= res!661422 (= (getValueByKey!510 (toList!6805 lt!438812) (_1!7451 (tuple2!14881 lt!438577 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438577 minValue!1220)))))))

(declare-fun b!989286 () Bool)

(assert (=> b!989286 (= e!557918 (contains!5736 (toList!6805 lt!438812) (tuple2!14881 lt!438577 minValue!1220)))))

(assert (= (and d!117493 res!661423) b!989285))

(assert (= (and b!989285 res!661422) b!989286))

(declare-fun m!916767 () Bool)

(assert (=> d!117493 m!916767))

(declare-fun m!916769 () Bool)

(assert (=> d!117493 m!916769))

(declare-fun m!916771 () Bool)

(assert (=> d!117493 m!916771))

(declare-fun m!916773 () Bool)

(assert (=> d!117493 m!916773))

(declare-fun m!916775 () Bool)

(assert (=> b!989285 m!916775))

(declare-fun m!916777 () Bool)

(assert (=> b!989286 m!916777))

(assert (=> b!988902 d!117493))

(declare-fun d!117495 () Bool)

(assert (=> d!117495 (= (apply!902 lt!438574 lt!438568) (get!15633 (getValueByKey!510 (toList!6805 lt!438574) lt!438568)))))

(declare-fun bs!28061 () Bool)

(assert (= bs!28061 d!117495))

(declare-fun m!916779 () Bool)

(assert (=> bs!28061 m!916779))

(assert (=> bs!28061 m!916779))

(declare-fun m!916781 () Bool)

(assert (=> bs!28061 m!916781))

(assert (=> b!988902 d!117495))

(declare-fun d!117497 () Bool)

(assert (=> d!117497 (contains!5735 (+!3104 lt!438572 (tuple2!14881 lt!438576 zeroValue!1220)) lt!438580)))

(declare-fun lt!438813 () Unit!32782)

(assert (=> d!117497 (= lt!438813 (choose!1614 lt!438572 lt!438576 zeroValue!1220 lt!438580))))

(assert (=> d!117497 (contains!5735 lt!438572 lt!438580)))

(assert (=> d!117497 (= (addStillContains!614 lt!438572 lt!438576 zeroValue!1220 lt!438580) lt!438813)))

(declare-fun bs!28062 () Bool)

(assert (= bs!28062 d!117497))

(assert (=> bs!28062 m!916073))

(assert (=> bs!28062 m!916073))

(assert (=> bs!28062 m!916087))

(declare-fun m!916783 () Bool)

(assert (=> bs!28062 m!916783))

(declare-fun m!916785 () Bool)

(assert (=> bs!28062 m!916785))

(assert (=> b!988902 d!117497))

(assert (=> b!988902 d!117291))

(declare-fun d!117499 () Bool)

(assert (=> d!117499 (= (apply!902 (+!3104 lt!438579 (tuple2!14881 lt!438577 minValue!1220)) lt!438586) (apply!902 lt!438579 lt!438586))))

(declare-fun lt!438814 () Unit!32782)

(assert (=> d!117499 (= lt!438814 (choose!1615 lt!438579 lt!438577 minValue!1220 lt!438586))))

(declare-fun e!557919 () Bool)

(assert (=> d!117499 e!557919))

(declare-fun res!661424 () Bool)

(assert (=> d!117499 (=> (not res!661424) (not e!557919))))

(assert (=> d!117499 (= res!661424 (contains!5735 lt!438579 lt!438586))))

(assert (=> d!117499 (= (addApplyDifferent!470 lt!438579 lt!438577 minValue!1220 lt!438586) lt!438814)))

(declare-fun b!989287 () Bool)

(assert (=> b!989287 (= e!557919 (not (= lt!438586 lt!438577)))))

(assert (= (and d!117499 res!661424) b!989287))

(assert (=> d!117499 m!916069))

(assert (=> d!117499 m!916071))

(declare-fun m!916787 () Bool)

(assert (=> d!117499 m!916787))

(declare-fun m!916789 () Bool)

(assert (=> d!117499 m!916789))

(assert (=> d!117499 m!916089))

(assert (=> d!117499 m!916069))

(assert (=> b!988902 d!117499))

(declare-fun d!117501 () Bool)

(assert (=> d!117501 (= (apply!902 lt!438579 lt!438586) (get!15633 (getValueByKey!510 (toList!6805 lt!438579) lt!438586)))))

(declare-fun bs!28063 () Bool)

(assert (= bs!28063 d!117501))

(declare-fun m!916791 () Bool)

(assert (=> bs!28063 m!916791))

(assert (=> bs!28063 m!916791))

(declare-fun m!916793 () Bool)

(assert (=> bs!28063 m!916793))

(assert (=> b!988902 d!117501))

(declare-fun d!117503 () Bool)

(declare-fun e!557920 () Bool)

(assert (=> d!117503 e!557920))

(declare-fun res!661425 () Bool)

(assert (=> d!117503 (=> res!661425 e!557920)))

(declare-fun lt!438815 () Bool)

(assert (=> d!117503 (= res!661425 (not lt!438815))))

(declare-fun lt!438818 () Bool)

(assert (=> d!117503 (= lt!438815 lt!438818)))

(declare-fun lt!438816 () Unit!32782)

(declare-fun e!557921 () Unit!32782)

(assert (=> d!117503 (= lt!438816 e!557921)))

(declare-fun c!100484 () Bool)

(assert (=> d!117503 (= c!100484 lt!438818)))

(assert (=> d!117503 (= lt!438818 (containsKey!479 (toList!6805 (+!3104 lt!438572 (tuple2!14881 lt!438576 zeroValue!1220))) lt!438580))))

(assert (=> d!117503 (= (contains!5735 (+!3104 lt!438572 (tuple2!14881 lt!438576 zeroValue!1220)) lt!438580) lt!438815)))

(declare-fun b!989288 () Bool)

(declare-fun lt!438817 () Unit!32782)

(assert (=> b!989288 (= e!557921 lt!438817)))

(assert (=> b!989288 (= lt!438817 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 (+!3104 lt!438572 (tuple2!14881 lt!438576 zeroValue!1220))) lt!438580))))

(assert (=> b!989288 (isDefined!381 (getValueByKey!510 (toList!6805 (+!3104 lt!438572 (tuple2!14881 lt!438576 zeroValue!1220))) lt!438580))))

(declare-fun b!989289 () Bool)

(declare-fun Unit!32804 () Unit!32782)

(assert (=> b!989289 (= e!557921 Unit!32804)))

(declare-fun b!989290 () Bool)

(assert (=> b!989290 (= e!557920 (isDefined!381 (getValueByKey!510 (toList!6805 (+!3104 lt!438572 (tuple2!14881 lt!438576 zeroValue!1220))) lt!438580)))))

(assert (= (and d!117503 c!100484) b!989288))

(assert (= (and d!117503 (not c!100484)) b!989289))

(assert (= (and d!117503 (not res!661425)) b!989290))

(declare-fun m!916795 () Bool)

(assert (=> d!117503 m!916795))

(declare-fun m!916797 () Bool)

(assert (=> b!989288 m!916797))

(declare-fun m!916799 () Bool)

(assert (=> b!989288 m!916799))

(assert (=> b!989288 m!916799))

(declare-fun m!916801 () Bool)

(assert (=> b!989288 m!916801))

(assert (=> b!989290 m!916799))

(assert (=> b!989290 m!916799))

(assert (=> b!989290 m!916801))

(assert (=> b!988902 d!117503))

(declare-fun d!117505 () Bool)

(assert (=> d!117505 (= (apply!902 (+!3104 lt!438579 (tuple2!14881 lt!438577 minValue!1220)) lt!438586) (get!15633 (getValueByKey!510 (toList!6805 (+!3104 lt!438579 (tuple2!14881 lt!438577 minValue!1220))) lt!438586)))))

(declare-fun bs!28064 () Bool)

(assert (= bs!28064 d!117505))

(declare-fun m!916803 () Bool)

(assert (=> bs!28064 m!916803))

(assert (=> bs!28064 m!916803))

(declare-fun m!916805 () Bool)

(assert (=> bs!28064 m!916805))

(assert (=> b!988902 d!117505))

(declare-fun d!117507 () Bool)

(assert (=> d!117507 (= (apply!902 (+!3104 lt!438574 (tuple2!14881 lt!438587 minValue!1220)) lt!438568) (get!15633 (getValueByKey!510 (toList!6805 (+!3104 lt!438574 (tuple2!14881 lt!438587 minValue!1220))) lt!438568)))))

(declare-fun bs!28065 () Bool)

(assert (= bs!28065 d!117507))

(declare-fun m!916807 () Bool)

(assert (=> bs!28065 m!916807))

(assert (=> bs!28065 m!916807))

(declare-fun m!916809 () Bool)

(assert (=> bs!28065 m!916809))

(assert (=> b!988902 d!117507))

(declare-fun d!117509 () Bool)

(assert (=> d!117509 (= (apply!902 (+!3104 lt!438589 (tuple2!14881 lt!438578 zeroValue!1220)) lt!438588) (get!15633 (getValueByKey!510 (toList!6805 (+!3104 lt!438589 (tuple2!14881 lt!438578 zeroValue!1220))) lt!438588)))))

(declare-fun bs!28066 () Bool)

(assert (= bs!28066 d!117509))

(declare-fun m!916811 () Bool)

(assert (=> bs!28066 m!916811))

(assert (=> bs!28066 m!916811))

(declare-fun m!916813 () Bool)

(assert (=> bs!28066 m!916813))

(assert (=> b!988902 d!117509))

(declare-fun d!117511 () Bool)

(assert (=> d!117511 (= (apply!902 lt!438589 lt!438588) (get!15633 (getValueByKey!510 (toList!6805 lt!438589) lt!438588)))))

(declare-fun bs!28067 () Bool)

(assert (= bs!28067 d!117511))

(declare-fun m!916815 () Bool)

(assert (=> bs!28067 m!916815))

(assert (=> bs!28067 m!916815))

(declare-fun m!916817 () Bool)

(assert (=> bs!28067 m!916817))

(assert (=> b!988902 d!117511))

(declare-fun d!117513 () Bool)

(declare-fun e!557922 () Bool)

(assert (=> d!117513 e!557922))

(declare-fun res!661427 () Bool)

(assert (=> d!117513 (=> (not res!661427) (not e!557922))))

(declare-fun lt!438822 () ListLongMap!13579)

(assert (=> d!117513 (= res!661427 (contains!5735 lt!438822 (_1!7451 (tuple2!14881 lt!438587 minValue!1220))))))

(declare-fun lt!438821 () List!20786)

(assert (=> d!117513 (= lt!438822 (ListLongMap!13580 lt!438821))))

(declare-fun lt!438819 () Unit!32782)

(declare-fun lt!438820 () Unit!32782)

(assert (=> d!117513 (= lt!438819 lt!438820)))

(assert (=> d!117513 (= (getValueByKey!510 lt!438821 (_1!7451 (tuple2!14881 lt!438587 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438587 minValue!1220))))))

(assert (=> d!117513 (= lt!438820 (lemmaContainsTupThenGetReturnValue!272 lt!438821 (_1!7451 (tuple2!14881 lt!438587 minValue!1220)) (_2!7451 (tuple2!14881 lt!438587 minValue!1220))))))

(assert (=> d!117513 (= lt!438821 (insertStrictlySorted!329 (toList!6805 lt!438574) (_1!7451 (tuple2!14881 lt!438587 minValue!1220)) (_2!7451 (tuple2!14881 lt!438587 minValue!1220))))))

(assert (=> d!117513 (= (+!3104 lt!438574 (tuple2!14881 lt!438587 minValue!1220)) lt!438822)))

(declare-fun b!989291 () Bool)

(declare-fun res!661426 () Bool)

(assert (=> b!989291 (=> (not res!661426) (not e!557922))))

(assert (=> b!989291 (= res!661426 (= (getValueByKey!510 (toList!6805 lt!438822) (_1!7451 (tuple2!14881 lt!438587 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438587 minValue!1220)))))))

(declare-fun b!989292 () Bool)

(assert (=> b!989292 (= e!557922 (contains!5736 (toList!6805 lt!438822) (tuple2!14881 lt!438587 minValue!1220)))))

(assert (= (and d!117513 res!661427) b!989291))

(assert (= (and b!989291 res!661426) b!989292))

(declare-fun m!916819 () Bool)

(assert (=> d!117513 m!916819))

(declare-fun m!916821 () Bool)

(assert (=> d!117513 m!916821))

(declare-fun m!916823 () Bool)

(assert (=> d!117513 m!916823))

(declare-fun m!916825 () Bool)

(assert (=> d!117513 m!916825))

(declare-fun m!916827 () Bool)

(assert (=> b!989291 m!916827))

(declare-fun m!916829 () Bool)

(assert (=> b!989292 m!916829))

(assert (=> b!988902 d!117513))

(declare-fun d!117515 () Bool)

(declare-fun e!557923 () Bool)

(assert (=> d!117515 e!557923))

(declare-fun res!661429 () Bool)

(assert (=> d!117515 (=> (not res!661429) (not e!557923))))

(declare-fun lt!438826 () ListLongMap!13579)

(assert (=> d!117515 (= res!661429 (contains!5735 lt!438826 (_1!7451 (tuple2!14881 lt!438578 zeroValue!1220))))))

(declare-fun lt!438825 () List!20786)

(assert (=> d!117515 (= lt!438826 (ListLongMap!13580 lt!438825))))

(declare-fun lt!438823 () Unit!32782)

(declare-fun lt!438824 () Unit!32782)

(assert (=> d!117515 (= lt!438823 lt!438824)))

(assert (=> d!117515 (= (getValueByKey!510 lt!438825 (_1!7451 (tuple2!14881 lt!438578 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438578 zeroValue!1220))))))

(assert (=> d!117515 (= lt!438824 (lemmaContainsTupThenGetReturnValue!272 lt!438825 (_1!7451 (tuple2!14881 lt!438578 zeroValue!1220)) (_2!7451 (tuple2!14881 lt!438578 zeroValue!1220))))))

(assert (=> d!117515 (= lt!438825 (insertStrictlySorted!329 (toList!6805 lt!438589) (_1!7451 (tuple2!14881 lt!438578 zeroValue!1220)) (_2!7451 (tuple2!14881 lt!438578 zeroValue!1220))))))

(assert (=> d!117515 (= (+!3104 lt!438589 (tuple2!14881 lt!438578 zeroValue!1220)) lt!438826)))

(declare-fun b!989293 () Bool)

(declare-fun res!661428 () Bool)

(assert (=> b!989293 (=> (not res!661428) (not e!557923))))

(assert (=> b!989293 (= res!661428 (= (getValueByKey!510 (toList!6805 lt!438826) (_1!7451 (tuple2!14881 lt!438578 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438578 zeroValue!1220)))))))

(declare-fun b!989294 () Bool)

(assert (=> b!989294 (= e!557923 (contains!5736 (toList!6805 lt!438826) (tuple2!14881 lt!438578 zeroValue!1220)))))

(assert (= (and d!117515 res!661429) b!989293))

(assert (= (and b!989293 res!661428) b!989294))

(declare-fun m!916831 () Bool)

(assert (=> d!117515 m!916831))

(declare-fun m!916833 () Bool)

(assert (=> d!117515 m!916833))

(declare-fun m!916835 () Bool)

(assert (=> d!117515 m!916835))

(declare-fun m!916837 () Bool)

(assert (=> d!117515 m!916837))

(declare-fun m!916839 () Bool)

(assert (=> b!989293 m!916839))

(declare-fun m!916841 () Bool)

(assert (=> b!989294 m!916841))

(assert (=> b!988902 d!117515))

(declare-fun d!117517 () Bool)

(declare-fun e!557924 () Bool)

(assert (=> d!117517 e!557924))

(declare-fun res!661431 () Bool)

(assert (=> d!117517 (=> (not res!661431) (not e!557924))))

(declare-fun lt!438830 () ListLongMap!13579)

(assert (=> d!117517 (= res!661431 (contains!5735 lt!438830 (_1!7451 (tuple2!14881 lt!438576 zeroValue!1220))))))

(declare-fun lt!438829 () List!20786)

(assert (=> d!117517 (= lt!438830 (ListLongMap!13580 lt!438829))))

(declare-fun lt!438827 () Unit!32782)

(declare-fun lt!438828 () Unit!32782)

(assert (=> d!117517 (= lt!438827 lt!438828)))

(assert (=> d!117517 (= (getValueByKey!510 lt!438829 (_1!7451 (tuple2!14881 lt!438576 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438576 zeroValue!1220))))))

(assert (=> d!117517 (= lt!438828 (lemmaContainsTupThenGetReturnValue!272 lt!438829 (_1!7451 (tuple2!14881 lt!438576 zeroValue!1220)) (_2!7451 (tuple2!14881 lt!438576 zeroValue!1220))))))

(assert (=> d!117517 (= lt!438829 (insertStrictlySorted!329 (toList!6805 lt!438572) (_1!7451 (tuple2!14881 lt!438576 zeroValue!1220)) (_2!7451 (tuple2!14881 lt!438576 zeroValue!1220))))))

(assert (=> d!117517 (= (+!3104 lt!438572 (tuple2!14881 lt!438576 zeroValue!1220)) lt!438830)))

(declare-fun b!989295 () Bool)

(declare-fun res!661430 () Bool)

(assert (=> b!989295 (=> (not res!661430) (not e!557924))))

(assert (=> b!989295 (= res!661430 (= (getValueByKey!510 (toList!6805 lt!438830) (_1!7451 (tuple2!14881 lt!438576 zeroValue!1220))) (Some!515 (_2!7451 (tuple2!14881 lt!438576 zeroValue!1220)))))))

(declare-fun b!989296 () Bool)

(assert (=> b!989296 (= e!557924 (contains!5736 (toList!6805 lt!438830) (tuple2!14881 lt!438576 zeroValue!1220)))))

(assert (= (and d!117517 res!661431) b!989295))

(assert (= (and b!989295 res!661430) b!989296))

(declare-fun m!916843 () Bool)

(assert (=> d!117517 m!916843))

(declare-fun m!916845 () Bool)

(assert (=> d!117517 m!916845))

(declare-fun m!916847 () Bool)

(assert (=> d!117517 m!916847))

(declare-fun m!916849 () Bool)

(assert (=> d!117517 m!916849))

(declare-fun m!916851 () Bool)

(assert (=> b!989295 m!916851))

(declare-fun m!916853 () Bool)

(assert (=> b!989296 m!916853))

(assert (=> b!988902 d!117517))

(declare-fun d!117519 () Bool)

(assert (=> d!117519 (= (apply!902 (+!3104 lt!438574 (tuple2!14881 lt!438587 minValue!1220)) lt!438568) (apply!902 lt!438574 lt!438568))))

(declare-fun lt!438831 () Unit!32782)

(assert (=> d!117519 (= lt!438831 (choose!1615 lt!438574 lt!438587 minValue!1220 lt!438568))))

(declare-fun e!557925 () Bool)

(assert (=> d!117519 e!557925))

(declare-fun res!661432 () Bool)

(assert (=> d!117519 (=> (not res!661432) (not e!557925))))

(assert (=> d!117519 (= res!661432 (contains!5735 lt!438574 lt!438568))))

(assert (=> d!117519 (= (addApplyDifferent!470 lt!438574 lt!438587 minValue!1220 lt!438568) lt!438831)))

(declare-fun b!989297 () Bool)

(assert (=> b!989297 (= e!557925 (not (= lt!438568 lt!438587)))))

(assert (= (and d!117519 res!661432) b!989297))

(assert (=> d!117519 m!916061))

(assert (=> d!117519 m!916081))

(declare-fun m!916855 () Bool)

(assert (=> d!117519 m!916855))

(declare-fun m!916857 () Bool)

(assert (=> d!117519 m!916857))

(assert (=> d!117519 m!916067))

(assert (=> d!117519 m!916061))

(assert (=> b!988902 d!117519))

(declare-fun b!989301 () Bool)

(declare-fun e!557927 () Option!516)

(assert (=> b!989301 (= e!557927 None!514)))

(declare-fun b!989298 () Bool)

(declare-fun e!557926 () Option!516)

(assert (=> b!989298 (= e!557926 (Some!515 (_2!7451 (h!21950 (toList!6805 lt!438619)))))))

(declare-fun d!117521 () Bool)

(declare-fun c!100485 () Bool)

(assert (=> d!117521 (= c!100485 (and ((_ is Cons!20782) (toList!6805 lt!438619)) (= (_1!7451 (h!21950 (toList!6805 lt!438619))) (_1!7451 lt!438400))))))

(assert (=> d!117521 (= (getValueByKey!510 (toList!6805 lt!438619) (_1!7451 lt!438400)) e!557926)))

(declare-fun b!989300 () Bool)

(assert (=> b!989300 (= e!557927 (getValueByKey!510 (t!29711 (toList!6805 lt!438619)) (_1!7451 lt!438400)))))

(declare-fun b!989299 () Bool)

(assert (=> b!989299 (= e!557926 e!557927)))

(declare-fun c!100486 () Bool)

(assert (=> b!989299 (= c!100486 (and ((_ is Cons!20782) (toList!6805 lt!438619)) (not (= (_1!7451 (h!21950 (toList!6805 lt!438619))) (_1!7451 lt!438400)))))))

(assert (= (and d!117521 c!100485) b!989298))

(assert (= (and d!117521 (not c!100485)) b!989299))

(assert (= (and b!989299 c!100486) b!989300))

(assert (= (and b!989299 (not c!100486)) b!989301))

(declare-fun m!916859 () Bool)

(assert (=> b!989300 m!916859))

(assert (=> b!988935 d!117521))

(declare-fun d!117523 () Bool)

(declare-fun e!557928 () Bool)

(assert (=> d!117523 e!557928))

(declare-fun res!661433 () Bool)

(assert (=> d!117523 (=> res!661433 e!557928)))

(declare-fun lt!438832 () Bool)

(assert (=> d!117523 (= res!661433 (not lt!438832))))

(declare-fun lt!438835 () Bool)

(assert (=> d!117523 (= lt!438832 lt!438835)))

(declare-fun lt!438833 () Unit!32782)

(declare-fun e!557929 () Unit!32782)

(assert (=> d!117523 (= lt!438833 e!557929)))

(declare-fun c!100487 () Bool)

(assert (=> d!117523 (= c!100487 lt!438835)))

(assert (=> d!117523 (= lt!438835 (containsKey!479 (toList!6805 lt!438502) (_1!7451 lt!438398)))))

(assert (=> d!117523 (= (contains!5735 lt!438502 (_1!7451 lt!438398)) lt!438832)))

(declare-fun b!989302 () Bool)

(declare-fun lt!438834 () Unit!32782)

(assert (=> b!989302 (= e!557929 lt!438834)))

(assert (=> b!989302 (= lt!438834 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438502) (_1!7451 lt!438398)))))

(assert (=> b!989302 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438502) (_1!7451 lt!438398)))))

(declare-fun b!989303 () Bool)

(declare-fun Unit!32805 () Unit!32782)

(assert (=> b!989303 (= e!557929 Unit!32805)))

(declare-fun b!989304 () Bool)

(assert (=> b!989304 (= e!557928 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438502) (_1!7451 lt!438398))))))

(assert (= (and d!117523 c!100487) b!989302))

(assert (= (and d!117523 (not c!100487)) b!989303))

(assert (= (and d!117523 (not res!661433)) b!989304))

(declare-fun m!916861 () Bool)

(assert (=> d!117523 m!916861))

(declare-fun m!916863 () Bool)

(assert (=> b!989302 m!916863))

(assert (=> b!989302 m!915979))

(assert (=> b!989302 m!915979))

(declare-fun m!916865 () Bool)

(assert (=> b!989302 m!916865))

(assert (=> b!989304 m!915979))

(assert (=> b!989304 m!915979))

(assert (=> b!989304 m!916865))

(assert (=> d!117293 d!117523))

(declare-fun b!989308 () Bool)

(declare-fun e!557931 () Option!516)

(assert (=> b!989308 (= e!557931 None!514)))

(declare-fun b!989305 () Bool)

(declare-fun e!557930 () Option!516)

(assert (=> b!989305 (= e!557930 (Some!515 (_2!7451 (h!21950 lt!438501))))))

(declare-fun d!117525 () Bool)

(declare-fun c!100488 () Bool)

(assert (=> d!117525 (= c!100488 (and ((_ is Cons!20782) lt!438501) (= (_1!7451 (h!21950 lt!438501)) (_1!7451 lt!438398))))))

(assert (=> d!117525 (= (getValueByKey!510 lt!438501 (_1!7451 lt!438398)) e!557930)))

(declare-fun b!989307 () Bool)

(assert (=> b!989307 (= e!557931 (getValueByKey!510 (t!29711 lt!438501) (_1!7451 lt!438398)))))

(declare-fun b!989306 () Bool)

(assert (=> b!989306 (= e!557930 e!557931)))

(declare-fun c!100489 () Bool)

(assert (=> b!989306 (= c!100489 (and ((_ is Cons!20782) lt!438501) (not (= (_1!7451 (h!21950 lt!438501)) (_1!7451 lt!438398)))))))

(assert (= (and d!117525 c!100488) b!989305))

(assert (= (and d!117525 (not c!100488)) b!989306))

(assert (= (and b!989306 c!100489) b!989307))

(assert (= (and b!989306 (not c!100489)) b!989308))

(declare-fun m!916867 () Bool)

(assert (=> b!989307 m!916867))

(assert (=> d!117293 d!117525))

(declare-fun d!117527 () Bool)

(assert (=> d!117527 (= (getValueByKey!510 lt!438501 (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398)))))

(declare-fun lt!438836 () Unit!32782)

(assert (=> d!117527 (= lt!438836 (choose!1612 lt!438501 (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(declare-fun e!557932 () Bool)

(assert (=> d!117527 e!557932))

(declare-fun res!661434 () Bool)

(assert (=> d!117527 (=> (not res!661434) (not e!557932))))

(assert (=> d!117527 (= res!661434 (isStrictlySorted!503 lt!438501))))

(assert (=> d!117527 (= (lemmaContainsTupThenGetReturnValue!272 lt!438501 (_1!7451 lt!438398) (_2!7451 lt!438398)) lt!438836)))

(declare-fun b!989309 () Bool)

(declare-fun res!661435 () Bool)

(assert (=> b!989309 (=> (not res!661435) (not e!557932))))

(assert (=> b!989309 (= res!661435 (containsKey!479 lt!438501 (_1!7451 lt!438398)))))

(declare-fun b!989310 () Bool)

(assert (=> b!989310 (= e!557932 (contains!5736 lt!438501 (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398))))))

(assert (= (and d!117527 res!661434) b!989309))

(assert (= (and b!989309 res!661435) b!989310))

(assert (=> d!117527 m!915973))

(declare-fun m!916869 () Bool)

(assert (=> d!117527 m!916869))

(declare-fun m!916871 () Bool)

(assert (=> d!117527 m!916871))

(declare-fun m!916873 () Bool)

(assert (=> b!989309 m!916873))

(declare-fun m!916875 () Bool)

(assert (=> b!989310 m!916875))

(assert (=> d!117293 d!117527))

(declare-fun b!989311 () Bool)

(declare-fun e!557935 () Bool)

(declare-fun lt!438837 () List!20786)

(assert (=> b!989311 (= e!557935 (contains!5736 lt!438837 (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398))))))

(declare-fun b!989312 () Bool)

(declare-fun e!557934 () List!20786)

(declare-fun call!41923 () List!20786)

(assert (=> b!989312 (= e!557934 call!41923)))

(declare-fun b!989313 () Bool)

(declare-fun res!661436 () Bool)

(assert (=> b!989313 (=> (not res!661436) (not e!557935))))

(assert (=> b!989313 (= res!661436 (containsKey!479 lt!438837 (_1!7451 lt!438398)))))

(declare-fun e!557936 () List!20786)

(declare-fun c!100493 () Bool)

(declare-fun b!989314 () Bool)

(declare-fun c!100490 () Bool)

(assert (=> b!989314 (= e!557936 (ite c!100493 (t!29711 (toList!6805 lt!438401)) (ite c!100490 (Cons!20782 (h!21950 (toList!6805 lt!438401)) (t!29711 (toList!6805 lt!438401))) Nil!20783)))))

(declare-fun b!989315 () Bool)

(declare-fun e!557933 () List!20786)

(declare-fun call!41922 () List!20786)

(assert (=> b!989315 (= e!557933 call!41922)))

(declare-fun bm!41918 () Bool)

(assert (=> bm!41918 (= call!41923 call!41922)))

(declare-fun b!989316 () Bool)

(declare-fun e!557937 () List!20786)

(declare-fun call!41921 () List!20786)

(assert (=> b!989316 (= e!557937 call!41921)))

(declare-fun b!989317 () Bool)

(assert (=> b!989317 (= e!557934 call!41923)))

(declare-fun b!989318 () Bool)

(assert (=> b!989318 (= c!100490 (and ((_ is Cons!20782) (toList!6805 lt!438401)) (bvsgt (_1!7451 (h!21950 (toList!6805 lt!438401))) (_1!7451 lt!438398))))))

(assert (=> b!989318 (= e!557933 e!557934)))

(declare-fun d!117529 () Bool)

(assert (=> d!117529 e!557935))

(declare-fun res!661437 () Bool)

(assert (=> d!117529 (=> (not res!661437) (not e!557935))))

(assert (=> d!117529 (= res!661437 (isStrictlySorted!503 lt!438837))))

(assert (=> d!117529 (= lt!438837 e!557937)))

(declare-fun c!100491 () Bool)

(assert (=> d!117529 (= c!100491 (and ((_ is Cons!20782) (toList!6805 lt!438401)) (bvslt (_1!7451 (h!21950 (toList!6805 lt!438401))) (_1!7451 lt!438398))))))

(assert (=> d!117529 (isStrictlySorted!503 (toList!6805 lt!438401))))

(assert (=> d!117529 (= (insertStrictlySorted!329 (toList!6805 lt!438401) (_1!7451 lt!438398) (_2!7451 lt!438398)) lt!438837)))

(declare-fun b!989319 () Bool)

(assert (=> b!989319 (= e!557936 (insertStrictlySorted!329 (t!29711 (toList!6805 lt!438401)) (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(declare-fun b!989320 () Bool)

(assert (=> b!989320 (= e!557937 e!557933)))

(assert (=> b!989320 (= c!100493 (and ((_ is Cons!20782) (toList!6805 lt!438401)) (= (_1!7451 (h!21950 (toList!6805 lt!438401))) (_1!7451 lt!438398))))))

(declare-fun bm!41919 () Bool)

(assert (=> bm!41919 (= call!41921 ($colon$colon!553 e!557936 (ite c!100491 (h!21950 (toList!6805 lt!438401)) (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398)))))))

(declare-fun c!100492 () Bool)

(assert (=> bm!41919 (= c!100492 c!100491)))

(declare-fun bm!41920 () Bool)

(assert (=> bm!41920 (= call!41922 call!41921)))

(assert (= (and d!117529 c!100491) b!989316))

(assert (= (and d!117529 (not c!100491)) b!989320))

(assert (= (and b!989320 c!100493) b!989315))

(assert (= (and b!989320 (not c!100493)) b!989318))

(assert (= (and b!989318 c!100490) b!989317))

(assert (= (and b!989318 (not c!100490)) b!989312))

(assert (= (or b!989317 b!989312) bm!41918))

(assert (= (or b!989315 bm!41918) bm!41920))

(assert (= (or b!989316 bm!41920) bm!41919))

(assert (= (and bm!41919 c!100492) b!989319))

(assert (= (and bm!41919 (not c!100492)) b!989314))

(assert (= (and d!117529 res!661437) b!989313))

(assert (= (and b!989313 res!661436) b!989311))

(declare-fun m!916877 () Bool)

(assert (=> b!989313 m!916877))

(declare-fun m!916879 () Bool)

(assert (=> b!989311 m!916879))

(declare-fun m!916881 () Bool)

(assert (=> b!989319 m!916881))

(declare-fun m!916883 () Bool)

(assert (=> d!117529 m!916883))

(declare-fun m!916885 () Bool)

(assert (=> d!117529 m!916885))

(declare-fun m!916887 () Bool)

(assert (=> bm!41919 m!916887))

(assert (=> d!117293 d!117529))

(declare-fun d!117531 () Bool)

(declare-fun e!557938 () Bool)

(assert (=> d!117531 e!557938))

(declare-fun res!661438 () Bool)

(assert (=> d!117531 (=> res!661438 e!557938)))

(declare-fun lt!438838 () Bool)

(assert (=> d!117531 (= res!661438 (not lt!438838))))

(declare-fun lt!438841 () Bool)

(assert (=> d!117531 (= lt!438838 lt!438841)))

(declare-fun lt!438839 () Unit!32782)

(declare-fun e!557939 () Unit!32782)

(assert (=> d!117531 (= lt!438839 e!557939)))

(declare-fun c!100494 () Bool)

(assert (=> d!117531 (= c!100494 lt!438841)))

(assert (=> d!117531 (= lt!438841 (containsKey!479 (toList!6805 lt!438593) (_1!7451 lt!438398)))))

(assert (=> d!117531 (= (contains!5735 lt!438593 (_1!7451 lt!438398)) lt!438838)))

(declare-fun b!989321 () Bool)

(declare-fun lt!438840 () Unit!32782)

(assert (=> b!989321 (= e!557939 lt!438840)))

(assert (=> b!989321 (= lt!438840 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438593) (_1!7451 lt!438398)))))

(assert (=> b!989321 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438593) (_1!7451 lt!438398)))))

(declare-fun b!989322 () Bool)

(declare-fun Unit!32806 () Unit!32782)

(assert (=> b!989322 (= e!557939 Unit!32806)))

(declare-fun b!989323 () Bool)

(assert (=> b!989323 (= e!557938 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438593) (_1!7451 lt!438398))))))

(assert (= (and d!117531 c!100494) b!989321))

(assert (= (and d!117531 (not c!100494)) b!989322))

(assert (= (and d!117531 (not res!661438)) b!989323))

(declare-fun m!916889 () Bool)

(assert (=> d!117531 m!916889))

(declare-fun m!916891 () Bool)

(assert (=> b!989321 m!916891))

(assert (=> b!989321 m!916107))

(assert (=> b!989321 m!916107))

(declare-fun m!916893 () Bool)

(assert (=> b!989321 m!916893))

(assert (=> b!989323 m!916107))

(assert (=> b!989323 m!916107))

(assert (=> b!989323 m!916893))

(assert (=> d!117309 d!117531))

(declare-fun b!989327 () Bool)

(declare-fun e!557941 () Option!516)

(assert (=> b!989327 (= e!557941 None!514)))

(declare-fun b!989324 () Bool)

(declare-fun e!557940 () Option!516)

(assert (=> b!989324 (= e!557940 (Some!515 (_2!7451 (h!21950 lt!438592))))))

(declare-fun d!117533 () Bool)

(declare-fun c!100495 () Bool)

(assert (=> d!117533 (= c!100495 (and ((_ is Cons!20782) lt!438592) (= (_1!7451 (h!21950 lt!438592)) (_1!7451 lt!438398))))))

(assert (=> d!117533 (= (getValueByKey!510 lt!438592 (_1!7451 lt!438398)) e!557940)))

(declare-fun b!989326 () Bool)

(assert (=> b!989326 (= e!557941 (getValueByKey!510 (t!29711 lt!438592) (_1!7451 lt!438398)))))

(declare-fun b!989325 () Bool)

(assert (=> b!989325 (= e!557940 e!557941)))

(declare-fun c!100496 () Bool)

(assert (=> b!989325 (= c!100496 (and ((_ is Cons!20782) lt!438592) (not (= (_1!7451 (h!21950 lt!438592)) (_1!7451 lt!438398)))))))

(assert (= (and d!117533 c!100495) b!989324))

(assert (= (and d!117533 (not c!100495)) b!989325))

(assert (= (and b!989325 c!100496) b!989326))

(assert (= (and b!989325 (not c!100496)) b!989327))

(declare-fun m!916895 () Bool)

(assert (=> b!989326 m!916895))

(assert (=> d!117309 d!117533))

(declare-fun d!117535 () Bool)

(assert (=> d!117535 (= (getValueByKey!510 lt!438592 (_1!7451 lt!438398)) (Some!515 (_2!7451 lt!438398)))))

(declare-fun lt!438842 () Unit!32782)

(assert (=> d!117535 (= lt!438842 (choose!1612 lt!438592 (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(declare-fun e!557942 () Bool)

(assert (=> d!117535 e!557942))

(declare-fun res!661439 () Bool)

(assert (=> d!117535 (=> (not res!661439) (not e!557942))))

(assert (=> d!117535 (= res!661439 (isStrictlySorted!503 lt!438592))))

(assert (=> d!117535 (= (lemmaContainsTupThenGetReturnValue!272 lt!438592 (_1!7451 lt!438398) (_2!7451 lt!438398)) lt!438842)))

(declare-fun b!989328 () Bool)

(declare-fun res!661440 () Bool)

(assert (=> b!989328 (=> (not res!661440) (not e!557942))))

(assert (=> b!989328 (= res!661440 (containsKey!479 lt!438592 (_1!7451 lt!438398)))))

(declare-fun b!989329 () Bool)

(assert (=> b!989329 (= e!557942 (contains!5736 lt!438592 (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398))))))

(assert (= (and d!117535 res!661439) b!989328))

(assert (= (and b!989328 res!661440) b!989329))

(assert (=> d!117535 m!916101))

(declare-fun m!916897 () Bool)

(assert (=> d!117535 m!916897))

(declare-fun m!916899 () Bool)

(assert (=> d!117535 m!916899))

(declare-fun m!916901 () Bool)

(assert (=> b!989328 m!916901))

(declare-fun m!916903 () Bool)

(assert (=> b!989329 m!916903))

(assert (=> d!117309 d!117535))

(declare-fun b!989330 () Bool)

(declare-fun e!557945 () Bool)

(declare-fun lt!438843 () List!20786)

(assert (=> b!989330 (= e!557945 (contains!5736 lt!438843 (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398))))))

(declare-fun b!989331 () Bool)

(declare-fun e!557944 () List!20786)

(declare-fun call!41926 () List!20786)

(assert (=> b!989331 (= e!557944 call!41926)))

(declare-fun b!989332 () Bool)

(declare-fun res!661441 () Bool)

(assert (=> b!989332 (=> (not res!661441) (not e!557945))))

(assert (=> b!989332 (= res!661441 (containsKey!479 lt!438843 (_1!7451 lt!438398)))))

(declare-fun c!100497 () Bool)

(declare-fun c!100500 () Bool)

(declare-fun e!557946 () List!20786)

(declare-fun b!989333 () Bool)

(assert (=> b!989333 (= e!557946 (ite c!100500 (t!29711 (toList!6805 lt!438397)) (ite c!100497 (Cons!20782 (h!21950 (toList!6805 lt!438397)) (t!29711 (toList!6805 lt!438397))) Nil!20783)))))

(declare-fun b!989334 () Bool)

(declare-fun e!557943 () List!20786)

(declare-fun call!41925 () List!20786)

(assert (=> b!989334 (= e!557943 call!41925)))

(declare-fun bm!41921 () Bool)

(assert (=> bm!41921 (= call!41926 call!41925)))

(declare-fun b!989335 () Bool)

(declare-fun e!557947 () List!20786)

(declare-fun call!41924 () List!20786)

(assert (=> b!989335 (= e!557947 call!41924)))

(declare-fun b!989336 () Bool)

(assert (=> b!989336 (= e!557944 call!41926)))

(declare-fun b!989337 () Bool)

(assert (=> b!989337 (= c!100497 (and ((_ is Cons!20782) (toList!6805 lt!438397)) (bvsgt (_1!7451 (h!21950 (toList!6805 lt!438397))) (_1!7451 lt!438398))))))

(assert (=> b!989337 (= e!557943 e!557944)))

(declare-fun d!117537 () Bool)

(assert (=> d!117537 e!557945))

(declare-fun res!661442 () Bool)

(assert (=> d!117537 (=> (not res!661442) (not e!557945))))

(assert (=> d!117537 (= res!661442 (isStrictlySorted!503 lt!438843))))

(assert (=> d!117537 (= lt!438843 e!557947)))

(declare-fun c!100498 () Bool)

(assert (=> d!117537 (= c!100498 (and ((_ is Cons!20782) (toList!6805 lt!438397)) (bvslt (_1!7451 (h!21950 (toList!6805 lt!438397))) (_1!7451 lt!438398))))))

(assert (=> d!117537 (isStrictlySorted!503 (toList!6805 lt!438397))))

(assert (=> d!117537 (= (insertStrictlySorted!329 (toList!6805 lt!438397) (_1!7451 lt!438398) (_2!7451 lt!438398)) lt!438843)))

(declare-fun b!989338 () Bool)

(assert (=> b!989338 (= e!557946 (insertStrictlySorted!329 (t!29711 (toList!6805 lt!438397)) (_1!7451 lt!438398) (_2!7451 lt!438398)))))

(declare-fun b!989339 () Bool)

(assert (=> b!989339 (= e!557947 e!557943)))

(assert (=> b!989339 (= c!100500 (and ((_ is Cons!20782) (toList!6805 lt!438397)) (= (_1!7451 (h!21950 (toList!6805 lt!438397))) (_1!7451 lt!438398))))))

(declare-fun bm!41922 () Bool)

(assert (=> bm!41922 (= call!41924 ($colon$colon!553 e!557946 (ite c!100498 (h!21950 (toList!6805 lt!438397)) (tuple2!14881 (_1!7451 lt!438398) (_2!7451 lt!438398)))))))

(declare-fun c!100499 () Bool)

(assert (=> bm!41922 (= c!100499 c!100498)))

(declare-fun bm!41923 () Bool)

(assert (=> bm!41923 (= call!41925 call!41924)))

(assert (= (and d!117537 c!100498) b!989335))

(assert (= (and d!117537 (not c!100498)) b!989339))

(assert (= (and b!989339 c!100500) b!989334))

(assert (= (and b!989339 (not c!100500)) b!989337))

(assert (= (and b!989337 c!100497) b!989336))

(assert (= (and b!989337 (not c!100497)) b!989331))

(assert (= (or b!989336 b!989331) bm!41921))

(assert (= (or b!989334 bm!41921) bm!41923))

(assert (= (or b!989335 bm!41923) bm!41922))

(assert (= (and bm!41922 c!100499) b!989338))

(assert (= (and bm!41922 (not c!100499)) b!989333))

(assert (= (and d!117537 res!661442) b!989332))

(assert (= (and b!989332 res!661441) b!989330))

(declare-fun m!916905 () Bool)

(assert (=> b!989332 m!916905))

(declare-fun m!916907 () Bool)

(assert (=> b!989330 m!916907))

(declare-fun m!916909 () Bool)

(assert (=> b!989338 m!916909))

(declare-fun m!916911 () Bool)

(assert (=> d!117537 m!916911))

(assert (=> d!117537 m!916261))

(declare-fun m!916913 () Bool)

(assert (=> bm!41922 m!916913))

(assert (=> d!117309 d!117537))

(declare-fun d!117539 () Bool)

(declare-fun e!557948 () Bool)

(assert (=> d!117539 e!557948))

(declare-fun res!661443 () Bool)

(assert (=> d!117539 (=> res!661443 e!557948)))

(declare-fun lt!438844 () Bool)

(assert (=> d!117539 (= res!661443 (not lt!438844))))

(declare-fun lt!438847 () Bool)

(assert (=> d!117539 (= lt!438844 lt!438847)))

(declare-fun lt!438845 () Unit!32782)

(declare-fun e!557949 () Unit!32782)

(assert (=> d!117539 (= lt!438845 e!557949)))

(declare-fun c!100501 () Bool)

(assert (=> d!117539 (= c!100501 lt!438847)))

(assert (=> d!117539 (= lt!438847 (containsKey!479 (toList!6805 lt!438611) (select (arr!30074 _keys!1544) from!1932)))))

(assert (=> d!117539 (= (contains!5735 lt!438611 (select (arr!30074 _keys!1544) from!1932)) lt!438844)))

(declare-fun b!989340 () Bool)

(declare-fun lt!438846 () Unit!32782)

(assert (=> b!989340 (= e!557949 lt!438846)))

(assert (=> b!989340 (= lt!438846 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438611) (select (arr!30074 _keys!1544) from!1932)))))

(assert (=> b!989340 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438611) (select (arr!30074 _keys!1544) from!1932)))))

(declare-fun b!989341 () Bool)

(declare-fun Unit!32807 () Unit!32782)

(assert (=> b!989341 (= e!557949 Unit!32807)))

(declare-fun b!989342 () Bool)

(assert (=> b!989342 (= e!557948 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438611) (select (arr!30074 _keys!1544) from!1932))))))

(assert (= (and d!117539 c!100501) b!989340))

(assert (= (and d!117539 (not c!100501)) b!989341))

(assert (= (and d!117539 (not res!661443)) b!989342))

(assert (=> d!117539 m!915785))

(declare-fun m!916915 () Bool)

(assert (=> d!117539 m!916915))

(assert (=> b!989340 m!915785))

(declare-fun m!916917 () Bool)

(assert (=> b!989340 m!916917))

(assert (=> b!989340 m!915785))

(assert (=> b!989340 m!916355))

(assert (=> b!989340 m!916355))

(declare-fun m!916919 () Bool)

(assert (=> b!989340 m!916919))

(assert (=> b!989342 m!915785))

(assert (=> b!989342 m!916355))

(assert (=> b!989342 m!916355))

(assert (=> b!989342 m!916919))

(assert (=> b!988932 d!117539))

(declare-fun d!117541 () Bool)

(declare-fun isEmpty!727 (List!20786) Bool)

(assert (=> d!117541 (= (isEmpty!726 lt!438484) (isEmpty!727 (toList!6805 lt!438484)))))

(declare-fun bs!28068 () Bool)

(assert (= bs!28068 d!117541))

(declare-fun m!916921 () Bool)

(assert (=> bs!28068 m!916921))

(assert (=> b!988827 d!117541))

(assert (=> bm!41872 d!117291))

(declare-fun b!989346 () Bool)

(declare-fun e!557951 () Option!516)

(assert (=> b!989346 (= e!557951 None!514)))

(declare-fun b!989343 () Bool)

(declare-fun e!557950 () Option!516)

(assert (=> b!989343 (= e!557950 (Some!515 (_2!7451 (h!21950 (toList!6805 lt!438593)))))))

(declare-fun d!117543 () Bool)

(declare-fun c!100502 () Bool)

(assert (=> d!117543 (= c!100502 (and ((_ is Cons!20782) (toList!6805 lt!438593)) (= (_1!7451 (h!21950 (toList!6805 lt!438593))) (_1!7451 lt!438398))))))

(assert (=> d!117543 (= (getValueByKey!510 (toList!6805 lt!438593) (_1!7451 lt!438398)) e!557950)))

(declare-fun b!989345 () Bool)

(assert (=> b!989345 (= e!557951 (getValueByKey!510 (t!29711 (toList!6805 lt!438593)) (_1!7451 lt!438398)))))

(declare-fun b!989344 () Bool)

(assert (=> b!989344 (= e!557950 e!557951)))

(declare-fun c!100503 () Bool)

(assert (=> b!989344 (= c!100503 (and ((_ is Cons!20782) (toList!6805 lt!438593)) (not (= (_1!7451 (h!21950 (toList!6805 lt!438593))) (_1!7451 lt!438398)))))))

(assert (= (and d!117543 c!100502) b!989343))

(assert (= (and d!117543 (not c!100502)) b!989344))

(assert (= (and b!989344 c!100503) b!989345))

(assert (= (and b!989344 (not c!100503)) b!989346))

(declare-fun m!916923 () Bool)

(assert (=> b!989345 m!916923))

(assert (=> b!988912 d!117543))

(declare-fun d!117545 () Bool)

(assert (=> d!117545 (= (get!15631 (select (arr!30075 _values!1278) from!1932) (dynLambda!1887 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14222 (select (arr!30075 _values!1278) from!1932)))))

(assert (=> b!988795 d!117545))

(declare-fun b!989347 () Bool)

(declare-fun e!557954 () Bool)

(declare-fun e!557953 () Bool)

(assert (=> b!989347 (= e!557954 e!557953)))

(declare-fun c!100504 () Bool)

(assert (=> b!989347 (= c!100504 (validKeyInArray!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!117547 () Bool)

(declare-fun res!661444 () Bool)

(assert (=> d!117547 (=> res!661444 e!557954)))

(assert (=> d!117547 (= res!661444 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30554 _keys!1544)))))

(assert (=> d!117547 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948) e!557954)))

(declare-fun b!989348 () Bool)

(declare-fun e!557952 () Bool)

(declare-fun call!41927 () Bool)

(assert (=> b!989348 (= e!557952 call!41927)))

(declare-fun b!989349 () Bool)

(assert (=> b!989349 (= e!557953 call!41927)))

(declare-fun bm!41924 () Bool)

(assert (=> bm!41924 (= call!41927 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!989350 () Bool)

(assert (=> b!989350 (= e!557953 e!557952)))

(declare-fun lt!438849 () (_ BitVec 64))

(assert (=> b!989350 (= lt!438849 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!438848 () Unit!32782)

(assert (=> b!989350 (= lt!438848 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438849 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!989350 (arrayContainsKey!0 _keys!1544 lt!438849 #b00000000000000000000000000000000)))

(declare-fun lt!438850 () Unit!32782)

(assert (=> b!989350 (= lt!438850 lt!438848)))

(declare-fun res!661445 () Bool)

(assert (=> b!989350 (= res!661445 (= (seekEntryOrOpen!0 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1544 mask!1948) (Found!9163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!989350 (=> (not res!661445) (not e!557952))))

(assert (= (and d!117547 (not res!661444)) b!989347))

(assert (= (and b!989347 c!100504) b!989350))

(assert (= (and b!989347 (not c!100504)) b!989349))

(assert (= (and b!989350 res!661445) b!989348))

(assert (= (or b!989348 b!989349) bm!41924))

(assert (=> b!989347 m!916265))

(assert (=> b!989347 m!916265))

(assert (=> b!989347 m!916267))

(declare-fun m!916925 () Bool)

(assert (=> bm!41924 m!916925))

(assert (=> b!989350 m!916265))

(declare-fun m!916927 () Bool)

(assert (=> b!989350 m!916927))

(declare-fun m!916929 () Bool)

(assert (=> b!989350 m!916929))

(assert (=> b!989350 m!916265))

(declare-fun m!916931 () Bool)

(assert (=> b!989350 m!916931))

(assert (=> bm!41887 d!117547))

(assert (=> b!988832 d!117367))

(declare-fun d!117549 () Bool)

(declare-fun e!557955 () Bool)

(assert (=> d!117549 e!557955))

(declare-fun res!661447 () Bool)

(assert (=> d!117549 (=> (not res!661447) (not e!557955))))

(declare-fun lt!438854 () ListLongMap!13579)

(assert (=> d!117549 (= res!661447 (contains!5735 lt!438854 (_1!7451 (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun lt!438853 () List!20786)

(assert (=> d!117549 (= lt!438854 (ListLongMap!13580 lt!438853))))

(declare-fun lt!438851 () Unit!32782)

(declare-fun lt!438852 () Unit!32782)

(assert (=> d!117549 (= lt!438851 lt!438852)))

(assert (=> d!117549 (= (getValueByKey!510 lt!438853 (_1!7451 (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!515 (_2!7451 (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117549 (= lt!438852 (lemmaContainsTupThenGetReturnValue!272 lt!438853 (_1!7451 (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7451 (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117549 (= lt!438853 (insertStrictlySorted!329 (toList!6805 (ite c!100381 call!41887 (ite c!100379 call!41883 call!41881))) (_1!7451 (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_2!7451 (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(assert (=> d!117549 (= (+!3104 (ite c!100381 call!41887 (ite c!100379 call!41883 call!41881)) (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) lt!438854)))

(declare-fun b!989351 () Bool)

(declare-fun res!661446 () Bool)

(assert (=> b!989351 (=> (not res!661446) (not e!557955))))

(assert (=> b!989351 (= res!661446 (= (getValueByKey!510 (toList!6805 lt!438854) (_1!7451 (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))) (Some!515 (_2!7451 (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))))

(declare-fun b!989352 () Bool)

(assert (=> b!989352 (= e!557955 (contains!5736 (toList!6805 lt!438854) (ite (or c!100381 c!100379) (tuple2!14881 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (= (and d!117549 res!661447) b!989351))

(assert (= (and b!989351 res!661446) b!989352))

(declare-fun m!916933 () Bool)

(assert (=> d!117549 m!916933))

(declare-fun m!916935 () Bool)

(assert (=> d!117549 m!916935))

(declare-fun m!916937 () Bool)

(assert (=> d!117549 m!916937))

(declare-fun m!916939 () Bool)

(assert (=> d!117549 m!916939))

(declare-fun m!916941 () Bool)

(assert (=> b!989351 m!916941))

(declare-fun m!916943 () Bool)

(assert (=> b!989352 m!916943))

(assert (=> bm!41881 d!117549))

(declare-fun d!117551 () Bool)

(declare-fun e!557956 () Bool)

(assert (=> d!117551 e!557956))

(declare-fun res!661448 () Bool)

(assert (=> d!117551 (=> res!661448 e!557956)))

(declare-fun lt!438855 () Bool)

(assert (=> d!117551 (= res!661448 (not lt!438855))))

(declare-fun lt!438858 () Bool)

(assert (=> d!117551 (= lt!438855 lt!438858)))

(declare-fun lt!438856 () Unit!32782)

(declare-fun e!557957 () Unit!32782)

(assert (=> d!117551 (= lt!438856 e!557957)))

(declare-fun c!100505 () Bool)

(assert (=> d!117551 (= c!100505 lt!438858)))

(assert (=> d!117551 (= lt!438858 (containsKey!479 (toList!6805 lt!438585) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!117551 (= (contains!5735 lt!438585 #b0000000000000000000000000000000000000000000000000000000000000000) lt!438855)))

(declare-fun b!989353 () Bool)

(declare-fun lt!438857 () Unit!32782)

(assert (=> b!989353 (= e!557957 lt!438857)))

(assert (=> b!989353 (= lt!438857 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438585) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!989353 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438585) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!989354 () Bool)

(declare-fun Unit!32808 () Unit!32782)

(assert (=> b!989354 (= e!557957 Unit!32808)))

(declare-fun b!989355 () Bool)

(assert (=> b!989355 (= e!557956 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438585) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!117551 c!100505) b!989353))

(assert (= (and d!117551 (not c!100505)) b!989354))

(assert (= (and d!117551 (not res!661448)) b!989355))

(declare-fun m!916945 () Bool)

(assert (=> d!117551 m!916945))

(declare-fun m!916947 () Bool)

(assert (=> b!989353 m!916947))

(assert (=> b!989353 m!916233))

(assert (=> b!989353 m!916233))

(declare-fun m!916949 () Bool)

(assert (=> b!989353 m!916949))

(assert (=> b!989355 m!916233))

(assert (=> b!989355 m!916233))

(assert (=> b!989355 m!916949))

(assert (=> bm!41876 d!117551))

(assert (=> b!988963 d!117347))

(assert (=> d!117307 d!117281))

(declare-fun d!117553 () Bool)

(assert (=> d!117553 (= (apply!902 lt!438611 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15633 (getValueByKey!510 (toList!6805 lt!438611) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!28069 () Bool)

(assert (= bs!28069 d!117553))

(assert (=> bs!28069 m!916751))

(assert (=> bs!28069 m!916751))

(declare-fun m!916951 () Bool)

(assert (=> bs!28069 m!916951))

(assert (=> b!988926 d!117553))

(declare-fun d!117555 () Bool)

(declare-fun lt!438859 () Bool)

(assert (=> d!117555 (= lt!438859 (select (content!418 (toList!6805 lt!438510)) lt!438398))))

(declare-fun e!557958 () Bool)

(assert (=> d!117555 (= lt!438859 e!557958)))

(declare-fun res!661449 () Bool)

(assert (=> d!117555 (=> (not res!661449) (not e!557958))))

(assert (=> d!117555 (= res!661449 ((_ is Cons!20782) (toList!6805 lt!438510)))))

(assert (=> d!117555 (= (contains!5736 (toList!6805 lt!438510) lt!438398) lt!438859)))

(declare-fun b!989356 () Bool)

(declare-fun e!557959 () Bool)

(assert (=> b!989356 (= e!557958 e!557959)))

(declare-fun res!661450 () Bool)

(assert (=> b!989356 (=> res!661450 e!557959)))

(assert (=> b!989356 (= res!661450 (= (h!21950 (toList!6805 lt!438510)) lt!438398))))

(declare-fun b!989357 () Bool)

(assert (=> b!989357 (= e!557959 (contains!5736 (t!29711 (toList!6805 lt!438510)) lt!438398))))

(assert (= (and d!117555 res!661449) b!989356))

(assert (= (and b!989356 (not res!661450)) b!989357))

(declare-fun m!916953 () Bool)

(assert (=> d!117555 m!916953))

(declare-fun m!916955 () Bool)

(assert (=> d!117555 m!916955))

(declare-fun m!916957 () Bool)

(assert (=> b!989357 m!916957))

(assert (=> b!988842 d!117555))

(declare-fun d!117557 () Bool)

(declare-fun lt!438860 () Bool)

(assert (=> d!117557 (= lt!438860 (select (content!418 (toList!6805 lt!438506)) lt!438400))))

(declare-fun e!557960 () Bool)

(assert (=> d!117557 (= lt!438860 e!557960)))

(declare-fun res!661451 () Bool)

(assert (=> d!117557 (=> (not res!661451) (not e!557960))))

(assert (=> d!117557 (= res!661451 ((_ is Cons!20782) (toList!6805 lt!438506)))))

(assert (=> d!117557 (= (contains!5736 (toList!6805 lt!438506) lt!438400) lt!438860)))

(declare-fun b!989358 () Bool)

(declare-fun e!557961 () Bool)

(assert (=> b!989358 (= e!557960 e!557961)))

(declare-fun res!661452 () Bool)

(assert (=> b!989358 (=> res!661452 e!557961)))

(assert (=> b!989358 (= res!661452 (= (h!21950 (toList!6805 lt!438506)) lt!438400))))

(declare-fun b!989359 () Bool)

(assert (=> b!989359 (= e!557961 (contains!5736 (t!29711 (toList!6805 lt!438506)) lt!438400))))

(assert (= (and d!117557 res!661451) b!989358))

(assert (= (and b!989358 (not res!661452)) b!989359))

(declare-fun m!916959 () Bool)

(assert (=> d!117557 m!916959))

(declare-fun m!916961 () Bool)

(assert (=> d!117557 m!916961))

(declare-fun m!916963 () Bool)

(assert (=> b!989359 m!916963))

(assert (=> b!988840 d!117557))

(declare-fun d!117559 () Bool)

(assert (=> d!117559 (= (+!3104 (+!3104 lt!438402 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (+!3104 (+!3104 lt!438402 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (=> d!117559 true))

(declare-fun _$28!185 () Unit!32782)

(assert (=> d!117559 (= (choose!1611 lt!438402 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30074 _keys!1544) from!1932) lt!438405) _$28!185)))

(declare-fun bs!28070 () Bool)

(assert (= bs!28070 d!117559))

(assert (=> bs!28070 m!915931))

(assert (=> bs!28070 m!915931))

(assert (=> bs!28070 m!915937))

(assert (=> bs!28070 m!915933))

(assert (=> bs!28070 m!915933))

(assert (=> bs!28070 m!915935))

(assert (=> d!117287 d!117559))

(declare-fun d!117561 () Bool)

(declare-fun e!557962 () Bool)

(assert (=> d!117561 e!557962))

(declare-fun res!661454 () Bool)

(assert (=> d!117561 (=> (not res!661454) (not e!557962))))

(declare-fun lt!438864 () ListLongMap!13579)

(assert (=> d!117561 (= res!661454 (contains!5735 lt!438864 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438863 () List!20786)

(assert (=> d!117561 (= lt!438864 (ListLongMap!13580 lt!438863))))

(declare-fun lt!438861 () Unit!32782)

(declare-fun lt!438862 () Unit!32782)

(assert (=> d!117561 (= lt!438861 lt!438862)))

(assert (=> d!117561 (= (getValueByKey!510 lt!438863 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117561 (= lt!438862 (lemmaContainsTupThenGetReturnValue!272 lt!438863 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117561 (= lt!438863 (insertStrictlySorted!329 (toList!6805 (+!3104 lt!438402 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117561 (= (+!3104 (+!3104 lt!438402 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438864)))

(declare-fun b!989360 () Bool)

(declare-fun res!661453 () Bool)

(assert (=> b!989360 (=> (not res!661453) (not e!557962))))

(assert (=> b!989360 (= res!661453 (= (getValueByKey!510 (toList!6805 lt!438864) (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!989361 () Bool)

(assert (=> b!989361 (= e!557962 (contains!5736 (toList!6805 lt!438864) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117561 res!661454) b!989360))

(assert (= (and b!989360 res!661453) b!989361))

(declare-fun m!916965 () Bool)

(assert (=> d!117561 m!916965))

(declare-fun m!916967 () Bool)

(assert (=> d!117561 m!916967))

(declare-fun m!916969 () Bool)

(assert (=> d!117561 m!916969))

(declare-fun m!916971 () Bool)

(assert (=> d!117561 m!916971))

(declare-fun m!916973 () Bool)

(assert (=> b!989360 m!916973))

(declare-fun m!916975 () Bool)

(assert (=> b!989361 m!916975))

(assert (=> d!117287 d!117561))

(declare-fun d!117563 () Bool)

(declare-fun e!557963 () Bool)

(assert (=> d!117563 e!557963))

(declare-fun res!661456 () Bool)

(assert (=> d!117563 (=> (not res!661456) (not e!557963))))

(declare-fun lt!438868 () ListLongMap!13579)

(assert (=> d!117563 (= res!661456 (contains!5735 lt!438868 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(declare-fun lt!438867 () List!20786)

(assert (=> d!117563 (= lt!438868 (ListLongMap!13580 lt!438867))))

(declare-fun lt!438865 () Unit!32782)

(declare-fun lt!438866 () Unit!32782)

(assert (=> d!117563 (= lt!438865 lt!438866)))

(assert (=> d!117563 (= (getValueByKey!510 lt!438867 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117563 (= lt!438866 (lemmaContainsTupThenGetReturnValue!272 lt!438867 (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117563 (= lt!438867 (insertStrictlySorted!329 (toList!6805 lt!438402) (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))))

(assert (=> d!117563 (= (+!3104 lt!438402 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) lt!438868)))

(declare-fun b!989362 () Bool)

(declare-fun res!661455 () Bool)

(assert (=> b!989362 (=> (not res!661455) (not e!557963))))

(assert (=> b!989362 (= res!661455 (= (getValueByKey!510 (toList!6805 lt!438868) (_1!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (Some!515 (_2!7451 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))))

(declare-fun b!989363 () Bool)

(assert (=> b!989363 (= e!557963 (contains!5736 (toList!6805 lt!438868) (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(assert (= (and d!117563 res!661456) b!989362))

(assert (= (and b!989362 res!661455) b!989363))

(declare-fun m!916977 () Bool)

(assert (=> d!117563 m!916977))

(declare-fun m!916979 () Bool)

(assert (=> d!117563 m!916979))

(declare-fun m!916981 () Bool)

(assert (=> d!117563 m!916981))

(declare-fun m!916983 () Bool)

(assert (=> d!117563 m!916983))

(declare-fun m!916985 () Bool)

(assert (=> b!989362 m!916985))

(declare-fun m!916987 () Bool)

(assert (=> b!989363 m!916987))

(assert (=> d!117287 d!117563))

(declare-fun d!117565 () Bool)

(declare-fun e!557964 () Bool)

(assert (=> d!117565 e!557964))

(declare-fun res!661458 () Bool)

(assert (=> d!117565 (=> (not res!661458) (not e!557964))))

(declare-fun lt!438872 () ListLongMap!13579)

(assert (=> d!117565 (= res!661458 (contains!5735 lt!438872 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(declare-fun lt!438871 () List!20786)

(assert (=> d!117565 (= lt!438872 (ListLongMap!13580 lt!438871))))

(declare-fun lt!438869 () Unit!32782)

(declare-fun lt!438870 () Unit!32782)

(assert (=> d!117565 (= lt!438869 lt!438870)))

(assert (=> d!117565 (= (getValueByKey!510 lt!438871 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117565 (= lt!438870 (lemmaContainsTupThenGetReturnValue!272 lt!438871 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117565 (= lt!438871 (insertStrictlySorted!329 (toList!6805 (+!3104 lt!438402 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117565 (= (+!3104 (+!3104 lt!438402 (tuple2!14881 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) lt!438872)))

(declare-fun b!989364 () Bool)

(declare-fun res!661457 () Bool)

(assert (=> b!989364 (=> (not res!661457) (not e!557964))))

(assert (=> b!989364 (= res!661457 (= (getValueByKey!510 (toList!6805 lt!438872) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)))))))

(declare-fun b!989365 () Bool)

(assert (=> b!989365 (= e!557964 (contains!5736 (toList!6805 lt!438872) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)))))

(assert (= (and d!117565 res!661458) b!989364))

(assert (= (and b!989364 res!661457) b!989365))

(declare-fun m!916989 () Bool)

(assert (=> d!117565 m!916989))

(declare-fun m!916991 () Bool)

(assert (=> d!117565 m!916991))

(declare-fun m!916993 () Bool)

(assert (=> d!117565 m!916993))

(declare-fun m!916995 () Bool)

(assert (=> d!117565 m!916995))

(declare-fun m!916997 () Bool)

(assert (=> b!989364 m!916997))

(declare-fun m!916999 () Bool)

(assert (=> b!989365 m!916999))

(assert (=> d!117287 d!117565))

(declare-fun d!117567 () Bool)

(declare-fun e!557965 () Bool)

(assert (=> d!117567 e!557965))

(declare-fun res!661460 () Bool)

(assert (=> d!117567 (=> (not res!661460) (not e!557965))))

(declare-fun lt!438876 () ListLongMap!13579)

(assert (=> d!117567 (= res!661460 (contains!5735 lt!438876 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(declare-fun lt!438875 () List!20786)

(assert (=> d!117567 (= lt!438876 (ListLongMap!13580 lt!438875))))

(declare-fun lt!438873 () Unit!32782)

(declare-fun lt!438874 () Unit!32782)

(assert (=> d!117567 (= lt!438873 lt!438874)))

(assert (=> d!117567 (= (getValueByKey!510 lt!438875 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117567 (= lt!438874 (lemmaContainsTupThenGetReturnValue!272 lt!438875 (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117567 (= lt!438875 (insertStrictlySorted!329 (toList!6805 lt!438402) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))))))

(assert (=> d!117567 (= (+!3104 lt!438402 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)) lt!438876)))

(declare-fun b!989366 () Bool)

(declare-fun res!661459 () Bool)

(assert (=> b!989366 (=> (not res!661459) (not e!557965))))

(assert (=> b!989366 (= res!661459 (= (getValueByKey!510 (toList!6805 lt!438876) (_1!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405))) (Some!515 (_2!7451 (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)))))))

(declare-fun b!989367 () Bool)

(assert (=> b!989367 (= e!557965 (contains!5736 (toList!6805 lt!438876) (tuple2!14881 (select (arr!30074 _keys!1544) from!1932) lt!438405)))))

(assert (= (and d!117567 res!661460) b!989366))

(assert (= (and b!989366 res!661459) b!989367))

(declare-fun m!917001 () Bool)

(assert (=> d!117567 m!917001))

(declare-fun m!917003 () Bool)

(assert (=> d!117567 m!917003))

(declare-fun m!917005 () Bool)

(assert (=> d!117567 m!917005))

(declare-fun m!917007 () Bool)

(assert (=> d!117567 m!917007))

(declare-fun m!917009 () Bool)

(assert (=> b!989366 m!917009))

(declare-fun m!917011 () Bool)

(assert (=> b!989367 m!917011))

(assert (=> d!117287 d!117567))

(assert (=> b!988923 d!117315))

(declare-fun d!117569 () Bool)

(declare-fun e!557966 () Bool)

(assert (=> d!117569 e!557966))

(declare-fun res!661461 () Bool)

(assert (=> d!117569 (=> res!661461 e!557966)))

(declare-fun lt!438877 () Bool)

(assert (=> d!117569 (= res!661461 (not lt!438877))))

(declare-fun lt!438880 () Bool)

(assert (=> d!117569 (= lt!438877 lt!438880)))

(declare-fun lt!438878 () Unit!32782)

(declare-fun e!557967 () Unit!32782)

(assert (=> d!117569 (= lt!438878 e!557967)))

(declare-fun c!100506 () Bool)

(assert (=> d!117569 (= c!100506 lt!438880)))

(assert (=> d!117569 (= lt!438880 (containsKey!479 (toList!6805 lt!438585) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> d!117569 (= (contains!5735 lt!438585 (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) lt!438877)))

(declare-fun b!989368 () Bool)

(declare-fun lt!438879 () Unit!32782)

(assert (=> b!989368 (= e!557967 lt!438879)))

(assert (=> b!989368 (= lt!438879 (lemmaContainsKeyImpliesGetValueByKeyDefined!373 (toList!6805 lt!438585) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989368 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438585) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989369 () Bool)

(declare-fun Unit!32809 () Unit!32782)

(assert (=> b!989369 (= e!557967 Unit!32809)))

(declare-fun b!989370 () Bool)

(assert (=> b!989370 (= e!557966 (isDefined!381 (getValueByKey!510 (toList!6805 lt!438585) (select (arr!30074 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))))

(assert (= (and d!117569 c!100506) b!989368))

(assert (= (and d!117569 (not c!100506)) b!989369))

(assert (= (and d!117569 (not res!661461)) b!989370))

(assert (=> d!117569 m!915945))

(declare-fun m!917013 () Bool)

(assert (=> d!117569 m!917013))

(assert (=> b!989368 m!915945))

(declare-fun m!917015 () Bool)

(assert (=> b!989368 m!917015))

(assert (=> b!989368 m!915945))

(assert (=> b!989368 m!916645))

(assert (=> b!989368 m!916645))

(declare-fun m!917017 () Bool)

(assert (=> b!989368 m!917017))

(assert (=> b!989370 m!915945))

(assert (=> b!989370 m!916645))

(assert (=> b!989370 m!916645))

(assert (=> b!989370 m!917017))

(assert (=> b!988909 d!117569))

(declare-fun d!117571 () Bool)

(declare-fun lt!438881 () Bool)

(assert (=> d!117571 (= lt!438881 (select (content!418 (toList!6805 lt!438502)) lt!438398))))

(declare-fun e!557968 () Bool)

(assert (=> d!117571 (= lt!438881 e!557968)))

(declare-fun res!661462 () Bool)

(assert (=> d!117571 (=> (not res!661462) (not e!557968))))

(assert (=> d!117571 (= res!661462 ((_ is Cons!20782) (toList!6805 lt!438502)))))

(assert (=> d!117571 (= (contains!5736 (toList!6805 lt!438502) lt!438398) lt!438881)))

(declare-fun b!989371 () Bool)

(declare-fun e!557969 () Bool)

(assert (=> b!989371 (= e!557968 e!557969)))

(declare-fun res!661463 () Bool)

(assert (=> b!989371 (=> res!661463 e!557969)))

(assert (=> b!989371 (= res!661463 (= (h!21950 (toList!6805 lt!438502)) lt!438398))))

(declare-fun b!989372 () Bool)

(assert (=> b!989372 (= e!557969 (contains!5736 (t!29711 (toList!6805 lt!438502)) lt!438398))))

(assert (= (and d!117571 res!661462) b!989371))

(assert (= (and b!989371 (not res!661463)) b!989372))

(declare-fun m!917019 () Bool)

(assert (=> d!117571 m!917019))

(declare-fun m!917021 () Bool)

(assert (=> d!117571 m!917021))

(declare-fun m!917023 () Bool)

(assert (=> b!989372 m!917023))

(assert (=> b!988838 d!117571))

(declare-fun b!989373 () Bool)

(declare-fun e!557971 () Bool)

(assert (=> b!989373 (= e!557971 tp_is_empty!23221)))

(declare-fun mapNonEmpty!36876 () Bool)

(declare-fun mapRes!36876 () Bool)

(declare-fun tp!69813 () Bool)

(assert (=> mapNonEmpty!36876 (= mapRes!36876 (and tp!69813 e!557971))))

(declare-fun mapKey!36876 () (_ BitVec 32))

(declare-fun mapValue!36876 () ValueCell!11129)

(declare-fun mapRest!36876 () (Array (_ BitVec 32) ValueCell!11129))

(assert (=> mapNonEmpty!36876 (= mapRest!36875 (store mapRest!36876 mapKey!36876 mapValue!36876))))

(declare-fun mapIsEmpty!36876 () Bool)

(assert (=> mapIsEmpty!36876 mapRes!36876))

(declare-fun condMapEmpty!36876 () Bool)

(declare-fun mapDefault!36876 () ValueCell!11129)

(assert (=> mapNonEmpty!36875 (= condMapEmpty!36876 (= mapRest!36875 ((as const (Array (_ BitVec 32) ValueCell!11129)) mapDefault!36876)))))

(declare-fun e!557970 () Bool)

(assert (=> mapNonEmpty!36875 (= tp!69812 (and e!557970 mapRes!36876))))

(declare-fun b!989374 () Bool)

(assert (=> b!989374 (= e!557970 tp_is_empty!23221)))

(assert (= (and mapNonEmpty!36875 condMapEmpty!36876) mapIsEmpty!36876))

(assert (= (and mapNonEmpty!36875 (not condMapEmpty!36876)) mapNonEmpty!36876))

(assert (= (and mapNonEmpty!36876 ((_ is ValueCellFull!11129) mapValue!36876)) b!989373))

(assert (= (and mapNonEmpty!36875 ((_ is ValueCellFull!11129) mapDefault!36876)) b!989374))

(declare-fun m!917025 () Bool)

(assert (=> mapNonEmpty!36876 m!917025))

(declare-fun b_lambda!15083 () Bool)

(assert (= b_lambda!15077 (or (and start!84622 b_free!20005) b_lambda!15083)))

(declare-fun b_lambda!15085 () Bool)

(assert (= b_lambda!15075 (or (and start!84622 b_free!20005) b_lambda!15085)))

(declare-fun b_lambda!15087 () Bool)

(assert (= b_lambda!15079 (or (and start!84622 b_free!20005) b_lambda!15087)))

(declare-fun b_lambda!15089 () Bool)

(assert (= b_lambda!15081 (or (and start!84622 b_free!20005) b_lambda!15089)))

(check-sat (not b!989204) (not bm!41898) (not b_lambda!15087) (not b!989260) (not d!117343) (not b!989300) (not b!989187) (not b!989105) (not b!989062) (not b!989367) (not d!117481) (not d!117323) (not d!117507) (not b!989228) (not b!989056) (not b!989130) (not b!989307) (not d!117555) (not b!988995) (not d!117493) (not b!989239) (not b!989241) (not b!989137) (not b!989240) (not b!989219) (not b!989368) (not b!989044) (not b!989347) (not b!989226) (not d!117569) (not b!989132) (not b!989359) (not b!989313) (not b!989218) (not b!989292) (not b!989049) (not bm!41912) (not b!989258) (not b!989214) (not b!989154) (not b!989363) (not d!117389) (not d!117335) (not b!989235) (not b!989201) (not bm!41919) (not b!989015) (not b!989266) (not b_lambda!15085) (not d!117427) (not d!117341) (not b!989361) (not b!989249) (not d!117567) (not b!989283) (not b!989090) (not b!989014) (not d!117451) (not d!117395) (not d!117565) (not b!988977) (not b!989319) (not b!989065) (not b!989089) (not d!117357) (not d!117571) (not b!989304) (not d!117417) (not d!117537) (not b!988978) (not d!117331) (not b!989072) (not b!988985) (not b!989038) (not b!989232) (not b!989340) (not d!117535) (not b!989286) (not b!989055) (not d!117559) (not d!117441) (not b!989173) (not d!117355) (not b!989151) (not d!117351) (not b!989342) (not b!989351) b_and!32113 (not d!117465) (not b!989158) (not b_lambda!15089) (not b!989066) (not b!989061) (not bm!41906) (not d!117423) (not b!989203) (not d!117531) (not b!989353) (not b!988981) (not b!989362) (not d!117499) (not d!117551) (not d!117353) (not mapNonEmpty!36876) (not b_lambda!15067) (not b!989234) (not bm!41914) (not b!989350) (not d!117511) (not d!117425) (not d!117461) (not d!117421) (not b!989189) (not b!989256) (not d!117403) (not d!117443) (not b!989078) (not b!989008) (not b!989195) (not d!117541) (not b!989296) (not d!117529) (not d!117455) (not b_lambda!15073) (not d!117561) (not b!989138) (not b!989332) (not d!117349) (not bm!41922) (not d!117463) (not b!989323) (not d!117497) (not b!989251) (not b!989365) (not b!989083) (not b!989050) (not b!989199) (not b!989222) (not b!989326) (not d!117321) (not d!117513) (not b!989054) (not b!989355) (not b!989212) (not d!117401) (not b!989216) (not b!989242) (not b!989310) (not b!988979) (not b!989238) (not b_lambda!15083) (not bm!41916) (not d!117523) (not b!989185) (not d!117505) (not b!989141) (not b!989156) (not b!989157) (not b!988980) (not d!117375) (not d!117479) (not d!117413) (not b!989293) (not b!989281) (not b!989352) (not b!988997) (not b!989236) (not d!117327) (not b!988983) (not d!117495) (not d!117365) (not b!989075) (not b!989168) (not b!989081) (not b!989321) (not b_next!20005) (not b!989237) (not b!989098) (not b!989196) (not b!989088) (not b!989052) (not d!117329) (not b!989069) (not b!988994) (not d!117503) (not b!989290) (not d!117363) (not d!117435) (not b!989257) (not b!989291) (not d!117405) (not b!989149) (not b!989206) (not d!117557) (not d!117379) (not b!989278) (not b!989311) (not d!117433) (not d!117475) (not b!989302) (not d!117419) (not d!117411) (not bm!41924) (not d!117445) (not bm!41909) (not bm!41901) (not b!989329) (not b!989177) (not b!989244) (not d!117509) (not b!989328) (not b!989285) (not d!117467) (not b!989170) (not b!989070) (not d!117397) (not b!989124) (not b!989254) (not b!988992) tp_is_empty!23221 (not b!989276) (not d!117383) (not b!989053) (not b_lambda!15071) (not d!117563) (not b!989077) (not b!989288) (not b!989046) (not d!117409) (not d!117549) (not d!117527) (not d!117437) (not b!989372) (not d!117359) (not bm!41900) (not d!117553) (not b!989366) (not d!117447) (not b!989309) (not d!117471) (not b!989213) (not b!989160) (not b!989111) (not d!117431) (not b!989080) (not d!117477) (not b!989280) (not d!117361) (not b!989135) (not b!989364) (not b!989220) (not b!989370) (not d!117539) (not b!989139) (not d!117371) (not b_lambda!15069) (not d!117377) (not b!989067) (not b!989198) (not d!117333) (not d!117387) (not b!989295) (not b!989175) (not b!989086) (not b!989360) (not b!989179) (not b!989217) (not b!989269) (not d!117489) (not b!989229) (not d!117491) (not d!117519) (not b!989294) (not b!989223) (not b!989074) (not d!117457) (not b!989345) (not b_lambda!15057) (not b!989272) (not d!117337) (not bm!41903) (not b!989247) (not d!117515) (not b!989063) (not d!117429) (not b!989330) (not d!117393) (not d!117439) (not d!117487) (not d!117517) (not b!989166) (not d!117459) (not d!117381) (not b!989357) (not b!989036) (not d!117501) (not b!989192) (not b!989176) (not b!989338) (not b!989147) (not b!989092))
(check-sat b_and!32113 (not b_next!20005))
