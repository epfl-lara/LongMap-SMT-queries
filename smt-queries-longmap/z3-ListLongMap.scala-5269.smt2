; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70744 () Bool)

(assert start!70744)

(declare-fun b_free!13021 () Bool)

(declare-fun b_next!13021 () Bool)

(assert (=> start!70744 (= b_free!13021 (not b_next!13021))))

(declare-fun tp!45808 () Bool)

(declare-fun b_and!21867 () Bool)

(assert (=> start!70744 (= tp!45808 b_and!21867)))

(declare-fun mapIsEmpty!23707 () Bool)

(declare-fun mapRes!23707 () Bool)

(assert (=> mapIsEmpty!23707 mapRes!23707))

(declare-fun b!821673 () Bool)

(declare-fun e!456720 () Bool)

(declare-fun tp_is_empty!14731 () Bool)

(assert (=> b!821673 (= e!456720 tp_is_empty!14731)))

(declare-fun b!821674 () Bool)

(declare-fun e!456717 () Bool)

(assert (=> b!821674 (= e!456717 (and e!456720 mapRes!23707))))

(declare-fun condMapEmpty!23707 () Bool)

(declare-datatypes ((V!24643 0))(
  ( (V!24644 (val!7413 Int)) )
))
(declare-datatypes ((ValueCell!6950 0))(
  ( (ValueCellFull!6950 (v!9838 V!24643)) (EmptyCell!6950) )
))
(declare-datatypes ((array!45625 0))(
  ( (array!45626 (arr!21863 (Array (_ BitVec 32) ValueCell!6950)) (size!22284 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45625)

(declare-fun mapDefault!23707 () ValueCell!6950)

(assert (=> b!821674 (= condMapEmpty!23707 (= (arr!21863 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6950)) mapDefault!23707)))))

(declare-fun b!821675 () Bool)

(declare-fun e!456718 () Bool)

(assert (=> b!821675 (= e!456718 tp_is_empty!14731)))

(declare-fun res!560520 () Bool)

(declare-fun e!456721 () Bool)

(assert (=> start!70744 (=> (not res!560520) (not e!456721))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70744 (= res!560520 (validMask!0 mask!1312))))

(assert (=> start!70744 e!456721))

(assert (=> start!70744 tp_is_empty!14731))

(declare-datatypes ((array!45627 0))(
  ( (array!45628 (arr!21864 (Array (_ BitVec 32) (_ BitVec 64))) (size!22285 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45627)

(declare-fun array_inv!17535 (array!45627) Bool)

(assert (=> start!70744 (array_inv!17535 _keys!976)))

(assert (=> start!70744 true))

(declare-fun array_inv!17536 (array!45625) Bool)

(assert (=> start!70744 (and (array_inv!17536 _values!788) e!456717)))

(assert (=> start!70744 tp!45808))

(declare-fun b!821676 () Bool)

(declare-fun e!456722 () Bool)

(assert (=> b!821676 (= e!456721 (not e!456722))))

(declare-fun res!560522 () Bool)

(assert (=> b!821676 (=> res!560522 e!456722)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821676 (= res!560522 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9790 0))(
  ( (tuple2!9791 (_1!4906 (_ BitVec 64)) (_2!4906 V!24643)) )
))
(declare-datatypes ((List!15602 0))(
  ( (Nil!15599) (Cons!15598 (h!16727 tuple2!9790) (t!21930 List!15602)) )
))
(declare-datatypes ((ListLongMap!8603 0))(
  ( (ListLongMap!8604 (toList!4317 List!15602)) )
))
(declare-fun lt!369257 () ListLongMap!8603)

(declare-fun lt!369255 () ListLongMap!8603)

(assert (=> b!821676 (= lt!369257 lt!369255)))

(declare-datatypes ((Unit!28056 0))(
  ( (Unit!28057) )
))
(declare-fun lt!369258 () Unit!28056)

(declare-fun zeroValueBefore!34 () V!24643)

(declare-fun zeroValueAfter!34 () V!24643)

(declare-fun minValue!754 () V!24643)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!458 (array!45627 array!45625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24643 V!24643 V!24643 V!24643 (_ BitVec 32) Int) Unit!28056)

(assert (=> b!821676 (= lt!369258 (lemmaNoChangeToArrayThenSameMapNoExtras!458 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2365 (array!45627 array!45625 (_ BitVec 32) (_ BitVec 32) V!24643 V!24643 (_ BitVec 32) Int) ListLongMap!8603)

(assert (=> b!821676 (= lt!369255 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821676 (= lt!369257 (getCurrentListMapNoExtraKeys!2365 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821677 () Bool)

(declare-fun res!560521 () Bool)

(assert (=> b!821677 (=> (not res!560521) (not e!456721))))

(assert (=> b!821677 (= res!560521 (and (= (size!22284 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22285 _keys!976) (size!22284 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821678 () Bool)

(assert (=> b!821678 (= e!456722 true)))

(declare-fun e!456723 () Bool)

(assert (=> b!821678 e!456723))

(declare-fun res!560518 () Bool)

(assert (=> b!821678 (=> (not res!560518) (not e!456723))))

(declare-fun lt!369256 () tuple2!9790)

(declare-fun lt!369254 () ListLongMap!8603)

(declare-fun +!1901 (ListLongMap!8603 tuple2!9790) ListLongMap!8603)

(assert (=> b!821678 (= res!560518 (= lt!369254 (+!1901 lt!369257 lt!369256)))))

(assert (=> b!821678 (= lt!369256 (tuple2!9791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369253 () ListLongMap!8603)

(declare-fun getCurrentListMap!2443 (array!45627 array!45625 (_ BitVec 32) (_ BitVec 32) V!24643 V!24643 (_ BitVec 32) Int) ListLongMap!8603)

(assert (=> b!821678 (= lt!369253 (getCurrentListMap!2443 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821678 (= lt!369254 (getCurrentListMap!2443 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23707 () Bool)

(declare-fun tp!45807 () Bool)

(assert (=> mapNonEmpty!23707 (= mapRes!23707 (and tp!45807 e!456718))))

(declare-fun mapValue!23707 () ValueCell!6950)

(declare-fun mapKey!23707 () (_ BitVec 32))

(declare-fun mapRest!23707 () (Array (_ BitVec 32) ValueCell!6950))

(assert (=> mapNonEmpty!23707 (= (arr!21863 _values!788) (store mapRest!23707 mapKey!23707 mapValue!23707))))

(declare-fun b!821679 () Bool)

(declare-fun res!560519 () Bool)

(assert (=> b!821679 (=> (not res!560519) (not e!456721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45627 (_ BitVec 32)) Bool)

(assert (=> b!821679 (= res!560519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821680 () Bool)

(assert (=> b!821680 (= e!456723 (= lt!369253 (+!1901 (+!1901 lt!369257 (tuple2!9791 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!369256)))))

(declare-fun b!821681 () Bool)

(declare-fun res!560517 () Bool)

(assert (=> b!821681 (=> (not res!560517) (not e!456721))))

(declare-datatypes ((List!15603 0))(
  ( (Nil!15600) (Cons!15599 (h!16728 (_ BitVec 64)) (t!21931 List!15603)) )
))
(declare-fun arrayNoDuplicates!0 (array!45627 (_ BitVec 32) List!15603) Bool)

(assert (=> b!821681 (= res!560517 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15600))))

(assert (= (and start!70744 res!560520) b!821677))

(assert (= (and b!821677 res!560521) b!821679))

(assert (= (and b!821679 res!560519) b!821681))

(assert (= (and b!821681 res!560517) b!821676))

(assert (= (and b!821676 (not res!560522)) b!821678))

(assert (= (and b!821678 res!560518) b!821680))

(assert (= (and b!821674 condMapEmpty!23707) mapIsEmpty!23707))

(assert (= (and b!821674 (not condMapEmpty!23707)) mapNonEmpty!23707))

(get-info :version)

(assert (= (and mapNonEmpty!23707 ((_ is ValueCellFull!6950) mapValue!23707)) b!821675))

(assert (= (and b!821674 ((_ is ValueCellFull!6950) mapDefault!23707)) b!821673))

(assert (= start!70744 b!821674))

(declare-fun m!762869 () Bool)

(assert (=> b!821679 m!762869))

(declare-fun m!762871 () Bool)

(assert (=> mapNonEmpty!23707 m!762871))

(declare-fun m!762873 () Bool)

(assert (=> b!821678 m!762873))

(declare-fun m!762875 () Bool)

(assert (=> b!821678 m!762875))

(declare-fun m!762877 () Bool)

(assert (=> b!821678 m!762877))

(declare-fun m!762879 () Bool)

(assert (=> b!821680 m!762879))

(assert (=> b!821680 m!762879))

(declare-fun m!762881 () Bool)

(assert (=> b!821680 m!762881))

(declare-fun m!762883 () Bool)

(assert (=> start!70744 m!762883))

(declare-fun m!762885 () Bool)

(assert (=> start!70744 m!762885))

(declare-fun m!762887 () Bool)

(assert (=> start!70744 m!762887))

(declare-fun m!762889 () Bool)

(assert (=> b!821681 m!762889))

(declare-fun m!762891 () Bool)

(assert (=> b!821676 m!762891))

(declare-fun m!762893 () Bool)

(assert (=> b!821676 m!762893))

(declare-fun m!762895 () Bool)

(assert (=> b!821676 m!762895))

(check-sat (not b!821678) (not b!821679) (not b_next!13021) b_and!21867 tp_is_empty!14731 (not b!821680) (not b!821681) (not start!70744) (not b!821676) (not mapNonEmpty!23707))
(check-sat b_and!21867 (not b_next!13021))
