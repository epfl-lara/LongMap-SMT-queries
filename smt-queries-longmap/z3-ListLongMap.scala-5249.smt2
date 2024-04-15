; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70574 () Bool)

(assert start!70574)

(declare-fun b_free!12901 () Bool)

(declare-fun b_next!12901 () Bool)

(assert (=> start!70574 (= b_free!12901 (not b_next!12901))))

(declare-fun tp!45439 () Bool)

(declare-fun b_and!21717 () Bool)

(assert (=> start!70574 (= tp!45439 b_and!21717)))

(declare-fun mapIsEmpty!23518 () Bool)

(declare-fun mapRes!23518 () Bool)

(assert (=> mapIsEmpty!23518 mapRes!23518))

(declare-fun b!819869 () Bool)

(declare-fun e!455429 () Bool)

(declare-fun tp_is_empty!14611 () Bool)

(assert (=> b!819869 (= e!455429 tp_is_empty!14611)))

(declare-fun b!819871 () Bool)

(declare-fun res!559500 () Bool)

(declare-fun e!455430 () Bool)

(assert (=> b!819871 (=> (not res!559500) (not e!455430))))

(declare-datatypes ((array!45393 0))(
  ( (array!45394 (arr!21750 (Array (_ BitVec 32) (_ BitVec 64))) (size!22171 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45393)

(declare-datatypes ((List!15521 0))(
  ( (Nil!15518) (Cons!15517 (h!16646 (_ BitVec 64)) (t!21843 List!15521)) )
))
(declare-fun arrayNoDuplicates!0 (array!45393 (_ BitVec 32) List!15521) Bool)

(assert (=> b!819871 (= res!559500 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15518))))

(declare-fun b!819872 () Bool)

(declare-fun e!455433 () Bool)

(assert (=> b!819872 (= e!455430 (not e!455433))))

(declare-fun res!559504 () Bool)

(assert (=> b!819872 (=> res!559504 e!455433)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819872 (= res!559504 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24483 0))(
  ( (V!24484 (val!7353 Int)) )
))
(declare-datatypes ((tuple2!9704 0))(
  ( (tuple2!9705 (_1!4863 (_ BitVec 64)) (_2!4863 V!24483)) )
))
(declare-datatypes ((List!15522 0))(
  ( (Nil!15519) (Cons!15518 (h!16647 tuple2!9704) (t!21844 List!15522)) )
))
(declare-datatypes ((ListLongMap!8517 0))(
  ( (ListLongMap!8518 (toList!4274 List!15522)) )
))
(declare-fun lt!368219 () ListLongMap!8517)

(declare-fun lt!368220 () ListLongMap!8517)

(assert (=> b!819872 (= lt!368219 lt!368220)))

(declare-fun zeroValueBefore!34 () V!24483)

(declare-fun zeroValueAfter!34 () V!24483)

(declare-fun minValue!754 () V!24483)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6890 0))(
  ( (ValueCellFull!6890 (v!9777 V!24483)) (EmptyCell!6890) )
))
(declare-datatypes ((array!45395 0))(
  ( (array!45396 (arr!21751 (Array (_ BitVec 32) ValueCell!6890)) (size!22172 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45395)

(declare-datatypes ((Unit!27975 0))(
  ( (Unit!27976) )
))
(declare-fun lt!368216 () Unit!27975)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!419 (array!45393 array!45395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24483 V!24483 V!24483 V!24483 (_ BitVec 32) Int) Unit!27975)

(assert (=> b!819872 (= lt!368216 (lemmaNoChangeToArrayThenSameMapNoExtras!419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2326 (array!45393 array!45395 (_ BitVec 32) (_ BitVec 32) V!24483 V!24483 (_ BitVec 32) Int) ListLongMap!8517)

(assert (=> b!819872 (= lt!368220 (getCurrentListMapNoExtraKeys!2326 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819872 (= lt!368219 (getCurrentListMapNoExtraKeys!2326 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819873 () Bool)

(assert (=> b!819873 (= e!455433 true)))

(declare-fun lt!368223 () tuple2!9704)

(declare-fun lt!368218 () tuple2!9704)

(declare-fun lt!368221 () ListLongMap!8517)

(declare-fun +!1895 (ListLongMap!8517 tuple2!9704) ListLongMap!8517)

(assert (=> b!819873 (= lt!368221 (+!1895 (+!1895 lt!368220 lt!368218) lt!368223))))

(declare-fun lt!368217 () ListLongMap!8517)

(assert (=> b!819873 (= (+!1895 lt!368219 lt!368223) (+!1895 lt!368217 lt!368223))))

(declare-fun lt!368222 () Unit!27975)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!209 (ListLongMap!8517 (_ BitVec 64) V!24483 V!24483) Unit!27975)

(assert (=> b!819873 (= lt!368222 (addSameAsAddTwiceSameKeyDiffValues!209 lt!368219 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819873 (= lt!368223 (tuple2!9705 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455428 () Bool)

(assert (=> b!819873 e!455428))

(declare-fun res!559501 () Bool)

(assert (=> b!819873 (=> (not res!559501) (not e!455428))))

(declare-fun lt!368214 () ListLongMap!8517)

(assert (=> b!819873 (= res!559501 (= lt!368214 lt!368217))))

(assert (=> b!819873 (= lt!368217 (+!1895 lt!368219 lt!368218))))

(assert (=> b!819873 (= lt!368218 (tuple2!9705 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!368215 () ListLongMap!8517)

(declare-fun getCurrentListMap!2422 (array!45393 array!45395 (_ BitVec 32) (_ BitVec 32) V!24483 V!24483 (_ BitVec 32) Int) ListLongMap!8517)

(assert (=> b!819873 (= lt!368215 (getCurrentListMap!2422 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819873 (= lt!368214 (getCurrentListMap!2422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819874 () Bool)

(declare-fun e!455431 () Bool)

(declare-fun e!455432 () Bool)

(assert (=> b!819874 (= e!455431 (and e!455432 mapRes!23518))))

(declare-fun condMapEmpty!23518 () Bool)

(declare-fun mapDefault!23518 () ValueCell!6890)

(assert (=> b!819874 (= condMapEmpty!23518 (= (arr!21751 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6890)) mapDefault!23518)))))

(declare-fun b!819875 () Bool)

(declare-fun res!559499 () Bool)

(assert (=> b!819875 (=> (not res!559499) (not e!455430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45393 (_ BitVec 32)) Bool)

(assert (=> b!819875 (= res!559499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819876 () Bool)

(assert (=> b!819876 (= e!455428 (= lt!368215 (+!1895 lt!368220 (tuple2!9705 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819877 () Bool)

(assert (=> b!819877 (= e!455432 tp_is_empty!14611)))

(declare-fun mapNonEmpty!23518 () Bool)

(declare-fun tp!45438 () Bool)

(assert (=> mapNonEmpty!23518 (= mapRes!23518 (and tp!45438 e!455429))))

(declare-fun mapValue!23518 () ValueCell!6890)

(declare-fun mapKey!23518 () (_ BitVec 32))

(declare-fun mapRest!23518 () (Array (_ BitVec 32) ValueCell!6890))

(assert (=> mapNonEmpty!23518 (= (arr!21751 _values!788) (store mapRest!23518 mapKey!23518 mapValue!23518))))

(declare-fun res!559502 () Bool)

(assert (=> start!70574 (=> (not res!559502) (not e!455430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70574 (= res!559502 (validMask!0 mask!1312))))

(assert (=> start!70574 e!455430))

(assert (=> start!70574 tp_is_empty!14611))

(declare-fun array_inv!17449 (array!45393) Bool)

(assert (=> start!70574 (array_inv!17449 _keys!976)))

(assert (=> start!70574 true))

(declare-fun array_inv!17450 (array!45395) Bool)

(assert (=> start!70574 (and (array_inv!17450 _values!788) e!455431)))

(assert (=> start!70574 tp!45439))

(declare-fun b!819870 () Bool)

(declare-fun res!559503 () Bool)

(assert (=> b!819870 (=> (not res!559503) (not e!455430))))

(assert (=> b!819870 (= res!559503 (and (= (size!22172 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22171 _keys!976) (size!22172 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70574 res!559502) b!819870))

(assert (= (and b!819870 res!559503) b!819875))

(assert (= (and b!819875 res!559499) b!819871))

(assert (= (and b!819871 res!559500) b!819872))

(assert (= (and b!819872 (not res!559504)) b!819873))

(assert (= (and b!819873 res!559501) b!819876))

(assert (= (and b!819874 condMapEmpty!23518) mapIsEmpty!23518))

(assert (= (and b!819874 (not condMapEmpty!23518)) mapNonEmpty!23518))

(get-info :version)

(assert (= (and mapNonEmpty!23518 ((_ is ValueCellFull!6890) mapValue!23518)) b!819869))

(assert (= (and b!819874 ((_ is ValueCellFull!6890) mapDefault!23518)) b!819877))

(assert (= start!70574 b!819874))

(declare-fun m!761211 () Bool)

(assert (=> b!819872 m!761211))

(declare-fun m!761213 () Bool)

(assert (=> b!819872 m!761213))

(declare-fun m!761215 () Bool)

(assert (=> b!819872 m!761215))

(declare-fun m!761217 () Bool)

(assert (=> mapNonEmpty!23518 m!761217))

(declare-fun m!761219 () Bool)

(assert (=> b!819875 m!761219))

(declare-fun m!761221 () Bool)

(assert (=> b!819871 m!761221))

(declare-fun m!761223 () Bool)

(assert (=> start!70574 m!761223))

(declare-fun m!761225 () Bool)

(assert (=> start!70574 m!761225))

(declare-fun m!761227 () Bool)

(assert (=> start!70574 m!761227))

(declare-fun m!761229 () Bool)

(assert (=> b!819873 m!761229))

(declare-fun m!761231 () Bool)

(assert (=> b!819873 m!761231))

(declare-fun m!761233 () Bool)

(assert (=> b!819873 m!761233))

(declare-fun m!761235 () Bool)

(assert (=> b!819873 m!761235))

(assert (=> b!819873 m!761233))

(declare-fun m!761237 () Bool)

(assert (=> b!819873 m!761237))

(declare-fun m!761239 () Bool)

(assert (=> b!819873 m!761239))

(declare-fun m!761241 () Bool)

(assert (=> b!819873 m!761241))

(declare-fun m!761243 () Bool)

(assert (=> b!819873 m!761243))

(declare-fun m!761245 () Bool)

(assert (=> b!819876 m!761245))

(check-sat b_and!21717 (not b_next!12901) (not start!70574) (not b!819873) (not b!819875) (not mapNonEmpty!23518) (not b!819871) (not b!819876) (not b!819872) tp_is_empty!14611)
(check-sat b_and!21717 (not b_next!12901))
