; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71302 () Bool)

(assert start!71302)

(declare-fun b_free!13303 () Bool)

(declare-fun b_next!13303 () Bool)

(assert (=> start!71302 (= b_free!13303 (not b_next!13303))))

(declare-fun tp!46669 () Bool)

(declare-fun b_and!22239 () Bool)

(assert (=> start!71302 (= tp!46669 b_and!22239)))

(declare-fun b!827108 () Bool)

(declare-fun e!460600 () Bool)

(declare-fun e!460599 () Bool)

(declare-fun mapRes!24145 () Bool)

(assert (=> b!827108 (= e!460600 (and e!460599 mapRes!24145))))

(declare-fun condMapEmpty!24145 () Bool)

(declare-datatypes ((V!25019 0))(
  ( (V!25020 (val!7554 Int)) )
))
(declare-datatypes ((ValueCell!7091 0))(
  ( (ValueCellFull!7091 (v!9988 V!25019)) (EmptyCell!7091) )
))
(declare-datatypes ((array!46209 0))(
  ( (array!46210 (arr!22145 (Array (_ BitVec 32) ValueCell!7091)) (size!22565 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46209)

(declare-fun mapDefault!24145 () ValueCell!7091)

(assert (=> b!827108 (= condMapEmpty!24145 (= (arr!22145 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7091)) mapDefault!24145)))))

(declare-fun b!827109 () Bool)

(declare-fun res!563551 () Bool)

(declare-fun e!460604 () Bool)

(assert (=> b!827109 (=> (not res!563551) (not e!460604))))

(declare-datatypes ((array!46211 0))(
  ( (array!46212 (arr!22146 (Array (_ BitVec 32) (_ BitVec 64))) (size!22566 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46211)

(declare-datatypes ((List!15710 0))(
  ( (Nil!15707) (Cons!15706 (h!16841 (_ BitVec 64)) (t!22049 List!15710)) )
))
(declare-fun arrayNoDuplicates!0 (array!46211 (_ BitVec 32) List!15710) Bool)

(assert (=> b!827109 (= res!563551 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15707))))

(declare-fun b!827110 () Bool)

(declare-fun e!460598 () Bool)

(assert (=> b!827110 (= e!460598 true)))

(declare-datatypes ((tuple2!9930 0))(
  ( (tuple2!9931 (_1!4976 (_ BitVec 64)) (_2!4976 V!25019)) )
))
(declare-datatypes ((List!15711 0))(
  ( (Nil!15708) (Cons!15707 (h!16842 tuple2!9930) (t!22050 List!15711)) )
))
(declare-datatypes ((ListLongMap!8755 0))(
  ( (ListLongMap!8756 (toList!4393 List!15711)) )
))
(declare-fun lt!374009 () ListLongMap!8755)

(declare-fun lt!374007 () tuple2!9930)

(declare-fun lt!374001 () tuple2!9930)

(declare-fun lt!374004 () ListLongMap!8755)

(declare-fun +!1940 (ListLongMap!8755 tuple2!9930) ListLongMap!8755)

(assert (=> b!827110 (= lt!374009 (+!1940 (+!1940 lt!374004 lt!374007) lt!374001))))

(declare-fun lt!374011 () ListLongMap!8755)

(declare-fun lt!374014 () ListLongMap!8755)

(declare-fun lt!374002 () ListLongMap!8755)

(assert (=> b!827110 (and (= lt!374011 lt!374014) (= lt!374002 lt!374014) (= lt!374002 lt!374011))))

(declare-fun lt!374003 () ListLongMap!8755)

(assert (=> b!827110 (= lt!374014 (+!1940 lt!374003 lt!374007))))

(declare-fun lt!374006 () ListLongMap!8755)

(assert (=> b!827110 (= lt!374011 (+!1940 lt!374006 lt!374007))))

(declare-fun zeroValueBefore!34 () V!25019)

(declare-fun zeroValueAfter!34 () V!25019)

(declare-datatypes ((Unit!28338 0))(
  ( (Unit!28339) )
))
(declare-fun lt!374013 () Unit!28338)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!224 (ListLongMap!8755 (_ BitVec 64) V!25019 V!25019) Unit!28338)

(assert (=> b!827110 (= lt!374013 (addSameAsAddTwiceSameKeyDiffValues!224 lt!374006 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460603 () Bool)

(assert (=> b!827110 e!460603))

(declare-fun res!563548 () Bool)

(assert (=> b!827110 (=> (not res!563548) (not e!460603))))

(declare-fun lt!374008 () ListLongMap!8755)

(assert (=> b!827110 (= res!563548 (= lt!374008 lt!374003))))

(declare-fun lt!374012 () tuple2!9930)

(assert (=> b!827110 (= lt!374003 (+!1940 lt!374006 lt!374012))))

(assert (=> b!827110 (= lt!374006 (+!1940 lt!374004 lt!374001))))

(assert (=> b!827110 (= lt!374007 (tuple2!9931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460605 () Bool)

(assert (=> b!827110 e!460605))

(declare-fun res!563549 () Bool)

(assert (=> b!827110 (=> (not res!563549) (not e!460605))))

(assert (=> b!827110 (= res!563549 (= lt!374008 (+!1940 (+!1940 lt!374004 lt!374012) lt!374001)))))

(declare-fun minValue!754 () V!25019)

(assert (=> b!827110 (= lt!374001 (tuple2!9931 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!827110 (= lt!374012 (tuple2!9931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2515 (array!46211 array!46209 (_ BitVec 32) (_ BitVec 32) V!25019 V!25019 (_ BitVec 32) Int) ListLongMap!8755)

(assert (=> b!827110 (= lt!374002 (getCurrentListMap!2515 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827110 (= lt!374008 (getCurrentListMap!2515 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374005 () ListLongMap!8755)

(declare-fun b!827111 () Bool)

(assert (=> b!827111 (= e!460605 (= lt!374002 (+!1940 (+!1940 lt!374005 (tuple2!9931 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374001)))))

(declare-fun b!827112 () Bool)

(declare-fun res!563550 () Bool)

(assert (=> b!827112 (=> (not res!563550) (not e!460604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46211 (_ BitVec 32)) Bool)

(assert (=> b!827112 (= res!563550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827113 () Bool)

(assert (=> b!827113 (= e!460604 (not e!460598))))

(declare-fun res!563545 () Bool)

(assert (=> b!827113 (=> res!563545 e!460598)))

(assert (=> b!827113 (= res!563545 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827113 (= lt!374004 lt!374005)))

(declare-fun lt!374010 () Unit!28338)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!560 (array!46211 array!46209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25019 V!25019 V!25019 V!25019 (_ BitVec 32) Int) Unit!28338)

(assert (=> b!827113 (= lt!374010 (lemmaNoChangeToArrayThenSameMapNoExtras!560 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2472 (array!46211 array!46209 (_ BitVec 32) (_ BitVec 32) V!25019 V!25019 (_ BitVec 32) Int) ListLongMap!8755)

(assert (=> b!827113 (= lt!374005 (getCurrentListMapNoExtraKeys!2472 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827113 (= lt!374004 (getCurrentListMapNoExtraKeys!2472 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827114 () Bool)

(declare-fun tp_is_empty!15013 () Bool)

(assert (=> b!827114 (= e!460599 tp_is_empty!15013)))

(declare-fun res!563546 () Bool)

(assert (=> start!71302 (=> (not res!563546) (not e!460604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71302 (= res!563546 (validMask!0 mask!1312))))

(assert (=> start!71302 e!460604))

(assert (=> start!71302 tp_is_empty!15013))

(declare-fun array_inv!17693 (array!46211) Bool)

(assert (=> start!71302 (array_inv!17693 _keys!976)))

(assert (=> start!71302 true))

(declare-fun array_inv!17694 (array!46209) Bool)

(assert (=> start!71302 (and (array_inv!17694 _values!788) e!460600)))

(assert (=> start!71302 tp!46669))

(declare-fun mapNonEmpty!24145 () Bool)

(declare-fun tp!46668 () Bool)

(declare-fun e!460601 () Bool)

(assert (=> mapNonEmpty!24145 (= mapRes!24145 (and tp!46668 e!460601))))

(declare-fun mapRest!24145 () (Array (_ BitVec 32) ValueCell!7091))

(declare-fun mapKey!24145 () (_ BitVec 32))

(declare-fun mapValue!24145 () ValueCell!7091)

(assert (=> mapNonEmpty!24145 (= (arr!22145 _values!788) (store mapRest!24145 mapKey!24145 mapValue!24145))))

(declare-fun mapIsEmpty!24145 () Bool)

(assert (=> mapIsEmpty!24145 mapRes!24145))

(declare-fun b!827115 () Bool)

(declare-fun res!563547 () Bool)

(assert (=> b!827115 (=> (not res!563547) (not e!460604))))

(assert (=> b!827115 (= res!563547 (and (= (size!22565 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22566 _keys!976) (size!22565 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827116 () Bool)

(assert (=> b!827116 (= e!460601 tp_is_empty!15013)))

(declare-fun b!827117 () Bool)

(assert (=> b!827117 (= e!460603 (= lt!374002 (+!1940 (+!1940 lt!374005 lt!374001) lt!374007)))))

(assert (= (and start!71302 res!563546) b!827115))

(assert (= (and b!827115 res!563547) b!827112))

(assert (= (and b!827112 res!563550) b!827109))

(assert (= (and b!827109 res!563551) b!827113))

(assert (= (and b!827113 (not res!563545)) b!827110))

(assert (= (and b!827110 res!563549) b!827111))

(assert (= (and b!827110 res!563548) b!827117))

(assert (= (and b!827108 condMapEmpty!24145) mapIsEmpty!24145))

(assert (= (and b!827108 (not condMapEmpty!24145)) mapNonEmpty!24145))

(get-info :version)

(assert (= (and mapNonEmpty!24145 ((_ is ValueCellFull!7091) mapValue!24145)) b!827116))

(assert (= (and b!827108 ((_ is ValueCellFull!7091) mapDefault!24145)) b!827114))

(assert (= start!71302 b!827108))

(declare-fun m!770101 () Bool)

(assert (=> b!827109 m!770101))

(declare-fun m!770103 () Bool)

(assert (=> b!827110 m!770103))

(declare-fun m!770105 () Bool)

(assert (=> b!827110 m!770105))

(declare-fun m!770107 () Bool)

(assert (=> b!827110 m!770107))

(declare-fun m!770109 () Bool)

(assert (=> b!827110 m!770109))

(declare-fun m!770111 () Bool)

(assert (=> b!827110 m!770111))

(declare-fun m!770113 () Bool)

(assert (=> b!827110 m!770113))

(declare-fun m!770115 () Bool)

(assert (=> b!827110 m!770115))

(declare-fun m!770117 () Bool)

(assert (=> b!827110 m!770117))

(assert (=> b!827110 m!770103))

(declare-fun m!770119 () Bool)

(assert (=> b!827110 m!770119))

(assert (=> b!827110 m!770111))

(declare-fun m!770121 () Bool)

(assert (=> b!827110 m!770121))

(declare-fun m!770123 () Bool)

(assert (=> b!827110 m!770123))

(declare-fun m!770125 () Bool)

(assert (=> b!827117 m!770125))

(assert (=> b!827117 m!770125))

(declare-fun m!770127 () Bool)

(assert (=> b!827117 m!770127))

(declare-fun m!770129 () Bool)

(assert (=> b!827113 m!770129))

(declare-fun m!770131 () Bool)

(assert (=> b!827113 m!770131))

(declare-fun m!770133 () Bool)

(assert (=> b!827113 m!770133))

(declare-fun m!770135 () Bool)

(assert (=> mapNonEmpty!24145 m!770135))

(declare-fun m!770137 () Bool)

(assert (=> b!827112 m!770137))

(declare-fun m!770139 () Bool)

(assert (=> start!71302 m!770139))

(declare-fun m!770141 () Bool)

(assert (=> start!71302 m!770141))

(declare-fun m!770143 () Bool)

(assert (=> start!71302 m!770143))

(declare-fun m!770145 () Bool)

(assert (=> b!827111 m!770145))

(assert (=> b!827111 m!770145))

(declare-fun m!770147 () Bool)

(assert (=> b!827111 m!770147))

(check-sat (not b!827109) (not mapNonEmpty!24145) (not b_next!13303) b_and!22239 (not b!827113) (not b!827117) (not start!71302) tp_is_empty!15013 (not b!827110) (not b!827111) (not b!827112))
(check-sat b_and!22239 (not b_next!13303))
