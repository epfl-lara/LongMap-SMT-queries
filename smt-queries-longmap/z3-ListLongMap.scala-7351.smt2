; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94046 () Bool)

(assert start!94046)

(declare-fun b_free!21283 () Bool)

(declare-fun b_next!21283 () Bool)

(assert (=> start!94046 (= b_free!21283 (not b_next!21283))))

(declare-fun tp!75271 () Bool)

(declare-fun b_and!34007 () Bool)

(assert (=> start!94046 (= tp!75271 b_and!34007)))

(declare-fun mapIsEmpty!39310 () Bool)

(declare-fun mapRes!39310 () Bool)

(assert (=> mapIsEmpty!39310 mapRes!39310))

(declare-fun b!1062360 () Bool)

(declare-fun res!709112 () Bool)

(declare-fun e!605013 () Bool)

(assert (=> b!1062360 (=> (not res!709112) (not e!605013))))

(declare-datatypes ((array!67243 0))(
  ( (array!67244 (arr!32323 (Array (_ BitVec 32) (_ BitVec 64))) (size!32860 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67243)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67243 (_ BitVec 32)) Bool)

(assert (=> b!1062360 (= res!709112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062361 () Bool)

(assert (=> b!1062361 (= e!605013 false)))

(declare-datatypes ((V!38593 0))(
  ( (V!38594 (val!12597 Int)) )
))
(declare-datatypes ((tuple2!15910 0))(
  ( (tuple2!15911 (_1!7966 (_ BitVec 64)) (_2!7966 V!38593)) )
))
(declare-datatypes ((List!22494 0))(
  ( (Nil!22491) (Cons!22490 (h!23708 tuple2!15910) (t!31795 List!22494)) )
))
(declare-datatypes ((ListLongMap!13887 0))(
  ( (ListLongMap!13888 (toList!6959 List!22494)) )
))
(declare-fun lt!467963 () ListLongMap!13887)

(declare-datatypes ((ValueCell!11843 0))(
  ( (ValueCellFull!11843 (v!15203 V!38593)) (EmptyCell!11843) )
))
(declare-datatypes ((array!67245 0))(
  ( (array!67246 (arr!32324 (Array (_ BitVec 32) ValueCell!11843)) (size!32861 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67245)

(declare-fun minValue!907 () V!38593)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38593)

(declare-fun getCurrentListMapNoExtraKeys!3607 (array!67243 array!67245 (_ BitVec 32) (_ BitVec 32) V!38593 V!38593 (_ BitVec 32) Int) ListLongMap!13887)

(assert (=> b!1062361 (= lt!467963 (getCurrentListMapNoExtraKeys!3607 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38593)

(declare-fun lt!467964 () ListLongMap!13887)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062361 (= lt!467964 (getCurrentListMapNoExtraKeys!3607 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062362 () Bool)

(declare-fun res!709111 () Bool)

(assert (=> b!1062362 (=> (not res!709111) (not e!605013))))

(assert (=> b!1062362 (= res!709111 (and (= (size!32861 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32860 _keys!1163) (size!32861 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39310 () Bool)

(declare-fun tp!75272 () Bool)

(declare-fun e!605009 () Bool)

(assert (=> mapNonEmpty!39310 (= mapRes!39310 (and tp!75272 e!605009))))

(declare-fun mapKey!39310 () (_ BitVec 32))

(declare-fun mapRest!39310 () (Array (_ BitVec 32) ValueCell!11843))

(declare-fun mapValue!39310 () ValueCell!11843)

(assert (=> mapNonEmpty!39310 (= (arr!32324 _values!955) (store mapRest!39310 mapKey!39310 mapValue!39310))))

(declare-fun b!1062363 () Bool)

(declare-fun e!605011 () Bool)

(declare-fun e!605012 () Bool)

(assert (=> b!1062363 (= e!605011 (and e!605012 mapRes!39310))))

(declare-fun condMapEmpty!39310 () Bool)

(declare-fun mapDefault!39310 () ValueCell!11843)

(assert (=> b!1062363 (= condMapEmpty!39310 (= (arr!32324 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11843)) mapDefault!39310)))))

(declare-fun b!1062364 () Bool)

(declare-fun tp_is_empty!25093 () Bool)

(assert (=> b!1062364 (= e!605012 tp_is_empty!25093)))

(declare-fun res!709114 () Bool)

(assert (=> start!94046 (=> (not res!709114) (not e!605013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94046 (= res!709114 (validMask!0 mask!1515))))

(assert (=> start!94046 e!605013))

(assert (=> start!94046 true))

(assert (=> start!94046 tp_is_empty!25093))

(declare-fun array_inv!25060 (array!67245) Bool)

(assert (=> start!94046 (and (array_inv!25060 _values!955) e!605011)))

(assert (=> start!94046 tp!75271))

(declare-fun array_inv!25061 (array!67243) Bool)

(assert (=> start!94046 (array_inv!25061 _keys!1163)))

(declare-fun b!1062365 () Bool)

(assert (=> b!1062365 (= e!605009 tp_is_empty!25093)))

(declare-fun b!1062366 () Bool)

(declare-fun res!709113 () Bool)

(assert (=> b!1062366 (=> (not res!709113) (not e!605013))))

(declare-datatypes ((List!22495 0))(
  ( (Nil!22492) (Cons!22491 (h!23709 (_ BitVec 64)) (t!31796 List!22495)) )
))
(declare-fun arrayNoDuplicates!0 (array!67243 (_ BitVec 32) List!22495) Bool)

(assert (=> b!1062366 (= res!709113 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22492))))

(assert (= (and start!94046 res!709114) b!1062362))

(assert (= (and b!1062362 res!709111) b!1062360))

(assert (= (and b!1062360 res!709112) b!1062366))

(assert (= (and b!1062366 res!709113) b!1062361))

(assert (= (and b!1062363 condMapEmpty!39310) mapIsEmpty!39310))

(assert (= (and b!1062363 (not condMapEmpty!39310)) mapNonEmpty!39310))

(get-info :version)

(assert (= (and mapNonEmpty!39310 ((_ is ValueCellFull!11843) mapValue!39310)) b!1062365))

(assert (= (and b!1062363 ((_ is ValueCellFull!11843) mapDefault!39310)) b!1062364))

(assert (= start!94046 b!1062363))

(declare-fun m!981631 () Bool)

(assert (=> b!1062361 m!981631))

(declare-fun m!981633 () Bool)

(assert (=> b!1062361 m!981633))

(declare-fun m!981635 () Bool)

(assert (=> b!1062366 m!981635))

(declare-fun m!981637 () Bool)

(assert (=> b!1062360 m!981637))

(declare-fun m!981639 () Bool)

(assert (=> mapNonEmpty!39310 m!981639))

(declare-fun m!981641 () Bool)

(assert (=> start!94046 m!981641))

(declare-fun m!981643 () Bool)

(assert (=> start!94046 m!981643))

(declare-fun m!981645 () Bool)

(assert (=> start!94046 m!981645))

(check-sat tp_is_empty!25093 (not b!1062366) (not b!1062361) (not b!1062360) (not start!94046) b_and!34007 (not b_next!21283) (not mapNonEmpty!39310))
(check-sat b_and!34007 (not b_next!21283))
