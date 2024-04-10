; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70766 () Bool)

(assert start!70766)

(declare-fun b_free!13023 () Bool)

(declare-fun b_next!13023 () Bool)

(assert (=> start!70766 (= b_free!13023 (not b_next!13023))))

(declare-fun tp!45813 () Bool)

(declare-fun b_and!21895 () Bool)

(assert (=> start!70766 (= tp!45813 b_and!21895)))

(declare-fun mapIsEmpty!23710 () Bool)

(declare-fun mapRes!23710 () Bool)

(assert (=> mapIsEmpty!23710 mapRes!23710))

(declare-fun b!821946 () Bool)

(declare-fun res!560644 () Bool)

(declare-fun e!456890 () Bool)

(assert (=> b!821946 (=> (not res!560644) (not e!456890))))

(declare-datatypes ((array!45662 0))(
  ( (array!45663 (arr!21881 (Array (_ BitVec 32) (_ BitVec 64))) (size!22302 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45662)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24645 0))(
  ( (V!24646 (val!7414 Int)) )
))
(declare-datatypes ((ValueCell!6951 0))(
  ( (ValueCellFull!6951 (v!9845 V!24645)) (EmptyCell!6951) )
))
(declare-datatypes ((array!45664 0))(
  ( (array!45665 (arr!21882 (Array (_ BitVec 32) ValueCell!6951)) (size!22303 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45664)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821946 (= res!560644 (and (= (size!22303 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22302 _keys!976) (size!22303 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821947 () Bool)

(declare-fun e!456892 () Bool)

(declare-fun e!456889 () Bool)

(assert (=> b!821947 (= e!456892 (and e!456889 mapRes!23710))))

(declare-fun condMapEmpty!23710 () Bool)

(declare-fun mapDefault!23710 () ValueCell!6951)

(assert (=> b!821947 (= condMapEmpty!23710 (= (arr!21882 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6951)) mapDefault!23710)))))

(declare-fun mapNonEmpty!23710 () Bool)

(declare-fun tp!45814 () Bool)

(declare-fun e!456893 () Bool)

(assert (=> mapNonEmpty!23710 (= mapRes!23710 (and tp!45814 e!456893))))

(declare-fun mapValue!23710 () ValueCell!6951)

(declare-fun mapRest!23710 () (Array (_ BitVec 32) ValueCell!6951))

(declare-fun mapKey!23710 () (_ BitVec 32))

(assert (=> mapNonEmpty!23710 (= (arr!21882 _values!788) (store mapRest!23710 mapKey!23710 mapValue!23710))))

(declare-fun b!821948 () Bool)

(declare-fun e!456894 () Bool)

(assert (=> b!821948 (= e!456890 (not e!456894))))

(declare-fun res!560641 () Bool)

(assert (=> b!821948 (=> res!560641 e!456894)))

(assert (=> b!821948 (= res!560641 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9786 0))(
  ( (tuple2!9787 (_1!4904 (_ BitVec 64)) (_2!4904 V!24645)) )
))
(declare-datatypes ((List!15601 0))(
  ( (Nil!15598) (Cons!15597 (h!16726 tuple2!9786) (t!21938 List!15601)) )
))
(declare-datatypes ((ListLongMap!8609 0))(
  ( (ListLongMap!8610 (toList!4320 List!15601)) )
))
(declare-fun lt!369518 () ListLongMap!8609)

(declare-fun lt!369514 () ListLongMap!8609)

(assert (=> b!821948 (= lt!369518 lt!369514)))

(declare-fun zeroValueBefore!34 () V!24645)

(declare-fun zeroValueAfter!34 () V!24645)

(declare-fun minValue!754 () V!24645)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28106 0))(
  ( (Unit!28107) )
))
(declare-fun lt!369516 () Unit!28106)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!450 (array!45662 array!45664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24645 V!24645 V!24645 V!24645 (_ BitVec 32) Int) Unit!28106)

(assert (=> b!821948 (= lt!369516 (lemmaNoChangeToArrayThenSameMapNoExtras!450 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2340 (array!45662 array!45664 (_ BitVec 32) (_ BitVec 32) V!24645 V!24645 (_ BitVec 32) Int) ListLongMap!8609)

(assert (=> b!821948 (= lt!369514 (getCurrentListMapNoExtraKeys!2340 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821948 (= lt!369518 (getCurrentListMapNoExtraKeys!2340 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560643 () Bool)

(assert (=> start!70766 (=> (not res!560643) (not e!456890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70766 (= res!560643 (validMask!0 mask!1312))))

(assert (=> start!70766 e!456890))

(declare-fun tp_is_empty!14733 () Bool)

(assert (=> start!70766 tp_is_empty!14733))

(declare-fun array_inv!17479 (array!45662) Bool)

(assert (=> start!70766 (array_inv!17479 _keys!976)))

(assert (=> start!70766 true))

(declare-fun array_inv!17480 (array!45664) Bool)

(assert (=> start!70766 (and (array_inv!17480 _values!788) e!456892)))

(assert (=> start!70766 tp!45813))

(declare-fun b!821949 () Bool)

(declare-fun res!560645 () Bool)

(assert (=> b!821949 (=> (not res!560645) (not e!456890))))

(declare-datatypes ((List!15602 0))(
  ( (Nil!15599) (Cons!15598 (h!16727 (_ BitVec 64)) (t!21939 List!15602)) )
))
(declare-fun arrayNoDuplicates!0 (array!45662 (_ BitVec 32) List!15602) Bool)

(assert (=> b!821949 (= res!560645 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15599))))

(declare-fun b!821950 () Bool)

(declare-fun lt!369515 () tuple2!9786)

(declare-fun e!456891 () Bool)

(declare-fun lt!369517 () ListLongMap!8609)

(declare-fun +!1872 (ListLongMap!8609 tuple2!9786) ListLongMap!8609)

(assert (=> b!821950 (= e!456891 (= lt!369517 (+!1872 (+!1872 lt!369518 (tuple2!9787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!369515)))))

(declare-fun b!821951 () Bool)

(declare-fun res!560646 () Bool)

(assert (=> b!821951 (=> (not res!560646) (not e!456890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45662 (_ BitVec 32)) Bool)

(assert (=> b!821951 (= res!560646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821952 () Bool)

(assert (=> b!821952 (= e!456894 true)))

(assert (=> b!821952 e!456891))

(declare-fun res!560642 () Bool)

(assert (=> b!821952 (=> (not res!560642) (not e!456891))))

(declare-fun lt!369519 () ListLongMap!8609)

(assert (=> b!821952 (= res!560642 (= lt!369519 (+!1872 lt!369518 lt!369515)))))

(assert (=> b!821952 (= lt!369515 (tuple2!9787 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2487 (array!45662 array!45664 (_ BitVec 32) (_ BitVec 32) V!24645 V!24645 (_ BitVec 32) Int) ListLongMap!8609)

(assert (=> b!821952 (= lt!369517 (getCurrentListMap!2487 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821952 (= lt!369519 (getCurrentListMap!2487 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821953 () Bool)

(assert (=> b!821953 (= e!456893 tp_is_empty!14733)))

(declare-fun b!821954 () Bool)

(assert (=> b!821954 (= e!456889 tp_is_empty!14733)))

(assert (= (and start!70766 res!560643) b!821946))

(assert (= (and b!821946 res!560644) b!821951))

(assert (= (and b!821951 res!560646) b!821949))

(assert (= (and b!821949 res!560645) b!821948))

(assert (= (and b!821948 (not res!560641)) b!821952))

(assert (= (and b!821952 res!560642) b!821950))

(assert (= (and b!821947 condMapEmpty!23710) mapIsEmpty!23710))

(assert (= (and b!821947 (not condMapEmpty!23710)) mapNonEmpty!23710))

(get-info :version)

(assert (= (and mapNonEmpty!23710 ((_ is ValueCellFull!6951) mapValue!23710)) b!821953))

(assert (= (and b!821947 ((_ is ValueCellFull!6951) mapDefault!23710)) b!821954))

(assert (= start!70766 b!821947))

(declare-fun m!763649 () Bool)

(assert (=> b!821950 m!763649))

(assert (=> b!821950 m!763649))

(declare-fun m!763651 () Bool)

(assert (=> b!821950 m!763651))

(declare-fun m!763653 () Bool)

(assert (=> b!821951 m!763653))

(declare-fun m!763655 () Bool)

(assert (=> b!821952 m!763655))

(declare-fun m!763657 () Bool)

(assert (=> b!821952 m!763657))

(declare-fun m!763659 () Bool)

(assert (=> b!821952 m!763659))

(declare-fun m!763661 () Bool)

(assert (=> start!70766 m!763661))

(declare-fun m!763663 () Bool)

(assert (=> start!70766 m!763663))

(declare-fun m!763665 () Bool)

(assert (=> start!70766 m!763665))

(declare-fun m!763667 () Bool)

(assert (=> mapNonEmpty!23710 m!763667))

(declare-fun m!763669 () Bool)

(assert (=> b!821948 m!763669))

(declare-fun m!763671 () Bool)

(assert (=> b!821948 m!763671))

(declare-fun m!763673 () Bool)

(assert (=> b!821948 m!763673))

(declare-fun m!763675 () Bool)

(assert (=> b!821949 m!763675))

(check-sat (not start!70766) (not b!821948) (not b!821952) tp_is_empty!14733 (not b!821951) (not b_next!13023) (not b!821950) (not mapNonEmpty!23710) (not b!821949) b_and!21895)
(check-sat b_and!21895 (not b_next!13023))
