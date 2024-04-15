; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2978 () Bool)

(assert start!2978)

(declare-fun b!17272 () Bool)

(declare-fun b_free!595 () Bool)

(declare-fun b_next!595 () Bool)

(assert (=> b!17272 (= b_free!595 (not b_next!595))))

(declare-fun tp!2975 () Bool)

(declare-fun b_and!1237 () Bool)

(assert (=> b!17272 (= tp!2975 b_and!1237)))

(declare-fun b!17266 () Bool)

(declare-fun res!12517 () Bool)

(declare-fun e!10775 () Bool)

(assert (=> b!17266 (=> (not res!12517) (not e!10775))))

(declare-datatypes ((V!971 0))(
  ( (V!972 (val!456 Int)) )
))
(declare-datatypes ((ValueCell!230 0))(
  ( (ValueCellFull!230 (v!1415 V!971)) (EmptyCell!230) )
))
(declare-datatypes ((array!905 0))(
  ( (array!906 (arr!434 (Array (_ BitVec 32) (_ BitVec 64))) (size!524 (_ BitVec 32))) )
))
(declare-datatypes ((array!907 0))(
  ( (array!908 (arr!435 (Array (_ BitVec 32) ValueCell!230)) (size!525 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!46 0))(
  ( (LongMapFixedSize!47 (defaultEntry!1634 Int) (mask!4549 (_ BitVec 32)) (extraKeys!1547 (_ BitVec 32)) (zeroValue!1570 V!971) (minValue!1570 V!971) (_size!55 (_ BitVec 32)) (_keys!3059 array!905) (_values!1631 array!907) (_vacant!55 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!712 0))(
  ( (tuple2!713 (_1!357 Bool) (_2!357 LongMapFixedSize!46)) )
))
(declare-fun lt!4494 () tuple2!712)

(assert (=> b!17266 (= res!12517 (_1!357 lt!4494))))

(declare-fun b!17267 () Bool)

(declare-datatypes ((Cell!46 0))(
  ( (Cell!47 (v!1416 LongMapFixedSize!46)) )
))
(declare-datatypes ((LongMap!46 0))(
  ( (LongMap!47 (underlying!34 Cell!46)) )
))
(declare-datatypes ((tuple2!714 0))(
  ( (tuple2!715 (_1!358 Bool) (_2!358 LongMap!46)) )
))
(declare-fun e!10777 () tuple2!714)

(declare-fun thiss!848 () LongMap!46)

(declare-fun repack!6 (LongMap!46) tuple2!714)

(assert (=> b!17267 (= e!10777 (repack!6 thiss!848))))

(declare-fun b!17268 () Bool)

(declare-fun e!10784 () Bool)

(declare-fun tp_is_empty!859 () Bool)

(assert (=> b!17268 (= e!10784 tp_is_empty!859)))

(declare-fun b!17270 () Bool)

(declare-fun e!10776 () Bool)

(assert (=> b!17270 (= e!10776 tp_is_empty!859)))

(declare-fun b!17271 () Bool)

(assert (=> b!17271 (= e!10777 (tuple2!715 true thiss!848))))

(declare-fun mapIsEmpty!723 () Bool)

(declare-fun mapRes!723 () Bool)

(assert (=> mapIsEmpty!723 mapRes!723))

(declare-fun e!10780 () Bool)

(declare-fun e!10779 () Bool)

(declare-fun array_inv!317 (array!905) Bool)

(declare-fun array_inv!318 (array!907) Bool)

(assert (=> b!17272 (= e!10779 (and tp!2975 tp_is_empty!859 (array_inv!317 (_keys!3059 (v!1416 (underlying!34 thiss!848)))) (array_inv!318 (_values!1631 (v!1416 (underlying!34 thiss!848)))) e!10780))))

(declare-fun b!17273 () Bool)

(assert (=> b!17273 (= e!10775 false)))

(declare-fun lt!4493 () Bool)

(declare-fun lt!4492 () LongMap!46)

(declare-fun key!682 () (_ BitVec 64))

(declare-datatypes ((tuple2!716 0))(
  ( (tuple2!717 (_1!359 (_ BitVec 64)) (_2!359 V!971)) )
))
(declare-datatypes ((List!530 0))(
  ( (Nil!527) (Cons!526 (h!1092 tuple2!716) (t!3162 List!530)) )
))
(declare-datatypes ((ListLongMap!523 0))(
  ( (ListLongMap!524 (toList!277 List!530)) )
))
(declare-fun contains!209 (ListLongMap!523 (_ BitVec 64)) Bool)

(declare-fun map!332 (LongMap!46) ListLongMap!523)

(assert (=> b!17273 (= lt!4493 (contains!209 (map!332 lt!4492) key!682))))

(declare-fun b!17274 () Bool)

(declare-fun e!10778 () Bool)

(assert (=> b!17274 (= e!10778 e!10779)))

(declare-fun b!17275 () Bool)

(declare-fun e!10785 () Bool)

(assert (=> b!17275 (= e!10785 e!10775)))

(declare-fun res!12515 () Bool)

(assert (=> b!17275 (=> (not res!12515) (not e!10775))))

(declare-fun valid!31 (LongMap!46) Bool)

(assert (=> b!17275 (= res!12515 (valid!31 lt!4492))))

(assert (=> b!17275 (= lt!4492 (LongMap!47 (Cell!47 (_2!357 lt!4494))))))

(declare-fun lt!4491 () tuple2!714)

(declare-fun v!259 () V!971)

(declare-fun update!4 (LongMapFixedSize!46 (_ BitVec 64) V!971) tuple2!712)

(assert (=> b!17275 (= lt!4494 (update!4 (v!1416 (underlying!34 (_2!358 lt!4491))) key!682 v!259))))

(declare-fun b!17276 () Bool)

(declare-fun e!10783 () Bool)

(assert (=> b!17276 (= e!10783 e!10785)))

(declare-fun res!12518 () Bool)

(assert (=> b!17276 (=> (not res!12518) (not e!10785))))

(assert (=> b!17276 (= res!12518 (_1!358 lt!4491))))

(assert (=> b!17276 (= lt!4491 e!10777)))

(declare-fun c!1727 () Bool)

(declare-fun imbalanced!6 (LongMap!46) Bool)

(assert (=> b!17276 (= c!1727 (imbalanced!6 thiss!848))))

(declare-fun mapNonEmpty!723 () Bool)

(declare-fun tp!2976 () Bool)

(assert (=> mapNonEmpty!723 (= mapRes!723 (and tp!2976 e!10784))))

(declare-fun mapRest!723 () (Array (_ BitVec 32) ValueCell!230))

(declare-fun mapKey!723 () (_ BitVec 32))

(declare-fun mapValue!723 () ValueCell!230)

(assert (=> mapNonEmpty!723 (= (arr!435 (_values!1631 (v!1416 (underlying!34 thiss!848)))) (store mapRest!723 mapKey!723 mapValue!723))))

(declare-fun b!17277 () Bool)

(assert (=> b!17277 (= e!10780 (and e!10776 mapRes!723))))

(declare-fun condMapEmpty!723 () Bool)

(declare-fun mapDefault!723 () ValueCell!230)

(assert (=> b!17277 (= condMapEmpty!723 (= (arr!435 (_values!1631 (v!1416 (underlying!34 thiss!848)))) ((as const (Array (_ BitVec 32) ValueCell!230)) mapDefault!723)))))

(declare-fun res!12516 () Bool)

(assert (=> start!2978 (=> (not res!12516) (not e!10783))))

(assert (=> start!2978 (= res!12516 (valid!31 thiss!848))))

(assert (=> start!2978 e!10783))

(declare-fun e!10782 () Bool)

(assert (=> start!2978 e!10782))

(assert (=> start!2978 true))

(assert (=> start!2978 tp_is_empty!859))

(declare-fun b!17269 () Bool)

(assert (=> b!17269 (= e!10782 e!10778)))

(assert (= (and start!2978 res!12516) b!17276))

(assert (= (and b!17276 c!1727) b!17267))

(assert (= (and b!17276 (not c!1727)) b!17271))

(assert (= (and b!17276 res!12518) b!17275))

(assert (= (and b!17275 res!12515) b!17266))

(assert (= (and b!17266 res!12517) b!17273))

(assert (= (and b!17277 condMapEmpty!723) mapIsEmpty!723))

(assert (= (and b!17277 (not condMapEmpty!723)) mapNonEmpty!723))

(get-info :version)

(assert (= (and mapNonEmpty!723 ((_ is ValueCellFull!230) mapValue!723)) b!17268))

(assert (= (and b!17277 ((_ is ValueCellFull!230) mapDefault!723)) b!17270))

(assert (= b!17272 b!17277))

(assert (= b!17274 b!17272))

(assert (= b!17269 b!17274))

(assert (= start!2978 b!17269))

(declare-fun m!12151 () Bool)

(assert (=> b!17273 m!12151))

(assert (=> b!17273 m!12151))

(declare-fun m!12153 () Bool)

(assert (=> b!17273 m!12153))

(declare-fun m!12155 () Bool)

(assert (=> mapNonEmpty!723 m!12155))

(declare-fun m!12157 () Bool)

(assert (=> b!17272 m!12157))

(declare-fun m!12159 () Bool)

(assert (=> b!17272 m!12159))

(declare-fun m!12161 () Bool)

(assert (=> b!17267 m!12161))

(declare-fun m!12163 () Bool)

(assert (=> b!17276 m!12163))

(declare-fun m!12165 () Bool)

(assert (=> b!17275 m!12165))

(declare-fun m!12167 () Bool)

(assert (=> b!17275 m!12167))

(declare-fun m!12169 () Bool)

(assert (=> start!2978 m!12169))

(check-sat (not b!17272) (not start!2978) (not b!17273) b_and!1237 (not mapNonEmpty!723) tp_is_empty!859 (not b!17276) (not b!17267) (not b!17275) (not b_next!595))
(check-sat b_and!1237 (not b_next!595))
