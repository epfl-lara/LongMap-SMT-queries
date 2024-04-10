; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70452 () Bool)

(assert start!70452)

(declare-fun b_free!12795 () Bool)

(declare-fun b_next!12795 () Bool)

(assert (=> start!70452 (= b_free!12795 (not b_next!12795))))

(declare-fun tp!45114 () Bool)

(declare-fun b_and!21615 () Bool)

(assert (=> start!70452 (= tp!45114 b_and!21615)))

(declare-fun b!818355 () Bool)

(declare-fun res!558518 () Bool)

(declare-fun e!454259 () Bool)

(assert (=> b!818355 (=> (not res!558518) (not e!454259))))

(declare-datatypes ((array!45210 0))(
  ( (array!45211 (arr!21660 (Array (_ BitVec 32) (_ BitVec 64))) (size!22081 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45210)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45210 (_ BitVec 32)) Bool)

(assert (=> b!818355 (= res!558518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818356 () Bool)

(declare-fun res!558517 () Bool)

(assert (=> b!818356 (=> (not res!558517) (not e!454259))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24341 0))(
  ( (V!24342 (val!7300 Int)) )
))
(declare-datatypes ((ValueCell!6837 0))(
  ( (ValueCellFull!6837 (v!9729 V!24341)) (EmptyCell!6837) )
))
(declare-datatypes ((array!45212 0))(
  ( (array!45213 (arr!21661 (Array (_ BitVec 32) ValueCell!6837)) (size!22082 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45212)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818356 (= res!558517 (and (= (size!22082 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22081 _keys!976) (size!22082 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818357 () Bool)

(declare-fun e!454264 () Bool)

(assert (=> b!818357 (= e!454264 true)))

(declare-fun zeroValueBefore!34 () V!24341)

(declare-datatypes ((tuple2!9596 0))(
  ( (tuple2!9597 (_1!4809 (_ BitVec 64)) (_2!4809 V!24341)) )
))
(declare-datatypes ((List!15428 0))(
  ( (Nil!15425) (Cons!15424 (h!16553 tuple2!9596) (t!21755 List!15428)) )
))
(declare-datatypes ((ListLongMap!8419 0))(
  ( (ListLongMap!8420 (toList!4225 List!15428)) )
))
(declare-fun lt!366687 () ListLongMap!8419)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24341)

(declare-fun getCurrentListMap!2430 (array!45210 array!45212 (_ BitVec 32) (_ BitVec 32) V!24341 V!24341 (_ BitVec 32) Int) ListLongMap!8419)

(assert (=> b!818357 (= lt!366687 (getCurrentListMap!2430 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818358 () Bool)

(declare-fun res!558514 () Bool)

(assert (=> b!818358 (=> (not res!558514) (not e!454259))))

(declare-datatypes ((List!15429 0))(
  ( (Nil!15426) (Cons!15425 (h!16554 (_ BitVec 64)) (t!21756 List!15429)) )
))
(declare-fun arrayNoDuplicates!0 (array!45210 (_ BitVec 32) List!15429) Bool)

(assert (=> b!818358 (= res!558514 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15426))))

(declare-fun b!818359 () Bool)

(assert (=> b!818359 (= e!454259 (not e!454264))))

(declare-fun res!558515 () Bool)

(assert (=> b!818359 (=> res!558515 e!454264)))

(assert (=> b!818359 (= res!558515 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366688 () ListLongMap!8419)

(declare-fun lt!366685 () ListLongMap!8419)

(assert (=> b!818359 (= lt!366688 lt!366685)))

(declare-fun zeroValueAfter!34 () V!24341)

(declare-datatypes ((Unit!27932 0))(
  ( (Unit!27933) )
))
(declare-fun lt!366686 () Unit!27932)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!375 (array!45210 array!45212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24341 V!24341 V!24341 V!24341 (_ BitVec 32) Int) Unit!27932)

(assert (=> b!818359 (= lt!366686 (lemmaNoChangeToArrayThenSameMapNoExtras!375 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2265 (array!45210 array!45212 (_ BitVec 32) (_ BitVec 32) V!24341 V!24341 (_ BitVec 32) Int) ListLongMap!8419)

(assert (=> b!818359 (= lt!366685 (getCurrentListMapNoExtraKeys!2265 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818359 (= lt!366688 (getCurrentListMapNoExtraKeys!2265 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818360 () Bool)

(declare-fun e!454262 () Bool)

(declare-fun e!454260 () Bool)

(declare-fun mapRes!23353 () Bool)

(assert (=> b!818360 (= e!454262 (and e!454260 mapRes!23353))))

(declare-fun condMapEmpty!23353 () Bool)

(declare-fun mapDefault!23353 () ValueCell!6837)

(assert (=> b!818360 (= condMapEmpty!23353 (= (arr!21661 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6837)) mapDefault!23353)))))

(declare-fun res!558516 () Bool)

(assert (=> start!70452 (=> (not res!558516) (not e!454259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70452 (= res!558516 (validMask!0 mask!1312))))

(assert (=> start!70452 e!454259))

(declare-fun tp_is_empty!14505 () Bool)

(assert (=> start!70452 tp_is_empty!14505))

(declare-fun array_inv!17323 (array!45210) Bool)

(assert (=> start!70452 (array_inv!17323 _keys!976)))

(assert (=> start!70452 true))

(declare-fun array_inv!17324 (array!45212) Bool)

(assert (=> start!70452 (and (array_inv!17324 _values!788) e!454262)))

(assert (=> start!70452 tp!45114))

(declare-fun mapIsEmpty!23353 () Bool)

(assert (=> mapIsEmpty!23353 mapRes!23353))

(declare-fun b!818361 () Bool)

(declare-fun e!454261 () Bool)

(assert (=> b!818361 (= e!454261 tp_is_empty!14505)))

(declare-fun b!818362 () Bool)

(assert (=> b!818362 (= e!454260 tp_is_empty!14505)))

(declare-fun mapNonEmpty!23353 () Bool)

(declare-fun tp!45115 () Bool)

(assert (=> mapNonEmpty!23353 (= mapRes!23353 (and tp!45115 e!454261))))

(declare-fun mapValue!23353 () ValueCell!6837)

(declare-fun mapKey!23353 () (_ BitVec 32))

(declare-fun mapRest!23353 () (Array (_ BitVec 32) ValueCell!6837))

(assert (=> mapNonEmpty!23353 (= (arr!21661 _values!788) (store mapRest!23353 mapKey!23353 mapValue!23353))))

(assert (= (and start!70452 res!558516) b!818356))

(assert (= (and b!818356 res!558517) b!818355))

(assert (= (and b!818355 res!558518) b!818358))

(assert (= (and b!818358 res!558514) b!818359))

(assert (= (and b!818359 (not res!558515)) b!818357))

(assert (= (and b!818360 condMapEmpty!23353) mapIsEmpty!23353))

(assert (= (and b!818360 (not condMapEmpty!23353)) mapNonEmpty!23353))

(get-info :version)

(assert (= (and mapNonEmpty!23353 ((_ is ValueCellFull!6837) mapValue!23353)) b!818361))

(assert (= (and b!818360 ((_ is ValueCellFull!6837) mapDefault!23353)) b!818362))

(assert (= start!70452 b!818360))

(declare-fun m!759785 () Bool)

(assert (=> b!818355 m!759785))

(declare-fun m!759787 () Bool)

(assert (=> b!818357 m!759787))

(declare-fun m!759789 () Bool)

(assert (=> b!818359 m!759789))

(declare-fun m!759791 () Bool)

(assert (=> b!818359 m!759791))

(declare-fun m!759793 () Bool)

(assert (=> b!818359 m!759793))

(declare-fun m!759795 () Bool)

(assert (=> mapNonEmpty!23353 m!759795))

(declare-fun m!759797 () Bool)

(assert (=> b!818358 m!759797))

(declare-fun m!759799 () Bool)

(assert (=> start!70452 m!759799))

(declare-fun m!759801 () Bool)

(assert (=> start!70452 m!759801))

(declare-fun m!759803 () Bool)

(assert (=> start!70452 m!759803))

(check-sat (not b!818358) b_and!21615 (not b!818357) (not b!818359) (not mapNonEmpty!23353) (not b_next!12795) (not start!70452) (not b!818355) tp_is_empty!14505)
(check-sat b_and!21615 (not b_next!12795))
