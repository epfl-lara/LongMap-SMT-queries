; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70872 () Bool)

(assert start!70872)

(declare-fun b_free!12979 () Bool)

(declare-fun b_next!12979 () Bool)

(assert (=> start!70872 (= b_free!12979 (not b_next!12979))))

(declare-fun tp!45678 () Bool)

(declare-fun b_and!21851 () Bool)

(assert (=> start!70872 (= tp!45678 b_and!21851)))

(declare-fun mapNonEmpty!23641 () Bool)

(declare-fun mapRes!23641 () Bool)

(declare-fun tp!45679 () Bool)

(declare-fun e!456975 () Bool)

(assert (=> mapNonEmpty!23641 (= mapRes!23641 (and tp!45679 e!456975))))

(declare-datatypes ((V!24587 0))(
  ( (V!24588 (val!7392 Int)) )
))
(declare-datatypes ((ValueCell!6929 0))(
  ( (ValueCellFull!6929 (v!9823 V!24587)) (EmptyCell!6929) )
))
(declare-fun mapRest!23641 () (Array (_ BitVec 32) ValueCell!6929))

(declare-fun mapKey!23641 () (_ BitVec 32))

(declare-datatypes ((array!45577 0))(
  ( (array!45578 (arr!21835 (Array (_ BitVec 32) ValueCell!6929)) (size!22255 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45577)

(declare-fun mapValue!23641 () ValueCell!6929)

(assert (=> mapNonEmpty!23641 (= (arr!21835 _values!788) (store mapRest!23641 mapKey!23641 mapValue!23641))))

(declare-fun b!822159 () Bool)

(declare-fun e!456976 () Bool)

(declare-fun e!456973 () Bool)

(assert (=> b!822159 (= e!456976 (and e!456973 mapRes!23641))))

(declare-fun condMapEmpty!23641 () Bool)

(declare-fun mapDefault!23641 () ValueCell!6929)

(assert (=> b!822159 (= condMapEmpty!23641 (= (arr!21835 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6929)) mapDefault!23641)))))

(declare-fun b!822160 () Bool)

(declare-fun res!560594 () Bool)

(declare-fun e!456974 () Bool)

(assert (=> b!822160 (=> (not res!560594) (not e!456974))))

(declare-datatypes ((array!45579 0))(
  ( (array!45580 (arr!21836 (Array (_ BitVec 32) (_ BitVec 64))) (size!22256 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45579)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822160 (= res!560594 (and (= (size!22255 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22256 _keys!976) (size!22255 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23641 () Bool)

(assert (=> mapIsEmpty!23641 mapRes!23641))

(declare-fun res!560597 () Bool)

(assert (=> start!70872 (=> (not res!560597) (not e!456974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70872 (= res!560597 (validMask!0 mask!1312))))

(assert (=> start!70872 e!456974))

(declare-fun tp_is_empty!14689 () Bool)

(assert (=> start!70872 tp_is_empty!14689))

(declare-fun array_inv!17475 (array!45579) Bool)

(assert (=> start!70872 (array_inv!17475 _keys!976)))

(assert (=> start!70872 true))

(declare-fun array_inv!17476 (array!45577) Bool)

(assert (=> start!70872 (and (array_inv!17476 _values!788) e!456976)))

(assert (=> start!70872 tp!45678))

(declare-fun b!822161 () Bool)

(declare-fun e!456972 () Bool)

(assert (=> b!822161 (= e!456972 true)))

(declare-fun zeroValueBefore!34 () V!24587)

(declare-fun minValue!754 () V!24587)

(declare-datatypes ((tuple2!9664 0))(
  ( (tuple2!9665 (_1!4843 (_ BitVec 64)) (_2!4843 V!24587)) )
))
(declare-datatypes ((List!15456 0))(
  ( (Nil!15453) (Cons!15452 (h!16587 tuple2!9664) (t!21783 List!15456)) )
))
(declare-datatypes ((ListLongMap!8489 0))(
  ( (ListLongMap!8490 (toList!4260 List!15456)) )
))
(declare-fun lt!369489 () ListLongMap!8489)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2420 (array!45579 array!45577 (_ BitVec 32) (_ BitVec 32) V!24587 V!24587 (_ BitVec 32) Int) ListLongMap!8489)

(assert (=> b!822161 (= lt!369489 (getCurrentListMap!2420 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822162 () Bool)

(declare-fun res!560596 () Bool)

(assert (=> b!822162 (=> (not res!560596) (not e!456974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45579 (_ BitVec 32)) Bool)

(assert (=> b!822162 (= res!560596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822163 () Bool)

(assert (=> b!822163 (= e!456973 tp_is_empty!14689)))

(declare-fun b!822164 () Bool)

(declare-fun res!560598 () Bool)

(assert (=> b!822164 (=> (not res!560598) (not e!456974))))

(declare-datatypes ((List!15457 0))(
  ( (Nil!15454) (Cons!15453 (h!16588 (_ BitVec 64)) (t!21784 List!15457)) )
))
(declare-fun arrayNoDuplicates!0 (array!45579 (_ BitVec 32) List!15457) Bool)

(assert (=> b!822164 (= res!560598 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15454))))

(declare-fun b!822165 () Bool)

(assert (=> b!822165 (= e!456975 tp_is_empty!14689)))

(declare-fun b!822166 () Bool)

(assert (=> b!822166 (= e!456974 (not e!456972))))

(declare-fun res!560595 () Bool)

(assert (=> b!822166 (=> res!560595 e!456972)))

(assert (=> b!822166 (= res!560595 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369488 () ListLongMap!8489)

(declare-fun lt!369490 () ListLongMap!8489)

(assert (=> b!822166 (= lt!369488 lt!369490)))

(declare-fun zeroValueAfter!34 () V!24587)

(declare-datatypes ((Unit!28070 0))(
  ( (Unit!28071) )
))
(declare-fun lt!369491 () Unit!28070)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!438 (array!45579 array!45577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24587 V!24587 V!24587 V!24587 (_ BitVec 32) Int) Unit!28070)

(assert (=> b!822166 (= lt!369491 (lemmaNoChangeToArrayThenSameMapNoExtras!438 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2350 (array!45579 array!45577 (_ BitVec 32) (_ BitVec 32) V!24587 V!24587 (_ BitVec 32) Int) ListLongMap!8489)

(assert (=> b!822166 (= lt!369490 (getCurrentListMapNoExtraKeys!2350 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822166 (= lt!369488 (getCurrentListMapNoExtraKeys!2350 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70872 res!560597) b!822160))

(assert (= (and b!822160 res!560594) b!822162))

(assert (= (and b!822162 res!560596) b!822164))

(assert (= (and b!822164 res!560598) b!822166))

(assert (= (and b!822166 (not res!560595)) b!822161))

(assert (= (and b!822159 condMapEmpty!23641) mapIsEmpty!23641))

(assert (= (and b!822159 (not condMapEmpty!23641)) mapNonEmpty!23641))

(get-info :version)

(assert (= (and mapNonEmpty!23641 ((_ is ValueCellFull!6929) mapValue!23641)) b!822165))

(assert (= (and b!822159 ((_ is ValueCellFull!6929) mapDefault!23641)) b!822163))

(assert (= start!70872 b!822159))

(declare-fun m!764371 () Bool)

(assert (=> mapNonEmpty!23641 m!764371))

(declare-fun m!764373 () Bool)

(assert (=> b!822164 m!764373))

(declare-fun m!764375 () Bool)

(assert (=> b!822166 m!764375))

(declare-fun m!764377 () Bool)

(assert (=> b!822166 m!764377))

(declare-fun m!764379 () Bool)

(assert (=> b!822166 m!764379))

(declare-fun m!764381 () Bool)

(assert (=> b!822161 m!764381))

(declare-fun m!764383 () Bool)

(assert (=> start!70872 m!764383))

(declare-fun m!764385 () Bool)

(assert (=> start!70872 m!764385))

(declare-fun m!764387 () Bool)

(assert (=> start!70872 m!764387))

(declare-fun m!764389 () Bool)

(assert (=> b!822162 m!764389))

(check-sat (not start!70872) (not b!822161) tp_is_empty!14689 (not b!822162) (not b_next!12979) (not mapNonEmpty!23641) (not b!822164) (not b!822166) b_and!21851)
(check-sat b_and!21851 (not b_next!12979))
