; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70726 () Bool)

(assert start!70726)

(declare-fun b_free!12999 () Bool)

(declare-fun b_next!12999 () Bool)

(assert (=> start!70726 (= b_free!12999 (not b_next!12999))))

(declare-fun tp!45738 () Bool)

(declare-fun b_and!21861 () Bool)

(assert (=> start!70726 (= tp!45738 b_and!21861)))

(declare-fun b!821505 () Bool)

(declare-fun e!456576 () Bool)

(declare-fun e!456574 () Bool)

(assert (=> b!821505 (= e!456576 (not e!456574))))

(declare-fun res!560398 () Bool)

(assert (=> b!821505 (=> res!560398 e!456574)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821505 (= res!560398 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24613 0))(
  ( (V!24614 (val!7402 Int)) )
))
(declare-datatypes ((tuple2!9766 0))(
  ( (tuple2!9767 (_1!4894 (_ BitVec 64)) (_2!4894 V!24613)) )
))
(declare-datatypes ((List!15584 0))(
  ( (Nil!15581) (Cons!15580 (h!16709 tuple2!9766) (t!21919 List!15584)) )
))
(declare-datatypes ((ListLongMap!8589 0))(
  ( (ListLongMap!8590 (toList!4310 List!15584)) )
))
(declare-fun lt!369257 () ListLongMap!8589)

(declare-fun lt!369256 () ListLongMap!8589)

(assert (=> b!821505 (= lt!369257 lt!369256)))

(declare-fun zeroValueBefore!34 () V!24613)

