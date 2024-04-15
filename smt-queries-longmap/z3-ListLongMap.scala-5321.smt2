; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71146 () Bool)

(assert start!71146)

(declare-fun b_free!13333 () Bool)

(declare-fun b_next!13333 () Bool)

(assert (=> start!71146 (= b_free!13333 (not b_next!13333))))

(declare-fun tp!46758 () Bool)

(declare-fun b_and!22233 () Bool)

(assert (=> start!71146 (= tp!46758 b_and!22233)))

(declare-fun b!826418 () Bool)

(declare-fun res!563408 () Bool)

(declare-fun e!460237 () Bool)

(assert (=> b!826418 (=> (not res!563408) (not e!460237))))

(declare-datatypes ((array!46231 0))(
  ( (array!46232 (arr!22161 (Array (_ BitVec 32) (_ BitVec 64))) (size!22582 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46231)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46231 (_ BitVec 32)) Bool)

(assert (=> b!826418 (= res!563408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826419 () Bool)

(declare-fun e!460234 () Bool)

(declare-fun tp_is_empty!15043 () Bool)

(assert (=> b!826419 (= e!460234 tp_is_empty!15043)))

(declare-fun b!826420 () Bool)

(declare-fun res!563409 () Bool)

(assert (=> b!826420 (=> (not res!563409) (not e!460237))))

(declare-datatypes ((List!15831 0))(
  ( (Nil!15828) (Cons!15827 (h!16956 (_ BitVec 64)) (t!22169 List!15831)) )
))
(declare-fun arrayNoDuplicates!0 (array!46231 (_ BitVec 32) List!15831) Bool)

(assert (=> b!826420 (= res!563409 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15828))))

(declare-fun b!826421 () Bool)

(declare-fun e!460230 () Bool)

(assert (=> b!826421 (= e!460230 true)))

(declare-datatypes ((V!25059 0))(
  ( (V!25060 (val!7569 Int)) )
))
(declare-datatypes ((tuple2!10042 0))(
  ( (tuple2!10043 (_1!5032 (_ BitVec 64)) (_2!5032 V!25059)) )
))
(declare-fun lt!374043 () tuple2!10042)

(declare-datatypes ((List!15832 0))(
  ( (Nil!15829) (Cons!15828 (h!16957 tuple2!10042) (t!22170 List!15832)) )
))
(declare-datatypes ((ListLongMap!8855 0))(
  ( (ListLongMap!8856 (toList!4443 List!15832)) )
))
(declare-fun lt!374037 () ListLongMap!8855)

(declare-fun lt!374036 () ListLongMap!8855)

(declare-fun lt!374040 () tuple2!10042)

(declare-fun +!1978 (ListLongMap!8855 tuple2!10042) ListLongMap!8855)

(assert (=> b!826421 (= lt!374036 (+!1978 (+!1978 lt!374037 lt!374043) lt!374040))))

(declare-fun lt!374041 () ListLongMap!8855)

(declare-fun lt!374045 () ListLongMap!8855)

(declare-fun lt!374047 () ListLongMap!8855)

(assert (=> b!826421 (and (= lt!374041 lt!374045) (= lt!374047 lt!374045) (= lt!374047 lt!374041))))

(declare-fun lt!374035 () ListLongMap!8855)

(assert (=> b!826421 (= lt!374045 (+!1978 lt!374035 lt!374043))))

(declare-fun lt!374039 () ListLongMap!8855)

(assert (=> b!826421 (= lt!374041 (+!1978 lt!374039 lt!374043))))

(declare-fun zeroValueBefore!34 () V!25059)

(declare-datatypes ((Unit!28299 0))(
  ( (Unit!28300) )
))
(declare-fun lt!374038 () Unit!28299)

(declare-fun zeroValueAfter!34 () V!25059)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!241 (ListLongMap!8855 (_ BitVec 64) V!25059 V!25059) Unit!28299)

(assert (=> b!826421 (= lt!374038 (addSameAsAddTwiceSameKeyDiffValues!241 lt!374039 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460232 () Bool)

(assert (=> b!826421 e!460232))

(declare-fun res!563411 () Bool)

(assert (=> b!826421 (=> (not res!563411) (not e!460232))))

(declare-fun lt!374034 () ListLongMap!8855)

(assert (=> b!826421 (= res!563411 (= lt!374034 lt!374035))))

(declare-fun lt!374042 () tuple2!10042)

(assert (=> b!826421 (= lt!374035 (+!1978 lt!374039 lt!374042))))

(assert (=> b!826421 (= lt!374039 (+!1978 lt!374037 lt!374040))))

(assert (=> b!826421 (= lt!374043 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460233 () Bool)

(assert (=> b!826421 e!460233))

(declare-fun res!563410 () Bool)

(assert (=> b!826421 (=> (not res!563410) (not e!460233))))

(assert (=> b!826421 (= res!563410 (= lt!374034 (+!1978 (+!1978 lt!374037 lt!374042) lt!374040)))))

(declare-fun minValue!754 () V!25059)

(assert (=> b!826421 (= lt!374040 (tuple2!10043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826421 (= lt!374042 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((ValueCell!7106 0))(
  ( (ValueCellFull!7106 (v!9997 V!25059)) (EmptyCell!7106) )
))
(declare-datatypes ((array!46233 0))(
  ( (array!46234 (arr!22162 (Array (_ BitVec 32) ValueCell!7106)) (size!22583 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46233)

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMap!2524 (array!46231 array!46233 (_ BitVec 32) (_ BitVec 32) V!25059 V!25059 (_ BitVec 32) Int) ListLongMap!8855)

(assert (=> b!826421 (= lt!374047 (getCurrentListMap!2524 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826421 (= lt!374034 (getCurrentListMap!2524 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826422 () Bool)

(declare-fun res!563413 () Bool)

(assert (=> b!826422 (=> (not res!563413) (not e!460237))))

(assert (=> b!826422 (= res!563413 (and (= (size!22583 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22582 _keys!976) (size!22583 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826423 () Bool)

(assert (=> b!826423 (= e!460237 (not e!460230))))

(declare-fun res!563414 () Bool)

(assert (=> b!826423 (=> res!563414 e!460230)))

(assert (=> b!826423 (= res!563414 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!374046 () ListLongMap!8855)

(assert (=> b!826423 (= lt!374037 lt!374046)))

(declare-fun lt!374044 () Unit!28299)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!568 (array!46231 array!46233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25059 V!25059 V!25059 V!25059 (_ BitVec 32) Int) Unit!28299)

(assert (=> b!826423 (= lt!374044 (lemmaNoChangeToArrayThenSameMapNoExtras!568 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2475 (array!46231 array!46233 (_ BitVec 32) (_ BitVec 32) V!25059 V!25059 (_ BitVec 32) Int) ListLongMap!8855)

(assert (=> b!826423 (= lt!374046 (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826423 (= lt!374037 (getCurrentListMapNoExtraKeys!2475 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826424 () Bool)

(declare-fun e!460235 () Bool)

(assert (=> b!826424 (= e!460235 tp_is_empty!15043)))

(declare-fun b!826425 () Bool)

(assert (=> b!826425 (= e!460232 (= lt!374047 (+!1978 (+!1978 lt!374046 lt!374040) lt!374043)))))

(declare-fun mapIsEmpty!24190 () Bool)

(declare-fun mapRes!24190 () Bool)

(assert (=> mapIsEmpty!24190 mapRes!24190))

(declare-fun b!826426 () Bool)

(declare-fun e!460231 () Bool)

(assert (=> b!826426 (= e!460231 (and e!460235 mapRes!24190))))

(declare-fun condMapEmpty!24190 () Bool)

(declare-fun mapDefault!24190 () ValueCell!7106)

(assert (=> b!826426 (= condMapEmpty!24190 (= (arr!22162 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7106)) mapDefault!24190)))))

(declare-fun b!826427 () Bool)

(assert (=> b!826427 (= e!460233 (= lt!374047 (+!1978 (+!1978 lt!374046 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374040)))))

(declare-fun mapNonEmpty!24190 () Bool)

(declare-fun tp!46759 () Bool)

(assert (=> mapNonEmpty!24190 (= mapRes!24190 (and tp!46759 e!460234))))

(declare-fun mapValue!24190 () ValueCell!7106)

(declare-fun mapKey!24190 () (_ BitVec 32))

(declare-fun mapRest!24190 () (Array (_ BitVec 32) ValueCell!7106))

(assert (=> mapNonEmpty!24190 (= (arr!22162 _values!788) (store mapRest!24190 mapKey!24190 mapValue!24190))))

(declare-fun res!563412 () Bool)

(assert (=> start!71146 (=> (not res!563412) (not e!460237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71146 (= res!563412 (validMask!0 mask!1312))))

(assert (=> start!71146 e!460237))

(assert (=> start!71146 tp_is_empty!15043))

(declare-fun array_inv!17733 (array!46231) Bool)

(assert (=> start!71146 (array_inv!17733 _keys!976)))

(assert (=> start!71146 true))

(declare-fun array_inv!17734 (array!46233) Bool)

(assert (=> start!71146 (and (array_inv!17734 _values!788) e!460231)))

(assert (=> start!71146 tp!46758))

(assert (= (and start!71146 res!563412) b!826422))

(assert (= (and b!826422 res!563413) b!826418))

(assert (= (and b!826418 res!563408) b!826420))

(assert (= (and b!826420 res!563409) b!826423))

(assert (= (and b!826423 (not res!563414)) b!826421))

(assert (= (and b!826421 res!563410) b!826427))

(assert (= (and b!826421 res!563411) b!826425))

(assert (= (and b!826426 condMapEmpty!24190) mapIsEmpty!24190))

(assert (= (and b!826426 (not condMapEmpty!24190)) mapNonEmpty!24190))

(get-info :version)

(assert (= (and mapNonEmpty!24190 ((_ is ValueCellFull!7106) mapValue!24190)) b!826419))

(assert (= (and b!826426 ((_ is ValueCellFull!7106) mapDefault!24190)) b!826424))

(assert (= start!71146 b!826426))

(declare-fun m!768787 () Bool)

(assert (=> b!826418 m!768787))

(declare-fun m!768789 () Bool)

(assert (=> b!826425 m!768789))

(assert (=> b!826425 m!768789))

(declare-fun m!768791 () Bool)

(assert (=> b!826425 m!768791))

(declare-fun m!768793 () Bool)

(assert (=> mapNonEmpty!24190 m!768793))

(declare-fun m!768795 () Bool)

(assert (=> b!826421 m!768795))

(declare-fun m!768797 () Bool)

(assert (=> b!826421 m!768797))

(declare-fun m!768799 () Bool)

(assert (=> b!826421 m!768799))

(declare-fun m!768801 () Bool)

(assert (=> b!826421 m!768801))

(declare-fun m!768803 () Bool)

(assert (=> b!826421 m!768803))

(declare-fun m!768805 () Bool)

(assert (=> b!826421 m!768805))

(assert (=> b!826421 m!768803))

(declare-fun m!768807 () Bool)

(assert (=> b!826421 m!768807))

(assert (=> b!826421 m!768797))

(declare-fun m!768809 () Bool)

(assert (=> b!826421 m!768809))

(declare-fun m!768811 () Bool)

(assert (=> b!826421 m!768811))

(declare-fun m!768813 () Bool)

(assert (=> b!826421 m!768813))

(declare-fun m!768815 () Bool)

(assert (=> b!826421 m!768815))

(declare-fun m!768817 () Bool)

(assert (=> b!826423 m!768817))

(declare-fun m!768819 () Bool)

(assert (=> b!826423 m!768819))

(declare-fun m!768821 () Bool)

(assert (=> b!826423 m!768821))

(declare-fun m!768823 () Bool)

(assert (=> b!826427 m!768823))

(assert (=> b!826427 m!768823))

(declare-fun m!768825 () Bool)

(assert (=> b!826427 m!768825))

(declare-fun m!768827 () Bool)

(assert (=> b!826420 m!768827))

(declare-fun m!768829 () Bool)

(assert (=> start!71146 m!768829))

(declare-fun m!768831 () Bool)

(assert (=> start!71146 m!768831))

(declare-fun m!768833 () Bool)

(assert (=> start!71146 m!768833))

(check-sat (not mapNonEmpty!24190) (not b!826425) (not b!826427) (not b!826418) b_and!22233 (not b!826423) (not start!71146) tp_is_empty!15043 (not b!826420) (not b!826421) (not b_next!13333))
(check-sat b_and!22233 (not b_next!13333))
