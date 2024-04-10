; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81026 () Bool)

(assert start!81026)

(declare-fun b!948840 () Bool)

(declare-fun b_free!18209 () Bool)

(declare-fun b_next!18209 () Bool)

(assert (=> b!948840 (= b_free!18209 (not b_next!18209))))

(declare-fun tp!63206 () Bool)

(declare-fun b_and!29647 () Bool)

(assert (=> b!948840 (= tp!63206 b_and!29647)))

(declare-fun b!948836 () Bool)

(declare-fun res!636480 () Bool)

(declare-fun e!534151 () Bool)

(assert (=> b!948836 (=> (not res!636480) (not e!534151))))

(declare-datatypes ((V!32587 0))(
  ( (V!32588 (val!10409 Int)) )
))
(declare-datatypes ((ValueCell!9877 0))(
  ( (ValueCellFull!9877 (v!12947 V!32587)) (EmptyCell!9877) )
))
(declare-datatypes ((array!57442 0))(
  ( (array!57443 (arr!27626 (Array (_ BitVec 32) ValueCell!9877)) (size!28101 (_ BitVec 32))) )
))
(declare-datatypes ((array!57444 0))(
  ( (array!57445 (arr!27627 (Array (_ BitVec 32) (_ BitVec 64))) (size!28102 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4904 0))(
  ( (LongMapFixedSize!4905 (defaultEntry!5756 Int) (mask!27524 (_ BitVec 32)) (extraKeys!5488 (_ BitVec 32)) (zeroValue!5592 V!32587) (minValue!5592 V!32587) (_size!2507 (_ BitVec 32)) (_keys!10679 array!57444) (_values!5779 array!57442) (_vacant!2507 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4904)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948836 (= res!636480 (validMask!0 (mask!27524 thiss!1141)))))

(declare-fun b!948837 () Bool)

(declare-fun res!636477 () Bool)

(assert (=> b!948837 (=> (not res!636477) (not e!534151))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!948837 (= res!636477 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948838 () Bool)

(declare-fun e!534150 () Bool)

(declare-fun tp_is_empty!20717 () Bool)

(assert (=> b!948838 (= e!534150 tp_is_empty!20717)))

(declare-fun mapIsEmpty!32970 () Bool)

(declare-fun mapRes!32970 () Bool)

(assert (=> mapIsEmpty!32970 mapRes!32970))

(declare-fun res!636476 () Bool)

(assert (=> start!81026 (=> (not res!636476) (not e!534151))))

(declare-fun valid!1868 (LongMapFixedSize!4904) Bool)

(assert (=> start!81026 (= res!636476 (valid!1868 thiss!1141))))

(assert (=> start!81026 e!534151))

(declare-fun e!534149 () Bool)

(assert (=> start!81026 e!534149))

(assert (=> start!81026 true))

(declare-fun b!948839 () Bool)

(declare-fun e!534152 () Bool)

(assert (=> b!948839 (= e!534152 tp_is_empty!20717)))

(declare-fun e!534148 () Bool)

(declare-fun array_inv!21446 (array!57444) Bool)

(declare-fun array_inv!21447 (array!57442) Bool)

(assert (=> b!948840 (= e!534149 (and tp!63206 tp_is_empty!20717 (array_inv!21446 (_keys!10679 thiss!1141)) (array_inv!21447 (_values!5779 thiss!1141)) e!534148))))

(declare-fun b!948841 () Bool)

(assert (=> b!948841 (= e!534151 (and (= (size!28101 (_values!5779 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27524 thiss!1141))) (= (size!28102 (_keys!10679 thiss!1141)) (size!28101 (_values!5779 thiss!1141))) (bvslt (mask!27524 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!948842 () Bool)

(declare-fun res!636479 () Bool)

(assert (=> b!948842 (=> (not res!636479) (not e!534151))))

(declare-datatypes ((SeekEntryResult!9129 0))(
  ( (MissingZero!9129 (index!38887 (_ BitVec 32))) (Found!9129 (index!38888 (_ BitVec 32))) (Intermediate!9129 (undefined!9941 Bool) (index!38889 (_ BitVec 32)) (x!81633 (_ BitVec 32))) (Undefined!9129) (MissingVacant!9129 (index!38890 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57444 (_ BitVec 32)) SeekEntryResult!9129)

(assert (=> b!948842 (= res!636479 (not (is-Found!9129 (seekEntry!0 key!756 (_keys!10679 thiss!1141) (mask!27524 thiss!1141)))))))

(declare-fun mapNonEmpty!32970 () Bool)

(declare-fun tp!63205 () Bool)

(assert (=> mapNonEmpty!32970 (= mapRes!32970 (and tp!63205 e!534152))))

(declare-fun mapValue!32970 () ValueCell!9877)

(declare-fun mapRest!32970 () (Array (_ BitVec 32) ValueCell!9877))

(declare-fun mapKey!32970 () (_ BitVec 32))

(assert (=> mapNonEmpty!32970 (= (arr!27626 (_values!5779 thiss!1141)) (store mapRest!32970 mapKey!32970 mapValue!32970))))

(declare-fun b!948843 () Bool)

(assert (=> b!948843 (= e!534148 (and e!534150 mapRes!32970))))

(declare-fun condMapEmpty!32970 () Bool)

(declare-fun mapDefault!32970 () ValueCell!9877)

