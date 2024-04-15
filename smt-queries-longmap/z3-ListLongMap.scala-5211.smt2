; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70278 () Bool)

(assert start!70278)

(declare-fun b_free!12673 () Bool)

(declare-fun b_next!12673 () Bool)

(assert (=> start!70278 (= b_free!12673 (not b_next!12673))))

(declare-fun tp!44743 () Bool)

(declare-fun b_and!21447 () Bool)

(assert (=> start!70278 (= tp!44743 b_and!21447)))

(declare-fun mapIsEmpty!23164 () Bool)

(declare-fun mapRes!23164 () Bool)

(assert (=> mapIsEmpty!23164 mapRes!23164))

(declare-fun b!816457 () Bool)

(declare-fun e!452930 () Bool)

(declare-fun e!452928 () Bool)

(assert (=> b!816457 (= e!452930 (and e!452928 mapRes!23164))))

(declare-fun condMapEmpty!23164 () Bool)

(declare-datatypes ((V!24179 0))(
  ( (V!24180 (val!7239 Int)) )
))
(declare-datatypes ((ValueCell!6776 0))(
  ( (ValueCellFull!6776 (v!9661 V!24179)) (EmptyCell!6776) )
))
(declare-datatypes ((array!44943 0))(
  ( (array!44944 (arr!21529 (Array (_ BitVec 32) ValueCell!6776)) (size!21950 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44943)

(declare-fun mapDefault!23164 () ValueCell!6776)

(assert (=> b!816457 (= condMapEmpty!23164 (= (arr!21529 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6776)) mapDefault!23164)))))

(declare-fun b!816458 () Bool)

(declare-fun res!557464 () Bool)

(declare-fun e!452931 () Bool)

(assert (=> b!816458 (=> (not res!557464) (not e!452931))))

(declare-datatypes ((array!44945 0))(
  ( (array!44946 (arr!21530 (Array (_ BitVec 32) (_ BitVec 64))) (size!21951 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44945)

(declare-datatypes ((List!15348 0))(
  ( (Nil!15345) (Cons!15344 (h!16473 (_ BitVec 64)) (t!21662 List!15348)) )
))
(declare-fun arrayNoDuplicates!0 (array!44945 (_ BitVec 32) List!15348) Bool)

(assert (=> b!816458 (= res!557464 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15345))))

(declare-fun b!816459 () Bool)

(declare-fun e!452929 () Bool)

(assert (=> b!816459 (= e!452931 (not e!452929))))

(declare-fun res!557461 () Bool)

(assert (=> b!816459 (=> res!557461 e!452929)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816459 (= res!557461 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9524 0))(
  ( (tuple2!9525 (_1!4773 (_ BitVec 64)) (_2!4773 V!24179)) )
))
(declare-datatypes ((List!15349 0))(
  ( (Nil!15346) (Cons!15345 (h!16474 tuple2!9524) (t!21663 List!15349)) )
))
(declare-datatypes ((ListLongMap!8337 0))(
  ( (ListLongMap!8338 (toList!4184 List!15349)) )
))
(declare-fun lt!365597 () ListLongMap!8337)

(declare-fun lt!365598 () ListLongMap!8337)

(assert (=> b!816459 (= lt!365597 lt!365598)))

(declare-datatypes ((Unit!27796 0))(
  ( (Unit!27797) )
))
(declare-fun lt!365595 () Unit!27796)

(declare-fun zeroValueBefore!34 () V!24179)

(declare-fun zeroValueAfter!34 () V!24179)

(declare-fun minValue!754 () V!24179)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!338 (array!44945 array!44943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24179 V!24179 V!24179 V!24179 (_ BitVec 32) Int) Unit!27796)

(assert (=> b!816459 (= lt!365595 (lemmaNoChangeToArrayThenSameMapNoExtras!338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2245 (array!44945 array!44943 (_ BitVec 32) (_ BitVec 32) V!24179 V!24179 (_ BitVec 32) Int) ListLongMap!8337)

(assert (=> b!816459 (= lt!365598 (getCurrentListMapNoExtraKeys!2245 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816459 (= lt!365597 (getCurrentListMapNoExtraKeys!2245 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!557465 () Bool)

(assert (=> start!70278 (=> (not res!557465) (not e!452931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70278 (= res!557465 (validMask!0 mask!1312))))

(assert (=> start!70278 e!452931))

(declare-fun tp_is_empty!14383 () Bool)

(assert (=> start!70278 tp_is_empty!14383))

(declare-fun array_inv!17301 (array!44945) Bool)

(assert (=> start!70278 (array_inv!17301 _keys!976)))

(assert (=> start!70278 true))

(declare-fun array_inv!17302 (array!44943) Bool)

(assert (=> start!70278 (and (array_inv!17302 _values!788) e!452930)))

(assert (=> start!70278 tp!44743))

(declare-fun mapNonEmpty!23164 () Bool)

(declare-fun tp!44742 () Bool)

(declare-fun e!452932 () Bool)

(assert (=> mapNonEmpty!23164 (= mapRes!23164 (and tp!44742 e!452932))))

(declare-fun mapValue!23164 () ValueCell!6776)

(declare-fun mapKey!23164 () (_ BitVec 32))

(declare-fun mapRest!23164 () (Array (_ BitVec 32) ValueCell!6776))

(assert (=> mapNonEmpty!23164 (= (arr!21529 _values!788) (store mapRest!23164 mapKey!23164 mapValue!23164))))

(declare-fun b!816460 () Bool)

(assert (=> b!816460 (= e!452928 tp_is_empty!14383)))

(declare-fun b!816461 () Bool)

(declare-fun res!557462 () Bool)

(assert (=> b!816461 (=> (not res!557462) (not e!452931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44945 (_ BitVec 32)) Bool)

(assert (=> b!816461 (= res!557462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816462 () Bool)

(declare-fun res!557463 () Bool)

(assert (=> b!816462 (=> (not res!557463) (not e!452931))))

(assert (=> b!816462 (= res!557463 (and (= (size!21950 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21951 _keys!976) (size!21950 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816463 () Bool)

(assert (=> b!816463 (= e!452932 tp_is_empty!14383)))

(declare-fun b!816464 () Bool)

(assert (=> b!816464 (= e!452929 true)))

(declare-fun lt!365596 () ListLongMap!8337)

(declare-fun getCurrentListMap!2357 (array!44945 array!44943 (_ BitVec 32) (_ BitVec 32) V!24179 V!24179 (_ BitVec 32) Int) ListLongMap!8337)

(assert (=> b!816464 (= lt!365596 (getCurrentListMap!2357 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365599 () ListLongMap!8337)

(declare-fun +!1845 (ListLongMap!8337 tuple2!9524) ListLongMap!8337)

(assert (=> b!816464 (= lt!365599 (+!1845 (getCurrentListMap!2357 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70278 res!557465) b!816462))

(assert (= (and b!816462 res!557463) b!816461))

(assert (= (and b!816461 res!557462) b!816458))

(assert (= (and b!816458 res!557464) b!816459))

(assert (= (and b!816459 (not res!557461)) b!816464))

(assert (= (and b!816457 condMapEmpty!23164) mapIsEmpty!23164))

(assert (= (and b!816457 (not condMapEmpty!23164)) mapNonEmpty!23164))

(get-info :version)

(assert (= (and mapNonEmpty!23164 ((_ is ValueCellFull!6776) mapValue!23164)) b!816463))

(assert (= (and b!816457 ((_ is ValueCellFull!6776) mapDefault!23164)) b!816460))

(assert (= start!70278 b!816457))

(declare-fun m!757583 () Bool)

(assert (=> b!816459 m!757583))

(declare-fun m!757585 () Bool)

(assert (=> b!816459 m!757585))

(declare-fun m!757587 () Bool)

(assert (=> b!816459 m!757587))

(declare-fun m!757589 () Bool)

(assert (=> start!70278 m!757589))

(declare-fun m!757591 () Bool)

(assert (=> start!70278 m!757591))

(declare-fun m!757593 () Bool)

(assert (=> start!70278 m!757593))

(declare-fun m!757595 () Bool)

(assert (=> b!816461 m!757595))

(declare-fun m!757597 () Bool)

(assert (=> mapNonEmpty!23164 m!757597))

(declare-fun m!757599 () Bool)

(assert (=> b!816464 m!757599))

(declare-fun m!757601 () Bool)

(assert (=> b!816464 m!757601))

(assert (=> b!816464 m!757601))

(declare-fun m!757603 () Bool)

(assert (=> b!816464 m!757603))

(declare-fun m!757605 () Bool)

(assert (=> b!816458 m!757605))

(check-sat tp_is_empty!14383 (not start!70278) (not b!816464) (not b!816459) (not b!816458) b_and!21447 (not b!816461) (not mapNonEmpty!23164) (not b_next!12673))
(check-sat b_and!21447 (not b_next!12673))
