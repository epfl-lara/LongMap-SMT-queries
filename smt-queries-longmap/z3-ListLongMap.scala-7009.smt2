; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89280 () Bool)

(assert start!89280)

(declare-fun b!1022308 () Bool)

(declare-fun b_free!20107 () Bool)

(declare-fun b_next!20107 () Bool)

(assert (=> b!1022308 (= b_free!20107 (not b_next!20107))))

(declare-fun tp!71350 () Bool)

(declare-fun b_and!32305 () Bool)

(assert (=> b!1022308 (= tp!71350 b_and!32305)))

(declare-fun b!1022303 () Bool)

(declare-fun e!575680 () Bool)

(assert (=> b!1022303 (= e!575680 false)))

(declare-fun lt!450479 () Bool)

(declare-datatypes ((V!36643 0))(
  ( (V!36644 (val!11964 Int)) )
))
(declare-datatypes ((array!63743 0))(
  ( (array!63744 (arr!30679 (Array (_ BitVec 32) (_ BitVec 64))) (size!31191 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11210 0))(
  ( (ValueCellFull!11210 (v!14511 V!36643)) (EmptyCell!11210) )
))
(declare-datatypes ((array!63745 0))(
  ( (array!63746 (arr!30680 (Array (_ BitVec 32) ValueCell!11210)) (size!31192 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5014 0))(
  ( (LongMapFixedSize!5015 (defaultEntry!5859 Int) (mask!29478 (_ BitVec 32)) (extraKeys!5591 (_ BitVec 32)) (zeroValue!5695 V!36643) (minValue!5695 V!36643) (_size!2562 (_ BitVec 32)) (_keys!11042 array!63743) (_values!5882 array!63745) (_vacant!2562 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1088 0))(
  ( (Cell!1089 (v!14512 LongMapFixedSize!5014)) )
))
(declare-datatypes ((LongMap!1088 0))(
  ( (LongMap!1089 (underlying!555 Cell!1088)) )
))
(declare-fun thiss!908 () LongMap!1088)

(declare-fun key!697 () (_ BitVec 64))

(declare-fun valid!1916 (LongMap!1088) Bool)

(declare-datatypes ((tuple2!15472 0))(
  ( (tuple2!15473 (_1!7747 Bool) (_2!7747 LongMapFixedSize!5014)) )
))
(declare-fun remove!2 (LongMapFixedSize!5014 (_ BitVec 64)) tuple2!15472)

(assert (=> b!1022303 (= lt!450479 (valid!1916 (LongMap!1089 (Cell!1089 (_2!7747 (remove!2 (v!14512 (underlying!555 thiss!908)) key!697))))))))

(declare-fun b!1022304 () Bool)

(declare-fun e!575683 () Bool)

(declare-fun tp_is_empty!23827 () Bool)

(assert (=> b!1022304 (= e!575683 tp_is_empty!23827)))

(declare-fun res!684824 () Bool)

(assert (=> start!89280 (=> (not res!684824) (not e!575680))))

(assert (=> start!89280 (= res!684824 (valid!1916 thiss!908))))

(assert (=> start!89280 e!575680))

(declare-fun e!575678 () Bool)

(assert (=> start!89280 e!575678))

(assert (=> start!89280 true))

(declare-fun mapIsEmpty!37152 () Bool)

(declare-fun mapRes!37152 () Bool)

(assert (=> mapIsEmpty!37152 mapRes!37152))

(declare-fun b!1022305 () Bool)

(declare-fun e!575679 () Bool)

(declare-fun e!575682 () Bool)

(assert (=> b!1022305 (= e!575679 e!575682)))

(declare-fun mapNonEmpty!37152 () Bool)

(declare-fun tp!71349 () Bool)

(assert (=> mapNonEmpty!37152 (= mapRes!37152 (and tp!71349 e!575683))))

(declare-fun mapValue!37152 () ValueCell!11210)

(declare-fun mapRest!37152 () (Array (_ BitVec 32) ValueCell!11210))

(declare-fun mapKey!37152 () (_ BitVec 32))

(assert (=> mapNonEmpty!37152 (= (arr!30680 (_values!5882 (v!14512 (underlying!555 thiss!908)))) (store mapRest!37152 mapKey!37152 mapValue!37152))))

(declare-fun b!1022306 () Bool)

(declare-fun e!575684 () Bool)

(assert (=> b!1022306 (= e!575684 tp_is_empty!23827)))

(declare-fun b!1022307 () Bool)

(declare-fun e!575685 () Bool)

(assert (=> b!1022307 (= e!575685 (and e!575684 mapRes!37152))))

(declare-fun condMapEmpty!37152 () Bool)

(declare-fun mapDefault!37152 () ValueCell!11210)

(assert (=> b!1022307 (= condMapEmpty!37152 (= (arr!30680 (_values!5882 (v!14512 (underlying!555 thiss!908)))) ((as const (Array (_ BitVec 32) ValueCell!11210)) mapDefault!37152)))))

(declare-fun array_inv!23815 (array!63743) Bool)

(declare-fun array_inv!23816 (array!63745) Bool)

(assert (=> b!1022308 (= e!575682 (and tp!71350 tp_is_empty!23827 (array_inv!23815 (_keys!11042 (v!14512 (underlying!555 thiss!908)))) (array_inv!23816 (_values!5882 (v!14512 (underlying!555 thiss!908)))) e!575685))))

(declare-fun b!1022309 () Bool)

(assert (=> b!1022309 (= e!575678 e!575679)))

(assert (= (and start!89280 res!684824) b!1022303))

(assert (= (and b!1022307 condMapEmpty!37152) mapIsEmpty!37152))

(assert (= (and b!1022307 (not condMapEmpty!37152)) mapNonEmpty!37152))

(get-info :version)

(assert (= (and mapNonEmpty!37152 ((_ is ValueCellFull!11210) mapValue!37152)) b!1022304))

(assert (= (and b!1022307 ((_ is ValueCellFull!11210) mapDefault!37152)) b!1022306))

(assert (= b!1022308 b!1022307))

(assert (= b!1022305 b!1022308))

(assert (= b!1022309 b!1022305))

(assert (= start!89280 b!1022309))

(declare-fun m!942337 () Bool)

(assert (=> b!1022303 m!942337))

(declare-fun m!942339 () Bool)

(assert (=> b!1022303 m!942339))

(declare-fun m!942341 () Bool)

(assert (=> start!89280 m!942341))

(declare-fun m!942343 () Bool)

(assert (=> mapNonEmpty!37152 m!942343))

(declare-fun m!942345 () Bool)

(assert (=> b!1022308 m!942345))

(declare-fun m!942347 () Bool)

(assert (=> b!1022308 m!942347))

(check-sat (not mapNonEmpty!37152) tp_is_empty!23827 b_and!32305 (not b!1022308) (not b!1022303) (not b_next!20107) (not start!89280))
(check-sat b_and!32305 (not b_next!20107))
