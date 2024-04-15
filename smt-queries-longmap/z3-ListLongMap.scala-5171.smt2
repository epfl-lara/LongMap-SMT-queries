; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69992 () Bool)

(assert start!69992)

(declare-fun b_free!12433 () Bool)

(declare-fun b_next!12433 () Bool)

(assert (=> start!69992 (= b_free!12433 (not b_next!12433))))

(declare-fun tp!44014 () Bool)

(declare-fun b_and!21179 () Bool)

(assert (=> start!69992 (= tp!44014 b_and!21179)))

(declare-fun b!813455 () Bool)

(declare-fun e!450780 () Bool)

(declare-fun e!450783 () Bool)

(declare-fun mapRes!22795 () Bool)

(assert (=> b!813455 (= e!450780 (and e!450783 mapRes!22795))))

(declare-fun condMapEmpty!22795 () Bool)

(declare-datatypes ((V!23859 0))(
  ( (V!23860 (val!7119 Int)) )
))
(declare-datatypes ((ValueCell!6656 0))(
  ( (ValueCellFull!6656 (v!9540 V!23859)) (EmptyCell!6656) )
))
(declare-datatypes ((array!44493 0))(
  ( (array!44494 (arr!21307 (Array (_ BitVec 32) ValueCell!6656)) (size!21728 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44493)

(declare-fun mapDefault!22795 () ValueCell!6656)

(assert (=> b!813455 (= condMapEmpty!22795 (= (arr!21307 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6656)) mapDefault!22795)))))

(declare-fun b!813456 () Bool)

(declare-fun e!450782 () Bool)

(assert (=> b!813456 (= e!450782 false)))

(declare-datatypes ((array!44495 0))(
  ( (array!44496 (arr!21308 (Array (_ BitVec 32) (_ BitVec 64))) (size!21729 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44495)

(declare-fun zeroValueAfter!34 () V!23859)

(declare-fun minValue!754 () V!23859)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9368 0))(
  ( (tuple2!9369 (_1!4695 (_ BitVec 64)) (_2!4695 V!23859)) )
))
(declare-datatypes ((List!15194 0))(
  ( (Nil!15191) (Cons!15190 (h!16319 tuple2!9368) (t!21502 List!15194)) )
))
(declare-datatypes ((ListLongMap!8181 0))(
  ( (ListLongMap!8182 (toList!4106 List!15194)) )
))
(declare-fun lt!364128 () ListLongMap!8181)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2171 (array!44495 array!44493 (_ BitVec 32) (_ BitVec 32) V!23859 V!23859 (_ BitVec 32) Int) ListLongMap!8181)

(assert (=> b!813456 (= lt!364128 (getCurrentListMapNoExtraKeys!2171 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23859)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364127 () ListLongMap!8181)

(assert (=> b!813456 (= lt!364127 (getCurrentListMapNoExtraKeys!2171 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813457 () Bool)

(declare-fun tp_is_empty!14143 () Bool)

(assert (=> b!813457 (= e!450783 tp_is_empty!14143)))

(declare-fun res!555749 () Bool)

(assert (=> start!69992 (=> (not res!555749) (not e!450782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69992 (= res!555749 (validMask!0 mask!1312))))

(assert (=> start!69992 e!450782))

(assert (=> start!69992 tp_is_empty!14143))

(declare-fun array_inv!17143 (array!44495) Bool)

(assert (=> start!69992 (array_inv!17143 _keys!976)))

(assert (=> start!69992 true))

(declare-fun array_inv!17144 (array!44493) Bool)

(assert (=> start!69992 (and (array_inv!17144 _values!788) e!450780)))

(assert (=> start!69992 tp!44014))

(declare-fun mapNonEmpty!22795 () Bool)

(declare-fun tp!44013 () Bool)

(declare-fun e!450781 () Bool)

(assert (=> mapNonEmpty!22795 (= mapRes!22795 (and tp!44013 e!450781))))

(declare-fun mapRest!22795 () (Array (_ BitVec 32) ValueCell!6656))

(declare-fun mapValue!22795 () ValueCell!6656)

(declare-fun mapKey!22795 () (_ BitVec 32))

(assert (=> mapNonEmpty!22795 (= (arr!21307 _values!788) (store mapRest!22795 mapKey!22795 mapValue!22795))))

(declare-fun b!813458 () Bool)

(declare-fun res!555752 () Bool)

(assert (=> b!813458 (=> (not res!555752) (not e!450782))))

(assert (=> b!813458 (= res!555752 (and (= (size!21728 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21729 _keys!976) (size!21728 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813459 () Bool)

(declare-fun res!555750 () Bool)

(assert (=> b!813459 (=> (not res!555750) (not e!450782))))

(declare-datatypes ((List!15195 0))(
  ( (Nil!15192) (Cons!15191 (h!16320 (_ BitVec 64)) (t!21503 List!15195)) )
))
(declare-fun arrayNoDuplicates!0 (array!44495 (_ BitVec 32) List!15195) Bool)

(assert (=> b!813459 (= res!555750 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15192))))

(declare-fun b!813460 () Bool)

(assert (=> b!813460 (= e!450781 tp_is_empty!14143)))

(declare-fun b!813461 () Bool)

(declare-fun res!555751 () Bool)

(assert (=> b!813461 (=> (not res!555751) (not e!450782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44495 (_ BitVec 32)) Bool)

(assert (=> b!813461 (= res!555751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22795 () Bool)

(assert (=> mapIsEmpty!22795 mapRes!22795))

(assert (= (and start!69992 res!555749) b!813458))

(assert (= (and b!813458 res!555752) b!813461))

(assert (= (and b!813461 res!555751) b!813459))

(assert (= (and b!813459 res!555750) b!813456))

(assert (= (and b!813455 condMapEmpty!22795) mapIsEmpty!22795))

(assert (= (and b!813455 (not condMapEmpty!22795)) mapNonEmpty!22795))

(get-info :version)

(assert (= (and mapNonEmpty!22795 ((_ is ValueCellFull!6656) mapValue!22795)) b!813460))

(assert (= (and b!813455 ((_ is ValueCellFull!6656) mapDefault!22795)) b!813457))

(assert (= start!69992 b!813455))

(declare-fun m!754917 () Bool)

(assert (=> start!69992 m!754917))

(declare-fun m!754919 () Bool)

(assert (=> start!69992 m!754919))

(declare-fun m!754921 () Bool)

(assert (=> start!69992 m!754921))

(declare-fun m!754923 () Bool)

(assert (=> b!813461 m!754923))

(declare-fun m!754925 () Bool)

(assert (=> mapNonEmpty!22795 m!754925))

(declare-fun m!754927 () Bool)

(assert (=> b!813459 m!754927))

(declare-fun m!754929 () Bool)

(assert (=> b!813456 m!754929))

(declare-fun m!754931 () Bool)

(assert (=> b!813456 m!754931))

(check-sat (not mapNonEmpty!22795) (not start!69992) tp_is_empty!14143 (not b!813456) b_and!21179 (not b!813459) (not b!813461) (not b_next!12433))
(check-sat b_and!21179 (not b_next!12433))
