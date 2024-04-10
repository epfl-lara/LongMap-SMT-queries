; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89054 () Bool)

(assert start!89054)

(declare-fun b!1021067 () Bool)

(declare-fun b_free!20115 () Bool)

(declare-fun b_next!20115 () Bool)

(assert (=> b!1021067 (= b_free!20115 (not b_next!20115))))

(declare-fun tp!71373 () Bool)

(declare-fun b_and!32303 () Bool)

(assert (=> b!1021067 (= tp!71373 b_and!32303)))

(declare-fun b!1021066 () Bool)

(declare-fun e!574929 () Bool)

(declare-fun tp_is_empty!23835 () Bool)

(assert (=> b!1021066 (= e!574929 tp_is_empty!23835)))

(declare-fun e!574931 () Bool)

(declare-datatypes ((V!36653 0))(
  ( (V!36654 (val!11968 Int)) )
))
(declare-datatypes ((array!63710 0))(
  ( (array!63711 (arr!30669 (Array (_ BitVec 32) (_ BitVec 64))) (size!31180 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11214 0))(
  ( (ValueCellFull!11214 (v!14523 V!36653)) (EmptyCell!11214) )
))
(declare-datatypes ((array!63712 0))(
  ( (array!63713 (arr!30670 (Array (_ BitVec 32) ValueCell!11214)) (size!31181 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5022 0))(
  ( (LongMapFixedSize!5023 (defaultEntry!5863 Int) (mask!29424 (_ BitVec 32)) (extraKeys!5595 (_ BitVec 32)) (zeroValue!5699 V!36653) (minValue!5699 V!36653) (_size!2566 (_ BitVec 32)) (_keys!11008 array!63710) (_values!5886 array!63712) (_vacant!2566 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1096 0))(
  ( (Cell!1097 (v!14524 LongMapFixedSize!5022)) )
))
(declare-datatypes ((LongMap!1096 0))(
  ( (LongMap!1097 (underlying!559 Cell!1096)) )
))
(declare-fun thiss!908 () LongMap!1096)

(declare-fun e!574932 () Bool)

(declare-fun array_inv!23791 (array!63710) Bool)

(declare-fun array_inv!23792 (array!63712) Bool)

(assert (=> b!1021067 (= e!574931 (and tp!71373 tp_is_empty!23835 (array_inv!23791 (_keys!11008 (v!14524 (underlying!559 thiss!908)))) (array_inv!23792 (_values!5886 (v!14524 (underlying!559 thiss!908)))) e!574932))))

(declare-fun b!1021068 () Bool)

(declare-fun mapRes!37164 () Bool)

(assert (=> b!1021068 (= e!574932 (and e!574929 mapRes!37164))))

(declare-fun condMapEmpty!37164 () Bool)

(declare-fun mapDefault!37164 () ValueCell!11214)

(assert (=> b!1021068 (= condMapEmpty!37164 (= (arr!30670 (_values!5886 (v!14524 (underlying!559 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11214)) mapDefault!37164)))))

(declare-fun mapIsEmpty!37164 () Bool)

(assert (=> mapIsEmpty!37164 mapRes!37164))

(declare-fun res!684326 () Bool)

(declare-fun e!574933 () Bool)

(assert (=> start!89054 (=> (not res!684326) (not e!574933))))

(declare-fun valid!1913 (LongMap!1096) Bool)

(assert (=> start!89054 (= res!684326 (valid!1913 thiss!908))))

(assert (=> start!89054 e!574933))

(declare-fun e!574934 () Bool)

(assert (=> start!89054 e!574934))

(assert (=> start!89054 true))

(declare-fun b!1021069 () Bool)

(declare-fun e!574928 () Bool)

(assert (=> b!1021069 (= e!574934 e!574928)))

(declare-fun b!1021070 () Bool)

(assert (=> b!1021070 (= e!574928 e!574931)))

(declare-fun b!1021071 () Bool)

(declare-fun e!574935 () Bool)

(assert (=> b!1021071 (= e!574935 tp_is_empty!23835)))

(declare-fun mapNonEmpty!37164 () Bool)

(declare-fun tp!71374 () Bool)

(assert (=> mapNonEmpty!37164 (= mapRes!37164 (and tp!71374 e!574935))))

(declare-fun mapKey!37164 () (_ BitVec 32))

(declare-fun mapRest!37164 () (Array (_ BitVec 32) ValueCell!11214))

(declare-fun mapValue!37164 () ValueCell!11214)

(assert (=> mapNonEmpty!37164 (= (arr!30670 (_values!5886 (v!14524 (underlying!559 thiss!908)))) (store mapRest!37164 mapKey!37164 mapValue!37164))))

(declare-fun b!1021072 () Bool)

(assert (=> b!1021072 (= e!574933 false)))

(declare-fun lt!449976 () Bool)

(declare-fun key!697 () (_ BitVec 64))

(declare-datatypes ((tuple2!15474 0))(
  ( (tuple2!15475 (_1!7748 Bool) (_2!7748 LongMapFixedSize!5022)) )
))
(declare-fun remove!5 (LongMapFixedSize!5022 (_ BitVec 64)) tuple2!15474)

(assert (=> b!1021072 (= lt!449976 (valid!1913 (LongMap!1097 (Cell!1097 (_2!7748 (remove!5 (v!14524 (underlying!559 thiss!908)) key!697))))))))

(assert (= (and start!89054 res!684326) b!1021072))

(assert (= (and b!1021068 condMapEmpty!37164) mapIsEmpty!37164))

(assert (= (and b!1021068 (not condMapEmpty!37164)) mapNonEmpty!37164))

(get-info :version)

(assert (= (and mapNonEmpty!37164 ((_ is ValueCellFull!11214) mapValue!37164)) b!1021071))

(assert (= (and b!1021068 ((_ is ValueCellFull!11214) mapDefault!37164)) b!1021066))

(assert (= b!1021067 b!1021068))

(assert (= b!1021070 b!1021067))

(assert (= b!1021069 b!1021070))

(assert (= start!89054 b!1021069))

(declare-fun m!940721 () Bool)

(assert (=> b!1021067 m!940721))

(declare-fun m!940723 () Bool)

(assert (=> b!1021067 m!940723))

(declare-fun m!940725 () Bool)

(assert (=> start!89054 m!940725))

(declare-fun m!940727 () Bool)

(assert (=> mapNonEmpty!37164 m!940727))

(declare-fun m!940729 () Bool)

(assert (=> b!1021072 m!940729))

(declare-fun m!940731 () Bool)

(assert (=> b!1021072 m!940731))

(check-sat (not b_next!20115) (not b!1021067) tp_is_empty!23835 (not mapNonEmpty!37164) b_and!32303 (not b!1021072) (not start!89054))
(check-sat b_and!32303 (not b_next!20115))
