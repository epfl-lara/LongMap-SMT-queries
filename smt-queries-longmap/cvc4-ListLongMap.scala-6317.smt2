; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81158 () Bool)

(assert start!81158)

(declare-fun b!949806 () Bool)

(declare-fun b_free!18227 () Bool)

(declare-fun b_next!18227 () Bool)

(assert (=> b!949806 (= b_free!18227 (not b_next!18227))))

(declare-fun tp!63270 () Bool)

(declare-fun b_and!29679 () Bool)

(assert (=> b!949806 (= tp!63270 b_and!29679)))

(declare-fun b!949807 () Bool)

(declare-fun res!636903 () Bool)

(declare-fun e!534735 () Bool)

(assert (=> b!949807 (=> (not res!636903) (not e!534735))))

(declare-datatypes ((V!32611 0))(
  ( (V!32612 (val!10418 Int)) )
))
(declare-datatypes ((ValueCell!9886 0))(
  ( (ValueCellFull!9886 (v!12959 V!32611)) (EmptyCell!9886) )
))
(declare-datatypes ((array!57484 0))(
  ( (array!57485 (arr!27644 (Array (_ BitVec 32) ValueCell!9886)) (size!28121 (_ BitVec 32))) )
))
(declare-datatypes ((array!57486 0))(
  ( (array!57487 (arr!27645 (Array (_ BitVec 32) (_ BitVec 64))) (size!28122 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4922 0))(
  ( (LongMapFixedSize!4923 (defaultEntry!5770 Int) (mask!27558 (_ BitVec 32)) (extraKeys!5502 (_ BitVec 32)) (zeroValue!5606 V!32611) (minValue!5606 V!32611) (_size!2516 (_ BitVec 32)) (_keys!10702 array!57486) (_values!5793 array!57484) (_vacant!2516 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4922)

(assert (=> b!949807 (= res!636903 (and (= (size!28121 (_values!5793 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27558 thiss!1141))) (= (size!28122 (_keys!10702 thiss!1141)) (size!28121 (_values!5793 thiss!1141))) (bvsge (mask!27558 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5502 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5502 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949808 () Bool)

(declare-fun e!534731 () Bool)

(declare-fun tp_is_empty!20735 () Bool)

(assert (=> b!949808 (= e!534731 tp_is_empty!20735)))

(declare-fun b!949809 () Bool)

(declare-fun res!636906 () Bool)

(assert (=> b!949809 (=> (not res!636906) (not e!534735))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13540 0))(
  ( (tuple2!13541 (_1!6781 (_ BitVec 64)) (_2!6781 V!32611)) )
))
(declare-datatypes ((List!19330 0))(
  ( (Nil!19327) (Cons!19326 (h!20486 tuple2!13540) (t!27665 List!19330)) )
))
(declare-datatypes ((ListLongMap!12237 0))(
  ( (ListLongMap!12238 (toList!6134 List!19330)) )
))
(declare-fun contains!5224 (ListLongMap!12237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3367 (array!57486 array!57484 (_ BitVec 32) (_ BitVec 32) V!32611 V!32611 (_ BitVec 32) Int) ListLongMap!12237)

(assert (=> b!949809 (= res!636906 (contains!5224 (getCurrentListMap!3367 (_keys!10702 thiss!1141) (_values!5793 thiss!1141) (mask!27558 thiss!1141) (extraKeys!5502 thiss!1141) (zeroValue!5606 thiss!1141) (minValue!5606 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5770 thiss!1141)) key!756))))

(declare-fun b!949810 () Bool)

(declare-fun e!534730 () Bool)

(declare-fun mapRes!33008 () Bool)

(assert (=> b!949810 (= e!534730 (and e!534731 mapRes!33008))))

(declare-fun condMapEmpty!33008 () Bool)

(declare-fun mapDefault!33008 () ValueCell!9886)

