; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111166 () Bool)

(assert start!111166)

(declare-fun b_free!30001 () Bool)

(declare-fun b_next!30001 () Bool)

(assert (=> start!111166 (= b_free!30001 (not b_next!30001))))

(declare-fun tp!105326 () Bool)

(declare-fun b_and!48191 () Bool)

(assert (=> start!111166 (= tp!105326 b_and!48191)))

(declare-fun b!1316194 () Bool)

(declare-fun res!873775 () Bool)

(declare-fun e!750835 () Bool)

(assert (=> b!1316194 (=> (not res!873775) (not e!750835))))

(declare-datatypes ((array!88329 0))(
  ( (array!88330 (arr!42645 (Array (_ BitVec 32) (_ BitVec 64))) (size!43197 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88329)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88329 (_ BitVec 32)) Bool)

(assert (=> b!1316194 (= res!873775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316195 () Bool)

(declare-fun res!873778 () Bool)

(assert (=> b!1316195 (=> (not res!873778) (not e!750835))))

(declare-datatypes ((List!30345 0))(
  ( (Nil!30342) (Cons!30341 (h!31550 (_ BitVec 64)) (t!43943 List!30345)) )
))
(declare-fun arrayNoDuplicates!0 (array!88329 (_ BitVec 32) List!30345) Bool)

(assert (=> b!1316195 (= res!873778 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30342))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun b!1316196 () Bool)

(declare-datatypes ((V!52745 0))(
  ( (V!52746 (val!17940 Int)) )
))
(declare-fun minValue!1296 () V!52745)

(declare-datatypes ((ValueCell!16967 0))(
  ( (ValueCellFull!16967 (v!20566 V!52745)) (EmptyCell!16967) )
))
(declare-datatypes ((array!88331 0))(
  ( (array!88332 (arr!42646 (Array (_ BitVec 32) ValueCell!16967)) (size!43198 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88331)

(declare-fun zeroValue!1296 () V!52745)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23230 0))(
  ( (tuple2!23231 (_1!11626 (_ BitVec 64)) (_2!11626 V!52745)) )
))
(declare-datatypes ((List!30346 0))(
  ( (Nil!30343) (Cons!30342 (h!31551 tuple2!23230) (t!43944 List!30346)) )
))
(declare-datatypes ((ListLongMap!20887 0))(
  ( (ListLongMap!20888 (toList!10459 List!30346)) )
))
(declare-fun contains!8536 (ListLongMap!20887 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5354 (array!88329 array!88331 (_ BitVec 32) (_ BitVec 32) V!52745 V!52745 (_ BitVec 32) Int) ListLongMap!20887)

(assert (=> b!1316196 (= e!750835 (not (contains!8536 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))))

(declare-fun b!1316197 () Bool)

(declare-fun e!750839 () Bool)

(declare-fun tp_is_empty!35731 () Bool)

(assert (=> b!1316197 (= e!750839 tp_is_empty!35731)))

(declare-fun mapIsEmpty!55225 () Bool)

(declare-fun mapRes!55225 () Bool)

(assert (=> mapIsEmpty!55225 mapRes!55225))

(declare-fun b!1316198 () Bool)

(declare-fun res!873779 () Bool)

(assert (=> b!1316198 (=> (not res!873779) (not e!750835))))

(assert (=> b!1316198 (= res!873779 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43197 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316199 () Bool)

(declare-fun res!873776 () Bool)

(assert (=> b!1316199 (=> (not res!873776) (not e!750835))))

(assert (=> b!1316199 (= res!873776 (contains!8536 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!873777 () Bool)

(assert (=> start!111166 (=> (not res!873777) (not e!750835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111166 (= res!873777 (validMask!0 mask!2040))))

(assert (=> start!111166 e!750835))

(assert (=> start!111166 tp!105326))

(declare-fun array_inv!32385 (array!88329) Bool)

(assert (=> start!111166 (array_inv!32385 _keys!1628)))

(assert (=> start!111166 true))

(assert (=> start!111166 tp_is_empty!35731))

(declare-fun e!750837 () Bool)

(declare-fun array_inv!32386 (array!88331) Bool)

(assert (=> start!111166 (and (array_inv!32386 _values!1354) e!750837)))

(declare-fun mapNonEmpty!55225 () Bool)

(declare-fun tp!105325 () Bool)

(assert (=> mapNonEmpty!55225 (= mapRes!55225 (and tp!105325 e!750839))))

(declare-fun mapValue!55225 () ValueCell!16967)

(declare-fun mapRest!55225 () (Array (_ BitVec 32) ValueCell!16967))

(declare-fun mapKey!55225 () (_ BitVec 32))

(assert (=> mapNonEmpty!55225 (= (arr!42646 _values!1354) (store mapRest!55225 mapKey!55225 mapValue!55225))))

(declare-fun b!1316200 () Bool)

(declare-fun res!873781 () Bool)

(assert (=> b!1316200 (=> (not res!873781) (not e!750835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1316200 (= res!873781 (not (validKeyInArray!0 (select (arr!42645 _keys!1628) from!2020))))))

(declare-fun b!1316201 () Bool)

(declare-fun res!873780 () Bool)

(assert (=> b!1316201 (=> (not res!873780) (not e!750835))))

(assert (=> b!1316201 (= res!873780 (and (= (size!43198 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43197 _keys!1628) (size!43198 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316202 () Bool)

(declare-fun e!750836 () Bool)

(assert (=> b!1316202 (= e!750836 tp_is_empty!35731)))

(declare-fun b!1316203 () Bool)

(assert (=> b!1316203 (= e!750837 (and e!750836 mapRes!55225))))

(declare-fun condMapEmpty!55225 () Bool)

(declare-fun mapDefault!55225 () ValueCell!16967)

(assert (=> b!1316203 (= condMapEmpty!55225 (= (arr!42646 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16967)) mapDefault!55225)))))

(declare-fun b!1316204 () Bool)

(declare-fun res!873774 () Bool)

(assert (=> b!1316204 (=> (not res!873774) (not e!750835))))

(assert (=> b!1316204 (= res!873774 (not (= (select (arr!42645 _keys!1628) from!2020) k0!1175)))))

(assert (= (and start!111166 res!873777) b!1316201))

(assert (= (and b!1316201 res!873780) b!1316194))

(assert (= (and b!1316194 res!873775) b!1316195))

(assert (= (and b!1316195 res!873778) b!1316198))

(assert (= (and b!1316198 res!873779) b!1316199))

(assert (= (and b!1316199 res!873776) b!1316204))

(assert (= (and b!1316204 res!873774) b!1316200))

(assert (= (and b!1316200 res!873781) b!1316196))

(assert (= (and b!1316203 condMapEmpty!55225) mapIsEmpty!55225))

(assert (= (and b!1316203 (not condMapEmpty!55225)) mapNonEmpty!55225))

(get-info :version)

(assert (= (and mapNonEmpty!55225 ((_ is ValueCellFull!16967) mapValue!55225)) b!1316197))

(assert (= (and b!1316203 ((_ is ValueCellFull!16967) mapDefault!55225)) b!1316202))

(assert (= start!111166 b!1316203))

(declare-fun m!1203669 () Bool)

(assert (=> b!1316194 m!1203669))

(declare-fun m!1203671 () Bool)

(assert (=> b!1316199 m!1203671))

(assert (=> b!1316199 m!1203671))

(declare-fun m!1203673 () Bool)

(assert (=> b!1316199 m!1203673))

(declare-fun m!1203675 () Bool)

(assert (=> b!1316200 m!1203675))

(assert (=> b!1316200 m!1203675))

(declare-fun m!1203677 () Bool)

(assert (=> b!1316200 m!1203677))

(declare-fun m!1203679 () Bool)

(assert (=> b!1316196 m!1203679))

(assert (=> b!1316196 m!1203679))

(declare-fun m!1203681 () Bool)

(assert (=> b!1316196 m!1203681))

(declare-fun m!1203683 () Bool)

(assert (=> b!1316195 m!1203683))

(declare-fun m!1203685 () Bool)

(assert (=> start!111166 m!1203685))

(declare-fun m!1203687 () Bool)

(assert (=> start!111166 m!1203687))

(declare-fun m!1203689 () Bool)

(assert (=> start!111166 m!1203689))

(assert (=> b!1316204 m!1203675))

(declare-fun m!1203691 () Bool)

(assert (=> mapNonEmpty!55225 m!1203691))

(check-sat (not mapNonEmpty!55225) (not start!111166) (not b!1316194) b_and!48191 tp_is_empty!35731 (not b_next!30001) (not b!1316195) (not b!1316196) (not b!1316199) (not b!1316200))
(check-sat b_and!48191 (not b_next!30001))
(get-model)

(declare-fun d!142399 () Bool)

(declare-fun e!750874 () Bool)

(assert (=> d!142399 e!750874))

(declare-fun res!873832 () Bool)

(assert (=> d!142399 (=> res!873832 e!750874)))

(declare-fun lt!585831 () Bool)

(assert (=> d!142399 (= res!873832 (not lt!585831))))

(declare-fun lt!585833 () Bool)

(assert (=> d!142399 (= lt!585831 lt!585833)))

(declare-datatypes ((Unit!43229 0))(
  ( (Unit!43230) )
))
(declare-fun lt!585832 () Unit!43229)

(declare-fun e!750875 () Unit!43229)

(assert (=> d!142399 (= lt!585832 e!750875)))

(declare-fun c!125532 () Bool)

(assert (=> d!142399 (= c!125532 lt!585833)))

(declare-fun containsKey!731 (List!30346 (_ BitVec 64)) Bool)

(assert (=> d!142399 (= lt!585833 (containsKey!731 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(assert (=> d!142399 (= (contains!8536 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175) lt!585831)))

(declare-fun b!1316277 () Bool)

(declare-fun lt!585834 () Unit!43229)

(assert (=> b!1316277 (= e!750875 lt!585834)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!478 (List!30346 (_ BitVec 64)) Unit!43229)

(assert (=> b!1316277 (= lt!585834 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-datatypes ((Option!765 0))(
  ( (Some!764 (v!20569 V!52745)) (None!763) )
))
(declare-fun isDefined!521 (Option!765) Bool)

(declare-fun getValueByKey!714 (List!30346 (_ BitVec 64)) Option!765)

(assert (=> b!1316277 (isDefined!521 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-fun b!1316278 () Bool)

(declare-fun Unit!43231 () Unit!43229)

(assert (=> b!1316278 (= e!750875 Unit!43231)))

(declare-fun b!1316279 () Bool)

(assert (=> b!1316279 (= e!750874 (isDefined!521 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175)))))

(assert (= (and d!142399 c!125532) b!1316277))

(assert (= (and d!142399 (not c!125532)) b!1316278))

(assert (= (and d!142399 (not res!873832)) b!1316279))

(declare-fun m!1203741 () Bool)

(assert (=> d!142399 m!1203741))

(declare-fun m!1203743 () Bool)

(assert (=> b!1316277 m!1203743))

(declare-fun m!1203745 () Bool)

(assert (=> b!1316277 m!1203745))

(assert (=> b!1316277 m!1203745))

(declare-fun m!1203747 () Bool)

(assert (=> b!1316277 m!1203747))

(assert (=> b!1316279 m!1203745))

(assert (=> b!1316279 m!1203745))

(assert (=> b!1316279 m!1203747))

(assert (=> b!1316199 d!142399))

(declare-fun bm!64625 () Bool)

(declare-fun call!64629 () ListLongMap!20887)

(declare-fun call!64628 () ListLongMap!20887)

(assert (=> bm!64625 (= call!64629 call!64628)))

(declare-fun b!1316322 () Bool)

(declare-fun e!750905 () Bool)

(declare-fun lt!585883 () ListLongMap!20887)

(declare-fun apply!1021 (ListLongMap!20887 (_ BitVec 64)) V!52745)

(assert (=> b!1316322 (= e!750905 (= (apply!1021 lt!585883 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1296))))

(declare-fun b!1316323 () Bool)

(declare-fun e!750904 () Bool)

(assert (=> b!1316323 (= e!750904 (validKeyInArray!0 (select (arr!42645 _keys!1628) from!2020)))))

(declare-fun bm!64626 () Bool)

(declare-fun c!125547 () Bool)

(declare-fun call!64630 () ListLongMap!20887)

(declare-fun c!125545 () Bool)

(declare-fun call!64633 () ListLongMap!20887)

(declare-fun +!4529 (ListLongMap!20887 tuple2!23230) ListLongMap!20887)

(assert (=> bm!64626 (= call!64630 (+!4529 (ite c!125547 call!64633 (ite c!125545 call!64628 call!64629)) (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun bm!64627 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6162 (array!88329 array!88331 (_ BitVec 32) (_ BitVec 32) V!52745 V!52745 (_ BitVec 32) Int) ListLongMap!20887)

(assert (=> bm!64627 (= call!64633 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun b!1316324 () Bool)

(declare-fun e!750902 () ListLongMap!20887)

(declare-fun call!64632 () ListLongMap!20887)

(assert (=> b!1316324 (= e!750902 call!64632)))

(declare-fun b!1316325 () Bool)

(declare-fun e!750912 () Bool)

(assert (=> b!1316325 (= e!750912 (validKeyInArray!0 (select (arr!42645 _keys!1628) from!2020)))))

(declare-fun b!1316326 () Bool)

(declare-fun e!750914 () ListLongMap!20887)

(assert (=> b!1316326 (= e!750914 call!64632)))

(declare-fun b!1316327 () Bool)

(declare-fun c!125549 () Bool)

(assert (=> b!1316327 (= c!125549 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1316327 (= e!750914 e!750902)))

(declare-fun d!142401 () Bool)

(declare-fun e!750907 () Bool)

(assert (=> d!142401 e!750907))

(declare-fun res!873857 () Bool)

(assert (=> d!142401 (=> (not res!873857) (not e!750907))))

(assert (=> d!142401 (= res!873857 (or (bvsge from!2020 (size!43197 _keys!1628)) (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43197 _keys!1628)))))))

(declare-fun lt!585890 () ListLongMap!20887)

(assert (=> d!142401 (= lt!585883 lt!585890)))

(declare-fun lt!585887 () Unit!43229)

(declare-fun e!750903 () Unit!43229)

(assert (=> d!142401 (= lt!585887 e!750903)))

(declare-fun c!125550 () Bool)

(assert (=> d!142401 (= c!125550 e!750912)))

(declare-fun res!873855 () Bool)

(assert (=> d!142401 (=> (not res!873855) (not e!750912))))

(assert (=> d!142401 (= res!873855 (bvslt from!2020 (size!43197 _keys!1628)))))

(declare-fun e!750910 () ListLongMap!20887)

(assert (=> d!142401 (= lt!585890 e!750910)))

(assert (=> d!142401 (= c!125547 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142401 (validMask!0 mask!2040)))

(assert (=> d!142401 (= (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) lt!585883)))

(declare-fun b!1316328 () Bool)

(declare-fun res!873858 () Bool)

(assert (=> b!1316328 (=> (not res!873858) (not e!750907))))

(declare-fun e!750909 () Bool)

(assert (=> b!1316328 (= res!873858 e!750909)))

(declare-fun c!125546 () Bool)

(assert (=> b!1316328 (= c!125546 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1316329 () Bool)

(declare-fun e!750906 () Bool)

(declare-fun e!750913 () Bool)

(assert (=> b!1316329 (= e!750906 e!750913)))

(declare-fun res!873851 () Bool)

(declare-fun call!64631 () Bool)

(assert (=> b!1316329 (= res!873851 call!64631)))

(assert (=> b!1316329 (=> (not res!873851) (not e!750913))))

(declare-fun b!1316330 () Bool)

(assert (=> b!1316330 (= e!750906 (not call!64631))))

(declare-fun b!1316331 () Bool)

(assert (=> b!1316331 (= e!750907 e!750906)))

(declare-fun c!125548 () Bool)

(assert (=> b!1316331 (= c!125548 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1316332 () Bool)

(declare-fun res!873856 () Bool)

(assert (=> b!1316332 (=> (not res!873856) (not e!750907))))

(declare-fun e!750911 () Bool)

(assert (=> b!1316332 (= res!873856 e!750911)))

(declare-fun res!873852 () Bool)

(assert (=> b!1316332 (=> res!873852 e!750911)))

(assert (=> b!1316332 (= res!873852 (not e!750904))))

(declare-fun res!873853 () Bool)

(assert (=> b!1316332 (=> (not res!873853) (not e!750904))))

(assert (=> b!1316332 (= res!873853 (bvslt from!2020 (size!43197 _keys!1628)))))

(declare-fun e!750908 () Bool)

(declare-fun b!1316333 () Bool)

(declare-fun get!21455 (ValueCell!16967 V!52745) V!52745)

(declare-fun dynLambda!3459 (Int (_ BitVec 64)) V!52745)

(assert (=> b!1316333 (= e!750908 (= (apply!1021 lt!585883 (select (arr!42645 _keys!1628) from!2020)) (get!21455 (select (arr!42646 _values!1354) from!2020) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316333 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43198 _values!1354)))))

(assert (=> b!1316333 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43197 _keys!1628)))))

(declare-fun bm!64628 () Bool)

(assert (=> bm!64628 (= call!64632 call!64630)))

(declare-fun bm!64629 () Bool)

(declare-fun call!64634 () Bool)

(assert (=> bm!64629 (= call!64634 (contains!8536 lt!585883 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64630 () Bool)

(assert (=> bm!64630 (= call!64628 call!64633)))

(declare-fun b!1316334 () Bool)

(assert (=> b!1316334 (= e!750913 (= (apply!1021 lt!585883 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1296))))

(declare-fun b!1316335 () Bool)

(assert (=> b!1316335 (= e!750909 e!750905)))

(declare-fun res!873854 () Bool)

(assert (=> b!1316335 (= res!873854 call!64634)))

(assert (=> b!1316335 (=> (not res!873854) (not e!750905))))

(declare-fun b!1316336 () Bool)

(assert (=> b!1316336 (= e!750910 (+!4529 call!64630 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(declare-fun b!1316337 () Bool)

(declare-fun lt!585896 () Unit!43229)

(assert (=> b!1316337 (= e!750903 lt!585896)))

(declare-fun lt!585889 () ListLongMap!20887)

(assert (=> b!1316337 (= lt!585889 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!585900 () (_ BitVec 64))

(assert (=> b!1316337 (= lt!585900 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585899 () (_ BitVec 64))

(assert (=> b!1316337 (= lt!585899 (select (arr!42645 _keys!1628) from!2020))))

(declare-fun lt!585885 () Unit!43229)

(declare-fun addStillContains!1116 (ListLongMap!20887 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43229)

(assert (=> b!1316337 (= lt!585885 (addStillContains!1116 lt!585889 lt!585900 zeroValue!1296 lt!585899))))

(assert (=> b!1316337 (contains!8536 (+!4529 lt!585889 (tuple2!23231 lt!585900 zeroValue!1296)) lt!585899)))

(declare-fun lt!585897 () Unit!43229)

(assert (=> b!1316337 (= lt!585897 lt!585885)))

(declare-fun lt!585884 () ListLongMap!20887)

(assert (=> b!1316337 (= lt!585884 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!585893 () (_ BitVec 64))

(assert (=> b!1316337 (= lt!585893 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585895 () (_ BitVec 64))

(assert (=> b!1316337 (= lt!585895 (select (arr!42645 _keys!1628) from!2020))))

(declare-fun lt!585891 () Unit!43229)

(declare-fun addApplyDifferent!559 (ListLongMap!20887 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43229)

(assert (=> b!1316337 (= lt!585891 (addApplyDifferent!559 lt!585884 lt!585893 minValue!1296 lt!585895))))

(assert (=> b!1316337 (= (apply!1021 (+!4529 lt!585884 (tuple2!23231 lt!585893 minValue!1296)) lt!585895) (apply!1021 lt!585884 lt!585895))))

(declare-fun lt!585888 () Unit!43229)

(assert (=> b!1316337 (= lt!585888 lt!585891)))

(declare-fun lt!585898 () ListLongMap!20887)

(assert (=> b!1316337 (= lt!585898 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!585892 () (_ BitVec 64))

(assert (=> b!1316337 (= lt!585892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585879 () (_ BitVec 64))

(assert (=> b!1316337 (= lt!585879 (select (arr!42645 _keys!1628) from!2020))))

(declare-fun lt!585886 () Unit!43229)

(assert (=> b!1316337 (= lt!585886 (addApplyDifferent!559 lt!585898 lt!585892 zeroValue!1296 lt!585879))))

(assert (=> b!1316337 (= (apply!1021 (+!4529 lt!585898 (tuple2!23231 lt!585892 zeroValue!1296)) lt!585879) (apply!1021 lt!585898 lt!585879))))

(declare-fun lt!585881 () Unit!43229)

(assert (=> b!1316337 (= lt!585881 lt!585886)))

(declare-fun lt!585882 () ListLongMap!20887)

(assert (=> b!1316337 (= lt!585882 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))

(declare-fun lt!585894 () (_ BitVec 64))

(assert (=> b!1316337 (= lt!585894 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585880 () (_ BitVec 64))

(assert (=> b!1316337 (= lt!585880 (select (arr!42645 _keys!1628) from!2020))))

(assert (=> b!1316337 (= lt!585896 (addApplyDifferent!559 lt!585882 lt!585894 minValue!1296 lt!585880))))

(assert (=> b!1316337 (= (apply!1021 (+!4529 lt!585882 (tuple2!23231 lt!585894 minValue!1296)) lt!585880) (apply!1021 lt!585882 lt!585880))))

(declare-fun b!1316338 () Bool)

(assert (=> b!1316338 (= e!750902 call!64629)))

(declare-fun bm!64631 () Bool)

(assert (=> bm!64631 (= call!64631 (contains!8536 lt!585883 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316339 () Bool)

(assert (=> b!1316339 (= e!750909 (not call!64634))))

(declare-fun b!1316340 () Bool)

(assert (=> b!1316340 (= e!750910 e!750914)))

(assert (=> b!1316340 (= c!125545 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1316341 () Bool)

(assert (=> b!1316341 (= e!750911 e!750908)))

(declare-fun res!873859 () Bool)

(assert (=> b!1316341 (=> (not res!873859) (not e!750908))))

(assert (=> b!1316341 (= res!873859 (contains!8536 lt!585883 (select (arr!42645 _keys!1628) from!2020)))))

(assert (=> b!1316341 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43197 _keys!1628)))))

(declare-fun b!1316342 () Bool)

(declare-fun Unit!43232 () Unit!43229)

(assert (=> b!1316342 (= e!750903 Unit!43232)))

(assert (= (and d!142401 c!125547) b!1316336))

(assert (= (and d!142401 (not c!125547)) b!1316340))

(assert (= (and b!1316340 c!125545) b!1316326))

(assert (= (and b!1316340 (not c!125545)) b!1316327))

(assert (= (and b!1316327 c!125549) b!1316324))

(assert (= (and b!1316327 (not c!125549)) b!1316338))

(assert (= (or b!1316324 b!1316338) bm!64625))

(assert (= (or b!1316326 bm!64625) bm!64630))

(assert (= (or b!1316326 b!1316324) bm!64628))

(assert (= (or b!1316336 bm!64630) bm!64627))

(assert (= (or b!1316336 bm!64628) bm!64626))

(assert (= (and d!142401 res!873855) b!1316325))

(assert (= (and d!142401 c!125550) b!1316337))

(assert (= (and d!142401 (not c!125550)) b!1316342))

(assert (= (and d!142401 res!873857) b!1316332))

(assert (= (and b!1316332 res!873853) b!1316323))

(assert (= (and b!1316332 (not res!873852)) b!1316341))

(assert (= (and b!1316341 res!873859) b!1316333))

(assert (= (and b!1316332 res!873856) b!1316328))

(assert (= (and b!1316328 c!125546) b!1316335))

(assert (= (and b!1316328 (not c!125546)) b!1316339))

(assert (= (and b!1316335 res!873854) b!1316322))

(assert (= (or b!1316335 b!1316339) bm!64629))

(assert (= (and b!1316328 res!873858) b!1316331))

(assert (= (and b!1316331 c!125548) b!1316329))

(assert (= (and b!1316331 (not c!125548)) b!1316330))

(assert (= (and b!1316329 res!873851) b!1316334))

(assert (= (or b!1316329 b!1316330) bm!64631))

(declare-fun b_lambda!23353 () Bool)

(assert (=> (not b_lambda!23353) (not b!1316333)))

(declare-fun t!43949 () Bool)

(declare-fun tb!11403 () Bool)

(assert (=> (and start!111166 (= defaultEntry!1357 defaultEntry!1357) t!43949) tb!11403))

(declare-fun result!23857 () Bool)

(assert (=> tb!11403 (= result!23857 tp_is_empty!35731)))

(assert (=> b!1316333 t!43949))

(declare-fun b_and!48197 () Bool)

(assert (= b_and!48191 (and (=> t!43949 result!23857) b_and!48197)))

(assert (=> d!142401 m!1203685))

(declare-fun m!1203749 () Bool)

(assert (=> b!1316334 m!1203749))

(declare-fun m!1203751 () Bool)

(assert (=> bm!64631 m!1203751))

(declare-fun m!1203753 () Bool)

(assert (=> bm!64626 m!1203753))

(assert (=> b!1316341 m!1203675))

(assert (=> b!1316341 m!1203675))

(declare-fun m!1203755 () Bool)

(assert (=> b!1316341 m!1203755))

(assert (=> b!1316333 m!1203675))

(declare-fun m!1203757 () Bool)

(assert (=> b!1316333 m!1203757))

(declare-fun m!1203759 () Bool)

(assert (=> b!1316333 m!1203759))

(declare-fun m!1203761 () Bool)

(assert (=> b!1316333 m!1203761))

(assert (=> b!1316333 m!1203761))

(assert (=> b!1316333 m!1203759))

(declare-fun m!1203763 () Bool)

(assert (=> b!1316333 m!1203763))

(assert (=> b!1316333 m!1203675))

(assert (=> b!1316323 m!1203675))

(assert (=> b!1316323 m!1203675))

(assert (=> b!1316323 m!1203677))

(declare-fun m!1203765 () Bool)

(assert (=> b!1316322 m!1203765))

(declare-fun m!1203767 () Bool)

(assert (=> bm!64627 m!1203767))

(assert (=> b!1316325 m!1203675))

(assert (=> b!1316325 m!1203675))

(assert (=> b!1316325 m!1203677))

(declare-fun m!1203769 () Bool)

(assert (=> b!1316336 m!1203769))

(declare-fun m!1203771 () Bool)

(assert (=> b!1316337 m!1203771))

(declare-fun m!1203773 () Bool)

(assert (=> b!1316337 m!1203773))

(assert (=> b!1316337 m!1203771))

(declare-fun m!1203775 () Bool)

(assert (=> b!1316337 m!1203775))

(declare-fun m!1203777 () Bool)

(assert (=> b!1316337 m!1203777))

(declare-fun m!1203779 () Bool)

(assert (=> b!1316337 m!1203779))

(declare-fun m!1203781 () Bool)

(assert (=> b!1316337 m!1203781))

(declare-fun m!1203783 () Bool)

(assert (=> b!1316337 m!1203783))

(declare-fun m!1203785 () Bool)

(assert (=> b!1316337 m!1203785))

(assert (=> b!1316337 m!1203777))

(declare-fun m!1203787 () Bool)

(assert (=> b!1316337 m!1203787))

(assert (=> b!1316337 m!1203675))

(assert (=> b!1316337 m!1203767))

(declare-fun m!1203789 () Bool)

(assert (=> b!1316337 m!1203789))

(assert (=> b!1316337 m!1203781))

(declare-fun m!1203791 () Bool)

(assert (=> b!1316337 m!1203791))

(declare-fun m!1203793 () Bool)

(assert (=> b!1316337 m!1203793))

(declare-fun m!1203795 () Bool)

(assert (=> b!1316337 m!1203795))

(assert (=> b!1316337 m!1203795))

(declare-fun m!1203797 () Bool)

(assert (=> b!1316337 m!1203797))

(declare-fun m!1203799 () Bool)

(assert (=> b!1316337 m!1203799))

(declare-fun m!1203801 () Bool)

(assert (=> bm!64629 m!1203801))

(assert (=> b!1316199 d!142401))

(declare-fun d!142403 () Bool)

(assert (=> d!142403 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!111166 d!142403))

(declare-fun d!142405 () Bool)

(assert (=> d!142405 (= (array_inv!32385 _keys!1628) (bvsge (size!43197 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!111166 d!142405))

(declare-fun d!142407 () Bool)

(assert (=> d!142407 (= (array_inv!32386 _values!1354) (bvsge (size!43198 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!111166 d!142407))

(declare-fun bm!64634 () Bool)

(declare-fun call!64637 () Bool)

(assert (=> bm!64634 (= call!64637 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun d!142409 () Bool)

(declare-fun res!873865 () Bool)

(declare-fun e!750922 () Bool)

(assert (=> d!142409 (=> res!873865 e!750922)))

(assert (=> d!142409 (= res!873865 (bvsge #b00000000000000000000000000000000 (size!43197 _keys!1628)))))

(assert (=> d!142409 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!750922)))

(declare-fun b!1316353 () Bool)

(declare-fun e!750923 () Bool)

(declare-fun e!750921 () Bool)

(assert (=> b!1316353 (= e!750923 e!750921)))

(declare-fun lt!585909 () (_ BitVec 64))

(assert (=> b!1316353 (= lt!585909 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000))))

(declare-fun lt!585908 () Unit!43229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88329 (_ BitVec 64) (_ BitVec 32)) Unit!43229)

(assert (=> b!1316353 (= lt!585908 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!585909 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1316353 (arrayContainsKey!0 _keys!1628 lt!585909 #b00000000000000000000000000000000)))

(declare-fun lt!585907 () Unit!43229)

(assert (=> b!1316353 (= lt!585907 lt!585908)))

(declare-fun res!873864 () Bool)

(declare-datatypes ((SeekEntryResult!10034 0))(
  ( (MissingZero!10034 (index!42507 (_ BitVec 32))) (Found!10034 (index!42508 (_ BitVec 32))) (Intermediate!10034 (undefined!10846 Bool) (index!42509 (_ BitVec 32)) (x!117021 (_ BitVec 32))) (Undefined!10034) (MissingVacant!10034 (index!42510 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88329 (_ BitVec 32)) SeekEntryResult!10034)

(assert (=> b!1316353 (= res!873864 (= (seekEntryOrOpen!0 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10034 #b00000000000000000000000000000000)))))

(assert (=> b!1316353 (=> (not res!873864) (not e!750921))))

(declare-fun b!1316354 () Bool)

(assert (=> b!1316354 (= e!750923 call!64637)))

(declare-fun b!1316355 () Bool)

(assert (=> b!1316355 (= e!750922 e!750923)))

(declare-fun c!125553 () Bool)

(assert (=> b!1316355 (= c!125553 (validKeyInArray!0 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1316356 () Bool)

(assert (=> b!1316356 (= e!750921 call!64637)))

(assert (= (and d!142409 (not res!873865)) b!1316355))

(assert (= (and b!1316355 c!125553) b!1316353))

(assert (= (and b!1316355 (not c!125553)) b!1316354))

(assert (= (and b!1316353 res!873864) b!1316356))

(assert (= (or b!1316356 b!1316354) bm!64634))

(declare-fun m!1203803 () Bool)

(assert (=> bm!64634 m!1203803))

(declare-fun m!1203805 () Bool)

(assert (=> b!1316353 m!1203805))

(declare-fun m!1203807 () Bool)

(assert (=> b!1316353 m!1203807))

(declare-fun m!1203809 () Bool)

(assert (=> b!1316353 m!1203809))

(assert (=> b!1316353 m!1203805))

(declare-fun m!1203811 () Bool)

(assert (=> b!1316353 m!1203811))

(assert (=> b!1316355 m!1203805))

(assert (=> b!1316355 m!1203805))

(declare-fun m!1203813 () Bool)

(assert (=> b!1316355 m!1203813))

(assert (=> b!1316194 d!142409))

(declare-fun d!142411 () Bool)

(declare-fun e!750924 () Bool)

(assert (=> d!142411 e!750924))

(declare-fun res!873866 () Bool)

(assert (=> d!142411 (=> res!873866 e!750924)))

(declare-fun lt!585910 () Bool)

(assert (=> d!142411 (= res!873866 (not lt!585910))))

(declare-fun lt!585912 () Bool)

(assert (=> d!142411 (= lt!585910 lt!585912)))

(declare-fun lt!585911 () Unit!43229)

(declare-fun e!750925 () Unit!43229)

(assert (=> d!142411 (= lt!585911 e!750925)))

(declare-fun c!125554 () Bool)

(assert (=> d!142411 (= c!125554 lt!585912)))

(assert (=> d!142411 (= lt!585912 (containsKey!731 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(assert (=> d!142411 (= (contains!8536 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175) lt!585910)))

(declare-fun b!1316357 () Bool)

(declare-fun lt!585913 () Unit!43229)

(assert (=> b!1316357 (= e!750925 lt!585913)))

(assert (=> b!1316357 (= lt!585913 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(assert (=> b!1316357 (isDefined!521 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-fun b!1316358 () Bool)

(declare-fun Unit!43233 () Unit!43229)

(assert (=> b!1316358 (= e!750925 Unit!43233)))

(declare-fun b!1316359 () Bool)

(assert (=> b!1316359 (= e!750924 (isDefined!521 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175)))))

(assert (= (and d!142411 c!125554) b!1316357))

(assert (= (and d!142411 (not c!125554)) b!1316358))

(assert (= (and d!142411 (not res!873866)) b!1316359))

(declare-fun m!1203815 () Bool)

(assert (=> d!142411 m!1203815))

(declare-fun m!1203817 () Bool)

(assert (=> b!1316357 m!1203817))

(declare-fun m!1203819 () Bool)

(assert (=> b!1316357 m!1203819))

(assert (=> b!1316357 m!1203819))

(declare-fun m!1203821 () Bool)

(assert (=> b!1316357 m!1203821))

(assert (=> b!1316359 m!1203819))

(assert (=> b!1316359 m!1203819))

(assert (=> b!1316359 m!1203821))

(assert (=> b!1316196 d!142411))

(declare-fun bm!64635 () Bool)

(declare-fun call!64639 () ListLongMap!20887)

(declare-fun call!64638 () ListLongMap!20887)

(assert (=> bm!64635 (= call!64639 call!64638)))

(declare-fun b!1316360 () Bool)

(declare-fun e!750929 () Bool)

(declare-fun lt!585918 () ListLongMap!20887)

(assert (=> b!1316360 (= e!750929 (= (apply!1021 lt!585918 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1296))))

(declare-fun b!1316361 () Bool)

(declare-fun e!750928 () Bool)

(assert (=> b!1316361 (= e!750928 (validKeyInArray!0 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun call!64643 () ListLongMap!20887)

(declare-fun c!125557 () Bool)

(declare-fun bm!64636 () Bool)

(declare-fun c!125555 () Bool)

(declare-fun call!64640 () ListLongMap!20887)

(assert (=> bm!64636 (= call!64640 (+!4529 (ite c!125557 call!64643 (ite c!125555 call!64638 call!64639)) (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun bm!64637 () Bool)

(assert (=> bm!64637 (= call!64643 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun b!1316362 () Bool)

(declare-fun e!750926 () ListLongMap!20887)

(declare-fun call!64642 () ListLongMap!20887)

(assert (=> b!1316362 (= e!750926 call!64642)))

(declare-fun b!1316363 () Bool)

(declare-fun e!750936 () Bool)

(assert (=> b!1316363 (= e!750936 (validKeyInArray!0 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1316364 () Bool)

(declare-fun e!750938 () ListLongMap!20887)

(assert (=> b!1316364 (= e!750938 call!64642)))

(declare-fun b!1316365 () Bool)

(declare-fun c!125559 () Bool)

(assert (=> b!1316365 (= c!125559 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1316365 (= e!750938 e!750926)))

(declare-fun d!142413 () Bool)

(declare-fun e!750931 () Bool)

(assert (=> d!142413 e!750931))

(declare-fun res!873873 () Bool)

(assert (=> d!142413 (=> (not res!873873) (not e!750931))))

(assert (=> d!142413 (= res!873873 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))))

(declare-fun lt!585925 () ListLongMap!20887)

(assert (=> d!142413 (= lt!585918 lt!585925)))

(declare-fun lt!585922 () Unit!43229)

(declare-fun e!750927 () Unit!43229)

(assert (=> d!142413 (= lt!585922 e!750927)))

(declare-fun c!125560 () Bool)

(assert (=> d!142413 (= c!125560 e!750936)))

(declare-fun res!873871 () Bool)

(assert (=> d!142413 (=> (not res!873871) (not e!750936))))

(assert (=> d!142413 (= res!873871 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))

(declare-fun e!750934 () ListLongMap!20887)

(assert (=> d!142413 (= lt!585925 e!750934)))

(assert (=> d!142413 (= c!125557 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142413 (validMask!0 mask!2040)))

(assert (=> d!142413 (= (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) lt!585918)))

(declare-fun b!1316366 () Bool)

(declare-fun res!873874 () Bool)

(assert (=> b!1316366 (=> (not res!873874) (not e!750931))))

(declare-fun e!750933 () Bool)

(assert (=> b!1316366 (= res!873874 e!750933)))

(declare-fun c!125556 () Bool)

(assert (=> b!1316366 (= c!125556 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1316367 () Bool)

(declare-fun e!750930 () Bool)

(declare-fun e!750937 () Bool)

(assert (=> b!1316367 (= e!750930 e!750937)))

(declare-fun res!873867 () Bool)

(declare-fun call!64641 () Bool)

(assert (=> b!1316367 (= res!873867 call!64641)))

(assert (=> b!1316367 (=> (not res!873867) (not e!750937))))

(declare-fun b!1316368 () Bool)

(assert (=> b!1316368 (= e!750930 (not call!64641))))

(declare-fun b!1316369 () Bool)

(assert (=> b!1316369 (= e!750931 e!750930)))

(declare-fun c!125558 () Bool)

(assert (=> b!1316369 (= c!125558 (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1316370 () Bool)

(declare-fun res!873872 () Bool)

(assert (=> b!1316370 (=> (not res!873872) (not e!750931))))

(declare-fun e!750935 () Bool)

(assert (=> b!1316370 (= res!873872 e!750935)))

(declare-fun res!873868 () Bool)

(assert (=> b!1316370 (=> res!873868 e!750935)))

(assert (=> b!1316370 (= res!873868 (not e!750928))))

(declare-fun res!873869 () Bool)

(assert (=> b!1316370 (=> (not res!873869) (not e!750928))))

(assert (=> b!1316370 (= res!873869 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))

(declare-fun b!1316371 () Bool)

(declare-fun e!750932 () Bool)

(assert (=> b!1316371 (= e!750932 (= (apply!1021 lt!585918 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (get!21455 (select (arr!42646 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316371 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43198 _values!1354)))))

(assert (=> b!1316371 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))

(declare-fun bm!64638 () Bool)

(assert (=> bm!64638 (= call!64642 call!64640)))

(declare-fun bm!64639 () Bool)

(declare-fun call!64644 () Bool)

(assert (=> bm!64639 (= call!64644 (contains!8536 lt!585918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64640 () Bool)

(assert (=> bm!64640 (= call!64638 call!64643)))

(declare-fun b!1316372 () Bool)

(assert (=> b!1316372 (= e!750937 (= (apply!1021 lt!585918 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1296))))

(declare-fun b!1316373 () Bool)

(assert (=> b!1316373 (= e!750933 e!750929)))

(declare-fun res!873870 () Bool)

(assert (=> b!1316373 (= res!873870 call!64644)))

(assert (=> b!1316373 (=> (not res!873870) (not e!750929))))

(declare-fun b!1316374 () Bool)

(assert (=> b!1316374 (= e!750934 (+!4529 call!64640 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(declare-fun b!1316375 () Bool)

(declare-fun lt!585931 () Unit!43229)

(assert (=> b!1316375 (= e!750927 lt!585931)))

(declare-fun lt!585924 () ListLongMap!20887)

(assert (=> b!1316375 (= lt!585924 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!585935 () (_ BitVec 64))

(assert (=> b!1316375 (= lt!585935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585934 () (_ BitVec 64))

(assert (=> b!1316375 (= lt!585934 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun lt!585920 () Unit!43229)

(assert (=> b!1316375 (= lt!585920 (addStillContains!1116 lt!585924 lt!585935 zeroValue!1296 lt!585934))))

(assert (=> b!1316375 (contains!8536 (+!4529 lt!585924 (tuple2!23231 lt!585935 zeroValue!1296)) lt!585934)))

(declare-fun lt!585932 () Unit!43229)

(assert (=> b!1316375 (= lt!585932 lt!585920)))

(declare-fun lt!585919 () ListLongMap!20887)

(assert (=> b!1316375 (= lt!585919 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!585928 () (_ BitVec 64))

(assert (=> b!1316375 (= lt!585928 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585930 () (_ BitVec 64))

(assert (=> b!1316375 (= lt!585930 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun lt!585926 () Unit!43229)

(assert (=> b!1316375 (= lt!585926 (addApplyDifferent!559 lt!585919 lt!585928 minValue!1296 lt!585930))))

(assert (=> b!1316375 (= (apply!1021 (+!4529 lt!585919 (tuple2!23231 lt!585928 minValue!1296)) lt!585930) (apply!1021 lt!585919 lt!585930))))

(declare-fun lt!585923 () Unit!43229)

(assert (=> b!1316375 (= lt!585923 lt!585926)))

(declare-fun lt!585933 () ListLongMap!20887)

(assert (=> b!1316375 (= lt!585933 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!585927 () (_ BitVec 64))

(assert (=> b!1316375 (= lt!585927 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585914 () (_ BitVec 64))

(assert (=> b!1316375 (= lt!585914 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(declare-fun lt!585921 () Unit!43229)

(assert (=> b!1316375 (= lt!585921 (addApplyDifferent!559 lt!585933 lt!585927 zeroValue!1296 lt!585914))))

(assert (=> b!1316375 (= (apply!1021 (+!4529 lt!585933 (tuple2!23231 lt!585927 zeroValue!1296)) lt!585914) (apply!1021 lt!585933 lt!585914))))

(declare-fun lt!585916 () Unit!43229)

(assert (=> b!1316375 (= lt!585916 lt!585921)))

(declare-fun lt!585917 () ListLongMap!20887)

(assert (=> b!1316375 (= lt!585917 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))

(declare-fun lt!585929 () (_ BitVec 64))

(assert (=> b!1316375 (= lt!585929 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!585915 () (_ BitVec 64))

(assert (=> b!1316375 (= lt!585915 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(assert (=> b!1316375 (= lt!585931 (addApplyDifferent!559 lt!585917 lt!585929 minValue!1296 lt!585915))))

(assert (=> b!1316375 (= (apply!1021 (+!4529 lt!585917 (tuple2!23231 lt!585929 minValue!1296)) lt!585915) (apply!1021 lt!585917 lt!585915))))

(declare-fun b!1316376 () Bool)

(assert (=> b!1316376 (= e!750926 call!64639)))

(declare-fun bm!64641 () Bool)

(assert (=> bm!64641 (= call!64641 (contains!8536 lt!585918 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316377 () Bool)

(assert (=> b!1316377 (= e!750933 (not call!64644))))

(declare-fun b!1316378 () Bool)

(assert (=> b!1316378 (= e!750934 e!750938)))

(assert (=> b!1316378 (= c!125555 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1316379 () Bool)

(assert (=> b!1316379 (= e!750935 e!750932)))

(declare-fun res!873875 () Bool)

(assert (=> b!1316379 (=> (not res!873875) (not e!750932))))

(assert (=> b!1316379 (= res!873875 (contains!8536 lt!585918 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1316379 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))

(declare-fun b!1316380 () Bool)

(declare-fun Unit!43234 () Unit!43229)

(assert (=> b!1316380 (= e!750927 Unit!43234)))

(assert (= (and d!142413 c!125557) b!1316374))

(assert (= (and d!142413 (not c!125557)) b!1316378))

(assert (= (and b!1316378 c!125555) b!1316364))

(assert (= (and b!1316378 (not c!125555)) b!1316365))

(assert (= (and b!1316365 c!125559) b!1316362))

(assert (= (and b!1316365 (not c!125559)) b!1316376))

(assert (= (or b!1316362 b!1316376) bm!64635))

(assert (= (or b!1316364 bm!64635) bm!64640))

(assert (= (or b!1316364 b!1316362) bm!64638))

(assert (= (or b!1316374 bm!64640) bm!64637))

(assert (= (or b!1316374 bm!64638) bm!64636))

(assert (= (and d!142413 res!873871) b!1316363))

(assert (= (and d!142413 c!125560) b!1316375))

(assert (= (and d!142413 (not c!125560)) b!1316380))

(assert (= (and d!142413 res!873873) b!1316370))

(assert (= (and b!1316370 res!873869) b!1316361))

(assert (= (and b!1316370 (not res!873868)) b!1316379))

(assert (= (and b!1316379 res!873875) b!1316371))

(assert (= (and b!1316370 res!873872) b!1316366))

(assert (= (and b!1316366 c!125556) b!1316373))

(assert (= (and b!1316366 (not c!125556)) b!1316377))

(assert (= (and b!1316373 res!873870) b!1316360))

(assert (= (or b!1316373 b!1316377) bm!64639))

(assert (= (and b!1316366 res!873874) b!1316369))

(assert (= (and b!1316369 c!125558) b!1316367))

(assert (= (and b!1316369 (not c!125558)) b!1316368))

(assert (= (and b!1316367 res!873867) b!1316372))

(assert (= (or b!1316367 b!1316368) bm!64641))

(declare-fun b_lambda!23355 () Bool)

(assert (=> (not b_lambda!23355) (not b!1316371)))

(assert (=> b!1316371 t!43949))

(declare-fun b_and!48199 () Bool)

(assert (= b_and!48197 (and (=> t!43949 result!23857) b_and!48199)))

(assert (=> d!142413 m!1203685))

(declare-fun m!1203823 () Bool)

(assert (=> b!1316372 m!1203823))

(declare-fun m!1203825 () Bool)

(assert (=> bm!64641 m!1203825))

(declare-fun m!1203827 () Bool)

(assert (=> bm!64636 m!1203827))

(declare-fun m!1203829 () Bool)

(assert (=> b!1316379 m!1203829))

(assert (=> b!1316379 m!1203829))

(declare-fun m!1203831 () Bool)

(assert (=> b!1316379 m!1203831))

(assert (=> b!1316371 m!1203829))

(declare-fun m!1203833 () Bool)

(assert (=> b!1316371 m!1203833))

(assert (=> b!1316371 m!1203759))

(declare-fun m!1203835 () Bool)

(assert (=> b!1316371 m!1203835))

(assert (=> b!1316371 m!1203835))

(assert (=> b!1316371 m!1203759))

(declare-fun m!1203837 () Bool)

(assert (=> b!1316371 m!1203837))

(assert (=> b!1316371 m!1203829))

(assert (=> b!1316361 m!1203829))

(assert (=> b!1316361 m!1203829))

(declare-fun m!1203839 () Bool)

(assert (=> b!1316361 m!1203839))

(declare-fun m!1203841 () Bool)

(assert (=> b!1316360 m!1203841))

(declare-fun m!1203843 () Bool)

(assert (=> bm!64637 m!1203843))

(assert (=> b!1316363 m!1203829))

(assert (=> b!1316363 m!1203829))

(assert (=> b!1316363 m!1203839))

(declare-fun m!1203845 () Bool)

(assert (=> b!1316374 m!1203845))

(declare-fun m!1203847 () Bool)

(assert (=> b!1316375 m!1203847))

(declare-fun m!1203849 () Bool)

(assert (=> b!1316375 m!1203849))

(assert (=> b!1316375 m!1203847))

(declare-fun m!1203851 () Bool)

(assert (=> b!1316375 m!1203851))

(declare-fun m!1203853 () Bool)

(assert (=> b!1316375 m!1203853))

(declare-fun m!1203855 () Bool)

(assert (=> b!1316375 m!1203855))

(declare-fun m!1203857 () Bool)

(assert (=> b!1316375 m!1203857))

(declare-fun m!1203859 () Bool)

(assert (=> b!1316375 m!1203859))

(declare-fun m!1203861 () Bool)

(assert (=> b!1316375 m!1203861))

(assert (=> b!1316375 m!1203853))

(declare-fun m!1203863 () Bool)

(assert (=> b!1316375 m!1203863))

(assert (=> b!1316375 m!1203829))

(assert (=> b!1316375 m!1203843))

(declare-fun m!1203865 () Bool)

(assert (=> b!1316375 m!1203865))

(assert (=> b!1316375 m!1203857))

(declare-fun m!1203867 () Bool)

(assert (=> b!1316375 m!1203867))

(declare-fun m!1203869 () Bool)

(assert (=> b!1316375 m!1203869))

(declare-fun m!1203871 () Bool)

(assert (=> b!1316375 m!1203871))

(assert (=> b!1316375 m!1203871))

(declare-fun m!1203873 () Bool)

(assert (=> b!1316375 m!1203873))

(declare-fun m!1203875 () Bool)

(assert (=> b!1316375 m!1203875))

(declare-fun m!1203877 () Bool)

(assert (=> bm!64639 m!1203877))

(assert (=> b!1316196 d!142413))

(declare-fun bm!64644 () Bool)

(declare-fun call!64647 () Bool)

(declare-fun c!125563 () Bool)

(assert (=> bm!64644 (= call!64647 (arrayNoDuplicates!0 _keys!1628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125563 (Cons!30341 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) Nil!30342) Nil!30342)))))

(declare-fun b!1316391 () Bool)

(declare-fun e!750950 () Bool)

(assert (=> b!1316391 (= e!750950 call!64647)))

(declare-fun b!1316392 () Bool)

(declare-fun e!750947 () Bool)

(declare-fun contains!8538 (List!30345 (_ BitVec 64)) Bool)

(assert (=> b!1316392 (= e!750947 (contains!8538 Nil!30342 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1316393 () Bool)

(declare-fun e!750949 () Bool)

(declare-fun e!750948 () Bool)

(assert (=> b!1316393 (= e!750949 e!750948)))

(declare-fun res!873882 () Bool)

(assert (=> b!1316393 (=> (not res!873882) (not e!750948))))

(assert (=> b!1316393 (= res!873882 (not e!750947))))

(declare-fun res!873883 () Bool)

(assert (=> b!1316393 (=> (not res!873883) (not e!750947))))

(assert (=> b!1316393 (= res!873883 (validKeyInArray!0 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun d!142415 () Bool)

(declare-fun res!873884 () Bool)

(assert (=> d!142415 (=> res!873884 e!750949)))

(assert (=> d!142415 (= res!873884 (bvsge #b00000000000000000000000000000000 (size!43197 _keys!1628)))))

(assert (=> d!142415 (= (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30342) e!750949)))

(declare-fun b!1316394 () Bool)

(assert (=> b!1316394 (= e!750948 e!750950)))

(assert (=> b!1316394 (= c!125563 (validKeyInArray!0 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1316395 () Bool)

(assert (=> b!1316395 (= e!750950 call!64647)))

(assert (= (and d!142415 (not res!873884)) b!1316393))

(assert (= (and b!1316393 res!873883) b!1316392))

(assert (= (and b!1316393 res!873882) b!1316394))

(assert (= (and b!1316394 c!125563) b!1316395))

(assert (= (and b!1316394 (not c!125563)) b!1316391))

(assert (= (or b!1316395 b!1316391) bm!64644))

(assert (=> bm!64644 m!1203805))

(declare-fun m!1203879 () Bool)

(assert (=> bm!64644 m!1203879))

(assert (=> b!1316392 m!1203805))

(assert (=> b!1316392 m!1203805))

(declare-fun m!1203881 () Bool)

(assert (=> b!1316392 m!1203881))

(assert (=> b!1316393 m!1203805))

(assert (=> b!1316393 m!1203805))

(assert (=> b!1316393 m!1203813))

(assert (=> b!1316394 m!1203805))

(assert (=> b!1316394 m!1203805))

(assert (=> b!1316394 m!1203813))

(assert (=> b!1316195 d!142415))

(declare-fun d!142417 () Bool)

(assert (=> d!142417 (= (validKeyInArray!0 (select (arr!42645 _keys!1628) from!2020)) (and (not (= (select (arr!42645 _keys!1628) from!2020) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!42645 _keys!1628) from!2020) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316200 d!142417))

(declare-fun b!1316402 () Bool)

(declare-fun e!750955 () Bool)

(assert (=> b!1316402 (= e!750955 tp_is_empty!35731)))

(declare-fun condMapEmpty!55234 () Bool)

(declare-fun mapDefault!55234 () ValueCell!16967)

(assert (=> mapNonEmpty!55225 (= condMapEmpty!55234 (= mapRest!55225 ((as const (Array (_ BitVec 32) ValueCell!16967)) mapDefault!55234)))))

(declare-fun e!750956 () Bool)

(declare-fun mapRes!55234 () Bool)

(assert (=> mapNonEmpty!55225 (= tp!105325 (and e!750956 mapRes!55234))))

(declare-fun b!1316403 () Bool)

(assert (=> b!1316403 (= e!750956 tp_is_empty!35731)))

(declare-fun mapIsEmpty!55234 () Bool)

(assert (=> mapIsEmpty!55234 mapRes!55234))

(declare-fun mapNonEmpty!55234 () Bool)

(declare-fun tp!105341 () Bool)

(assert (=> mapNonEmpty!55234 (= mapRes!55234 (and tp!105341 e!750955))))

(declare-fun mapValue!55234 () ValueCell!16967)

(declare-fun mapKey!55234 () (_ BitVec 32))

(declare-fun mapRest!55234 () (Array (_ BitVec 32) ValueCell!16967))

(assert (=> mapNonEmpty!55234 (= mapRest!55225 (store mapRest!55234 mapKey!55234 mapValue!55234))))

(assert (= (and mapNonEmpty!55225 condMapEmpty!55234) mapIsEmpty!55234))

(assert (= (and mapNonEmpty!55225 (not condMapEmpty!55234)) mapNonEmpty!55234))

(assert (= (and mapNonEmpty!55234 ((_ is ValueCellFull!16967) mapValue!55234)) b!1316402))

(assert (= (and mapNonEmpty!55225 ((_ is ValueCellFull!16967) mapDefault!55234)) b!1316403))

(declare-fun m!1203883 () Bool)

(assert (=> mapNonEmpty!55234 m!1203883))

(declare-fun b_lambda!23357 () Bool)

(assert (= b_lambda!23355 (or (and start!111166 b_free!30001) b_lambda!23357)))

(declare-fun b_lambda!23359 () Bool)

(assert (= b_lambda!23353 (or (and start!111166 b_free!30001) b_lambda!23359)))

(check-sat (not bm!64627) (not b!1316360) (not bm!64634) (not bm!64631) (not bm!64636) tp_is_empty!35731 (not b_next!30001) (not b!1316277) (not b_lambda!23357) (not d!142399) (not b!1316394) (not b!1316363) (not b!1316336) (not b!1316359) (not b!1316361) (not b!1316357) (not d!142411) (not b!1316374) (not bm!64629) (not bm!64637) (not b!1316325) (not b!1316337) (not b!1316393) (not b!1316372) (not b!1316371) (not bm!64639) b_and!48199 (not d!142413) (not b!1316279) (not b!1316334) (not mapNonEmpty!55234) (not b!1316375) (not bm!64641) (not b!1316341) (not bm!64626) (not d!142401) (not b!1316323) (not b!1316379) (not b_lambda!23359) (not b!1316353) (not b!1316333) (not b!1316355) (not b!1316392) (not b!1316322) (not bm!64644))
(check-sat b_and!48199 (not b_next!30001))
(get-model)

(declare-fun d!142419 () Bool)

(declare-fun e!750957 () Bool)

(assert (=> d!142419 e!750957))

(declare-fun res!873885 () Bool)

(assert (=> d!142419 (=> res!873885 e!750957)))

(declare-fun lt!585936 () Bool)

(assert (=> d!142419 (= res!873885 (not lt!585936))))

(declare-fun lt!585938 () Bool)

(assert (=> d!142419 (= lt!585936 lt!585938)))

(declare-fun lt!585937 () Unit!43229)

(declare-fun e!750958 () Unit!43229)

(assert (=> d!142419 (= lt!585937 e!750958)))

(declare-fun c!125564 () Bool)

(assert (=> d!142419 (= c!125564 lt!585938)))

(assert (=> d!142419 (= lt!585938 (containsKey!731 (toList!10459 lt!585918) (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> d!142419 (= (contains!8536 lt!585918 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) lt!585936)))

(declare-fun b!1316404 () Bool)

(declare-fun lt!585939 () Unit!43229)

(assert (=> b!1316404 (= e!750958 lt!585939)))

(assert (=> b!1316404 (= lt!585939 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 lt!585918) (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1316404 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585918) (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1316405 () Bool)

(declare-fun Unit!43235 () Unit!43229)

(assert (=> b!1316405 (= e!750958 Unit!43235)))

(declare-fun b!1316406 () Bool)

(assert (=> b!1316406 (= e!750957 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585918) (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))))

(assert (= (and d!142419 c!125564) b!1316404))

(assert (= (and d!142419 (not c!125564)) b!1316405))

(assert (= (and d!142419 (not res!873885)) b!1316406))

(assert (=> d!142419 m!1203829))

(declare-fun m!1203885 () Bool)

(assert (=> d!142419 m!1203885))

(assert (=> b!1316404 m!1203829))

(declare-fun m!1203887 () Bool)

(assert (=> b!1316404 m!1203887))

(assert (=> b!1316404 m!1203829))

(declare-fun m!1203889 () Bool)

(assert (=> b!1316404 m!1203889))

(assert (=> b!1316404 m!1203889))

(declare-fun m!1203891 () Bool)

(assert (=> b!1316404 m!1203891))

(assert (=> b!1316406 m!1203829))

(assert (=> b!1316406 m!1203889))

(assert (=> b!1316406 m!1203889))

(assert (=> b!1316406 m!1203891))

(assert (=> b!1316379 d!142419))

(declare-fun bm!64647 () Bool)

(declare-fun call!64650 () ListLongMap!20887)

(assert (=> bm!64647 (= call!64650 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020 #b00000000000000000000000000000001) defaultEntry!1357))))

(declare-fun d!142421 () Bool)

(declare-fun e!750976 () Bool)

(assert (=> d!142421 e!750976))

(declare-fun res!873897 () Bool)

(assert (=> d!142421 (=> (not res!873897) (not e!750976))))

(declare-fun lt!585956 () ListLongMap!20887)

(assert (=> d!142421 (= res!873897 (not (contains!8536 lt!585956 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!750977 () ListLongMap!20887)

(assert (=> d!142421 (= lt!585956 e!750977)))

(declare-fun c!125575 () Bool)

(assert (=> d!142421 (= c!125575 (bvsge (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))

(assert (=> d!142421 (validMask!0 mask!2040)))

(assert (=> d!142421 (= (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) lt!585956)))

(declare-fun b!1316431 () Bool)

(declare-fun e!750974 () Bool)

(declare-fun isEmpty!1079 (ListLongMap!20887) Bool)

(assert (=> b!1316431 (= e!750974 (isEmpty!1079 lt!585956))))

(declare-fun b!1316432 () Bool)

(assert (=> b!1316432 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))

(assert (=> b!1316432 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43198 _values!1354)))))

(declare-fun e!750978 () Bool)

(assert (=> b!1316432 (= e!750978 (= (apply!1021 lt!585956 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (get!21455 (select (arr!42646 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316433 () Bool)

(declare-fun e!750973 () Bool)

(assert (=> b!1316433 (= e!750973 e!750978)))

(assert (=> b!1316433 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))

(declare-fun res!873896 () Bool)

(assert (=> b!1316433 (= res!873896 (contains!8536 lt!585956 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1316433 (=> (not res!873896) (not e!750978))))

(declare-fun b!1316434 () Bool)

(assert (=> b!1316434 (= e!750977 (ListLongMap!20888 Nil!30343))))

(declare-fun b!1316435 () Bool)

(declare-fun e!750975 () Bool)

(assert (=> b!1316435 (= e!750975 (validKeyInArray!0 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(assert (=> b!1316435 (bvsge (bvadd #b00000000000000000000000000000001 from!2020) #b00000000000000000000000000000000)))

(declare-fun b!1316436 () Bool)

(assert (=> b!1316436 (= e!750976 e!750973)))

(declare-fun c!125573 () Bool)

(assert (=> b!1316436 (= c!125573 e!750975)))

(declare-fun res!873894 () Bool)

(assert (=> b!1316436 (=> (not res!873894) (not e!750975))))

(assert (=> b!1316436 (= res!873894 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))

(declare-fun b!1316437 () Bool)

(declare-fun res!873895 () Bool)

(assert (=> b!1316437 (=> (not res!873895) (not e!750976))))

(assert (=> b!1316437 (= res!873895 (not (contains!8536 lt!585956 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1316438 () Bool)

(assert (=> b!1316438 (= e!750974 (= lt!585956 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020 #b00000000000000000000000000000001) defaultEntry!1357)))))

(declare-fun b!1316439 () Bool)

(assert (=> b!1316439 (= e!750973 e!750974)))

(declare-fun c!125574 () Bool)

(assert (=> b!1316439 (= c!125574 (bvslt (bvadd #b00000000000000000000000000000001 from!2020) (size!43197 _keys!1628)))))

(declare-fun b!1316440 () Bool)

(declare-fun e!750979 () ListLongMap!20887)

(assert (=> b!1316440 (= e!750977 e!750979)))

(declare-fun c!125576 () Bool)

(assert (=> b!1316440 (= c!125576 (validKeyInArray!0 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun b!1316441 () Bool)

(declare-fun lt!585954 () Unit!43229)

(declare-fun lt!585958 () Unit!43229)

(assert (=> b!1316441 (= lt!585954 lt!585958)))

(declare-fun lt!585955 () V!52745)

(declare-fun lt!585957 () (_ BitVec 64))

(declare-fun lt!585960 () (_ BitVec 64))

(declare-fun lt!585959 () ListLongMap!20887)

(assert (=> b!1316441 (not (contains!8536 (+!4529 lt!585959 (tuple2!23231 lt!585957 lt!585955)) lt!585960))))

(declare-fun addStillNotContains!480 (ListLongMap!20887 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43229)

(assert (=> b!1316441 (= lt!585958 (addStillNotContains!480 lt!585959 lt!585957 lt!585955 lt!585960))))

(assert (=> b!1316441 (= lt!585960 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1316441 (= lt!585955 (get!21455 (select (arr!42646 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1316441 (= lt!585957 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))

(assert (=> b!1316441 (= lt!585959 call!64650)))

(assert (=> b!1316441 (= e!750979 (+!4529 call!64650 (tuple2!23231 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)) (get!21455 (select (arr!42646 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1316442 () Bool)

(assert (=> b!1316442 (= e!750979 call!64650)))

(assert (= (and d!142421 c!125575) b!1316434))

(assert (= (and d!142421 (not c!125575)) b!1316440))

(assert (= (and b!1316440 c!125576) b!1316441))

(assert (= (and b!1316440 (not c!125576)) b!1316442))

(assert (= (or b!1316441 b!1316442) bm!64647))

(assert (= (and d!142421 res!873897) b!1316437))

(assert (= (and b!1316437 res!873895) b!1316436))

(assert (= (and b!1316436 res!873894) b!1316435))

(assert (= (and b!1316436 c!125573) b!1316433))

(assert (= (and b!1316436 (not c!125573)) b!1316439))

(assert (= (and b!1316433 res!873896) b!1316432))

(assert (= (and b!1316439 c!125574) b!1316438))

(assert (= (and b!1316439 (not c!125574)) b!1316431))

(declare-fun b_lambda!23361 () Bool)

(assert (=> (not b_lambda!23361) (not b!1316432)))

(assert (=> b!1316432 t!43949))

(declare-fun b_and!48201 () Bool)

(assert (= b_and!48199 (and (=> t!43949 result!23857) b_and!48201)))

(declare-fun b_lambda!23363 () Bool)

(assert (=> (not b_lambda!23363) (not b!1316441)))

(assert (=> b!1316441 t!43949))

(declare-fun b_and!48203 () Bool)

(assert (= b_and!48201 (and (=> t!43949 result!23857) b_and!48203)))

(assert (=> b!1316433 m!1203829))

(assert (=> b!1316433 m!1203829))

(declare-fun m!1203893 () Bool)

(assert (=> b!1316433 m!1203893))

(assert (=> b!1316432 m!1203759))

(assert (=> b!1316432 m!1203829))

(declare-fun m!1203895 () Bool)

(assert (=> b!1316432 m!1203895))

(assert (=> b!1316432 m!1203835))

(assert (=> b!1316432 m!1203759))

(assert (=> b!1316432 m!1203837))

(assert (=> b!1316432 m!1203829))

(assert (=> b!1316432 m!1203835))

(declare-fun m!1203897 () Bool)

(assert (=> b!1316431 m!1203897))

(declare-fun m!1203899 () Bool)

(assert (=> d!142421 m!1203899))

(assert (=> d!142421 m!1203685))

(declare-fun m!1203901 () Bool)

(assert (=> b!1316437 m!1203901))

(declare-fun m!1203903 () Bool)

(assert (=> b!1316438 m!1203903))

(assert (=> bm!64647 m!1203903))

(declare-fun m!1203905 () Bool)

(assert (=> b!1316441 m!1203905))

(assert (=> b!1316441 m!1203759))

(declare-fun m!1203907 () Bool)

(assert (=> b!1316441 m!1203907))

(declare-fun m!1203909 () Bool)

(assert (=> b!1316441 m!1203909))

(assert (=> b!1316441 m!1203829))

(assert (=> b!1316441 m!1203835))

(assert (=> b!1316441 m!1203909))

(declare-fun m!1203911 () Bool)

(assert (=> b!1316441 m!1203911))

(assert (=> b!1316441 m!1203835))

(assert (=> b!1316441 m!1203759))

(assert (=> b!1316441 m!1203837))

(assert (=> b!1316440 m!1203829))

(assert (=> b!1316440 m!1203829))

(assert (=> b!1316440 m!1203839))

(assert (=> b!1316435 m!1203829))

(assert (=> b!1316435 m!1203829))

(assert (=> b!1316435 m!1203839))

(assert (=> bm!64637 d!142421))

(declare-fun d!142423 () Bool)

(declare-fun e!750980 () Bool)

(assert (=> d!142423 e!750980))

(declare-fun res!873898 () Bool)

(assert (=> d!142423 (=> res!873898 e!750980)))

(declare-fun lt!585961 () Bool)

(assert (=> d!142423 (= res!873898 (not lt!585961))))

(declare-fun lt!585963 () Bool)

(assert (=> d!142423 (= lt!585961 lt!585963)))

(declare-fun lt!585962 () Unit!43229)

(declare-fun e!750981 () Unit!43229)

(assert (=> d!142423 (= lt!585962 e!750981)))

(declare-fun c!125577 () Bool)

(assert (=> d!142423 (= c!125577 lt!585963)))

(assert (=> d!142423 (= lt!585963 (containsKey!731 (toList!10459 lt!585883) (select (arr!42645 _keys!1628) from!2020)))))

(assert (=> d!142423 (= (contains!8536 lt!585883 (select (arr!42645 _keys!1628) from!2020)) lt!585961)))

(declare-fun b!1316443 () Bool)

(declare-fun lt!585964 () Unit!43229)

(assert (=> b!1316443 (= e!750981 lt!585964)))

(assert (=> b!1316443 (= lt!585964 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 lt!585883) (select (arr!42645 _keys!1628) from!2020)))))

(assert (=> b!1316443 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585883) (select (arr!42645 _keys!1628) from!2020)))))

(declare-fun b!1316444 () Bool)

(declare-fun Unit!43236 () Unit!43229)

(assert (=> b!1316444 (= e!750981 Unit!43236)))

(declare-fun b!1316445 () Bool)

(assert (=> b!1316445 (= e!750980 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585883) (select (arr!42645 _keys!1628) from!2020))))))

(assert (= (and d!142423 c!125577) b!1316443))

(assert (= (and d!142423 (not c!125577)) b!1316444))

(assert (= (and d!142423 (not res!873898)) b!1316445))

(assert (=> d!142423 m!1203675))

(declare-fun m!1203913 () Bool)

(assert (=> d!142423 m!1203913))

(assert (=> b!1316443 m!1203675))

(declare-fun m!1203915 () Bool)

(assert (=> b!1316443 m!1203915))

(assert (=> b!1316443 m!1203675))

(declare-fun m!1203917 () Bool)

(assert (=> b!1316443 m!1203917))

(assert (=> b!1316443 m!1203917))

(declare-fun m!1203919 () Bool)

(assert (=> b!1316443 m!1203919))

(assert (=> b!1316445 m!1203675))

(assert (=> b!1316445 m!1203917))

(assert (=> b!1316445 m!1203917))

(assert (=> b!1316445 m!1203919))

(assert (=> b!1316341 d!142423))

(assert (=> d!142413 d!142403))

(declare-fun d!142425 () Bool)

(assert (=> d!142425 (= (validKeyInArray!0 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (and (not (= (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316363 d!142425))

(declare-fun call!64651 () Bool)

(declare-fun bm!64648 () Bool)

(declare-fun c!125578 () Bool)

(assert (=> bm!64648 (= call!64651 (arrayNoDuplicates!0 _keys!1628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125578 (Cons!30341 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125563 (Cons!30341 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) Nil!30342) Nil!30342)) (ite c!125563 (Cons!30341 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) Nil!30342) Nil!30342))))))

(declare-fun b!1316446 () Bool)

(declare-fun e!750985 () Bool)

(assert (=> b!1316446 (= e!750985 call!64651)))

(declare-fun b!1316447 () Bool)

(declare-fun e!750982 () Bool)

(assert (=> b!1316447 (= e!750982 (contains!8538 (ite c!125563 (Cons!30341 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) Nil!30342) Nil!30342) (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1316448 () Bool)

(declare-fun e!750984 () Bool)

(declare-fun e!750983 () Bool)

(assert (=> b!1316448 (= e!750984 e!750983)))

(declare-fun res!873899 () Bool)

(assert (=> b!1316448 (=> (not res!873899) (not e!750983))))

(assert (=> b!1316448 (= res!873899 (not e!750982))))

(declare-fun res!873900 () Bool)

(assert (=> b!1316448 (=> (not res!873900) (not e!750982))))

(assert (=> b!1316448 (= res!873900 (validKeyInArray!0 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!142427 () Bool)

(declare-fun res!873901 () Bool)

(assert (=> d!142427 (=> res!873901 e!750984)))

(assert (=> d!142427 (= res!873901 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43197 _keys!1628)))))

(assert (=> d!142427 (= (arrayNoDuplicates!0 _keys!1628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125563 (Cons!30341 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) Nil!30342) Nil!30342)) e!750984)))

(declare-fun b!1316449 () Bool)

(assert (=> b!1316449 (= e!750983 e!750985)))

(assert (=> b!1316449 (= c!125578 (validKeyInArray!0 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1316450 () Bool)

(assert (=> b!1316450 (= e!750985 call!64651)))

(assert (= (and d!142427 (not res!873901)) b!1316448))

(assert (= (and b!1316448 res!873900) b!1316447))

(assert (= (and b!1316448 res!873899) b!1316449))

(assert (= (and b!1316449 c!125578) b!1316450))

(assert (= (and b!1316449 (not c!125578)) b!1316446))

(assert (= (or b!1316450 b!1316446) bm!64648))

(declare-fun m!1203921 () Bool)

(assert (=> bm!64648 m!1203921))

(declare-fun m!1203923 () Bool)

(assert (=> bm!64648 m!1203923))

(assert (=> b!1316447 m!1203921))

(assert (=> b!1316447 m!1203921))

(declare-fun m!1203925 () Bool)

(assert (=> b!1316447 m!1203925))

(assert (=> b!1316448 m!1203921))

(assert (=> b!1316448 m!1203921))

(declare-fun m!1203927 () Bool)

(assert (=> b!1316448 m!1203927))

(assert (=> b!1316449 m!1203921))

(assert (=> b!1316449 m!1203921))

(assert (=> b!1316449 m!1203927))

(assert (=> bm!64644 d!142427))

(declare-fun d!142429 () Bool)

(assert (=> d!142429 (isDefined!521 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-fun lt!585967 () Unit!43229)

(declare-fun choose!1951 (List!30346 (_ BitVec 64)) Unit!43229)

(assert (=> d!142429 (= lt!585967 (choose!1951 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(declare-fun e!750988 () Bool)

(assert (=> d!142429 e!750988))

(declare-fun res!873904 () Bool)

(assert (=> d!142429 (=> (not res!873904) (not e!750988))))

(declare-fun isStrictlySorted!872 (List!30346) Bool)

(assert (=> d!142429 (= res!873904 (isStrictlySorted!872 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))))

(assert (=> d!142429 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175) lt!585967)))

(declare-fun b!1316453 () Bool)

(assert (=> b!1316453 (= e!750988 (containsKey!731 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))

(assert (= (and d!142429 res!873904) b!1316453))

(assert (=> d!142429 m!1203745))

(assert (=> d!142429 m!1203745))

(assert (=> d!142429 m!1203747))

(declare-fun m!1203929 () Bool)

(assert (=> d!142429 m!1203929))

(declare-fun m!1203931 () Bool)

(assert (=> d!142429 m!1203931))

(assert (=> b!1316453 m!1203741))

(assert (=> b!1316277 d!142429))

(declare-fun d!142431 () Bool)

(declare-fun isEmpty!1080 (Option!765) Bool)

(assert (=> d!142431 (= (isDefined!521 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175)) (not (isEmpty!1080 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175))))))

(declare-fun bs!37572 () Bool)

(assert (= bs!37572 d!142431))

(assert (=> bs!37572 m!1203745))

(declare-fun m!1203933 () Bool)

(assert (=> bs!37572 m!1203933))

(assert (=> b!1316277 d!142431))

(declare-fun e!750993 () Option!765)

(declare-fun b!1316462 () Bool)

(assert (=> b!1316462 (= e!750993 (Some!764 (_2!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))))))))

(declare-fun b!1316465 () Bool)

(declare-fun e!750994 () Option!765)

(assert (=> b!1316465 (= e!750994 None!763)))

(declare-fun b!1316463 () Bool)

(assert (=> b!1316463 (= e!750993 e!750994)))

(declare-fun c!125584 () Bool)

(assert (=> b!1316463 (= c!125584 (and ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (not (= (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175))))))

(declare-fun c!125583 () Bool)

(declare-fun d!142433 () Bool)

(assert (=> d!142433 (= c!125583 (and ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (= (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)))))

(assert (=> d!142433 (= (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175) e!750993)))

(declare-fun b!1316464 () Bool)

(assert (=> b!1316464 (= e!750994 (getValueByKey!714 (t!43944 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) k0!1175))))

(assert (= (and d!142433 c!125583) b!1316462))

(assert (= (and d!142433 (not c!125583)) b!1316463))

(assert (= (and b!1316463 c!125584) b!1316464))

(assert (= (and b!1316463 (not c!125584)) b!1316465))

(declare-fun m!1203935 () Bool)

(assert (=> b!1316464 m!1203935))

(assert (=> b!1316277 d!142433))

(assert (=> b!1316325 d!142417))

(declare-fun d!142435 () Bool)

(declare-fun e!750997 () Bool)

(assert (=> d!142435 e!750997))

(declare-fun res!873909 () Bool)

(assert (=> d!142435 (=> (not res!873909) (not e!750997))))

(declare-fun lt!585976 () ListLongMap!20887)

(assert (=> d!142435 (= res!873909 (contains!8536 lt!585976 (_1!11626 (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun lt!585979 () List!30346)

(assert (=> d!142435 (= lt!585976 (ListLongMap!20888 lt!585979))))

(declare-fun lt!585978 () Unit!43229)

(declare-fun lt!585977 () Unit!43229)

(assert (=> d!142435 (= lt!585978 lt!585977)))

(assert (=> d!142435 (= (getValueByKey!714 lt!585979 (_1!11626 (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!764 (_2!11626 (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!357 (List!30346 (_ BitVec 64) V!52745) Unit!43229)

(assert (=> d!142435 (= lt!585977 (lemmaContainsTupThenGetReturnValue!357 lt!585979 (_1!11626 (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11626 (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun insertStrictlySorted!486 (List!30346 (_ BitVec 64) V!52745) List!30346)

(assert (=> d!142435 (= lt!585979 (insertStrictlySorted!486 (toList!10459 (ite c!125547 call!64633 (ite c!125545 call!64628 call!64629))) (_1!11626 (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11626 (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!142435 (= (+!4529 (ite c!125547 call!64633 (ite c!125545 call!64628 call!64629)) (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) lt!585976)))

(declare-fun b!1316470 () Bool)

(declare-fun res!873910 () Bool)

(assert (=> b!1316470 (=> (not res!873910) (not e!750997))))

(assert (=> b!1316470 (= res!873910 (= (getValueByKey!714 (toList!10459 lt!585976) (_1!11626 (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!764 (_2!11626 (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))))

(declare-fun b!1316471 () Bool)

(declare-fun contains!8539 (List!30346 tuple2!23230) Bool)

(assert (=> b!1316471 (= e!750997 (contains!8539 (toList!10459 lt!585976) (ite (or c!125547 c!125545) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (= (and d!142435 res!873909) b!1316470))

(assert (= (and b!1316470 res!873910) b!1316471))

(declare-fun m!1203937 () Bool)

(assert (=> d!142435 m!1203937))

(declare-fun m!1203939 () Bool)

(assert (=> d!142435 m!1203939))

(declare-fun m!1203941 () Bool)

(assert (=> d!142435 m!1203941))

(declare-fun m!1203943 () Bool)

(assert (=> d!142435 m!1203943))

(declare-fun m!1203945 () Bool)

(assert (=> b!1316470 m!1203945))

(declare-fun m!1203947 () Bool)

(assert (=> b!1316471 m!1203947))

(assert (=> bm!64626 d!142435))

(assert (=> b!1316361 d!142425))

(declare-fun d!142437 () Bool)

(declare-fun e!750998 () Bool)

(assert (=> d!142437 e!750998))

(declare-fun res!873911 () Bool)

(assert (=> d!142437 (=> res!873911 e!750998)))

(declare-fun lt!585980 () Bool)

(assert (=> d!142437 (= res!873911 (not lt!585980))))

(declare-fun lt!585982 () Bool)

(assert (=> d!142437 (= lt!585980 lt!585982)))

(declare-fun lt!585981 () Unit!43229)

(declare-fun e!750999 () Unit!43229)

(assert (=> d!142437 (= lt!585981 e!750999)))

(declare-fun c!125585 () Bool)

(assert (=> d!142437 (= c!125585 lt!585982)))

(assert (=> d!142437 (= lt!585982 (containsKey!731 (toList!10459 lt!585918) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142437 (= (contains!8536 lt!585918 #b1000000000000000000000000000000000000000000000000000000000000000) lt!585980)))

(declare-fun b!1316472 () Bool)

(declare-fun lt!585983 () Unit!43229)

(assert (=> b!1316472 (= e!750999 lt!585983)))

(assert (=> b!1316472 (= lt!585983 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 lt!585918) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1316472 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585918) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316473 () Bool)

(declare-fun Unit!43237 () Unit!43229)

(assert (=> b!1316473 (= e!750999 Unit!43237)))

(declare-fun b!1316474 () Bool)

(assert (=> b!1316474 (= e!750998 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585918) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142437 c!125585) b!1316472))

(assert (= (and d!142437 (not c!125585)) b!1316473))

(assert (= (and d!142437 (not res!873911)) b!1316474))

(declare-fun m!1203949 () Bool)

(assert (=> d!142437 m!1203949))

(declare-fun m!1203951 () Bool)

(assert (=> b!1316472 m!1203951))

(declare-fun m!1203953 () Bool)

(assert (=> b!1316472 m!1203953))

(assert (=> b!1316472 m!1203953))

(declare-fun m!1203955 () Bool)

(assert (=> b!1316472 m!1203955))

(assert (=> b!1316474 m!1203953))

(assert (=> b!1316474 m!1203953))

(assert (=> b!1316474 m!1203955))

(assert (=> bm!64641 d!142437))

(assert (=> b!1316323 d!142417))

(declare-fun d!142439 () Bool)

(declare-fun get!21456 (Option!765) V!52745)

(assert (=> d!142439 (= (apply!1021 lt!585918 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21456 (getValueByKey!714 (toList!10459 lt!585918) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37573 () Bool)

(assert (= bs!37573 d!142439))

(declare-fun m!1203957 () Bool)

(assert (=> bs!37573 m!1203957))

(assert (=> bs!37573 m!1203957))

(declare-fun m!1203959 () Bool)

(assert (=> bs!37573 m!1203959))

(assert (=> b!1316360 d!142439))

(declare-fun bm!64649 () Bool)

(declare-fun call!64652 () ListLongMap!20887)

(assert (=> bm!64649 (= call!64652 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd from!2020 #b00000000000000000000000000000001) defaultEntry!1357))))

(declare-fun d!142441 () Bool)

(declare-fun e!751003 () Bool)

(assert (=> d!142441 e!751003))

(declare-fun res!873915 () Bool)

(assert (=> d!142441 (=> (not res!873915) (not e!751003))))

(declare-fun lt!585986 () ListLongMap!20887)

(assert (=> d!142441 (= res!873915 (not (contains!8536 lt!585986 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!751004 () ListLongMap!20887)

(assert (=> d!142441 (= lt!585986 e!751004)))

(declare-fun c!125588 () Bool)

(assert (=> d!142441 (= c!125588 (bvsge from!2020 (size!43197 _keys!1628)))))

(assert (=> d!142441 (validMask!0 mask!2040)))

(assert (=> d!142441 (= (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) lt!585986)))

(declare-fun b!1316475 () Bool)

(declare-fun e!751001 () Bool)

(assert (=> b!1316475 (= e!751001 (isEmpty!1079 lt!585986))))

(declare-fun b!1316476 () Bool)

(assert (=> b!1316476 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43197 _keys!1628)))))

(assert (=> b!1316476 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43198 _values!1354)))))

(declare-fun e!751005 () Bool)

(assert (=> b!1316476 (= e!751005 (= (apply!1021 lt!585986 (select (arr!42645 _keys!1628) from!2020)) (get!21455 (select (arr!42646 _values!1354) from!2020) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316477 () Bool)

(declare-fun e!751000 () Bool)

(assert (=> b!1316477 (= e!751000 e!751005)))

(assert (=> b!1316477 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43197 _keys!1628)))))

(declare-fun res!873914 () Bool)

(assert (=> b!1316477 (= res!873914 (contains!8536 lt!585986 (select (arr!42645 _keys!1628) from!2020)))))

(assert (=> b!1316477 (=> (not res!873914) (not e!751005))))

(declare-fun b!1316478 () Bool)

(assert (=> b!1316478 (= e!751004 (ListLongMap!20888 Nil!30343))))

(declare-fun b!1316479 () Bool)

(declare-fun e!751002 () Bool)

(assert (=> b!1316479 (= e!751002 (validKeyInArray!0 (select (arr!42645 _keys!1628) from!2020)))))

(assert (=> b!1316479 (bvsge from!2020 #b00000000000000000000000000000000)))

(declare-fun b!1316480 () Bool)

(assert (=> b!1316480 (= e!751003 e!751000)))

(declare-fun c!125586 () Bool)

(assert (=> b!1316480 (= c!125586 e!751002)))

(declare-fun res!873912 () Bool)

(assert (=> b!1316480 (=> (not res!873912) (not e!751002))))

(assert (=> b!1316480 (= res!873912 (bvslt from!2020 (size!43197 _keys!1628)))))

(declare-fun b!1316481 () Bool)

(declare-fun res!873913 () Bool)

(assert (=> b!1316481 (=> (not res!873913) (not e!751003))))

(assert (=> b!1316481 (= res!873913 (not (contains!8536 lt!585986 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1316482 () Bool)

(assert (=> b!1316482 (= e!751001 (= lt!585986 (getCurrentListMapNoExtraKeys!6162 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd from!2020 #b00000000000000000000000000000001) defaultEntry!1357)))))

(declare-fun b!1316483 () Bool)

(assert (=> b!1316483 (= e!751000 e!751001)))

(declare-fun c!125587 () Bool)

(assert (=> b!1316483 (= c!125587 (bvslt from!2020 (size!43197 _keys!1628)))))

(declare-fun b!1316484 () Bool)

(declare-fun e!751006 () ListLongMap!20887)

(assert (=> b!1316484 (= e!751004 e!751006)))

(declare-fun c!125589 () Bool)

(assert (=> b!1316484 (= c!125589 (validKeyInArray!0 (select (arr!42645 _keys!1628) from!2020)))))

(declare-fun b!1316485 () Bool)

(declare-fun lt!585984 () Unit!43229)

(declare-fun lt!585988 () Unit!43229)

(assert (=> b!1316485 (= lt!585984 lt!585988)))

(declare-fun lt!585987 () (_ BitVec 64))

(declare-fun lt!585985 () V!52745)

(declare-fun lt!585990 () (_ BitVec 64))

(declare-fun lt!585989 () ListLongMap!20887)

(assert (=> b!1316485 (not (contains!8536 (+!4529 lt!585989 (tuple2!23231 lt!585987 lt!585985)) lt!585990))))

(assert (=> b!1316485 (= lt!585988 (addStillNotContains!480 lt!585989 lt!585987 lt!585985 lt!585990))))

(assert (=> b!1316485 (= lt!585990 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1316485 (= lt!585985 (get!21455 (select (arr!42646 _values!1354) from!2020) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1316485 (= lt!585987 (select (arr!42645 _keys!1628) from!2020))))

(assert (=> b!1316485 (= lt!585989 call!64652)))

(assert (=> b!1316485 (= e!751006 (+!4529 call!64652 (tuple2!23231 (select (arr!42645 _keys!1628) from!2020) (get!21455 (select (arr!42646 _values!1354) from!2020) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1316486 () Bool)

(assert (=> b!1316486 (= e!751006 call!64652)))

(assert (= (and d!142441 c!125588) b!1316478))

(assert (= (and d!142441 (not c!125588)) b!1316484))

(assert (= (and b!1316484 c!125589) b!1316485))

(assert (= (and b!1316484 (not c!125589)) b!1316486))

(assert (= (or b!1316485 b!1316486) bm!64649))

(assert (= (and d!142441 res!873915) b!1316481))

(assert (= (and b!1316481 res!873913) b!1316480))

(assert (= (and b!1316480 res!873912) b!1316479))

(assert (= (and b!1316480 c!125586) b!1316477))

(assert (= (and b!1316480 (not c!125586)) b!1316483))

(assert (= (and b!1316477 res!873914) b!1316476))

(assert (= (and b!1316483 c!125587) b!1316482))

(assert (= (and b!1316483 (not c!125587)) b!1316475))

(declare-fun b_lambda!23365 () Bool)

(assert (=> (not b_lambda!23365) (not b!1316476)))

(assert (=> b!1316476 t!43949))

(declare-fun b_and!48205 () Bool)

(assert (= b_and!48203 (and (=> t!43949 result!23857) b_and!48205)))

(declare-fun b_lambda!23367 () Bool)

(assert (=> (not b_lambda!23367) (not b!1316485)))

(assert (=> b!1316485 t!43949))

(declare-fun b_and!48207 () Bool)

(assert (= b_and!48205 (and (=> t!43949 result!23857) b_and!48207)))

(assert (=> b!1316477 m!1203675))

(assert (=> b!1316477 m!1203675))

(declare-fun m!1203961 () Bool)

(assert (=> b!1316477 m!1203961))

(assert (=> b!1316476 m!1203759))

(assert (=> b!1316476 m!1203675))

(declare-fun m!1203963 () Bool)

(assert (=> b!1316476 m!1203963))

(assert (=> b!1316476 m!1203761))

(assert (=> b!1316476 m!1203759))

(assert (=> b!1316476 m!1203763))

(assert (=> b!1316476 m!1203675))

(assert (=> b!1316476 m!1203761))

(declare-fun m!1203965 () Bool)

(assert (=> b!1316475 m!1203965))

(declare-fun m!1203967 () Bool)

(assert (=> d!142441 m!1203967))

(assert (=> d!142441 m!1203685))

(declare-fun m!1203969 () Bool)

(assert (=> b!1316481 m!1203969))

(declare-fun m!1203971 () Bool)

(assert (=> b!1316482 m!1203971))

(assert (=> bm!64649 m!1203971))

(declare-fun m!1203973 () Bool)

(assert (=> b!1316485 m!1203973))

(assert (=> b!1316485 m!1203759))

(declare-fun m!1203975 () Bool)

(assert (=> b!1316485 m!1203975))

(declare-fun m!1203977 () Bool)

(assert (=> b!1316485 m!1203977))

(assert (=> b!1316485 m!1203675))

(assert (=> b!1316485 m!1203761))

(assert (=> b!1316485 m!1203977))

(declare-fun m!1203979 () Bool)

(assert (=> b!1316485 m!1203979))

(assert (=> b!1316485 m!1203761))

(assert (=> b!1316485 m!1203759))

(assert (=> b!1316485 m!1203763))

(assert (=> b!1316484 m!1203675))

(assert (=> b!1316484 m!1203675))

(assert (=> b!1316484 m!1203677))

(assert (=> b!1316479 m!1203675))

(assert (=> b!1316479 m!1203675))

(assert (=> b!1316479 m!1203677))

(assert (=> bm!64627 d!142441))

(declare-fun d!142443 () Bool)

(declare-fun e!751007 () Bool)

(assert (=> d!142443 e!751007))

(declare-fun res!873916 () Bool)

(assert (=> d!142443 (=> (not res!873916) (not e!751007))))

(declare-fun lt!585991 () ListLongMap!20887)

(assert (=> d!142443 (= res!873916 (contains!8536 lt!585991 (_1!11626 (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun lt!585994 () List!30346)

(assert (=> d!142443 (= lt!585991 (ListLongMap!20888 lt!585994))))

(declare-fun lt!585993 () Unit!43229)

(declare-fun lt!585992 () Unit!43229)

(assert (=> d!142443 (= lt!585993 lt!585992)))

(assert (=> d!142443 (= (getValueByKey!714 lt!585994 (_1!11626 (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!764 (_2!11626 (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!142443 (= lt!585992 (lemmaContainsTupThenGetReturnValue!357 lt!585994 (_1!11626 (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11626 (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!142443 (= lt!585994 (insertStrictlySorted!486 (toList!10459 (ite c!125557 call!64643 (ite c!125555 call!64638 call!64639))) (_1!11626 (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (_2!11626 (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(assert (=> d!142443 (= (+!4529 (ite c!125557 call!64643 (ite c!125555 call!64638 call!64639)) (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) lt!585991)))

(declare-fun b!1316487 () Bool)

(declare-fun res!873917 () Bool)

(assert (=> b!1316487 (=> (not res!873917) (not e!751007))))

(assert (=> b!1316487 (= res!873917 (= (getValueByKey!714 (toList!10459 lt!585991) (_1!11626 (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))) (Some!764 (_2!11626 (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))))

(declare-fun b!1316488 () Bool)

(assert (=> b!1316488 (= e!751007 (contains!8539 (toList!10459 lt!585991) (ite (or c!125557 c!125555) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1296) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (= (and d!142443 res!873916) b!1316487))

(assert (= (and b!1316487 res!873917) b!1316488))

(declare-fun m!1203981 () Bool)

(assert (=> d!142443 m!1203981))

(declare-fun m!1203983 () Bool)

(assert (=> d!142443 m!1203983))

(declare-fun m!1203985 () Bool)

(assert (=> d!142443 m!1203985))

(declare-fun m!1203987 () Bool)

(assert (=> d!142443 m!1203987))

(declare-fun m!1203989 () Bool)

(assert (=> b!1316487 m!1203989))

(declare-fun m!1203991 () Bool)

(assert (=> b!1316488 m!1203991))

(assert (=> bm!64636 d!142443))

(declare-fun bm!64650 () Bool)

(declare-fun call!64653 () Bool)

(assert (=> bm!64650 (= call!64653 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun d!142445 () Bool)

(declare-fun res!873919 () Bool)

(declare-fun e!751009 () Bool)

(assert (=> d!142445 (=> res!873919 e!751009)))

(assert (=> d!142445 (= res!873919 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43197 _keys!1628)))))

(assert (=> d!142445 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040) e!751009)))

(declare-fun b!1316489 () Bool)

(declare-fun e!751010 () Bool)

(declare-fun e!751008 () Bool)

(assert (=> b!1316489 (= e!751010 e!751008)))

(declare-fun lt!585997 () (_ BitVec 64))

(assert (=> b!1316489 (= lt!585997 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!585996 () Unit!43229)

(assert (=> b!1316489 (= lt!585996 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!585997 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1316489 (arrayContainsKey!0 _keys!1628 lt!585997 #b00000000000000000000000000000000)))

(declare-fun lt!585995 () Unit!43229)

(assert (=> b!1316489 (= lt!585995 lt!585996)))

(declare-fun res!873918 () Bool)

(assert (=> b!1316489 (= res!873918 (= (seekEntryOrOpen!0 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1628 mask!2040) (Found!10034 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1316489 (=> (not res!873918) (not e!751008))))

(declare-fun b!1316490 () Bool)

(assert (=> b!1316490 (= e!751010 call!64653)))

(declare-fun b!1316491 () Bool)

(assert (=> b!1316491 (= e!751009 e!751010)))

(declare-fun c!125590 () Bool)

(assert (=> b!1316491 (= c!125590 (validKeyInArray!0 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1316492 () Bool)

(assert (=> b!1316492 (= e!751008 call!64653)))

(assert (= (and d!142445 (not res!873919)) b!1316491))

(assert (= (and b!1316491 c!125590) b!1316489))

(assert (= (and b!1316491 (not c!125590)) b!1316490))

(assert (= (and b!1316489 res!873918) b!1316492))

(assert (= (or b!1316492 b!1316490) bm!64650))

(declare-fun m!1203993 () Bool)

(assert (=> bm!64650 m!1203993))

(assert (=> b!1316489 m!1203921))

(declare-fun m!1203995 () Bool)

(assert (=> b!1316489 m!1203995))

(declare-fun m!1203997 () Bool)

(assert (=> b!1316489 m!1203997))

(assert (=> b!1316489 m!1203921))

(declare-fun m!1203999 () Bool)

(assert (=> b!1316489 m!1203999))

(assert (=> b!1316491 m!1203921))

(assert (=> b!1316491 m!1203921))

(assert (=> b!1316491 m!1203927))

(assert (=> bm!64634 d!142445))

(declare-fun d!142447 () Bool)

(assert (=> d!142447 (= (validKeyInArray!0 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)) (and (not (= (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1316394 d!142447))

(assert (=> b!1316393 d!142447))

(declare-fun d!142449 () Bool)

(assert (=> d!142449 (arrayContainsKey!0 _keys!1628 lt!585909 #b00000000000000000000000000000000)))

(declare-fun lt!586000 () Unit!43229)

(declare-fun choose!13 (array!88329 (_ BitVec 64) (_ BitVec 32)) Unit!43229)

(assert (=> d!142449 (= lt!586000 (choose!13 _keys!1628 lt!585909 #b00000000000000000000000000000000))))

(assert (=> d!142449 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!142449 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!585909 #b00000000000000000000000000000000) lt!586000)))

(declare-fun bs!37574 () Bool)

(assert (= bs!37574 d!142449))

(assert (=> bs!37574 m!1203809))

(declare-fun m!1204001 () Bool)

(assert (=> bs!37574 m!1204001))

(assert (=> b!1316353 d!142449))

(declare-fun d!142451 () Bool)

(declare-fun res!873924 () Bool)

(declare-fun e!751015 () Bool)

(assert (=> d!142451 (=> res!873924 e!751015)))

(assert (=> d!142451 (= res!873924 (= (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) lt!585909))))

(assert (=> d!142451 (= (arrayContainsKey!0 _keys!1628 lt!585909 #b00000000000000000000000000000000) e!751015)))

(declare-fun b!1316497 () Bool)

(declare-fun e!751016 () Bool)

(assert (=> b!1316497 (= e!751015 e!751016)))

(declare-fun res!873925 () Bool)

(assert (=> b!1316497 (=> (not res!873925) (not e!751016))))

(assert (=> b!1316497 (= res!873925 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43197 _keys!1628)))))

(declare-fun b!1316498 () Bool)

(assert (=> b!1316498 (= e!751016 (arrayContainsKey!0 _keys!1628 lt!585909 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!142451 (not res!873924)) b!1316497))

(assert (= (and b!1316497 res!873925) b!1316498))

(assert (=> d!142451 m!1203805))

(declare-fun m!1204003 () Bool)

(assert (=> b!1316498 m!1204003))

(assert (=> b!1316353 d!142451))

(declare-fun b!1316511 () Bool)

(declare-fun c!125597 () Bool)

(declare-fun lt!586007 () (_ BitVec 64))

(assert (=> b!1316511 (= c!125597 (= lt!586007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!751023 () SeekEntryResult!10034)

(declare-fun e!751024 () SeekEntryResult!10034)

(assert (=> b!1316511 (= e!751023 e!751024)))

(declare-fun b!1316512 () Bool)

(declare-fun lt!586009 () SeekEntryResult!10034)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!88329 (_ BitVec 32)) SeekEntryResult!10034)

(assert (=> b!1316512 (= e!751024 (seekKeyOrZeroReturnVacant!0 (x!117021 lt!586009) (index!42509 lt!586009) (index!42509 lt!586009) (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040))))

(declare-fun b!1316513 () Bool)

(declare-fun e!751025 () SeekEntryResult!10034)

(assert (=> b!1316513 (= e!751025 Undefined!10034)))

(declare-fun b!1316514 () Bool)

(assert (=> b!1316514 (= e!751023 (Found!10034 (index!42509 lt!586009)))))

(declare-fun b!1316516 () Bool)

(assert (=> b!1316516 (= e!751025 e!751023)))

(assert (=> b!1316516 (= lt!586007 (select (arr!42645 _keys!1628) (index!42509 lt!586009)))))

(declare-fun c!125599 () Bool)

(assert (=> b!1316516 (= c!125599 (= lt!586007 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1316515 () Bool)

(assert (=> b!1316515 (= e!751024 (MissingZero!10034 (index!42509 lt!586009)))))

(declare-fun d!142453 () Bool)

(declare-fun lt!586008 () SeekEntryResult!10034)

(assert (=> d!142453 (and (or ((_ is Undefined!10034) lt!586008) (not ((_ is Found!10034) lt!586008)) (and (bvsge (index!42508 lt!586008) #b00000000000000000000000000000000) (bvslt (index!42508 lt!586008) (size!43197 _keys!1628)))) (or ((_ is Undefined!10034) lt!586008) ((_ is Found!10034) lt!586008) (not ((_ is MissingZero!10034) lt!586008)) (and (bvsge (index!42507 lt!586008) #b00000000000000000000000000000000) (bvslt (index!42507 lt!586008) (size!43197 _keys!1628)))) (or ((_ is Undefined!10034) lt!586008) ((_ is Found!10034) lt!586008) ((_ is MissingZero!10034) lt!586008) (not ((_ is MissingVacant!10034) lt!586008)) (and (bvsge (index!42510 lt!586008) #b00000000000000000000000000000000) (bvslt (index!42510 lt!586008) (size!43197 _keys!1628)))) (or ((_ is Undefined!10034) lt!586008) (ite ((_ is Found!10034) lt!586008) (= (select (arr!42645 _keys!1628) (index!42508 lt!586008)) (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10034) lt!586008) (= (select (arr!42645 _keys!1628) (index!42507 lt!586008)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10034) lt!586008) (= (select (arr!42645 _keys!1628) (index!42510 lt!586008)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142453 (= lt!586008 e!751025)))

(declare-fun c!125598 () Bool)

(assert (=> d!142453 (= c!125598 (and ((_ is Intermediate!10034) lt!586009) (undefined!10846 lt!586009)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!88329 (_ BitVec 32)) SeekEntryResult!10034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!142453 (= lt!586009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) mask!2040) (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040))))

(assert (=> d!142453 (validMask!0 mask!2040)))

(assert (=> d!142453 (= (seekEntryOrOpen!0 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) lt!586008)))

(assert (= (and d!142453 c!125598) b!1316513))

(assert (= (and d!142453 (not c!125598)) b!1316516))

(assert (= (and b!1316516 c!125599) b!1316514))

(assert (= (and b!1316516 (not c!125599)) b!1316511))

(assert (= (and b!1316511 c!125597) b!1316515))

(assert (= (and b!1316511 (not c!125597)) b!1316512))

(assert (=> b!1316512 m!1203805))

(declare-fun m!1204005 () Bool)

(assert (=> b!1316512 m!1204005))

(declare-fun m!1204007 () Bool)

(assert (=> b!1316516 m!1204007))

(declare-fun m!1204009 () Bool)

(assert (=> d!142453 m!1204009))

(assert (=> d!142453 m!1203805))

(declare-fun m!1204011 () Bool)

(assert (=> d!142453 m!1204011))

(assert (=> d!142453 m!1203685))

(assert (=> d!142453 m!1204011))

(assert (=> d!142453 m!1203805))

(declare-fun m!1204013 () Bool)

(assert (=> d!142453 m!1204013))

(declare-fun m!1204015 () Bool)

(assert (=> d!142453 m!1204015))

(declare-fun m!1204017 () Bool)

(assert (=> d!142453 m!1204017))

(assert (=> b!1316353 d!142453))

(assert (=> b!1316279 d!142431))

(assert (=> b!1316279 d!142433))

(declare-fun d!142455 () Bool)

(declare-fun res!873930 () Bool)

(declare-fun e!751030 () Bool)

(assert (=> d!142455 (=> res!873930 e!751030)))

(assert (=> d!142455 (= res!873930 (and ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (= (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)))))

(assert (=> d!142455 (= (containsKey!731 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175) e!751030)))

(declare-fun b!1316521 () Bool)

(declare-fun e!751031 () Bool)

(assert (=> b!1316521 (= e!751030 e!751031)))

(declare-fun res!873931 () Bool)

(assert (=> b!1316521 (=> (not res!873931) (not e!751031))))

(assert (=> b!1316521 (= res!873931 (and (or (not ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) (bvsle (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)) ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (bvslt (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)))))

(declare-fun b!1316522 () Bool)

(assert (=> b!1316522 (= e!751031 (containsKey!731 (t!43944 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) k0!1175))))

(assert (= (and d!142455 (not res!873930)) b!1316521))

(assert (= (and b!1316521 res!873931) b!1316522))

(declare-fun m!1204019 () Bool)

(assert (=> b!1316522 m!1204019))

(assert (=> d!142411 d!142455))

(declare-fun d!142457 () Bool)

(declare-fun lt!586012 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!649 (List!30345) (InoxSet (_ BitVec 64)))

(assert (=> d!142457 (= lt!586012 (select (content!649 Nil!30342) (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun e!751036 () Bool)

(assert (=> d!142457 (= lt!586012 e!751036)))

(declare-fun res!873937 () Bool)

(assert (=> d!142457 (=> (not res!873937) (not e!751036))))

(assert (=> d!142457 (= res!873937 ((_ is Cons!30341) Nil!30342))))

(assert (=> d!142457 (= (contains!8538 Nil!30342 (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)) lt!586012)))

(declare-fun b!1316527 () Bool)

(declare-fun e!751037 () Bool)

(assert (=> b!1316527 (= e!751036 e!751037)))

(declare-fun res!873936 () Bool)

(assert (=> b!1316527 (=> res!873936 e!751037)))

(assert (=> b!1316527 (= res!873936 (= (h!31550 Nil!30342) (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)))))

(declare-fun b!1316528 () Bool)

(assert (=> b!1316528 (= e!751037 (contains!8538 (t!43943 Nil!30342) (select (arr!42645 _keys!1628) #b00000000000000000000000000000000)))))

(assert (= (and d!142457 res!873937) b!1316527))

(assert (= (and b!1316527 (not res!873936)) b!1316528))

(declare-fun m!1204021 () Bool)

(assert (=> d!142457 m!1204021))

(assert (=> d!142457 m!1203805))

(declare-fun m!1204023 () Bool)

(assert (=> d!142457 m!1204023))

(assert (=> b!1316528 m!1203805))

(declare-fun m!1204025 () Bool)

(assert (=> b!1316528 m!1204025))

(assert (=> b!1316392 d!142457))

(declare-fun d!142459 () Bool)

(assert (=> d!142459 (isDefined!521 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-fun lt!586013 () Unit!43229)

(assert (=> d!142459 (= lt!586013 (choose!1951 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(declare-fun e!751038 () Bool)

(assert (=> d!142459 e!751038))

(declare-fun res!873938 () Bool)

(assert (=> d!142459 (=> (not res!873938) (not e!751038))))

(assert (=> d!142459 (= res!873938 (isStrictlySorted!872 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))))

(assert (=> d!142459 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175) lt!586013)))

(declare-fun b!1316529 () Bool)

(assert (=> b!1316529 (= e!751038 (containsKey!731 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))

(assert (= (and d!142459 res!873938) b!1316529))

(assert (=> d!142459 m!1203819))

(assert (=> d!142459 m!1203819))

(assert (=> d!142459 m!1203821))

(declare-fun m!1204027 () Bool)

(assert (=> d!142459 m!1204027))

(declare-fun m!1204029 () Bool)

(assert (=> d!142459 m!1204029))

(assert (=> b!1316529 m!1203815))

(assert (=> b!1316357 d!142459))

(declare-fun d!142461 () Bool)

(assert (=> d!142461 (= (isDefined!521 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175)) (not (isEmpty!1080 (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175))))))

(declare-fun bs!37575 () Bool)

(assert (= bs!37575 d!142461))

(assert (=> bs!37575 m!1203819))

(declare-fun m!1204031 () Bool)

(assert (=> bs!37575 m!1204031))

(assert (=> b!1316357 d!142461))

(declare-fun b!1316530 () Bool)

(declare-fun e!751039 () Option!765)

(assert (=> b!1316530 (= e!751039 (Some!764 (_2!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))))))))

(declare-fun b!1316533 () Bool)

(declare-fun e!751040 () Option!765)

(assert (=> b!1316533 (= e!751040 None!763)))

(declare-fun b!1316531 () Bool)

(assert (=> b!1316531 (= e!751039 e!751040)))

(declare-fun c!125601 () Bool)

(assert (=> b!1316531 (= c!125601 (and ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (not (= (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175))))))

(declare-fun d!142463 () Bool)

(declare-fun c!125600 () Bool)

(assert (=> d!142463 (= c!125600 (and ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) (= (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)))) k0!1175)))))

(assert (=> d!142463 (= (getValueByKey!714 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357)) k0!1175) e!751039)))

(declare-fun b!1316532 () Bool)

(assert (=> b!1316532 (= e!751040 (getValueByKey!714 (t!43944 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357))) k0!1175))))

(assert (= (and d!142463 c!125600) b!1316530))

(assert (= (and d!142463 (not c!125600)) b!1316531))

(assert (= (and b!1316531 c!125601) b!1316532))

(assert (= (and b!1316531 (not c!125601)) b!1316533))

(declare-fun m!1204033 () Bool)

(assert (=> b!1316532 m!1204033))

(assert (=> b!1316357 d!142463))

(declare-fun d!142465 () Bool)

(declare-fun e!751041 () Bool)

(assert (=> d!142465 e!751041))

(declare-fun res!873939 () Bool)

(assert (=> d!142465 (=> res!873939 e!751041)))

(declare-fun lt!586014 () Bool)

(assert (=> d!142465 (= res!873939 (not lt!586014))))

(declare-fun lt!586016 () Bool)

(assert (=> d!142465 (= lt!586014 lt!586016)))

(declare-fun lt!586015 () Unit!43229)

(declare-fun e!751042 () Unit!43229)

(assert (=> d!142465 (= lt!586015 e!751042)))

(declare-fun c!125602 () Bool)

(assert (=> d!142465 (= c!125602 lt!586016)))

(assert (=> d!142465 (= lt!586016 (containsKey!731 (toList!10459 lt!585883) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142465 (= (contains!8536 lt!585883 #b0000000000000000000000000000000000000000000000000000000000000000) lt!586014)))

(declare-fun b!1316534 () Bool)

(declare-fun lt!586017 () Unit!43229)

(assert (=> b!1316534 (= e!751042 lt!586017)))

(assert (=> b!1316534 (= lt!586017 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 lt!585883) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1316534 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585883) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316535 () Bool)

(declare-fun Unit!43238 () Unit!43229)

(assert (=> b!1316535 (= e!751042 Unit!43238)))

(declare-fun b!1316536 () Bool)

(assert (=> b!1316536 (= e!751041 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142465 c!125602) b!1316534))

(assert (= (and d!142465 (not c!125602)) b!1316535))

(assert (= (and d!142465 (not res!873939)) b!1316536))

(declare-fun m!1204035 () Bool)

(assert (=> d!142465 m!1204035))

(declare-fun m!1204037 () Bool)

(assert (=> b!1316534 m!1204037))

(declare-fun m!1204039 () Bool)

(assert (=> b!1316534 m!1204039))

(assert (=> b!1316534 m!1204039))

(declare-fun m!1204041 () Bool)

(assert (=> b!1316534 m!1204041))

(assert (=> b!1316536 m!1204039))

(assert (=> b!1316536 m!1204039))

(assert (=> b!1316536 m!1204041))

(assert (=> bm!64629 d!142465))

(declare-fun d!142467 () Bool)

(declare-fun e!751043 () Bool)

(assert (=> d!142467 e!751043))

(declare-fun res!873940 () Bool)

(assert (=> d!142467 (=> res!873940 e!751043)))

(declare-fun lt!586018 () Bool)

(assert (=> d!142467 (= res!873940 (not lt!586018))))

(declare-fun lt!586020 () Bool)

(assert (=> d!142467 (= lt!586018 lt!586020)))

(declare-fun lt!586019 () Unit!43229)

(declare-fun e!751044 () Unit!43229)

(assert (=> d!142467 (= lt!586019 e!751044)))

(declare-fun c!125603 () Bool)

(assert (=> d!142467 (= c!125603 lt!586020)))

(assert (=> d!142467 (= lt!586020 (containsKey!731 (toList!10459 lt!585918) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142467 (= (contains!8536 lt!585918 #b0000000000000000000000000000000000000000000000000000000000000000) lt!586018)))

(declare-fun b!1316537 () Bool)

(declare-fun lt!586021 () Unit!43229)

(assert (=> b!1316537 (= e!751044 lt!586021)))

(assert (=> b!1316537 (= lt!586021 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 lt!585918) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1316537 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585918) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316538 () Bool)

(declare-fun Unit!43239 () Unit!43229)

(assert (=> b!1316538 (= e!751044 Unit!43239)))

(declare-fun b!1316539 () Bool)

(assert (=> b!1316539 (= e!751043 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585918) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142467 c!125603) b!1316537))

(assert (= (and d!142467 (not c!125603)) b!1316538))

(assert (= (and d!142467 (not res!873940)) b!1316539))

(declare-fun m!1204043 () Bool)

(assert (=> d!142467 m!1204043))

(declare-fun m!1204045 () Bool)

(assert (=> b!1316537 m!1204045))

(assert (=> b!1316537 m!1203957))

(assert (=> b!1316537 m!1203957))

(declare-fun m!1204047 () Bool)

(assert (=> b!1316537 m!1204047))

(assert (=> b!1316539 m!1203957))

(assert (=> b!1316539 m!1203957))

(assert (=> b!1316539 m!1204047))

(assert (=> bm!64639 d!142467))

(declare-fun d!142469 () Bool)

(declare-fun res!873941 () Bool)

(declare-fun e!751045 () Bool)

(assert (=> d!142469 (=> res!873941 e!751045)))

(assert (=> d!142469 (= res!873941 (and ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (= (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)))))

(assert (=> d!142469 (= (containsKey!731 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)) k0!1175) e!751045)))

(declare-fun b!1316540 () Bool)

(declare-fun e!751046 () Bool)

(assert (=> b!1316540 (= e!751045 e!751046)))

(declare-fun res!873942 () Bool)

(assert (=> b!1316540 (=> (not res!873942) (not e!751046))))

(assert (=> b!1316540 (= res!873942 (and (or (not ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) (bvsle (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)) ((_ is Cons!30342) (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) (bvslt (_1!11626 (h!31551 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357)))) k0!1175)))))

(declare-fun b!1316541 () Bool)

(assert (=> b!1316541 (= e!751046 (containsKey!731 (t!43944 (toList!10459 (getCurrentListMap!5354 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357))) k0!1175))))

(assert (= (and d!142469 (not res!873941)) b!1316540))

(assert (= (and b!1316540 res!873942) b!1316541))

(declare-fun m!1204049 () Bool)

(assert (=> b!1316541 m!1204049))

(assert (=> d!142399 d!142469))

(assert (=> b!1316355 d!142447))

(declare-fun d!142471 () Bool)

(assert (=> d!142471 (= (apply!1021 lt!585918 (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020))) (get!21456 (getValueByKey!714 (toList!10459 lt!585918) (select (arr!42645 _keys!1628) (bvadd #b00000000000000000000000000000001 from!2020)))))))

(declare-fun bs!37576 () Bool)

(assert (= bs!37576 d!142471))

(assert (=> bs!37576 m!1203829))

(assert (=> bs!37576 m!1203889))

(assert (=> bs!37576 m!1203889))

(declare-fun m!1204051 () Bool)

(assert (=> bs!37576 m!1204051))

(assert (=> b!1316371 d!142471))

(declare-fun d!142473 () Bool)

(declare-fun c!125606 () Bool)

(assert (=> d!142473 (= c!125606 ((_ is ValueCellFull!16967) (select (arr!42646 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020))))))

(declare-fun e!751049 () V!52745)

(assert (=> d!142473 (= (get!21455 (select (arr!42646 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)) e!751049)))

(declare-fun b!1316546 () Bool)

(declare-fun get!21457 (ValueCell!16967 V!52745) V!52745)

(assert (=> b!1316546 (= e!751049 (get!21457 (select (arr!42646 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1316547 () Bool)

(declare-fun get!21458 (ValueCell!16967 V!52745) V!52745)

(assert (=> b!1316547 (= e!751049 (get!21458 (select (arr!42646 _values!1354) (bvadd #b00000000000000000000000000000001 from!2020)) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142473 c!125606) b!1316546))

(assert (= (and d!142473 (not c!125606)) b!1316547))

(assert (=> b!1316546 m!1203835))

(assert (=> b!1316546 m!1203759))

(declare-fun m!1204053 () Bool)

(assert (=> b!1316546 m!1204053))

(assert (=> b!1316547 m!1203835))

(assert (=> b!1316547 m!1203759))

(declare-fun m!1204055 () Bool)

(assert (=> b!1316547 m!1204055))

(assert (=> b!1316371 d!142473))

(declare-fun d!142475 () Bool)

(assert (=> d!142475 (= (apply!1021 lt!585883 (select (arr!42645 _keys!1628) from!2020)) (get!21456 (getValueByKey!714 (toList!10459 lt!585883) (select (arr!42645 _keys!1628) from!2020))))))

(declare-fun bs!37577 () Bool)

(assert (= bs!37577 d!142475))

(assert (=> bs!37577 m!1203675))

(assert (=> bs!37577 m!1203917))

(assert (=> bs!37577 m!1203917))

(declare-fun m!1204057 () Bool)

(assert (=> bs!37577 m!1204057))

(assert (=> b!1316333 d!142475))

(declare-fun d!142477 () Bool)

(declare-fun c!125607 () Bool)

(assert (=> d!142477 (= c!125607 ((_ is ValueCellFull!16967) (select (arr!42646 _values!1354) from!2020)))))

(declare-fun e!751050 () V!52745)

(assert (=> d!142477 (= (get!21455 (select (arr!42646 _values!1354) from!2020) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)) e!751050)))

(declare-fun b!1316548 () Bool)

(assert (=> b!1316548 (= e!751050 (get!21457 (select (arr!42646 _values!1354) from!2020) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1316549 () Bool)

(assert (=> b!1316549 (= e!751050 (get!21458 (select (arr!42646 _values!1354) from!2020) (dynLambda!3459 defaultEntry!1357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142477 c!125607) b!1316548))

(assert (= (and d!142477 (not c!125607)) b!1316549))

(assert (=> b!1316548 m!1203761))

(assert (=> b!1316548 m!1203759))

(declare-fun m!1204059 () Bool)

(assert (=> b!1316548 m!1204059))

(assert (=> b!1316549 m!1203761))

(assert (=> b!1316549 m!1203759))

(declare-fun m!1204061 () Bool)

(assert (=> b!1316549 m!1204061))

(assert (=> b!1316333 d!142477))

(declare-fun d!142479 () Bool)

(declare-fun e!751051 () Bool)

(assert (=> d!142479 e!751051))

(declare-fun res!873943 () Bool)

(assert (=> d!142479 (=> res!873943 e!751051)))

(declare-fun lt!586022 () Bool)

(assert (=> d!142479 (= res!873943 (not lt!586022))))

(declare-fun lt!586024 () Bool)

(assert (=> d!142479 (= lt!586022 lt!586024)))

(declare-fun lt!586023 () Unit!43229)

(declare-fun e!751052 () Unit!43229)

(assert (=> d!142479 (= lt!586023 e!751052)))

(declare-fun c!125608 () Bool)

(assert (=> d!142479 (= c!125608 lt!586024)))

(assert (=> d!142479 (= lt!586024 (containsKey!731 (toList!10459 (+!4529 lt!585889 (tuple2!23231 lt!585900 zeroValue!1296))) lt!585899))))

(assert (=> d!142479 (= (contains!8536 (+!4529 lt!585889 (tuple2!23231 lt!585900 zeroValue!1296)) lt!585899) lt!586022)))

(declare-fun b!1316550 () Bool)

(declare-fun lt!586025 () Unit!43229)

(assert (=> b!1316550 (= e!751052 lt!586025)))

(assert (=> b!1316550 (= lt!586025 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 (+!4529 lt!585889 (tuple2!23231 lt!585900 zeroValue!1296))) lt!585899))))

(assert (=> b!1316550 (isDefined!521 (getValueByKey!714 (toList!10459 (+!4529 lt!585889 (tuple2!23231 lt!585900 zeroValue!1296))) lt!585899))))

(declare-fun b!1316551 () Bool)

(declare-fun Unit!43240 () Unit!43229)

(assert (=> b!1316551 (= e!751052 Unit!43240)))

(declare-fun b!1316552 () Bool)

(assert (=> b!1316552 (= e!751051 (isDefined!521 (getValueByKey!714 (toList!10459 (+!4529 lt!585889 (tuple2!23231 lt!585900 zeroValue!1296))) lt!585899)))))

(assert (= (and d!142479 c!125608) b!1316550))

(assert (= (and d!142479 (not c!125608)) b!1316551))

(assert (= (and d!142479 (not res!873943)) b!1316552))

(declare-fun m!1204063 () Bool)

(assert (=> d!142479 m!1204063))

(declare-fun m!1204065 () Bool)

(assert (=> b!1316550 m!1204065))

(declare-fun m!1204067 () Bool)

(assert (=> b!1316550 m!1204067))

(assert (=> b!1316550 m!1204067))

(declare-fun m!1204069 () Bool)

(assert (=> b!1316550 m!1204069))

(assert (=> b!1316552 m!1204067))

(assert (=> b!1316552 m!1204067))

(assert (=> b!1316552 m!1204069))

(assert (=> b!1316337 d!142479))

(declare-fun d!142481 () Bool)

(assert (=> d!142481 (= (apply!1021 (+!4529 lt!585884 (tuple2!23231 lt!585893 minValue!1296)) lt!585895) (get!21456 (getValueByKey!714 (toList!10459 (+!4529 lt!585884 (tuple2!23231 lt!585893 minValue!1296))) lt!585895)))))

(declare-fun bs!37578 () Bool)

(assert (= bs!37578 d!142481))

(declare-fun m!1204071 () Bool)

(assert (=> bs!37578 m!1204071))

(assert (=> bs!37578 m!1204071))

(declare-fun m!1204073 () Bool)

(assert (=> bs!37578 m!1204073))

(assert (=> b!1316337 d!142481))

(declare-fun d!142483 () Bool)

(declare-fun e!751053 () Bool)

(assert (=> d!142483 e!751053))

(declare-fun res!873944 () Bool)

(assert (=> d!142483 (=> (not res!873944) (not e!751053))))

(declare-fun lt!586026 () ListLongMap!20887)

(assert (=> d!142483 (= res!873944 (contains!8536 lt!586026 (_1!11626 (tuple2!23231 lt!585892 zeroValue!1296))))))

(declare-fun lt!586029 () List!30346)

(assert (=> d!142483 (= lt!586026 (ListLongMap!20888 lt!586029))))

(declare-fun lt!586028 () Unit!43229)

(declare-fun lt!586027 () Unit!43229)

(assert (=> d!142483 (= lt!586028 lt!586027)))

(assert (=> d!142483 (= (getValueByKey!714 lt!586029 (_1!11626 (tuple2!23231 lt!585892 zeroValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585892 zeroValue!1296))))))

(assert (=> d!142483 (= lt!586027 (lemmaContainsTupThenGetReturnValue!357 lt!586029 (_1!11626 (tuple2!23231 lt!585892 zeroValue!1296)) (_2!11626 (tuple2!23231 lt!585892 zeroValue!1296))))))

(assert (=> d!142483 (= lt!586029 (insertStrictlySorted!486 (toList!10459 lt!585898) (_1!11626 (tuple2!23231 lt!585892 zeroValue!1296)) (_2!11626 (tuple2!23231 lt!585892 zeroValue!1296))))))

(assert (=> d!142483 (= (+!4529 lt!585898 (tuple2!23231 lt!585892 zeroValue!1296)) lt!586026)))

(declare-fun b!1316553 () Bool)

(declare-fun res!873945 () Bool)

(assert (=> b!1316553 (=> (not res!873945) (not e!751053))))

(assert (=> b!1316553 (= res!873945 (= (getValueByKey!714 (toList!10459 lt!586026) (_1!11626 (tuple2!23231 lt!585892 zeroValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585892 zeroValue!1296)))))))

(declare-fun b!1316554 () Bool)

(assert (=> b!1316554 (= e!751053 (contains!8539 (toList!10459 lt!586026) (tuple2!23231 lt!585892 zeroValue!1296)))))

(assert (= (and d!142483 res!873944) b!1316553))

(assert (= (and b!1316553 res!873945) b!1316554))

(declare-fun m!1204075 () Bool)

(assert (=> d!142483 m!1204075))

(declare-fun m!1204077 () Bool)

(assert (=> d!142483 m!1204077))

(declare-fun m!1204079 () Bool)

(assert (=> d!142483 m!1204079))

(declare-fun m!1204081 () Bool)

(assert (=> d!142483 m!1204081))

(declare-fun m!1204083 () Bool)

(assert (=> b!1316553 m!1204083))

(declare-fun m!1204085 () Bool)

(assert (=> b!1316554 m!1204085))

(assert (=> b!1316337 d!142483))

(declare-fun d!142485 () Bool)

(assert (=> d!142485 (= (apply!1021 (+!4529 lt!585882 (tuple2!23231 lt!585894 minValue!1296)) lt!585880) (get!21456 (getValueByKey!714 (toList!10459 (+!4529 lt!585882 (tuple2!23231 lt!585894 minValue!1296))) lt!585880)))))

(declare-fun bs!37579 () Bool)

(assert (= bs!37579 d!142485))

(declare-fun m!1204087 () Bool)

(assert (=> bs!37579 m!1204087))

(assert (=> bs!37579 m!1204087))

(declare-fun m!1204089 () Bool)

(assert (=> bs!37579 m!1204089))

(assert (=> b!1316337 d!142485))

(declare-fun d!142487 () Bool)

(assert (=> d!142487 (= (apply!1021 lt!585882 lt!585880) (get!21456 (getValueByKey!714 (toList!10459 lt!585882) lt!585880)))))

(declare-fun bs!37580 () Bool)

(assert (= bs!37580 d!142487))

(declare-fun m!1204091 () Bool)

(assert (=> bs!37580 m!1204091))

(assert (=> bs!37580 m!1204091))

(declare-fun m!1204093 () Bool)

(assert (=> bs!37580 m!1204093))

(assert (=> b!1316337 d!142487))

(declare-fun d!142489 () Bool)

(declare-fun e!751054 () Bool)

(assert (=> d!142489 e!751054))

(declare-fun res!873946 () Bool)

(assert (=> d!142489 (=> (not res!873946) (not e!751054))))

(declare-fun lt!586030 () ListLongMap!20887)

(assert (=> d!142489 (= res!873946 (contains!8536 lt!586030 (_1!11626 (tuple2!23231 lt!585900 zeroValue!1296))))))

(declare-fun lt!586033 () List!30346)

(assert (=> d!142489 (= lt!586030 (ListLongMap!20888 lt!586033))))

(declare-fun lt!586032 () Unit!43229)

(declare-fun lt!586031 () Unit!43229)

(assert (=> d!142489 (= lt!586032 lt!586031)))

(assert (=> d!142489 (= (getValueByKey!714 lt!586033 (_1!11626 (tuple2!23231 lt!585900 zeroValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585900 zeroValue!1296))))))

(assert (=> d!142489 (= lt!586031 (lemmaContainsTupThenGetReturnValue!357 lt!586033 (_1!11626 (tuple2!23231 lt!585900 zeroValue!1296)) (_2!11626 (tuple2!23231 lt!585900 zeroValue!1296))))))

(assert (=> d!142489 (= lt!586033 (insertStrictlySorted!486 (toList!10459 lt!585889) (_1!11626 (tuple2!23231 lt!585900 zeroValue!1296)) (_2!11626 (tuple2!23231 lt!585900 zeroValue!1296))))))

(assert (=> d!142489 (= (+!4529 lt!585889 (tuple2!23231 lt!585900 zeroValue!1296)) lt!586030)))

(declare-fun b!1316555 () Bool)

(declare-fun res!873947 () Bool)

(assert (=> b!1316555 (=> (not res!873947) (not e!751054))))

(assert (=> b!1316555 (= res!873947 (= (getValueByKey!714 (toList!10459 lt!586030) (_1!11626 (tuple2!23231 lt!585900 zeroValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585900 zeroValue!1296)))))))

(declare-fun b!1316556 () Bool)

(assert (=> b!1316556 (= e!751054 (contains!8539 (toList!10459 lt!586030) (tuple2!23231 lt!585900 zeroValue!1296)))))

(assert (= (and d!142489 res!873946) b!1316555))

(assert (= (and b!1316555 res!873947) b!1316556))

(declare-fun m!1204095 () Bool)

(assert (=> d!142489 m!1204095))

(declare-fun m!1204097 () Bool)

(assert (=> d!142489 m!1204097))

(declare-fun m!1204099 () Bool)

(assert (=> d!142489 m!1204099))

(declare-fun m!1204101 () Bool)

(assert (=> d!142489 m!1204101))

(declare-fun m!1204103 () Bool)

(assert (=> b!1316555 m!1204103))

(declare-fun m!1204105 () Bool)

(assert (=> b!1316556 m!1204105))

(assert (=> b!1316337 d!142489))

(declare-fun d!142491 () Bool)

(assert (=> d!142491 (= (apply!1021 (+!4529 lt!585898 (tuple2!23231 lt!585892 zeroValue!1296)) lt!585879) (get!21456 (getValueByKey!714 (toList!10459 (+!4529 lt!585898 (tuple2!23231 lt!585892 zeroValue!1296))) lt!585879)))))

(declare-fun bs!37581 () Bool)

(assert (= bs!37581 d!142491))

(declare-fun m!1204107 () Bool)

(assert (=> bs!37581 m!1204107))

(assert (=> bs!37581 m!1204107))

(declare-fun m!1204109 () Bool)

(assert (=> bs!37581 m!1204109))

(assert (=> b!1316337 d!142491))

(declare-fun d!142493 () Bool)

(declare-fun e!751055 () Bool)

(assert (=> d!142493 e!751055))

(declare-fun res!873948 () Bool)

(assert (=> d!142493 (=> (not res!873948) (not e!751055))))

(declare-fun lt!586034 () ListLongMap!20887)

(assert (=> d!142493 (= res!873948 (contains!8536 lt!586034 (_1!11626 (tuple2!23231 lt!585893 minValue!1296))))))

(declare-fun lt!586037 () List!30346)

(assert (=> d!142493 (= lt!586034 (ListLongMap!20888 lt!586037))))

(declare-fun lt!586036 () Unit!43229)

(declare-fun lt!586035 () Unit!43229)

(assert (=> d!142493 (= lt!586036 lt!586035)))

(assert (=> d!142493 (= (getValueByKey!714 lt!586037 (_1!11626 (tuple2!23231 lt!585893 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585893 minValue!1296))))))

(assert (=> d!142493 (= lt!586035 (lemmaContainsTupThenGetReturnValue!357 lt!586037 (_1!11626 (tuple2!23231 lt!585893 minValue!1296)) (_2!11626 (tuple2!23231 lt!585893 minValue!1296))))))

(assert (=> d!142493 (= lt!586037 (insertStrictlySorted!486 (toList!10459 lt!585884) (_1!11626 (tuple2!23231 lt!585893 minValue!1296)) (_2!11626 (tuple2!23231 lt!585893 minValue!1296))))))

(assert (=> d!142493 (= (+!4529 lt!585884 (tuple2!23231 lt!585893 minValue!1296)) lt!586034)))

(declare-fun b!1316557 () Bool)

(declare-fun res!873949 () Bool)

(assert (=> b!1316557 (=> (not res!873949) (not e!751055))))

(assert (=> b!1316557 (= res!873949 (= (getValueByKey!714 (toList!10459 lt!586034) (_1!11626 (tuple2!23231 lt!585893 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585893 minValue!1296)))))))

(declare-fun b!1316558 () Bool)

(assert (=> b!1316558 (= e!751055 (contains!8539 (toList!10459 lt!586034) (tuple2!23231 lt!585893 minValue!1296)))))

(assert (= (and d!142493 res!873948) b!1316557))

(assert (= (and b!1316557 res!873949) b!1316558))

(declare-fun m!1204111 () Bool)

(assert (=> d!142493 m!1204111))

(declare-fun m!1204113 () Bool)

(assert (=> d!142493 m!1204113))

(declare-fun m!1204115 () Bool)

(assert (=> d!142493 m!1204115))

(declare-fun m!1204117 () Bool)

(assert (=> d!142493 m!1204117))

(declare-fun m!1204119 () Bool)

(assert (=> b!1316557 m!1204119))

(declare-fun m!1204121 () Bool)

(assert (=> b!1316558 m!1204121))

(assert (=> b!1316337 d!142493))

(declare-fun d!142495 () Bool)

(assert (=> d!142495 (contains!8536 (+!4529 lt!585889 (tuple2!23231 lt!585900 zeroValue!1296)) lt!585899)))

(declare-fun lt!586040 () Unit!43229)

(declare-fun choose!1952 (ListLongMap!20887 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43229)

(assert (=> d!142495 (= lt!586040 (choose!1952 lt!585889 lt!585900 zeroValue!1296 lt!585899))))

(assert (=> d!142495 (contains!8536 lt!585889 lt!585899)))

(assert (=> d!142495 (= (addStillContains!1116 lt!585889 lt!585900 zeroValue!1296 lt!585899) lt!586040)))

(declare-fun bs!37582 () Bool)

(assert (= bs!37582 d!142495))

(assert (=> bs!37582 m!1203771))

(assert (=> bs!37582 m!1203771))

(assert (=> bs!37582 m!1203773))

(declare-fun m!1204123 () Bool)

(assert (=> bs!37582 m!1204123))

(declare-fun m!1204125 () Bool)

(assert (=> bs!37582 m!1204125))

(assert (=> b!1316337 d!142495))

(declare-fun d!142497 () Bool)

(assert (=> d!142497 (= (apply!1021 (+!4529 lt!585898 (tuple2!23231 lt!585892 zeroValue!1296)) lt!585879) (apply!1021 lt!585898 lt!585879))))

(declare-fun lt!586043 () Unit!43229)

(declare-fun choose!1953 (ListLongMap!20887 (_ BitVec 64) V!52745 (_ BitVec 64)) Unit!43229)

(assert (=> d!142497 (= lt!586043 (choose!1953 lt!585898 lt!585892 zeroValue!1296 lt!585879))))

(declare-fun e!751058 () Bool)

(assert (=> d!142497 e!751058))

(declare-fun res!873952 () Bool)

(assert (=> d!142497 (=> (not res!873952) (not e!751058))))

(assert (=> d!142497 (= res!873952 (contains!8536 lt!585898 lt!585879))))

(assert (=> d!142497 (= (addApplyDifferent!559 lt!585898 lt!585892 zeroValue!1296 lt!585879) lt!586043)))

(declare-fun b!1316563 () Bool)

(assert (=> b!1316563 (= e!751058 (not (= lt!585879 lt!585892)))))

(assert (= (and d!142497 res!873952) b!1316563))

(assert (=> d!142497 m!1203787))

(declare-fun m!1204127 () Bool)

(assert (=> d!142497 m!1204127))

(assert (=> d!142497 m!1203777))

(assert (=> d!142497 m!1203779))

(assert (=> d!142497 m!1203777))

(declare-fun m!1204129 () Bool)

(assert (=> d!142497 m!1204129))

(assert (=> b!1316337 d!142497))

(assert (=> b!1316337 d!142441))

(declare-fun d!142499 () Bool)

(assert (=> d!142499 (= (apply!1021 (+!4529 lt!585882 (tuple2!23231 lt!585894 minValue!1296)) lt!585880) (apply!1021 lt!585882 lt!585880))))

(declare-fun lt!586044 () Unit!43229)

(assert (=> d!142499 (= lt!586044 (choose!1953 lt!585882 lt!585894 minValue!1296 lt!585880))))

(declare-fun e!751059 () Bool)

(assert (=> d!142499 e!751059))

(declare-fun res!873953 () Bool)

(assert (=> d!142499 (=> (not res!873953) (not e!751059))))

(assert (=> d!142499 (= res!873953 (contains!8536 lt!585882 lt!585880))))

(assert (=> d!142499 (= (addApplyDifferent!559 lt!585882 lt!585894 minValue!1296 lt!585880) lt!586044)))

(declare-fun b!1316564 () Bool)

(assert (=> b!1316564 (= e!751059 (not (= lt!585880 lt!585894)))))

(assert (= (and d!142499 res!873953) b!1316564))

(assert (=> d!142499 m!1203791))

(declare-fun m!1204131 () Bool)

(assert (=> d!142499 m!1204131))

(assert (=> d!142499 m!1203795))

(assert (=> d!142499 m!1203797))

(assert (=> d!142499 m!1203795))

(declare-fun m!1204133 () Bool)

(assert (=> d!142499 m!1204133))

(assert (=> b!1316337 d!142499))

(declare-fun d!142501 () Bool)

(assert (=> d!142501 (= (apply!1021 lt!585884 lt!585895) (get!21456 (getValueByKey!714 (toList!10459 lt!585884) lt!585895)))))

(declare-fun bs!37583 () Bool)

(assert (= bs!37583 d!142501))

(declare-fun m!1204135 () Bool)

(assert (=> bs!37583 m!1204135))

(assert (=> bs!37583 m!1204135))

(declare-fun m!1204137 () Bool)

(assert (=> bs!37583 m!1204137))

(assert (=> b!1316337 d!142501))

(declare-fun d!142503 () Bool)

(declare-fun e!751060 () Bool)

(assert (=> d!142503 e!751060))

(declare-fun res!873954 () Bool)

(assert (=> d!142503 (=> (not res!873954) (not e!751060))))

(declare-fun lt!586045 () ListLongMap!20887)

(assert (=> d!142503 (= res!873954 (contains!8536 lt!586045 (_1!11626 (tuple2!23231 lt!585894 minValue!1296))))))

(declare-fun lt!586048 () List!30346)

(assert (=> d!142503 (= lt!586045 (ListLongMap!20888 lt!586048))))

(declare-fun lt!586047 () Unit!43229)

(declare-fun lt!586046 () Unit!43229)

(assert (=> d!142503 (= lt!586047 lt!586046)))

(assert (=> d!142503 (= (getValueByKey!714 lt!586048 (_1!11626 (tuple2!23231 lt!585894 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585894 minValue!1296))))))

(assert (=> d!142503 (= lt!586046 (lemmaContainsTupThenGetReturnValue!357 lt!586048 (_1!11626 (tuple2!23231 lt!585894 minValue!1296)) (_2!11626 (tuple2!23231 lt!585894 minValue!1296))))))

(assert (=> d!142503 (= lt!586048 (insertStrictlySorted!486 (toList!10459 lt!585882) (_1!11626 (tuple2!23231 lt!585894 minValue!1296)) (_2!11626 (tuple2!23231 lt!585894 minValue!1296))))))

(assert (=> d!142503 (= (+!4529 lt!585882 (tuple2!23231 lt!585894 minValue!1296)) lt!586045)))

(declare-fun b!1316565 () Bool)

(declare-fun res!873955 () Bool)

(assert (=> b!1316565 (=> (not res!873955) (not e!751060))))

(assert (=> b!1316565 (= res!873955 (= (getValueByKey!714 (toList!10459 lt!586045) (_1!11626 (tuple2!23231 lt!585894 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585894 minValue!1296)))))))

(declare-fun b!1316566 () Bool)

(assert (=> b!1316566 (= e!751060 (contains!8539 (toList!10459 lt!586045) (tuple2!23231 lt!585894 minValue!1296)))))

(assert (= (and d!142503 res!873954) b!1316565))

(assert (= (and b!1316565 res!873955) b!1316566))

(declare-fun m!1204139 () Bool)

(assert (=> d!142503 m!1204139))

(declare-fun m!1204141 () Bool)

(assert (=> d!142503 m!1204141))

(declare-fun m!1204143 () Bool)

(assert (=> d!142503 m!1204143))

(declare-fun m!1204145 () Bool)

(assert (=> d!142503 m!1204145))

(declare-fun m!1204147 () Bool)

(assert (=> b!1316565 m!1204147))

(declare-fun m!1204149 () Bool)

(assert (=> b!1316566 m!1204149))

(assert (=> b!1316337 d!142503))

(declare-fun d!142505 () Bool)

(assert (=> d!142505 (= (apply!1021 (+!4529 lt!585884 (tuple2!23231 lt!585893 minValue!1296)) lt!585895) (apply!1021 lt!585884 lt!585895))))

(declare-fun lt!586049 () Unit!43229)

(assert (=> d!142505 (= lt!586049 (choose!1953 lt!585884 lt!585893 minValue!1296 lt!585895))))

(declare-fun e!751061 () Bool)

(assert (=> d!142505 e!751061))

(declare-fun res!873956 () Bool)

(assert (=> d!142505 (=> (not res!873956) (not e!751061))))

(assert (=> d!142505 (= res!873956 (contains!8536 lt!585884 lt!585895))))

(assert (=> d!142505 (= (addApplyDifferent!559 lt!585884 lt!585893 minValue!1296 lt!585895) lt!586049)))

(declare-fun b!1316567 () Bool)

(assert (=> b!1316567 (= e!751061 (not (= lt!585895 lt!585893)))))

(assert (= (and d!142505 res!873956) b!1316567))

(assert (=> d!142505 m!1203785))

(declare-fun m!1204151 () Bool)

(assert (=> d!142505 m!1204151))

(assert (=> d!142505 m!1203781))

(assert (=> d!142505 m!1203783))

(assert (=> d!142505 m!1203781))

(declare-fun m!1204153 () Bool)

(assert (=> d!142505 m!1204153))

(assert (=> b!1316337 d!142505))

(declare-fun d!142507 () Bool)

(assert (=> d!142507 (= (apply!1021 lt!585898 lt!585879) (get!21456 (getValueByKey!714 (toList!10459 lt!585898) lt!585879)))))

(declare-fun bs!37584 () Bool)

(assert (= bs!37584 d!142507))

(declare-fun m!1204155 () Bool)

(assert (=> bs!37584 m!1204155))

(assert (=> bs!37584 m!1204155))

(declare-fun m!1204157 () Bool)

(assert (=> bs!37584 m!1204157))

(assert (=> b!1316337 d!142507))

(declare-fun d!142509 () Bool)

(declare-fun e!751062 () Bool)

(assert (=> d!142509 e!751062))

(declare-fun res!873957 () Bool)

(assert (=> d!142509 (=> (not res!873957) (not e!751062))))

(declare-fun lt!586050 () ListLongMap!20887)

(assert (=> d!142509 (= res!873957 (contains!8536 lt!586050 (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun lt!586053 () List!30346)

(assert (=> d!142509 (= lt!586050 (ListLongMap!20888 lt!586053))))

(declare-fun lt!586052 () Unit!43229)

(declare-fun lt!586051 () Unit!43229)

(assert (=> d!142509 (= lt!586052 lt!586051)))

(assert (=> d!142509 (= (getValueByKey!714 lt!586053 (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142509 (= lt!586051 (lemmaContainsTupThenGetReturnValue!357 lt!586053 (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142509 (= lt!586053 (insertStrictlySorted!486 (toList!10459 call!64640) (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142509 (= (+!4529 call!64640 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) lt!586050)))

(declare-fun b!1316568 () Bool)

(declare-fun res!873958 () Bool)

(assert (=> b!1316568 (=> (not res!873958) (not e!751062))))

(assert (=> b!1316568 (= res!873958 (= (getValueByKey!714 (toList!10459 lt!586050) (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun b!1316569 () Bool)

(assert (=> b!1316569 (= e!751062 (contains!8539 (toList!10459 lt!586050) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(assert (= (and d!142509 res!873957) b!1316568))

(assert (= (and b!1316568 res!873958) b!1316569))

(declare-fun m!1204159 () Bool)

(assert (=> d!142509 m!1204159))

(declare-fun m!1204161 () Bool)

(assert (=> d!142509 m!1204161))

(declare-fun m!1204163 () Bool)

(assert (=> d!142509 m!1204163))

(declare-fun m!1204165 () Bool)

(assert (=> d!142509 m!1204165))

(declare-fun m!1204167 () Bool)

(assert (=> b!1316568 m!1204167))

(declare-fun m!1204169 () Bool)

(assert (=> b!1316569 m!1204169))

(assert (=> b!1316374 d!142509))

(declare-fun d!142511 () Bool)

(declare-fun e!751063 () Bool)

(assert (=> d!142511 e!751063))

(declare-fun res!873959 () Bool)

(assert (=> d!142511 (=> res!873959 e!751063)))

(declare-fun lt!586054 () Bool)

(assert (=> d!142511 (= res!873959 (not lt!586054))))

(declare-fun lt!586056 () Bool)

(assert (=> d!142511 (= lt!586054 lt!586056)))

(declare-fun lt!586055 () Unit!43229)

(declare-fun e!751064 () Unit!43229)

(assert (=> d!142511 (= lt!586055 e!751064)))

(declare-fun c!125609 () Bool)

(assert (=> d!142511 (= c!125609 lt!586056)))

(assert (=> d!142511 (= lt!586056 (containsKey!731 (toList!10459 lt!585883) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142511 (= (contains!8536 lt!585883 #b1000000000000000000000000000000000000000000000000000000000000000) lt!586054)))

(declare-fun b!1316570 () Bool)

(declare-fun lt!586057 () Unit!43229)

(assert (=> b!1316570 (= e!751064 lt!586057)))

(assert (=> b!1316570 (= lt!586057 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 lt!585883) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1316570 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585883) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1316571 () Bool)

(declare-fun Unit!43241 () Unit!43229)

(assert (=> b!1316571 (= e!751064 Unit!43241)))

(declare-fun b!1316572 () Bool)

(assert (=> b!1316572 (= e!751063 (isDefined!521 (getValueByKey!714 (toList!10459 lt!585883) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142511 c!125609) b!1316570))

(assert (= (and d!142511 (not c!125609)) b!1316571))

(assert (= (and d!142511 (not res!873959)) b!1316572))

(declare-fun m!1204171 () Bool)

(assert (=> d!142511 m!1204171))

(declare-fun m!1204173 () Bool)

(assert (=> b!1316570 m!1204173))

(declare-fun m!1204175 () Bool)

(assert (=> b!1316570 m!1204175))

(assert (=> b!1316570 m!1204175))

(declare-fun m!1204177 () Bool)

(assert (=> b!1316570 m!1204177))

(assert (=> b!1316572 m!1204175))

(assert (=> b!1316572 m!1204175))

(assert (=> b!1316572 m!1204177))

(assert (=> bm!64631 d!142511))

(declare-fun d!142513 () Bool)

(assert (=> d!142513 (= (apply!1021 lt!585883 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21456 (getValueByKey!714 (toList!10459 lt!585883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37585 () Bool)

(assert (= bs!37585 d!142513))

(assert (=> bs!37585 m!1204039))

(assert (=> bs!37585 m!1204039))

(declare-fun m!1204179 () Bool)

(assert (=> bs!37585 m!1204179))

(assert (=> b!1316322 d!142513))

(declare-fun d!142515 () Bool)

(declare-fun e!751065 () Bool)

(assert (=> d!142515 e!751065))

(declare-fun res!873960 () Bool)

(assert (=> d!142515 (=> (not res!873960) (not e!751065))))

(declare-fun lt!586058 () ListLongMap!20887)

(assert (=> d!142515 (= res!873960 (contains!8536 lt!586058 (_1!11626 (tuple2!23231 lt!585927 zeroValue!1296))))))

(declare-fun lt!586061 () List!30346)

(assert (=> d!142515 (= lt!586058 (ListLongMap!20888 lt!586061))))

(declare-fun lt!586060 () Unit!43229)

(declare-fun lt!586059 () Unit!43229)

(assert (=> d!142515 (= lt!586060 lt!586059)))

(assert (=> d!142515 (= (getValueByKey!714 lt!586061 (_1!11626 (tuple2!23231 lt!585927 zeroValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585927 zeroValue!1296))))))

(assert (=> d!142515 (= lt!586059 (lemmaContainsTupThenGetReturnValue!357 lt!586061 (_1!11626 (tuple2!23231 lt!585927 zeroValue!1296)) (_2!11626 (tuple2!23231 lt!585927 zeroValue!1296))))))

(assert (=> d!142515 (= lt!586061 (insertStrictlySorted!486 (toList!10459 lt!585933) (_1!11626 (tuple2!23231 lt!585927 zeroValue!1296)) (_2!11626 (tuple2!23231 lt!585927 zeroValue!1296))))))

(assert (=> d!142515 (= (+!4529 lt!585933 (tuple2!23231 lt!585927 zeroValue!1296)) lt!586058)))

(declare-fun b!1316573 () Bool)

(declare-fun res!873961 () Bool)

(assert (=> b!1316573 (=> (not res!873961) (not e!751065))))

(assert (=> b!1316573 (= res!873961 (= (getValueByKey!714 (toList!10459 lt!586058) (_1!11626 (tuple2!23231 lt!585927 zeroValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585927 zeroValue!1296)))))))

(declare-fun b!1316574 () Bool)

(assert (=> b!1316574 (= e!751065 (contains!8539 (toList!10459 lt!586058) (tuple2!23231 lt!585927 zeroValue!1296)))))

(assert (= (and d!142515 res!873960) b!1316573))

(assert (= (and b!1316573 res!873961) b!1316574))

(declare-fun m!1204181 () Bool)

(assert (=> d!142515 m!1204181))

(declare-fun m!1204183 () Bool)

(assert (=> d!142515 m!1204183))

(declare-fun m!1204185 () Bool)

(assert (=> d!142515 m!1204185))

(declare-fun m!1204187 () Bool)

(assert (=> d!142515 m!1204187))

(declare-fun m!1204189 () Bool)

(assert (=> b!1316573 m!1204189))

(declare-fun m!1204191 () Bool)

(assert (=> b!1316574 m!1204191))

(assert (=> b!1316375 d!142515))

(declare-fun d!142517 () Bool)

(declare-fun e!751066 () Bool)

(assert (=> d!142517 e!751066))

(declare-fun res!873962 () Bool)

(assert (=> d!142517 (=> (not res!873962) (not e!751066))))

(declare-fun lt!586062 () ListLongMap!20887)

(assert (=> d!142517 (= res!873962 (contains!8536 lt!586062 (_1!11626 (tuple2!23231 lt!585929 minValue!1296))))))

(declare-fun lt!586065 () List!30346)

(assert (=> d!142517 (= lt!586062 (ListLongMap!20888 lt!586065))))

(declare-fun lt!586064 () Unit!43229)

(declare-fun lt!586063 () Unit!43229)

(assert (=> d!142517 (= lt!586064 lt!586063)))

(assert (=> d!142517 (= (getValueByKey!714 lt!586065 (_1!11626 (tuple2!23231 lt!585929 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585929 minValue!1296))))))

(assert (=> d!142517 (= lt!586063 (lemmaContainsTupThenGetReturnValue!357 lt!586065 (_1!11626 (tuple2!23231 lt!585929 minValue!1296)) (_2!11626 (tuple2!23231 lt!585929 minValue!1296))))))

(assert (=> d!142517 (= lt!586065 (insertStrictlySorted!486 (toList!10459 lt!585917) (_1!11626 (tuple2!23231 lt!585929 minValue!1296)) (_2!11626 (tuple2!23231 lt!585929 minValue!1296))))))

(assert (=> d!142517 (= (+!4529 lt!585917 (tuple2!23231 lt!585929 minValue!1296)) lt!586062)))

(declare-fun b!1316575 () Bool)

(declare-fun res!873963 () Bool)

(assert (=> b!1316575 (=> (not res!873963) (not e!751066))))

(assert (=> b!1316575 (= res!873963 (= (getValueByKey!714 (toList!10459 lt!586062) (_1!11626 (tuple2!23231 lt!585929 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585929 minValue!1296)))))))

(declare-fun b!1316576 () Bool)

(assert (=> b!1316576 (= e!751066 (contains!8539 (toList!10459 lt!586062) (tuple2!23231 lt!585929 minValue!1296)))))

(assert (= (and d!142517 res!873962) b!1316575))

(assert (= (and b!1316575 res!873963) b!1316576))

(declare-fun m!1204193 () Bool)

(assert (=> d!142517 m!1204193))

(declare-fun m!1204195 () Bool)

(assert (=> d!142517 m!1204195))

(declare-fun m!1204197 () Bool)

(assert (=> d!142517 m!1204197))

(declare-fun m!1204199 () Bool)

(assert (=> d!142517 m!1204199))

(declare-fun m!1204201 () Bool)

(assert (=> b!1316575 m!1204201))

(declare-fun m!1204203 () Bool)

(assert (=> b!1316576 m!1204203))

(assert (=> b!1316375 d!142517))

(declare-fun d!142519 () Bool)

(assert (=> d!142519 (= (apply!1021 (+!4529 lt!585919 (tuple2!23231 lt!585928 minValue!1296)) lt!585930) (get!21456 (getValueByKey!714 (toList!10459 (+!4529 lt!585919 (tuple2!23231 lt!585928 minValue!1296))) lt!585930)))))

(declare-fun bs!37586 () Bool)

(assert (= bs!37586 d!142519))

(declare-fun m!1204205 () Bool)

(assert (=> bs!37586 m!1204205))

(assert (=> bs!37586 m!1204205))

(declare-fun m!1204207 () Bool)

(assert (=> bs!37586 m!1204207))

(assert (=> b!1316375 d!142519))

(declare-fun d!142521 () Bool)

(assert (=> d!142521 (= (apply!1021 (+!4529 lt!585917 (tuple2!23231 lt!585929 minValue!1296)) lt!585915) (get!21456 (getValueByKey!714 (toList!10459 (+!4529 lt!585917 (tuple2!23231 lt!585929 minValue!1296))) lt!585915)))))

(declare-fun bs!37587 () Bool)

(assert (= bs!37587 d!142521))

(declare-fun m!1204209 () Bool)

(assert (=> bs!37587 m!1204209))

(assert (=> bs!37587 m!1204209))

(declare-fun m!1204211 () Bool)

(assert (=> bs!37587 m!1204211))

(assert (=> b!1316375 d!142521))

(declare-fun d!142523 () Bool)

(assert (=> d!142523 (= (apply!1021 (+!4529 lt!585917 (tuple2!23231 lt!585929 minValue!1296)) lt!585915) (apply!1021 lt!585917 lt!585915))))

(declare-fun lt!586066 () Unit!43229)

(assert (=> d!142523 (= lt!586066 (choose!1953 lt!585917 lt!585929 minValue!1296 lt!585915))))

(declare-fun e!751067 () Bool)

(assert (=> d!142523 e!751067))

(declare-fun res!873964 () Bool)

(assert (=> d!142523 (=> (not res!873964) (not e!751067))))

(assert (=> d!142523 (= res!873964 (contains!8536 lt!585917 lt!585915))))

(assert (=> d!142523 (= (addApplyDifferent!559 lt!585917 lt!585929 minValue!1296 lt!585915) lt!586066)))

(declare-fun b!1316577 () Bool)

(assert (=> b!1316577 (= e!751067 (not (= lt!585915 lt!585929)))))

(assert (= (and d!142523 res!873964) b!1316577))

(assert (=> d!142523 m!1203867))

(declare-fun m!1204213 () Bool)

(assert (=> d!142523 m!1204213))

(assert (=> d!142523 m!1203871))

(assert (=> d!142523 m!1203873))

(assert (=> d!142523 m!1203871))

(declare-fun m!1204215 () Bool)

(assert (=> d!142523 m!1204215))

(assert (=> b!1316375 d!142523))

(declare-fun d!142525 () Bool)

(declare-fun e!751068 () Bool)

(assert (=> d!142525 e!751068))

(declare-fun res!873965 () Bool)

(assert (=> d!142525 (=> (not res!873965) (not e!751068))))

(declare-fun lt!586067 () ListLongMap!20887)

(assert (=> d!142525 (= res!873965 (contains!8536 lt!586067 (_1!11626 (tuple2!23231 lt!585935 zeroValue!1296))))))

(declare-fun lt!586070 () List!30346)

(assert (=> d!142525 (= lt!586067 (ListLongMap!20888 lt!586070))))

(declare-fun lt!586069 () Unit!43229)

(declare-fun lt!586068 () Unit!43229)

(assert (=> d!142525 (= lt!586069 lt!586068)))

(assert (=> d!142525 (= (getValueByKey!714 lt!586070 (_1!11626 (tuple2!23231 lt!585935 zeroValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585935 zeroValue!1296))))))

(assert (=> d!142525 (= lt!586068 (lemmaContainsTupThenGetReturnValue!357 lt!586070 (_1!11626 (tuple2!23231 lt!585935 zeroValue!1296)) (_2!11626 (tuple2!23231 lt!585935 zeroValue!1296))))))

(assert (=> d!142525 (= lt!586070 (insertStrictlySorted!486 (toList!10459 lt!585924) (_1!11626 (tuple2!23231 lt!585935 zeroValue!1296)) (_2!11626 (tuple2!23231 lt!585935 zeroValue!1296))))))

(assert (=> d!142525 (= (+!4529 lt!585924 (tuple2!23231 lt!585935 zeroValue!1296)) lt!586067)))

(declare-fun b!1316578 () Bool)

(declare-fun res!873966 () Bool)

(assert (=> b!1316578 (=> (not res!873966) (not e!751068))))

(assert (=> b!1316578 (= res!873966 (= (getValueByKey!714 (toList!10459 lt!586067) (_1!11626 (tuple2!23231 lt!585935 zeroValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585935 zeroValue!1296)))))))

(declare-fun b!1316579 () Bool)

(assert (=> b!1316579 (= e!751068 (contains!8539 (toList!10459 lt!586067) (tuple2!23231 lt!585935 zeroValue!1296)))))

(assert (= (and d!142525 res!873965) b!1316578))

(assert (= (and b!1316578 res!873966) b!1316579))

(declare-fun m!1204217 () Bool)

(assert (=> d!142525 m!1204217))

(declare-fun m!1204219 () Bool)

(assert (=> d!142525 m!1204219))

(declare-fun m!1204221 () Bool)

(assert (=> d!142525 m!1204221))

(declare-fun m!1204223 () Bool)

(assert (=> d!142525 m!1204223))

(declare-fun m!1204225 () Bool)

(assert (=> b!1316578 m!1204225))

(declare-fun m!1204227 () Bool)

(assert (=> b!1316579 m!1204227))

(assert (=> b!1316375 d!142525))

(declare-fun d!142527 () Bool)

(assert (=> d!142527 (= (apply!1021 lt!585917 lt!585915) (get!21456 (getValueByKey!714 (toList!10459 lt!585917) lt!585915)))))

(declare-fun bs!37588 () Bool)

(assert (= bs!37588 d!142527))

(declare-fun m!1204229 () Bool)

(assert (=> bs!37588 m!1204229))

(assert (=> bs!37588 m!1204229))

(declare-fun m!1204231 () Bool)

(assert (=> bs!37588 m!1204231))

(assert (=> b!1316375 d!142527))

(declare-fun d!142529 () Bool)

(assert (=> d!142529 (= (apply!1021 (+!4529 lt!585919 (tuple2!23231 lt!585928 minValue!1296)) lt!585930) (apply!1021 lt!585919 lt!585930))))

(declare-fun lt!586071 () Unit!43229)

(assert (=> d!142529 (= lt!586071 (choose!1953 lt!585919 lt!585928 minValue!1296 lt!585930))))

(declare-fun e!751069 () Bool)

(assert (=> d!142529 e!751069))

(declare-fun res!873967 () Bool)

(assert (=> d!142529 (=> (not res!873967) (not e!751069))))

(assert (=> d!142529 (= res!873967 (contains!8536 lt!585919 lt!585930))))

(assert (=> d!142529 (= (addApplyDifferent!559 lt!585919 lt!585928 minValue!1296 lt!585930) lt!586071)))

(declare-fun b!1316580 () Bool)

(assert (=> b!1316580 (= e!751069 (not (= lt!585930 lt!585928)))))

(assert (= (and d!142529 res!873967) b!1316580))

(assert (=> d!142529 m!1203861))

(declare-fun m!1204233 () Bool)

(assert (=> d!142529 m!1204233))

(assert (=> d!142529 m!1203857))

(assert (=> d!142529 m!1203859))

(assert (=> d!142529 m!1203857))

(declare-fun m!1204235 () Bool)

(assert (=> d!142529 m!1204235))

(assert (=> b!1316375 d!142529))

(declare-fun d!142531 () Bool)

(assert (=> d!142531 (= (apply!1021 lt!585933 lt!585914) (get!21456 (getValueByKey!714 (toList!10459 lt!585933) lt!585914)))))

(declare-fun bs!37589 () Bool)

(assert (= bs!37589 d!142531))

(declare-fun m!1204237 () Bool)

(assert (=> bs!37589 m!1204237))

(assert (=> bs!37589 m!1204237))

(declare-fun m!1204239 () Bool)

(assert (=> bs!37589 m!1204239))

(assert (=> b!1316375 d!142531))

(declare-fun d!142533 () Bool)

(assert (=> d!142533 (= (apply!1021 (+!4529 lt!585933 (tuple2!23231 lt!585927 zeroValue!1296)) lt!585914) (get!21456 (getValueByKey!714 (toList!10459 (+!4529 lt!585933 (tuple2!23231 lt!585927 zeroValue!1296))) lt!585914)))))

(declare-fun bs!37590 () Bool)

(assert (= bs!37590 d!142533))

(declare-fun m!1204241 () Bool)

(assert (=> bs!37590 m!1204241))

(assert (=> bs!37590 m!1204241))

(declare-fun m!1204243 () Bool)

(assert (=> bs!37590 m!1204243))

(assert (=> b!1316375 d!142533))

(declare-fun d!142535 () Bool)

(declare-fun e!751070 () Bool)

(assert (=> d!142535 e!751070))

(declare-fun res!873968 () Bool)

(assert (=> d!142535 (=> (not res!873968) (not e!751070))))

(declare-fun lt!586072 () ListLongMap!20887)

(assert (=> d!142535 (= res!873968 (contains!8536 lt!586072 (_1!11626 (tuple2!23231 lt!585928 minValue!1296))))))

(declare-fun lt!586075 () List!30346)

(assert (=> d!142535 (= lt!586072 (ListLongMap!20888 lt!586075))))

(declare-fun lt!586074 () Unit!43229)

(declare-fun lt!586073 () Unit!43229)

(assert (=> d!142535 (= lt!586074 lt!586073)))

(assert (=> d!142535 (= (getValueByKey!714 lt!586075 (_1!11626 (tuple2!23231 lt!585928 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585928 minValue!1296))))))

(assert (=> d!142535 (= lt!586073 (lemmaContainsTupThenGetReturnValue!357 lt!586075 (_1!11626 (tuple2!23231 lt!585928 minValue!1296)) (_2!11626 (tuple2!23231 lt!585928 minValue!1296))))))

(assert (=> d!142535 (= lt!586075 (insertStrictlySorted!486 (toList!10459 lt!585919) (_1!11626 (tuple2!23231 lt!585928 minValue!1296)) (_2!11626 (tuple2!23231 lt!585928 minValue!1296))))))

(assert (=> d!142535 (= (+!4529 lt!585919 (tuple2!23231 lt!585928 minValue!1296)) lt!586072)))

(declare-fun b!1316581 () Bool)

(declare-fun res!873969 () Bool)

(assert (=> b!1316581 (=> (not res!873969) (not e!751070))))

(assert (=> b!1316581 (= res!873969 (= (getValueByKey!714 (toList!10459 lt!586072) (_1!11626 (tuple2!23231 lt!585928 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 lt!585928 minValue!1296)))))))

(declare-fun b!1316582 () Bool)

(assert (=> b!1316582 (= e!751070 (contains!8539 (toList!10459 lt!586072) (tuple2!23231 lt!585928 minValue!1296)))))

(assert (= (and d!142535 res!873968) b!1316581))

(assert (= (and b!1316581 res!873969) b!1316582))

(declare-fun m!1204245 () Bool)

(assert (=> d!142535 m!1204245))

(declare-fun m!1204247 () Bool)

(assert (=> d!142535 m!1204247))

(declare-fun m!1204249 () Bool)

(assert (=> d!142535 m!1204249))

(declare-fun m!1204251 () Bool)

(assert (=> d!142535 m!1204251))

(declare-fun m!1204253 () Bool)

(assert (=> b!1316581 m!1204253))

(declare-fun m!1204255 () Bool)

(assert (=> b!1316582 m!1204255))

(assert (=> b!1316375 d!142535))

(declare-fun d!142537 () Bool)

(assert (=> d!142537 (= (apply!1021 lt!585919 lt!585930) (get!21456 (getValueByKey!714 (toList!10459 lt!585919) lt!585930)))))

(declare-fun bs!37591 () Bool)

(assert (= bs!37591 d!142537))

(declare-fun m!1204257 () Bool)

(assert (=> bs!37591 m!1204257))

(assert (=> bs!37591 m!1204257))

(declare-fun m!1204259 () Bool)

(assert (=> bs!37591 m!1204259))

(assert (=> b!1316375 d!142537))

(assert (=> b!1316375 d!142421))

(declare-fun d!142539 () Bool)

(assert (=> d!142539 (contains!8536 (+!4529 lt!585924 (tuple2!23231 lt!585935 zeroValue!1296)) lt!585934)))

(declare-fun lt!586076 () Unit!43229)

(assert (=> d!142539 (= lt!586076 (choose!1952 lt!585924 lt!585935 zeroValue!1296 lt!585934))))

(assert (=> d!142539 (contains!8536 lt!585924 lt!585934)))

(assert (=> d!142539 (= (addStillContains!1116 lt!585924 lt!585935 zeroValue!1296 lt!585934) lt!586076)))

(declare-fun bs!37592 () Bool)

(assert (= bs!37592 d!142539))

(assert (=> bs!37592 m!1203847))

(assert (=> bs!37592 m!1203847))

(assert (=> bs!37592 m!1203849))

(declare-fun m!1204261 () Bool)

(assert (=> bs!37592 m!1204261))

(declare-fun m!1204263 () Bool)

(assert (=> bs!37592 m!1204263))

(assert (=> b!1316375 d!142539))

(declare-fun d!142541 () Bool)

(assert (=> d!142541 (= (apply!1021 (+!4529 lt!585933 (tuple2!23231 lt!585927 zeroValue!1296)) lt!585914) (apply!1021 lt!585933 lt!585914))))

(declare-fun lt!586077 () Unit!43229)

(assert (=> d!142541 (= lt!586077 (choose!1953 lt!585933 lt!585927 zeroValue!1296 lt!585914))))

(declare-fun e!751071 () Bool)

(assert (=> d!142541 e!751071))

(declare-fun res!873970 () Bool)

(assert (=> d!142541 (=> (not res!873970) (not e!751071))))

(assert (=> d!142541 (= res!873970 (contains!8536 lt!585933 lt!585914))))

(assert (=> d!142541 (= (addApplyDifferent!559 lt!585933 lt!585927 zeroValue!1296 lt!585914) lt!586077)))

(declare-fun b!1316583 () Bool)

(assert (=> b!1316583 (= e!751071 (not (= lt!585914 lt!585927)))))

(assert (= (and d!142541 res!873970) b!1316583))

(assert (=> d!142541 m!1203863))

(declare-fun m!1204265 () Bool)

(assert (=> d!142541 m!1204265))

(assert (=> d!142541 m!1203853))

(assert (=> d!142541 m!1203855))

(assert (=> d!142541 m!1203853))

(declare-fun m!1204267 () Bool)

(assert (=> d!142541 m!1204267))

(assert (=> b!1316375 d!142541))

(declare-fun d!142543 () Bool)

(declare-fun e!751072 () Bool)

(assert (=> d!142543 e!751072))

(declare-fun res!873971 () Bool)

(assert (=> d!142543 (=> res!873971 e!751072)))

(declare-fun lt!586078 () Bool)

(assert (=> d!142543 (= res!873971 (not lt!586078))))

(declare-fun lt!586080 () Bool)

(assert (=> d!142543 (= lt!586078 lt!586080)))

(declare-fun lt!586079 () Unit!43229)

(declare-fun e!751073 () Unit!43229)

(assert (=> d!142543 (= lt!586079 e!751073)))

(declare-fun c!125610 () Bool)

(assert (=> d!142543 (= c!125610 lt!586080)))

(assert (=> d!142543 (= lt!586080 (containsKey!731 (toList!10459 (+!4529 lt!585924 (tuple2!23231 lt!585935 zeroValue!1296))) lt!585934))))

(assert (=> d!142543 (= (contains!8536 (+!4529 lt!585924 (tuple2!23231 lt!585935 zeroValue!1296)) lt!585934) lt!586078)))

(declare-fun b!1316584 () Bool)

(declare-fun lt!586081 () Unit!43229)

(assert (=> b!1316584 (= e!751073 lt!586081)))

(assert (=> b!1316584 (= lt!586081 (lemmaContainsKeyImpliesGetValueByKeyDefined!478 (toList!10459 (+!4529 lt!585924 (tuple2!23231 lt!585935 zeroValue!1296))) lt!585934))))

(assert (=> b!1316584 (isDefined!521 (getValueByKey!714 (toList!10459 (+!4529 lt!585924 (tuple2!23231 lt!585935 zeroValue!1296))) lt!585934))))

(declare-fun b!1316585 () Bool)

(declare-fun Unit!43242 () Unit!43229)

(assert (=> b!1316585 (= e!751073 Unit!43242)))

(declare-fun b!1316586 () Bool)

(assert (=> b!1316586 (= e!751072 (isDefined!521 (getValueByKey!714 (toList!10459 (+!4529 lt!585924 (tuple2!23231 lt!585935 zeroValue!1296))) lt!585934)))))

(assert (= (and d!142543 c!125610) b!1316584))

(assert (= (and d!142543 (not c!125610)) b!1316585))

(assert (= (and d!142543 (not res!873971)) b!1316586))

(declare-fun m!1204269 () Bool)

(assert (=> d!142543 m!1204269))

(declare-fun m!1204271 () Bool)

(assert (=> b!1316584 m!1204271))

(declare-fun m!1204273 () Bool)

(assert (=> b!1316584 m!1204273))

(assert (=> b!1316584 m!1204273))

(declare-fun m!1204275 () Bool)

(assert (=> b!1316584 m!1204275))

(assert (=> b!1316586 m!1204273))

(assert (=> b!1316586 m!1204273))

(assert (=> b!1316586 m!1204275))

(assert (=> b!1316375 d!142543))

(declare-fun d!142545 () Bool)

(assert (=> d!142545 (= (apply!1021 lt!585918 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21456 (getValueByKey!714 (toList!10459 lt!585918) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37593 () Bool)

(assert (= bs!37593 d!142545))

(assert (=> bs!37593 m!1203953))

(assert (=> bs!37593 m!1203953))

(declare-fun m!1204277 () Bool)

(assert (=> bs!37593 m!1204277))

(assert (=> b!1316372 d!142545))

(assert (=> b!1316359 d!142461))

(assert (=> b!1316359 d!142463))

(assert (=> d!142401 d!142403))

(declare-fun d!142547 () Bool)

(assert (=> d!142547 (= (apply!1021 lt!585883 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21456 (getValueByKey!714 (toList!10459 lt!585883) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37594 () Bool)

(assert (= bs!37594 d!142547))

(assert (=> bs!37594 m!1204175))

(assert (=> bs!37594 m!1204175))

(declare-fun m!1204279 () Bool)

(assert (=> bs!37594 m!1204279))

(assert (=> b!1316334 d!142547))

(declare-fun d!142549 () Bool)

(declare-fun e!751074 () Bool)

(assert (=> d!142549 e!751074))

(declare-fun res!873972 () Bool)

(assert (=> d!142549 (=> (not res!873972) (not e!751074))))

(declare-fun lt!586082 () ListLongMap!20887)

(assert (=> d!142549 (= res!873972 (contains!8536 lt!586082 (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(declare-fun lt!586085 () List!30346)

(assert (=> d!142549 (= lt!586082 (ListLongMap!20888 lt!586085))))

(declare-fun lt!586084 () Unit!43229)

(declare-fun lt!586083 () Unit!43229)

(assert (=> d!142549 (= lt!586084 lt!586083)))

(assert (=> d!142549 (= (getValueByKey!714 lt!586085 (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142549 (= lt!586083 (lemmaContainsTupThenGetReturnValue!357 lt!586085 (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142549 (= lt!586085 (insertStrictlySorted!486 (toList!10459 call!64630) (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) (_2!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))))))

(assert (=> d!142549 (= (+!4529 call!64630 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)) lt!586082)))

(declare-fun b!1316587 () Bool)

(declare-fun res!873973 () Bool)

(assert (=> b!1316587 (=> (not res!873973) (not e!751074))))

(assert (=> b!1316587 (= res!873973 (= (getValueByKey!714 (toList!10459 lt!586082) (_1!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296))) (Some!764 (_2!11626 (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))))

(declare-fun b!1316588 () Bool)

(assert (=> b!1316588 (= e!751074 (contains!8539 (toList!10459 lt!586082) (tuple2!23231 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1296)))))

(assert (= (and d!142549 res!873972) b!1316587))

(assert (= (and b!1316587 res!873973) b!1316588))

(declare-fun m!1204281 () Bool)

(assert (=> d!142549 m!1204281))

(declare-fun m!1204283 () Bool)

(assert (=> d!142549 m!1204283))

(declare-fun m!1204285 () Bool)

(assert (=> d!142549 m!1204285))

(declare-fun m!1204287 () Bool)

(assert (=> d!142549 m!1204287))

(declare-fun m!1204289 () Bool)

(assert (=> b!1316587 m!1204289))

(declare-fun m!1204291 () Bool)

(assert (=> b!1316588 m!1204291))

(assert (=> b!1316336 d!142549))

(declare-fun b!1316589 () Bool)

(declare-fun e!751075 () Bool)

(assert (=> b!1316589 (= e!751075 tp_is_empty!35731)))

(declare-fun condMapEmpty!55235 () Bool)

(declare-fun mapDefault!55235 () ValueCell!16967)

(assert (=> mapNonEmpty!55234 (= condMapEmpty!55235 (= mapRest!55234 ((as const (Array (_ BitVec 32) ValueCell!16967)) mapDefault!55235)))))

(declare-fun e!751076 () Bool)

(declare-fun mapRes!55235 () Bool)

(assert (=> mapNonEmpty!55234 (= tp!105341 (and e!751076 mapRes!55235))))

(declare-fun b!1316590 () Bool)

(assert (=> b!1316590 (= e!751076 tp_is_empty!35731)))

(declare-fun mapIsEmpty!55235 () Bool)

(assert (=> mapIsEmpty!55235 mapRes!55235))

(declare-fun mapNonEmpty!55235 () Bool)

(declare-fun tp!105342 () Bool)

(assert (=> mapNonEmpty!55235 (= mapRes!55235 (and tp!105342 e!751075))))

(declare-fun mapKey!55235 () (_ BitVec 32))

(declare-fun mapRest!55235 () (Array (_ BitVec 32) ValueCell!16967))

(declare-fun mapValue!55235 () ValueCell!16967)

(assert (=> mapNonEmpty!55235 (= mapRest!55234 (store mapRest!55235 mapKey!55235 mapValue!55235))))

(assert (= (and mapNonEmpty!55234 condMapEmpty!55235) mapIsEmpty!55235))

(assert (= (and mapNonEmpty!55234 (not condMapEmpty!55235)) mapNonEmpty!55235))

(assert (= (and mapNonEmpty!55235 ((_ is ValueCellFull!16967) mapValue!55235)) b!1316589))

(assert (= (and mapNonEmpty!55234 ((_ is ValueCellFull!16967) mapDefault!55235)) b!1316590))

(declare-fun m!1204293 () Bool)

(assert (=> mapNonEmpty!55235 m!1204293))

(declare-fun b_lambda!23369 () Bool)

(assert (= b_lambda!23363 (or (and start!111166 b_free!30001) b_lambda!23369)))

(declare-fun b_lambda!23371 () Bool)

(assert (= b_lambda!23367 (or (and start!111166 b_free!30001) b_lambda!23371)))

(declare-fun b_lambda!23373 () Bool)

(assert (= b_lambda!23361 (or (and start!111166 b_free!30001) b_lambda!23373)))

(declare-fun b_lambda!23375 () Bool)

(assert (= b_lambda!23365 (or (and start!111166 b_free!30001) b_lambda!23375)))

(check-sat tp_is_empty!35731 (not b!1316537) (not d!142441) (not b!1316541) (not d!142507) (not d!142535) (not b_lambda!23371) (not d!142505) (not b!1316555) (not d!142431) (not b!1316532) (not d!142545) (not b!1316529) (not d!142423) (not b!1316586) (not d!142471) (not d!142497) (not d!142511) (not b!1316449) (not b!1316557) (not b!1316437) (not d!142517) (not b!1316476) (not d!142495) (not b!1316481) (not b!1316566) (not b!1316512) (not b!1316575) (not b!1316582) (not b!1316448) (not b!1316432) (not d!142521) (not bm!64650) (not d!142489) (not d!142531) (not b!1316433) (not d!142459) (not b!1316435) (not b!1316484) (not d!142533) (not b!1316587) (not d!142439) (not b_lambda!23373) (not b!1316431) (not d!142483) (not d!142435) (not d!142525) (not b!1316574) (not b_lambda!23369) (not b!1316552) (not bm!64647) (not d!142421) (not d!142527) (not d!142529) (not b!1316485) (not d!142499) (not d!142543) (not d!142449) (not d!142485) (not d!142509) (not b!1316522) (not b!1316528) (not b!1316498) (not b!1316573) b_and!48207 (not d!142457) (not b!1316438) (not b!1316474) (not b!1316477) (not b!1316539) (not b!1316447) (not b!1316472) (not b!1316488) (not b_next!30001) (not d!142491) (not b!1316479) (not b!1316482) (not b!1316569) (not b!1316406) (not b!1316548) (not b!1316441) (not b!1316570) (not d!142437) (not b!1316453) (not d!142461) (not d!142519) (not b!1316546) (not b!1316568) (not b!1316549) (not b!1316475) (not bm!64649) (not bm!64648) (not b!1316550) (not d!142541) (not b_lambda!23357) (not b!1316440) (not b!1316534) (not b!1316553) (not d!142547) (not b!1316445) (not d!142539) (not b!1316489) (not d!142479) (not d!142465) (not b!1316470) (not d!142419) (not d!142443) (not b!1316491) (not d!142493) (not b!1316556) (not d!142537) (not mapNonEmpty!55235) (not b_lambda!23359) (not b!1316547) (not d!142503) (not d!142481) (not d!142467) (not b!1316554) (not d!142501) (not b!1316471) (not b!1316576) (not b!1316565) (not d!142513) (not d!142549) (not b!1316558) (not b!1316487) (not d!142523) (not b!1316443) (not b!1316404) (not d!142429) (not d!142453) (not b!1316588) (not b!1316579) (not d!142475) (not b_lambda!23375) (not b!1316578) (not b!1316572) (not b!1316581) (not b!1316584) (not b!1316464) (not d!142515) (not d!142487) (not b!1316536))
(check-sat b_and!48207 (not b_next!30001))
