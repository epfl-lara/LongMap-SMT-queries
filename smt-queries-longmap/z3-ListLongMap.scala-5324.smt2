; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71370 () Bool)

(assert start!71370)

(declare-fun b_free!13351 () Bool)

(declare-fun b_next!13351 () Bool)

(assert (=> start!71370 (= b_free!13351 (not b_next!13351))))

(declare-fun tp!46815 () Bool)

(declare-fun b_and!22299 () Bool)

(assert (=> start!71370 (= tp!46815 b_and!22299)))

(declare-fun res!564147 () Bool)

(declare-fun e!461300 () Bool)

(assert (=> start!71370 (=> (not res!564147) (not e!461300))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71370 (= res!564147 (validMask!0 mask!1312))))

(assert (=> start!71370 e!461300))

(declare-fun tp_is_empty!15061 () Bool)

(assert (=> start!71370 tp_is_empty!15061))

(declare-datatypes ((array!46303 0))(
  ( (array!46304 (arr!22191 (Array (_ BitVec 32) (_ BitVec 64))) (size!22611 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46303)

(declare-fun array_inv!17727 (array!46303) Bool)

(assert (=> start!71370 (array_inv!17727 _keys!976)))

(assert (=> start!71370 true))

(declare-datatypes ((V!25083 0))(
  ( (V!25084 (val!7578 Int)) )
))
(declare-datatypes ((ValueCell!7115 0))(
  ( (ValueCellFull!7115 (v!10013 V!25083)) (EmptyCell!7115) )
))
(declare-datatypes ((array!46305 0))(
  ( (array!46306 (arr!22192 (Array (_ BitVec 32) ValueCell!7115)) (size!22612 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46305)

(declare-fun e!461298 () Bool)

(declare-fun array_inv!17728 (array!46305) Bool)

(assert (=> start!71370 (and (array_inv!17728 _values!788) e!461298)))

(assert (=> start!71370 tp!46815))

(declare-fun b!828028 () Bool)

(declare-fun res!564148 () Bool)

(assert (=> b!828028 (=> (not res!564148) (not e!461300))))

(declare-datatypes ((List!15746 0))(
  ( (Nil!15743) (Cons!15742 (h!16877 (_ BitVec 64)) (t!22087 List!15746)) )
))
(declare-fun arrayNoDuplicates!0 (array!46303 (_ BitVec 32) List!15746) Bool)

(assert (=> b!828028 (= res!564148 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15743))))

(declare-fun mapNonEmpty!24220 () Bool)

(declare-fun mapRes!24220 () Bool)

(declare-fun tp!46816 () Bool)

(declare-fun e!461302 () Bool)

(assert (=> mapNonEmpty!24220 (= mapRes!24220 (and tp!46816 e!461302))))

(declare-fun mapRest!24220 () (Array (_ BitVec 32) ValueCell!7115))

(declare-fun mapValue!24220 () ValueCell!7115)

(declare-fun mapKey!24220 () (_ BitVec 32))

(assert (=> mapNonEmpty!24220 (= (arr!22192 _values!788) (store mapRest!24220 mapKey!24220 mapValue!24220))))

(declare-fun b!828029 () Bool)

(declare-fun res!564149 () Bool)

(assert (=> b!828029 (=> (not res!564149) (not e!461300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46303 (_ BitVec 32)) Bool)

(assert (=> b!828029 (= res!564149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828030 () Bool)

(declare-fun e!461301 () Bool)

(assert (=> b!828030 (= e!461301 tp_is_empty!15061)))

(declare-fun b!828031 () Bool)

(assert (=> b!828031 (= e!461300 (not true))))

(declare-datatypes ((tuple2!9972 0))(
  ( (tuple2!9973 (_1!4997 (_ BitVec 64)) (_2!4997 V!25083)) )
))
(declare-datatypes ((List!15747 0))(
  ( (Nil!15744) (Cons!15743 (h!16878 tuple2!9972) (t!22088 List!15747)) )
))
(declare-datatypes ((ListLongMap!8797 0))(
  ( (ListLongMap!8798 (toList!4414 List!15747)) )
))
(declare-fun lt!375166 () ListLongMap!8797)

(declare-fun lt!375167 () ListLongMap!8797)

(assert (=> b!828031 (= lt!375166 lt!375167)))

(declare-fun zeroValueBefore!34 () V!25083)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!25083)

(declare-fun minValue!754 () V!25083)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28380 0))(
  ( (Unit!28381) )
))
(declare-fun lt!375165 () Unit!28380)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!579 (array!46303 array!46305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25083 V!25083 V!25083 V!25083 (_ BitVec 32) Int) Unit!28380)

(assert (=> b!828031 (= lt!375165 (lemmaNoChangeToArrayThenSameMapNoExtras!579 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2491 (array!46303 array!46305 (_ BitVec 32) (_ BitVec 32) V!25083 V!25083 (_ BitVec 32) Int) ListLongMap!8797)

(assert (=> b!828031 (= lt!375167 (getCurrentListMapNoExtraKeys!2491 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828031 (= lt!375166 (getCurrentListMapNoExtraKeys!2491 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828032 () Bool)

(declare-fun res!564150 () Bool)

(assert (=> b!828032 (=> (not res!564150) (not e!461300))))

(assert (=> b!828032 (= res!564150 (and (= (size!22612 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22611 _keys!976) (size!22612 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828033 () Bool)

(assert (=> b!828033 (= e!461298 (and e!461301 mapRes!24220))))

(declare-fun condMapEmpty!24220 () Bool)

(declare-fun mapDefault!24220 () ValueCell!7115)

(assert (=> b!828033 (= condMapEmpty!24220 (= (arr!22192 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7115)) mapDefault!24220)))))

(declare-fun b!828034 () Bool)

(assert (=> b!828034 (= e!461302 tp_is_empty!15061)))

(declare-fun mapIsEmpty!24220 () Bool)

(assert (=> mapIsEmpty!24220 mapRes!24220))

(assert (= (and start!71370 res!564147) b!828032))

(assert (= (and b!828032 res!564150) b!828029))

(assert (= (and b!828029 res!564149) b!828028))

(assert (= (and b!828028 res!564148) b!828031))

(assert (= (and b!828033 condMapEmpty!24220) mapIsEmpty!24220))

(assert (= (and b!828033 (not condMapEmpty!24220)) mapNonEmpty!24220))

(get-info :version)

(assert (= (and mapNonEmpty!24220 ((_ is ValueCellFull!7115) mapValue!24220)) b!828034))

(assert (= (and b!828033 ((_ is ValueCellFull!7115) mapDefault!24220)) b!828030))

(assert (= start!71370 b!828033))

(declare-fun m!771563 () Bool)

(assert (=> b!828031 m!771563))

(declare-fun m!771565 () Bool)

(assert (=> b!828031 m!771565))

(declare-fun m!771567 () Bool)

(assert (=> b!828031 m!771567))

(declare-fun m!771569 () Bool)

(assert (=> b!828029 m!771569))

(declare-fun m!771571 () Bool)

(assert (=> b!828028 m!771571))

(declare-fun m!771573 () Bool)

(assert (=> mapNonEmpty!24220 m!771573))

(declare-fun m!771575 () Bool)

(assert (=> start!71370 m!771575))

(declare-fun m!771577 () Bool)

(assert (=> start!71370 m!771577))

(declare-fun m!771579 () Bool)

(assert (=> start!71370 m!771579))

(check-sat (not mapNonEmpty!24220) tp_is_empty!15061 (not b!828031) (not start!71370) (not b!828029) b_and!22299 (not b_next!13351) (not b!828028))
(check-sat b_and!22299 (not b_next!13351))
