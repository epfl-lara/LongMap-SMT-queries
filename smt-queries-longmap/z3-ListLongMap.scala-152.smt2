; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2984 () Bool)

(assert start!2984)

(declare-fun b!17268 () Bool)

(declare-fun b_free!591 () Bool)

(declare-fun b_next!591 () Bool)

(assert (=> b!17268 (= b_free!591 (not b_next!591))))

(declare-fun tp!2963 () Bool)

(declare-fun b_and!1239 () Bool)

(assert (=> b!17268 (= tp!2963 b_and!1239)))

(declare-fun mapNonEmpty!717 () Bool)

(declare-fun mapRes!717 () Bool)

(declare-fun tp!2964 () Bool)

(declare-fun e!10768 () Bool)

(assert (=> mapNonEmpty!717 (= mapRes!717 (and tp!2964 e!10768))))

(declare-fun mapKey!717 () (_ BitVec 32))

(declare-datatypes ((V!965 0))(
  ( (V!966 (val!454 Int)) )
))
(declare-datatypes ((ValueCell!228 0))(
  ( (ValueCellFull!228 (v!1412 V!965)) (EmptyCell!228) )
))
(declare-fun mapValue!717 () ValueCell!228)

(declare-datatypes ((array!915 0))(
  ( (array!916 (arr!439 (Array (_ BitVec 32) ValueCell!228)) (size!529 (_ BitVec 32))) )
))
(declare-datatypes ((array!917 0))(
  ( (array!918 (arr!440 (Array (_ BitVec 32) (_ BitVec 64))) (size!530 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!42 0))(
  ( (LongMapFixedSize!43 (defaultEntry!1632 Int) (mask!4545 (_ BitVec 32)) (extraKeys!1545 (_ BitVec 32)) (zeroValue!1568 V!965) (minValue!1568 V!965) (_size!53 (_ BitVec 32)) (_keys!3057 array!917) (_values!1629 array!915) (_vacant!53 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!42 0))(
  ( (Cell!43 (v!1413 LongMapFixedSize!42)) )
))
(declare-datatypes ((LongMap!42 0))(
  ( (LongMap!43 (underlying!32 Cell!42)) )
))
(declare-fun thiss!848 () LongMap!42)

(declare-fun mapRest!717 () (Array (_ BitVec 32) ValueCell!228))

(assert (=> mapNonEmpty!717 (= (arr!439 (_values!1629 (v!1413 (underlying!32 thiss!848)))) (store mapRest!717 mapKey!717 mapValue!717))))

(declare-fun mapIsEmpty!717 () Bool)

(assert (=> mapIsEmpty!717 mapRes!717))

(declare-fun b!17262 () Bool)

(declare-fun e!10764 () Bool)

(declare-fun e!10760 () Bool)

(assert (=> b!17262 (= e!10764 (and e!10760 mapRes!717))))

(declare-fun condMapEmpty!717 () Bool)

(declare-fun mapDefault!717 () ValueCell!228)

(assert (=> b!17262 (= condMapEmpty!717 (= (arr!439 (_values!1629 (v!1413 (underlying!32 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!228)) mapDefault!717)))))

(declare-fun b!17263 () Bool)

(declare-fun e!10767 () Bool)

(declare-fun e!10761 () Bool)

(assert (=> b!17263 (= e!10767 e!10761)))

(declare-fun b!17264 () Bool)

(declare-datatypes ((tuple2!708 0))(
  ( (tuple2!709 (_1!355 Bool) (_2!355 LongMap!42)) )
))
(declare-fun e!10766 () tuple2!708)

(assert (=> b!17264 (= e!10766 (tuple2!709 true thiss!848))))

(declare-fun b!17265 () Bool)

(declare-fun repack!2 (LongMap!42) tuple2!708)

(assert (=> b!17265 (= e!10766 (repack!2 thiss!848))))

(declare-fun b!17266 () Bool)

(declare-fun e!10759 () Bool)

(assert (=> b!17266 (= e!10759 false)))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun lt!4480 () Bool)

(declare-fun lt!4479 () tuple2!708)

(declare-fun v!259 () V!965)

(declare-fun valid!22 (LongMap!42) Bool)

(declare-datatypes ((tuple2!710 0))(
  ( (tuple2!711 (_1!356 Bool) (_2!356 LongMapFixedSize!42)) )
))
(declare-fun update!3 (LongMapFixedSize!42 (_ BitVec 64) V!965) tuple2!710)

(assert (=> b!17266 (= lt!4480 (valid!22 (LongMap!43 (Cell!43 (_2!356 (update!3 (v!1413 (underlying!32 (_2!355 lt!4479))) key!682 v!259))))))))

(declare-fun b!17267 () Bool)

(declare-fun tp_is_empty!855 () Bool)

(assert (=> b!17267 (= e!10768 tp_is_empty!855)))

(declare-fun e!10762 () Bool)

(declare-fun array_inv!307 (array!917) Bool)

(declare-fun array_inv!308 (array!915) Bool)

(assert (=> b!17268 (= e!10762 (and tp!2963 tp_is_empty!855 (array_inv!307 (_keys!3057 (v!1413 (underlying!32 thiss!848)))) (array_inv!308 (_values!1629 (v!1413 (underlying!32 thiss!848)))) e!10764))))

(declare-fun b!17269 () Bool)

(declare-fun e!10763 () Bool)

(assert (=> b!17269 (= e!10763 e!10759)))

(declare-fun res!12531 () Bool)

(assert (=> b!17269 (=> (not res!12531) (not e!10759))))

(assert (=> b!17269 (= res!12531 (_1!355 lt!4479))))

(assert (=> b!17269 (= lt!4479 e!10766)))

(declare-fun c!1735 () Bool)

(declare-fun imbalanced!5 (LongMap!42) Bool)

(assert (=> b!17269 (= c!1735 (imbalanced!5 thiss!848))))

(declare-fun b!17270 () Bool)

(assert (=> b!17270 (= e!10761 e!10762)))

(declare-fun b!17271 () Bool)

(assert (=> b!17271 (= e!10760 tp_is_empty!855)))

(declare-fun res!12532 () Bool)

(assert (=> start!2984 (=> (not res!12532) (not e!10763))))

(assert (=> start!2984 (= res!12532 (valid!22 thiss!848))))

(assert (=> start!2984 e!10763))

(assert (=> start!2984 e!10767))

(assert (=> start!2984 true))

(assert (=> start!2984 tp_is_empty!855))

(assert (= (and start!2984 res!12532) b!17269))

(assert (= (and b!17269 c!1735) b!17265))

(assert (= (and b!17269 (not c!1735)) b!17264))

(assert (= (and b!17269 res!12531) b!17266))

(assert (= (and b!17262 condMapEmpty!717) mapIsEmpty!717))

(assert (= (and b!17262 (not condMapEmpty!717)) mapNonEmpty!717))

(get-info :version)

(assert (= (and mapNonEmpty!717 ((_ is ValueCellFull!228) mapValue!717)) b!17267))

(assert (= (and b!17262 ((_ is ValueCellFull!228) mapDefault!717)) b!17271))

(assert (= b!17268 b!17262))

(assert (= b!17270 b!17268))

(assert (= b!17263 b!17270))

(assert (= start!2984 b!17263))

(declare-fun m!12181 () Bool)

(assert (=> b!17265 m!12181))

(declare-fun m!12183 () Bool)

(assert (=> b!17269 m!12183))

(declare-fun m!12185 () Bool)

(assert (=> b!17268 m!12185))

(declare-fun m!12187 () Bool)

(assert (=> b!17268 m!12187))

(declare-fun m!12189 () Bool)

(assert (=> mapNonEmpty!717 m!12189))

(declare-fun m!12191 () Bool)

(assert (=> start!2984 m!12191))

(declare-fun m!12193 () Bool)

(assert (=> b!17266 m!12193))

(declare-fun m!12195 () Bool)

(assert (=> b!17266 m!12195))

(check-sat (not b_next!591) (not start!2984) (not b!17268) (not b!17266) b_and!1239 (not mapNonEmpty!717) tp_is_empty!855 (not b!17265) (not b!17269))
(check-sat b_and!1239 (not b_next!591))
