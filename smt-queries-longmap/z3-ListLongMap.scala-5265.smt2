; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70704 () Bool)

(assert start!70704)

(declare-fun b_free!12997 () Bool)

(declare-fun b_next!12997 () Bool)

(assert (=> start!70704 (= b_free!12997 (not b_next!12997))))

(declare-fun tp!45733 () Bool)

(declare-fun b_and!21833 () Bool)

(assert (=> start!70704 (= tp!45733 b_and!21833)))

(declare-fun b!821235 () Bool)

(declare-fun res!560281 () Bool)

(declare-fun e!456406 () Bool)

(assert (=> b!821235 (=> (not res!560281) (not e!456406))))

(declare-datatypes ((array!45579 0))(
  ( (array!45580 (arr!21841 (Array (_ BitVec 32) (_ BitVec 64))) (size!22262 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45579)

(declare-datatypes ((List!15586 0))(
  ( (Nil!15583) (Cons!15582 (h!16711 (_ BitVec 64)) (t!21912 List!15586)) )
))
(declare-fun arrayNoDuplicates!0 (array!45579 (_ BitVec 32) List!15586) Bool)

(assert (=> b!821235 (= res!560281 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15583))))

(declare-fun b!821236 () Bool)

(declare-fun e!456409 () Bool)

(declare-fun e!456410 () Bool)

(declare-fun mapRes!23668 () Bool)

(assert (=> b!821236 (= e!456409 (and e!456410 mapRes!23668))))

(declare-fun condMapEmpty!23668 () Bool)

(declare-datatypes ((V!24611 0))(
  ( (V!24612 (val!7401 Int)) )
))
(declare-datatypes ((ValueCell!6938 0))(
  ( (ValueCellFull!6938 (v!9826 V!24611)) (EmptyCell!6938) )
))
(declare-datatypes ((array!45581 0))(
  ( (array!45582 (arr!21842 (Array (_ BitVec 32) ValueCell!6938)) (size!22263 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45581)

(declare-fun mapDefault!23668 () ValueCell!6938)

(assert (=> b!821236 (= condMapEmpty!23668 (= (arr!21842 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6938)) mapDefault!23668)))))

(declare-fun b!821237 () Bool)

(declare-fun e!456408 () Bool)

(declare-fun tp_is_empty!14707 () Bool)

(assert (=> b!821237 (= e!456408 tp_is_empty!14707)))

(declare-fun mapIsEmpty!23668 () Bool)

(assert (=> mapIsEmpty!23668 mapRes!23668))

(declare-fun b!821238 () Bool)

(declare-fun e!456405 () Bool)

(assert (=> b!821238 (= e!456406 (not e!456405))))

(declare-fun res!560278 () Bool)

(assert (=> b!821238 (=> res!560278 e!456405)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821238 (= res!560278 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9776 0))(
  ( (tuple2!9777 (_1!4899 (_ BitVec 64)) (_2!4899 V!24611)) )
))
(declare-datatypes ((List!15587 0))(
  ( (Nil!15584) (Cons!15583 (h!16712 tuple2!9776) (t!21913 List!15587)) )
))
(declare-datatypes ((ListLongMap!8589 0))(
  ( (ListLongMap!8590 (toList!4310 List!15587)) )
))
(declare-fun lt!369000 () ListLongMap!8589)

(declare-fun lt!369002 () ListLongMap!8589)

(assert (=> b!821238 (= lt!369000 lt!369002)))

(declare-fun zeroValueAfter!34 () V!24611)

(declare-fun minValue!754 () V!24611)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28041 0))(
  ( (Unit!28042) )
))
(declare-fun lt!368999 () Unit!28041)

(declare-fun zeroValueBefore!34 () V!24611)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!451 (array!45579 array!45581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24611 V!24611 V!24611 V!24611 (_ BitVec 32) Int) Unit!28041)

(assert (=> b!821238 (= lt!368999 (lemmaNoChangeToArrayThenSameMapNoExtras!451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2358 (array!45579 array!45581 (_ BitVec 32) (_ BitVec 32) V!24611 V!24611 (_ BitVec 32) Int) ListLongMap!8589)

(assert (=> b!821238 (= lt!369002 (getCurrentListMapNoExtraKeys!2358 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821238 (= lt!369000 (getCurrentListMapNoExtraKeys!2358 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821240 () Bool)

(assert (=> b!821240 (= e!456410 tp_is_empty!14707)))

(declare-fun b!821241 () Bool)

(assert (=> b!821241 (= e!456405 true)))

(declare-fun lt!369001 () ListLongMap!8589)

(declare-fun getCurrentListMap!2437 (array!45579 array!45581 (_ BitVec 32) (_ BitVec 32) V!24611 V!24611 (_ BitVec 32) Int) ListLongMap!8589)

(assert (=> b!821241 (= lt!369001 (getCurrentListMap!2437 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23668 () Bool)

(declare-fun tp!45732 () Bool)

(assert (=> mapNonEmpty!23668 (= mapRes!23668 (and tp!45732 e!456408))))

(declare-fun mapKey!23668 () (_ BitVec 32))

(declare-fun mapRest!23668 () (Array (_ BitVec 32) ValueCell!6938))

(declare-fun mapValue!23668 () ValueCell!6938)

(assert (=> mapNonEmpty!23668 (= (arr!21842 _values!788) (store mapRest!23668 mapKey!23668 mapValue!23668))))

(declare-fun b!821242 () Bool)

(declare-fun res!560277 () Bool)

(assert (=> b!821242 (=> (not res!560277) (not e!456406))))

(assert (=> b!821242 (= res!560277 (and (= (size!22263 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22262 _keys!976) (size!22263 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!560279 () Bool)

(assert (=> start!70704 (=> (not res!560279) (not e!456406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70704 (= res!560279 (validMask!0 mask!1312))))

(assert (=> start!70704 e!456406))

(assert (=> start!70704 tp_is_empty!14707))

(declare-fun array_inv!17523 (array!45579) Bool)

(assert (=> start!70704 (array_inv!17523 _keys!976)))

(assert (=> start!70704 true))

(declare-fun array_inv!17524 (array!45581) Bool)

(assert (=> start!70704 (and (array_inv!17524 _values!788) e!456409)))

(assert (=> start!70704 tp!45733))

(declare-fun b!821239 () Bool)

(declare-fun res!560280 () Bool)

(assert (=> b!821239 (=> (not res!560280) (not e!456406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45579 (_ BitVec 32)) Bool)

(assert (=> b!821239 (= res!560280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70704 res!560279) b!821242))

(assert (= (and b!821242 res!560277) b!821239))

(assert (= (and b!821239 res!560280) b!821235))

(assert (= (and b!821235 res!560281) b!821238))

(assert (= (and b!821238 (not res!560278)) b!821241))

(assert (= (and b!821236 condMapEmpty!23668) mapIsEmpty!23668))

(assert (= (and b!821236 (not condMapEmpty!23668)) mapNonEmpty!23668))

(get-info :version)

(assert (= (and mapNonEmpty!23668 ((_ is ValueCellFull!6938) mapValue!23668)) b!821237))

(assert (= (and b!821236 ((_ is ValueCellFull!6938) mapDefault!23668)) b!821240))

(assert (= start!70704 b!821236))

(declare-fun m!762517 () Bool)

(assert (=> b!821241 m!762517))

(declare-fun m!762519 () Bool)

(assert (=> b!821238 m!762519))

(declare-fun m!762521 () Bool)

(assert (=> b!821238 m!762521))

(declare-fun m!762523 () Bool)

(assert (=> b!821238 m!762523))

(declare-fun m!762525 () Bool)

(assert (=> b!821239 m!762525))

(declare-fun m!762527 () Bool)

(assert (=> b!821235 m!762527))

(declare-fun m!762529 () Bool)

(assert (=> start!70704 m!762529))

(declare-fun m!762531 () Bool)

(assert (=> start!70704 m!762531))

(declare-fun m!762533 () Bool)

(assert (=> start!70704 m!762533))

(declare-fun m!762535 () Bool)

(assert (=> mapNonEmpty!23668 m!762535))

(check-sat (not b_next!12997) (not b!821241) b_and!21833 (not mapNonEmpty!23668) (not b!821235) tp_is_empty!14707 (not start!70704) (not b!821238) (not b!821239))
(check-sat b_and!21833 (not b_next!12997))
