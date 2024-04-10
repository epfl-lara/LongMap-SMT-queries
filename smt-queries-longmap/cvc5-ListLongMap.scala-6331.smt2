; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81580 () Bool)

(assert start!81580)

(declare-fun b!953021 () Bool)

(declare-fun b_free!18307 () Bool)

(declare-fun b_next!18307 () Bool)

(assert (=> b!953021 (= b_free!18307 (not b_next!18307))))

(declare-fun tp!63548 () Bool)

(declare-fun b_and!29791 () Bool)

(assert (=> b!953021 (= tp!63548 b_and!29791)))

(declare-fun res!638333 () Bool)

(declare-fun e!536754 () Bool)

(assert (=> start!81580 (=> (not res!638333) (not e!536754))))

(declare-datatypes ((V!32719 0))(
  ( (V!32720 (val!10458 Int)) )
))
(declare-datatypes ((ValueCell!9926 0))(
  ( (ValueCellFull!9926 (v!13011 V!32719)) (EmptyCell!9926) )
))
(declare-datatypes ((array!57668 0))(
  ( (array!57669 (arr!27724 (Array (_ BitVec 32) ValueCell!9926)) (size!28203 (_ BitVec 32))) )
))
(declare-datatypes ((array!57670 0))(
  ( (array!57671 (arr!27725 (Array (_ BitVec 32) (_ BitVec 64))) (size!28204 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5002 0))(
  ( (LongMapFixedSize!5003 (defaultEntry!5836 Int) (mask!27699 (_ BitVec 32)) (extraKeys!5568 (_ BitVec 32)) (zeroValue!5672 V!32719) (minValue!5672 V!32719) (_size!2556 (_ BitVec 32)) (_keys!10795 array!57670) (_values!5859 array!57668) (_vacant!2556 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!5002)

(declare-fun valid!1903 (LongMapFixedSize!5002) Bool)

(assert (=> start!81580 (= res!638333 (valid!1903 thiss!1141))))

(assert (=> start!81580 e!536754))

(declare-fun e!536757 () Bool)

(assert (=> start!81580 e!536757))

(assert (=> start!81580 true))

(declare-fun b!953016 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13596 0))(
  ( (tuple2!13597 (_1!6809 (_ BitVec 64)) (_2!6809 V!32719)) )
))
(declare-datatypes ((List!19373 0))(
  ( (Nil!19370) (Cons!19369 (h!20531 tuple2!13596) (t!27732 List!19373)) )
))
(declare-datatypes ((ListLongMap!12293 0))(
  ( (ListLongMap!12294 (toList!6162 List!19373)) )
))
(declare-fun contains!5257 (ListLongMap!12293 (_ BitVec 64)) Bool)

(declare-fun map!13109 (LongMapFixedSize!5002) ListLongMap!12293)

(assert (=> b!953016 (= e!536754 (contains!5257 (map!13109 thiss!1141) key!756))))

(declare-datatypes ((Unit!32059 0))(
  ( (Unit!32060) )
))
(declare-fun lt!429488 () Unit!32059)

(declare-fun e!536759 () Unit!32059)

(assert (=> b!953016 (= lt!429488 e!536759)))

(declare-fun c!99736 () Bool)

(declare-fun getCurrentListMap!3395 (array!57670 array!57668 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 32) Int) ListLongMap!12293)

(assert (=> b!953016 (= c!99736 (contains!5257 (getCurrentListMap!3395 (_keys!10795 thiss!1141) (_values!5859 thiss!1141) (mask!27699 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)) key!756))))

(declare-fun b!953017 () Bool)

(declare-fun res!638332 () Bool)

(assert (=> b!953017 (=> (not res!638332) (not e!536754))))

(assert (=> b!953017 (= res!638332 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!953018 () Bool)

(declare-fun Unit!32061 () Unit!32059)

(assert (=> b!953018 (= e!536759 Unit!32061)))

(declare-fun b!953019 () Bool)

(declare-fun e!536755 () Bool)

(declare-fun tp_is_empty!20815 () Bool)

(assert (=> b!953019 (= e!536755 tp_is_empty!20815)))

(declare-fun b!953020 () Bool)

(declare-fun res!638334 () Bool)

(assert (=> b!953020 (=> (not res!638334) (not e!536754))))

(declare-datatypes ((SeekEntryResult!9166 0))(
  ( (MissingZero!9166 (index!39035 (_ BitVec 32))) (Found!9166 (index!39036 (_ BitVec 32))) (Intermediate!9166 (undefined!9978 Bool) (index!39037 (_ BitVec 32)) (x!81988 (_ BitVec 32))) (Undefined!9166) (MissingVacant!9166 (index!39038 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57670 (_ BitVec 32)) SeekEntryResult!9166)

(assert (=> b!953020 (= res!638334 (not (is-Found!9166 (seekEntry!0 key!756 (_keys!10795 thiss!1141) (mask!27699 thiss!1141)))))))

(declare-fun mapNonEmpty!33166 () Bool)

(declare-fun mapRes!33166 () Bool)

(declare-fun tp!63549 () Bool)

(assert (=> mapNonEmpty!33166 (= mapRes!33166 (and tp!63549 e!536755))))

(declare-fun mapValue!33166 () ValueCell!9926)

(declare-fun mapKey!33166 () (_ BitVec 32))

(declare-fun mapRest!33166 () (Array (_ BitVec 32) ValueCell!9926))

(assert (=> mapNonEmpty!33166 (= (arr!27724 (_values!5859 thiss!1141)) (store mapRest!33166 mapKey!33166 mapValue!33166))))

(declare-fun e!536758 () Bool)

(declare-fun array_inv!21514 (array!57670) Bool)

(declare-fun array_inv!21515 (array!57668) Bool)

(assert (=> b!953021 (= e!536757 (and tp!63548 tp_is_empty!20815 (array_inv!21514 (_keys!10795 thiss!1141)) (array_inv!21515 (_values!5859 thiss!1141)) e!536758))))

(declare-fun mapIsEmpty!33166 () Bool)

(assert (=> mapIsEmpty!33166 mapRes!33166))

(declare-fun b!953022 () Bool)

(declare-fun e!536760 () Bool)

(assert (=> b!953022 (= e!536760 tp_is_empty!20815)))

(declare-fun b!953023 () Bool)

(declare-fun Unit!32062 () Unit!32059)

(assert (=> b!953023 (= e!536759 Unit!32062)))

(declare-fun lt!429492 () Unit!32059)

(declare-fun lemmaKeyInListMapIsInArray!340 (array!57670 array!57668 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 64) Int) Unit!32059)

(assert (=> b!953023 (= lt!429492 (lemmaKeyInListMapIsInArray!340 (_keys!10795 thiss!1141) (_values!5859 thiss!1141) (mask!27699 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) key!756 (defaultEntry!5836 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953023 (arrayContainsKey!0 (_keys!10795 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429489 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57670 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953023 (= lt!429489 (arrayScanForKey!0 (_keys!10795 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun lt!429491 () Unit!32059)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32059)

(assert (=> b!953023 (= lt!429491 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10795 thiss!1141) (mask!27699 thiss!1141) #b00000000000000000000000000000000 lt!429489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57670 (_ BitVec 32)) Bool)

(assert (=> b!953023 (arrayForallSeekEntryOrOpenFound!0 lt!429489 (_keys!10795 thiss!1141) (mask!27699 thiss!1141))))

(declare-fun lt!429490 () Unit!32059)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57670 (_ BitVec 32)) Unit!32059)

(assert (=> b!953023 (= lt!429490 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429489 (_keys!10795 thiss!1141) (mask!27699 thiss!1141)))))

(assert (=> b!953023 false))

(declare-fun b!953024 () Bool)

(assert (=> b!953024 (= e!536758 (and e!536760 mapRes!33166))))

(declare-fun condMapEmpty!33166 () Bool)

(declare-fun mapDefault!33166 () ValueCell!9926)

