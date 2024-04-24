; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70810 () Bool)

(assert start!70810)

(declare-fun b_free!12931 () Bool)

(declare-fun b_next!12931 () Bool)

(assert (=> start!70810 (= b_free!12931 (not b_next!12931))))

(declare-fun tp!45532 () Bool)

(declare-fun b_and!21795 () Bool)

(assert (=> start!70810 (= tp!45532 b_and!21795)))

(declare-fun mapIsEmpty!23566 () Bool)

(declare-fun mapRes!23566 () Bool)

(assert (=> mapIsEmpty!23566 mapRes!23566))

(declare-fun b!821551 () Bool)

(declare-fun e!456540 () Bool)

(declare-fun tp_is_empty!14641 () Bool)

(assert (=> b!821551 (= e!456540 tp_is_empty!14641)))

(declare-fun b!821552 () Bool)

(declare-fun e!456539 () Bool)

(assert (=> b!821552 (= e!456539 tp_is_empty!14641)))

(declare-fun b!821553 () Bool)

(declare-fun e!456536 () Bool)

(assert (=> b!821553 (= e!456536 (and e!456539 mapRes!23566))))

(declare-fun condMapEmpty!23566 () Bool)

(declare-datatypes ((V!24523 0))(
  ( (V!24524 (val!7368 Int)) )
))
(declare-datatypes ((ValueCell!6905 0))(
  ( (ValueCellFull!6905 (v!9799 V!24523)) (EmptyCell!6905) )
))
(declare-datatypes ((array!45481 0))(
  ( (array!45482 (arr!21788 (Array (_ BitVec 32) ValueCell!6905)) (size!22208 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45481)

(declare-fun mapDefault!23566 () ValueCell!6905)

(assert (=> b!821553 (= condMapEmpty!23566 (= (arr!21788 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6905)) mapDefault!23566)))))

(declare-fun b!821554 () Bool)

(declare-fun res!560256 () Bool)

(declare-fun e!456538 () Bool)

(assert (=> b!821554 (=> (not res!560256) (not e!456538))))

(declare-datatypes ((array!45483 0))(
  ( (array!45484 (arr!21789 (Array (_ BitVec 32) (_ BitVec 64))) (size!22209 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45483)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821554 (= res!560256 (and (= (size!22208 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22209 _keys!976) (size!22208 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821555 () Bool)

(declare-fun res!560257 () Bool)

(assert (=> b!821555 (=> (not res!560257) (not e!456538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45483 (_ BitVec 32)) Bool)

(assert (=> b!821555 (= res!560257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821550 () Bool)

(declare-fun res!560255 () Bool)

(assert (=> b!821550 (=> (not res!560255) (not e!456538))))

(declare-datatypes ((List!15420 0))(
  ( (Nil!15417) (Cons!15416 (h!16551 (_ BitVec 64)) (t!21745 List!15420)) )
))
(declare-fun arrayNoDuplicates!0 (array!45483 (_ BitVec 32) List!15420) Bool)

(assert (=> b!821550 (= res!560255 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15417))))

(declare-fun res!560258 () Bool)

(assert (=> start!70810 (=> (not res!560258) (not e!456538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70810 (= res!560258 (validMask!0 mask!1312))))

(assert (=> start!70810 e!456538))

(assert (=> start!70810 tp_is_empty!14641))

(declare-fun array_inv!17445 (array!45483) Bool)

(assert (=> start!70810 (array_inv!17445 _keys!976)))

(assert (=> start!70810 true))

(declare-fun array_inv!17446 (array!45481) Bool)

(assert (=> start!70810 (and (array_inv!17446 _values!788) e!456536)))

(assert (=> start!70810 tp!45532))

(declare-fun mapNonEmpty!23566 () Bool)

(declare-fun tp!45531 () Bool)

(assert (=> mapNonEmpty!23566 (= mapRes!23566 (and tp!45531 e!456540))))

(declare-fun mapKey!23566 () (_ BitVec 32))

(declare-fun mapRest!23566 () (Array (_ BitVec 32) ValueCell!6905))

(declare-fun mapValue!23566 () ValueCell!6905)

(assert (=> mapNonEmpty!23566 (= (arr!21788 _values!788) (store mapRest!23566 mapKey!23566 mapValue!23566))))

(declare-fun b!821556 () Bool)

(assert (=> b!821556 (= e!456538 (not true))))

(declare-datatypes ((tuple2!9624 0))(
  ( (tuple2!9625 (_1!4823 (_ BitVec 64)) (_2!4823 V!24523)) )
))
(declare-datatypes ((List!15421 0))(
  ( (Nil!15418) (Cons!15417 (h!16552 tuple2!9624) (t!21746 List!15421)) )
))
(declare-datatypes ((ListLongMap!8449 0))(
  ( (ListLongMap!8450 (toList!4240 List!15421)) )
))
(declare-fun lt!369212 () ListLongMap!8449)

(declare-fun lt!369213 () ListLongMap!8449)

(assert (=> b!821556 (= lt!369212 lt!369213)))

(declare-fun zeroValueBefore!34 () V!24523)

(declare-datatypes ((Unit!28032 0))(
  ( (Unit!28033) )
))
(declare-fun lt!369214 () Unit!28032)

(declare-fun zeroValueAfter!34 () V!24523)

(declare-fun minValue!754 () V!24523)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!419 (array!45483 array!45481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24523 V!24523 V!24523 V!24523 (_ BitVec 32) Int) Unit!28032)

(assert (=> b!821556 (= lt!369214 (lemmaNoChangeToArrayThenSameMapNoExtras!419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2331 (array!45483 array!45481 (_ BitVec 32) (_ BitVec 32) V!24523 V!24523 (_ BitVec 32) Int) ListLongMap!8449)

(assert (=> b!821556 (= lt!369213 (getCurrentListMapNoExtraKeys!2331 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821556 (= lt!369212 (getCurrentListMapNoExtraKeys!2331 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70810 res!560258) b!821554))

(assert (= (and b!821554 res!560256) b!821555))

(assert (= (and b!821555 res!560257) b!821550))

(assert (= (and b!821550 res!560255) b!821556))

(assert (= (and b!821553 condMapEmpty!23566) mapIsEmpty!23566))

(assert (= (and b!821553 (not condMapEmpty!23566)) mapNonEmpty!23566))

(get-info :version)

(assert (= (and mapNonEmpty!23566 ((_ is ValueCellFull!6905) mapValue!23566)) b!821551))

(assert (= (and b!821553 ((_ is ValueCellFull!6905) mapDefault!23566)) b!821552))

(assert (= start!70810 b!821553))

(declare-fun m!763861 () Bool)

(assert (=> start!70810 m!763861))

(declare-fun m!763863 () Bool)

(assert (=> start!70810 m!763863))

(declare-fun m!763865 () Bool)

(assert (=> start!70810 m!763865))

(declare-fun m!763867 () Bool)

(assert (=> b!821556 m!763867))

(declare-fun m!763869 () Bool)

(assert (=> b!821556 m!763869))

(declare-fun m!763871 () Bool)

(assert (=> b!821556 m!763871))

(declare-fun m!763873 () Bool)

(assert (=> b!821555 m!763873))

(declare-fun m!763875 () Bool)

(assert (=> mapNonEmpty!23566 m!763875))

(declare-fun m!763877 () Bool)

(assert (=> b!821550 m!763877))

(check-sat (not b!821555) (not mapNonEmpty!23566) (not start!70810) (not b!821556) tp_is_empty!14641 b_and!21795 (not b_next!12931) (not b!821550))
(check-sat b_and!21795 (not b_next!12931))
