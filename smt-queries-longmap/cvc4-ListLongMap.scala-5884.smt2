; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75838 () Bool)

(assert start!75838)

(declare-fun b!892312 () Bool)

(declare-fun b_free!15809 () Bool)

(declare-fun b_next!15809 () Bool)

(assert (=> b!892312 (= b_free!15809 (not b_next!15809))))

(declare-fun tp!55395 () Bool)

(declare-fun b_and!26049 () Bool)

(assert (=> b!892312 (= tp!55395 b_and!26049)))

(declare-fun b!892303 () Bool)

(declare-fun e!498080 () Bool)

(declare-fun e!498086 () Bool)

(assert (=> b!892303 (= e!498080 (not e!498086))))

(declare-fun res!604547 () Bool)

(assert (=> b!892303 (=> res!604547 e!498086)))

(declare-datatypes ((SeekEntryResult!8844 0))(
  ( (MissingZero!8844 (index!37747 (_ BitVec 32))) (Found!8844 (index!37748 (_ BitVec 32))) (Intermediate!8844 (undefined!9656 Bool) (index!37749 (_ BitVec 32)) (x!75828 (_ BitVec 32))) (Undefined!8844) (MissingVacant!8844 (index!37750 (_ BitVec 32))) )
))
(declare-fun lt!403126 () SeekEntryResult!8844)

(assert (=> b!892303 (= res!604547 (not (is-Found!8844 lt!403126)))))

(declare-fun e!498083 () Bool)

(assert (=> b!892303 e!498083))

(declare-fun res!604542 () Bool)

(assert (=> b!892303 (=> res!604542 e!498083)))

(assert (=> b!892303 (= res!604542 (not (is-Found!8844 lt!403126)))))

(declare-datatypes ((Unit!30384 0))(
  ( (Unit!30385) )
))
(declare-fun lt!403125 () Unit!30384)

