; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71072 () Bool)

(assert start!71072)

(declare-fun b_free!13279 () Bool)

(declare-fun b_next!13279 () Bool)

(assert (=> start!71072 (= b_free!13279 (not b_next!13279))))

(declare-fun tp!46593 () Bool)

(declare-fun b_and!22167 () Bool)

(assert (=> start!71072 (= tp!46593 b_and!22167)))

(declare-fun e!459452 () Bool)

(declare-datatypes ((V!24987 0))(
  ( (V!24988 (val!7542 Int)) )
))
(declare-datatypes ((tuple2!9990 0))(
  ( (tuple2!9991 (_1!5006 (_ BitVec 64)) (_2!5006 V!24987)) )
))
(declare-fun lt!372729 () tuple2!9990)

(declare-datatypes ((List!15783 0))(
  ( (Nil!15780) (Cons!15779 (h!16908 tuple2!9990) (t!22119 List!15783)) )
))
(declare-datatypes ((ListLongMap!8803 0))(
  ( (ListLongMap!8804 (toList!4417 List!15783)) )
))
(declare-fun lt!372730 () ListLongMap!8803)

(declare-fun lt!372731 () tuple2!9990)

(declare-fun lt!372722 () ListLongMap!8803)

(declare-fun b!825403 () Bool)

(declare-fun +!1954 (ListLongMap!8803 tuple2!9990) ListLongMap!8803)

(assert (=> b!825403 (= e!459452 (= lt!372730 (+!1954 (+!1954 lt!372722 lt!372731) lt!372729)))))

(declare-fun b!825404 () Bool)

(declare-fun e!459457 () Bool)

(assert (=> b!825404 (= e!459457 true)))

(declare-fun lt!372723 () ListLongMap!8803)

(declare-fun lt!372733 () ListLongMap!8803)

(assert (=> b!825404 (= lt!372733 (+!1954 (+!1954 lt!372723 lt!372729) lt!372731))))

(declare-fun lt!372724 () ListLongMap!8803)

(declare-fun lt!372732 () ListLongMap!8803)

(assert (=> b!825404 (and (= lt!372724 lt!372732) (= lt!372730 lt!372732) (= lt!372730 lt!372724))))

(declare-fun lt!372725 () ListLongMap!8803)

(assert (=> b!825404 (= lt!372732 (+!1954 lt!372725 lt!372729))))

(declare-fun lt!372734 () ListLongMap!8803)

(assert (=> b!825404 (= lt!372724 (+!1954 lt!372734 lt!372729))))

(declare-fun zeroValueBefore!34 () V!24987)

(declare-fun zeroValueAfter!34 () V!24987)

(declare-datatypes ((Unit!28247 0))(
  ( (Unit!28248) )
))
(declare-fun lt!372727 () Unit!28247)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!221 (ListLongMap!8803 (_ BitVec 64) V!24987 V!24987) Unit!28247)

