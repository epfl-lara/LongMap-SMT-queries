; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42476 () Bool)

(assert start!42476)

(declare-fun b_free!11931 () Bool)

(declare-fun b_next!11931 () Bool)

(assert (=> start!42476 (= b_free!11931 (not b_next!11931))))

(declare-fun tp!41830 () Bool)

(declare-fun b_and!20399 () Bool)

(assert (=> start!42476 (= tp!41830 b_and!20399)))

(declare-fun mapIsEmpty!21754 () Bool)

(declare-fun mapRes!21754 () Bool)

(assert (=> mapIsEmpty!21754 mapRes!21754))

(declare-fun b!473925 () Bool)

(declare-fun e!278093 () Bool)

(declare-fun tp_is_empty!13359 () Bool)

(assert (=> b!473925 (= e!278093 tp_is_empty!13359)))

(declare-fun res!283068 () Bool)

(declare-fun e!278098 () Bool)

(assert (=> start!42476 (=> (not res!283068) (not e!278098))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42476 (= res!283068 (validMask!0 mask!1365))))

(assert (=> start!42476 e!278098))

(assert (=> start!42476 tp_is_empty!13359))

(assert (=> start!42476 tp!41830))

(assert (=> start!42476 true))

(declare-datatypes ((array!30473 0))(
  ( (array!30474 (arr!14655 (Array (_ BitVec 32) (_ BitVec 64))) (size!15007 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30473)

(declare-fun array_inv!10572 (array!30473) Bool)

(assert (=> start!42476 (array_inv!10572 _keys!1025)))

(declare-datatypes ((V!18917 0))(
  ( (V!18918 (val!6724 Int)) )
))
(declare-datatypes ((ValueCell!6336 0))(
  ( (ValueCellFull!6336 (v!9016 V!18917)) (EmptyCell!6336) )
))
(declare-datatypes ((array!30475 0))(
  ( (array!30476 (arr!14656 (Array (_ BitVec 32) ValueCell!6336)) (size!15008 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30475)

(declare-fun e!278094 () Bool)

(declare-fun array_inv!10573 (array!30475) Bool)

(assert (=> start!42476 (and (array_inv!10573 _values!833) e!278094)))

(declare-fun b!473926 () Bool)

(declare-fun e!278096 () Bool)

(assert (=> b!473926 (= e!278096 tp_is_empty!13359)))

(declare-fun b!473927 () Bool)

(declare-fun res!283070 () Bool)

(assert (=> b!473927 (=> (not res!283070) (not e!278098))))

(declare-datatypes ((List!8943 0))(
  ( (Nil!8940) (Cons!8939 (h!9795 (_ BitVec 64)) (t!14915 List!8943)) )
))
(declare-fun arrayNoDuplicates!0 (array!30473 (_ BitVec 32) List!8943) Bool)

(assert (=> b!473927 (= res!283070 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8940))))

(declare-fun b!473928 () Bool)

(assert (=> b!473928 (= e!278094 (and e!278093 mapRes!21754))))

(declare-fun condMapEmpty!21754 () Bool)

(declare-fun mapDefault!21754 () ValueCell!6336)

(assert (=> b!473928 (= condMapEmpty!21754 (= (arr!14656 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6336)) mapDefault!21754)))))

(declare-fun b!473929 () Bool)

(declare-fun res!283067 () Bool)

(assert (=> b!473929 (=> (not res!283067) (not e!278098))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!473929 (= res!283067 (and (= (size!15008 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15007 _keys!1025) (size!15008 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21754 () Bool)

(declare-fun tp!41829 () Bool)

(assert (=> mapNonEmpty!21754 (= mapRes!21754 (and tp!41829 e!278096))))

(declare-fun mapKey!21754 () (_ BitVec 32))

(declare-fun mapValue!21754 () ValueCell!6336)

(declare-fun mapRest!21754 () (Array (_ BitVec 32) ValueCell!6336))

(assert (=> mapNonEmpty!21754 (= (arr!14656 _values!833) (store mapRest!21754 mapKey!21754 mapValue!21754))))

(declare-fun b!473930 () Bool)

(declare-fun res!283069 () Bool)

(assert (=> b!473930 (=> (not res!283069) (not e!278098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30473 (_ BitVec 32)) Bool)

(assert (=> b!473930 (= res!283069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!473931 () Bool)

(declare-fun e!278095 () Bool)

(assert (=> b!473931 (= e!278095 true)))

(declare-datatypes ((tuple2!8864 0))(
  ( (tuple2!8865 (_1!4443 (_ BitVec 64)) (_2!4443 V!18917)) )
))
(declare-datatypes ((List!8944 0))(
  ( (Nil!8941) (Cons!8940 (h!9796 tuple2!8864) (t!14916 List!8944)) )
))
(declare-datatypes ((ListLongMap!7777 0))(
  ( (ListLongMap!7778 (toList!3904 List!8944)) )
))
(declare-fun lt!215600 () ListLongMap!7777)

(declare-fun lt!215606 () tuple2!8864)

(declare-fun minValueBefore!38 () V!18917)

(declare-fun +!1739 (ListLongMap!7777 tuple2!8864) ListLongMap!7777)

(assert (=> b!473931 (= (+!1739 lt!215600 lt!215606) (+!1739 (+!1739 lt!215600 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215606))))

(declare-fun minValueAfter!38 () V!18917)

(assert (=> b!473931 (= lt!215606 (tuple2!8865 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13966 0))(
  ( (Unit!13967) )
))
(declare-fun lt!215603 () Unit!13966)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!148 (ListLongMap!7777 (_ BitVec 64) V!18917 V!18917) Unit!13966)

(assert (=> b!473931 (= lt!215603 (addSameAsAddTwiceSameKeyDiffValues!148 lt!215600 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215602 () ListLongMap!7777)

(declare-fun zeroValue!794 () V!18917)

(assert (=> b!473931 (= lt!215600 (+!1739 lt!215602 (tuple2!8865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215604 () ListLongMap!7777)

(declare-fun getCurrentListMap!2268 (array!30473 array!30475 (_ BitVec 32) (_ BitVec 32) V!18917 V!18917 (_ BitVec 32) Int) ListLongMap!7777)

(assert (=> b!473931 (= lt!215604 (getCurrentListMap!2268 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215601 () ListLongMap!7777)

(assert (=> b!473931 (= lt!215601 (getCurrentListMap!2268 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473932 () Bool)

(assert (=> b!473932 (= e!278098 (not e!278095))))

(declare-fun res!283066 () Bool)

(assert (=> b!473932 (=> res!283066 e!278095)))

(assert (=> b!473932 (= res!283066 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215607 () ListLongMap!7777)

(assert (=> b!473932 (= lt!215602 lt!215607)))

(declare-fun lt!215605 () Unit!13966)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!243 (array!30473 array!30475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18917 V!18917 V!18917 V!18917 (_ BitVec 32) Int) Unit!13966)

(assert (=> b!473932 (= lt!215605 (lemmaNoChangeToArrayThenSameMapNoExtras!243 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2063 (array!30473 array!30475 (_ BitVec 32) (_ BitVec 32) V!18917 V!18917 (_ BitVec 32) Int) ListLongMap!7777)

(assert (=> b!473932 (= lt!215607 (getCurrentListMapNoExtraKeys!2063 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473932 (= lt!215602 (getCurrentListMapNoExtraKeys!2063 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42476 res!283068) b!473929))

(assert (= (and b!473929 res!283067) b!473930))

(assert (= (and b!473930 res!283069) b!473927))

(assert (= (and b!473927 res!283070) b!473932))

(assert (= (and b!473932 (not res!283066)) b!473931))

(assert (= (and b!473928 condMapEmpty!21754) mapIsEmpty!21754))

(assert (= (and b!473928 (not condMapEmpty!21754)) mapNonEmpty!21754))

(get-info :version)

(assert (= (and mapNonEmpty!21754 ((_ is ValueCellFull!6336) mapValue!21754)) b!473926))

(assert (= (and b!473928 ((_ is ValueCellFull!6336) mapDefault!21754)) b!473925))

(assert (= start!42476 b!473928))

(declare-fun m!456109 () Bool)

(assert (=> b!473932 m!456109))

(declare-fun m!456111 () Bool)

(assert (=> b!473932 m!456111))

(declare-fun m!456113 () Bool)

(assert (=> b!473932 m!456113))

(declare-fun m!456115 () Bool)

(assert (=> b!473927 m!456115))

(declare-fun m!456117 () Bool)

(assert (=> b!473931 m!456117))

(declare-fun m!456119 () Bool)

(assert (=> b!473931 m!456119))

(assert (=> b!473931 m!456119))

(declare-fun m!456121 () Bool)

(assert (=> b!473931 m!456121))

(declare-fun m!456123 () Bool)

(assert (=> b!473931 m!456123))

(declare-fun m!456125 () Bool)

(assert (=> b!473931 m!456125))

(declare-fun m!456127 () Bool)

(assert (=> b!473931 m!456127))

(declare-fun m!456129 () Bool)

(assert (=> b!473931 m!456129))

(declare-fun m!456131 () Bool)

(assert (=> start!42476 m!456131))

(declare-fun m!456133 () Bool)

(assert (=> start!42476 m!456133))

(declare-fun m!456135 () Bool)

(assert (=> start!42476 m!456135))

(declare-fun m!456137 () Bool)

(assert (=> b!473930 m!456137))

(declare-fun m!456139 () Bool)

(assert (=> mapNonEmpty!21754 m!456139))

(check-sat (not mapNonEmpty!21754) b_and!20399 (not b!473932) (not b!473927) (not b!473930) (not start!42476) tp_is_empty!13359 (not b_next!11931) (not b!473931))
(check-sat b_and!20399 (not b_next!11931))
