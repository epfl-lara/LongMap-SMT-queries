; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70768 () Bool)

(assert start!70768)

(declare-fun b_free!13045 () Bool)

(declare-fun b_next!13045 () Bool)

(assert (=> start!70768 (= b_free!13045 (not b_next!13045))))

(declare-fun tp!45879 () Bool)

(declare-fun b_and!21891 () Bool)

(assert (=> start!70768 (= tp!45879 b_and!21891)))

(declare-fun b!821968 () Bool)

(declare-fun e!456940 () Bool)

(declare-fun e!456944 () Bool)

(declare-fun mapRes!23743 () Bool)

(assert (=> b!821968 (= e!456940 (and e!456944 mapRes!23743))))

(declare-fun condMapEmpty!23743 () Bool)

(declare-datatypes ((V!24675 0))(
  ( (V!24676 (val!7425 Int)) )
))
(declare-datatypes ((ValueCell!6962 0))(
  ( (ValueCellFull!6962 (v!9850 V!24675)) (EmptyCell!6962) )
))
(declare-datatypes ((array!45671 0))(
  ( (array!45672 (arr!21886 (Array (_ BitVec 32) ValueCell!6962)) (size!22307 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45671)

(declare-fun mapDefault!23743 () ValueCell!6962)

(assert (=> b!821968 (= condMapEmpty!23743 (= (arr!21886 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6962)) mapDefault!23743)))))

(declare-fun mapIsEmpty!23743 () Bool)

(assert (=> mapIsEmpty!23743 mapRes!23743))

(declare-fun b!821969 () Bool)

(declare-fun res!560704 () Bool)

(declare-fun e!456943 () Bool)

(assert (=> b!821969 (=> (not res!560704) (not e!456943))))

(declare-datatypes ((array!45673 0))(
  ( (array!45674 (arr!21887 (Array (_ BitVec 32) (_ BitVec 64))) (size!22308 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45673)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45673 (_ BitVec 32)) Bool)

(assert (=> b!821969 (= res!560704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821970 () Bool)

(declare-fun res!560705 () Bool)

(assert (=> b!821970 (=> (not res!560705) (not e!456943))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821970 (= res!560705 (and (= (size!22307 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22308 _keys!976) (size!22307 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821971 () Bool)

(declare-fun tp_is_empty!14755 () Bool)

(assert (=> b!821971 (= e!456944 tp_is_empty!14755)))

(declare-fun b!821972 () Bool)

(declare-fun res!560707 () Bool)

(assert (=> b!821972 (=> (not res!560707) (not e!456943))))

(declare-datatypes ((List!15618 0))(
  ( (Nil!15615) (Cons!15614 (h!16743 (_ BitVec 64)) (t!21946 List!15618)) )
))
(declare-fun arrayNoDuplicates!0 (array!45673 (_ BitVec 32) List!15618) Bool)

(assert (=> b!821972 (= res!560707 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15615))))

(declare-fun res!560708 () Bool)

(assert (=> start!70768 (=> (not res!560708) (not e!456943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70768 (= res!560708 (validMask!0 mask!1312))))

(assert (=> start!70768 e!456943))

(assert (=> start!70768 tp_is_empty!14755))

(declare-fun array_inv!17547 (array!45673) Bool)

(assert (=> start!70768 (array_inv!17547 _keys!976)))

(assert (=> start!70768 true))

(declare-fun array_inv!17548 (array!45671) Bool)

(assert (=> start!70768 (and (array_inv!17548 _values!788) e!456940)))

(assert (=> start!70768 tp!45879))

(declare-fun b!821973 () Bool)

(declare-fun e!456942 () Bool)

(assert (=> b!821973 (= e!456942 tp_is_empty!14755)))

(declare-fun b!821974 () Bool)

(declare-fun e!456941 () Bool)

(assert (=> b!821974 (= e!456943 (not e!456941))))

(declare-fun res!560706 () Bool)

(assert (=> b!821974 (=> res!560706 e!456941)))

(assert (=> b!821974 (= res!560706 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9806 0))(
  ( (tuple2!9807 (_1!4914 (_ BitVec 64)) (_2!4914 V!24675)) )
))
(declare-datatypes ((List!15619 0))(
  ( (Nil!15616) (Cons!15615 (h!16744 tuple2!9806) (t!21947 List!15619)) )
))
(declare-datatypes ((ListLongMap!8619 0))(
  ( (ListLongMap!8620 (toList!4325 List!15619)) )
))
(declare-fun lt!369589 () ListLongMap!8619)

(declare-fun lt!369588 () ListLongMap!8619)

(assert (=> b!821974 (= lt!369589 lt!369588)))

(declare-datatypes ((Unit!28070 0))(
  ( (Unit!28071) )
))
(declare-fun lt!369585 () Unit!28070)

(declare-fun zeroValueBefore!34 () V!24675)

(declare-fun zeroValueAfter!34 () V!24675)

(declare-fun minValue!754 () V!24675)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!465 (array!45673 array!45671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24675 V!24675 V!24675 V!24675 (_ BitVec 32) Int) Unit!28070)

(assert (=> b!821974 (= lt!369585 (lemmaNoChangeToArrayThenSameMapNoExtras!465 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2372 (array!45673 array!45671 (_ BitVec 32) (_ BitVec 32) V!24675 V!24675 (_ BitVec 32) Int) ListLongMap!8619)

(assert (=> b!821974 (= lt!369588 (getCurrentListMapNoExtraKeys!2372 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821974 (= lt!369589 (getCurrentListMapNoExtraKeys!2372 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23743 () Bool)

(declare-fun tp!45880 () Bool)

(assert (=> mapNonEmpty!23743 (= mapRes!23743 (and tp!45880 e!456942))))

(declare-fun mapKey!23743 () (_ BitVec 32))

(declare-fun mapValue!23743 () ValueCell!6962)

(declare-fun mapRest!23743 () (Array (_ BitVec 32) ValueCell!6962))

(assert (=> mapNonEmpty!23743 (= (arr!21886 _values!788) (store mapRest!23743 mapKey!23743 mapValue!23743))))

(declare-fun b!821975 () Bool)

(assert (=> b!821975 (= e!456941 true)))

(declare-fun lt!369592 () ListLongMap!8619)

(declare-fun lt!369587 () ListLongMap!8619)

(declare-fun lt!369594 () tuple2!9806)

(declare-fun +!1907 (ListLongMap!8619 tuple2!9806) ListLongMap!8619)

(assert (=> b!821975 (= lt!369592 (+!1907 lt!369587 lt!369594))))

(declare-fun lt!369591 () Unit!28070)

(declare-fun addCommutativeForDiffKeys!438 (ListLongMap!8619 (_ BitVec 64) V!24675 (_ BitVec 64) V!24675) Unit!28070)

(assert (=> b!821975 (= lt!369591 (addCommutativeForDiffKeys!438 lt!369589 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!369590 () ListLongMap!8619)

(assert (=> b!821975 (= lt!369590 lt!369592)))

(declare-fun lt!369586 () tuple2!9806)

(assert (=> b!821975 (= lt!369592 (+!1907 (+!1907 lt!369589 lt!369594) lt!369586))))

(assert (=> b!821975 (= lt!369594 (tuple2!9807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!369593 () ListLongMap!8619)

(assert (=> b!821975 (= lt!369593 lt!369587)))

(assert (=> b!821975 (= lt!369587 (+!1907 lt!369589 lt!369586))))

(assert (=> b!821975 (= lt!369586 (tuple2!9807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2449 (array!45673 array!45671 (_ BitVec 32) (_ BitVec 32) V!24675 V!24675 (_ BitVec 32) Int) ListLongMap!8619)

(assert (=> b!821975 (= lt!369590 (getCurrentListMap!2449 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821975 (= lt!369593 (getCurrentListMap!2449 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70768 res!560708) b!821970))

(assert (= (and b!821970 res!560705) b!821969))

(assert (= (and b!821969 res!560704) b!821972))

(assert (= (and b!821972 res!560707) b!821974))

(assert (= (and b!821974 (not res!560706)) b!821975))

(assert (= (and b!821968 condMapEmpty!23743) mapIsEmpty!23743))

(assert (= (and b!821968 (not condMapEmpty!23743)) mapNonEmpty!23743))

(get-info :version)

(assert (= (and mapNonEmpty!23743 ((_ is ValueCellFull!6962) mapValue!23743)) b!821973))

(assert (= (and b!821968 ((_ is ValueCellFull!6962) mapDefault!23743)) b!821971))

(assert (= start!70768 b!821968))

(declare-fun m!763241 () Bool)

(assert (=> b!821972 m!763241))

(declare-fun m!763243 () Bool)

(assert (=> b!821974 m!763243))

(declare-fun m!763245 () Bool)

(assert (=> b!821974 m!763245))

(declare-fun m!763247 () Bool)

(assert (=> b!821974 m!763247))

(declare-fun m!763249 () Bool)

(assert (=> b!821975 m!763249))

(declare-fun m!763251 () Bool)

(assert (=> b!821975 m!763251))

(declare-fun m!763253 () Bool)

(assert (=> b!821975 m!763253))

(declare-fun m!763255 () Bool)

(assert (=> b!821975 m!763255))

(declare-fun m!763257 () Bool)

(assert (=> b!821975 m!763257))

(declare-fun m!763259 () Bool)

(assert (=> b!821975 m!763259))

(assert (=> b!821975 m!763249))

(declare-fun m!763261 () Bool)

(assert (=> b!821975 m!763261))

(declare-fun m!763263 () Bool)

(assert (=> b!821969 m!763263))

(declare-fun m!763265 () Bool)

(assert (=> mapNonEmpty!23743 m!763265))

(declare-fun m!763267 () Bool)

(assert (=> start!70768 m!763267))

(declare-fun m!763269 () Bool)

(assert (=> start!70768 m!763269))

(declare-fun m!763271 () Bool)

(assert (=> start!70768 m!763271))

(check-sat (not b_next!13045) b_and!21891 (not mapNonEmpty!23743) (not b!821972) (not b!821974) (not b!821975) tp_is_empty!14755 (not start!70768) (not b!821969))
(check-sat b_and!21891 (not b_next!13045))
