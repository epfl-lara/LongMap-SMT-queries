; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70822 () Bool)

(assert start!70822)

(declare-fun b_free!12943 () Bool)

(declare-fun b_next!12943 () Bool)

(assert (=> start!70822 (= b_free!12943 (not b_next!12943))))

(declare-fun tp!45568 () Bool)

(declare-fun b_and!21807 () Bool)

(assert (=> start!70822 (= tp!45568 b_and!21807)))

(declare-fun b!821676 () Bool)

(declare-fun res!560330 () Bool)

(declare-fun e!456626 () Bool)

(assert (=> b!821676 (=> (not res!560330) (not e!456626))))

(declare-datatypes ((array!45505 0))(
  ( (array!45506 (arr!21800 (Array (_ BitVec 32) (_ BitVec 64))) (size!22220 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45505)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45505 (_ BitVec 32)) Bool)

(assert (=> b!821676 (= res!560330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821677 () Bool)

(assert (=> b!821677 (= e!456626 (not true))))

(declare-datatypes ((V!24539 0))(
  ( (V!24540 (val!7374 Int)) )
))
(declare-datatypes ((tuple2!9632 0))(
  ( (tuple2!9633 (_1!4827 (_ BitVec 64)) (_2!4827 V!24539)) )
))
(declare-datatypes ((List!15428 0))(
  ( (Nil!15425) (Cons!15424 (h!16559 tuple2!9632) (t!21753 List!15428)) )
))
(declare-datatypes ((ListLongMap!8457 0))(
  ( (ListLongMap!8458 (toList!4244 List!15428)) )
))
(declare-fun lt!369268 () ListLongMap!8457)

(declare-fun lt!369267 () ListLongMap!8457)

(assert (=> b!821677 (= lt!369268 lt!369267)))

(declare-fun zeroValueBefore!34 () V!24539)

(declare-fun zeroValueAfter!34 () V!24539)

(declare-fun minValue!754 () V!24539)

(declare-datatypes ((ValueCell!6911 0))(
  ( (ValueCellFull!6911 (v!9805 V!24539)) (EmptyCell!6911) )
))
(declare-datatypes ((array!45507 0))(
  ( (array!45508 (arr!21801 (Array (_ BitVec 32) ValueCell!6911)) (size!22221 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45507)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((Unit!28040 0))(
  ( (Unit!28041) )
))
(declare-fun lt!369266 () Unit!28040)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!423 (array!45505 array!45507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24539 V!24539 V!24539 V!24539 (_ BitVec 32) Int) Unit!28040)

(assert (=> b!821677 (= lt!369266 (lemmaNoChangeToArrayThenSameMapNoExtras!423 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2335 (array!45505 array!45507 (_ BitVec 32) (_ BitVec 32) V!24539 V!24539 (_ BitVec 32) Int) ListLongMap!8457)

(assert (=> b!821677 (= lt!369267 (getCurrentListMapNoExtraKeys!2335 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821677 (= lt!369268 (getCurrentListMapNoExtraKeys!2335 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23584 () Bool)

(declare-fun mapRes!23584 () Bool)

(declare-fun tp!45567 () Bool)

(declare-fun e!456627 () Bool)

(assert (=> mapNonEmpty!23584 (= mapRes!23584 (and tp!45567 e!456627))))

(declare-fun mapValue!23584 () ValueCell!6911)

(declare-fun mapRest!23584 () (Array (_ BitVec 32) ValueCell!6911))

(declare-fun mapKey!23584 () (_ BitVec 32))

(assert (=> mapNonEmpty!23584 (= (arr!21801 _values!788) (store mapRest!23584 mapKey!23584 mapValue!23584))))

(declare-fun b!821678 () Bool)

(declare-fun e!456630 () Bool)

(declare-fun e!456629 () Bool)

(assert (=> b!821678 (= e!456630 (and e!456629 mapRes!23584))))

(declare-fun condMapEmpty!23584 () Bool)

(declare-fun mapDefault!23584 () ValueCell!6911)

(assert (=> b!821678 (= condMapEmpty!23584 (= (arr!21801 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6911)) mapDefault!23584)))))

(declare-fun b!821679 () Bool)

(declare-fun tp_is_empty!14653 () Bool)

(assert (=> b!821679 (= e!456627 tp_is_empty!14653)))

(declare-fun mapIsEmpty!23584 () Bool)

(assert (=> mapIsEmpty!23584 mapRes!23584))

(declare-fun b!821680 () Bool)

(declare-fun res!560329 () Bool)

(assert (=> b!821680 (=> (not res!560329) (not e!456626))))

(declare-datatypes ((List!15429 0))(
  ( (Nil!15426) (Cons!15425 (h!16560 (_ BitVec 64)) (t!21754 List!15429)) )
))
(declare-fun arrayNoDuplicates!0 (array!45505 (_ BitVec 32) List!15429) Bool)

(assert (=> b!821680 (= res!560329 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15426))))

(declare-fun res!560328 () Bool)

(assert (=> start!70822 (=> (not res!560328) (not e!456626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70822 (= res!560328 (validMask!0 mask!1312))))

(assert (=> start!70822 e!456626))

(assert (=> start!70822 tp_is_empty!14653))

(declare-fun array_inv!17451 (array!45505) Bool)

(assert (=> start!70822 (array_inv!17451 _keys!976)))

(assert (=> start!70822 true))

(declare-fun array_inv!17452 (array!45507) Bool)

(assert (=> start!70822 (and (array_inv!17452 _values!788) e!456630)))

(assert (=> start!70822 tp!45568))

(declare-fun b!821681 () Bool)

(declare-fun res!560327 () Bool)

(assert (=> b!821681 (=> (not res!560327) (not e!456626))))

(assert (=> b!821681 (= res!560327 (and (= (size!22221 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22220 _keys!976) (size!22221 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821682 () Bool)

(assert (=> b!821682 (= e!456629 tp_is_empty!14653)))

(assert (= (and start!70822 res!560328) b!821681))

(assert (= (and b!821681 res!560327) b!821676))

(assert (= (and b!821676 res!560330) b!821680))

(assert (= (and b!821680 res!560329) b!821677))

(assert (= (and b!821678 condMapEmpty!23584) mapIsEmpty!23584))

(assert (= (and b!821678 (not condMapEmpty!23584)) mapNonEmpty!23584))

(get-info :version)

(assert (= (and mapNonEmpty!23584 ((_ is ValueCellFull!6911) mapValue!23584)) b!821679))

(assert (= (and b!821678 ((_ is ValueCellFull!6911) mapDefault!23584)) b!821682))

(assert (= start!70822 b!821678))

(declare-fun m!763969 () Bool)

(assert (=> mapNonEmpty!23584 m!763969))

(declare-fun m!763971 () Bool)

(assert (=> b!821677 m!763971))

(declare-fun m!763973 () Bool)

(assert (=> b!821677 m!763973))

(declare-fun m!763975 () Bool)

(assert (=> b!821677 m!763975))

(declare-fun m!763977 () Bool)

(assert (=> start!70822 m!763977))

(declare-fun m!763979 () Bool)

(assert (=> start!70822 m!763979))

(declare-fun m!763981 () Bool)

(assert (=> start!70822 m!763981))

(declare-fun m!763983 () Bool)

(assert (=> b!821680 m!763983))

(declare-fun m!763985 () Bool)

(assert (=> b!821676 m!763985))

(check-sat tp_is_empty!14653 (not mapNonEmpty!23584) b_and!21807 (not start!70822) (not b!821677) (not b!821680) (not b!821676) (not b_next!12943))
(check-sat b_and!21807 (not b_next!12943))
