; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70714 () Bool)

(assert start!70714)

(declare-fun b_free!12987 () Bool)

(declare-fun b_next!12987 () Bool)

(assert (=> start!70714 (= b_free!12987 (not b_next!12987))))

(declare-fun tp!45703 () Bool)

(declare-fun b_and!21849 () Bool)

(assert (=> start!70714 (= tp!45703 b_and!21849)))

(declare-fun res!560310 () Bool)

(declare-fun e!456466 () Bool)

(assert (=> start!70714 (=> (not res!560310) (not e!456466))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70714 (= res!560310 (validMask!0 mask!1312))))

(assert (=> start!70714 e!456466))

(declare-fun tp_is_empty!14697 () Bool)

(assert (=> start!70714 tp_is_empty!14697))

(declare-datatypes ((array!45590 0))(
  ( (array!45591 (arr!21846 (Array (_ BitVec 32) (_ BitVec 64))) (size!22267 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45590)

(declare-fun array_inv!17459 (array!45590) Bool)

(assert (=> start!70714 (array_inv!17459 _keys!976)))

(assert (=> start!70714 true))

(declare-datatypes ((V!24597 0))(
  ( (V!24598 (val!7396 Int)) )
))
(declare-datatypes ((ValueCell!6933 0))(
  ( (ValueCellFull!6933 (v!9827 V!24597)) (EmptyCell!6933) )
))
(declare-datatypes ((array!45592 0))(
  ( (array!45593 (arr!21847 (Array (_ BitVec 32) ValueCell!6933)) (size!22268 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45592)

(declare-fun e!456469 () Bool)

(declare-fun array_inv!17460 (array!45592) Bool)

(assert (=> start!70714 (and (array_inv!17460 _values!788) e!456469)))

(assert (=> start!70714 tp!45703))

(declare-fun b!821361 () Bool)

(declare-fun e!456470 () Bool)

(assert (=> b!821361 (= e!456470 tp_is_empty!14697)))

(declare-fun b!821362 () Bool)

(declare-fun res!560309 () Bool)

(assert (=> b!821362 (=> (not res!560309) (not e!456466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45590 (_ BitVec 32)) Bool)

(assert (=> b!821362 (= res!560309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23653 () Bool)

(declare-fun mapRes!23653 () Bool)

(assert (=> mapIsEmpty!23653 mapRes!23653))

(declare-fun b!821363 () Bool)

(declare-fun res!560312 () Bool)

(assert (=> b!821363 (=> (not res!560312) (not e!456466))))

(declare-datatypes ((List!15575 0))(
  ( (Nil!15572) (Cons!15571 (h!16700 (_ BitVec 64)) (t!21910 List!15575)) )
))
(declare-fun arrayNoDuplicates!0 (array!45590 (_ BitVec 32) List!15575) Bool)

(assert (=> b!821363 (= res!560312 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15572))))

(declare-fun b!821364 () Bool)

(declare-fun e!456465 () Bool)

(assert (=> b!821364 (= e!456466 (not e!456465))))

(declare-fun res!560308 () Bool)

(assert (=> b!821364 (=> res!560308 e!456465)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!821364 (= res!560308 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9758 0))(
  ( (tuple2!9759 (_1!4890 (_ BitVec 64)) (_2!4890 V!24597)) )
))
(declare-datatypes ((List!15576 0))(
  ( (Nil!15573) (Cons!15572 (h!16701 tuple2!9758) (t!21911 List!15576)) )
))
(declare-datatypes ((ListLongMap!8581 0))(
  ( (ListLongMap!8582 (toList!4306 List!15576)) )
))
(declare-fun lt!369185 () ListLongMap!8581)

(declare-fun lt!369182 () ListLongMap!8581)

(assert (=> b!821364 (= lt!369185 lt!369182)))

(declare-fun zeroValueBefore!34 () V!24597)

(declare-fun zeroValueAfter!34 () V!24597)

(declare-fun minValue!754 () V!24597)

(declare-datatypes ((Unit!28089 0))(
  ( (Unit!28090) )
))
(declare-fun lt!369183 () Unit!28089)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!442 (array!45590 array!45592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24597 V!24597 V!24597 V!24597 (_ BitVec 32) Int) Unit!28089)

(assert (=> b!821364 (= lt!369183 (lemmaNoChangeToArrayThenSameMapNoExtras!442 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2332 (array!45590 array!45592 (_ BitVec 32) (_ BitVec 32) V!24597 V!24597 (_ BitVec 32) Int) ListLongMap!8581)

(assert (=> b!821364 (= lt!369182 (getCurrentListMapNoExtraKeys!2332 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821364 (= lt!369185 (getCurrentListMapNoExtraKeys!2332 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821365 () Bool)

(declare-fun res!560311 () Bool)

(assert (=> b!821365 (=> (not res!560311) (not e!456466))))

(assert (=> b!821365 (= res!560311 (and (= (size!22268 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22267 _keys!976) (size!22268 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23653 () Bool)

(declare-fun tp!45702 () Bool)

(declare-fun e!456468 () Bool)

(assert (=> mapNonEmpty!23653 (= mapRes!23653 (and tp!45702 e!456468))))

(declare-fun mapRest!23653 () (Array (_ BitVec 32) ValueCell!6933))

(declare-fun mapKey!23653 () (_ BitVec 32))

(declare-fun mapValue!23653 () ValueCell!6933)

(assert (=> mapNonEmpty!23653 (= (arr!21847 _values!788) (store mapRest!23653 mapKey!23653 mapValue!23653))))

(declare-fun b!821366 () Bool)

(assert (=> b!821366 (= e!456469 (and e!456470 mapRes!23653))))

(declare-fun condMapEmpty!23653 () Bool)

(declare-fun mapDefault!23653 () ValueCell!6933)

(assert (=> b!821366 (= condMapEmpty!23653 (= (arr!21847 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6933)) mapDefault!23653)))))

(declare-fun b!821367 () Bool)

(assert (=> b!821367 (= e!456468 tp_is_empty!14697)))

(declare-fun b!821368 () Bool)

(assert (=> b!821368 (= e!456465 true)))

(declare-fun lt!369184 () ListLongMap!8581)

(declare-fun getCurrentListMap!2475 (array!45590 array!45592 (_ BitVec 32) (_ BitVec 32) V!24597 V!24597 (_ BitVec 32) Int) ListLongMap!8581)

(assert (=> b!821368 (= lt!369184 (getCurrentListMap!2475 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70714 res!560310) b!821365))

(assert (= (and b!821365 res!560311) b!821362))

(assert (= (and b!821362 res!560309) b!821363))

(assert (= (and b!821363 res!560312) b!821364))

(assert (= (and b!821364 (not res!560308)) b!821368))

(assert (= (and b!821366 condMapEmpty!23653) mapIsEmpty!23653))

(assert (= (and b!821366 (not condMapEmpty!23653)) mapNonEmpty!23653))

(get-info :version)

(assert (= (and mapNonEmpty!23653 ((_ is ValueCellFull!6933) mapValue!23653)) b!821367))

(assert (= (and b!821366 ((_ is ValueCellFull!6933) mapDefault!23653)) b!821361))

(assert (= start!70714 b!821366))

(declare-fun m!763169 () Bool)

(assert (=> mapNonEmpty!23653 m!763169))

(declare-fun m!763171 () Bool)

(assert (=> b!821363 m!763171))

(declare-fun m!763173 () Bool)

(assert (=> b!821364 m!763173))

(declare-fun m!763175 () Bool)

(assert (=> b!821364 m!763175))

(declare-fun m!763177 () Bool)

(assert (=> b!821364 m!763177))

(declare-fun m!763179 () Bool)

(assert (=> b!821362 m!763179))

(declare-fun m!763181 () Bool)

(assert (=> b!821368 m!763181))

(declare-fun m!763183 () Bool)

(assert (=> start!70714 m!763183))

(declare-fun m!763185 () Bool)

(assert (=> start!70714 m!763185))

(declare-fun m!763187 () Bool)

(assert (=> start!70714 m!763187))

(check-sat tp_is_empty!14697 b_and!21849 (not b!821362) (not b_next!12987) (not b!821363) (not b!821364) (not mapNonEmpty!23653) (not start!70714) (not b!821368))
(check-sat b_and!21849 (not b_next!12987))
