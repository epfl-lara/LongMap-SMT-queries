; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33520 () Bool)

(assert start!33520)

(declare-fun b_free!6823 () Bool)

(declare-fun b_next!6823 () Bool)

(assert (=> start!33520 (= b_free!6823 (not b_next!6823))))

(declare-fun tp!23964 () Bool)

(declare-fun b_and!13971 () Bool)

(assert (=> start!33520 (= tp!23964 b_and!13971)))

(declare-fun e!204198 () Bool)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3127 0))(
  ( (MissingZero!3127 (index!14687 (_ BitVec 32))) (Found!3127 (index!14688 (_ BitVec 32))) (Intermediate!3127 (undefined!3939 Bool) (index!14689 (_ BitVec 32)) (x!33146 (_ BitVec 32))) (Undefined!3127) (MissingVacant!3127 (index!14690 (_ BitVec 32))) )
))
(declare-fun lt!158814 () SeekEntryResult!3127)

(declare-datatypes ((array!17127 0))(
  ( (array!17128 (arr!8097 (Array (_ BitVec 32) (_ BitVec 64))) (size!8450 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17127)

(declare-fun b!332550 () Bool)

(get-info :version)

(assert (=> b!332550 (= e!204198 (and ((_ is Found!3127) lt!158814) (= (select (arr!8097 _keys!1895) (index!14688 lt!158814)) k0!1348) (bvslt (index!14688 lt!158814) #b00000000000000000000000000000000)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17127 (_ BitVec 32)) SeekEntryResult!3127)

(assert (=> b!332550 (= lt!158814 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!332551 () Bool)

(declare-fun res!183248 () Bool)

(assert (=> b!332551 (=> (not res!183248) (not e!204198))))

(declare-datatypes ((List!4576 0))(
  ( (Nil!4573) (Cons!4572 (h!5428 (_ BitVec 64)) (t!9649 List!4576)) )
))
(declare-fun arrayNoDuplicates!0 (array!17127 (_ BitVec 32) List!4576) Bool)

(assert (=> b!332551 (= res!183248 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4573))))

(declare-fun b!332552 () Bool)

(declare-fun res!183250 () Bool)

(assert (=> b!332552 (=> (not res!183250) (not e!204198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!332552 (= res!183250 (validKeyInArray!0 k0!1348))))

(declare-fun b!332553 () Bool)

(declare-fun res!183251 () Bool)

(assert (=> b!332553 (=> (not res!183251) (not e!204198))))

(declare-datatypes ((V!10011 0))(
  ( (V!10012 (val!3432 Int)) )
))
(declare-fun zeroValue!1467 () V!10011)

(declare-datatypes ((ValueCell!3044 0))(
  ( (ValueCellFull!3044 (v!5585 V!10011)) (EmptyCell!3044) )
))
(declare-datatypes ((array!17129 0))(
  ( (array!17130 (arr!8098 (Array (_ BitVec 32) ValueCell!3044)) (size!8451 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17129)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10011)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!4938 0))(
  ( (tuple2!4939 (_1!2480 (_ BitVec 64)) (_2!2480 V!10011)) )
))
(declare-datatypes ((List!4577 0))(
  ( (Nil!4574) (Cons!4573 (h!5429 tuple2!4938) (t!9650 List!4577)) )
))
(declare-datatypes ((ListLongMap!3841 0))(
  ( (ListLongMap!3842 (toList!1936 List!4577)) )
))
(declare-fun contains!1988 (ListLongMap!3841 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1445 (array!17127 array!17129 (_ BitVec 32) (_ BitVec 32) V!10011 V!10011 (_ BitVec 32) Int) ListLongMap!3841)

(assert (=> b!332553 (= res!183251 (not (contains!1988 (getCurrentListMap!1445 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!332554 () Bool)

(declare-fun res!183247 () Bool)

(assert (=> b!332554 (=> (not res!183247) (not e!204198))))

(assert (=> b!332554 (= res!183247 (and (= (size!8451 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8450 _keys!1895) (size!8451 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!183246 () Bool)

(assert (=> start!33520 (=> (not res!183246) (not e!204198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33520 (= res!183246 (validMask!0 mask!2385))))

(assert (=> start!33520 e!204198))

(assert (=> start!33520 true))

(declare-fun tp_is_empty!6775 () Bool)

(assert (=> start!33520 tp_is_empty!6775))

(assert (=> start!33520 tp!23964))

(declare-fun e!204199 () Bool)

(declare-fun array_inv!6044 (array!17129) Bool)

(assert (=> start!33520 (and (array_inv!6044 _values!1525) e!204199)))

(declare-fun array_inv!6045 (array!17127) Bool)

(assert (=> start!33520 (array_inv!6045 _keys!1895)))

(declare-fun b!332555 () Bool)

(declare-fun res!183249 () Bool)

(assert (=> b!332555 (=> (not res!183249) (not e!204198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17127 (_ BitVec 32)) Bool)

(assert (=> b!332555 (= res!183249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11550 () Bool)

(declare-fun mapRes!11550 () Bool)

(assert (=> mapIsEmpty!11550 mapRes!11550))

(declare-fun mapNonEmpty!11550 () Bool)

(declare-fun tp!23963 () Bool)

(declare-fun e!204201 () Bool)

(assert (=> mapNonEmpty!11550 (= mapRes!11550 (and tp!23963 e!204201))))

(declare-fun mapValue!11550 () ValueCell!3044)

(declare-fun mapRest!11550 () (Array (_ BitVec 32) ValueCell!3044))

(declare-fun mapKey!11550 () (_ BitVec 32))

(assert (=> mapNonEmpty!11550 (= (arr!8098 _values!1525) (store mapRest!11550 mapKey!11550 mapValue!11550))))

(declare-fun b!332556 () Bool)

(declare-fun e!204202 () Bool)

(assert (=> b!332556 (= e!204202 tp_is_empty!6775)))

(declare-fun b!332557 () Bool)

(assert (=> b!332557 (= e!204201 tp_is_empty!6775)))

(declare-fun b!332558 () Bool)

(assert (=> b!332558 (= e!204199 (and e!204202 mapRes!11550))))

(declare-fun condMapEmpty!11550 () Bool)

(declare-fun mapDefault!11550 () ValueCell!3044)

(assert (=> b!332558 (= condMapEmpty!11550 (= (arr!8098 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3044)) mapDefault!11550)))))

(assert (= (and start!33520 res!183246) b!332554))

(assert (= (and b!332554 res!183247) b!332555))

(assert (= (and b!332555 res!183249) b!332551))

(assert (= (and b!332551 res!183248) b!332552))

(assert (= (and b!332552 res!183250) b!332553))

(assert (= (and b!332553 res!183251) b!332550))

(assert (= (and b!332558 condMapEmpty!11550) mapIsEmpty!11550))

(assert (= (and b!332558 (not condMapEmpty!11550)) mapNonEmpty!11550))

(assert (= (and mapNonEmpty!11550 ((_ is ValueCellFull!3044) mapValue!11550)) b!332557))

(assert (= (and b!332558 ((_ is ValueCellFull!3044) mapDefault!11550)) b!332556))

(assert (= start!33520 b!332558))

(declare-fun m!336491 () Bool)

(assert (=> b!332553 m!336491))

(assert (=> b!332553 m!336491))

(declare-fun m!336493 () Bool)

(assert (=> b!332553 m!336493))

(declare-fun m!336495 () Bool)

(assert (=> mapNonEmpty!11550 m!336495))

(declare-fun m!336497 () Bool)

(assert (=> b!332552 m!336497))

(declare-fun m!336499 () Bool)

(assert (=> b!332550 m!336499))

(declare-fun m!336501 () Bool)

(assert (=> b!332550 m!336501))

(declare-fun m!336503 () Bool)

(assert (=> b!332551 m!336503))

(declare-fun m!336505 () Bool)

(assert (=> b!332555 m!336505))

(declare-fun m!336507 () Bool)

(assert (=> start!33520 m!336507))

(declare-fun m!336509 () Bool)

(assert (=> start!33520 m!336509))

(declare-fun m!336511 () Bool)

(assert (=> start!33520 m!336511))

(check-sat (not start!33520) b_and!13971 (not b_next!6823) (not b!332555) tp_is_empty!6775 (not b!332553) (not b!332552) (not b!332550) (not mapNonEmpty!11550) (not b!332551))
(check-sat b_and!13971 (not b_next!6823))
(get-model)

(declare-fun d!70337 () Bool)

(assert (=> d!70337 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332552 d!70337))

(declare-fun d!70339 () Bool)

(declare-fun e!204238 () Bool)

(assert (=> d!70339 e!204238))

(declare-fun res!183290 () Bool)

(assert (=> d!70339 (=> res!183290 e!204238)))

(declare-fun lt!158829 () Bool)

(assert (=> d!70339 (= res!183290 (not lt!158829))))

(declare-fun lt!158830 () Bool)

(assert (=> d!70339 (= lt!158829 lt!158830)))

(declare-datatypes ((Unit!10338 0))(
  ( (Unit!10339) )
))
(declare-fun lt!158831 () Unit!10338)

(declare-fun e!204237 () Unit!10338)

(assert (=> d!70339 (= lt!158831 e!204237)))

(declare-fun c!52016 () Bool)

(assert (=> d!70339 (= c!52016 lt!158830)))

(declare-fun containsKey!311 (List!4577 (_ BitVec 64)) Bool)

(assert (=> d!70339 (= lt!158830 (containsKey!311 (toList!1936 (getCurrentListMap!1445 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70339 (= (contains!1988 (getCurrentListMap!1445 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!158829)))

(declare-fun b!332619 () Bool)

(declare-fun lt!158832 () Unit!10338)

(assert (=> b!332619 (= e!204237 lt!158832)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!260 (List!4577 (_ BitVec 64)) Unit!10338)

(assert (=> b!332619 (= lt!158832 (lemmaContainsKeyImpliesGetValueByKeyDefined!260 (toList!1936 (getCurrentListMap!1445 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!325 0))(
  ( (Some!324 (v!5588 V!10011)) (None!323) )
))
(declare-fun isDefined!261 (Option!325) Bool)

(declare-fun getValueByKey!319 (List!4577 (_ BitVec 64)) Option!325)

(assert (=> b!332619 (isDefined!261 (getValueByKey!319 (toList!1936 (getCurrentListMap!1445 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!332620 () Bool)

(declare-fun Unit!10340 () Unit!10338)

(assert (=> b!332620 (= e!204237 Unit!10340)))

(declare-fun b!332621 () Bool)

(assert (=> b!332621 (= e!204238 (isDefined!261 (getValueByKey!319 (toList!1936 (getCurrentListMap!1445 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70339 c!52016) b!332619))

(assert (= (and d!70339 (not c!52016)) b!332620))

(assert (= (and d!70339 (not res!183290)) b!332621))

(declare-fun m!336557 () Bool)

(assert (=> d!70339 m!336557))

(declare-fun m!336559 () Bool)

(assert (=> b!332619 m!336559))

(declare-fun m!336561 () Bool)

(assert (=> b!332619 m!336561))

(assert (=> b!332619 m!336561))

(declare-fun m!336563 () Bool)

(assert (=> b!332619 m!336563))

(assert (=> b!332621 m!336561))

(assert (=> b!332621 m!336561))

(assert (=> b!332621 m!336563))

(assert (=> b!332553 d!70339))

(declare-fun b!332664 () Bool)

(declare-fun e!204274 () Bool)

(assert (=> b!332664 (= e!204274 (validKeyInArray!0 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332665 () Bool)

(declare-fun e!204269 () Unit!10338)

(declare-fun lt!158898 () Unit!10338)

(assert (=> b!332665 (= e!204269 lt!158898)))

(declare-fun lt!158897 () ListLongMap!3841)

(declare-fun getCurrentListMapNoExtraKeys!579 (array!17127 array!17129 (_ BitVec 32) (_ BitVec 32) V!10011 V!10011 (_ BitVec 32) Int) ListLongMap!3841)

(assert (=> b!332665 (= lt!158897 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!158883 () (_ BitVec 64))

(assert (=> b!332665 (= lt!158883 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158893 () (_ BitVec 64))

(assert (=> b!332665 (= lt!158893 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!158896 () Unit!10338)

(declare-fun addStillContains!239 (ListLongMap!3841 (_ BitVec 64) V!10011 (_ BitVec 64)) Unit!10338)

(assert (=> b!332665 (= lt!158896 (addStillContains!239 lt!158897 lt!158883 zeroValue!1467 lt!158893))))

(declare-fun +!716 (ListLongMap!3841 tuple2!4938) ListLongMap!3841)

(assert (=> b!332665 (contains!1988 (+!716 lt!158897 (tuple2!4939 lt!158883 zeroValue!1467)) lt!158893)))

(declare-fun lt!158889 () Unit!10338)

(assert (=> b!332665 (= lt!158889 lt!158896)))

(declare-fun lt!158888 () ListLongMap!3841)

(assert (=> b!332665 (= lt!158888 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!158894 () (_ BitVec 64))

(assert (=> b!332665 (= lt!158894 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158884 () (_ BitVec 64))

(assert (=> b!332665 (= lt!158884 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!158891 () Unit!10338)

(declare-fun addApplyDifferent!239 (ListLongMap!3841 (_ BitVec 64) V!10011 (_ BitVec 64)) Unit!10338)

(assert (=> b!332665 (= lt!158891 (addApplyDifferent!239 lt!158888 lt!158894 minValue!1467 lt!158884))))

(declare-fun apply!263 (ListLongMap!3841 (_ BitVec 64)) V!10011)

(assert (=> b!332665 (= (apply!263 (+!716 lt!158888 (tuple2!4939 lt!158894 minValue!1467)) lt!158884) (apply!263 lt!158888 lt!158884))))

(declare-fun lt!158887 () Unit!10338)

(assert (=> b!332665 (= lt!158887 lt!158891)))

(declare-fun lt!158877 () ListLongMap!3841)

(assert (=> b!332665 (= lt!158877 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!158890 () (_ BitVec 64))

(assert (=> b!332665 (= lt!158890 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158882 () (_ BitVec 64))

(assert (=> b!332665 (= lt!158882 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!158886 () Unit!10338)

(assert (=> b!332665 (= lt!158886 (addApplyDifferent!239 lt!158877 lt!158890 zeroValue!1467 lt!158882))))

(assert (=> b!332665 (= (apply!263 (+!716 lt!158877 (tuple2!4939 lt!158890 zeroValue!1467)) lt!158882) (apply!263 lt!158877 lt!158882))))

(declare-fun lt!158879 () Unit!10338)

(assert (=> b!332665 (= lt!158879 lt!158886)))

(declare-fun lt!158885 () ListLongMap!3841)

(assert (=> b!332665 (= lt!158885 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!158892 () (_ BitVec 64))

(assert (=> b!332665 (= lt!158892 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158881 () (_ BitVec 64))

(assert (=> b!332665 (= lt!158881 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!332665 (= lt!158898 (addApplyDifferent!239 lt!158885 lt!158892 minValue!1467 lt!158881))))

(assert (=> b!332665 (= (apply!263 (+!716 lt!158885 (tuple2!4939 lt!158892 minValue!1467)) lt!158881) (apply!263 lt!158885 lt!158881))))

(declare-fun b!332666 () Bool)

(declare-fun res!183310 () Bool)

(declare-fun e!204266 () Bool)

(assert (=> b!332666 (=> (not res!183310) (not e!204266))))

(declare-fun e!204276 () Bool)

(assert (=> b!332666 (= res!183310 e!204276)))

(declare-fun c!52031 () Bool)

(assert (=> b!332666 (= c!52031 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!332667 () Bool)

(declare-fun e!204271 () Bool)

(declare-fun e!204268 () Bool)

(assert (=> b!332667 (= e!204271 e!204268)))

(declare-fun res!183309 () Bool)

(assert (=> b!332667 (=> (not res!183309) (not e!204268))))

(declare-fun lt!158878 () ListLongMap!3841)

(assert (=> b!332667 (= res!183309 (contains!1988 lt!158878 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!332667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8450 _keys!1895)))))

(declare-fun b!332668 () Bool)

(declare-fun e!204272 () Bool)

(declare-fun call!26207 () Bool)

(assert (=> b!332668 (= e!204272 (not call!26207))))

(declare-fun b!332669 () Bool)

(declare-fun Unit!10341 () Unit!10338)

(assert (=> b!332669 (= e!204269 Unit!10341)))

(declare-fun bm!26201 () Bool)

(declare-fun call!26205 () ListLongMap!3841)

(declare-fun call!26210 () ListLongMap!3841)

(assert (=> bm!26201 (= call!26205 call!26210)))

(declare-fun b!332670 () Bool)

(declare-fun call!26204 () Bool)

(assert (=> b!332670 (= e!204276 (not call!26204))))

(declare-fun bm!26202 () Bool)

(assert (=> bm!26202 (= call!26207 (contains!1988 lt!158878 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!332671 () Bool)

(declare-fun e!204277 () Bool)

(assert (=> b!332671 (= e!204277 (= (apply!263 lt!158878 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!332672 () Bool)

(declare-fun get!4461 (ValueCell!3044 V!10011) V!10011)

(declare-fun dynLambda!597 (Int (_ BitVec 64)) V!10011)

(assert (=> b!332672 (= e!204268 (= (apply!263 lt!158878 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000)) (get!4461 (select (arr!8098 _values!1525) #b00000000000000000000000000000000) (dynLambda!597 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!332672 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8451 _values!1525)))))

(assert (=> b!332672 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8450 _keys!1895)))))

(declare-fun b!332673 () Bool)

(assert (=> b!332673 (= e!204266 e!204272)))

(declare-fun c!52030 () Bool)

(assert (=> b!332673 (= c!52030 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26203 () Bool)

(declare-fun call!26206 () ListLongMap!3841)

(declare-fun call!26208 () ListLongMap!3841)

(assert (=> bm!26203 (= call!26206 call!26208)))

(declare-fun b!332674 () Bool)

(declare-fun res!183315 () Bool)

(assert (=> b!332674 (=> (not res!183315) (not e!204266))))

(assert (=> b!332674 (= res!183315 e!204271)))

(declare-fun res!183312 () Bool)

(assert (=> b!332674 (=> res!183312 e!204271)))

(declare-fun e!204270 () Bool)

(assert (=> b!332674 (= res!183312 (not e!204270))))

(declare-fun res!183313 () Bool)

(assert (=> b!332674 (=> (not res!183313) (not e!204270))))

(assert (=> b!332674 (= res!183313 (bvslt #b00000000000000000000000000000000 (size!8450 _keys!1895)))))

(declare-fun call!26209 () ListLongMap!3841)

(declare-fun c!52033 () Bool)

(declare-fun bm!26204 () Bool)

(declare-fun c!52029 () Bool)

(assert (=> bm!26204 (= call!26208 (+!716 (ite c!52033 call!26210 (ite c!52029 call!26205 call!26209)) (ite (or c!52033 c!52029) (tuple2!4939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun d!70341 () Bool)

(assert (=> d!70341 e!204266))

(declare-fun res!183314 () Bool)

(assert (=> d!70341 (=> (not res!183314) (not e!204266))))

(assert (=> d!70341 (= res!183314 (or (bvsge #b00000000000000000000000000000000 (size!8450 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8450 _keys!1895)))))))

(declare-fun lt!158880 () ListLongMap!3841)

(assert (=> d!70341 (= lt!158878 lt!158880)))

(declare-fun lt!158895 () Unit!10338)

(assert (=> d!70341 (= lt!158895 e!204269)))

(declare-fun c!52032 () Bool)

(assert (=> d!70341 (= c!52032 e!204274)))

(declare-fun res!183317 () Bool)

(assert (=> d!70341 (=> (not res!183317) (not e!204274))))

(assert (=> d!70341 (= res!183317 (bvslt #b00000000000000000000000000000000 (size!8450 _keys!1895)))))

(declare-fun e!204275 () ListLongMap!3841)

(assert (=> d!70341 (= lt!158880 e!204275)))

(assert (=> d!70341 (= c!52033 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70341 (validMask!0 mask!2385)))

(assert (=> d!70341 (= (getCurrentListMap!1445 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!158878)))

(declare-fun bm!26205 () Bool)

(assert (=> bm!26205 (= call!26210 (getCurrentListMapNoExtraKeys!579 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!332675 () Bool)

(declare-fun e!204273 () ListLongMap!3841)

(assert (=> b!332675 (= e!204273 call!26206)))

(declare-fun b!332676 () Bool)

(assert (=> b!332676 (= e!204270 (validKeyInArray!0 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26206 () Bool)

(assert (=> bm!26206 (= call!26204 (contains!1988 lt!158878 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!332677 () Bool)

(assert (=> b!332677 (= e!204275 e!204273)))

(assert (=> b!332677 (= c!52029 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!332678 () Bool)

(declare-fun e!204267 () ListLongMap!3841)

(assert (=> b!332678 (= e!204267 call!26209)))

(declare-fun b!332679 () Bool)

(assert (=> b!332679 (= e!204275 (+!716 call!26208 (tuple2!4939 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26207 () Bool)

(assert (=> bm!26207 (= call!26209 call!26205)))

(declare-fun b!332680 () Bool)

(declare-fun e!204265 () Bool)

(assert (=> b!332680 (= e!204272 e!204265)))

(declare-fun res!183316 () Bool)

(assert (=> b!332680 (= res!183316 call!26207)))

(assert (=> b!332680 (=> (not res!183316) (not e!204265))))

(declare-fun b!332681 () Bool)

(declare-fun c!52034 () Bool)

(assert (=> b!332681 (= c!52034 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!332681 (= e!204273 e!204267)))

(declare-fun b!332682 () Bool)

(assert (=> b!332682 (= e!204267 call!26206)))

(declare-fun b!332683 () Bool)

(assert (=> b!332683 (= e!204276 e!204277)))

(declare-fun res!183311 () Bool)

(assert (=> b!332683 (= res!183311 call!26204)))

(assert (=> b!332683 (=> (not res!183311) (not e!204277))))

(declare-fun b!332684 () Bool)

(assert (=> b!332684 (= e!204265 (= (apply!263 lt!158878 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(assert (= (and d!70341 c!52033) b!332679))

(assert (= (and d!70341 (not c!52033)) b!332677))

(assert (= (and b!332677 c!52029) b!332675))

(assert (= (and b!332677 (not c!52029)) b!332681))

(assert (= (and b!332681 c!52034) b!332682))

(assert (= (and b!332681 (not c!52034)) b!332678))

(assert (= (or b!332682 b!332678) bm!26207))

(assert (= (or b!332675 bm!26207) bm!26201))

(assert (= (or b!332675 b!332682) bm!26203))

(assert (= (or b!332679 bm!26201) bm!26205))

(assert (= (or b!332679 bm!26203) bm!26204))

(assert (= (and d!70341 res!183317) b!332664))

(assert (= (and d!70341 c!52032) b!332665))

(assert (= (and d!70341 (not c!52032)) b!332669))

(assert (= (and d!70341 res!183314) b!332674))

(assert (= (and b!332674 res!183313) b!332676))

(assert (= (and b!332674 (not res!183312)) b!332667))

(assert (= (and b!332667 res!183309) b!332672))

(assert (= (and b!332674 res!183315) b!332666))

(assert (= (and b!332666 c!52031) b!332683))

(assert (= (and b!332666 (not c!52031)) b!332670))

(assert (= (and b!332683 res!183311) b!332671))

(assert (= (or b!332683 b!332670) bm!26206))

(assert (= (and b!332666 res!183310) b!332673))

(assert (= (and b!332673 c!52030) b!332680))

(assert (= (and b!332673 (not c!52030)) b!332668))

(assert (= (and b!332680 res!183316) b!332684))

(assert (= (or b!332680 b!332668) bm!26202))

(declare-fun b_lambda!8373 () Bool)

(assert (=> (not b_lambda!8373) (not b!332672)))

(declare-fun t!9655 () Bool)

(declare-fun tb!3033 () Bool)

(assert (=> (and start!33520 (= defaultEntry!1528 defaultEntry!1528) t!9655) tb!3033))

(declare-fun result!5445 () Bool)

(assert (=> tb!3033 (= result!5445 tp_is_empty!6775)))

(assert (=> b!332672 t!9655))

(declare-fun b_and!13977 () Bool)

(assert (= b_and!13971 (and (=> t!9655 result!5445) b_and!13977)))

(declare-fun m!336565 () Bool)

(assert (=> b!332679 m!336565))

(assert (=> d!70341 m!336507))

(declare-fun m!336567 () Bool)

(assert (=> bm!26205 m!336567))

(declare-fun m!336569 () Bool)

(assert (=> bm!26206 m!336569))

(declare-fun m!336571 () Bool)

(assert (=> b!332672 m!336571))

(declare-fun m!336573 () Bool)

(assert (=> b!332672 m!336573))

(assert (=> b!332672 m!336573))

(assert (=> b!332672 m!336571))

(declare-fun m!336575 () Bool)

(assert (=> b!332672 m!336575))

(declare-fun m!336577 () Bool)

(assert (=> b!332672 m!336577))

(declare-fun m!336579 () Bool)

(assert (=> b!332672 m!336579))

(assert (=> b!332672 m!336577))

(assert (=> b!332667 m!336577))

(assert (=> b!332667 m!336577))

(declare-fun m!336581 () Bool)

(assert (=> b!332667 m!336581))

(assert (=> b!332676 m!336577))

(assert (=> b!332676 m!336577))

(declare-fun m!336583 () Bool)

(assert (=> b!332676 m!336583))

(assert (=> b!332664 m!336577))

(assert (=> b!332664 m!336577))

(assert (=> b!332664 m!336583))

(declare-fun m!336585 () Bool)

(assert (=> b!332671 m!336585))

(declare-fun m!336587 () Bool)

(assert (=> b!332684 m!336587))

(declare-fun m!336589 () Bool)

(assert (=> bm!26202 m!336589))

(declare-fun m!336591 () Bool)

(assert (=> bm!26204 m!336591))

(declare-fun m!336593 () Bool)

(assert (=> b!332665 m!336593))

(declare-fun m!336595 () Bool)

(assert (=> b!332665 m!336595))

(assert (=> b!332665 m!336567))

(declare-fun m!336597 () Bool)

(assert (=> b!332665 m!336597))

(declare-fun m!336599 () Bool)

(assert (=> b!332665 m!336599))

(declare-fun m!336601 () Bool)

(assert (=> b!332665 m!336601))

(declare-fun m!336603 () Bool)

(assert (=> b!332665 m!336603))

(declare-fun m!336605 () Bool)

(assert (=> b!332665 m!336605))

(declare-fun m!336607 () Bool)

(assert (=> b!332665 m!336607))

(declare-fun m!336609 () Bool)

(assert (=> b!332665 m!336609))

(declare-fun m!336611 () Bool)

(assert (=> b!332665 m!336611))

(declare-fun m!336613 () Bool)

(assert (=> b!332665 m!336613))

(assert (=> b!332665 m!336597))

(declare-fun m!336615 () Bool)

(assert (=> b!332665 m!336615))

(assert (=> b!332665 m!336601))

(declare-fun m!336617 () Bool)

(assert (=> b!332665 m!336617))

(assert (=> b!332665 m!336577))

(assert (=> b!332665 m!336613))

(declare-fun m!336619 () Bool)

(assert (=> b!332665 m!336619))

(assert (=> b!332665 m!336605))

(declare-fun m!336621 () Bool)

(assert (=> b!332665 m!336621))

(assert (=> b!332553 d!70341))

(declare-fun b!332697 () Bool)

(declare-fun e!204289 () Bool)

(declare-fun call!26213 () Bool)

(assert (=> b!332697 (= e!204289 call!26213)))

(declare-fun bm!26210 () Bool)

(declare-fun c!52037 () Bool)

(assert (=> bm!26210 (= call!26213 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52037 (Cons!4572 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000) Nil!4573) Nil!4573)))))

(declare-fun b!332698 () Bool)

(declare-fun e!204287 () Bool)

(declare-fun contains!1990 (List!4576 (_ BitVec 64)) Bool)

(assert (=> b!332698 (= e!204287 (contains!1990 Nil!4573 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332699 () Bool)

(assert (=> b!332699 (= e!204289 call!26213)))

(declare-fun d!70343 () Bool)

(declare-fun res!183325 () Bool)

(declare-fun e!204288 () Bool)

(assert (=> d!70343 (=> res!183325 e!204288)))

(assert (=> d!70343 (= res!183325 (bvsge #b00000000000000000000000000000000 (size!8450 _keys!1895)))))

(assert (=> d!70343 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4573) e!204288)))

(declare-fun b!332700 () Bool)

(declare-fun e!204286 () Bool)

(assert (=> b!332700 (= e!204288 e!204286)))

(declare-fun res!183326 () Bool)

(assert (=> b!332700 (=> (not res!183326) (not e!204286))))

(assert (=> b!332700 (= res!183326 (not e!204287))))

(declare-fun res!183324 () Bool)

(assert (=> b!332700 (=> (not res!183324) (not e!204287))))

(assert (=> b!332700 (= res!183324 (validKeyInArray!0 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332701 () Bool)

(assert (=> b!332701 (= e!204286 e!204289)))

(assert (=> b!332701 (= c!52037 (validKeyInArray!0 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70343 (not res!183325)) b!332700))

(assert (= (and b!332700 res!183324) b!332698))

(assert (= (and b!332700 res!183326) b!332701))

(assert (= (and b!332701 c!52037) b!332699))

(assert (= (and b!332701 (not c!52037)) b!332697))

(assert (= (or b!332699 b!332697) bm!26210))

(assert (=> bm!26210 m!336577))

(declare-fun m!336623 () Bool)

(assert (=> bm!26210 m!336623))

(assert (=> b!332698 m!336577))

(assert (=> b!332698 m!336577))

(declare-fun m!336625 () Bool)

(assert (=> b!332698 m!336625))

(assert (=> b!332700 m!336577))

(assert (=> b!332700 m!336577))

(assert (=> b!332700 m!336583))

(assert (=> b!332701 m!336577))

(assert (=> b!332701 m!336577))

(assert (=> b!332701 m!336583))

(assert (=> b!332551 d!70343))

(declare-fun b!332710 () Bool)

(declare-fun e!204297 () Bool)

(declare-fun e!204298 () Bool)

(assert (=> b!332710 (= e!204297 e!204298)))

(declare-fun c!52040 () Bool)

(assert (=> b!332710 (= c!52040 (validKeyInArray!0 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!332711 () Bool)

(declare-fun e!204296 () Bool)

(assert (=> b!332711 (= e!204298 e!204296)))

(declare-fun lt!158905 () (_ BitVec 64))

(assert (=> b!332711 (= lt!158905 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!158906 () Unit!10338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17127 (_ BitVec 64) (_ BitVec 32)) Unit!10338)

(assert (=> b!332711 (= lt!158906 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!158905 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!332711 (arrayContainsKey!0 _keys!1895 lt!158905 #b00000000000000000000000000000000)))

(declare-fun lt!158907 () Unit!10338)

(assert (=> b!332711 (= lt!158907 lt!158906)))

(declare-fun res!183331 () Bool)

(assert (=> b!332711 (= res!183331 (= (seekEntryOrOpen!0 (select (arr!8097 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3127 #b00000000000000000000000000000000)))))

(assert (=> b!332711 (=> (not res!183331) (not e!204296))))

(declare-fun d!70345 () Bool)

(declare-fun res!183332 () Bool)

(assert (=> d!70345 (=> res!183332 e!204297)))

(assert (=> d!70345 (= res!183332 (bvsge #b00000000000000000000000000000000 (size!8450 _keys!1895)))))

(assert (=> d!70345 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!204297)))

(declare-fun bm!26213 () Bool)

(declare-fun call!26216 () Bool)

(assert (=> bm!26213 (= call!26216 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!332712 () Bool)

(assert (=> b!332712 (= e!204298 call!26216)))

(declare-fun b!332713 () Bool)

(assert (=> b!332713 (= e!204296 call!26216)))

(assert (= (and d!70345 (not res!183332)) b!332710))

(assert (= (and b!332710 c!52040) b!332711))

(assert (= (and b!332710 (not c!52040)) b!332712))

(assert (= (and b!332711 res!183331) b!332713))

(assert (= (or b!332713 b!332712) bm!26213))

(assert (=> b!332710 m!336577))

(assert (=> b!332710 m!336577))

(assert (=> b!332710 m!336583))

(assert (=> b!332711 m!336577))

(declare-fun m!336627 () Bool)

(assert (=> b!332711 m!336627))

(declare-fun m!336629 () Bool)

(assert (=> b!332711 m!336629))

(assert (=> b!332711 m!336577))

(declare-fun m!336631 () Bool)

(assert (=> b!332711 m!336631))

(declare-fun m!336633 () Bool)

(assert (=> bm!26213 m!336633))

(assert (=> b!332555 d!70345))

(declare-fun b!332726 () Bool)

(declare-fun e!204307 () SeekEntryResult!3127)

(assert (=> b!332726 (= e!204307 Undefined!3127)))

(declare-fun b!332727 () Bool)

(declare-fun e!204305 () SeekEntryResult!3127)

(declare-fun lt!158914 () SeekEntryResult!3127)

(assert (=> b!332727 (= e!204305 (Found!3127 (index!14689 lt!158914)))))

(declare-fun b!332728 () Bool)

(declare-fun e!204306 () SeekEntryResult!3127)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17127 (_ BitVec 32)) SeekEntryResult!3127)

(assert (=> b!332728 (= e!204306 (seekKeyOrZeroReturnVacant!0 (x!33146 lt!158914) (index!14689 lt!158914) (index!14689 lt!158914) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!70347 () Bool)

(declare-fun lt!158916 () SeekEntryResult!3127)

(assert (=> d!70347 (and (or ((_ is Undefined!3127) lt!158916) (not ((_ is Found!3127) lt!158916)) (and (bvsge (index!14688 lt!158916) #b00000000000000000000000000000000) (bvslt (index!14688 lt!158916) (size!8450 _keys!1895)))) (or ((_ is Undefined!3127) lt!158916) ((_ is Found!3127) lt!158916) (not ((_ is MissingZero!3127) lt!158916)) (and (bvsge (index!14687 lt!158916) #b00000000000000000000000000000000) (bvslt (index!14687 lt!158916) (size!8450 _keys!1895)))) (or ((_ is Undefined!3127) lt!158916) ((_ is Found!3127) lt!158916) ((_ is MissingZero!3127) lt!158916) (not ((_ is MissingVacant!3127) lt!158916)) (and (bvsge (index!14690 lt!158916) #b00000000000000000000000000000000) (bvslt (index!14690 lt!158916) (size!8450 _keys!1895)))) (or ((_ is Undefined!3127) lt!158916) (ite ((_ is Found!3127) lt!158916) (= (select (arr!8097 _keys!1895) (index!14688 lt!158916)) k0!1348) (ite ((_ is MissingZero!3127) lt!158916) (= (select (arr!8097 _keys!1895) (index!14687 lt!158916)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3127) lt!158916) (= (select (arr!8097 _keys!1895) (index!14690 lt!158916)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70347 (= lt!158916 e!204307)))

(declare-fun c!52049 () Bool)

(assert (=> d!70347 (= c!52049 (and ((_ is Intermediate!3127) lt!158914) (undefined!3939 lt!158914)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17127 (_ BitVec 32)) SeekEntryResult!3127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70347 (= lt!158914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70347 (validMask!0 mask!2385)))

(assert (=> d!70347 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!158916)))

(declare-fun b!332729 () Bool)

(assert (=> b!332729 (= e!204306 (MissingZero!3127 (index!14689 lt!158914)))))

(declare-fun b!332730 () Bool)

(assert (=> b!332730 (= e!204307 e!204305)))

(declare-fun lt!158915 () (_ BitVec 64))

(assert (=> b!332730 (= lt!158915 (select (arr!8097 _keys!1895) (index!14689 lt!158914)))))

(declare-fun c!52048 () Bool)

(assert (=> b!332730 (= c!52048 (= lt!158915 k0!1348))))

(declare-fun b!332731 () Bool)

(declare-fun c!52047 () Bool)

(assert (=> b!332731 (= c!52047 (= lt!158915 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!332731 (= e!204305 e!204306)))

(assert (= (and d!70347 c!52049) b!332726))

(assert (= (and d!70347 (not c!52049)) b!332730))

(assert (= (and b!332730 c!52048) b!332727))

(assert (= (and b!332730 (not c!52048)) b!332731))

(assert (= (and b!332731 c!52047) b!332729))

(assert (= (and b!332731 (not c!52047)) b!332728))

(declare-fun m!336635 () Bool)

(assert (=> b!332728 m!336635))

(declare-fun m!336637 () Bool)

(assert (=> d!70347 m!336637))

(declare-fun m!336639 () Bool)

(assert (=> d!70347 m!336639))

(declare-fun m!336641 () Bool)

(assert (=> d!70347 m!336641))

(declare-fun m!336643 () Bool)

(assert (=> d!70347 m!336643))

(assert (=> d!70347 m!336641))

(assert (=> d!70347 m!336507))

(declare-fun m!336645 () Bool)

(assert (=> d!70347 m!336645))

(declare-fun m!336647 () Bool)

(assert (=> b!332730 m!336647))

(assert (=> b!332550 d!70347))

(declare-fun d!70349 () Bool)

(assert (=> d!70349 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33520 d!70349))

(declare-fun d!70351 () Bool)

(assert (=> d!70351 (= (array_inv!6044 _values!1525) (bvsge (size!8451 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33520 d!70351))

(declare-fun d!70353 () Bool)

(assert (=> d!70353 (= (array_inv!6045 _keys!1895) (bvsge (size!8450 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33520 d!70353))

(declare-fun b!332739 () Bool)

(declare-fun e!204312 () Bool)

(assert (=> b!332739 (= e!204312 tp_is_empty!6775)))

(declare-fun mapNonEmpty!11559 () Bool)

(declare-fun mapRes!11559 () Bool)

(declare-fun tp!23979 () Bool)

(declare-fun e!204313 () Bool)

(assert (=> mapNonEmpty!11559 (= mapRes!11559 (and tp!23979 e!204313))))

(declare-fun mapKey!11559 () (_ BitVec 32))

(declare-fun mapRest!11559 () (Array (_ BitVec 32) ValueCell!3044))

(declare-fun mapValue!11559 () ValueCell!3044)

(assert (=> mapNonEmpty!11559 (= mapRest!11550 (store mapRest!11559 mapKey!11559 mapValue!11559))))

(declare-fun b!332738 () Bool)

(assert (=> b!332738 (= e!204313 tp_is_empty!6775)))

(declare-fun mapIsEmpty!11559 () Bool)

(assert (=> mapIsEmpty!11559 mapRes!11559))

(declare-fun condMapEmpty!11559 () Bool)

(declare-fun mapDefault!11559 () ValueCell!3044)

(assert (=> mapNonEmpty!11550 (= condMapEmpty!11559 (= mapRest!11550 ((as const (Array (_ BitVec 32) ValueCell!3044)) mapDefault!11559)))))

(assert (=> mapNonEmpty!11550 (= tp!23963 (and e!204312 mapRes!11559))))

(assert (= (and mapNonEmpty!11550 condMapEmpty!11559) mapIsEmpty!11559))

(assert (= (and mapNonEmpty!11550 (not condMapEmpty!11559)) mapNonEmpty!11559))

(assert (= (and mapNonEmpty!11559 ((_ is ValueCellFull!3044) mapValue!11559)) b!332738))

(assert (= (and mapNonEmpty!11550 ((_ is ValueCellFull!3044) mapDefault!11559)) b!332739))

(declare-fun m!336649 () Bool)

(assert (=> mapNonEmpty!11559 m!336649))

(declare-fun b_lambda!8375 () Bool)

(assert (= b_lambda!8373 (or (and start!33520 b_free!6823) b_lambda!8375)))

(check-sat (not b!332664) b_and!13977 (not bm!26205) (not d!70347) (not b!332728) (not b!332621) (not b!332619) (not b!332672) (not b!332667) (not b!332671) (not b!332684) (not bm!26206) (not bm!26204) (not b_next!6823) (not b!332701) (not bm!26210) (not b!332679) (not bm!26202) (not b!332700) (not b!332676) tp_is_empty!6775 (not mapNonEmpty!11559) (not d!70341) (not d!70339) (not b_lambda!8375) (not bm!26213) (not b!332711) (not b!332710) (not b!332665) (not b!332698))
(check-sat b_and!13977 (not b_next!6823))
