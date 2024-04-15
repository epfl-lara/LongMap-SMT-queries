; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70212 () Bool)

(assert start!70212)

(declare-fun b_free!12625 () Bool)

(declare-fun b_next!12625 () Bool)

(assert (=> start!70212 (= b_free!12625 (not b_next!12625))))

(declare-fun tp!44596 () Bool)

(declare-fun b_and!21387 () Bool)

(assert (=> start!70212 (= tp!44596 b_and!21387)))

(declare-fun b!815697 () Bool)

(declare-fun e!452390 () Bool)

(declare-fun tp_is_empty!14335 () Bool)

(assert (=> b!815697 (= e!452390 tp_is_empty!14335)))

(declare-fun mapNonEmpty!23089 () Bool)

(declare-fun mapRes!23089 () Bool)

(declare-fun tp!44595 () Bool)

(declare-fun e!452385 () Bool)

(assert (=> mapNonEmpty!23089 (= mapRes!23089 (and tp!44595 e!452385))))

(declare-datatypes ((V!24115 0))(
  ( (V!24116 (val!7215 Int)) )
))
(declare-datatypes ((ValueCell!6752 0))(
  ( (ValueCellFull!6752 (v!9636 V!24115)) (EmptyCell!6752) )
))
(declare-fun mapRest!23089 () (Array (_ BitVec 32) ValueCell!6752))

(declare-fun mapValue!23089 () ValueCell!6752)