(declare-datatypes ((array!45614 0))(
  ( (array!45615 (arr!21858 (Array (_ BitVec 32) (_ BitVec 64))) (size!22279 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45614)

(declare-fun zeroValueAfter!34 () V!24613)

(declare-datatypes ((ValueCell!6939 0))(
  ( (ValueCellFull!6939 (v!9833 V!24613)) (EmptyCell!6939) )
))
(declare-datatypes ((array!45616 0))(
  ( (array!45617 (arr!21859 (Array (_ BitVec 32) ValueCell!6939)) (size!22280 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45616)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24613)

(declare-datatypes ((Unit!28093 0))(
  ( (Unit!28094) )
))
(declare-fun lt!369255 () Unit!28093)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!444 (array!45614 array!45616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24613 V!24613 V!24613 V!24613 (_ BitVec 32) Int) Unit!28093)

(assert (=> b!821505 (= lt!369255 (lemmaNoChangeToArrayThenSameMapNoExtras!444 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2334 (array!45614 array!45616 (_ BitVec 32) (_ BitVec 32) V!24613 V!24613 (_ BitVec 32) Int) ListLongMap!8589)

(assert (=> b!821505 (= lt!369256 (getCurrentListMapNoExtraKeys!2334 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821505 (= lt!369257 (getCurrentListMapNoExtraKeys!2334 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23671 () Bool)

(declare-fun mapRes!23671 () Bool)

(assert (=> mapIsEmpty!23671 mapRes!23671))

(declare-fun mapNonEmpty!23671 () Bool)

(declare-fun tp!45739 () Bool)

(declare-fun e!456577 () Bool)

(assert (=> mapNonEmpty!23671 (= mapRes!23671 (and tp!45739 e!456577))))

(declare-fun mapValue!23671 () ValueCell!6939)

(declare-fun mapRest!23671 () (Array (_ BitVec 32) ValueCell!6939))

(declare-fun mapKey!23671 () (_ BitVec 32))

(assert (=> mapNonEmpty!23671 (= (arr!21859 _values!788) (store mapRest!23671 mapKey!23671 mapValue!23671))))

(declare-fun b!821506 () Bool)

(declare-fun e!456578 () Bool)

(declare-fun tp_is_empty!14709 () Bool)

(assert (=> b!821506 (= e!456578 tp_is_empty!14709)))

(declare-fun b!821507 () Bool)

(assert (=> b!821507 (= e!456574 true)))

(declare-fun lt!369254 () ListLongMap!8589)

(declare-fun getCurrentListMap!2479 (array!45614 array!45616 (_ BitVec 32) (_ BitVec 32) V!24613 V!24613 (_ BitVec 32) Int) ListLongMap!8589)

(assert (=> b!821507 (= lt!369254 (getCurrentListMap!2479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821508 () Bool)

(declare-fun res!560401 () Bool)

(assert (=> b!821508 (=> (not res!560401) (not e!456576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45614 (_ BitVec 32)) Bool)

(assert (=> b!821508 (= res!560401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821509 () Bool)

(declare-fun res!560399 () Bool)

(assert (=> b!821509 (=> (not res!560399) (not e!456576))))

(declare-datatypes ((List!15585 0))(
  ( (Nil!15582) (Cons!15581 (h!16710 (_ BitVec 64)) (t!21920 List!15585)) )
))
(declare-fun arrayNoDuplicates!0 (array!45614 (_ BitVec 32) List!15585) Bool)

(assert (=> b!821509 (= res!560399 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15582))))

(declare-fun b!821510 () Bool)

(assert (=> b!821510 (= e!456577 tp_is_empty!14709)))

(declare-fun res!560402 () Bool)

(assert (=> start!70726 (=> (not res!560402) (not e!456576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70726 (= res!560402 (validMask!0 mask!1312))))

(assert (=> start!70726 e!456576))

(assert (=> start!70726 tp_is_empty!14709))

(declare-fun array_inv!17465 (array!45614) Bool)

(assert (=> start!70726 (array_inv!17465 _keys!976)))

(assert (=> start!70726 true))

(declare-fun e!456573 () Bool)

(declare-fun array_inv!17466 (array!45616) Bool)

(assert (=> start!70726 (and (array_inv!17466 _values!788) e!456573)))

(assert (=> start!70726 tp!45738))

(declare-fun b!821511 () Bool)

(assert (=> b!821511 (= e!456573 (and e!456578 mapRes!23671))))

(declare-fun condMapEmpty!23671 () Bool)

(declare-fun mapDefault!23671 () ValueCell!6939)

(assert (=> b!821511 (= condMapEmpty!23671 (= (arr!21859 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6939)) mapDefault!23671)))))

(declare-fun b!821512 () Bool)

(declare-fun res!560400 () Bool)

(assert (=> b!821512 (=> (not res!560400) (not e!456576))))

(assert (=> b!821512 (= res!560400 (and (= (size!22280 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22279 _keys!976) (size!22280 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70726 res!560402) b!821512))

(assert (= (and b!821512 res!560400) b!821508))

(assert (= (and b!821508 res!560401) b!821509))

(assert (= (and b!821509 res!560399) b!821505))

(assert (= (and b!821505 (not res!560398)) b!821507))

(assert (= (and b!821511 condMapEmpty!23671) mapIsEmpty!23671))

(assert (= (and b!821511 (not condMapEmpty!23671)) mapNonEmpty!23671))

(get-info :version)

(assert (= (and mapNonEmpty!23671 ((_ is ValueCellFull!6939) mapValue!23671)) b!821510))

(assert (= (and b!821511 ((_ is ValueCellFull!6939) mapDefault!23671)) b!821506))

(assert (= start!70726 b!821511))

(declare-fun m!763289 () Bool)

(assert (=> start!70726 m!763289))

(declare-fun m!763291 () Bool)

(assert (=> start!70726 m!763291))

(declare-fun m!763293 () Bool)

(assert (=> start!70726 m!763293))

(declare-fun m!763295 () Bool)

(assert (=> b!821507 m!763295))

(declare-fun m!763297 () Bool)

(assert (=> b!821509 m!763297))

(declare-fun m!763299 () Bool)

(assert (=> mapNonEmpty!23671 m!763299))

(declare-fun m!763301 () Bool)

(assert (=> b!821508 m!763301))

(declare-fun m!763303 () Bool)

(assert (=> b!821505 m!763303))

(declare-fun m!763305 () Bool)

(assert (=> b!821505 m!763305))

(declare-fun m!763307 () Bool)

(assert (=> b!821505 m!763307))

(check-sat (not b_next!12999) (not b!821508) (not b!821509) (not mapNonEmpty!23671) (not b!821507) (not b!821505) b_and!21861 tp_is_empty!14709 (not start!70726))
(check-sat b_and!21861 (not b_next!12999))
