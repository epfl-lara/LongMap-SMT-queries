; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71060 () Bool)

(assert start!71060)

(declare-fun b_free!13267 () Bool)

(declare-fun b_next!13267 () Bool)

(assert (=> start!71060 (= b_free!13267 (not b_next!13267))))

(declare-fun tp!46558 () Bool)

(declare-fun b_and!22155 () Bool)

(assert (=> start!71060 (= tp!46558 b_and!22155)))

(declare-fun b!825222 () Bool)

(declare-fun res!562612 () Bool)

(declare-fun e!459310 () Bool)

(assert (=> b!825222 (=> (not res!562612) (not e!459310))))

(declare-datatypes ((array!46103 0))(
  ( (array!46104 (arr!22098 (Array (_ BitVec 32) (_ BitVec 64))) (size!22519 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46103)

(declare-datatypes ((List!15776 0))(
  ( (Nil!15773) (Cons!15772 (h!16901 (_ BitVec 64)) (t!22112 List!15776)) )
))
(declare-fun arrayNoDuplicates!0 (array!46103 (_ BitVec 32) List!15776) Bool)

(assert (=> b!825222 (= res!562612 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15773))))

(declare-fun b!825223 () Bool)

(declare-fun e!459312 () Bool)

(declare-fun tp_is_empty!14977 () Bool)

(assert (=> b!825223 (= e!459312 tp_is_empty!14977)))

(declare-datatypes ((V!24971 0))(
  ( (V!24972 (val!7536 Int)) )
))
(declare-datatypes ((tuple2!9982 0))(
  ( (tuple2!9983 (_1!5002 (_ BitVec 64)) (_2!5002 V!24971)) )
))
(declare-datatypes ((List!15777 0))(
  ( (Nil!15774) (Cons!15773 (h!16902 tuple2!9982) (t!22113 List!15777)) )
))
(declare-datatypes ((ListLongMap!8795 0))(
  ( (ListLongMap!8796 (toList!4413 List!15777)) )
))
(declare-fun lt!372475 () ListLongMap!8795)

(declare-fun lt!372480 () ListLongMap!8795)

(declare-fun e!459308 () Bool)

(declare-fun lt!372473 () tuple2!9982)

(declare-fun lt!372481 () tuple2!9982)

(declare-fun b!825224 () Bool)

(declare-fun +!1950 (ListLongMap!8795 tuple2!9982) ListLongMap!8795)

(assert (=> b!825224 (= e!459308 (= lt!372475 (+!1950 (+!1950 lt!372480 lt!372473) lt!372481)))))

(declare-fun res!562617 () Bool)

(assert (=> start!71060 (=> (not res!562617) (not e!459310))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71060 (= res!562617 (validMask!0 mask!1312))))

(assert (=> start!71060 e!459310))

(assert (=> start!71060 tp_is_empty!14977))

(declare-fun array_inv!17687 (array!46103) Bool)

(assert (=> start!71060 (array_inv!17687 _keys!976)))

(assert (=> start!71060 true))

(declare-datatypes ((ValueCell!7073 0))(
  ( (ValueCellFull!7073 (v!9963 V!24971)) (EmptyCell!7073) )
))
(declare-datatypes ((array!46105 0))(
  ( (array!46106 (arr!22099 (Array (_ BitVec 32) ValueCell!7073)) (size!22520 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46105)

(declare-fun e!459309 () Bool)

(declare-fun array_inv!17688 (array!46105) Bool)

(assert (=> start!71060 (and (array_inv!17688 _values!788) e!459309)))

(assert (=> start!71060 tp!46558))

(declare-fun mapIsEmpty!24088 () Bool)

(declare-fun mapRes!24088 () Bool)

(assert (=> mapIsEmpty!24088 mapRes!24088))

(declare-fun b!825225 () Bool)

(declare-fun e!459314 () Bool)

(assert (=> b!825225 (= e!459310 (not e!459314))))

(declare-fun res!562615 () Bool)

(assert (=> b!825225 (=> res!562615 e!459314)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825225 (= res!562615 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372477 () ListLongMap!8795)

(assert (=> b!825225 (= lt!372477 lt!372480)))

(declare-fun zeroValueBefore!34 () V!24971)

(declare-fun zeroValueAfter!34 () V!24971)

(declare-fun minValue!754 () V!24971)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28239 0))(
  ( (Unit!28240) )
))
(declare-fun lt!372470 () Unit!28239)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!544 (array!46103 array!46105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24971 V!24971 V!24971 V!24971 (_ BitVec 32) Int) Unit!28239)

(assert (=> b!825225 (= lt!372470 (lemmaNoChangeToArrayThenSameMapNoExtras!544 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2451 (array!46103 array!46105 (_ BitVec 32) (_ BitVec 32) V!24971 V!24971 (_ BitVec 32) Int) ListLongMap!8795)

(assert (=> b!825225 (= lt!372480 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825225 (= lt!372477 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24088 () Bool)

(declare-fun tp!46557 () Bool)

(declare-fun e!459313 () Bool)

(assert (=> mapNonEmpty!24088 (= mapRes!24088 (and tp!46557 e!459313))))

(declare-fun mapValue!24088 () ValueCell!7073)

(declare-fun mapRest!24088 () (Array (_ BitVec 32) ValueCell!7073))

(declare-fun mapKey!24088 () (_ BitVec 32))

(assert (=> mapNonEmpty!24088 (= (arr!22099 _values!788) (store mapRest!24088 mapKey!24088 mapValue!24088))))

(declare-fun b!825226 () Bool)

(assert (=> b!825226 (= e!459313 tp_is_empty!14977)))

(declare-fun b!825227 () Bool)

(assert (=> b!825227 (= e!459309 (and e!459312 mapRes!24088))))

(declare-fun condMapEmpty!24088 () Bool)

(declare-fun mapDefault!24088 () ValueCell!7073)

(assert (=> b!825227 (= condMapEmpty!24088 (= (arr!22099 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7073)) mapDefault!24088)))))

(declare-fun b!825228 () Bool)

(declare-fun res!562611 () Bool)

(assert (=> b!825228 (=> (not res!562611) (not e!459310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46103 (_ BitVec 32)) Bool)

(assert (=> b!825228 (= res!562611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825229 () Bool)

(declare-fun e!459315 () Bool)

(assert (=> b!825229 (= e!459315 (= lt!372475 (+!1950 (+!1950 lt!372480 (tuple2!9983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372473)))))

(declare-fun b!825230 () Bool)

(declare-fun res!562614 () Bool)

(assert (=> b!825230 (=> (not res!562614) (not e!459310))))

(assert (=> b!825230 (= res!562614 (and (= (size!22520 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22519 _keys!976) (size!22520 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825231 () Bool)

(assert (=> b!825231 (= e!459314 true)))

(declare-fun lt!372482 () ListLongMap!8795)

(assert (=> b!825231 (= lt!372482 (+!1950 (+!1950 lt!372477 lt!372481) lt!372473))))

(declare-fun lt!372471 () ListLongMap!8795)

(declare-fun lt!372479 () ListLongMap!8795)

(assert (=> b!825231 (and (= lt!372471 lt!372479) (= lt!372475 lt!372479) (= lt!372475 lt!372471))))

(declare-fun lt!372483 () ListLongMap!8795)

(assert (=> b!825231 (= lt!372479 (+!1950 lt!372483 lt!372481))))

(declare-fun lt!372472 () ListLongMap!8795)

(assert (=> b!825231 (= lt!372471 (+!1950 lt!372472 lt!372481))))

(declare-fun lt!372478 () Unit!28239)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!218 (ListLongMap!8795 (_ BitVec 64) V!24971 V!24971) Unit!28239)

(assert (=> b!825231 (= lt!372478 (addSameAsAddTwiceSameKeyDiffValues!218 lt!372472 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!825231 e!459308))

(declare-fun res!562616 () Bool)

(assert (=> b!825231 (=> (not res!562616) (not e!459308))))

(declare-fun lt!372476 () ListLongMap!8795)

(assert (=> b!825231 (= res!562616 (= lt!372476 lt!372483))))

(declare-fun lt!372474 () tuple2!9982)

(assert (=> b!825231 (= lt!372483 (+!1950 lt!372472 lt!372474))))

(assert (=> b!825231 (= lt!372472 (+!1950 lt!372477 lt!372473))))

(assert (=> b!825231 (= lt!372481 (tuple2!9983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!825231 e!459315))

(declare-fun res!562613 () Bool)

(assert (=> b!825231 (=> (not res!562613) (not e!459315))))

(assert (=> b!825231 (= res!562613 (= lt!372476 (+!1950 (+!1950 lt!372477 lt!372474) lt!372473)))))

(assert (=> b!825231 (= lt!372473 (tuple2!9983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825231 (= lt!372474 (tuple2!9983 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2501 (array!46103 array!46105 (_ BitVec 32) (_ BitVec 32) V!24971 V!24971 (_ BitVec 32) Int) ListLongMap!8795)

(assert (=> b!825231 (= lt!372475 (getCurrentListMap!2501 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825231 (= lt!372476 (getCurrentListMap!2501 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71060 res!562617) b!825230))

(assert (= (and b!825230 res!562614) b!825228))

(assert (= (and b!825228 res!562611) b!825222))

(assert (= (and b!825222 res!562612) b!825225))

(assert (= (and b!825225 (not res!562615)) b!825231))

(assert (= (and b!825231 res!562613) b!825229))

(assert (= (and b!825231 res!562616) b!825224))

(assert (= (and b!825227 condMapEmpty!24088) mapIsEmpty!24088))

(assert (= (and b!825227 (not condMapEmpty!24088)) mapNonEmpty!24088))

(get-info :version)

(assert (= (and mapNonEmpty!24088 ((_ is ValueCellFull!7073) mapValue!24088)) b!825226))

(assert (= (and b!825227 ((_ is ValueCellFull!7073) mapDefault!24088)) b!825223))

(assert (= start!71060 b!825227))

(declare-fun m!766893 () Bool)

(assert (=> b!825224 m!766893))

(assert (=> b!825224 m!766893))

(declare-fun m!766895 () Bool)

(assert (=> b!825224 m!766895))

(declare-fun m!766897 () Bool)

(assert (=> start!71060 m!766897))

(declare-fun m!766899 () Bool)

(assert (=> start!71060 m!766899))

(declare-fun m!766901 () Bool)

(assert (=> start!71060 m!766901))

(declare-fun m!766903 () Bool)

(assert (=> b!825231 m!766903))

(declare-fun m!766905 () Bool)

(assert (=> b!825231 m!766905))

(declare-fun m!766907 () Bool)

(assert (=> b!825231 m!766907))

(declare-fun m!766909 () Bool)

(assert (=> b!825231 m!766909))

(assert (=> b!825231 m!766903))

(declare-fun m!766911 () Bool)

(assert (=> b!825231 m!766911))

(declare-fun m!766913 () Bool)

(assert (=> b!825231 m!766913))

(declare-fun m!766915 () Bool)

(assert (=> b!825231 m!766915))

(declare-fun m!766917 () Bool)

(assert (=> b!825231 m!766917))

(declare-fun m!766919 () Bool)

(assert (=> b!825231 m!766919))

(declare-fun m!766921 () Bool)

(assert (=> b!825231 m!766921))

(declare-fun m!766923 () Bool)

(assert (=> b!825231 m!766923))

(assert (=> b!825231 m!766917))

(declare-fun m!766925 () Bool)

(assert (=> b!825222 m!766925))

(declare-fun m!766927 () Bool)

(assert (=> b!825225 m!766927))

(declare-fun m!766929 () Bool)

(assert (=> b!825225 m!766929))

(declare-fun m!766931 () Bool)

(assert (=> b!825225 m!766931))

(declare-fun m!766933 () Bool)

(assert (=> b!825229 m!766933))

(assert (=> b!825229 m!766933))

(declare-fun m!766935 () Bool)

(assert (=> b!825229 m!766935))

(declare-fun m!766937 () Bool)

(assert (=> mapNonEmpty!24088 m!766937))

(declare-fun m!766939 () Bool)

(assert (=> b!825228 m!766939))

(check-sat (not b_next!13267) (not start!71060) (not b!825231) (not b!825229) tp_is_empty!14977 (not b!825228) b_and!22155 (not b!825224) (not mapNonEmpty!24088) (not b!825225) (not b!825222))
(check-sat b_and!22155 (not b_next!13267))
