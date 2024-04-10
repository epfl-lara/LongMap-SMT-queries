; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89222 () Bool)

(assert start!89222)

(declare-fun b!1023013 () Bool)

(declare-fun b_free!20263 () Bool)

(declare-fun b_next!20263 () Bool)

(assert (=> b!1023013 (= b_free!20263 (not b_next!20263))))

(declare-fun tp!71823 () Bool)

(declare-fun b_and!32485 () Bool)

(assert (=> b!1023013 (= tp!71823 b_and!32485)))

(declare-fun b!1023005 () Bool)

(declare-fun res!685190 () Bool)

(declare-fun e!576402 () Bool)

(assert (=> b!1023005 (=> (not res!685190) (not e!576402))))

(declare-datatypes ((V!36851 0))(
  ( (V!36852 (val!12042 Int)) )
))
(declare-datatypes ((ValueCell!11288 0))(
  ( (ValueCellFull!11288 (v!14611 V!36851)) (EmptyCell!11288) )
))
(declare-datatypes ((array!64010 0))(
  ( (array!64011 (arr!30817 (Array (_ BitVec 32) (_ BitVec 64))) (size!31328 (_ BitVec 32))) )
))
(declare-datatypes ((array!64012 0))(
  ( (array!64013 (arr!30818 (Array (_ BitVec 32) ValueCell!11288)) (size!31329 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5170 0))(
  ( (LongMapFixedSize!5171 (defaultEntry!5937 Int) (mask!29548 (_ BitVec 32)) (extraKeys!5669 (_ BitVec 32)) (zeroValue!5773 V!36851) (minValue!5773 V!36851) (_size!2640 (_ BitVec 32)) (_keys!11082 array!64010) (_values!5960 array!64012) (_vacant!2640 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5170)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64010 (_ BitVec 32)) Bool)

(assert (=> b!1023005 (= res!685190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11082 thiss!1427) (mask!29548 thiss!1427)))))

(declare-fun b!1023006 () Bool)

(declare-fun e!576404 () Bool)

(declare-fun tp_is_empty!23983 () Bool)

(assert (=> b!1023006 (= e!576404 tp_is_empty!23983)))

(declare-fun b!1023007 () Bool)

(declare-fun res!685193 () Bool)

(assert (=> b!1023007 (=> (not res!685193) (not e!576402))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023007 (= res!685193 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023008 () Bool)

(declare-fun res!685192 () Bool)

(assert (=> b!1023008 (=> (not res!685192) (not e!576402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023008 (= res!685192 (validMask!0 (mask!29548 thiss!1427)))))

(declare-fun b!1023009 () Bool)

(assert (=> b!1023009 (= e!576402 false)))

(declare-fun lt!450360 () Bool)

(declare-datatypes ((List!21701 0))(
  ( (Nil!21698) (Cons!21697 (h!22895 (_ BitVec 64)) (t!30739 List!21701)) )
))
(declare-fun arrayNoDuplicates!0 (array!64010 (_ BitVec 32) List!21701) Bool)

(assert (=> b!1023009 (= lt!450360 (arrayNoDuplicates!0 (_keys!11082 thiss!1427) #b00000000000000000000000000000000 Nil!21698))))

(declare-fun mapNonEmpty!37392 () Bool)

(declare-fun mapRes!37392 () Bool)

(declare-fun tp!71824 () Bool)

(declare-fun e!576400 () Bool)

(assert (=> mapNonEmpty!37392 (= mapRes!37392 (and tp!71824 e!576400))))

(declare-fun mapRest!37392 () (Array (_ BitVec 32) ValueCell!11288))

(declare-fun mapValue!37392 () ValueCell!11288)

(declare-fun mapKey!37392 () (_ BitVec 32))

(assert (=> mapNonEmpty!37392 (= (arr!30818 (_values!5960 thiss!1427)) (store mapRest!37392 mapKey!37392 mapValue!37392))))

(declare-fun mapIsEmpty!37392 () Bool)

(assert (=> mapIsEmpty!37392 mapRes!37392))

(declare-fun b!1023010 () Bool)

(declare-fun e!576405 () Bool)

(assert (=> b!1023010 (= e!576405 (and e!576404 mapRes!37392))))

(declare-fun condMapEmpty!37392 () Bool)

(declare-fun mapDefault!37392 () ValueCell!11288)

