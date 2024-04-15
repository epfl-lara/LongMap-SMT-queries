; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89184 () Bool)

(assert start!89184)

(declare-fun b!1022409 () Bool)

(declare-fun b_free!20227 () Bool)

(declare-fun b_next!20227 () Bool)

(assert (=> b!1022409 (= b_free!20227 (not b_next!20227))))

(declare-fun tp!71716 () Bool)

(declare-fun b_and!32411 () Bool)

(assert (=> b!1022409 (= tp!71716 b_and!32411)))

(declare-fun b!1022404 () Bool)

(declare-fun e!575989 () Bool)

(declare-fun e!575986 () Bool)

(declare-fun mapRes!37338 () Bool)

(assert (=> b!1022404 (= e!575989 (and e!575986 mapRes!37338))))

(declare-fun condMapEmpty!37338 () Bool)

(declare-datatypes ((V!36803 0))(
  ( (V!36804 (val!12024 Int)) )
))
(declare-datatypes ((ValueCell!11270 0))(
  ( (ValueCellFull!11270 (v!14592 V!36803)) (EmptyCell!11270) )
))
(declare-datatypes ((array!63877 0))(
  ( (array!63878 (arr!30750 (Array (_ BitVec 32) (_ BitVec 64))) (size!31263 (_ BitVec 32))) )
))
(declare-datatypes ((array!63879 0))(
  ( (array!63880 (arr!30751 (Array (_ BitVec 32) ValueCell!11270)) (size!31264 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5134 0))(
  ( (LongMapFixedSize!5135 (defaultEntry!5919 Int) (mask!29513 (_ BitVec 32)) (extraKeys!5651 (_ BitVec 32)) (zeroValue!5755 V!36803) (minValue!5755 V!36803) (_size!2622 (_ BitVec 32)) (_keys!11060 array!63877) (_values!5942 array!63879) (_vacant!2622 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5134)

(declare-fun mapDefault!37338 () ValueCell!11270)

(assert (=> b!1022404 (= condMapEmpty!37338 (= (arr!30751 (_values!5942 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11270)) mapDefault!37338)))))

(declare-fun b!1022405 () Bool)

(declare-fun e!575987 () Bool)

(assert (=> b!1022405 (= e!575987 (not true))))

(declare-fun lt!450074 () Bool)

(declare-fun lt!450075 () V!36803)

(declare-fun valid!1957 (LongMapFixedSize!5134) Bool)

(assert (=> b!1022405 (= lt!450074 (valid!1957 (LongMapFixedSize!5135 (defaultEntry!5919 thiss!1427) (mask!29513 thiss!1427) (bvand (extraKeys!5651 thiss!1427) #b00000000000000000000000000000010) lt!450075 (minValue!5755 thiss!1427) (_size!2622 thiss!1427) (_keys!11060 thiss!1427) (_values!5942 thiss!1427) (_vacant!2622 thiss!1427))))))

(declare-datatypes ((tuple2!15584 0))(
  ( (tuple2!15585 (_1!7803 (_ BitVec 64)) (_2!7803 V!36803)) )
))
(declare-datatypes ((List!21719 0))(
  ( (Nil!21716) (Cons!21715 (h!22913 tuple2!15584) (t!30738 List!21719)) )
))
(declare-datatypes ((ListLongMap!13717 0))(
  ( (ListLongMap!13718 (toList!6874 List!21719)) )
))
(declare-fun -!466 (ListLongMap!13717 (_ BitVec 64)) ListLongMap!13717)

(declare-fun getCurrentListMap!3841 (array!63877 array!63879 (_ BitVec 32) (_ BitVec 32) V!36803 V!36803 (_ BitVec 32) Int) ListLongMap!13717)

(assert (=> b!1022405 (= (-!466 (getCurrentListMap!3841 (_keys!11060 thiss!1427) (_values!5942 thiss!1427) (mask!29513 thiss!1427) (extraKeys!5651 thiss!1427) (zeroValue!5755 thiss!1427) (minValue!5755 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5919 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3841 (_keys!11060 thiss!1427) (_values!5942 thiss!1427) (mask!29513 thiss!1427) (bvand (extraKeys!5651 thiss!1427) #b00000000000000000000000000000010) lt!450075 (minValue!5755 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5919 thiss!1427)))))

(declare-datatypes ((Unit!33217 0))(
  ( (Unit!33218) )
))
(declare-fun lt!450076 () Unit!33217)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!7 (array!63877 array!63879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36803 V!36803 V!36803 Int) Unit!33217)

(assert (=> b!1022405 (= lt!450076 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!7 (_keys!11060 thiss!1427) (_values!5942 thiss!1427) (mask!29513 thiss!1427) (extraKeys!5651 thiss!1427) (bvand (extraKeys!5651 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5755 thiss!1427) lt!450075 (minValue!5755 thiss!1427) (defaultEntry!5919 thiss!1427)))))

(declare-fun dynLambda!1928 (Int (_ BitVec 64)) V!36803)

(assert (=> b!1022405 (= lt!450075 (dynLambda!1928 (defaultEntry!5919 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1022406 () Bool)

(declare-fun e!575985 () Bool)

(declare-fun tp_is_empty!23947 () Bool)

(assert (=> b!1022406 (= e!575985 tp_is_empty!23947)))

(declare-fun b!1022407 () Bool)

(assert (=> b!1022407 (= e!575986 tp_is_empty!23947)))

(declare-fun mapIsEmpty!37338 () Bool)

(assert (=> mapIsEmpty!37338 mapRes!37338))

(declare-fun res!684901 () Bool)

(assert (=> start!89184 (=> (not res!684901) (not e!575987))))

(assert (=> start!89184 (= res!684901 (valid!1957 thiss!1427))))

(assert (=> start!89184 e!575987))

(declare-fun e!575990 () Bool)

(assert (=> start!89184 e!575990))

(assert (=> start!89184 true))

(declare-fun b!1022408 () Bool)

(declare-fun res!684900 () Bool)

(assert (=> b!1022408 (=> (not res!684900) (not e!575987))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022408 (= res!684900 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!23853 (array!63877) Bool)

(declare-fun array_inv!23854 (array!63879) Bool)

(assert (=> b!1022409 (= e!575990 (and tp!71716 tp_is_empty!23947 (array_inv!23853 (_keys!11060 thiss!1427)) (array_inv!23854 (_values!5942 thiss!1427)) e!575989))))

(declare-fun mapNonEmpty!37338 () Bool)

(declare-fun tp!71715 () Bool)

(assert (=> mapNonEmpty!37338 (= mapRes!37338 (and tp!71715 e!575985))))

(declare-fun mapValue!37338 () ValueCell!11270)

(declare-fun mapRest!37338 () (Array (_ BitVec 32) ValueCell!11270))

(declare-fun mapKey!37338 () (_ BitVec 32))

(assert (=> mapNonEmpty!37338 (= (arr!30751 (_values!5942 thiss!1427)) (store mapRest!37338 mapKey!37338 mapValue!37338))))

(assert (= (and start!89184 res!684901) b!1022408))

(assert (= (and b!1022408 res!684900) b!1022405))

(assert (= (and b!1022404 condMapEmpty!37338) mapIsEmpty!37338))

(assert (= (and b!1022404 (not condMapEmpty!37338)) mapNonEmpty!37338))

(get-info :version)

(assert (= (and mapNonEmpty!37338 ((_ is ValueCellFull!11270) mapValue!37338)) b!1022406))

(assert (= (and b!1022404 ((_ is ValueCellFull!11270) mapDefault!37338)) b!1022407))

(assert (= b!1022409 b!1022404))

(assert (= start!89184 b!1022409))

(declare-fun b_lambda!15661 () Bool)

(assert (=> (not b_lambda!15661) (not b!1022405)))

(declare-fun t!30737 () Bool)

(declare-fun tb!6843 () Bool)

(assert (=> (and b!1022409 (= (defaultEntry!5919 thiss!1427) (defaultEntry!5919 thiss!1427)) t!30737) tb!6843))

(declare-fun result!14003 () Bool)

(assert (=> tb!6843 (= result!14003 tp_is_empty!23947)))

(assert (=> b!1022405 t!30737))

(declare-fun b_and!32413 () Bool)

(assert (= b_and!32411 (and (=> t!30737 result!14003) b_and!32413)))

(declare-fun m!940989 () Bool)

(assert (=> b!1022405 m!940989))

(declare-fun m!940991 () Bool)

(assert (=> b!1022405 m!940991))

(declare-fun m!940993 () Bool)

(assert (=> b!1022405 m!940993))

(declare-fun m!940995 () Bool)

(assert (=> b!1022405 m!940995))

(declare-fun m!940997 () Bool)

(assert (=> b!1022405 m!940997))

(declare-fun m!940999 () Bool)

(assert (=> b!1022405 m!940999))

(assert (=> b!1022405 m!940997))

(declare-fun m!941001 () Bool)

(assert (=> start!89184 m!941001))

(declare-fun m!941003 () Bool)

(assert (=> b!1022409 m!941003))

(declare-fun m!941005 () Bool)

(assert (=> b!1022409 m!941005))

(declare-fun m!941007 () Bool)

(assert (=> mapNonEmpty!37338 m!941007))

(check-sat (not start!89184) (not mapNonEmpty!37338) (not b_lambda!15661) (not b!1022409) tp_is_empty!23947 b_and!32413 (not b!1022405) (not b_next!20227))
(check-sat b_and!32413 (not b_next!20227))
