; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70816 () Bool)

(assert start!70816)

(declare-fun b_free!12937 () Bool)

(declare-fun b_next!12937 () Bool)

(assert (=> start!70816 (= b_free!12937 (not b_next!12937))))

(declare-fun tp!45549 () Bool)

(declare-fun b_and!21801 () Bool)

(assert (=> start!70816 (= tp!45549 b_and!21801)))

(declare-fun b!821613 () Bool)

(declare-fun e!456581 () Bool)

(assert (=> b!821613 (= e!456581 (not true))))

(declare-datatypes ((V!24531 0))(
  ( (V!24532 (val!7371 Int)) )
))
(declare-datatypes ((tuple2!9628 0))(
  ( (tuple2!9629 (_1!4825 (_ BitVec 64)) (_2!4825 V!24531)) )
))
(declare-datatypes ((List!15424 0))(
  ( (Nil!15421) (Cons!15420 (h!16555 tuple2!9628) (t!21749 List!15424)) )
))
(declare-datatypes ((ListLongMap!8453 0))(
  ( (ListLongMap!8454 (toList!4242 List!15424)) )
))
(declare-fun lt!369241 () ListLongMap!8453)

(declare-fun lt!369239 () ListLongMap!8453)

(assert (=> b!821613 (= lt!369241 lt!369239)))

(declare-fun zeroValueBefore!34 () V!24531)

(declare-datatypes ((array!45493 0))(
  ( (array!45494 (arr!21794 (Array (_ BitVec 32) (_ BitVec 64))) (size!22214 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45493)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24531)

(declare-fun minValue!754 () V!24531)

(declare-datatypes ((ValueCell!6908 0))(
  ( (ValueCellFull!6908 (v!9802 V!24531)) (EmptyCell!6908) )
))
(declare-datatypes ((array!45495 0))(
  ( (array!45496 (arr!21795 (Array (_ BitVec 32) ValueCell!6908)) (size!22215 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45495)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28036 0))(
  ( (Unit!28037) )
))
(declare-fun lt!369240 () Unit!28036)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!421 (array!45493 array!45495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24531 V!24531 V!24531 V!24531 (_ BitVec 32) Int) Unit!28036)

(assert (=> b!821613 (= lt!369240 (lemmaNoChangeToArrayThenSameMapNoExtras!421 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2333 (array!45493 array!45495 (_ BitVec 32) (_ BitVec 32) V!24531 V!24531 (_ BitVec 32) Int) ListLongMap!8453)

(assert (=> b!821613 (= lt!369239 (getCurrentListMapNoExtraKeys!2333 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821613 (= lt!369241 (getCurrentListMapNoExtraKeys!2333 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821614 () Bool)

(declare-fun e!456585 () Bool)

(declare-fun e!456584 () Bool)

(declare-fun mapRes!23575 () Bool)

(assert (=> b!821614 (= e!456585 (and e!456584 mapRes!23575))))

(declare-fun condMapEmpty!23575 () Bool)

(declare-fun mapDefault!23575 () ValueCell!6908)

(assert (=> b!821614 (= condMapEmpty!23575 (= (arr!21795 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6908)) mapDefault!23575)))))

(declare-fun b!821615 () Bool)

(declare-fun res!560294 () Bool)

(assert (=> b!821615 (=> (not res!560294) (not e!456581))))

(assert (=> b!821615 (= res!560294 (and (= (size!22215 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22214 _keys!976) (size!22215 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821616 () Bool)

(declare-fun res!560291 () Bool)

(assert (=> b!821616 (=> (not res!560291) (not e!456581))))

(declare-datatypes ((List!15425 0))(
  ( (Nil!15422) (Cons!15421 (h!16556 (_ BitVec 64)) (t!21750 List!15425)) )
))
(declare-fun arrayNoDuplicates!0 (array!45493 (_ BitVec 32) List!15425) Bool)

(assert (=> b!821616 (= res!560291 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15422))))

(declare-fun b!821617 () Bool)

(declare-fun res!560292 () Bool)

(assert (=> b!821617 (=> (not res!560292) (not e!456581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45493 (_ BitVec 32)) Bool)

(assert (=> b!821617 (= res!560292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821618 () Bool)

(declare-fun tp_is_empty!14647 () Bool)

(assert (=> b!821618 (= e!456584 tp_is_empty!14647)))

(declare-fun res!560293 () Bool)

(assert (=> start!70816 (=> (not res!560293) (not e!456581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70816 (= res!560293 (validMask!0 mask!1312))))

(assert (=> start!70816 e!456581))

(assert (=> start!70816 tp_is_empty!14647))

(declare-fun array_inv!17449 (array!45493) Bool)

(assert (=> start!70816 (array_inv!17449 _keys!976)))

(assert (=> start!70816 true))

(declare-fun array_inv!17450 (array!45495) Bool)

(assert (=> start!70816 (and (array_inv!17450 _values!788) e!456585)))

(assert (=> start!70816 tp!45549))

(declare-fun mapIsEmpty!23575 () Bool)

(assert (=> mapIsEmpty!23575 mapRes!23575))

(declare-fun mapNonEmpty!23575 () Bool)

(declare-fun tp!45550 () Bool)

(declare-fun e!456583 () Bool)

(assert (=> mapNonEmpty!23575 (= mapRes!23575 (and tp!45550 e!456583))))

(declare-fun mapRest!23575 () (Array (_ BitVec 32) ValueCell!6908))

(declare-fun mapKey!23575 () (_ BitVec 32))

(declare-fun mapValue!23575 () ValueCell!6908)

(assert (=> mapNonEmpty!23575 (= (arr!21795 _values!788) (store mapRest!23575 mapKey!23575 mapValue!23575))))

(declare-fun b!821619 () Bool)

(assert (=> b!821619 (= e!456583 tp_is_empty!14647)))

(assert (= (and start!70816 res!560293) b!821615))

(assert (= (and b!821615 res!560294) b!821617))

(assert (= (and b!821617 res!560292) b!821616))

(assert (= (and b!821616 res!560291) b!821613))

(assert (= (and b!821614 condMapEmpty!23575) mapIsEmpty!23575))

(assert (= (and b!821614 (not condMapEmpty!23575)) mapNonEmpty!23575))

(get-info :version)

(assert (= (and mapNonEmpty!23575 ((_ is ValueCellFull!6908) mapValue!23575)) b!821619))

(assert (= (and b!821614 ((_ is ValueCellFull!6908) mapDefault!23575)) b!821618))

(assert (= start!70816 b!821614))

(declare-fun m!763915 () Bool)

(assert (=> b!821613 m!763915))

(declare-fun m!763917 () Bool)

(assert (=> b!821613 m!763917))

(declare-fun m!763919 () Bool)

(assert (=> b!821613 m!763919))

(declare-fun m!763921 () Bool)

(assert (=> mapNonEmpty!23575 m!763921))

(declare-fun m!763923 () Bool)

(assert (=> start!70816 m!763923))

(declare-fun m!763925 () Bool)

(assert (=> start!70816 m!763925))

(declare-fun m!763927 () Bool)

(assert (=> start!70816 m!763927))

(declare-fun m!763929 () Bool)

(assert (=> b!821616 m!763929))

(declare-fun m!763931 () Bool)

(assert (=> b!821617 m!763931))

(check-sat tp_is_empty!14647 (not start!70816) (not b!821616) (not b!821613) b_and!21801 (not b_next!12937) (not mapNonEmpty!23575) (not b!821617))
(check-sat b_and!21801 (not b_next!12937))
