; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70300 () Bool)

(assert start!70300)

(declare-fun b_free!12541 () Bool)

(declare-fun b_next!12541 () Bool)

(assert (=> start!70300 (= b_free!12541 (not b_next!12541))))

(declare-fun tp!44340 () Bool)

(declare-fun b_and!21331 () Bool)

(assert (=> start!70300 (= tp!44340 b_and!21331)))

(declare-fun res!556883 () Bool)

(declare-fun e!452376 () Bool)

(assert (=> start!70300 (=> (not res!556883) (not e!452376))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70300 (= res!556883 (validMask!0 mask!1312))))

(assert (=> start!70300 e!452376))

(declare-fun tp_is_empty!14251 () Bool)

(assert (=> start!70300 tp_is_empty!14251))

(declare-datatypes ((array!44703 0))(
  ( (array!44704 (arr!21406 (Array (_ BitVec 32) (_ BitVec 64))) (size!21826 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44703)

(declare-fun array_inv!17177 (array!44703) Bool)

(assert (=> start!70300 (array_inv!17177 _keys!976)))

(assert (=> start!70300 true))

(declare-datatypes ((V!24003 0))(
  ( (V!24004 (val!7173 Int)) )
))
(declare-datatypes ((ValueCell!6710 0))(
  ( (ValueCellFull!6710 (v!9600 V!24003)) (EmptyCell!6710) )
))
(declare-datatypes ((array!44705 0))(
  ( (array!44706 (arr!21407 (Array (_ BitVec 32) ValueCell!6710)) (size!21827 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44705)

(declare-fun e!452375 () Bool)

(declare-fun array_inv!17178 (array!44705) Bool)

(assert (=> start!70300 (and (array_inv!17178 _values!788) e!452375)))

(assert (=> start!70300 tp!44340))

(declare-fun b!815814 () Bool)

(declare-fun e!452374 () Bool)

(assert (=> b!815814 (= e!452374 tp_is_empty!14251)))

(declare-fun mapNonEmpty!22960 () Bool)

(declare-fun mapRes!22960 () Bool)

(declare-fun tp!44341 () Bool)

(assert (=> mapNonEmpty!22960 (= mapRes!22960 (and tp!44341 e!452374))))

(declare-fun mapKey!22960 () (_ BitVec 32))

(declare-fun mapRest!22960 () (Array (_ BitVec 32) ValueCell!6710))

(declare-fun mapValue!22960 () ValueCell!6710)

(assert (=> mapNonEmpty!22960 (= (arr!21407 _values!788) (store mapRest!22960 mapKey!22960 mapValue!22960))))

(declare-fun b!815815 () Bool)

(declare-fun e!452373 () Bool)

(assert (=> b!815815 (= e!452375 (and e!452373 mapRes!22960))))

(declare-fun condMapEmpty!22960 () Bool)

(declare-fun mapDefault!22960 () ValueCell!6710)

(assert (=> b!815815 (= condMapEmpty!22960 (= (arr!21407 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6710)) mapDefault!22960)))))

(declare-fun b!815816 () Bool)

(declare-fun res!556881 () Bool)

(assert (=> b!815816 (=> (not res!556881) (not e!452376))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815816 (= res!556881 (and (= (size!21827 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21826 _keys!976) (size!21827 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815817 () Bool)

(assert (=> b!815817 (= e!452376 (not true))))

(declare-datatypes ((tuple2!9320 0))(
  ( (tuple2!9321 (_1!4671 (_ BitVec 64)) (_2!4671 V!24003)) )
))
(declare-datatypes ((List!15138 0))(
  ( (Nil!15135) (Cons!15134 (h!16269 tuple2!9320) (t!21449 List!15138)) )
))
(declare-datatypes ((ListLongMap!8145 0))(
  ( (ListLongMap!8146 (toList!4088 List!15138)) )
))
(declare-fun lt!365181 () ListLongMap!8145)

(declare-fun lt!365182 () ListLongMap!8145)

(assert (=> b!815817 (= lt!365181 lt!365182)))

(declare-fun zeroValueBefore!34 () V!24003)

(declare-fun zeroValueAfter!34 () V!24003)

(declare-fun minValue!754 () V!24003)

(declare-datatypes ((Unit!27743 0))(
  ( (Unit!27744) )
))
(declare-fun lt!365180 () Unit!27743)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!283 (array!44703 array!44705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24003 V!24003 V!24003 V!24003 (_ BitVec 32) Int) Unit!27743)

(assert (=> b!815817 (= lt!365180 (lemmaNoChangeToArrayThenSameMapNoExtras!283 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2195 (array!44703 array!44705 (_ BitVec 32) (_ BitVec 32) V!24003 V!24003 (_ BitVec 32) Int) ListLongMap!8145)

(assert (=> b!815817 (= lt!365182 (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815817 (= lt!365181 (getCurrentListMapNoExtraKeys!2195 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815818 () Bool)

(declare-fun res!556882 () Bool)

(assert (=> b!815818 (=> (not res!556882) (not e!452376))))

(declare-datatypes ((List!15139 0))(
  ( (Nil!15136) (Cons!15135 (h!16270 (_ BitVec 64)) (t!21450 List!15139)) )
))
(declare-fun arrayNoDuplicates!0 (array!44703 (_ BitVec 32) List!15139) Bool)

(assert (=> b!815818 (= res!556882 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15136))))

(declare-fun b!815819 () Bool)

(declare-fun res!556880 () Bool)

(assert (=> b!815819 (=> (not res!556880) (not e!452376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44703 (_ BitVec 32)) Bool)

(assert (=> b!815819 (= res!556880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815820 () Bool)

(assert (=> b!815820 (= e!452373 tp_is_empty!14251)))

(declare-fun mapIsEmpty!22960 () Bool)

(assert (=> mapIsEmpty!22960 mapRes!22960))

(assert (= (and start!70300 res!556883) b!815816))

(assert (= (and b!815816 res!556881) b!815819))

(assert (= (and b!815819 res!556880) b!815818))

(assert (= (and b!815818 res!556882) b!815817))

(assert (= (and b!815815 condMapEmpty!22960) mapIsEmpty!22960))

(assert (= (and b!815815 (not condMapEmpty!22960)) mapNonEmpty!22960))

(get-info :version)

(assert (= (and mapNonEmpty!22960 ((_ is ValueCellFull!6710) mapValue!22960)) b!815814))

(assert (= (and b!815815 ((_ is ValueCellFull!6710) mapDefault!22960)) b!815820))

(assert (= start!70300 b!815815))

(declare-fun m!757941 () Bool)

(assert (=> b!815817 m!757941))

(declare-fun m!757943 () Bool)

(assert (=> b!815817 m!757943))

(declare-fun m!757945 () Bool)

(assert (=> b!815817 m!757945))

(declare-fun m!757947 () Bool)

(assert (=> b!815818 m!757947))

(declare-fun m!757949 () Bool)

(assert (=> mapNonEmpty!22960 m!757949))

(declare-fun m!757951 () Bool)

(assert (=> b!815819 m!757951))

(declare-fun m!757953 () Bool)

(assert (=> start!70300 m!757953))

(declare-fun m!757955 () Bool)

(assert (=> start!70300 m!757955))

(declare-fun m!757957 () Bool)

(assert (=> start!70300 m!757957))

(check-sat (not b!815819) (not mapNonEmpty!22960) tp_is_empty!14251 (not b!815818) (not b_next!12541) b_and!21331 (not start!70300) (not b!815817))
(check-sat b_and!21331 (not b_next!12541))
