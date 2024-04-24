; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70574 () Bool)

(assert start!70574)

(declare-fun b_free!12751 () Bool)

(declare-fun b_next!12751 () Bool)

(assert (=> start!70574 (= b_free!12751 (not b_next!12751))))

(declare-fun tp!44982 () Bool)

(declare-fun b_and!21581 () Bool)

(assert (=> start!70574 (= tp!44982 b_and!21581)))

(declare-fun b!818721 () Bool)

(declare-fun e!454441 () Bool)

(assert (=> b!818721 (= e!454441 true)))

(declare-datatypes ((V!24283 0))(
  ( (V!24284 (val!7278 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24283)

(declare-datatypes ((array!45121 0))(
  ( (array!45122 (arr!21611 (Array (_ BitVec 32) (_ BitVec 64))) (size!22031 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45121)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24283)

(declare-datatypes ((ValueCell!6815 0))(
  ( (ValueCellFull!6815 (v!9707 V!24283)) (EmptyCell!6815) )
))
(declare-datatypes ((array!45123 0))(
  ( (array!45124 (arr!21612 (Array (_ BitVec 32) ValueCell!6815)) (size!22032 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45123)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9472 0))(
  ( (tuple2!9473 (_1!4747 (_ BitVec 64)) (_2!4747 V!24283)) )
))
(declare-datatypes ((List!15286 0))(
  ( (Nil!15283) (Cons!15282 (h!16417 tuple2!9472) (t!21605 List!15286)) )
))
(declare-datatypes ((ListLongMap!8297 0))(
  ( (ListLongMap!8298 (toList!4164 List!15286)) )
))
(declare-fun lt!366778 () ListLongMap!8297)

(declare-fun getCurrentListMap!2362 (array!45121 array!45123 (_ BitVec 32) (_ BitVec 32) V!24283 V!24283 (_ BitVec 32) Int) ListLongMap!8297)

(assert (=> b!818721 (= lt!366778 (getCurrentListMap!2362 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818722 () Bool)

(declare-fun res!558531 () Bool)

(declare-fun e!454444 () Bool)

(assert (=> b!818722 (=> (not res!558531) (not e!454444))))

(declare-datatypes ((List!15287 0))(
  ( (Nil!15284) (Cons!15283 (h!16418 (_ BitVec 64)) (t!21606 List!15287)) )
))
(declare-fun arrayNoDuplicates!0 (array!45121 (_ BitVec 32) List!15287) Bool)

(assert (=> b!818722 (= res!558531 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15284))))

(declare-fun res!558532 () Bool)

(assert (=> start!70574 (=> (not res!558532) (not e!454444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70574 (= res!558532 (validMask!0 mask!1312))))

(assert (=> start!70574 e!454444))

(declare-fun tp_is_empty!14461 () Bool)

(assert (=> start!70574 tp_is_empty!14461))

(declare-fun array_inv!17313 (array!45121) Bool)

(assert (=> start!70574 (array_inv!17313 _keys!976)))

(assert (=> start!70574 true))

(declare-fun e!454445 () Bool)

(declare-fun array_inv!17314 (array!45123) Bool)

(assert (=> start!70574 (and (array_inv!17314 _values!788) e!454445)))

(assert (=> start!70574 tp!44982))

(declare-fun b!818723 () Bool)

(declare-fun res!558533 () Bool)

(assert (=> b!818723 (=> (not res!558533) (not e!454444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45121 (_ BitVec 32)) Bool)

(assert (=> b!818723 (= res!558533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818724 () Bool)

(assert (=> b!818724 (= e!454444 (not e!454441))))

(declare-fun res!558530 () Bool)

(assert (=> b!818724 (=> res!558530 e!454441)))

(assert (=> b!818724 (= res!558530 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366776 () ListLongMap!8297)

(declare-fun lt!366775 () ListLongMap!8297)

(assert (=> b!818724 (= lt!366776 lt!366775)))

(declare-fun zeroValueAfter!34 () V!24283)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27883 0))(
  ( (Unit!27884) )
))
(declare-fun lt!366777 () Unit!27883)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!351 (array!45121 array!45123 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24283 V!24283 V!24283 V!24283 (_ BitVec 32) Int) Unit!27883)

(assert (=> b!818724 (= lt!366777 (lemmaNoChangeToArrayThenSameMapNoExtras!351 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2263 (array!45121 array!45123 (_ BitVec 32) (_ BitVec 32) V!24283 V!24283 (_ BitVec 32) Int) ListLongMap!8297)

(assert (=> b!818724 (= lt!366775 (getCurrentListMapNoExtraKeys!2263 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818724 (= lt!366776 (getCurrentListMapNoExtraKeys!2263 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818725 () Bool)

(declare-fun e!454443 () Bool)

(assert (=> b!818725 (= e!454443 tp_is_empty!14461)))

(declare-fun mapNonEmpty!23287 () Bool)

(declare-fun mapRes!23287 () Bool)

(declare-fun tp!44983 () Bool)

(assert (=> mapNonEmpty!23287 (= mapRes!23287 (and tp!44983 e!454443))))

(declare-fun mapValue!23287 () ValueCell!6815)

(declare-fun mapRest!23287 () (Array (_ BitVec 32) ValueCell!6815))

(declare-fun mapKey!23287 () (_ BitVec 32))

(assert (=> mapNonEmpty!23287 (= (arr!21612 _values!788) (store mapRest!23287 mapKey!23287 mapValue!23287))))

(declare-fun mapIsEmpty!23287 () Bool)

(assert (=> mapIsEmpty!23287 mapRes!23287))

(declare-fun b!818726 () Bool)

(declare-fun e!454442 () Bool)

(assert (=> b!818726 (= e!454445 (and e!454442 mapRes!23287))))

(declare-fun condMapEmpty!23287 () Bool)

(declare-fun mapDefault!23287 () ValueCell!6815)

(assert (=> b!818726 (= condMapEmpty!23287 (= (arr!21612 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6815)) mapDefault!23287)))))

(declare-fun b!818727 () Bool)

(declare-fun res!558534 () Bool)

(assert (=> b!818727 (=> (not res!558534) (not e!454444))))

(assert (=> b!818727 (= res!558534 (and (= (size!22032 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22031 _keys!976) (size!22032 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818728 () Bool)

(assert (=> b!818728 (= e!454442 tp_is_empty!14461)))

(assert (= (and start!70574 res!558532) b!818727))

(assert (= (and b!818727 res!558534) b!818723))

(assert (= (and b!818723 res!558533) b!818722))

(assert (= (and b!818722 res!558531) b!818724))

(assert (= (and b!818724 (not res!558530)) b!818721))

(assert (= (and b!818726 condMapEmpty!23287) mapIsEmpty!23287))

(assert (= (and b!818726 (not condMapEmpty!23287)) mapNonEmpty!23287))

(get-info :version)

(assert (= (and mapNonEmpty!23287 ((_ is ValueCellFull!6815) mapValue!23287)) b!818725))

(assert (= (and b!818726 ((_ is ValueCellFull!6815) mapDefault!23287)) b!818728))

(assert (= start!70574 b!818726))

(declare-fun m!760627 () Bool)

(assert (=> b!818721 m!760627))

(declare-fun m!760629 () Bool)

(assert (=> mapNonEmpty!23287 m!760629))

(declare-fun m!760631 () Bool)

(assert (=> b!818723 m!760631))

(declare-fun m!760633 () Bool)

(assert (=> start!70574 m!760633))

(declare-fun m!760635 () Bool)

(assert (=> start!70574 m!760635))

(declare-fun m!760637 () Bool)

(assert (=> start!70574 m!760637))

(declare-fun m!760639 () Bool)

(assert (=> b!818724 m!760639))

(declare-fun m!760641 () Bool)

(assert (=> b!818724 m!760641))

(declare-fun m!760643 () Bool)

(assert (=> b!818724 m!760643))

(declare-fun m!760645 () Bool)

(assert (=> b!818722 m!760645))

(check-sat (not b!818724) (not b!818722) (not b_next!12751) (not start!70574) (not mapNonEmpty!23287) tp_is_empty!14461 (not b!818721) (not b!818723) b_and!21581)
(check-sat b_and!21581 (not b_next!12751))
