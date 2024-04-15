; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70344 () Bool)

(assert start!70344)

(declare-fun b_free!12721 () Bool)

(declare-fun b_next!12721 () Bool)

(assert (=> start!70344 (= b_free!12721 (not b_next!12721))))

(declare-fun tp!44890 () Bool)

(declare-fun b_and!21507 () Bool)

(assert (=> start!70344 (= tp!44890 b_and!21507)))

(declare-fun b!817179 () Bool)

(declare-fun e!453432 () Bool)

(declare-fun tp_is_empty!14431 () Bool)

(assert (=> b!817179 (= e!453432 tp_is_empty!14431)))

(declare-fun b!817180 () Bool)

(declare-fun res!557866 () Bool)

(declare-fun e!453434 () Bool)

(assert (=> b!817180 (=> (not res!557866) (not e!453434))))

(declare-datatypes ((array!45041 0))(
  ( (array!45042 (arr!21577 (Array (_ BitVec 32) (_ BitVec 64))) (size!21998 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45041)

(declare-datatypes ((List!15385 0))(
  ( (Nil!15382) (Cons!15381 (h!16510 (_ BitVec 64)) (t!21701 List!15385)) )
))
(declare-fun arrayNoDuplicates!0 (array!45041 (_ BitVec 32) List!15385) Bool)

(assert (=> b!817180 (= res!557866 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15382))))

(declare-fun mapIsEmpty!23239 () Bool)

(declare-fun mapRes!23239 () Bool)

(assert (=> mapIsEmpty!23239 mapRes!23239))

(declare-fun res!557868 () Bool)

(assert (=> start!70344 (=> (not res!557868) (not e!453434))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70344 (= res!557868 (validMask!0 mask!1312))))

(assert (=> start!70344 e!453434))

(assert (=> start!70344 tp_is_empty!14431))

(declare-fun array_inv!17329 (array!45041) Bool)

(assert (=> start!70344 (array_inv!17329 _keys!976)))

(assert (=> start!70344 true))

(declare-datatypes ((V!24243 0))(
  ( (V!24244 (val!7263 Int)) )
))
(declare-datatypes ((ValueCell!6800 0))(
  ( (ValueCellFull!6800 (v!9686 V!24243)) (EmptyCell!6800) )
))
(declare-datatypes ((array!45043 0))(
  ( (array!45044 (arr!21578 (Array (_ BitVec 32) ValueCell!6800)) (size!21999 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45043)

(declare-fun e!453435 () Bool)

(declare-fun array_inv!17330 (array!45043) Bool)

(assert (=> start!70344 (and (array_inv!17330 _values!788) e!453435)))

(assert (=> start!70344 tp!44890))

(declare-fun b!817181 () Bool)

(declare-fun res!557867 () Bool)

(assert (=> b!817181 (=> (not res!557867) (not e!453434))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817181 (= res!557867 (and (= (size!21999 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21998 _keys!976) (size!21999 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23239 () Bool)

(declare-fun tp!44889 () Bool)

(declare-fun e!453431 () Bool)

(assert (=> mapNonEmpty!23239 (= mapRes!23239 (and tp!44889 e!453431))))

(declare-fun mapRest!23239 () (Array (_ BitVec 32) ValueCell!6800))

(declare-fun mapKey!23239 () (_ BitVec 32))

(declare-fun mapValue!23239 () ValueCell!6800)

(assert (=> mapNonEmpty!23239 (= (arr!21578 _values!788) (store mapRest!23239 mapKey!23239 mapValue!23239))))

(declare-fun b!817182 () Bool)

(assert (=> b!817182 (= e!453431 tp_is_empty!14431)))

(declare-fun b!817183 () Bool)

(declare-fun res!557865 () Bool)

(assert (=> b!817183 (=> (not res!557865) (not e!453434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45041 (_ BitVec 32)) Bool)

(assert (=> b!817183 (= res!557865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817184 () Bool)

(assert (=> b!817184 (= e!453435 (and e!453432 mapRes!23239))))

(declare-fun condMapEmpty!23239 () Bool)

(declare-fun mapDefault!23239 () ValueCell!6800)

(assert (=> b!817184 (= condMapEmpty!23239 (= (arr!21578 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6800)) mapDefault!23239)))))

(declare-fun b!817185 () Bool)

(assert (=> b!817185 (= e!453434 (not true))))

(declare-datatypes ((tuple2!9564 0))(
  ( (tuple2!9565 (_1!4793 (_ BitVec 64)) (_2!4793 V!24243)) )
))
(declare-datatypes ((List!15386 0))(
  ( (Nil!15383) (Cons!15382 (h!16511 tuple2!9564) (t!21702 List!15386)) )
))
(declare-datatypes ((ListLongMap!8377 0))(
  ( (ListLongMap!8378 (toList!4204 List!15386)) )
))
(declare-fun lt!366002 () ListLongMap!8377)

(declare-fun lt!366003 () ListLongMap!8377)

(assert (=> b!817185 (= lt!366002 lt!366003)))

(declare-fun zeroValueBefore!34 () V!24243)

(declare-fun zeroValueAfter!34 () V!24243)

(declare-fun minValue!754 () V!24243)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27836 0))(
  ( (Unit!27837) )
))
(declare-fun lt!366001 () Unit!27836)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!357 (array!45041 array!45043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24243 V!24243 V!24243 V!24243 (_ BitVec 32) Int) Unit!27836)

(assert (=> b!817185 (= lt!366001 (lemmaNoChangeToArrayThenSameMapNoExtras!357 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2264 (array!45041 array!45043 (_ BitVec 32) (_ BitVec 32) V!24243 V!24243 (_ BitVec 32) Int) ListLongMap!8377)

(assert (=> b!817185 (= lt!366003 (getCurrentListMapNoExtraKeys!2264 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817185 (= lt!366002 (getCurrentListMapNoExtraKeys!2264 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70344 res!557868) b!817181))

(assert (= (and b!817181 res!557867) b!817183))

(assert (= (and b!817183 res!557865) b!817180))

(assert (= (and b!817180 res!557866) b!817185))

(assert (= (and b!817184 condMapEmpty!23239) mapIsEmpty!23239))

(assert (= (and b!817184 (not condMapEmpty!23239)) mapNonEmpty!23239))

(get-info :version)

(assert (= (and mapNonEmpty!23239 ((_ is ValueCellFull!6800) mapValue!23239)) b!817182))

(assert (= (and b!817184 ((_ is ValueCellFull!6800) mapDefault!23239)) b!817179))

(assert (= start!70344 b!817184))

(declare-fun m!758257 () Bool)

(assert (=> b!817180 m!758257))

(declare-fun m!758259 () Bool)

(assert (=> b!817183 m!758259))

(declare-fun m!758261 () Bool)

(assert (=> start!70344 m!758261))

(declare-fun m!758263 () Bool)

(assert (=> start!70344 m!758263))

(declare-fun m!758265 () Bool)

(assert (=> start!70344 m!758265))

(declare-fun m!758267 () Bool)

(assert (=> mapNonEmpty!23239 m!758267))

(declare-fun m!758269 () Bool)

(assert (=> b!817185 m!758269))

(declare-fun m!758271 () Bool)

(assert (=> b!817185 m!758271))

(declare-fun m!758273 () Bool)

(assert (=> b!817185 m!758273))

(check-sat b_and!21507 (not b!817185) tp_is_empty!14431 (not b!817183) (not b!817180) (not mapNonEmpty!23239) (not b_next!12721) (not start!70344))
(check-sat b_and!21507 (not b_next!12721))
