; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70720 () Bool)

(assert start!70720)

(declare-fun b_free!12993 () Bool)

(declare-fun b_next!12993 () Bool)

(assert (=> start!70720 (= b_free!12993 (not b_next!12993))))

(declare-fun tp!45720 () Bool)

(declare-fun b_and!21855 () Bool)

(assert (=> start!70720 (= tp!45720 b_and!21855)))

(declare-fun b!821433 () Bool)

(declare-fun res!560353 () Bool)

(declare-fun e!456521 () Bool)

(assert (=> b!821433 (=> (not res!560353) (not e!456521))))

(declare-datatypes ((array!45602 0))(
  ( (array!45603 (arr!21852 (Array (_ BitVec 32) (_ BitVec 64))) (size!22273 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45602)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24605 0))(
  ( (V!24606 (val!7399 Int)) )
))
(declare-datatypes ((ValueCell!6936 0))(
  ( (ValueCellFull!6936 (v!9830 V!24605)) (EmptyCell!6936) )
))
(declare-datatypes ((array!45604 0))(
  ( (array!45605 (arr!21853 (Array (_ BitVec 32) ValueCell!6936)) (size!22274 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45604)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821433 (= res!560353 (and (= (size!22274 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22273 _keys!976) (size!22274 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821434 () Bool)

(declare-fun res!560356 () Bool)

(assert (=> b!821434 (=> (not res!560356) (not e!456521))))

(declare-datatypes ((List!15578 0))(
  ( (Nil!15575) (Cons!15574 (h!16703 (_ BitVec 64)) (t!21913 List!15578)) )
))
(declare-fun arrayNoDuplicates!0 (array!45602 (_ BitVec 32) List!15578) Bool)

(assert (=> b!821434 (= res!560356 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15575))))

(declare-fun b!821435 () Bool)

(declare-fun e!456524 () Bool)

(assert (=> b!821435 (= e!456521 (not e!456524))))

(declare-fun res!560355 () Bool)

(assert (=> b!821435 (=> res!560355 e!456524)))

(assert (=> b!821435 (= res!560355 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9760 0))(
  ( (tuple2!9761 (_1!4891 (_ BitVec 64)) (_2!4891 V!24605)) )
))
(declare-datatypes ((List!15579 0))(
  ( (Nil!15576) (Cons!15575 (h!16704 tuple2!9760) (t!21914 List!15579)) )
))
(declare-datatypes ((ListLongMap!8583 0))(
  ( (ListLongMap!8584 (toList!4307 List!15579)) )
))
(declare-fun lt!369218 () ListLongMap!8583)

(declare-fun lt!369221 () ListLongMap!8583)

(assert (=> b!821435 (= lt!369218 lt!369221)))

(declare-fun zeroValueBefore!34 () V!24605)

(declare-fun zeroValueAfter!34 () V!24605)

(declare-fun minValue!754 () V!24605)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28091 0))(
  ( (Unit!28092) )
))
(declare-fun lt!369220 () Unit!28091)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!443 (array!45602 array!45604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24605 V!24605 V!24605 V!24605 (_ BitVec 32) Int) Unit!28091)

(assert (=> b!821435 (= lt!369220 (lemmaNoChangeToArrayThenSameMapNoExtras!443 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2333 (array!45602 array!45604 (_ BitVec 32) (_ BitVec 32) V!24605 V!24605 (_ BitVec 32) Int) ListLongMap!8583)

(assert (=> b!821435 (= lt!369221 (getCurrentListMapNoExtraKeys!2333 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821435 (= lt!369218 (getCurrentListMapNoExtraKeys!2333 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821436 () Bool)

(assert (=> b!821436 (= e!456524 true)))

(declare-fun lt!369219 () ListLongMap!8583)

(declare-fun getCurrentListMap!2476 (array!45602 array!45604 (_ BitVec 32) (_ BitVec 32) V!24605 V!24605 (_ BitVec 32) Int) ListLongMap!8583)

(assert (=> b!821436 (= lt!369219 (getCurrentListMap!2476 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821437 () Bool)

(declare-fun res!560354 () Bool)

(assert (=> b!821437 (=> (not res!560354) (not e!456521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45602 (_ BitVec 32)) Bool)

(assert (=> b!821437 (= res!560354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23662 () Bool)

(declare-fun mapRes!23662 () Bool)

(declare-fun tp!45721 () Bool)

(declare-fun e!456522 () Bool)

(assert (=> mapNonEmpty!23662 (= mapRes!23662 (and tp!45721 e!456522))))

(declare-fun mapRest!23662 () (Array (_ BitVec 32) ValueCell!6936))

(declare-fun mapKey!23662 () (_ BitVec 32))

(declare-fun mapValue!23662 () ValueCell!6936)

(assert (=> mapNonEmpty!23662 (= (arr!21853 _values!788) (store mapRest!23662 mapKey!23662 mapValue!23662))))

(declare-fun mapIsEmpty!23662 () Bool)

(assert (=> mapIsEmpty!23662 mapRes!23662))

(declare-fun b!821438 () Bool)

(declare-fun e!456520 () Bool)

(declare-fun tp_is_empty!14703 () Bool)

(assert (=> b!821438 (= e!456520 tp_is_empty!14703)))

(declare-fun b!821439 () Bool)

(assert (=> b!821439 (= e!456522 tp_is_empty!14703)))

(declare-fun res!560357 () Bool)

(assert (=> start!70720 (=> (not res!560357) (not e!456521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70720 (= res!560357 (validMask!0 mask!1312))))

(assert (=> start!70720 e!456521))

(assert (=> start!70720 tp_is_empty!14703))

(declare-fun array_inv!17463 (array!45602) Bool)

(assert (=> start!70720 (array_inv!17463 _keys!976)))

(assert (=> start!70720 true))

(declare-fun e!456523 () Bool)

(declare-fun array_inv!17464 (array!45604) Bool)

(assert (=> start!70720 (and (array_inv!17464 _values!788) e!456523)))

(assert (=> start!70720 tp!45720))

(declare-fun b!821440 () Bool)

(assert (=> b!821440 (= e!456523 (and e!456520 mapRes!23662))))

(declare-fun condMapEmpty!23662 () Bool)

(declare-fun mapDefault!23662 () ValueCell!6936)

(assert (=> b!821440 (= condMapEmpty!23662 (= (arr!21853 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6936)) mapDefault!23662)))))

(assert (= (and start!70720 res!560357) b!821433))

(assert (= (and b!821433 res!560353) b!821437))

(assert (= (and b!821437 res!560354) b!821434))

(assert (= (and b!821434 res!560356) b!821435))

(assert (= (and b!821435 (not res!560355)) b!821436))

(assert (= (and b!821440 condMapEmpty!23662) mapIsEmpty!23662))

(assert (= (and b!821440 (not condMapEmpty!23662)) mapNonEmpty!23662))

(get-info :version)

(assert (= (and mapNonEmpty!23662 ((_ is ValueCellFull!6936) mapValue!23662)) b!821439))

(assert (= (and b!821440 ((_ is ValueCellFull!6936) mapDefault!23662)) b!821438))

(assert (= start!70720 b!821440))

(declare-fun m!763229 () Bool)

(assert (=> mapNonEmpty!23662 m!763229))

(declare-fun m!763231 () Bool)

(assert (=> b!821434 m!763231))

(declare-fun m!763233 () Bool)

(assert (=> b!821435 m!763233))

(declare-fun m!763235 () Bool)

(assert (=> b!821435 m!763235))

(declare-fun m!763237 () Bool)

(assert (=> b!821435 m!763237))

(declare-fun m!763239 () Bool)

(assert (=> start!70720 m!763239))

(declare-fun m!763241 () Bool)

(assert (=> start!70720 m!763241))

(declare-fun m!763243 () Bool)

(assert (=> start!70720 m!763243))

(declare-fun m!763245 () Bool)

(assert (=> b!821436 m!763245))

(declare-fun m!763247 () Bool)

(assert (=> b!821437 m!763247))

(check-sat (not b!821435) (not b!821436) b_and!21855 tp_is_empty!14703 (not b!821434) (not start!70720) (not b!821437) (not mapNonEmpty!23662) (not b_next!12993))
(check-sat b_and!21855 (not b_next!12993))
