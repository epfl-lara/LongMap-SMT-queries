; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71158 () Bool)

(assert start!71158)

(declare-fun b_free!13195 () Bool)

(declare-fun b_next!13195 () Bool)

(assert (=> start!71158 (= b_free!13195 (not b_next!13195))))

(declare-fun tp!46338 () Bool)

(declare-fun b_and!22109 () Bool)

(assert (=> start!71158 (= tp!46338 b_and!22109)))

(declare-fun b!825274 () Bool)

(declare-fun e!459223 () Bool)

(declare-fun e!459221 () Bool)

(declare-fun mapRes!23977 () Bool)

(assert (=> b!825274 (= e!459223 (and e!459221 mapRes!23977))))

(declare-fun condMapEmpty!23977 () Bool)

(declare-datatypes ((V!24875 0))(
  ( (V!24876 (val!7500 Int)) )
))
(declare-datatypes ((ValueCell!7037 0))(
  ( (ValueCellFull!7037 (v!9933 V!24875)) (EmptyCell!7037) )
))
(declare-datatypes ((array!46005 0))(
  ( (array!46006 (arr!22045 (Array (_ BitVec 32) ValueCell!7037)) (size!22465 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46005)

(declare-fun mapDefault!23977 () ValueCell!7037)

(assert (=> b!825274 (= condMapEmpty!23977 (= (arr!22045 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7037)) mapDefault!23977)))))

(declare-fun res!562393 () Bool)

(declare-fun e!459218 () Bool)

(assert (=> start!71158 (=> (not res!562393) (not e!459218))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71158 (= res!562393 (validMask!0 mask!1312))))

(assert (=> start!71158 e!459218))

(declare-fun tp_is_empty!14905 () Bool)

(assert (=> start!71158 tp_is_empty!14905))

(declare-datatypes ((array!46007 0))(
  ( (array!46008 (arr!22046 (Array (_ BitVec 32) (_ BitVec 64))) (size!22466 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46007)

(declare-fun array_inv!17627 (array!46007) Bool)

(assert (=> start!71158 (array_inv!17627 _keys!976)))

(assert (=> start!71158 true))

(declare-fun array_inv!17628 (array!46005) Bool)

(assert (=> start!71158 (and (array_inv!17628 _values!788) e!459223)))

(assert (=> start!71158 tp!46338))

(declare-fun b!825275 () Bool)

(declare-fun res!562390 () Bool)

(assert (=> b!825275 (=> (not res!562390) (not e!459218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46007 (_ BitVec 32)) Bool)

(assert (=> b!825275 (= res!562390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23977 () Bool)

(assert (=> mapIsEmpty!23977 mapRes!23977))

(declare-fun b!825276 () Bool)

(declare-fun e!459222 () Bool)

(assert (=> b!825276 (= e!459222 true)))

(declare-datatypes ((tuple2!9848 0))(
  ( (tuple2!9849 (_1!4935 (_ BitVec 64)) (_2!4935 V!24875)) )
))
(declare-datatypes ((List!15631 0))(
  ( (Nil!15628) (Cons!15627 (h!16762 tuple2!9848) (t!21966 List!15631)) )
))
(declare-datatypes ((ListLongMap!8673 0))(
  ( (ListLongMap!8674 (toList!4352 List!15631)) )
))
(declare-fun lt!372149 () ListLongMap!8673)

(declare-fun zeroValueBefore!34 () V!24875)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24875)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2479 (array!46007 array!46005 (_ BitVec 32) (_ BitVec 32) V!24875 V!24875 (_ BitVec 32) Int) ListLongMap!8673)

(assert (=> b!825276 (= lt!372149 (getCurrentListMap!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23977 () Bool)

(declare-fun tp!46339 () Bool)

(declare-fun e!459219 () Bool)

(assert (=> mapNonEmpty!23977 (= mapRes!23977 (and tp!46339 e!459219))))

(declare-fun mapRest!23977 () (Array (_ BitVec 32) ValueCell!7037))

(declare-fun mapValue!23977 () ValueCell!7037)

(declare-fun mapKey!23977 () (_ BitVec 32))

(assert (=> mapNonEmpty!23977 (= (arr!22045 _values!788) (store mapRest!23977 mapKey!23977 mapValue!23977))))

(declare-fun b!825277 () Bool)

(assert (=> b!825277 (= e!459221 tp_is_empty!14905)))

(declare-fun b!825278 () Bool)

(declare-fun res!562389 () Bool)

(assert (=> b!825278 (=> (not res!562389) (not e!459218))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!825278 (= res!562389 (and (= (size!22465 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22466 _keys!976) (size!22465 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825279 () Bool)

(declare-fun res!562392 () Bool)

(assert (=> b!825279 (=> (not res!562392) (not e!459218))))

(declare-datatypes ((List!15632 0))(
  ( (Nil!15629) (Cons!15628 (h!16763 (_ BitVec 64)) (t!21967 List!15632)) )
))
(declare-fun arrayNoDuplicates!0 (array!46007 (_ BitVec 32) List!15632) Bool)

(assert (=> b!825279 (= res!562392 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15629))))

(declare-fun b!825280 () Bool)

(assert (=> b!825280 (= e!459218 (not e!459222))))

(declare-fun res!562391 () Bool)

(assert (=> b!825280 (=> res!562391 e!459222)))

(assert (=> b!825280 (= res!562391 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!372150 () ListLongMap!8673)

(declare-fun lt!372152 () ListLongMap!8673)

(assert (=> b!825280 (= lt!372150 lt!372152)))

(declare-fun zeroValueAfter!34 () V!24875)

(declare-datatypes ((Unit!28257 0))(
  ( (Unit!28258) )
))
(declare-fun lt!372151 () Unit!28257)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!523 (array!46007 array!46005 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24875 V!24875 V!24875 V!24875 (_ BitVec 32) Int) Unit!28257)

(assert (=> b!825280 (= lt!372151 (lemmaNoChangeToArrayThenSameMapNoExtras!523 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2435 (array!46007 array!46005 (_ BitVec 32) (_ BitVec 32) V!24875 V!24875 (_ BitVec 32) Int) ListLongMap!8673)

(assert (=> b!825280 (= lt!372152 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825280 (= lt!372150 (getCurrentListMapNoExtraKeys!2435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825281 () Bool)

(assert (=> b!825281 (= e!459219 tp_is_empty!14905)))

(assert (= (and start!71158 res!562393) b!825278))

(assert (= (and b!825278 res!562389) b!825275))

(assert (= (and b!825275 res!562390) b!825279))

(assert (= (and b!825279 res!562392) b!825280))

(assert (= (and b!825280 (not res!562391)) b!825276))

(assert (= (and b!825274 condMapEmpty!23977) mapIsEmpty!23977))

(assert (= (and b!825274 (not condMapEmpty!23977)) mapNonEmpty!23977))

(get-info :version)

(assert (= (and mapNonEmpty!23977 ((_ is ValueCellFull!7037) mapValue!23977)) b!825281))

(assert (= (and b!825274 ((_ is ValueCellFull!7037) mapDefault!23977)) b!825277))

(assert (= start!71158 b!825274))

(declare-fun m!767759 () Bool)

(assert (=> b!825276 m!767759))

(declare-fun m!767761 () Bool)

(assert (=> start!71158 m!767761))

(declare-fun m!767763 () Bool)

(assert (=> start!71158 m!767763))

(declare-fun m!767765 () Bool)

(assert (=> start!71158 m!767765))

(declare-fun m!767767 () Bool)

(assert (=> mapNonEmpty!23977 m!767767))

(declare-fun m!767769 () Bool)

(assert (=> b!825279 m!767769))

(declare-fun m!767771 () Bool)

(assert (=> b!825275 m!767771))

(declare-fun m!767773 () Bool)

(assert (=> b!825280 m!767773))

(declare-fun m!767775 () Bool)

(assert (=> b!825280 m!767775))

(declare-fun m!767777 () Bool)

(assert (=> b!825280 m!767777))

(check-sat (not start!71158) (not b!825275) (not b!825280) (not mapNonEmpty!23977) tp_is_empty!14905 b_and!22109 (not b!825276) (not b_next!13195) (not b!825279))
(check-sat b_and!22109 (not b_next!13195))
