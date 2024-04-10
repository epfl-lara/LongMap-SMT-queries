; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70876 () Bool)

(assert start!70876)

(declare-fun b_free!13113 () Bool)

(declare-fun b_next!13113 () Bool)

(assert (=> start!70876 (= b_free!13113 (not b_next!13113))))

(declare-fun tp!46087 () Bool)

(declare-fun b_and!21997 () Bool)

(assert (=> start!70876 (= tp!46087 b_and!21997)))

(declare-fun b!823211 () Bool)

(declare-fun res!561401 () Bool)

(declare-fun e!457815 () Bool)

(assert (=> b!823211 (=> (not res!561401) (not e!457815))))

(declare-datatypes ((array!45838 0))(
  ( (array!45839 (arr!21968 (Array (_ BitVec 32) (_ BitVec 64))) (size!22389 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45838)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24765 0))(
  ( (V!24766 (val!7459 Int)) )
))
(declare-datatypes ((ValueCell!6996 0))(
  ( (ValueCellFull!6996 (v!9891 V!24765)) (EmptyCell!6996) )
))
(declare-datatypes ((array!45840 0))(
  ( (array!45841 (arr!21969 (Array (_ BitVec 32) ValueCell!6996)) (size!22390 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45840)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823211 (= res!561401 (and (= (size!22390 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22389 _keys!976) (size!22390 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823212 () Bool)

(declare-fun e!457818 () Bool)

(declare-fun e!457817 () Bool)

(declare-fun mapRes!23848 () Bool)

(assert (=> b!823212 (= e!457818 (and e!457817 mapRes!23848))))

(declare-fun condMapEmpty!23848 () Bool)

(declare-fun mapDefault!23848 () ValueCell!6996)

(assert (=> b!823212 (= condMapEmpty!23848 (= (arr!21969 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6996)) mapDefault!23848)))))

(declare-fun mapIsEmpty!23848 () Bool)

(assert (=> mapIsEmpty!23848 mapRes!23848))

(declare-fun b!823213 () Bool)

(declare-fun e!457816 () Bool)

(assert (=> b!823213 (= e!457816 true)))

(declare-datatypes ((tuple2!9862 0))(
  ( (tuple2!9863 (_1!4942 (_ BitVec 64)) (_2!4942 V!24765)) )
))
(declare-datatypes ((List!15675 0))(
  ( (Nil!15672) (Cons!15671 (h!16800 tuple2!9862) (t!22014 List!15675)) )
))
(declare-datatypes ((ListLongMap!8685 0))(
  ( (ListLongMap!8686 (toList!4358 List!15675)) )
))
(declare-fun lt!371004 () ListLongMap!8685)

(declare-fun lt!371008 () ListLongMap!8685)

(declare-fun lt!371007 () tuple2!9862)

(declare-fun +!1907 (ListLongMap!8685 tuple2!9862) ListLongMap!8685)

(assert (=> b!823213 (= lt!371004 (+!1907 lt!371008 lt!371007))))

(declare-fun zeroValueAfter!34 () V!24765)

(declare-fun minValue!754 () V!24765)

(declare-fun lt!371006 () ListLongMap!8685)

(declare-datatypes ((Unit!28182 0))(
  ( (Unit!28183) )
))
(declare-fun lt!371012 () Unit!28182)

(declare-fun addCommutativeForDiffKeys!470 (ListLongMap!8685 (_ BitVec 64) V!24765 (_ BitVec 64) V!24765) Unit!28182)

(assert (=> b!823213 (= lt!371012 (addCommutativeForDiffKeys!470 lt!371006 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!371009 () ListLongMap!8685)

(assert (=> b!823213 (= lt!371009 lt!371004)))

(declare-fun lt!371003 () tuple2!9862)

(assert (=> b!823213 (= lt!371004 (+!1907 (+!1907 lt!371006 lt!371007) lt!371003))))

(assert (=> b!823213 (= lt!371007 (tuple2!9863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!371005 () ListLongMap!8685)

(assert (=> b!823213 (= lt!371005 lt!371008)))

(assert (=> b!823213 (= lt!371008 (+!1907 lt!371006 lt!371003))))

(assert (=> b!823213 (= lt!371003 (tuple2!9863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2521 (array!45838 array!45840 (_ BitVec 32) (_ BitVec 32) V!24765 V!24765 (_ BitVec 32) Int) ListLongMap!8685)

(assert (=> b!823213 (= lt!371009 (getCurrentListMap!2521 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24765)

(assert (=> b!823213 (= lt!371005 (getCurrentListMap!2521 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823214 () Bool)

(declare-fun tp_is_empty!14823 () Bool)

(assert (=> b!823214 (= e!457817 tp_is_empty!14823)))

(declare-fun b!823215 () Bool)

(assert (=> b!823215 (= e!457815 (not e!457816))))

(declare-fun res!561399 () Bool)

(assert (=> b!823215 (=> res!561399 e!457816)))

(assert (=> b!823215 (= res!561399 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!371010 () ListLongMap!8685)

(assert (=> b!823215 (= lt!371006 lt!371010)))

(declare-fun lt!371011 () Unit!28182)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!483 (array!45838 array!45840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24765 V!24765 V!24765 V!24765 (_ BitVec 32) Int) Unit!28182)

(assert (=> b!823215 (= lt!371011 (lemmaNoChangeToArrayThenSameMapNoExtras!483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2373 (array!45838 array!45840 (_ BitVec 32) (_ BitVec 32) V!24765 V!24765 (_ BitVec 32) Int) ListLongMap!8685)

(assert (=> b!823215 (= lt!371010 (getCurrentListMapNoExtraKeys!2373 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823215 (= lt!371006 (getCurrentListMapNoExtraKeys!2373 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823216 () Bool)

(declare-fun res!561400 () Bool)

(assert (=> b!823216 (=> (not res!561400) (not e!457815))))

(declare-datatypes ((List!15676 0))(
  ( (Nil!15673) (Cons!15672 (h!16801 (_ BitVec 64)) (t!22015 List!15676)) )
))
(declare-fun arrayNoDuplicates!0 (array!45838 (_ BitVec 32) List!15676) Bool)

(assert (=> b!823216 (= res!561400 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15673))))

(declare-fun b!823217 () Bool)

(declare-fun e!457819 () Bool)

(assert (=> b!823217 (= e!457819 tp_is_empty!14823)))

(declare-fun b!823218 () Bool)

(declare-fun res!561402 () Bool)

(assert (=> b!823218 (=> (not res!561402) (not e!457815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45838 (_ BitVec 32)) Bool)

(assert (=> b!823218 (= res!561402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!561403 () Bool)

(assert (=> start!70876 (=> (not res!561403) (not e!457815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70876 (= res!561403 (validMask!0 mask!1312))))

(assert (=> start!70876 e!457815))

(assert (=> start!70876 tp_is_empty!14823))

(declare-fun array_inv!17543 (array!45838) Bool)

(assert (=> start!70876 (array_inv!17543 _keys!976)))

(assert (=> start!70876 true))

(declare-fun array_inv!17544 (array!45840) Bool)

(assert (=> start!70876 (and (array_inv!17544 _values!788) e!457818)))

(assert (=> start!70876 tp!46087))

(declare-fun mapNonEmpty!23848 () Bool)

(declare-fun tp!46086 () Bool)

(assert (=> mapNonEmpty!23848 (= mapRes!23848 (and tp!46086 e!457819))))

(declare-fun mapValue!23848 () ValueCell!6996)

(declare-fun mapRest!23848 () (Array (_ BitVec 32) ValueCell!6996))

(declare-fun mapKey!23848 () (_ BitVec 32))

(assert (=> mapNonEmpty!23848 (= (arr!21969 _values!788) (store mapRest!23848 mapKey!23848 mapValue!23848))))

(assert (= (and start!70876 res!561403) b!823211))

(assert (= (and b!823211 res!561401) b!823218))

(assert (= (and b!823218 res!561402) b!823216))

(assert (= (and b!823216 res!561400) b!823215))

(assert (= (and b!823215 (not res!561399)) b!823213))

(assert (= (and b!823212 condMapEmpty!23848) mapIsEmpty!23848))

(assert (= (and b!823212 (not condMapEmpty!23848)) mapNonEmpty!23848))

(get-info :version)

(assert (= (and mapNonEmpty!23848 ((_ is ValueCellFull!6996) mapValue!23848)) b!823217))

(assert (= (and b!823212 ((_ is ValueCellFull!6996) mapDefault!23848)) b!823214))

(assert (= start!70876 b!823212))

(declare-fun m!765297 () Bool)

(assert (=> b!823215 m!765297))

(declare-fun m!765299 () Bool)

(assert (=> b!823215 m!765299))

(declare-fun m!765301 () Bool)

(assert (=> b!823215 m!765301))

(declare-fun m!765303 () Bool)

(assert (=> b!823213 m!765303))

(declare-fun m!765305 () Bool)

(assert (=> b!823213 m!765305))

(assert (=> b!823213 m!765303))

(declare-fun m!765307 () Bool)

(assert (=> b!823213 m!765307))

(declare-fun m!765309 () Bool)

(assert (=> b!823213 m!765309))

(declare-fun m!765311 () Bool)

(assert (=> b!823213 m!765311))

(declare-fun m!765313 () Bool)

(assert (=> b!823213 m!765313))

(declare-fun m!765315 () Bool)

(assert (=> b!823213 m!765315))

(declare-fun m!765317 () Bool)

(assert (=> b!823216 m!765317))

(declare-fun m!765319 () Bool)

(assert (=> start!70876 m!765319))

(declare-fun m!765321 () Bool)

(assert (=> start!70876 m!765321))

(declare-fun m!765323 () Bool)

(assert (=> start!70876 m!765323))

(declare-fun m!765325 () Bool)

(assert (=> mapNonEmpty!23848 m!765325))

(declare-fun m!765327 () Bool)

(assert (=> b!823218 m!765327))

(check-sat (not b!823215) (not b!823216) (not b!823218) (not start!70876) tp_is_empty!14823 b_and!21997 (not mapNonEmpty!23848) (not b!823213) (not b_next!13113))
(check-sat b_and!21997 (not b_next!13113))
