; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70804 () Bool)

(assert start!70804)

(declare-fun b_free!12925 () Bool)

(declare-fun b_next!12925 () Bool)

(assert (=> start!70804 (= b_free!12925 (not b_next!12925))))

(declare-fun tp!45513 () Bool)

(declare-fun b_and!21789 () Bool)

(assert (=> start!70804 (= tp!45513 b_and!21789)))

(declare-fun b!821487 () Bool)

(declare-fun e!456491 () Bool)

(declare-fun tp_is_empty!14635 () Bool)

(assert (=> b!821487 (= e!456491 tp_is_empty!14635)))

(declare-fun mapNonEmpty!23557 () Bool)

(declare-fun mapRes!23557 () Bool)

(declare-fun tp!45514 () Bool)

(declare-fun e!456495 () Bool)

(assert (=> mapNonEmpty!23557 (= mapRes!23557 (and tp!45514 e!456495))))

(declare-datatypes ((V!24515 0))(
  ( (V!24516 (val!7365 Int)) )
))
(declare-datatypes ((ValueCell!6902 0))(
  ( (ValueCellFull!6902 (v!9796 V!24515)) (EmptyCell!6902) )
))
(declare-datatypes ((array!45469 0))(
  ( (array!45470 (arr!21782 (Array (_ BitVec 32) ValueCell!6902)) (size!22202 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45469)

(declare-fun mapKey!23557 () (_ BitVec 32))

(declare-fun mapValue!23557 () ValueCell!6902)

(declare-fun mapRest!23557 () (Array (_ BitVec 32) ValueCell!6902))

(assert (=> mapNonEmpty!23557 (= (arr!21782 _values!788) (store mapRest!23557 mapKey!23557 mapValue!23557))))

(declare-fun mapIsEmpty!23557 () Bool)

(assert (=> mapIsEmpty!23557 mapRes!23557))

(declare-fun b!821488 () Bool)

(declare-fun e!456494 () Bool)

(assert (=> b!821488 (= e!456494 (not true))))

(declare-datatypes ((tuple2!9618 0))(
  ( (tuple2!9619 (_1!4820 (_ BitVec 64)) (_2!4820 V!24515)) )
))
(declare-datatypes ((List!15415 0))(
  ( (Nil!15412) (Cons!15411 (h!16546 tuple2!9618) (t!21740 List!15415)) )
))
(declare-datatypes ((ListLongMap!8443 0))(
  ( (ListLongMap!8444 (toList!4237 List!15415)) )
))
(declare-fun lt!369186 () ListLongMap!8443)

(declare-fun lt!369185 () ListLongMap!8443)

(assert (=> b!821488 (= lt!369186 lt!369185)))

(declare-fun zeroValueBefore!34 () V!24515)

(declare-datatypes ((Unit!28026 0))(
  ( (Unit!28027) )
))
(declare-fun lt!369187 () Unit!28026)

(declare-datatypes ((array!45471 0))(
  ( (array!45472 (arr!21783 (Array (_ BitVec 32) (_ BitVec 64))) (size!22203 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45471)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24515)

(declare-fun minValue!754 () V!24515)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!416 (array!45471 array!45469 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24515 V!24515 V!24515 V!24515 (_ BitVec 32) Int) Unit!28026)

(assert (=> b!821488 (= lt!369187 (lemmaNoChangeToArrayThenSameMapNoExtras!416 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2328 (array!45471 array!45469 (_ BitVec 32) (_ BitVec 32) V!24515 V!24515 (_ BitVec 32) Int) ListLongMap!8443)

(assert (=> b!821488 (= lt!369185 (getCurrentListMapNoExtraKeys!2328 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821488 (= lt!369186 (getCurrentListMapNoExtraKeys!2328 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560221 () Bool)

(assert (=> start!70804 (=> (not res!560221) (not e!456494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70804 (= res!560221 (validMask!0 mask!1312))))

(assert (=> start!70804 e!456494))

(assert (=> start!70804 tp_is_empty!14635))

(declare-fun array_inv!17439 (array!45471) Bool)

(assert (=> start!70804 (array_inv!17439 _keys!976)))

(assert (=> start!70804 true))

(declare-fun e!456493 () Bool)

(declare-fun array_inv!17440 (array!45469) Bool)

(assert (=> start!70804 (and (array_inv!17440 _values!788) e!456493)))

(assert (=> start!70804 tp!45513))

(declare-fun b!821489 () Bool)

(assert (=> b!821489 (= e!456493 (and e!456491 mapRes!23557))))

(declare-fun condMapEmpty!23557 () Bool)

(declare-fun mapDefault!23557 () ValueCell!6902)

(assert (=> b!821489 (= condMapEmpty!23557 (= (arr!21782 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6902)) mapDefault!23557)))))

(declare-fun b!821490 () Bool)

(declare-fun res!560219 () Bool)

(assert (=> b!821490 (=> (not res!560219) (not e!456494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45471 (_ BitVec 32)) Bool)

(assert (=> b!821490 (= res!560219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821491 () Bool)

(assert (=> b!821491 (= e!456495 tp_is_empty!14635)))

(declare-fun b!821492 () Bool)

(declare-fun res!560220 () Bool)

(assert (=> b!821492 (=> (not res!560220) (not e!456494))))

(declare-datatypes ((List!15416 0))(
  ( (Nil!15413) (Cons!15412 (h!16547 (_ BitVec 64)) (t!21741 List!15416)) )
))
(declare-fun arrayNoDuplicates!0 (array!45471 (_ BitVec 32) List!15416) Bool)

(assert (=> b!821492 (= res!560220 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15413))))

(declare-fun b!821493 () Bool)

(declare-fun res!560222 () Bool)

(assert (=> b!821493 (=> (not res!560222) (not e!456494))))

(assert (=> b!821493 (= res!560222 (and (= (size!22202 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22203 _keys!976) (size!22202 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70804 res!560221) b!821493))

(assert (= (and b!821493 res!560222) b!821490))

(assert (= (and b!821490 res!560219) b!821492))

(assert (= (and b!821492 res!560220) b!821488))

(assert (= (and b!821489 condMapEmpty!23557) mapIsEmpty!23557))

(assert (= (and b!821489 (not condMapEmpty!23557)) mapNonEmpty!23557))

(get-info :version)

(assert (= (and mapNonEmpty!23557 ((_ is ValueCellFull!6902) mapValue!23557)) b!821491))

(assert (= (and b!821489 ((_ is ValueCellFull!6902) mapDefault!23557)) b!821487))

(assert (= start!70804 b!821489))

(declare-fun m!763807 () Bool)

(assert (=> b!821490 m!763807))

(declare-fun m!763809 () Bool)

(assert (=> start!70804 m!763809))

(declare-fun m!763811 () Bool)

(assert (=> start!70804 m!763811))

(declare-fun m!763813 () Bool)

(assert (=> start!70804 m!763813))

(declare-fun m!763815 () Bool)

(assert (=> b!821488 m!763815))

(declare-fun m!763817 () Bool)

(assert (=> b!821488 m!763817))

(declare-fun m!763819 () Bool)

(assert (=> b!821488 m!763819))

(declare-fun m!763821 () Bool)

(assert (=> b!821492 m!763821))

(declare-fun m!763823 () Bool)

(assert (=> mapNonEmpty!23557 m!763823))

(check-sat (not mapNonEmpty!23557) (not b!821492) tp_is_empty!14635 b_and!21789 (not b_next!12925) (not b!821488) (not b!821490) (not start!70804))
(check-sat b_and!21789 (not b_next!12925))
