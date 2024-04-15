; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70898 () Bool)

(assert start!70898)

(declare-fun b_free!13135 () Bool)

(declare-fun b_next!13135 () Bool)

(assert (=> start!70898 (= b_free!13135 (not b_next!13135))))

(declare-fun tp!46156 () Bool)

(declare-fun b_and!22005 () Bool)

(assert (=> start!70898 (= tp!46156 b_and!22005)))

(declare-fun b!823408 () Bool)

(declare-fun e!457978 () Bool)

(declare-fun tp_is_empty!14845 () Bool)

(assert (=> b!823408 (= e!457978 tp_is_empty!14845)))

(declare-fun b!823409 () Bool)

(declare-fun e!457976 () Bool)

(assert (=> b!823409 (= e!457976 (not true))))

(declare-datatypes ((V!24795 0))(
  ( (V!24796 (val!7470 Int)) )
))
(declare-datatypes ((tuple2!9880 0))(
  ( (tuple2!9881 (_1!4951 (_ BitVec 64)) (_2!4951 V!24795)) )
))
(declare-datatypes ((List!15683 0))(
  ( (Nil!15680) (Cons!15679 (h!16808 tuple2!9880) (t!22015 List!15683)) )
))
(declare-datatypes ((ListLongMap!8693 0))(
  ( (ListLongMap!8694 (toList!4362 List!15683)) )
))
(declare-fun lt!371232 () ListLongMap!8693)

(declare-fun lt!371231 () ListLongMap!8693)

(assert (=> b!823409 (= lt!371232 lt!371231)))

(declare-fun zeroValueBefore!34 () V!24795)

(declare-datatypes ((array!45851 0))(
  ( (array!45852 (arr!21974 (Array (_ BitVec 32) (_ BitVec 64))) (size!22395 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45851)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24795)

(declare-fun minValue!754 () V!24795)

(declare-datatypes ((ValueCell!7007 0))(
  ( (ValueCellFull!7007 (v!9897 V!24795)) (EmptyCell!7007) )
))
(declare-datatypes ((array!45853 0))(
  ( (array!45854 (arr!21975 (Array (_ BitVec 32) ValueCell!7007)) (size!22396 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45853)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28148 0))(
  ( (Unit!28149) )
))
(declare-fun lt!371233 () Unit!28148)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!499 (array!45851 array!45853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24795 V!24795 V!24795 V!24795 (_ BitVec 32) Int) Unit!28148)

(assert (=> b!823409 (= lt!371233 (lemmaNoChangeToArrayThenSameMapNoExtras!499 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2406 (array!45851 array!45853 (_ BitVec 32) (_ BitVec 32) V!24795 V!24795 (_ BitVec 32) Int) ListLongMap!8693)

(assert (=> b!823409 (= lt!371231 (getCurrentListMapNoExtraKeys!2406 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823409 (= lt!371232 (getCurrentListMapNoExtraKeys!2406 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823410 () Bool)

(declare-fun e!457975 () Bool)

(assert (=> b!823410 (= e!457975 tp_is_empty!14845)))

(declare-fun res!561535 () Bool)

(assert (=> start!70898 (=> (not res!561535) (not e!457976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70898 (= res!561535 (validMask!0 mask!1312))))

(assert (=> start!70898 e!457976))

(assert (=> start!70898 tp_is_empty!14845))

(declare-fun array_inv!17605 (array!45851) Bool)

(assert (=> start!70898 (array_inv!17605 _keys!976)))

(assert (=> start!70898 true))

(declare-fun e!457977 () Bool)

(declare-fun array_inv!17606 (array!45853) Bool)

(assert (=> start!70898 (and (array_inv!17606 _values!788) e!457977)))

(assert (=> start!70898 tp!46156))

(declare-fun b!823411 () Bool)

(declare-fun res!561537 () Bool)

(assert (=> b!823411 (=> (not res!561537) (not e!457976))))

(declare-datatypes ((List!15684 0))(
  ( (Nil!15681) (Cons!15680 (h!16809 (_ BitVec 64)) (t!22016 List!15684)) )
))
(declare-fun arrayNoDuplicates!0 (array!45851 (_ BitVec 32) List!15684) Bool)

(assert (=> b!823411 (= res!561537 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15681))))

(declare-fun mapIsEmpty!23884 () Bool)

(declare-fun mapRes!23884 () Bool)

(assert (=> mapIsEmpty!23884 mapRes!23884))

(declare-fun b!823412 () Bool)

(assert (=> b!823412 (= e!457977 (and e!457975 mapRes!23884))))

(declare-fun condMapEmpty!23884 () Bool)

(declare-fun mapDefault!23884 () ValueCell!7007)

(assert (=> b!823412 (= condMapEmpty!23884 (= (arr!21975 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7007)) mapDefault!23884)))))

(declare-fun mapNonEmpty!23884 () Bool)

(declare-fun tp!46155 () Bool)

(assert (=> mapNonEmpty!23884 (= mapRes!23884 (and tp!46155 e!457978))))

(declare-fun mapValue!23884 () ValueCell!7007)

(declare-fun mapRest!23884 () (Array (_ BitVec 32) ValueCell!7007))

(declare-fun mapKey!23884 () (_ BitVec 32))

(assert (=> mapNonEmpty!23884 (= (arr!21975 _values!788) (store mapRest!23884 mapKey!23884 mapValue!23884))))

(declare-fun b!823413 () Bool)

(declare-fun res!561536 () Bool)

(assert (=> b!823413 (=> (not res!561536) (not e!457976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45851 (_ BitVec 32)) Bool)

(assert (=> b!823413 (= res!561536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823414 () Bool)

(declare-fun res!561538 () Bool)

(assert (=> b!823414 (=> (not res!561538) (not e!457976))))

(assert (=> b!823414 (= res!561538 (and (= (size!22396 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22395 _keys!976) (size!22396 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70898 res!561535) b!823414))

(assert (= (and b!823414 res!561538) b!823413))

(assert (= (and b!823413 res!561536) b!823411))

(assert (= (and b!823411 res!561537) b!823409))

(assert (= (and b!823412 condMapEmpty!23884) mapIsEmpty!23884))

(assert (= (and b!823412 (not condMapEmpty!23884)) mapNonEmpty!23884))

(get-info :version)

(assert (= (and mapNonEmpty!23884 ((_ is ValueCellFull!7007) mapValue!23884)) b!823408))

(assert (= (and b!823412 ((_ is ValueCellFull!7007) mapDefault!23884)) b!823410))

(assert (= start!70898 b!823412))

(declare-fun m!765113 () Bool)

(assert (=> b!823411 m!765113))

(declare-fun m!765115 () Bool)

(assert (=> b!823413 m!765115))

(declare-fun m!765117 () Bool)

(assert (=> start!70898 m!765117))

(declare-fun m!765119 () Bool)

(assert (=> start!70898 m!765119))

(declare-fun m!765121 () Bool)

(assert (=> start!70898 m!765121))

(declare-fun m!765123 () Bool)

(assert (=> mapNonEmpty!23884 m!765123))

(declare-fun m!765125 () Bool)

(assert (=> b!823409 m!765125))

(declare-fun m!765127 () Bool)

(assert (=> b!823409 m!765127))

(declare-fun m!765129 () Bool)

(assert (=> b!823409 m!765129))

(check-sat (not b!823409) (not b!823413) b_and!22005 (not start!70898) (not b_next!13135) tp_is_empty!14845 (not mapNonEmpty!23884) (not b!823411))
(check-sat b_and!22005 (not b_next!13135))
