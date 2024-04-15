; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70716 () Bool)

(assert start!70716)

(declare-fun b_free!13009 () Bool)

(declare-fun b_next!13009 () Bool)

(assert (=> start!70716 (= b_free!13009 (not b_next!13009))))

(declare-fun tp!45768 () Bool)

(declare-fun b_and!21845 () Bool)

(assert (=> start!70716 (= tp!45768 b_and!21845)))

(declare-fun b!821379 () Bool)

(declare-fun e!456515 () Bool)

(declare-fun tp_is_empty!14719 () Bool)

(assert (=> b!821379 (= e!456515 tp_is_empty!14719)))

(declare-fun b!821380 () Bool)

(declare-fun e!456513 () Bool)

(declare-fun mapRes!23686 () Bool)

(assert (=> b!821380 (= e!456513 (and e!456515 mapRes!23686))))

(declare-fun condMapEmpty!23686 () Bool)

(declare-datatypes ((V!24627 0))(
  ( (V!24628 (val!7407 Int)) )
))
(declare-datatypes ((ValueCell!6944 0))(
  ( (ValueCellFull!6944 (v!9832 V!24627)) (EmptyCell!6944) )
))
(declare-datatypes ((array!45601 0))(
  ( (array!45602 (arr!21852 (Array (_ BitVec 32) ValueCell!6944)) (size!22273 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45601)

(declare-fun mapDefault!23686 () ValueCell!6944)

(assert (=> b!821380 (= condMapEmpty!23686 (= (arr!21852 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6944)) mapDefault!23686)))))

(declare-fun b!821381 () Bool)

(declare-fun res!560371 () Bool)

(declare-fun e!456514 () Bool)

(assert (=> b!821381 (=> (not res!560371) (not e!456514))))

(declare-datatypes ((array!45603 0))(
  ( (array!45604 (arr!21853 (Array (_ BitVec 32) (_ BitVec 64))) (size!22274 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45603)

(declare-datatypes ((List!15595 0))(
  ( (Nil!15592) (Cons!15591 (h!16720 (_ BitVec 64)) (t!21921 List!15595)) )
))
(declare-fun arrayNoDuplicates!0 (array!45603 (_ BitVec 32) List!15595) Bool)

(assert (=> b!821381 (= res!560371 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15592))))

(declare-fun res!560368 () Bool)

(assert (=> start!70716 (=> (not res!560368) (not e!456514))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70716 (= res!560368 (validMask!0 mask!1312))))

(assert (=> start!70716 e!456514))

(assert (=> start!70716 tp_is_empty!14719))

(declare-fun array_inv!17531 (array!45603) Bool)

(assert (=> start!70716 (array_inv!17531 _keys!976)))

(assert (=> start!70716 true))

(declare-fun array_inv!17532 (array!45601) Bool)

(assert (=> start!70716 (and (array_inv!17532 _values!788) e!456513)))

(assert (=> start!70716 tp!45768))

(declare-fun mapNonEmpty!23686 () Bool)

(declare-fun tp!45769 () Bool)

(declare-fun e!456517 () Bool)

(assert (=> mapNonEmpty!23686 (= mapRes!23686 (and tp!45769 e!456517))))

(declare-fun mapValue!23686 () ValueCell!6944)

(declare-fun mapKey!23686 () (_ BitVec 32))

(declare-fun mapRest!23686 () (Array (_ BitVec 32) ValueCell!6944))

(assert (=> mapNonEmpty!23686 (= (arr!21852 _values!788) (store mapRest!23686 mapKey!23686 mapValue!23686))))

(declare-fun b!821382 () Bool)

(declare-fun e!456516 () Bool)

(assert (=> b!821382 (= e!456514 (not e!456516))))

(declare-fun res!560370 () Bool)

(assert (=> b!821382 (=> res!560370 e!456516)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821382 (= res!560370 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9786 0))(
  ( (tuple2!9787 (_1!4904 (_ BitVec 64)) (_2!4904 V!24627)) )
))
(declare-datatypes ((List!15596 0))(
  ( (Nil!15593) (Cons!15592 (h!16721 tuple2!9786) (t!21922 List!15596)) )
))
(declare-datatypes ((ListLongMap!8599 0))(
  ( (ListLongMap!8600 (toList!4315 List!15596)) )
))
(declare-fun lt!369073 () ListLongMap!8599)

(declare-fun lt!369074 () ListLongMap!8599)

(assert (=> b!821382 (= lt!369073 lt!369074)))

(declare-fun zeroValueBefore!34 () V!24627)

(declare-fun zeroValueAfter!34 () V!24627)

(declare-fun minValue!754 () V!24627)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28051 0))(
  ( (Unit!28052) )
))
(declare-fun lt!369071 () Unit!28051)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!456 (array!45603 array!45601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24627 V!24627 V!24627 V!24627 (_ BitVec 32) Int) Unit!28051)

(assert (=> b!821382 (= lt!369071 (lemmaNoChangeToArrayThenSameMapNoExtras!456 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2363 (array!45603 array!45601 (_ BitVec 32) (_ BitVec 32) V!24627 V!24627 (_ BitVec 32) Int) ListLongMap!8599)

(assert (=> b!821382 (= lt!369074 (getCurrentListMapNoExtraKeys!2363 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821382 (= lt!369073 (getCurrentListMapNoExtraKeys!2363 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23686 () Bool)

(assert (=> mapIsEmpty!23686 mapRes!23686))

(declare-fun b!821383 () Bool)

(assert (=> b!821383 (= e!456516 true)))

(declare-fun lt!369072 () ListLongMap!8599)

(declare-fun getCurrentListMap!2441 (array!45603 array!45601 (_ BitVec 32) (_ BitVec 32) V!24627 V!24627 (_ BitVec 32) Int) ListLongMap!8599)

(assert (=> b!821383 (= lt!369072 (getCurrentListMap!2441 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821384 () Bool)

(declare-fun res!560367 () Bool)

(assert (=> b!821384 (=> (not res!560367) (not e!456514))))

(assert (=> b!821384 (= res!560367 (and (= (size!22273 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22274 _keys!976) (size!22273 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821385 () Bool)

(assert (=> b!821385 (= e!456517 tp_is_empty!14719)))

(declare-fun b!821386 () Bool)

(declare-fun res!560369 () Bool)

(assert (=> b!821386 (=> (not res!560369) (not e!456514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45603 (_ BitVec 32)) Bool)

(assert (=> b!821386 (= res!560369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70716 res!560368) b!821384))

(assert (= (and b!821384 res!560367) b!821386))

(assert (= (and b!821386 res!560369) b!821381))

(assert (= (and b!821381 res!560371) b!821382))

(assert (= (and b!821382 (not res!560370)) b!821383))

(assert (= (and b!821380 condMapEmpty!23686) mapIsEmpty!23686))

(assert (= (and b!821380 (not condMapEmpty!23686)) mapNonEmpty!23686))

(get-info :version)

(assert (= (and mapNonEmpty!23686 ((_ is ValueCellFull!6944) mapValue!23686)) b!821385))

(assert (= (and b!821380 ((_ is ValueCellFull!6944) mapDefault!23686)) b!821379))

(assert (= start!70716 b!821380))

(declare-fun m!762637 () Bool)

(assert (=> b!821382 m!762637))

(declare-fun m!762639 () Bool)

(assert (=> b!821382 m!762639))

(declare-fun m!762641 () Bool)

(assert (=> b!821382 m!762641))

(declare-fun m!762643 () Bool)

(assert (=> mapNonEmpty!23686 m!762643))

(declare-fun m!762645 () Bool)

(assert (=> b!821383 m!762645))

(declare-fun m!762647 () Bool)

(assert (=> b!821386 m!762647))

(declare-fun m!762649 () Bool)

(assert (=> b!821381 m!762649))

(declare-fun m!762651 () Bool)

(assert (=> start!70716 m!762651))

(declare-fun m!762653 () Bool)

(assert (=> start!70716 m!762653))

(declare-fun m!762655 () Bool)

(assert (=> start!70716 m!762655))

(check-sat (not b_next!13009) (not b!821383) b_and!21845 (not b!821381) tp_is_empty!14719 (not start!70716) (not b!821386) (not mapNonEmpty!23686) (not b!821382))
(check-sat b_and!21845 (not b_next!13009))
