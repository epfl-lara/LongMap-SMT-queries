; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70878 () Bool)

(assert start!70878)

(declare-fun b_free!12985 () Bool)

(declare-fun b_next!12985 () Bool)

(assert (=> start!70878 (= b_free!12985 (not b_next!12985))))

(declare-fun tp!45697 () Bool)

(declare-fun b_and!21857 () Bool)

(assert (=> start!70878 (= tp!45697 b_and!21857)))

(declare-fun b!822231 () Bool)

(declare-fun res!560643 () Bool)

(declare-fun e!457029 () Bool)

(assert (=> b!822231 (=> (not res!560643) (not e!457029))))

(declare-datatypes ((array!45589 0))(
  ( (array!45590 (arr!21841 (Array (_ BitVec 32) (_ BitVec 64))) (size!22261 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45589)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45589 (_ BitVec 32)) Bool)

(assert (=> b!822231 (= res!560643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!822232 () Bool)

(declare-fun res!560639 () Bool)

(assert (=> b!822232 (=> (not res!560639) (not e!457029))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24595 0))(
  ( (V!24596 (val!7395 Int)) )
))
(declare-datatypes ((ValueCell!6932 0))(
  ( (ValueCellFull!6932 (v!9826 V!24595)) (EmptyCell!6932) )
))
(declare-datatypes ((array!45591 0))(
  ( (array!45592 (arr!21842 (Array (_ BitVec 32) ValueCell!6932)) (size!22262 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45591)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822232 (= res!560639 (and (= (size!22262 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22261 _keys!976) (size!22262 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822233 () Bool)

(declare-fun e!457028 () Bool)

(declare-fun e!457026 () Bool)

(declare-fun mapRes!23650 () Bool)

(assert (=> b!822233 (= e!457028 (and e!457026 mapRes!23650))))

(declare-fun condMapEmpty!23650 () Bool)

(declare-fun mapDefault!23650 () ValueCell!6932)

(assert (=> b!822233 (= condMapEmpty!23650 (= (arr!21842 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6932)) mapDefault!23650)))))

(declare-fun mapNonEmpty!23650 () Bool)

(declare-fun tp!45696 () Bool)

(declare-fun e!457027 () Bool)

(assert (=> mapNonEmpty!23650 (= mapRes!23650 (and tp!45696 e!457027))))

(declare-fun mapValue!23650 () ValueCell!6932)

(declare-fun mapKey!23650 () (_ BitVec 32))

(declare-fun mapRest!23650 () (Array (_ BitVec 32) ValueCell!6932))

(assert (=> mapNonEmpty!23650 (= (arr!21842 _values!788) (store mapRest!23650 mapKey!23650 mapValue!23650))))

(declare-fun b!822234 () Bool)

(declare-fun e!457030 () Bool)

(assert (=> b!822234 (= e!457029 (not e!457030))))

(declare-fun res!560641 () Bool)

(assert (=> b!822234 (=> res!560641 e!457030)))

(assert (=> b!822234 (= res!560641 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9668 0))(
  ( (tuple2!9669 (_1!4845 (_ BitVec 64)) (_2!4845 V!24595)) )
))
(declare-datatypes ((List!15461 0))(
  ( (Nil!15458) (Cons!15457 (h!16592 tuple2!9668) (t!21788 List!15461)) )
))
(declare-datatypes ((ListLongMap!8493 0))(
  ( (ListLongMap!8494 (toList!4262 List!15461)) )
))
(declare-fun lt!369525 () ListLongMap!8493)

(declare-fun lt!369526 () ListLongMap!8493)

(assert (=> b!822234 (= lt!369525 lt!369526)))

(declare-fun zeroValueBefore!34 () V!24595)

(declare-fun zeroValueAfter!34 () V!24595)

(declare-fun minValue!754 () V!24595)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28074 0))(
  ( (Unit!28075) )
))
(declare-fun lt!369524 () Unit!28074)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!440 (array!45589 array!45591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24595 V!24595 V!24595 V!24595 (_ BitVec 32) Int) Unit!28074)

(assert (=> b!822234 (= lt!369524 (lemmaNoChangeToArrayThenSameMapNoExtras!440 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2352 (array!45589 array!45591 (_ BitVec 32) (_ BitVec 32) V!24595 V!24595 (_ BitVec 32) Int) ListLongMap!8493)

(assert (=> b!822234 (= lt!369526 (getCurrentListMapNoExtraKeys!2352 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822234 (= lt!369525 (getCurrentListMapNoExtraKeys!2352 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822236 () Bool)

(declare-fun tp_is_empty!14695 () Bool)

(assert (=> b!822236 (= e!457027 tp_is_empty!14695)))

(declare-fun b!822237 () Bool)

(assert (=> b!822237 (= e!457030 true)))

(declare-fun lt!369527 () ListLongMap!8493)

(declare-fun getCurrentListMap!2422 (array!45589 array!45591 (_ BitVec 32) (_ BitVec 32) V!24595 V!24595 (_ BitVec 32) Int) ListLongMap!8493)

(assert (=> b!822237 (= lt!369527 (getCurrentListMap!2422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23650 () Bool)

(assert (=> mapIsEmpty!23650 mapRes!23650))

(declare-fun b!822238 () Bool)

(declare-fun res!560640 () Bool)

(assert (=> b!822238 (=> (not res!560640) (not e!457029))))

(declare-datatypes ((List!15462 0))(
  ( (Nil!15459) (Cons!15458 (h!16593 (_ BitVec 64)) (t!21789 List!15462)) )
))
(declare-fun arrayNoDuplicates!0 (array!45589 (_ BitVec 32) List!15462) Bool)

(assert (=> b!822238 (= res!560640 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15459))))

(declare-fun b!822235 () Bool)

(assert (=> b!822235 (= e!457026 tp_is_empty!14695)))

(declare-fun res!560642 () Bool)

(assert (=> start!70878 (=> (not res!560642) (not e!457029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70878 (= res!560642 (validMask!0 mask!1312))))

(assert (=> start!70878 e!457029))

(assert (=> start!70878 tp_is_empty!14695))

(declare-fun array_inv!17481 (array!45589) Bool)

(assert (=> start!70878 (array_inv!17481 _keys!976)))

(assert (=> start!70878 true))

(declare-fun array_inv!17482 (array!45591) Bool)

(assert (=> start!70878 (and (array_inv!17482 _values!788) e!457028)))

(assert (=> start!70878 tp!45697))

(assert (= (and start!70878 res!560642) b!822232))

(assert (= (and b!822232 res!560639) b!822231))

(assert (= (and b!822231 res!560643) b!822238))

(assert (= (and b!822238 res!560640) b!822234))

(assert (= (and b!822234 (not res!560641)) b!822237))

(assert (= (and b!822233 condMapEmpty!23650) mapIsEmpty!23650))

(assert (= (and b!822233 (not condMapEmpty!23650)) mapNonEmpty!23650))

(get-info :version)

(assert (= (and mapNonEmpty!23650 ((_ is ValueCellFull!6932) mapValue!23650)) b!822236))

(assert (= (and b!822233 ((_ is ValueCellFull!6932) mapDefault!23650)) b!822235))

(assert (= start!70878 b!822233))

(declare-fun m!764431 () Bool)

(assert (=> start!70878 m!764431))

(declare-fun m!764433 () Bool)

(assert (=> start!70878 m!764433))

(declare-fun m!764435 () Bool)

(assert (=> start!70878 m!764435))

(declare-fun m!764437 () Bool)

(assert (=> mapNonEmpty!23650 m!764437))

(declare-fun m!764439 () Bool)

(assert (=> b!822231 m!764439))

(declare-fun m!764441 () Bool)

(assert (=> b!822234 m!764441))

(declare-fun m!764443 () Bool)

(assert (=> b!822234 m!764443))

(declare-fun m!764445 () Bool)

(assert (=> b!822234 m!764445))

(declare-fun m!764447 () Bool)

(assert (=> b!822237 m!764447))

(declare-fun m!764449 () Bool)

(assert (=> b!822238 m!764449))

(check-sat tp_is_empty!14695 (not b!822237) b_and!21857 (not b!822234) (not start!70878) (not b!822231) (not b!822238) (not mapNonEmpty!23650) (not b_next!12985))
(check-sat b_and!21857 (not b_next!12985))
