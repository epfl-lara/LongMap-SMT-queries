; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71088 () Bool)

(assert start!71088)

(declare-fun b_free!13275 () Bool)

(declare-fun b_next!13275 () Bool)

(assert (=> start!71088 (= b_free!13275 (not b_next!13275))))

(declare-fun tp!46582 () Bool)

(declare-fun b_and!22189 () Bool)

(assert (=> start!71088 (= tp!46582 b_and!22189)))

(declare-fun b!825589 () Bool)

(declare-fun res!562801 () Bool)

(declare-fun e!459557 () Bool)

(assert (=> b!825589 (=> (not res!562801) (not e!459557))))

(declare-datatypes ((array!46152 0))(
  ( (array!46153 (arr!22122 (Array (_ BitVec 32) (_ BitVec 64))) (size!22543 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46152)

(declare-datatypes ((List!15786 0))(
  ( (Nil!15783) (Cons!15782 (h!16911 (_ BitVec 64)) (t!22131 List!15786)) )
))
(declare-fun arrayNoDuplicates!0 (array!46152 (_ BitVec 32) List!15786) Bool)

(assert (=> b!825589 (= res!562801 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15783))))

(declare-fun b!825590 () Bool)

(declare-fun res!562806 () Bool)

(assert (=> b!825590 (=> (not res!562806) (not e!459557))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46152 (_ BitVec 32)) Bool)

(assert (=> b!825590 (= res!562806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825591 () Bool)

(declare-fun res!562803 () Bool)

(assert (=> b!825591 (=> (not res!562803) (not e!459557))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24981 0))(
  ( (V!24982 (val!7540 Int)) )
))
(declare-datatypes ((ValueCell!7077 0))(
  ( (ValueCellFull!7077 (v!9973 V!24981)) (EmptyCell!7077) )
))
(declare-datatypes ((array!46154 0))(
  ( (array!46155 (arr!22123 (Array (_ BitVec 32) ValueCell!7077)) (size!22544 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46154)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825591 (= res!562803 (and (= (size!22544 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22543 _keys!976) (size!22544 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9982 0))(
  ( (tuple2!9983 (_1!5002 (_ BitVec 64)) (_2!5002 V!24981)) )
))
(declare-datatypes ((List!15787 0))(
  ( (Nil!15784) (Cons!15783 (h!16912 tuple2!9982) (t!22132 List!15787)) )
))
(declare-datatypes ((ListLongMap!8805 0))(
  ( (ListLongMap!8806 (toList!4418 List!15787)) )
))
(declare-fun lt!372886 () ListLongMap!8805)

(declare-fun lt!372894 () ListLongMap!8805)

(declare-fun lt!372893 () tuple2!9982)

(declare-fun lt!372881 () tuple2!9982)

(declare-fun b!825592 () Bool)

(declare-fun e!459555 () Bool)

(declare-fun +!1925 (ListLongMap!8805 tuple2!9982) ListLongMap!8805)

(assert (=> b!825592 (= e!459555 (= lt!372894 (+!1925 (+!1925 lt!372886 lt!372893) lt!372881)))))

(declare-fun b!825593 () Bool)

(declare-fun e!459559 () Bool)

(declare-fun e!459558 () Bool)

(declare-fun mapRes!24100 () Bool)

(assert (=> b!825593 (= e!459559 (and e!459558 mapRes!24100))))

(declare-fun condMapEmpty!24100 () Bool)

(declare-fun mapDefault!24100 () ValueCell!7077)

(assert (=> b!825593 (= condMapEmpty!24100 (= (arr!22123 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7077)) mapDefault!24100)))))

(declare-fun b!825594 () Bool)

(declare-fun e!459556 () Bool)

(declare-fun tp_is_empty!14985 () Bool)

(assert (=> b!825594 (= e!459556 tp_is_empty!14985)))

(declare-fun b!825595 () Bool)

(declare-fun e!459561 () Bool)

(assert (=> b!825595 (= e!459561 true)))

(declare-fun lt!372885 () ListLongMap!8805)

(declare-fun lt!372888 () ListLongMap!8805)

(assert (=> b!825595 (= lt!372888 (+!1925 (+!1925 lt!372885 lt!372881) lt!372893))))

(declare-fun lt!372890 () ListLongMap!8805)

(declare-fun lt!372882 () ListLongMap!8805)

(assert (=> b!825595 (and (= lt!372890 lt!372882) (= lt!372894 lt!372882) (= lt!372894 lt!372890))))

(declare-fun lt!372887 () ListLongMap!8805)

(assert (=> b!825595 (= lt!372882 (+!1925 lt!372887 lt!372881))))

(declare-fun lt!372883 () ListLongMap!8805)

(assert (=> b!825595 (= lt!372890 (+!1925 lt!372883 lt!372881))))

(declare-fun zeroValueBefore!34 () V!24981)

(declare-fun zeroValueAfter!34 () V!24981)

(declare-datatypes ((Unit!28297 0))(
  ( (Unit!28298) )
))
(declare-fun lt!372889 () Unit!28297)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!210 (ListLongMap!8805 (_ BitVec 64) V!24981 V!24981) Unit!28297)

(assert (=> b!825595 (= lt!372889 (addSameAsAddTwiceSameKeyDiffValues!210 lt!372883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!825595 e!459555))

(declare-fun res!562804 () Bool)

(assert (=> b!825595 (=> (not res!562804) (not e!459555))))

(declare-fun lt!372891 () ListLongMap!8805)

(assert (=> b!825595 (= res!562804 (= lt!372891 lt!372887))))

(declare-fun lt!372892 () tuple2!9982)

(assert (=> b!825595 (= lt!372887 (+!1925 lt!372883 lt!372892))))

(assert (=> b!825595 (= lt!372883 (+!1925 lt!372885 lt!372893))))

(assert (=> b!825595 (= lt!372881 (tuple2!9983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459560 () Bool)

(assert (=> b!825595 e!459560))

(declare-fun res!562805 () Bool)

(assert (=> b!825595 (=> (not res!562805) (not e!459560))))

(assert (=> b!825595 (= res!562805 (= lt!372891 (+!1925 (+!1925 lt!372885 lt!372892) lt!372893)))))

(declare-fun minValue!754 () V!24981)

(assert (=> b!825595 (= lt!372893 (tuple2!9983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825595 (= lt!372892 (tuple2!9983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2550 (array!46152 array!46154 (_ BitVec 32) (_ BitVec 32) V!24981 V!24981 (_ BitVec 32) Int) ListLongMap!8805)

(assert (=> b!825595 (= lt!372894 (getCurrentListMap!2550 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825595 (= lt!372891 (getCurrentListMap!2550 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562802 () Bool)

(assert (=> start!71088 (=> (not res!562802) (not e!459557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71088 (= res!562802 (validMask!0 mask!1312))))

(assert (=> start!71088 e!459557))

(assert (=> start!71088 tp_is_empty!14985))

(declare-fun array_inv!17635 (array!46152) Bool)

(assert (=> start!71088 (array_inv!17635 _keys!976)))

(assert (=> start!71088 true))

(declare-fun array_inv!17636 (array!46154) Bool)

(assert (=> start!71088 (and (array_inv!17636 _values!788) e!459559)))

(assert (=> start!71088 tp!46582))

(declare-fun b!825588 () Bool)

(assert (=> b!825588 (= e!459560 (= lt!372894 (+!1925 (+!1925 lt!372886 (tuple2!9983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372893)))))

(declare-fun b!825596 () Bool)

(assert (=> b!825596 (= e!459557 (not e!459561))))

(declare-fun res!562807 () Bool)

(assert (=> b!825596 (=> res!562807 e!459561)))

(assert (=> b!825596 (= res!562807 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825596 (= lt!372885 lt!372886)))

(declare-fun lt!372884 () Unit!28297)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!538 (array!46152 array!46154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24981 V!24981 V!24981 V!24981 (_ BitVec 32) Int) Unit!28297)

(assert (=> b!825596 (= lt!372884 (lemmaNoChangeToArrayThenSameMapNoExtras!538 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2428 (array!46152 array!46154 (_ BitVec 32) (_ BitVec 32) V!24981 V!24981 (_ BitVec 32) Int) ListLongMap!8805)

(assert (=> b!825596 (= lt!372886 (getCurrentListMapNoExtraKeys!2428 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825596 (= lt!372885 (getCurrentListMapNoExtraKeys!2428 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24100 () Bool)

(assert (=> mapIsEmpty!24100 mapRes!24100))

(declare-fun mapNonEmpty!24100 () Bool)

(declare-fun tp!46581 () Bool)

(assert (=> mapNonEmpty!24100 (= mapRes!24100 (and tp!46581 e!459556))))

(declare-fun mapRest!24100 () (Array (_ BitVec 32) ValueCell!7077))

(declare-fun mapKey!24100 () (_ BitVec 32))

(declare-fun mapValue!24100 () ValueCell!7077)

(assert (=> mapNonEmpty!24100 (= (arr!22123 _values!788) (store mapRest!24100 mapKey!24100 mapValue!24100))))

(declare-fun b!825597 () Bool)

(assert (=> b!825597 (= e!459558 tp_is_empty!14985)))

(assert (= (and start!71088 res!562802) b!825591))

(assert (= (and b!825591 res!562803) b!825590))

(assert (= (and b!825590 res!562806) b!825589))

(assert (= (and b!825589 res!562801) b!825596))

(assert (= (and b!825596 (not res!562807)) b!825595))

(assert (= (and b!825595 res!562805) b!825588))

(assert (= (and b!825595 res!562804) b!825592))

(assert (= (and b!825593 condMapEmpty!24100) mapIsEmpty!24100))

(assert (= (and b!825593 (not condMapEmpty!24100)) mapNonEmpty!24100))

(get-info :version)

(assert (= (and mapNonEmpty!24100 ((_ is ValueCellFull!7077) mapValue!24100)) b!825594))

(assert (= (and b!825593 ((_ is ValueCellFull!7077) mapDefault!24100)) b!825597))

(assert (= start!71088 b!825593))

(declare-fun m!767837 () Bool)

(assert (=> b!825592 m!767837))

(assert (=> b!825592 m!767837))

(declare-fun m!767839 () Bool)

(assert (=> b!825592 m!767839))

(declare-fun m!767841 () Bool)

(assert (=> mapNonEmpty!24100 m!767841))

(declare-fun m!767843 () Bool)

(assert (=> b!825595 m!767843))

(declare-fun m!767845 () Bool)

(assert (=> b!825595 m!767845))

(declare-fun m!767847 () Bool)

(assert (=> b!825595 m!767847))

(declare-fun m!767849 () Bool)

(assert (=> b!825595 m!767849))

(declare-fun m!767851 () Bool)

(assert (=> b!825595 m!767851))

(declare-fun m!767853 () Bool)

(assert (=> b!825595 m!767853))

(declare-fun m!767855 () Bool)

(assert (=> b!825595 m!767855))

(declare-fun m!767857 () Bool)

(assert (=> b!825595 m!767857))

(assert (=> b!825595 m!767853))

(declare-fun m!767859 () Bool)

(assert (=> b!825595 m!767859))

(declare-fun m!767861 () Bool)

(assert (=> b!825595 m!767861))

(assert (=> b!825595 m!767849))

(declare-fun m!767863 () Bool)

(assert (=> b!825595 m!767863))

(declare-fun m!767865 () Bool)

(assert (=> b!825589 m!767865))

(declare-fun m!767867 () Bool)

(assert (=> b!825596 m!767867))

(declare-fun m!767869 () Bool)

(assert (=> b!825596 m!767869))

(declare-fun m!767871 () Bool)

(assert (=> b!825596 m!767871))

(declare-fun m!767873 () Bool)

(assert (=> b!825590 m!767873))

(declare-fun m!767875 () Bool)

(assert (=> b!825588 m!767875))

(assert (=> b!825588 m!767875))

(declare-fun m!767877 () Bool)

(assert (=> b!825588 m!767877))

(declare-fun m!767879 () Bool)

(assert (=> start!71088 m!767879))

(declare-fun m!767881 () Bool)

(assert (=> start!71088 m!767881))

(declare-fun m!767883 () Bool)

(assert (=> start!71088 m!767883))

(check-sat tp_is_empty!14985 (not mapNonEmpty!24100) b_and!22189 (not b!825589) (not start!71088) (not b!825590) (not b!825595) (not b_next!13275) (not b!825592) (not b!825588) (not b!825596))
(check-sat b_and!22189 (not b_next!13275))
