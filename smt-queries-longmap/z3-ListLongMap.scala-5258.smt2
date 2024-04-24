; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70834 () Bool)

(assert start!70834)

(declare-fun b_free!12955 () Bool)

(declare-fun b_next!12955 () Bool)

(assert (=> start!70834 (= b_free!12955 (not b_next!12955))))

(declare-fun tp!45604 () Bool)

(declare-fun b_and!21819 () Bool)

(assert (=> start!70834 (= tp!45604 b_and!21819)))

(declare-fun b!821803 () Bool)

(declare-fun e!456716 () Bool)

(declare-fun e!456720 () Bool)

(declare-fun mapRes!23602 () Bool)

(assert (=> b!821803 (= e!456716 (and e!456720 mapRes!23602))))

(declare-fun condMapEmpty!23602 () Bool)

(declare-datatypes ((V!24555 0))(
  ( (V!24556 (val!7380 Int)) )
))
(declare-datatypes ((ValueCell!6917 0))(
  ( (ValueCellFull!6917 (v!9811 V!24555)) (EmptyCell!6917) )
))
(declare-datatypes ((array!45529 0))(
  ( (array!45530 (arr!21812 (Array (_ BitVec 32) ValueCell!6917)) (size!22232 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45529)

(declare-fun mapDefault!23602 () ValueCell!6917)

(assert (=> b!821803 (= condMapEmpty!23602 (= (arr!21812 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6917)) mapDefault!23602)))))

(declare-fun b!821804 () Bool)

(declare-fun res!560402 () Bool)

(declare-fun e!456717 () Bool)

(assert (=> b!821804 (=> (not res!560402) (not e!456717))))

(declare-datatypes ((array!45531 0))(
  ( (array!45532 (arr!21813 (Array (_ BitVec 32) (_ BitVec 64))) (size!22233 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45531)

(declare-datatypes ((List!15438 0))(
  ( (Nil!15435) (Cons!15434 (h!16569 (_ BitVec 64)) (t!21763 List!15438)) )
))
(declare-fun arrayNoDuplicates!0 (array!45531 (_ BitVec 32) List!15438) Bool)

(assert (=> b!821804 (= res!560402 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15435))))

(declare-fun b!821805 () Bool)

(declare-fun res!560401 () Bool)

(assert (=> b!821805 (=> (not res!560401) (not e!456717))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45531 (_ BitVec 32)) Bool)

(assert (=> b!821805 (= res!560401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821806 () Bool)

(assert (=> b!821806 (= e!456717 (not true))))

(declare-datatypes ((tuple2!9644 0))(
  ( (tuple2!9645 (_1!4833 (_ BitVec 64)) (_2!4833 V!24555)) )
))
(declare-datatypes ((List!15439 0))(
  ( (Nil!15436) (Cons!15435 (h!16570 tuple2!9644) (t!21764 List!15439)) )
))
(declare-datatypes ((ListLongMap!8469 0))(
  ( (ListLongMap!8470 (toList!4250 List!15439)) )
))
(declare-fun lt!369321 () ListLongMap!8469)

(declare-fun lt!369322 () ListLongMap!8469)

(assert (=> b!821806 (= lt!369321 lt!369322)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24555)

(declare-fun minValue!754 () V!24555)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28052 0))(
  ( (Unit!28053) )
))
(declare-fun lt!369320 () Unit!28052)

(declare-fun zeroValueBefore!34 () V!24555)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!429 (array!45531 array!45529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24555 V!24555 V!24555 V!24555 (_ BitVec 32) Int) Unit!28052)

(assert (=> b!821806 (= lt!369320 (lemmaNoChangeToArrayThenSameMapNoExtras!429 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2341 (array!45531 array!45529 (_ BitVec 32) (_ BitVec 32) V!24555 V!24555 (_ BitVec 32) Int) ListLongMap!8469)

(assert (=> b!821806 (= lt!369322 (getCurrentListMapNoExtraKeys!2341 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821806 (= lt!369321 (getCurrentListMapNoExtraKeys!2341 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821807 () Bool)

(declare-fun tp_is_empty!14665 () Bool)

(assert (=> b!821807 (= e!456720 tp_is_empty!14665)))

(declare-fun mapIsEmpty!23602 () Bool)

(assert (=> mapIsEmpty!23602 mapRes!23602))

(declare-fun mapNonEmpty!23602 () Bool)

(declare-fun tp!45603 () Bool)

(declare-fun e!456719 () Bool)

(assert (=> mapNonEmpty!23602 (= mapRes!23602 (and tp!45603 e!456719))))

(declare-fun mapValue!23602 () ValueCell!6917)

(declare-fun mapKey!23602 () (_ BitVec 32))

(declare-fun mapRest!23602 () (Array (_ BitVec 32) ValueCell!6917))

(assert (=> mapNonEmpty!23602 (= (arr!21812 _values!788) (store mapRest!23602 mapKey!23602 mapValue!23602))))

(declare-fun b!821808 () Bool)

(assert (=> b!821808 (= e!456719 tp_is_empty!14665)))

(declare-fun res!560399 () Bool)

(assert (=> start!70834 (=> (not res!560399) (not e!456717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70834 (= res!560399 (validMask!0 mask!1312))))

(assert (=> start!70834 e!456717))

(assert (=> start!70834 tp_is_empty!14665))

(declare-fun array_inv!17461 (array!45531) Bool)

(assert (=> start!70834 (array_inv!17461 _keys!976)))

(assert (=> start!70834 true))

(declare-fun array_inv!17462 (array!45529) Bool)

(assert (=> start!70834 (and (array_inv!17462 _values!788) e!456716)))

(assert (=> start!70834 tp!45604))

(declare-fun b!821802 () Bool)

(declare-fun res!560400 () Bool)

(assert (=> b!821802 (=> (not res!560400) (not e!456717))))

(assert (=> b!821802 (= res!560400 (and (= (size!22232 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22233 _keys!976) (size!22232 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70834 res!560399) b!821802))

(assert (= (and b!821802 res!560400) b!821805))

(assert (= (and b!821805 res!560401) b!821804))

(assert (= (and b!821804 res!560402) b!821806))

(assert (= (and b!821803 condMapEmpty!23602) mapIsEmpty!23602))

(assert (= (and b!821803 (not condMapEmpty!23602)) mapNonEmpty!23602))

(get-info :version)

(assert (= (and mapNonEmpty!23602 ((_ is ValueCellFull!6917) mapValue!23602)) b!821808))

(assert (= (and b!821803 ((_ is ValueCellFull!6917) mapDefault!23602)) b!821807))

(assert (= start!70834 b!821803))

(declare-fun m!764077 () Bool)

(assert (=> mapNonEmpty!23602 m!764077))

(declare-fun m!764079 () Bool)

(assert (=> start!70834 m!764079))

(declare-fun m!764081 () Bool)

(assert (=> start!70834 m!764081))

(declare-fun m!764083 () Bool)

(assert (=> start!70834 m!764083))

(declare-fun m!764085 () Bool)

(assert (=> b!821805 m!764085))

(declare-fun m!764087 () Bool)

(assert (=> b!821804 m!764087))

(declare-fun m!764089 () Bool)

(assert (=> b!821806 m!764089))

(declare-fun m!764091 () Bool)

(assert (=> b!821806 m!764091))

(declare-fun m!764093 () Bool)

(assert (=> b!821806 m!764093))

(check-sat (not b!821804) (not b!821806) tp_is_empty!14665 (not start!70834) (not mapNonEmpty!23602) b_and!21819 (not b_next!12955) (not b!821805))
(check-sat b_and!21819 (not b_next!12955))
