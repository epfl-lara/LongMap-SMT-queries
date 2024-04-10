; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89074 () Bool)

(assert start!89074)

(declare-fun b!1021301 () Bool)

(declare-fun b_free!20135 () Bool)

(declare-fun b_next!20135 () Bool)

(assert (=> b!1021301 (= b_free!20135 (not b_next!20135))))

(declare-fun tp!71433 () Bool)

(declare-fun b_and!32323 () Bool)

(assert (=> b!1021301 (= tp!71433 b_and!32323)))

(declare-fun b!1021300 () Bool)

(declare-fun e!575190 () Bool)

(declare-fun e!575185 () Bool)

(assert (=> b!1021300 (= e!575190 e!575185)))

(declare-fun c!103522 () Bool)

(declare-datatypes ((V!36679 0))(
  ( (V!36680 (val!11978 Int)) )
))
(declare-datatypes ((array!63750 0))(
  ( (array!63751 (arr!30689 (Array (_ BitVec 32) (_ BitVec 64))) (size!31200 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11224 0))(
  ( (ValueCellFull!11224 (v!14543 V!36679)) (EmptyCell!11224) )
))
(declare-datatypes ((array!63752 0))(
  ( (array!63753 (arr!30690 (Array (_ BitVec 32) ValueCell!11224)) (size!31201 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5042 0))(
  ( (LongMapFixedSize!5043 (defaultEntry!5873 Int) (mask!29440 (_ BitVec 32)) (extraKeys!5605 (_ BitVec 32)) (zeroValue!5709 V!36679) (minValue!5709 V!36679) (_size!2576 (_ BitVec 32)) (_keys!11018 array!63750) (_values!5896 array!63752) (_vacant!2576 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15490 0))(
  ( (tuple2!15491 (_1!7756 Bool) (_2!7756 LongMapFixedSize!5042)) )
))
(declare-fun lt!450015 () tuple2!15490)

(assert (=> b!1021300 (= c!103522 (_1!7756 lt!450015))))

(declare-fun tp_is_empty!23855 () Bool)

(declare-fun e!575193 () Bool)

(declare-datatypes ((Cell!1116 0))(
  ( (Cell!1117 (v!14544 LongMapFixedSize!5042)) )
))
(declare-datatypes ((LongMap!1116 0))(
  ( (LongMap!1117 (underlying!569 Cell!1116)) )
))
(declare-fun thiss!908 () LongMap!1116)

(declare-fun e!575188 () Bool)

(declare-fun array_inv!23801 (array!63750) Bool)

(declare-fun array_inv!23802 (array!63752) Bool)

(assert (=> b!1021301 (= e!575193 (and tp!71433 tp_is_empty!23855 (array_inv!23801 (_keys!11018 (v!14544 (underlying!569 thiss!908)))) (array_inv!23802 (_values!5896 (v!14544 (underlying!569 thiss!908)))) e!575188))))

(declare-fun res!684364 () Bool)

(declare-fun e!575187 () Bool)

(assert (=> start!89074 (=> (not res!684364) (not e!575187))))

(declare-fun valid!1920 (LongMap!1116) Bool)

(assert (=> start!89074 (= res!684364 (valid!1920 thiss!908))))

(assert (=> start!89074 e!575187))

(declare-fun e!575186 () Bool)

(assert (=> start!89074 e!575186))

(assert (=> start!89074 true))

(declare-fun key!697 () (_ BitVec 64))

(declare-datatypes ((tuple2!15492 0))(
  ( (tuple2!15493 (_1!7757 (_ BitVec 64)) (_2!7757 V!36679)) )
))
(declare-datatypes ((List!21652 0))(
  ( (Nil!21649) (Cons!21648 (h!22846 tuple2!15492) (t!30662 List!21652)) )
))
(declare-datatypes ((ListLongMap!13635 0))(
  ( (ListLongMap!13636 (toList!6833 List!21652)) )
))
(declare-fun call!43200 () ListLongMap!13635)

(declare-fun call!43199 () ListLongMap!13635)

(declare-fun b!1021302 () Bool)

(declare-fun -!460 (ListLongMap!13635 (_ BitVec 64)) ListLongMap!13635)

(assert (=> b!1021302 (= e!575185 (not (= call!43199 (-!460 call!43200 key!697))))))

(declare-fun b!1021303 () Bool)

(declare-fun e!575184 () Bool)

(declare-fun mapRes!37194 () Bool)

(assert (=> b!1021303 (= e!575188 (and e!575184 mapRes!37194))))

(declare-fun condMapEmpty!37194 () Bool)

(declare-fun mapDefault!37194 () ValueCell!11224)