(declare-datatypes ((array!52254 0))(
  ( (array!52255 (arr!25133 (Array (_ BitVec 32) (_ BitVec 64))) (size!25577 (_ BitVec 32))) )
))
(declare-datatypes ((V!29147 0))(
  ( (V!29148 (val!9119 Int)) )
))
(declare-datatypes ((ValueCell!8587 0))(
  ( (ValueCellFull!8587 (v!11597 V!29147)) (EmptyCell!8587) )
))
(declare-datatypes ((array!52256 0))(
  ( (array!52257 (arr!25134 (Array (_ BitVec 32) ValueCell!8587)) (size!25578 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4190 0))(
  ( (LongMapFixedSize!4191 (defaultEntry!5292 Int) (mask!25801 (_ BitVec 32)) (extraKeys!4986 (_ BitVec 32)) (zeroValue!5090 V!29147) (minValue!5090 V!29147) (_size!2150 (_ BitVec 32)) (_keys!9975 array!52254) (_values!5277 array!52256) (_vacant!2150 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4190)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!44 (array!52254 array!52256 (_ BitVec 32) (_ BitVec 32) V!29147 V!29147 (_ BitVec 64)) Unit!30384)

(assert (=> b!892303 (= lt!403125 (lemmaSeekEntryGivesInRangeIndex!44 (_keys!9975 thiss!1181) (_values!5277 thiss!1181) (mask!25801 thiss!1181) (extraKeys!4986 thiss!1181) (zeroValue!5090 thiss!1181) (minValue!5090 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52254 (_ BitVec 32)) SeekEntryResult!8844)

(assert (=> b!892303 (= lt!403126 (seekEntry!0 key!785 (_keys!9975 thiss!1181) (mask!25801 thiss!1181)))))

(declare-fun b!892304 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892304 (= e!498083 (inRange!0 (index!37748 lt!403126) (mask!25801 thiss!1181)))))

(declare-fun b!892305 () Bool)

(declare-fun e!498085 () Bool)

(assert (=> b!892305 (= e!498085 true)))

(declare-fun lt!403122 () Bool)

(declare-datatypes ((tuple2!11990 0))(
  ( (tuple2!11991 (_1!6006 (_ BitVec 64)) (_2!6006 V!29147)) )
))
(declare-datatypes ((List!17779 0))(
  ( (Nil!17776) (Cons!17775 (h!18906 tuple2!11990) (t!25078 List!17779)) )
))
(declare-datatypes ((ListLongMap!10687 0))(
  ( (ListLongMap!10688 (toList!5359 List!17779)) )
))
(declare-fun lt!403121 () ListLongMap!10687)

(declare-fun contains!4361 (ListLongMap!10687 (_ BitVec 64)) Bool)

(assert (=> b!892305 (= lt!403122 (contains!4361 lt!403121 key!785))))

(declare-fun mapNonEmpty!28760 () Bool)

(declare-fun mapRes!28760 () Bool)

(declare-fun tp!55396 () Bool)

(declare-fun e!498079 () Bool)

(assert (=> mapNonEmpty!28760 (= mapRes!28760 (and tp!55396 e!498079))))

(declare-fun mapKey!28760 () (_ BitVec 32))

(declare-fun mapValue!28760 () ValueCell!8587)

(declare-fun mapRest!28760 () (Array (_ BitVec 32) ValueCell!8587))

(assert (=> mapNonEmpty!28760 (= (arr!25134 (_values!5277 thiss!1181)) (store mapRest!28760 mapKey!28760 mapValue!28760))))

(declare-fun b!892306 () Bool)

(declare-fun res!604545 () Bool)

(assert (=> b!892306 (=> res!604545 e!498085)))

(declare-datatypes ((List!17780 0))(
  ( (Nil!17777) (Cons!17776 (h!18907 (_ BitVec 64)) (t!25079 List!17780)) )
))
(declare-fun arrayNoDuplicates!0 (array!52254 (_ BitVec 32) List!17780) Bool)

(assert (=> b!892306 (= res!604545 (not (arrayNoDuplicates!0 (_keys!9975 thiss!1181) #b00000000000000000000000000000000 Nil!17777)))))

(declare-fun mapIsEmpty!28760 () Bool)

(assert (=> mapIsEmpty!28760 mapRes!28760))

(declare-fun b!892307 () Bool)

(declare-fun e!498084 () Bool)

(declare-fun tp_is_empty!18137 () Bool)

(assert (=> b!892307 (= e!498084 tp_is_empty!18137)))

(declare-fun b!892308 () Bool)

(assert (=> b!892308 (= e!498086 e!498085)))

(declare-fun res!604540 () Bool)

(assert (=> b!892308 (=> res!604540 e!498085)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892308 (= res!604540 (not (validMask!0 (mask!25801 thiss!1181))))))

(assert (=> b!892308 (contains!4361 lt!403121 (select (arr!25133 (_keys!9975 thiss!1181)) (index!37748 lt!403126)))))

(declare-fun getCurrentListMap!2640 (array!52254 array!52256 (_ BitVec 32) (_ BitVec 32) V!29147 V!29147 (_ BitVec 32) Int) ListLongMap!10687)

(assert (=> b!892308 (= lt!403121 (getCurrentListMap!2640 (_keys!9975 thiss!1181) (_values!5277 thiss!1181) (mask!25801 thiss!1181) (extraKeys!4986 thiss!1181) (zeroValue!5090 thiss!1181) (minValue!5090 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5292 thiss!1181)))))

(declare-fun lt!403123 () Unit!30384)

(declare-fun lemmaValidKeyInArrayIsInListMap!229 (array!52254 array!52256 (_ BitVec 32) (_ BitVec 32) V!29147 V!29147 (_ BitVec 32) Int) Unit!30384)

(assert (=> b!892308 (= lt!403123 (lemmaValidKeyInArrayIsInListMap!229 (_keys!9975 thiss!1181) (_values!5277 thiss!1181) (mask!25801 thiss!1181) (extraKeys!4986 thiss!1181) (zeroValue!5090 thiss!1181) (minValue!5090 thiss!1181) (index!37748 lt!403126) (defaultEntry!5292 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892308 (arrayContainsKey!0 (_keys!9975 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403124 () Unit!30384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52254 (_ BitVec 64) (_ BitVec 32)) Unit!30384)

(assert (=> b!892308 (= lt!403124 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9975 thiss!1181) key!785 (index!37748 lt!403126)))))

(declare-fun res!604541 () Bool)

(assert (=> start!75838 (=> (not res!604541) (not e!498080))))

(declare-fun valid!1621 (LongMapFixedSize!4190) Bool)

(assert (=> start!75838 (= res!604541 (valid!1621 thiss!1181))))

(assert (=> start!75838 e!498080))

(declare-fun e!498082 () Bool)

(assert (=> start!75838 e!498082))

(assert (=> start!75838 true))

(declare-fun b!892309 () Bool)

(declare-fun res!604544 () Bool)

(assert (=> b!892309 (=> (not res!604544) (not e!498080))))

(assert (=> b!892309 (= res!604544 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892310 () Bool)

(declare-fun res!604543 () Bool)

(assert (=> b!892310 (=> res!604543 e!498085)))

(assert (=> b!892310 (= res!604543 (or (not (= (size!25578 (_values!5277 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25801 thiss!1181)))) (not (= (size!25577 (_keys!9975 thiss!1181)) (size!25578 (_values!5277 thiss!1181)))) (bvslt (mask!25801 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4986 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4986 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892311 () Bool)

(declare-fun e!498081 () Bool)

(assert (=> b!892311 (= e!498081 (and e!498084 mapRes!28760))))

(declare-fun condMapEmpty!28760 () Bool)

(declare-fun mapDefault!28760 () ValueCell!8587)

