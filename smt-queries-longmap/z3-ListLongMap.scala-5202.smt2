; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70206 () Bool)

(assert start!70206)

(declare-fun b_free!12619 () Bool)

(declare-fun b_next!12619 () Bool)

(assert (=> start!70206 (= b_free!12619 (not b_next!12619))))

(declare-fun tp!44578 () Bool)

(declare-fun b_and!21381 () Bool)

(assert (=> start!70206 (= tp!44578 b_and!21381)))

(declare-fun b!815625 () Bool)

(declare-fun e!452336 () Bool)

(assert (=> b!815625 (= e!452336 true)))

(declare-datatypes ((V!24107 0))(
  ( (V!24108 (val!7212 Int)) )
))
(declare-datatypes ((tuple2!9486 0))(
  ( (tuple2!9487 (_1!4754 (_ BitVec 64)) (_2!4754 V!24107)) )
))
(declare-datatypes ((List!15313 0))(
  ( (Nil!15310) (Cons!15309 (h!16438 tuple2!9486) (t!21625 List!15313)) )
))
(declare-datatypes ((ListLongMap!8299 0))(
  ( (ListLongMap!8300 (toList!4165 List!15313)) )
))
(declare-fun lt!365070 () ListLongMap!8299)

(declare-datatypes ((array!44845 0))(
  ( (array!44846 (arr!21481 (Array (_ BitVec 32) (_ BitVec 64))) (size!21902 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44845)

(declare-fun zeroValueAfter!34 () V!24107)

(declare-fun minValue!754 () V!24107)

(declare-datatypes ((ValueCell!6749 0))(
  ( (ValueCellFull!6749 (v!9633 V!24107)) (EmptyCell!6749) )
))
(declare-datatypes ((array!44847 0))(
  ( (array!44848 (arr!21482 (Array (_ BitVec 32) ValueCell!6749)) (size!21903 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44847)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMap!2341 (array!44845 array!44847 (_ BitVec 32) (_ BitVec 32) V!24107 V!24107 (_ BitVec 32) Int) ListLongMap!8299)

(assert (=> b!815625 (= lt!365070 (getCurrentListMap!2341 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365072 () ListLongMap!8299)

(declare-fun zeroValueBefore!34 () V!24107)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun +!1829 (ListLongMap!8299 tuple2!9486) ListLongMap!8299)

(assert (=> b!815625 (= lt!365072 (+!1829 (getCurrentListMap!2341 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9487 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapNonEmpty!23080 () Bool)

(declare-fun mapRes!23080 () Bool)

(declare-fun tp!44577 () Bool)

(declare-fun e!452332 () Bool)

(assert (=> mapNonEmpty!23080 (= mapRes!23080 (and tp!44577 e!452332))))

(declare-fun mapKey!23080 () (_ BitVec 32))

(declare-fun mapValue!23080 () ValueCell!6749)

(declare-fun mapRest!23080 () (Array (_ BitVec 32) ValueCell!6749))

(assert (=> mapNonEmpty!23080 (= (arr!21482 _values!788) (store mapRest!23080 mapKey!23080 mapValue!23080))))

(declare-fun b!815626 () Bool)

(declare-fun res!556976 () Bool)

(declare-fun e!452334 () Bool)

(assert (=> b!815626 (=> (not res!556976) (not e!452334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44845 (_ BitVec 32)) Bool)

(assert (=> b!815626 (= res!556976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815627 () Bool)

(declare-fun res!556974 () Bool)

(assert (=> b!815627 (=> (not res!556974) (not e!452334))))

(assert (=> b!815627 (= res!556974 (and (= (size!21903 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21902 _keys!976) (size!21903 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815628 () Bool)

(declare-fun tp_is_empty!14329 () Bool)

(assert (=> b!815628 (= e!452332 tp_is_empty!14329)))

(declare-fun mapIsEmpty!23080 () Bool)

(assert (=> mapIsEmpty!23080 mapRes!23080))

(declare-fun res!556977 () Bool)

(assert (=> start!70206 (=> (not res!556977) (not e!452334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70206 (= res!556977 (validMask!0 mask!1312))))

(assert (=> start!70206 e!452334))

(assert (=> start!70206 tp_is_empty!14329))

(declare-fun array_inv!17267 (array!44845) Bool)

(assert (=> start!70206 (array_inv!17267 _keys!976)))

(assert (=> start!70206 true))

(declare-fun e!452331 () Bool)

(declare-fun array_inv!17268 (array!44847) Bool)

(assert (=> start!70206 (and (array_inv!17268 _values!788) e!452331)))

(assert (=> start!70206 tp!44578))

(declare-fun b!815629 () Bool)

(declare-fun e!452333 () Bool)

(assert (=> b!815629 (= e!452333 tp_is_empty!14329)))

(declare-fun b!815630 () Bool)

(declare-fun res!556978 () Bool)

(assert (=> b!815630 (=> (not res!556978) (not e!452334))))

(declare-datatypes ((List!15314 0))(
  ( (Nil!15311) (Cons!15310 (h!16439 (_ BitVec 64)) (t!21626 List!15314)) )
))
(declare-fun arrayNoDuplicates!0 (array!44845 (_ BitVec 32) List!15314) Bool)

(assert (=> b!815630 (= res!556978 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15311))))

(declare-fun b!815631 () Bool)

(assert (=> b!815631 (= e!452331 (and e!452333 mapRes!23080))))

(declare-fun condMapEmpty!23080 () Bool)

(declare-fun mapDefault!23080 () ValueCell!6749)

(assert (=> b!815631 (= condMapEmpty!23080 (= (arr!21482 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6749)) mapDefault!23080)))))

(declare-fun b!815632 () Bool)

(assert (=> b!815632 (= e!452334 (not e!452336))))

(declare-fun res!556975 () Bool)

(assert (=> b!815632 (=> res!556975 e!452336)))

(assert (=> b!815632 (= res!556975 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365069 () ListLongMap!8299)

(declare-fun lt!365068 () ListLongMap!8299)

(assert (=> b!815632 (= lt!365069 lt!365068)))

(declare-datatypes ((Unit!27762 0))(
  ( (Unit!27763) )
))
(declare-fun lt!365071 () Unit!27762)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!322 (array!44845 array!44847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24107 V!24107 V!24107 V!24107 (_ BitVec 32) Int) Unit!27762)

(assert (=> b!815632 (= lt!365071 (lemmaNoChangeToArrayThenSameMapNoExtras!322 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2229 (array!44845 array!44847 (_ BitVec 32) (_ BitVec 32) V!24107 V!24107 (_ BitVec 32) Int) ListLongMap!8299)

(assert (=> b!815632 (= lt!365068 (getCurrentListMapNoExtraKeys!2229 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815632 (= lt!365069 (getCurrentListMapNoExtraKeys!2229 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70206 res!556977) b!815627))

(assert (= (and b!815627 res!556974) b!815626))

(assert (= (and b!815626 res!556976) b!815630))

(assert (= (and b!815630 res!556978) b!815632))

(assert (= (and b!815632 (not res!556975)) b!815625))

(assert (= (and b!815631 condMapEmpty!23080) mapIsEmpty!23080))

(assert (= (and b!815631 (not condMapEmpty!23080)) mapNonEmpty!23080))

(get-info :version)

(assert (= (and mapNonEmpty!23080 ((_ is ValueCellFull!6749) mapValue!23080)) b!815628))

(assert (= (and b!815631 ((_ is ValueCellFull!6749) mapDefault!23080)) b!815629))

(assert (= start!70206 b!815631))

(declare-fun m!756765 () Bool)

(assert (=> b!815626 m!756765))

(declare-fun m!756767 () Bool)

(assert (=> b!815625 m!756767))

(declare-fun m!756769 () Bool)

(assert (=> b!815625 m!756769))

(assert (=> b!815625 m!756769))

(declare-fun m!756771 () Bool)

(assert (=> b!815625 m!756771))

(declare-fun m!756773 () Bool)

(assert (=> mapNonEmpty!23080 m!756773))

(declare-fun m!756775 () Bool)

(assert (=> start!70206 m!756775))

(declare-fun m!756777 () Bool)

(assert (=> start!70206 m!756777))

(declare-fun m!756779 () Bool)

(assert (=> start!70206 m!756779))

(declare-fun m!756781 () Bool)

(assert (=> b!815632 m!756781))

(declare-fun m!756783 () Bool)

(assert (=> b!815632 m!756783))

(declare-fun m!756785 () Bool)

(assert (=> b!815632 m!756785))

(declare-fun m!756787 () Bool)

(assert (=> b!815630 m!756787))

(check-sat (not mapNonEmpty!23080) (not b!815630) (not start!70206) tp_is_empty!14329 (not b!815626) (not b!815625) (not b!815632) b_and!21381 (not b_next!12619))
(check-sat b_and!21381 (not b_next!12619))
