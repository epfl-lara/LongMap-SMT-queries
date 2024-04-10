; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70300 () Bool)

(assert start!70300)

(declare-fun b_free!12675 () Bool)

(declare-fun b_next!12675 () Bool)

(assert (=> start!70300 (= b_free!12675 (not b_next!12675))))

(declare-fun tp!44749 () Bool)

(declare-fun b_and!21475 () Bool)

(assert (=> start!70300 (= tp!44749 b_and!21475)))

(declare-fun mapIsEmpty!23167 () Bool)

(declare-fun mapRes!23167 () Bool)

(assert (=> mapIsEmpty!23167 mapRes!23167))

(declare-fun b!816727 () Bool)

(declare-fun res!557584 () Bool)

(declare-fun e!453100 () Bool)

(assert (=> b!816727 (=> (not res!557584) (not e!453100))))

(declare-datatypes ((array!44970 0))(
  ( (array!44971 (arr!21542 (Array (_ BitVec 32) (_ BitVec 64))) (size!21963 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44970)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24181 0))(
  ( (V!24182 (val!7240 Int)) )
))
(declare-datatypes ((ValueCell!6777 0))(
  ( (ValueCellFull!6777 (v!9668 V!24181)) (EmptyCell!6777) )
))
(declare-datatypes ((array!44972 0))(
  ( (array!44973 (arr!21543 (Array (_ BitVec 32) ValueCell!6777)) (size!21964 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44972)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816727 (= res!557584 (and (= (size!21964 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21963 _keys!976) (size!21964 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816728 () Bool)

(declare-fun e!453096 () Bool)

(declare-fun tp_is_empty!14385 () Bool)

(assert (=> b!816728 (= e!453096 tp_is_empty!14385)))

(declare-fun b!816729 () Bool)

(declare-fun e!453098 () Bool)

(assert (=> b!816729 (= e!453098 true)))

(declare-fun zeroValueAfter!34 () V!24181)

(declare-fun minValue!754 () V!24181)

(declare-datatypes ((tuple2!9514 0))(
  ( (tuple2!9515 (_1!4768 (_ BitVec 64)) (_2!4768 V!24181)) )
))
(declare-datatypes ((List!15342 0))(
  ( (Nil!15339) (Cons!15338 (h!16467 tuple2!9514) (t!21665 List!15342)) )
))
(declare-datatypes ((ListLongMap!8337 0))(
  ( (ListLongMap!8338 (toList!4184 List!15342)) )
))
(declare-fun lt!365857 () ListLongMap!8337)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2409 (array!44970 array!44972 (_ BitVec 32) (_ BitVec 32) V!24181 V!24181 (_ BitVec 32) Int) ListLongMap!8337)

(assert (=> b!816729 (= lt!365857 (getCurrentListMap!2409 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24181)

(declare-fun lt!365856 () ListLongMap!8337)

(declare-fun +!1815 (ListLongMap!8337 tuple2!9514) ListLongMap!8337)

(assert (=> b!816729 (= lt!365856 (+!1815 (getCurrentListMap!2409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816730 () Bool)

(declare-fun res!557585 () Bool)

(assert (=> b!816730 (=> (not res!557585) (not e!453100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44970 (_ BitVec 32)) Bool)

(assert (=> b!816730 (= res!557585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23167 () Bool)

(declare-fun tp!44748 () Bool)

(declare-fun e!453095 () Bool)

(assert (=> mapNonEmpty!23167 (= mapRes!23167 (and tp!44748 e!453095))))

(declare-fun mapRest!23167 () (Array (_ BitVec 32) ValueCell!6777))

(declare-fun mapKey!23167 () (_ BitVec 32))

(declare-fun mapValue!23167 () ValueCell!6777)

(assert (=> mapNonEmpty!23167 (= (arr!21543 _values!788) (store mapRest!23167 mapKey!23167 mapValue!23167))))

(declare-fun b!816732 () Bool)

(assert (=> b!816732 (= e!453100 (not e!453098))))

(declare-fun res!557582 () Bool)

(assert (=> b!816732 (=> res!557582 e!453098)))

(assert (=> b!816732 (= res!557582 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365855 () ListLongMap!8337)

(declare-fun lt!365854 () ListLongMap!8337)

(assert (=> b!816732 (= lt!365855 lt!365854)))

(declare-datatypes ((Unit!27852 0))(
  ( (Unit!27853) )
))
(declare-fun lt!365853 () Unit!27852)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!336 (array!44970 array!44972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24181 V!24181 V!24181 V!24181 (_ BitVec 32) Int) Unit!27852)

(assert (=> b!816732 (= lt!365853 (lemmaNoChangeToArrayThenSameMapNoExtras!336 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2226 (array!44970 array!44972 (_ BitVec 32) (_ BitVec 32) V!24181 V!24181 (_ BitVec 32) Int) ListLongMap!8337)

(assert (=> b!816732 (= lt!365854 (getCurrentListMapNoExtraKeys!2226 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816732 (= lt!365855 (getCurrentListMapNoExtraKeys!2226 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816733 () Bool)

(declare-fun e!453097 () Bool)

(assert (=> b!816733 (= e!453097 (and e!453096 mapRes!23167))))

(declare-fun condMapEmpty!23167 () Bool)

(declare-fun mapDefault!23167 () ValueCell!6777)

(assert (=> b!816733 (= condMapEmpty!23167 (= (arr!21543 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6777)) mapDefault!23167)))))

(declare-fun b!816734 () Bool)

(declare-fun res!557586 () Bool)

(assert (=> b!816734 (=> (not res!557586) (not e!453100))))

(declare-datatypes ((List!15343 0))(
  ( (Nil!15340) (Cons!15339 (h!16468 (_ BitVec 64)) (t!21666 List!15343)) )
))
(declare-fun arrayNoDuplicates!0 (array!44970 (_ BitVec 32) List!15343) Bool)

(assert (=> b!816734 (= res!557586 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15340))))

(declare-fun b!816731 () Bool)

(assert (=> b!816731 (= e!453095 tp_is_empty!14385)))

(declare-fun res!557583 () Bool)

(assert (=> start!70300 (=> (not res!557583) (not e!453100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70300 (= res!557583 (validMask!0 mask!1312))))

(assert (=> start!70300 e!453100))

(assert (=> start!70300 tp_is_empty!14385))

(declare-fun array_inv!17235 (array!44970) Bool)

(assert (=> start!70300 (array_inv!17235 _keys!976)))

(assert (=> start!70300 true))

(declare-fun array_inv!17236 (array!44972) Bool)

(assert (=> start!70300 (and (array_inv!17236 _values!788) e!453097)))

(assert (=> start!70300 tp!44749))

(assert (= (and start!70300 res!557583) b!816727))

(assert (= (and b!816727 res!557584) b!816730))

(assert (= (and b!816730 res!557585) b!816734))

(assert (= (and b!816734 res!557586) b!816732))

(assert (= (and b!816732 (not res!557582)) b!816729))

(assert (= (and b!816733 condMapEmpty!23167) mapIsEmpty!23167))

(assert (= (and b!816733 (not condMapEmpty!23167)) mapNonEmpty!23167))

(get-info :version)

(assert (= (and mapNonEmpty!23167 ((_ is ValueCellFull!6777) mapValue!23167)) b!816731))

(assert (= (and b!816733 ((_ is ValueCellFull!6777) mapDefault!23167)) b!816728))

(assert (= start!70300 b!816733))

(declare-fun m!758359 () Bool)

(assert (=> mapNonEmpty!23167 m!758359))

(declare-fun m!758361 () Bool)

(assert (=> start!70300 m!758361))

(declare-fun m!758363 () Bool)

(assert (=> start!70300 m!758363))

(declare-fun m!758365 () Bool)

(assert (=> start!70300 m!758365))

(declare-fun m!758367 () Bool)

(assert (=> b!816730 m!758367))

(declare-fun m!758369 () Bool)

(assert (=> b!816732 m!758369))

(declare-fun m!758371 () Bool)

(assert (=> b!816732 m!758371))

(declare-fun m!758373 () Bool)

(assert (=> b!816732 m!758373))

(declare-fun m!758375 () Bool)

(assert (=> b!816729 m!758375))

(declare-fun m!758377 () Bool)

(assert (=> b!816729 m!758377))

(assert (=> b!816729 m!758377))

(declare-fun m!758379 () Bool)

(assert (=> b!816729 m!758379))

(declare-fun m!758381 () Bool)

(assert (=> b!816734 m!758381))

(check-sat tp_is_empty!14385 (not b!816734) (not start!70300) (not b!816730) (not mapNonEmpty!23167) (not b!816729) b_and!21475 (not b_next!12675) (not b!816732))
(check-sat b_and!21475 (not b_next!12675))
