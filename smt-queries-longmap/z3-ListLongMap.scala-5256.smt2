; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70658 () Bool)

(assert start!70658)

(declare-fun b_free!12945 () Bool)

(declare-fun b_next!12945 () Bool)

(assert (=> start!70658 (= b_free!12945 (not b_next!12945))))

(declare-fun tp!45573 () Bool)

(declare-fun b_and!21799 () Bool)

(assert (=> start!70658 (= tp!45573 b_and!21799)))

(declare-fun b!820803 () Bool)

(declare-fun res!559995 () Bool)

(declare-fun e!456063 () Bool)

(assert (=> b!820803 (=> (not res!559995) (not e!456063))))

(declare-datatypes ((array!45504 0))(
  ( (array!45505 (arr!21804 (Array (_ BitVec 32) (_ BitVec 64))) (size!22225 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45504)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45504 (_ BitVec 32)) Bool)

(assert (=> b!820803 (= res!559995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820804 () Bool)

(assert (=> b!820804 (= e!456063 (not true))))

(declare-datatypes ((V!24541 0))(
  ( (V!24542 (val!7375 Int)) )
))
(declare-datatypes ((tuple2!9720 0))(
  ( (tuple2!9721 (_1!4871 (_ BitVec 64)) (_2!4871 V!24541)) )
))
(declare-datatypes ((List!15540 0))(
  ( (Nil!15537) (Cons!15536 (h!16665 tuple2!9720) (t!21873 List!15540)) )
))
(declare-datatypes ((ListLongMap!8543 0))(
  ( (ListLongMap!8544 (toList!4287 List!15540)) )
))
(declare-fun lt!368923 () ListLongMap!8543)

(declare-fun lt!368921 () ListLongMap!8543)

(assert (=> b!820804 (= lt!368923 lt!368921)))

(declare-fun zeroValueBefore!34 () V!24541)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24541)

(declare-fun minValue!754 () V!24541)

(declare-datatypes ((ValueCell!6912 0))(
  ( (ValueCellFull!6912 (v!9806 V!24541)) (EmptyCell!6912) )
))
(declare-datatypes ((array!45506 0))(
  ( (array!45507 (arr!21805 (Array (_ BitVec 32) ValueCell!6912)) (size!22226 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45506)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28051 0))(
  ( (Unit!28052) )
))
(declare-fun lt!368922 () Unit!28051)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!423 (array!45504 array!45506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24541 V!24541 V!24541 V!24541 (_ BitVec 32) Int) Unit!28051)

(assert (=> b!820804 (= lt!368922 (lemmaNoChangeToArrayThenSameMapNoExtras!423 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2313 (array!45504 array!45506 (_ BitVec 32) (_ BitVec 32) V!24541 V!24541 (_ BitVec 32) Int) ListLongMap!8543)

(assert (=> b!820804 (= lt!368921 (getCurrentListMapNoExtraKeys!2313 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820804 (= lt!368923 (getCurrentListMapNoExtraKeys!2313 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23587 () Bool)

(declare-fun mapRes!23587 () Bool)

(declare-fun tp!45574 () Bool)

(declare-fun e!456064 () Bool)

(assert (=> mapNonEmpty!23587 (= mapRes!23587 (and tp!45574 e!456064))))

(declare-fun mapValue!23587 () ValueCell!6912)

(declare-fun mapRest!23587 () (Array (_ BitVec 32) ValueCell!6912))

(declare-fun mapKey!23587 () (_ BitVec 32))

(assert (=> mapNonEmpty!23587 (= (arr!21805 _values!788) (store mapRest!23587 mapKey!23587 mapValue!23587))))

(declare-fun b!820805 () Bool)

(declare-fun res!559993 () Bool)

(assert (=> b!820805 (=> (not res!559993) (not e!456063))))

(assert (=> b!820805 (= res!559993 (and (= (size!22226 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22225 _keys!976) (size!22226 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23587 () Bool)

(assert (=> mapIsEmpty!23587 mapRes!23587))

(declare-fun b!820807 () Bool)

(declare-fun e!456066 () Bool)

(declare-fun tp_is_empty!14655 () Bool)

(assert (=> b!820807 (= e!456066 tp_is_empty!14655)))

(declare-fun b!820808 () Bool)

(assert (=> b!820808 (= e!456064 tp_is_empty!14655)))

(declare-fun b!820809 () Bool)

(declare-fun res!559994 () Bool)

(assert (=> b!820809 (=> (not res!559994) (not e!456063))))

(declare-datatypes ((List!15541 0))(
  ( (Nil!15538) (Cons!15537 (h!16666 (_ BitVec 64)) (t!21874 List!15541)) )
))
(declare-fun arrayNoDuplicates!0 (array!45504 (_ BitVec 32) List!15541) Bool)

(assert (=> b!820809 (= res!559994 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15538))))

(declare-fun res!559996 () Bool)

(assert (=> start!70658 (=> (not res!559996) (not e!456063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70658 (= res!559996 (validMask!0 mask!1312))))

(assert (=> start!70658 e!456063))

(assert (=> start!70658 tp_is_empty!14655))

(declare-fun array_inv!17427 (array!45504) Bool)

(assert (=> start!70658 (array_inv!17427 _keys!976)))

(assert (=> start!70658 true))

(declare-fun e!456065 () Bool)

(declare-fun array_inv!17428 (array!45506) Bool)

(assert (=> start!70658 (and (array_inv!17428 _values!788) e!456065)))

(assert (=> start!70658 tp!45573))

(declare-fun b!820806 () Bool)

(assert (=> b!820806 (= e!456065 (and e!456066 mapRes!23587))))

(declare-fun condMapEmpty!23587 () Bool)

(declare-fun mapDefault!23587 () ValueCell!6912)

(assert (=> b!820806 (= condMapEmpty!23587 (= (arr!21805 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6912)) mapDefault!23587)))))

(assert (= (and start!70658 res!559996) b!820805))

(assert (= (and b!820805 res!559993) b!820803))

(assert (= (and b!820803 res!559995) b!820809))

(assert (= (and b!820809 res!559994) b!820804))

(assert (= (and b!820806 condMapEmpty!23587) mapIsEmpty!23587))

(assert (= (and b!820806 (not condMapEmpty!23587)) mapNonEmpty!23587))

(get-info :version)

(assert (= (and mapNonEmpty!23587 ((_ is ValueCellFull!6912) mapValue!23587)) b!820808))

(assert (= (and b!820806 ((_ is ValueCellFull!6912) mapDefault!23587)) b!820807))

(assert (= start!70658 b!820806))

(declare-fun m!762705 () Bool)

(assert (=> b!820809 m!762705))

(declare-fun m!762707 () Bool)

(assert (=> start!70658 m!762707))

(declare-fun m!762709 () Bool)

(assert (=> start!70658 m!762709))

(declare-fun m!762711 () Bool)

(assert (=> start!70658 m!762711))

(declare-fun m!762713 () Bool)

(assert (=> mapNonEmpty!23587 m!762713))

(declare-fun m!762715 () Bool)

(assert (=> b!820804 m!762715))

(declare-fun m!762717 () Bool)

(assert (=> b!820804 m!762717))

(declare-fun m!762719 () Bool)

(assert (=> b!820804 m!762719))

(declare-fun m!762721 () Bool)

(assert (=> b!820803 m!762721))

(check-sat (not b!820803) (not b!820809) tp_is_empty!14655 (not start!70658) (not b!820804) (not mapNonEmpty!23587) (not b_next!12945) b_and!21799)
(check-sat b_and!21799 (not b_next!12945))
