; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71152 () Bool)

(assert start!71152)

(declare-fun b_free!13189 () Bool)

(declare-fun b_next!13189 () Bool)

(assert (=> start!71152 (= b_free!13189 (not b_next!13189))))

(declare-fun tp!46321 () Bool)

(declare-fun b_and!22103 () Bool)

(assert (=> start!71152 (= tp!46321 b_and!22103)))

(declare-fun mapNonEmpty!23968 () Bool)

(declare-fun mapRes!23968 () Bool)

(declare-fun tp!46320 () Bool)

(declare-fun e!459167 () Bool)

(assert (=> mapNonEmpty!23968 (= mapRes!23968 (and tp!46320 e!459167))))

(declare-datatypes ((V!24867 0))(
  ( (V!24868 (val!7497 Int)) )
))
(declare-datatypes ((ValueCell!7034 0))(
  ( (ValueCellFull!7034 (v!9930 V!24867)) (EmptyCell!7034) )
))
(declare-fun mapValue!23968 () ValueCell!7034)

(declare-datatypes ((array!45993 0))(
  ( (array!45994 (arr!22039 (Array (_ BitVec 32) ValueCell!7034)) (size!22459 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45993)

(declare-fun mapRest!23968 () (Array (_ BitVec 32) ValueCell!7034))

(declare-fun mapKey!23968 () (_ BitVec 32))

(assert (=> mapNonEmpty!23968 (= (arr!22039 _values!788) (store mapRest!23968 mapKey!23968 mapValue!23968))))

(declare-fun b!825202 () Bool)

(declare-fun res!562344 () Bool)

(declare-fun e!459169 () Bool)

(assert (=> b!825202 (=> (not res!562344) (not e!459169))))

(declare-datatypes ((array!45995 0))(
  ( (array!45996 (arr!22040 (Array (_ BitVec 32) (_ BitVec 64))) (size!22460 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45995)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825202 (= res!562344 (and (= (size!22459 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22460 _keys!976) (size!22459 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825203 () Bool)

(declare-fun tp_is_empty!14899 () Bool)

(assert (=> b!825203 (= e!459167 tp_is_empty!14899)))

(declare-fun b!825204 () Bool)

(declare-fun res!562347 () Bool)

(assert (=> b!825204 (=> (not res!562347) (not e!459169))))

(declare-datatypes ((List!15625 0))(
  ( (Nil!15622) (Cons!15621 (h!16756 (_ BitVec 64)) (t!21960 List!15625)) )
))
(declare-fun arrayNoDuplicates!0 (array!45995 (_ BitVec 32) List!15625) Bool)

(assert (=> b!825204 (= res!562347 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15622))))

(declare-fun mapIsEmpty!23968 () Bool)

(assert (=> mapIsEmpty!23968 mapRes!23968))

(declare-fun b!825205 () Bool)

(declare-fun e!459168 () Bool)

(assert (=> b!825205 (= e!459169 (not e!459168))))

(declare-fun res!562346 () Bool)

(assert (=> b!825205 (=> res!562346 e!459168)))

(assert (=> b!825205 (= res!562346 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9842 0))(
  ( (tuple2!9843 (_1!4932 (_ BitVec 64)) (_2!4932 V!24867)) )
))
(declare-datatypes ((List!15626 0))(
  ( (Nil!15623) (Cons!15622 (h!16757 tuple2!9842) (t!21961 List!15626)) )
))
(declare-datatypes ((ListLongMap!8667 0))(
  ( (ListLongMap!8668 (toList!4349 List!15626)) )
))
(declare-fun lt!372113 () ListLongMap!8667)

(declare-fun lt!372114 () ListLongMap!8667)

(assert (=> b!825205 (= lt!372113 lt!372114)))

(declare-fun zeroValueBefore!34 () V!24867)

(declare-fun minValue!754 () V!24867)

(declare-datatypes ((Unit!28251 0))(
  ( (Unit!28252) )
))
(declare-fun lt!372116 () Unit!28251)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!24867)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!520 (array!45995 array!45993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24867 V!24867 V!24867 V!24867 (_ BitVec 32) Int) Unit!28251)

(assert (=> b!825205 (= lt!372116 (lemmaNoChangeToArrayThenSameMapNoExtras!520 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2432 (array!45995 array!45993 (_ BitVec 32) (_ BitVec 32) V!24867 V!24867 (_ BitVec 32) Int) ListLongMap!8667)

(assert (=> b!825205 (= lt!372114 (getCurrentListMapNoExtraKeys!2432 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825205 (= lt!372113 (getCurrentListMapNoExtraKeys!2432 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825206 () Bool)

(declare-fun e!459165 () Bool)

(assert (=> b!825206 (= e!459165 tp_is_empty!14899)))

(declare-fun b!825207 () Bool)

(declare-fun e!459164 () Bool)

(assert (=> b!825207 (= e!459164 (and e!459165 mapRes!23968))))

(declare-fun condMapEmpty!23968 () Bool)

(declare-fun mapDefault!23968 () ValueCell!7034)

(assert (=> b!825207 (= condMapEmpty!23968 (= (arr!22039 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7034)) mapDefault!23968)))))

(declare-fun b!825208 () Bool)

(assert (=> b!825208 (= e!459168 true)))

(declare-fun lt!372115 () ListLongMap!8667)

(declare-fun getCurrentListMap!2477 (array!45995 array!45993 (_ BitVec 32) (_ BitVec 32) V!24867 V!24867 (_ BitVec 32) Int) ListLongMap!8667)

(assert (=> b!825208 (= lt!372115 (getCurrentListMap!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825209 () Bool)

(declare-fun res!562345 () Bool)

(assert (=> b!825209 (=> (not res!562345) (not e!459169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45995 (_ BitVec 32)) Bool)

(assert (=> b!825209 (= res!562345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!562348 () Bool)

(assert (=> start!71152 (=> (not res!562348) (not e!459169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71152 (= res!562348 (validMask!0 mask!1312))))

(assert (=> start!71152 e!459169))

(assert (=> start!71152 tp_is_empty!14899))

(declare-fun array_inv!17625 (array!45995) Bool)

(assert (=> start!71152 (array_inv!17625 _keys!976)))

(assert (=> start!71152 true))

(declare-fun array_inv!17626 (array!45993) Bool)

(assert (=> start!71152 (and (array_inv!17626 _values!788) e!459164)))

(assert (=> start!71152 tp!46321))

(assert (= (and start!71152 res!562348) b!825202))

(assert (= (and b!825202 res!562344) b!825209))

(assert (= (and b!825209 res!562345) b!825204))

(assert (= (and b!825204 res!562347) b!825205))

(assert (= (and b!825205 (not res!562346)) b!825208))

(assert (= (and b!825207 condMapEmpty!23968) mapIsEmpty!23968))

(assert (= (and b!825207 (not condMapEmpty!23968)) mapNonEmpty!23968))

(get-info :version)

(assert (= (and mapNonEmpty!23968 ((_ is ValueCellFull!7034) mapValue!23968)) b!825203))

(assert (= (and b!825207 ((_ is ValueCellFull!7034) mapDefault!23968)) b!825206))

(assert (= start!71152 b!825207))

(declare-fun m!767699 () Bool)

(assert (=> b!825209 m!767699))

(declare-fun m!767701 () Bool)

(assert (=> mapNonEmpty!23968 m!767701))

(declare-fun m!767703 () Bool)

(assert (=> start!71152 m!767703))

(declare-fun m!767705 () Bool)

(assert (=> start!71152 m!767705))

(declare-fun m!767707 () Bool)

(assert (=> start!71152 m!767707))

(declare-fun m!767709 () Bool)

(assert (=> b!825204 m!767709))

(declare-fun m!767711 () Bool)

(assert (=> b!825205 m!767711))

(declare-fun m!767713 () Bool)

(assert (=> b!825205 m!767713))

(declare-fun m!767715 () Bool)

(assert (=> b!825205 m!767715))

(declare-fun m!767717 () Bool)

(assert (=> b!825208 m!767717))

(check-sat (not b_next!13189) (not b!825205) (not mapNonEmpty!23968) (not start!71152) (not b!825204) b_and!22103 tp_is_empty!14899 (not b!825209) (not b!825208))
(check-sat b_and!22103 (not b_next!13189))