(declare-datatypes ((array!44855 0))(
  ( (array!44856 (arr!21486 (Array (_ BitVec 32) ValueCell!6752)) (size!21907 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44855)

(declare-fun mapKey!23089 () (_ BitVec 32))

(assert (=> mapNonEmpty!23089 (= (arr!21486 _values!788) (store mapRest!23089 mapKey!23089 mapValue!23089))))

(declare-fun b!815698 () Bool)

(declare-fun e!452387 () Bool)

(assert (=> b!815698 (= e!452387 (and e!452390 mapRes!23089))))

(declare-fun condMapEmpty!23089 () Bool)

(declare-fun mapDefault!23089 () ValueCell!6752)

(assert (=> b!815698 (= condMapEmpty!23089 (= (arr!21486 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6752)) mapDefault!23089)))))

(declare-fun b!815699 () Bool)

(declare-fun res!557021 () Bool)

(declare-fun e!452388 () Bool)

(assert (=> b!815699 (=> (not res!557021) (not e!452388))))

(declare-datatypes ((array!44857 0))(
  ( (array!44858 (arr!21487 (Array (_ BitVec 32) (_ BitVec 64))) (size!21908 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44857)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!815699 (= res!557021 (and (= (size!21907 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21908 _keys!976) (size!21907 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23089 () Bool)

(assert (=> mapIsEmpty!23089 mapRes!23089))

(declare-fun b!815700 () Bool)

(declare-fun e!452386 () Bool)

(assert (=> b!815700 (= e!452386 true)))

(declare-fun zeroValueAfter!34 () V!24115)

(declare-fun minValue!754 () V!24115)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9490 0))(
  ( (tuple2!9491 (_1!4756 (_ BitVec 64)) (_2!4756 V!24115)) )
))
(declare-datatypes ((List!15317 0))(
  ( (Nil!15314) (Cons!15313 (h!16442 tuple2!9490) (t!21629 List!15317)) )
))
(declare-datatypes ((ListLongMap!8303 0))(
  ( (ListLongMap!8304 (toList!4167 List!15317)) )
))
(declare-fun lt!365115 () ListLongMap!8303)

(declare-fun getCurrentListMap!2343 (array!44857 array!44855 (_ BitVec 32) (_ BitVec 32) V!24115 V!24115 (_ BitVec 32) Int) ListLongMap!8303)

(assert (=> b!815700 (= lt!365115 (getCurrentListMap!2343 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24115)

(declare-fun lt!365114 () ListLongMap!8303)

(declare-fun +!1831 (ListLongMap!8303 tuple2!9490) ListLongMap!8303)

(assert (=> b!815700 (= lt!365114 (+!1831 (getCurrentListMap!2343 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9491 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815701 () Bool)

(declare-fun res!557020 () Bool)

(assert (=> b!815701 (=> (not res!557020) (not e!452388))))

(declare-datatypes ((List!15318 0))(
  ( (Nil!15315) (Cons!15314 (h!16443 (_ BitVec 64)) (t!21630 List!15318)) )
))
(declare-fun arrayNoDuplicates!0 (array!44857 (_ BitVec 32) List!15318) Bool)

(assert (=> b!815701 (= res!557020 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15315))))

(declare-fun b!815702 () Bool)

(assert (=> b!815702 (= e!452385 tp_is_empty!14335)))

(declare-fun res!557019 () Bool)

(assert (=> start!70212 (=> (not res!557019) (not e!452388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70212 (= res!557019 (validMask!0 mask!1312))))

(assert (=> start!70212 e!452388))

(assert (=> start!70212 tp_is_empty!14335))

(declare-fun array_inv!17271 (array!44857) Bool)

(assert (=> start!70212 (array_inv!17271 _keys!976)))

(assert (=> start!70212 true))

(declare-fun array_inv!17272 (array!44855) Bool)

(assert (=> start!70212 (and (array_inv!17272 _values!788) e!452387)))

(assert (=> start!70212 tp!44596))

(declare-fun b!815703 () Bool)

(declare-fun res!557023 () Bool)

(assert (=> b!815703 (=> (not res!557023) (not e!452388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44857 (_ BitVec 32)) Bool)

(assert (=> b!815703 (= res!557023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815704 () Bool)

(assert (=> b!815704 (= e!452388 (not e!452386))))

(declare-fun res!557022 () Bool)

(assert (=> b!815704 (=> res!557022 e!452386)))

(assert (=> b!815704 (= res!557022 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365117 () ListLongMap!8303)

(declare-fun lt!365113 () ListLongMap!8303)

(assert (=> b!815704 (= lt!365117 lt!365113)))

(declare-datatypes ((Unit!27764 0))(
  ( (Unit!27765) )
))
(declare-fun lt!365116 () Unit!27764)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!323 (array!44857 array!44855 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24115 V!24115 V!24115 V!24115 (_ BitVec 32) Int) Unit!27764)

(assert (=> b!815704 (= lt!365116 (lemmaNoChangeToArrayThenSameMapNoExtras!323 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2230 (array!44857 array!44855 (_ BitVec 32) (_ BitVec 32) V!24115 V!24115 (_ BitVec 32) Int) ListLongMap!8303)

(assert (=> b!815704 (= lt!365113 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815704 (= lt!365117 (getCurrentListMapNoExtraKeys!2230 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70212 res!557019) b!815699))

(assert (= (and b!815699 res!557021) b!815703))

(assert (= (and b!815703 res!557023) b!815701))

(assert (= (and b!815701 res!557020) b!815704))

(assert (= (and b!815704 (not res!557022)) b!815700))

(assert (= (and b!815698 condMapEmpty!23089) mapIsEmpty!23089))

(assert (= (and b!815698 (not condMapEmpty!23089)) mapNonEmpty!23089))

(get-info :version)

(assert (= (and mapNonEmpty!23089 ((_ is ValueCellFull!6752) mapValue!23089)) b!815702))

(assert (= (and b!815698 ((_ is ValueCellFull!6752) mapDefault!23089)) b!815697))

(assert (= start!70212 b!815698))

(declare-fun m!756837 () Bool)

(assert (=> b!815700 m!756837))

(declare-fun m!756839 () Bool)

(assert (=> b!815700 m!756839))

(assert (=> b!815700 m!756839))

(declare-fun m!756841 () Bool)

(assert (=> b!815700 m!756841))

(declare-fun m!756843 () Bool)

(assert (=> mapNonEmpty!23089 m!756843))

(declare-fun m!756845 () Bool)

(assert (=> b!815703 m!756845))

(declare-fun m!756847 () Bool)

(assert (=> start!70212 m!756847))

(declare-fun m!756849 () Bool)

(assert (=> start!70212 m!756849))

(declare-fun m!756851 () Bool)

(assert (=> start!70212 m!756851))

(declare-fun m!756853 () Bool)

(assert (=> b!815704 m!756853))

(declare-fun m!756855 () Bool)

(assert (=> b!815704 m!756855))

(declare-fun m!756857 () Bool)

(assert (=> b!815704 m!756857))

(declare-fun m!756859 () Bool)

(assert (=> b!815701 m!756859))

(check-sat tp_is_empty!14335 (not b!815703) (not b!815704) (not b!815700) (not b_next!12625) (not start!70212) b_and!21387 (not b!815701) (not mapNonEmpty!23089))
(check-sat b_and!21387 (not b_next!12625))