(assert (=> b!825404 (= lt!372727 (addSameAsAddTwiceSameKeyDiffValues!221 lt!372734 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!825404 e!459452))

(declare-fun res!562740 () Bool)

(assert (=> b!825404 (=> (not res!562740) (not e!459452))))

(declare-fun lt!372726 () ListLongMap!8803)

(assert (=> b!825404 (= res!562740 (= lt!372726 lt!372725))))

(declare-fun lt!372728 () tuple2!9990)

(assert (=> b!825404 (= lt!372725 (+!1954 lt!372734 lt!372728))))

(assert (=> b!825404 (= lt!372734 (+!1954 lt!372723 lt!372731))))

(assert (=> b!825404 (= lt!372729 (tuple2!9991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459455 () Bool)

(assert (=> b!825404 e!459455))

(declare-fun res!562738 () Bool)

(assert (=> b!825404 (=> (not res!562738) (not e!459455))))

(assert (=> b!825404 (= res!562738 (= lt!372726 (+!1954 (+!1954 lt!372723 lt!372728) lt!372731)))))

(declare-fun minValue!754 () V!24987)

(assert (=> b!825404 (= lt!372731 (tuple2!9991 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825404 (= lt!372728 (tuple2!9991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!46123 0))(
  ( (array!46124 (arr!22108 (Array (_ BitVec 32) (_ BitVec 64))) (size!22529 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46123)

(declare-datatypes ((ValueCell!7079 0))(
  ( (ValueCellFull!7079 (v!9969 V!24987)) (EmptyCell!7079) )
))
(declare-datatypes ((array!46125 0))(
  ( (array!46126 (arr!22109 (Array (_ BitVec 32) ValueCell!7079)) (size!22530 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46125)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2504 (array!46123 array!46125 (_ BitVec 32) (_ BitVec 32) V!24987 V!24987 (_ BitVec 32) Int) ListLongMap!8803)

(assert (=> b!825404 (= lt!372730 (getCurrentListMap!2504 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825404 (= lt!372726 (getCurrentListMap!2504 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825405 () Bool)

(declare-fun res!562737 () Bool)

(declare-fun e!459459 () Bool)

(assert (=> b!825405 (=> (not res!562737) (not e!459459))))

(assert (=> b!825405 (= res!562737 (and (= (size!22530 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22529 _keys!976) (size!22530 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825406 () Bool)

(declare-fun res!562739 () Bool)

(assert (=> b!825406 (=> (not res!562739) (not e!459459))))

(declare-datatypes ((List!15784 0))(
  ( (Nil!15781) (Cons!15780 (h!16909 (_ BitVec 64)) (t!22120 List!15784)) )
))
(declare-fun arrayNoDuplicates!0 (array!46123 (_ BitVec 32) List!15784) Bool)

(assert (=> b!825406 (= res!562739 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15781))))

(declare-fun mapIsEmpty!24106 () Bool)

(declare-fun mapRes!24106 () Bool)

(assert (=> mapIsEmpty!24106 mapRes!24106))

(declare-fun b!825407 () Bool)

(declare-fun e!459456 () Bool)

(declare-fun tp_is_empty!14989 () Bool)

(assert (=> b!825407 (= e!459456 tp_is_empty!14989)))

(declare-fun mapNonEmpty!24106 () Bool)

(declare-fun tp!46594 () Bool)

(assert (=> mapNonEmpty!24106 (= mapRes!24106 (and tp!46594 e!459456))))

(declare-fun mapKey!24106 () (_ BitVec 32))

(declare-fun mapRest!24106 () (Array (_ BitVec 32) ValueCell!7079))

(declare-fun mapValue!24106 () ValueCell!7079)

(assert (=> mapNonEmpty!24106 (= (arr!22109 _values!788) (store mapRest!24106 mapKey!24106 mapValue!24106))))

(declare-fun b!825408 () Bool)

(declare-fun e!459454 () Bool)

(assert (=> b!825408 (= e!459454 tp_is_empty!14989)))

(declare-fun b!825409 () Bool)

(assert (=> b!825409 (= e!459455 (= lt!372730 (+!1954 (+!1954 lt!372722 (tuple2!9991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!372731)))))

(declare-fun b!825402 () Bool)

(declare-fun res!562743 () Bool)

(assert (=> b!825402 (=> (not res!562743) (not e!459459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46123 (_ BitVec 32)) Bool)

(assert (=> b!825402 (= res!562743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!562741 () Bool)

(assert (=> start!71072 (=> (not res!562741) (not e!459459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71072 (= res!562741 (validMask!0 mask!1312))))

(assert (=> start!71072 e!459459))

(assert (=> start!71072 tp_is_empty!14989))

(declare-fun array_inv!17691 (array!46123) Bool)

(assert (=> start!71072 (array_inv!17691 _keys!976)))

(assert (=> start!71072 true))

(declare-fun e!459453 () Bool)

(declare-fun array_inv!17692 (array!46125) Bool)

(assert (=> start!71072 (and (array_inv!17692 _values!788) e!459453)))

(assert (=> start!71072 tp!46593))

(declare-fun b!825410 () Bool)

(assert (=> b!825410 (= e!459453 (and e!459454 mapRes!24106))))

(declare-fun condMapEmpty!24106 () Bool)

(declare-fun mapDefault!24106 () ValueCell!7079)

(assert (=> b!825410 (= condMapEmpty!24106 (= (arr!22109 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7079)) mapDefault!24106)))))

(declare-fun b!825411 () Bool)

(assert (=> b!825411 (= e!459459 (not e!459457))))

(declare-fun res!562742 () Bool)

(assert (=> b!825411 (=> res!562742 e!459457)))

(assert (=> b!825411 (= res!562742 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825411 (= lt!372723 lt!372722)))

(declare-fun lt!372735 () Unit!28247)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!548 (array!46123 array!46125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24987 V!24987 V!24987 V!24987 (_ BitVec 32) Int) Unit!28247)

(assert (=> b!825411 (= lt!372735 (lemmaNoChangeToArrayThenSameMapNoExtras!548 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2455 (array!46123 array!46125 (_ BitVec 32) (_ BitVec 32) V!24987 V!24987 (_ BitVec 32) Int) ListLongMap!8803)

(assert (=> b!825411 (= lt!372722 (getCurrentListMapNoExtraKeys!2455 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825411 (= lt!372723 (getCurrentListMapNoExtraKeys!2455 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71072 res!562741) b!825405))

(assert (= (and b!825405 res!562737) b!825402))

(assert (= (and b!825402 res!562743) b!825406))

(assert (= (and b!825406 res!562739) b!825411))

(assert (= (and b!825411 (not res!562742)) b!825404))

(assert (= (and b!825404 res!562738) b!825409))

(assert (= (and b!825404 res!562740) b!825403))

(assert (= (and b!825410 condMapEmpty!24106) mapIsEmpty!24106))

(assert (= (and b!825410 (not condMapEmpty!24106)) mapNonEmpty!24106))

(get-info :version)

(assert (= (and mapNonEmpty!24106 ((_ is ValueCellFull!7079) mapValue!24106)) b!825407))

(assert (= (and b!825410 ((_ is ValueCellFull!7079) mapDefault!24106)) b!825408))

(assert (= start!71072 b!825410))

(declare-fun m!767181 () Bool)

(assert (=> start!71072 m!767181))

(declare-fun m!767183 () Bool)

(assert (=> start!71072 m!767183))

(declare-fun m!767185 () Bool)

(assert (=> start!71072 m!767185))

(declare-fun m!767187 () Bool)

(assert (=> b!825403 m!767187))

(assert (=> b!825403 m!767187))

(declare-fun m!767189 () Bool)

(assert (=> b!825403 m!767189))

(declare-fun m!767191 () Bool)

(assert (=> b!825406 m!767191))

(declare-fun m!767193 () Bool)

(assert (=> mapNonEmpty!24106 m!767193))

(declare-fun m!767195 () Bool)

(assert (=> b!825409 m!767195))

(assert (=> b!825409 m!767195))

(declare-fun m!767197 () Bool)

(assert (=> b!825409 m!767197))

(declare-fun m!767199 () Bool)

(assert (=> b!825402 m!767199))

(declare-fun m!767201 () Bool)

(assert (=> b!825411 m!767201))

(declare-fun m!767203 () Bool)

(assert (=> b!825411 m!767203))

(declare-fun m!767205 () Bool)

(assert (=> b!825411 m!767205))

(declare-fun m!767207 () Bool)

(assert (=> b!825404 m!767207))

(declare-fun m!767209 () Bool)

(assert (=> b!825404 m!767209))

(declare-fun m!767211 () Bool)

(assert (=> b!825404 m!767211))

(declare-fun m!767213 () Bool)

(assert (=> b!825404 m!767213))

(declare-fun m!767215 () Bool)

(assert (=> b!825404 m!767215))

(declare-fun m!767217 () Bool)

(assert (=> b!825404 m!767217))

(declare-fun m!767219 () Bool)

(assert (=> b!825404 m!767219))

(assert (=> b!825404 m!767211))

(declare-fun m!767221 () Bool)

(assert (=> b!825404 m!767221))

(declare-fun m!767223 () Bool)

(assert (=> b!825404 m!767223))

(declare-fun m!767225 () Bool)

(assert (=> b!825404 m!767225))

(assert (=> b!825404 m!767207))

(declare-fun m!767227 () Bool)

(assert (=> b!825404 m!767227))

(check-sat (not start!71072) b_and!22167 (not b!825403) (not b!825404) (not b!825409) (not mapNonEmpty!24106) tp_is_empty!14989 (not b_next!13279) (not b!825411) (not b!825406) (not b!825402))
(check-sat b_and!22167 (not b_next!13279))
