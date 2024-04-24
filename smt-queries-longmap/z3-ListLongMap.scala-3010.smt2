; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42380 () Bool)

(assert start!42380)

(declare-fun b_free!11869 () Bool)

(declare-fun b_next!11869 () Bool)

(assert (=> start!42380 (= b_free!11869 (not b_next!11869))))

(declare-fun tp!41641 () Bool)

(declare-fun b_and!20335 () Bool)

(assert (=> start!42380 (= tp!41641 b_and!20335)))

(declare-fun b!472939 () Bool)

(declare-fun e!277384 () Bool)

(declare-fun tp_is_empty!13297 () Bool)

(assert (=> b!472939 (= e!277384 tp_is_empty!13297)))

(declare-fun res!282517 () Bool)

(declare-fun e!277387 () Bool)

(assert (=> start!42380 (=> (not res!282517) (not e!277387))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42380 (= res!282517 (validMask!0 mask!1365))))

(assert (=> start!42380 e!277387))

(assert (=> start!42380 tp_is_empty!13297))

(assert (=> start!42380 tp!41641))

(assert (=> start!42380 true))

(declare-datatypes ((array!30338 0))(
  ( (array!30339 (arr!14588 (Array (_ BitVec 32) (_ BitVec 64))) (size!14940 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30338)

(declare-fun array_inv!10606 (array!30338) Bool)

(assert (=> start!42380 (array_inv!10606 _keys!1025)))

(declare-datatypes ((V!18835 0))(
  ( (V!18836 (val!6693 Int)) )
))
(declare-datatypes ((ValueCell!6305 0))(
  ( (ValueCellFull!6305 (v!8985 V!18835)) (EmptyCell!6305) )
))
(declare-datatypes ((array!30340 0))(
  ( (array!30341 (arr!14589 (Array (_ BitVec 32) ValueCell!6305)) (size!14941 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30340)

(declare-fun e!277388 () Bool)

(declare-fun array_inv!10607 (array!30340) Bool)

(assert (=> start!42380 (and (array_inv!10607 _values!833) e!277388)))

(declare-fun b!472940 () Bool)

(declare-fun res!282516 () Bool)

(assert (=> b!472940 (=> (not res!282516) (not e!277387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30338 (_ BitVec 32)) Bool)

(assert (=> b!472940 (= res!282516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472941 () Bool)

(declare-fun e!277386 () Bool)

(declare-fun mapRes!21658 () Bool)

(assert (=> b!472941 (= e!277388 (and e!277386 mapRes!21658))))

(declare-fun condMapEmpty!21658 () Bool)

(declare-fun mapDefault!21658 () ValueCell!6305)

(assert (=> b!472941 (= condMapEmpty!21658 (= (arr!14589 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6305)) mapDefault!21658)))))

(declare-fun b!472942 () Bool)

(declare-fun e!277385 () Bool)

(assert (=> b!472942 (= e!277387 (not e!277385))))

(declare-fun res!282518 () Bool)

(assert (=> b!472942 (=> res!282518 e!277385)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472942 (= res!282518 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8744 0))(
  ( (tuple2!8745 (_1!4383 (_ BitVec 64)) (_2!4383 V!18835)) )
))
(declare-datatypes ((List!8807 0))(
  ( (Nil!8804) (Cons!8803 (h!9659 tuple2!8744) (t!14769 List!8807)) )
))
(declare-datatypes ((ListLongMap!7659 0))(
  ( (ListLongMap!7660 (toList!3845 List!8807)) )
))
(declare-fun lt!214717 () ListLongMap!7659)

(declare-fun lt!214715 () ListLongMap!7659)

(assert (=> b!472942 (= lt!214717 lt!214715)))

(declare-fun minValueBefore!38 () V!18835)

(declare-datatypes ((Unit!13894 0))(
  ( (Unit!13895) )
))
(declare-fun lt!214720 () Unit!13894)

(declare-fun zeroValue!794 () V!18835)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18835)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!215 (array!30338 array!30340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18835 V!18835 V!18835 V!18835 (_ BitVec 32) Int) Unit!13894)

(assert (=> b!472942 (= lt!214720 (lemmaNoChangeToArrayThenSameMapNoExtras!215 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2055 (array!30338 array!30340 (_ BitVec 32) (_ BitVec 32) V!18835 V!18835 (_ BitVec 32) Int) ListLongMap!7659)

(assert (=> b!472942 (= lt!214715 (getCurrentListMapNoExtraKeys!2055 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472942 (= lt!214717 (getCurrentListMapNoExtraKeys!2055 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472943 () Bool)

(assert (=> b!472943 (= e!277386 tp_is_empty!13297)))

(declare-fun b!472944 () Bool)

(declare-fun res!282519 () Bool)

(assert (=> b!472944 (=> (not res!282519) (not e!277387))))

(assert (=> b!472944 (= res!282519 (and (= (size!14941 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14940 _keys!1025) (size!14941 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21658 () Bool)

(declare-fun tp!41640 () Bool)

(assert (=> mapNonEmpty!21658 (= mapRes!21658 (and tp!41640 e!277384))))

(declare-fun mapValue!21658 () ValueCell!6305)

(declare-fun mapRest!21658 () (Array (_ BitVec 32) ValueCell!6305))

(declare-fun mapKey!21658 () (_ BitVec 32))

(assert (=> mapNonEmpty!21658 (= (arr!14589 _values!833) (store mapRest!21658 mapKey!21658 mapValue!21658))))

(declare-fun b!472945 () Bool)

(declare-fun res!282515 () Bool)

(assert (=> b!472945 (=> (not res!282515) (not e!277387))))

(declare-datatypes ((List!8808 0))(
  ( (Nil!8805) (Cons!8804 (h!9660 (_ BitVec 64)) (t!14770 List!8808)) )
))
(declare-fun arrayNoDuplicates!0 (array!30338 (_ BitVec 32) List!8808) Bool)

(assert (=> b!472945 (= res!282515 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8805))))

(declare-fun b!472946 () Bool)

(assert (=> b!472946 (= e!277385 true)))

(declare-fun lt!214713 () ListLongMap!7659)

(declare-fun lt!214714 () tuple2!8744)

(declare-fun +!1731 (ListLongMap!7659 tuple2!8744) ListLongMap!7659)

(assert (=> b!472946 (= (+!1731 lt!214713 lt!214714) (+!1731 (+!1731 lt!214713 (tuple2!8745 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214714))))

(assert (=> b!472946 (= lt!214714 (tuple2!8745 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214719 () Unit!13894)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!133 (ListLongMap!7659 (_ BitVec 64) V!18835 V!18835) Unit!13894)

(assert (=> b!472946 (= lt!214719 (addSameAsAddTwiceSameKeyDiffValues!133 lt!214713 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!472946 (= lt!214713 (+!1731 lt!214717 (tuple2!8745 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214716 () ListLongMap!7659)

(declare-fun getCurrentListMap!2211 (array!30338 array!30340 (_ BitVec 32) (_ BitVec 32) V!18835 V!18835 (_ BitVec 32) Int) ListLongMap!7659)

(assert (=> b!472946 (= lt!214716 (getCurrentListMap!2211 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214718 () ListLongMap!7659)

(assert (=> b!472946 (= lt!214718 (getCurrentListMap!2211 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21658 () Bool)

(assert (=> mapIsEmpty!21658 mapRes!21658))

(assert (= (and start!42380 res!282517) b!472944))

(assert (= (and b!472944 res!282519) b!472940))

(assert (= (and b!472940 res!282516) b!472945))

(assert (= (and b!472945 res!282515) b!472942))

(assert (= (and b!472942 (not res!282518)) b!472946))

(assert (= (and b!472941 condMapEmpty!21658) mapIsEmpty!21658))

(assert (= (and b!472941 (not condMapEmpty!21658)) mapNonEmpty!21658))

(get-info :version)

(assert (= (and mapNonEmpty!21658 ((_ is ValueCellFull!6305) mapValue!21658)) b!472939))

(assert (= (and b!472941 ((_ is ValueCellFull!6305) mapDefault!21658)) b!472943))

(assert (= start!42380 b!472941))

(declare-fun m!455087 () Bool)

(assert (=> b!472945 m!455087))

(declare-fun m!455089 () Bool)

(assert (=> b!472940 m!455089))

(declare-fun m!455091 () Bool)

(assert (=> b!472946 m!455091))

(assert (=> b!472946 m!455091))

(declare-fun m!455093 () Bool)

(assert (=> b!472946 m!455093))

(declare-fun m!455095 () Bool)

(assert (=> b!472946 m!455095))

(declare-fun m!455097 () Bool)

(assert (=> b!472946 m!455097))

(declare-fun m!455099 () Bool)

(assert (=> b!472946 m!455099))

(declare-fun m!455101 () Bool)

(assert (=> b!472946 m!455101))

(declare-fun m!455103 () Bool)

(assert (=> b!472946 m!455103))

(declare-fun m!455105 () Bool)

(assert (=> b!472942 m!455105))

(declare-fun m!455107 () Bool)

(assert (=> b!472942 m!455107))

(declare-fun m!455109 () Bool)

(assert (=> b!472942 m!455109))

(declare-fun m!455111 () Bool)

(assert (=> start!42380 m!455111))

(declare-fun m!455113 () Bool)

(assert (=> start!42380 m!455113))

(declare-fun m!455115 () Bool)

(assert (=> start!42380 m!455115))

(declare-fun m!455117 () Bool)

(assert (=> mapNonEmpty!21658 m!455117))

(check-sat (not b_next!11869) tp_is_empty!13297 (not b!472945) (not b!472942) (not b!472940) (not b!472946) b_and!20335 (not start!42380) (not mapNonEmpty!21658))
(check-sat b_and!20335 (not b_next!11869))
