; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75808 () Bool)

(assert start!75808)

(declare-fun b!891764 () Bool)

(declare-fun b_free!15779 () Bool)

(declare-fun b_next!15779 () Bool)

(assert (=> b!891764 (= b_free!15779 (not b_next!15779))))

(declare-fun tp!55305 () Bool)

(declare-fun b_and!26019 () Bool)

(assert (=> b!891764 (= tp!55305 b_and!26019)))

(declare-fun b!891763 () Bool)

(declare-fun res!604183 () Bool)

(declare-fun e!497680 () Bool)

(assert (=> b!891763 (=> res!604183 e!497680)))

(declare-datatypes ((array!52194 0))(
  ( (array!52195 (arr!25103 (Array (_ BitVec 32) (_ BitVec 64))) (size!25547 (_ BitVec 32))) )
))
(declare-datatypes ((V!29107 0))(
  ( (V!29108 (val!9104 Int)) )
))
(declare-datatypes ((ValueCell!8572 0))(
  ( (ValueCellFull!8572 (v!11582 V!29107)) (EmptyCell!8572) )
))
(declare-datatypes ((array!52196 0))(
  ( (array!52197 (arr!25104 (Array (_ BitVec 32) ValueCell!8572)) (size!25548 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4160 0))(
  ( (LongMapFixedSize!4161 (defaultEntry!5277 Int) (mask!25776 (_ BitVec 32)) (extraKeys!4971 (_ BitVec 32)) (zeroValue!5075 V!29107) (minValue!5075 V!29107) (_size!2135 (_ BitVec 32)) (_keys!9960 array!52194) (_values!5262 array!52196) (_vacant!2135 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4160)

(assert (=> b!891763 (= res!604183 (or (not (= (size!25548 (_values!5262 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25776 thiss!1181)))) (not (= (size!25547 (_keys!9960 thiss!1181)) (size!25548 (_values!5262 thiss!1181)))) (bvslt (mask!25776 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4971 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4971 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!497681 () Bool)

(declare-fun e!497675 () Bool)

(declare-fun tp_is_empty!18107 () Bool)

(declare-fun array_inv!19722 (array!52194) Bool)

(declare-fun array_inv!19723 (array!52196) Bool)

(assert (=> b!891764 (= e!497675 (and tp!55305 tp_is_empty!18107 (array_inv!19722 (_keys!9960 thiss!1181)) (array_inv!19723 (_values!5262 thiss!1181)) e!497681))))

(declare-fun b!891765 () Bool)

(declare-fun e!497676 () Bool)

(assert (=> b!891765 (= e!497676 tp_is_empty!18107)))

(declare-fun b!891766 () Bool)

(declare-fun res!604184 () Bool)

(assert (=> b!891766 (=> res!604184 e!497680)))

(declare-datatypes ((List!17758 0))(
  ( (Nil!17755) (Cons!17754 (h!18885 (_ BitVec 64)) (t!25057 List!17758)) )
))
(declare-fun arrayNoDuplicates!0 (array!52194 (_ BitVec 32) List!17758) Bool)

(assert (=> b!891766 (= res!604184 (not (arrayNoDuplicates!0 (_keys!9960 thiss!1181) #b00000000000000000000000000000000 Nil!17755)))))

(declare-fun mapNonEmpty!28715 () Bool)

(declare-fun mapRes!28715 () Bool)

(declare-fun tp!55306 () Bool)

(assert (=> mapNonEmpty!28715 (= mapRes!28715 (and tp!55306 e!497676))))

(declare-fun mapValue!28715 () ValueCell!8572)

(declare-fun mapRest!28715 () (Array (_ BitVec 32) ValueCell!8572))

(declare-fun mapKey!28715 () (_ BitVec 32))

(assert (=> mapNonEmpty!28715 (= (arr!25104 (_values!5262 thiss!1181)) (store mapRest!28715 mapKey!28715 mapValue!28715))))

(declare-fun b!891767 () Bool)

(declare-fun res!604181 () Bool)

(assert (=> b!891767 (=> res!604181 e!497680)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52194 (_ BitVec 32)) Bool)

(assert (=> b!891767 (= res!604181 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9960 thiss!1181) (mask!25776 thiss!1181))))))

(declare-fun b!891768 () Bool)

(assert (=> b!891768 (= e!497680 true)))

(declare-fun lt!402852 () Bool)

(declare-datatypes ((tuple2!11966 0))(
  ( (tuple2!11967 (_1!5994 (_ BitVec 64)) (_2!5994 V!29107)) )
))
(declare-datatypes ((List!17759 0))(
  ( (Nil!17756) (Cons!17755 (h!18886 tuple2!11966) (t!25058 List!17759)) )
))
(declare-datatypes ((ListLongMap!10663 0))(
  ( (ListLongMap!10664 (toList!5347 List!17759)) )
))
(declare-fun lt!402855 () ListLongMap!10663)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4349 (ListLongMap!10663 (_ BitVec 64)) Bool)

(assert (=> b!891768 (= lt!402852 (contains!4349 lt!402855 key!785))))

(declare-fun b!891769 () Bool)

(declare-fun e!497674 () Bool)

(declare-fun e!497678 () Bool)

(assert (=> b!891769 (= e!497674 (not e!497678))))

(declare-fun res!604180 () Bool)

(assert (=> b!891769 (=> res!604180 e!497678)))

(declare-datatypes ((SeekEntryResult!8832 0))(
  ( (MissingZero!8832 (index!37699 (_ BitVec 32))) (Found!8832 (index!37700 (_ BitVec 32))) (Intermediate!8832 (undefined!9644 Bool) (index!37701 (_ BitVec 32)) (x!75776 (_ BitVec 32))) (Undefined!8832) (MissingVacant!8832 (index!37702 (_ BitVec 32))) )
))
(declare-fun lt!402851 () SeekEntryResult!8832)

(assert (=> b!891769 (= res!604180 (not (is-Found!8832 lt!402851)))))

(declare-fun e!497679 () Bool)

(assert (=> b!891769 e!497679))

(declare-fun res!604187 () Bool)

(assert (=> b!891769 (=> res!604187 e!497679)))

(assert (=> b!891769 (= res!604187 (not (is-Found!8832 lt!402851)))))

(declare-datatypes ((Unit!30360 0))(
  ( (Unit!30361) )
))
(declare-fun lt!402853 () Unit!30360)

(declare-fun lemmaSeekEntryGivesInRangeIndex!34 (array!52194 array!52196 (_ BitVec 32) (_ BitVec 32) V!29107 V!29107 (_ BitVec 64)) Unit!30360)

(assert (=> b!891769 (= lt!402853 (lemmaSeekEntryGivesInRangeIndex!34 (_keys!9960 thiss!1181) (_values!5262 thiss!1181) (mask!25776 thiss!1181) (extraKeys!4971 thiss!1181) (zeroValue!5075 thiss!1181) (minValue!5075 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52194 (_ BitVec 32)) SeekEntryResult!8832)

(assert (=> b!891769 (= lt!402851 (seekEntry!0 key!785 (_keys!9960 thiss!1181) (mask!25776 thiss!1181)))))

(declare-fun res!604185 () Bool)

(assert (=> start!75808 (=> (not res!604185) (not e!497674))))

(declare-fun valid!1611 (LongMapFixedSize!4160) Bool)

(assert (=> start!75808 (= res!604185 (valid!1611 thiss!1181))))

(assert (=> start!75808 e!497674))

(assert (=> start!75808 e!497675))

(assert (=> start!75808 true))

(declare-fun b!891770 () Bool)

(declare-fun res!604182 () Bool)

(assert (=> b!891770 (=> (not res!604182) (not e!497674))))

(assert (=> b!891770 (= res!604182 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28715 () Bool)

(assert (=> mapIsEmpty!28715 mapRes!28715))

(declare-fun b!891771 () Bool)

(assert (=> b!891771 (= e!497678 e!497680)))

(declare-fun res!604186 () Bool)

(assert (=> b!891771 (=> res!604186 e!497680)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891771 (= res!604186 (not (validMask!0 (mask!25776 thiss!1181))))))

(assert (=> b!891771 (contains!4349 lt!402855 (select (arr!25103 (_keys!9960 thiss!1181)) (index!37700 lt!402851)))))

(declare-fun getCurrentListMap!2630 (array!52194 array!52196 (_ BitVec 32) (_ BitVec 32) V!29107 V!29107 (_ BitVec 32) Int) ListLongMap!10663)

(assert (=> b!891771 (= lt!402855 (getCurrentListMap!2630 (_keys!9960 thiss!1181) (_values!5262 thiss!1181) (mask!25776 thiss!1181) (extraKeys!4971 thiss!1181) (zeroValue!5075 thiss!1181) (minValue!5075 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5277 thiss!1181)))))

(declare-fun lt!402856 () Unit!30360)

(declare-fun lemmaValidKeyInArrayIsInListMap!219 (array!52194 array!52196 (_ BitVec 32) (_ BitVec 32) V!29107 V!29107 (_ BitVec 32) Int) Unit!30360)

(assert (=> b!891771 (= lt!402856 (lemmaValidKeyInArrayIsInListMap!219 (_keys!9960 thiss!1181) (_values!5262 thiss!1181) (mask!25776 thiss!1181) (extraKeys!4971 thiss!1181) (zeroValue!5075 thiss!1181) (minValue!5075 thiss!1181) (index!37700 lt!402851) (defaultEntry!5277 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891771 (arrayContainsKey!0 (_keys!9960 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402854 () Unit!30360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52194 (_ BitVec 64) (_ BitVec 32)) Unit!30360)

(assert (=> b!891771 (= lt!402854 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9960 thiss!1181) key!785 (index!37700 lt!402851)))))

(declare-fun b!891772 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891772 (= e!497679 (inRange!0 (index!37700 lt!402851) (mask!25776 thiss!1181)))))

(declare-fun b!891773 () Bool)

(declare-fun e!497677 () Bool)

(assert (=> b!891773 (= e!497681 (and e!497677 mapRes!28715))))

(declare-fun condMapEmpty!28715 () Bool)

(declare-fun mapDefault!28715 () ValueCell!8572)

