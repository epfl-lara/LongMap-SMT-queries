; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70896 () Bool)

(assert start!70896)

(declare-fun b_free!13003 () Bool)

(declare-fun b_next!13003 () Bool)

(assert (=> start!70896 (= b_free!13003 (not b_next!13003))))

(declare-fun tp!45751 () Bool)

(declare-fun b_and!21875 () Bool)

(assert (=> start!70896 (= tp!45751 b_and!21875)))

(declare-fun b!822447 () Bool)

(declare-fun e!457189 () Bool)

(assert (=> b!822447 (= e!457189 true)))

(declare-datatypes ((V!24619 0))(
  ( (V!24620 (val!7404 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24619)

(declare-datatypes ((array!45623 0))(
  ( (array!45624 (arr!21858 (Array (_ BitVec 32) (_ BitVec 64))) (size!22278 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45623)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6941 0))(
  ( (ValueCellFull!6941 (v!9835 V!24619)) (EmptyCell!6941) )
))
(declare-datatypes ((array!45625 0))(
  ( (array!45626 (arr!21859 (Array (_ BitVec 32) ValueCell!6941)) (size!22279 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45625)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24619)

(declare-datatypes ((tuple2!9684 0))(
  ( (tuple2!9685 (_1!4853 (_ BitVec 64)) (_2!4853 V!24619)) )
))
(declare-datatypes ((List!15477 0))(
  ( (Nil!15474) (Cons!15473 (h!16608 tuple2!9684) (t!21804 List!15477)) )
))
(declare-datatypes ((ListLongMap!8509 0))(
  ( (ListLongMap!8510 (toList!4270 List!15477)) )
))
(declare-fun lt!369633 () ListLongMap!8509)

(declare-fun getCurrentListMap!2428 (array!45623 array!45625 (_ BitVec 32) (_ BitVec 32) V!24619 V!24619 (_ BitVec 32) Int) ListLongMap!8509)

(assert (=> b!822447 (= lt!369633 (getCurrentListMap!2428 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!560774 () Bool)

(declare-fun e!457191 () Bool)

(assert (=> start!70896 (=> (not res!560774) (not e!457191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70896 (= res!560774 (validMask!0 mask!1312))))

(assert (=> start!70896 e!457191))

(declare-fun tp_is_empty!14713 () Bool)

(assert (=> start!70896 tp_is_empty!14713))

(declare-fun array_inv!17493 (array!45623) Bool)

(assert (=> start!70896 (array_inv!17493 _keys!976)))

(assert (=> start!70896 true))

(declare-fun e!457187 () Bool)

(declare-fun array_inv!17494 (array!45625) Bool)

(assert (=> start!70896 (and (array_inv!17494 _values!788) e!457187)))

(assert (=> start!70896 tp!45751))

(declare-fun mapIsEmpty!23677 () Bool)

(declare-fun mapRes!23677 () Bool)

(assert (=> mapIsEmpty!23677 mapRes!23677))

(declare-fun b!822448 () Bool)

(declare-fun e!457190 () Bool)

(assert (=> b!822448 (= e!457190 tp_is_empty!14713)))

(declare-fun b!822449 () Bool)

(declare-fun res!560775 () Bool)

(assert (=> b!822449 (=> (not res!560775) (not e!457191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45623 (_ BitVec 32)) Bool)

(assert (=> b!822449 (= res!560775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23677 () Bool)

(declare-fun tp!45750 () Bool)

(declare-fun e!457188 () Bool)

(assert (=> mapNonEmpty!23677 (= mapRes!23677 (and tp!45750 e!457188))))

(declare-fun mapKey!23677 () (_ BitVec 32))

(declare-fun mapValue!23677 () ValueCell!6941)

(declare-fun mapRest!23677 () (Array (_ BitVec 32) ValueCell!6941))

(assert (=> mapNonEmpty!23677 (= (arr!21859 _values!788) (store mapRest!23677 mapKey!23677 mapValue!23677))))

(declare-fun b!822450 () Bool)

(assert (=> b!822450 (= e!457188 tp_is_empty!14713)))

(declare-fun b!822451 () Bool)

(declare-fun res!560777 () Bool)

(assert (=> b!822451 (=> (not res!560777) (not e!457191))))

(declare-datatypes ((List!15478 0))(
  ( (Nil!15475) (Cons!15474 (h!16609 (_ BitVec 64)) (t!21805 List!15478)) )
))
(declare-fun arrayNoDuplicates!0 (array!45623 (_ BitVec 32) List!15478) Bool)

(assert (=> b!822451 (= res!560777 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15475))))

(declare-fun b!822452 () Bool)

(declare-fun res!560776 () Bool)

(assert (=> b!822452 (=> (not res!560776) (not e!457191))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!822452 (= res!560776 (and (= (size!22279 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22278 _keys!976) (size!22279 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822453 () Bool)

(assert (=> b!822453 (= e!457191 (not e!457189))))

(declare-fun res!560778 () Bool)

(assert (=> b!822453 (=> res!560778 e!457189)))

(assert (=> b!822453 (= res!560778 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369632 () ListLongMap!8509)

(declare-fun lt!369635 () ListLongMap!8509)

(assert (=> b!822453 (= lt!369632 lt!369635)))

(declare-fun zeroValueAfter!34 () V!24619)

(declare-datatypes ((Unit!28090 0))(
  ( (Unit!28091) )
))
(declare-fun lt!369634 () Unit!28090)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!448 (array!45623 array!45625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24619 V!24619 V!24619 V!24619 (_ BitVec 32) Int) Unit!28090)

(assert (=> b!822453 (= lt!369634 (lemmaNoChangeToArrayThenSameMapNoExtras!448 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2360 (array!45623 array!45625 (_ BitVec 32) (_ BitVec 32) V!24619 V!24619 (_ BitVec 32) Int) ListLongMap!8509)

(assert (=> b!822453 (= lt!369635 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822453 (= lt!369632 (getCurrentListMapNoExtraKeys!2360 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822454 () Bool)

(assert (=> b!822454 (= e!457187 (and e!457190 mapRes!23677))))

(declare-fun condMapEmpty!23677 () Bool)

(declare-fun mapDefault!23677 () ValueCell!6941)

(assert (=> b!822454 (= condMapEmpty!23677 (= (arr!21859 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6941)) mapDefault!23677)))))

(assert (= (and start!70896 res!560774) b!822452))

(assert (= (and b!822452 res!560776) b!822449))

(assert (= (and b!822449 res!560775) b!822451))

(assert (= (and b!822451 res!560777) b!822453))

(assert (= (and b!822453 (not res!560778)) b!822447))

(assert (= (and b!822454 condMapEmpty!23677) mapIsEmpty!23677))

(assert (= (and b!822454 (not condMapEmpty!23677)) mapNonEmpty!23677))

(get-info :version)

(assert (= (and mapNonEmpty!23677 ((_ is ValueCellFull!6941) mapValue!23677)) b!822450))

(assert (= (and b!822454 ((_ is ValueCellFull!6941) mapDefault!23677)) b!822448))

(assert (= start!70896 b!822454))

(declare-fun m!764611 () Bool)

(assert (=> b!822447 m!764611))

(declare-fun m!764613 () Bool)

(assert (=> b!822451 m!764613))

(declare-fun m!764615 () Bool)

(assert (=> b!822453 m!764615))

(declare-fun m!764617 () Bool)

(assert (=> b!822453 m!764617))

(declare-fun m!764619 () Bool)

(assert (=> b!822453 m!764619))

(declare-fun m!764621 () Bool)

(assert (=> start!70896 m!764621))

(declare-fun m!764623 () Bool)

(assert (=> start!70896 m!764623))

(declare-fun m!764625 () Bool)

(assert (=> start!70896 m!764625))

(declare-fun m!764627 () Bool)

(assert (=> mapNonEmpty!23677 m!764627))

(declare-fun m!764629 () Bool)

(assert (=> b!822449 m!764629))

(check-sat (not b_next!13003) (not b!822453) (not mapNonEmpty!23677) b_and!21875 tp_is_empty!14713 (not b!822451) (not start!70896) (not b!822447) (not b!822449))
(check-sat b_and!21875 (not b_next!13003))
