; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70828 () Bool)

(assert start!70828)

(declare-fun b_free!12949 () Bool)

(declare-fun b_next!12949 () Bool)

(assert (=> start!70828 (= b_free!12949 (not b_next!12949))))

(declare-fun tp!45585 () Bool)

(declare-fun b_and!21813 () Bool)

(assert (=> start!70828 (= tp!45585 b_and!21813)))

(declare-fun b!821739 () Bool)

(declare-fun res!560366 () Bool)

(declare-fun e!456674 () Bool)

(assert (=> b!821739 (=> (not res!560366) (not e!456674))))

(declare-datatypes ((array!45517 0))(
  ( (array!45518 (arr!21806 (Array (_ BitVec 32) (_ BitVec 64))) (size!22226 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45517)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24547 0))(
  ( (V!24548 (val!7377 Int)) )
))
(declare-datatypes ((ValueCell!6914 0))(
  ( (ValueCellFull!6914 (v!9808 V!24547)) (EmptyCell!6914) )
))
(declare-datatypes ((array!45519 0))(
  ( (array!45520 (arr!21807 (Array (_ BitVec 32) ValueCell!6914)) (size!22227 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45519)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821739 (= res!560366 (and (= (size!22227 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22226 _keys!976) (size!22227 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23593 () Bool)

(declare-fun mapRes!23593 () Bool)

(declare-fun tp!45586 () Bool)

(declare-fun e!456673 () Bool)

(assert (=> mapNonEmpty!23593 (= mapRes!23593 (and tp!45586 e!456673))))

(declare-fun mapKey!23593 () (_ BitVec 32))

(declare-fun mapValue!23593 () ValueCell!6914)

(declare-fun mapRest!23593 () (Array (_ BitVec 32) ValueCell!6914))

(assert (=> mapNonEmpty!23593 (= (arr!21807 _values!788) (store mapRest!23593 mapKey!23593 mapValue!23593))))

(declare-fun b!821740 () Bool)

(declare-fun tp_is_empty!14659 () Bool)

(assert (=> b!821740 (= e!456673 tp_is_empty!14659)))

(declare-fun b!821742 () Bool)

(assert (=> b!821742 (= e!456674 (not true))))

(declare-datatypes ((tuple2!9638 0))(
  ( (tuple2!9639 (_1!4830 (_ BitVec 64)) (_2!4830 V!24547)) )
))
(declare-datatypes ((List!15434 0))(
  ( (Nil!15431) (Cons!15430 (h!16565 tuple2!9638) (t!21759 List!15434)) )
))
(declare-datatypes ((ListLongMap!8463 0))(
  ( (ListLongMap!8464 (toList!4247 List!15434)) )
))
(declare-fun lt!369294 () ListLongMap!8463)

(declare-fun lt!369295 () ListLongMap!8463)

(assert (=> b!821742 (= lt!369294 lt!369295)))

(declare-fun zeroValueBefore!34 () V!24547)

(declare-fun zeroValueAfter!34 () V!24547)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28046 0))(
  ( (Unit!28047) )
))
(declare-fun lt!369293 () Unit!28046)

(declare-fun minValue!754 () V!24547)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!426 (array!45517 array!45519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24547 V!24547 V!24547 V!24547 (_ BitVec 32) Int) Unit!28046)

(assert (=> b!821742 (= lt!369293 (lemmaNoChangeToArrayThenSameMapNoExtras!426 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2338 (array!45517 array!45519 (_ BitVec 32) (_ BitVec 32) V!24547 V!24547 (_ BitVec 32) Int) ListLongMap!8463)

(assert (=> b!821742 (= lt!369295 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821742 (= lt!369294 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821743 () Bool)

(declare-fun res!560365 () Bool)

(assert (=> b!821743 (=> (not res!560365) (not e!456674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45517 (_ BitVec 32)) Bool)

(assert (=> b!821743 (= res!560365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821744 () Bool)

(declare-fun res!560364 () Bool)

(assert (=> b!821744 (=> (not res!560364) (not e!456674))))

(declare-datatypes ((List!15435 0))(
  ( (Nil!15432) (Cons!15431 (h!16566 (_ BitVec 64)) (t!21760 List!15435)) )
))
(declare-fun arrayNoDuplicates!0 (array!45517 (_ BitVec 32) List!15435) Bool)

(assert (=> b!821744 (= res!560364 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15432))))

(declare-fun res!560363 () Bool)

(assert (=> start!70828 (=> (not res!560363) (not e!456674))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70828 (= res!560363 (validMask!0 mask!1312))))

(assert (=> start!70828 e!456674))

(assert (=> start!70828 tp_is_empty!14659))

(declare-fun array_inv!17457 (array!45517) Bool)

(assert (=> start!70828 (array_inv!17457 _keys!976)))

(assert (=> start!70828 true))

(declare-fun e!456675 () Bool)

(declare-fun array_inv!17458 (array!45519) Bool)

(assert (=> start!70828 (and (array_inv!17458 _values!788) e!456675)))

(assert (=> start!70828 tp!45585))

(declare-fun b!821741 () Bool)

(declare-fun e!456672 () Bool)

(assert (=> b!821741 (= e!456675 (and e!456672 mapRes!23593))))

(declare-fun condMapEmpty!23593 () Bool)

(declare-fun mapDefault!23593 () ValueCell!6914)

(assert (=> b!821741 (= condMapEmpty!23593 (= (arr!21807 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6914)) mapDefault!23593)))))

(declare-fun mapIsEmpty!23593 () Bool)

(assert (=> mapIsEmpty!23593 mapRes!23593))

(declare-fun b!821745 () Bool)

(assert (=> b!821745 (= e!456672 tp_is_empty!14659)))

(assert (= (and start!70828 res!560363) b!821739))

(assert (= (and b!821739 res!560366) b!821743))

(assert (= (and b!821743 res!560365) b!821744))

(assert (= (and b!821744 res!560364) b!821742))

(assert (= (and b!821741 condMapEmpty!23593) mapIsEmpty!23593))

(assert (= (and b!821741 (not condMapEmpty!23593)) mapNonEmpty!23593))

(get-info :version)

(assert (= (and mapNonEmpty!23593 ((_ is ValueCellFull!6914) mapValue!23593)) b!821740))

(assert (= (and b!821741 ((_ is ValueCellFull!6914) mapDefault!23593)) b!821745))

(assert (= start!70828 b!821741))

(declare-fun m!764023 () Bool)

(assert (=> b!821743 m!764023))

(declare-fun m!764025 () Bool)

(assert (=> b!821742 m!764025))

(declare-fun m!764027 () Bool)

(assert (=> b!821742 m!764027))

(declare-fun m!764029 () Bool)

(assert (=> b!821742 m!764029))

(declare-fun m!764031 () Bool)

(assert (=> b!821744 m!764031))

(declare-fun m!764033 () Bool)

(assert (=> start!70828 m!764033))

(declare-fun m!764035 () Bool)

(assert (=> start!70828 m!764035))

(declare-fun m!764037 () Bool)

(assert (=> start!70828 m!764037))

(declare-fun m!764039 () Bool)

(assert (=> mapNonEmpty!23593 m!764039))

(check-sat (not b_next!12949) (not start!70828) (not mapNonEmpty!23593) tp_is_empty!14659 (not b!821744) (not b!821742) (not b!821743) b_and!21813)
(check-sat b_and!21813 (not b_next!12949))
