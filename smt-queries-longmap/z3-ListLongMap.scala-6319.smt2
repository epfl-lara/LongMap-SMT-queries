; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81368 () Bool)

(assert start!81368)

(declare-fun b!951097 () Bool)

(declare-fun b_free!18235 () Bool)

(declare-fun b_next!18235 () Bool)

(assert (=> b!951097 (= b_free!18235 (not b_next!18235))))

(declare-fun tp!63302 () Bool)

(declare-fun b_and!29701 () Bool)

(assert (=> b!951097 (= tp!63302 b_and!29701)))

(declare-fun res!637430 () Bool)

(declare-fun e!535545 () Bool)

(assert (=> start!81368 (=> (not res!637430) (not e!535545))))

(declare-datatypes ((V!32623 0))(
  ( (V!32624 (val!10422 Int)) )
))
(declare-datatypes ((ValueCell!9890 0))(
  ( (ValueCellFull!9890 (v!12962 V!32623)) (EmptyCell!9890) )
))
(declare-datatypes ((array!57555 0))(
  ( (array!57556 (arr!27673 (Array (_ BitVec 32) ValueCell!9890)) (size!28151 (_ BitVec 32))) )
))
(declare-datatypes ((array!57557 0))(
  ( (array!57558 (arr!27674 (Array (_ BitVec 32) (_ BitVec 64))) (size!28152 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4930 0))(
  ( (LongMapFixedSize!4931 (defaultEntry!5776 Int) (mask!27617 (_ BitVec 32)) (extraKeys!5508 (_ BitVec 32)) (zeroValue!5612 V!32623) (minValue!5612 V!32623) (_size!2520 (_ BitVec 32)) (_keys!10740 array!57557) (_values!5799 array!57555) (_vacant!2520 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4930)

(declare-fun valid!1887 (LongMapFixedSize!4930) Bool)

(assert (=> start!81368 (= res!637430 (valid!1887 thiss!1141))))

(assert (=> start!81368 e!535545))

(declare-fun e!535542 () Bool)

(assert (=> start!81368 e!535542))

(assert (=> start!81368 true))

(declare-fun mapIsEmpty!33026 () Bool)

(declare-fun mapRes!33026 () Bool)

(assert (=> mapIsEmpty!33026 mapRes!33026))

(declare-fun tp_is_empty!20743 () Bool)

(declare-fun e!535543 () Bool)

(declare-fun array_inv!21560 (array!57557) Bool)

(declare-fun array_inv!21561 (array!57555) Bool)

(assert (=> b!951097 (= e!535542 (and tp!63302 tp_is_empty!20743 (array_inv!21560 (_keys!10740 thiss!1141)) (array_inv!21561 (_values!5799 thiss!1141)) e!535543))))

(declare-fun b!951098 () Bool)

(declare-fun res!637429 () Bool)

(assert (=> b!951098 (=> (not res!637429) (not e!535545))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13530 0))(
  ( (tuple2!13531 (_1!6776 (_ BitVec 64)) (_2!6776 V!32623)) )
))
(declare-datatypes ((List!19324 0))(
  ( (Nil!19321) (Cons!19320 (h!20486 tuple2!13530) (t!27655 List!19324)) )
))
(declare-datatypes ((ListLongMap!12229 0))(
  ( (ListLongMap!12230 (toList!6130 List!19324)) )
))
(declare-fun contains!5232 (ListLongMap!12229 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3363 (array!57557 array!57555 (_ BitVec 32) (_ BitVec 32) V!32623 V!32623 (_ BitVec 32) Int) ListLongMap!12229)

(assert (=> b!951098 (= res!637429 (contains!5232 (getCurrentListMap!3363 (_keys!10740 thiss!1141) (_values!5799 thiss!1141) (mask!27617 thiss!1141) (extraKeys!5508 thiss!1141) (zeroValue!5612 thiss!1141) (minValue!5612 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5776 thiss!1141)) key!756))))

(declare-fun b!951099 () Bool)

(assert (=> b!951099 (= e!535545 false)))

(declare-fun lt!428293 () Bool)

(declare-datatypes ((List!19325 0))(
  ( (Nil!19322) (Cons!19321 (h!20487 (_ BitVec 64)) (t!27656 List!19325)) )
))
(declare-fun arrayNoDuplicates!0 (array!57557 (_ BitVec 32) List!19325) Bool)

(assert (=> b!951099 (= lt!428293 (arrayNoDuplicates!0 (_keys!10740 thiss!1141) #b00000000000000000000000000000000 Nil!19322))))

(declare-fun b!951100 () Bool)

(declare-fun res!637428 () Bool)

(assert (=> b!951100 (=> (not res!637428) (not e!535545))))

(assert (=> b!951100 (= res!637428 (and (= (size!28151 (_values!5799 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27617 thiss!1141))) (= (size!28152 (_keys!10740 thiss!1141)) (size!28151 (_values!5799 thiss!1141))) (bvsge (mask!27617 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5508 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5508 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!951101 () Bool)

(declare-fun e!535544 () Bool)

(assert (=> b!951101 (= e!535543 (and e!535544 mapRes!33026))))

(declare-fun condMapEmpty!33026 () Bool)

(declare-fun mapDefault!33026 () ValueCell!9890)

(assert (=> b!951101 (= condMapEmpty!33026 (= (arr!27673 (_values!5799 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9890)) mapDefault!33026)))))

(declare-fun b!951102 () Bool)

(declare-fun res!637431 () Bool)

(assert (=> b!951102 (=> (not res!637431) (not e!535545))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9099 0))(
  ( (MissingZero!9099 (index!38767 (_ BitVec 32))) (Found!9099 (index!38768 (_ BitVec 32))) (Intermediate!9099 (undefined!9911 Bool) (index!38769 (_ BitVec 32)) (x!81723 (_ BitVec 32))) (Undefined!9099) (MissingVacant!9099 (index!38770 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57557 (_ BitVec 32)) SeekEntryResult!9099)

(assert (=> b!951102 (= res!637431 (not ((_ is Found!9099) (seekEntry!0 key!756 (_keys!10740 thiss!1141) (mask!27617 thiss!1141)))))))

(declare-fun b!951103 () Bool)

(declare-fun res!637434 () Bool)

(assert (=> b!951103 (=> (not res!637434) (not e!535545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57557 (_ BitVec 32)) Bool)

(assert (=> b!951103 (= res!637434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10740 thiss!1141) (mask!27617 thiss!1141)))))

(declare-fun b!951104 () Bool)

(declare-fun res!637433 () Bool)

(assert (=> b!951104 (=> (not res!637433) (not e!535545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951104 (= res!637433 (validMask!0 (mask!27617 thiss!1141)))))

(declare-fun b!951105 () Bool)

(assert (=> b!951105 (= e!535544 tp_is_empty!20743)))

(declare-fun b!951106 () Bool)

(declare-fun e!535541 () Bool)

(assert (=> b!951106 (= e!535541 tp_is_empty!20743)))

(declare-fun mapNonEmpty!33026 () Bool)

(declare-fun tp!63301 () Bool)

(assert (=> mapNonEmpty!33026 (= mapRes!33026 (and tp!63301 e!535541))))

(declare-fun mapValue!33026 () ValueCell!9890)

(declare-fun mapRest!33026 () (Array (_ BitVec 32) ValueCell!9890))

(declare-fun mapKey!33026 () (_ BitVec 32))

(assert (=> mapNonEmpty!33026 (= (arr!27673 (_values!5799 thiss!1141)) (store mapRest!33026 mapKey!33026 mapValue!33026))))

(declare-fun b!951107 () Bool)

(declare-fun res!637432 () Bool)

(assert (=> b!951107 (=> (not res!637432) (not e!535545))))

(assert (=> b!951107 (= res!637432 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!81368 res!637430) b!951107))

(assert (= (and b!951107 res!637432) b!951102))

(assert (= (and b!951102 res!637431) b!951098))

(assert (= (and b!951098 res!637429) b!951104))

(assert (= (and b!951104 res!637433) b!951100))

(assert (= (and b!951100 res!637428) b!951103))

(assert (= (and b!951103 res!637434) b!951099))

(assert (= (and b!951101 condMapEmpty!33026) mapIsEmpty!33026))

(assert (= (and b!951101 (not condMapEmpty!33026)) mapNonEmpty!33026))

(assert (= (and mapNonEmpty!33026 ((_ is ValueCellFull!9890) mapValue!33026)) b!951106))

(assert (= (and b!951101 ((_ is ValueCellFull!9890) mapDefault!33026)) b!951105))

(assert (= b!951097 b!951101))

(assert (= start!81368 b!951097))

(declare-fun m!883965 () Bool)

(assert (=> b!951103 m!883965))

(declare-fun m!883967 () Bool)

(assert (=> b!951099 m!883967))

(declare-fun m!883969 () Bool)

(assert (=> b!951104 m!883969))

(declare-fun m!883971 () Bool)

(assert (=> mapNonEmpty!33026 m!883971))

(declare-fun m!883973 () Bool)

(assert (=> start!81368 m!883973))

(declare-fun m!883975 () Bool)

(assert (=> b!951102 m!883975))

(declare-fun m!883977 () Bool)

(assert (=> b!951098 m!883977))

(assert (=> b!951098 m!883977))

(declare-fun m!883979 () Bool)

(assert (=> b!951098 m!883979))

(declare-fun m!883981 () Bool)

(assert (=> b!951097 m!883981))

(declare-fun m!883983 () Bool)

(assert (=> b!951097 m!883983))

(check-sat tp_is_empty!20743 (not b!951098) (not b!951097) (not b!951099) (not mapNonEmpty!33026) b_and!29701 (not b_next!18235) (not b!951102) (not b!951103) (not b!951104) (not start!81368))
(check-sat b_and!29701 (not b_next!18235))
