; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81154 () Bool)

(assert start!81154)

(declare-fun b!949748 () Bool)

(declare-fun b_free!18223 () Bool)

(declare-fun b_next!18223 () Bool)

(assert (=> b!949748 (= b_free!18223 (not b_next!18223))))

(declare-fun tp!63259 () Bool)

(declare-fun b_and!29675 () Bool)

(assert (=> b!949748 (= tp!63259 b_and!29675)))

(declare-fun b!949746 () Bool)

(declare-fun e!534697 () Bool)

(declare-datatypes ((V!32607 0))(
  ( (V!32608 (val!10416 Int)) )
))
(declare-datatypes ((ValueCell!9884 0))(
  ( (ValueCellFull!9884 (v!12957 V!32607)) (EmptyCell!9884) )
))
(declare-datatypes ((array!57476 0))(
  ( (array!57477 (arr!27640 (Array (_ BitVec 32) ValueCell!9884)) (size!28117 (_ BitVec 32))) )
))
(declare-datatypes ((array!57478 0))(
  ( (array!57479 (arr!27641 (Array (_ BitVec 32) (_ BitVec 64))) (size!28118 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4918 0))(
  ( (LongMapFixedSize!4919 (defaultEntry!5768 Int) (mask!27556 (_ BitVec 32)) (extraKeys!5500 (_ BitVec 32)) (zeroValue!5604 V!32607) (minValue!5604 V!32607) (_size!2514 (_ BitVec 32)) (_keys!10700 array!57478) (_values!5791 array!57476) (_vacant!2514 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4918)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57478 (_ BitVec 32)) Bool)

(assert (=> b!949746 (= e!534697 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10700 thiss!1141) (mask!27556 thiss!1141))))))

(declare-fun tp_is_empty!20731 () Bool)

(declare-fun e!534698 () Bool)

(declare-fun e!534694 () Bool)

(declare-fun array_inv!21454 (array!57478) Bool)

(declare-fun array_inv!21455 (array!57476) Bool)

(assert (=> b!949748 (= e!534694 (and tp!63259 tp_is_empty!20731 (array_inv!21454 (_keys!10700 thiss!1141)) (array_inv!21455 (_values!5791 thiss!1141)) e!534698))))

(declare-fun b!949749 () Bool)

(declare-fun e!534696 () Bool)

(assert (=> b!949749 (= e!534696 tp_is_empty!20731)))

(declare-fun b!949750 () Bool)

(declare-fun res!636866 () Bool)

(assert (=> b!949750 (=> (not res!636866) (not e!534697))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13536 0))(
  ( (tuple2!13537 (_1!6779 (_ BitVec 64)) (_2!6779 V!32607)) )
))
(declare-datatypes ((List!19328 0))(
  ( (Nil!19325) (Cons!19324 (h!20484 tuple2!13536) (t!27663 List!19328)) )
))
(declare-datatypes ((ListLongMap!12233 0))(
  ( (ListLongMap!12234 (toList!6132 List!19328)) )
))
(declare-fun contains!5222 (ListLongMap!12233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3365 (array!57478 array!57476 (_ BitVec 32) (_ BitVec 32) V!32607 V!32607 (_ BitVec 32) Int) ListLongMap!12233)

(assert (=> b!949750 (= res!636866 (contains!5222 (getCurrentListMap!3365 (_keys!10700 thiss!1141) (_values!5791 thiss!1141) (mask!27556 thiss!1141) (extraKeys!5500 thiss!1141) (zeroValue!5604 thiss!1141) (minValue!5604 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5768 thiss!1141)) key!756))))

(declare-fun b!949751 () Bool)

(declare-fun res!636870 () Bool)

(assert (=> b!949751 (=> (not res!636870) (not e!534697))))

(assert (=> b!949751 (= res!636870 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949752 () Bool)

(declare-fun e!534695 () Bool)

(assert (=> b!949752 (= e!534695 tp_is_empty!20731)))

(declare-fun b!949747 () Bool)

(declare-fun res!636868 () Bool)

(assert (=> b!949747 (=> (not res!636868) (not e!534697))))

(declare-datatypes ((SeekEntryResult!9133 0))(
  ( (MissingZero!9133 (index!38903 (_ BitVec 32))) (Found!9133 (index!38904 (_ BitVec 32))) (Intermediate!9133 (undefined!9945 Bool) (index!38905 (_ BitVec 32)) (x!81707 (_ BitVec 32))) (Undefined!9133) (MissingVacant!9133 (index!38906 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57478 (_ BitVec 32)) SeekEntryResult!9133)

(assert (=> b!949747 (= res!636868 (not (is-Found!9133 (seekEntry!0 key!756 (_keys!10700 thiss!1141) (mask!27556 thiss!1141)))))))

(declare-fun res!636867 () Bool)

(assert (=> start!81154 (=> (not res!636867) (not e!534697))))

(declare-fun valid!1872 (LongMapFixedSize!4918) Bool)

(assert (=> start!81154 (= res!636867 (valid!1872 thiss!1141))))

(assert (=> start!81154 e!534697))

(assert (=> start!81154 e!534694))

(assert (=> start!81154 true))

(declare-fun mapNonEmpty!33002 () Bool)

(declare-fun mapRes!33002 () Bool)

(declare-fun tp!63258 () Bool)

(assert (=> mapNonEmpty!33002 (= mapRes!33002 (and tp!63258 e!534696))))

(declare-fun mapRest!33002 () (Array (_ BitVec 32) ValueCell!9884))

(declare-fun mapValue!33002 () ValueCell!9884)

(declare-fun mapKey!33002 () (_ BitVec 32))

(assert (=> mapNonEmpty!33002 (= (arr!27640 (_values!5791 thiss!1141)) (store mapRest!33002 mapKey!33002 mapValue!33002))))

(declare-fun mapIsEmpty!33002 () Bool)

(assert (=> mapIsEmpty!33002 mapRes!33002))

(declare-fun b!949753 () Bool)

(declare-fun res!636871 () Bool)

(assert (=> b!949753 (=> (not res!636871) (not e!534697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949753 (= res!636871 (validMask!0 (mask!27556 thiss!1141)))))

(declare-fun b!949754 () Bool)

(declare-fun res!636869 () Bool)

(assert (=> b!949754 (=> (not res!636869) (not e!534697))))

(assert (=> b!949754 (= res!636869 (and (= (size!28117 (_values!5791 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27556 thiss!1141))) (= (size!28118 (_keys!10700 thiss!1141)) (size!28117 (_values!5791 thiss!1141))) (bvsge (mask!27556 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5500 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5500 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949755 () Bool)

(assert (=> b!949755 (= e!534698 (and e!534695 mapRes!33002))))

(declare-fun condMapEmpty!33002 () Bool)

(declare-fun mapDefault!33002 () ValueCell!9884)

