; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71128 () Bool)

(assert start!71128)

(declare-fun b_free!13315 () Bool)

(declare-fun b_next!13315 () Bool)

(assert (=> start!71128 (= b_free!13315 (not b_next!13315))))

(declare-fun tp!46705 () Bool)

(declare-fun b_and!22215 () Bool)

(assert (=> start!71128 (= tp!46705 b_and!22215)))

(declare-fun b!826148 () Bool)

(declare-fun e!460015 () Bool)

(declare-fun e!460019 () Bool)

(declare-fun mapRes!24163 () Bool)

(assert (=> b!826148 (= e!460015 (and e!460019 mapRes!24163))))

(declare-fun condMapEmpty!24163 () Bool)

(declare-datatypes ((V!25035 0))(
  ( (V!25036 (val!7560 Int)) )
))
(declare-datatypes ((ValueCell!7097 0))(
  ( (ValueCellFull!7097 (v!9988 V!25035)) (EmptyCell!7097) )
))
(declare-datatypes ((array!46195 0))(
  ( (array!46196 (arr!22143 (Array (_ BitVec 32) ValueCell!7097)) (size!22564 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46195)

(declare-fun mapDefault!24163 () ValueCell!7097)

(assert (=> b!826148 (= condMapEmpty!24163 (= (arr!22143 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7097)) mapDefault!24163)))))

(declare-fun b!826149 () Bool)

(declare-fun res!563224 () Bool)

(declare-fun e!460016 () Bool)

(assert (=> b!826149 (=> (not res!563224) (not e!460016))))

(declare-datatypes ((array!46197 0))(
  ( (array!46198 (arr!22144 (Array (_ BitVec 32) (_ BitVec 64))) (size!22565 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46197)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826149 (= res!563224 (and (= (size!22564 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22565 _keys!976) (size!22564 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826150 () Bool)

(declare-fun res!563222 () Bool)

(assert (=> b!826150 (=> (not res!563222) (not e!460016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46197 (_ BitVec 32)) Bool)

(assert (=> b!826150 (= res!563222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24163 () Bool)

(assert (=> mapIsEmpty!24163 mapRes!24163))

(declare-fun res!563219 () Bool)

(assert (=> start!71128 (=> (not res!563219) (not e!460016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71128 (= res!563219 (validMask!0 mask!1312))))

(assert (=> start!71128 e!460016))

(declare-fun tp_is_empty!15025 () Bool)

(assert (=> start!71128 tp_is_empty!15025))

(declare-fun array_inv!17719 (array!46197) Bool)

(assert (=> start!71128 (array_inv!17719 _keys!976)))

(assert (=> start!71128 true))

(declare-fun array_inv!17720 (array!46195) Bool)

(assert (=> start!71128 (and (array_inv!17720 _values!788) e!460015)))

(assert (=> start!71128 tp!46705))

(declare-datatypes ((tuple2!10024 0))(
  ( (tuple2!10025 (_1!5023 (_ BitVec 64)) (_2!5023 V!25035)) )
))
(declare-datatypes ((List!15815 0))(
  ( (Nil!15812) (Cons!15811 (h!16940 tuple2!10024) (t!22153 List!15815)) )
))
(declare-datatypes ((ListLongMap!8837 0))(
  ( (ListLongMap!8838 (toList!4434 List!15815)) )
))
(declare-fun lt!373664 () ListLongMap!8837)

(declare-fun lt!373662 () tuple2!10024)

(declare-fun e!460014 () Bool)

(declare-fun lt!373659 () ListLongMap!8837)

(declare-fun b!826151 () Bool)

(declare-fun lt!373658 () tuple2!10024)

(declare-fun +!1969 (ListLongMap!8837 tuple2!10024) ListLongMap!8837)

(assert (=> b!826151 (= e!460014 (= lt!373664 (+!1969 (+!1969 lt!373659 lt!373662) lt!373658)))))

(declare-fun b!826152 () Bool)

(assert (=> b!826152 (= e!460019 tp_is_empty!15025)))

(declare-fun b!826153 () Bool)

(declare-fun e!460020 () Bool)

(assert (=> b!826153 (= e!460016 (not e!460020))))

(declare-fun res!563223 () Bool)

(assert (=> b!826153 (=> res!563223 e!460020)))

(assert (=> b!826153 (= res!563223 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373665 () ListLongMap!8837)

(assert (=> b!826153 (= lt!373665 lt!373659)))

(declare-fun zeroValueBefore!34 () V!25035)

(declare-fun zeroValueAfter!34 () V!25035)

(declare-fun minValue!754 () V!25035)

(declare-datatypes ((Unit!28281 0))(
  ( (Unit!28282) )
))
(declare-fun lt!373667 () Unit!28281)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!561 (array!46197 array!46195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25035 V!25035 V!25035 V!25035 (_ BitVec 32) Int) Unit!28281)

(assert (=> b!826153 (= lt!373667 (lemmaNoChangeToArrayThenSameMapNoExtras!561 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2468 (array!46197 array!46195 (_ BitVec 32) (_ BitVec 32) V!25035 V!25035 (_ BitVec 32) Int) ListLongMap!8837)

(assert (=> b!826153 (= lt!373659 (getCurrentListMapNoExtraKeys!2468 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826153 (= lt!373665 (getCurrentListMapNoExtraKeys!2468 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826154 () Bool)

(declare-fun e!460018 () Bool)

(assert (=> b!826154 (= e!460018 tp_is_empty!15025)))

(declare-fun b!826155 () Bool)

(declare-fun e!460021 () Bool)

(assert (=> b!826155 (= e!460021 (= lt!373664 (+!1969 (+!1969 lt!373659 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373662)))))

(declare-fun b!826156 () Bool)

(declare-fun res!563220 () Bool)

(assert (=> b!826156 (=> (not res!563220) (not e!460016))))

(declare-datatypes ((List!15816 0))(
  ( (Nil!15813) (Cons!15812 (h!16941 (_ BitVec 64)) (t!22154 List!15816)) )
))
(declare-fun arrayNoDuplicates!0 (array!46197 (_ BitVec 32) List!15816) Bool)

(assert (=> b!826156 (= res!563220 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15813))))

(declare-fun b!826157 () Bool)

(assert (=> b!826157 (= e!460020 true)))

(declare-fun lt!373666 () ListLongMap!8837)

(assert (=> b!826157 (= lt!373666 (+!1969 (+!1969 lt!373665 lt!373658) lt!373662))))

(declare-fun lt!373657 () ListLongMap!8837)

(declare-fun lt!373668 () ListLongMap!8837)

(assert (=> b!826157 (and (= lt!373657 lt!373668) (= lt!373664 lt!373668) (= lt!373664 lt!373657))))

(declare-fun lt!373663 () ListLongMap!8837)

(assert (=> b!826157 (= lt!373668 (+!1969 lt!373663 lt!373658))))

(declare-fun lt!373660 () ListLongMap!8837)

(assert (=> b!826157 (= lt!373657 (+!1969 lt!373660 lt!373658))))

(declare-fun lt!373656 () Unit!28281)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!234 (ListLongMap!8837 (_ BitVec 64) V!25035 V!25035) Unit!28281)

(assert (=> b!826157 (= lt!373656 (addSameAsAddTwiceSameKeyDiffValues!234 lt!373660 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826157 e!460014))

(declare-fun res!563221 () Bool)

(assert (=> b!826157 (=> (not res!563221) (not e!460014))))

(declare-fun lt!373661 () ListLongMap!8837)

(assert (=> b!826157 (= res!563221 (= lt!373661 lt!373663))))

(declare-fun lt!373669 () tuple2!10024)

(assert (=> b!826157 (= lt!373663 (+!1969 lt!373660 lt!373669))))

(assert (=> b!826157 (= lt!373660 (+!1969 lt!373665 lt!373662))))

(assert (=> b!826157 (= lt!373658 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826157 e!460021))

(declare-fun res!563225 () Bool)

(assert (=> b!826157 (=> (not res!563225) (not e!460021))))

(assert (=> b!826157 (= res!563225 (= lt!373661 (+!1969 (+!1969 lt!373665 lt!373669) lt!373662)))))

(assert (=> b!826157 (= lt!373662 (tuple2!10025 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826157 (= lt!373669 (tuple2!10025 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2517 (array!46197 array!46195 (_ BitVec 32) (_ BitVec 32) V!25035 V!25035 (_ BitVec 32) Int) ListLongMap!8837)

(assert (=> b!826157 (= lt!373664 (getCurrentListMap!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826157 (= lt!373661 (getCurrentListMap!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24163 () Bool)

(declare-fun tp!46704 () Bool)

(assert (=> mapNonEmpty!24163 (= mapRes!24163 (and tp!46704 e!460018))))

(declare-fun mapValue!24163 () ValueCell!7097)

(declare-fun mapKey!24163 () (_ BitVec 32))

(declare-fun mapRest!24163 () (Array (_ BitVec 32) ValueCell!7097))

(assert (=> mapNonEmpty!24163 (= (arr!22143 _values!788) (store mapRest!24163 mapKey!24163 mapValue!24163))))

(assert (= (and start!71128 res!563219) b!826149))

(assert (= (and b!826149 res!563224) b!826150))

(assert (= (and b!826150 res!563222) b!826156))

(assert (= (and b!826156 res!563220) b!826153))

(assert (= (and b!826153 (not res!563223)) b!826157))

(assert (= (and b!826157 res!563225) b!826155))

(assert (= (and b!826157 res!563221) b!826151))

(assert (= (and b!826148 condMapEmpty!24163) mapIsEmpty!24163))

(assert (= (and b!826148 (not condMapEmpty!24163)) mapNonEmpty!24163))

(get-info :version)

(assert (= (and mapNonEmpty!24163 ((_ is ValueCellFull!7097) mapValue!24163)) b!826154))

(assert (= (and b!826148 ((_ is ValueCellFull!7097) mapDefault!24163)) b!826152))

(assert (= start!71128 b!826148))

(declare-fun m!768355 () Bool)

(assert (=> mapNonEmpty!24163 m!768355))

(declare-fun m!768357 () Bool)

(assert (=> b!826156 m!768357))

(declare-fun m!768359 () Bool)

(assert (=> b!826150 m!768359))

(declare-fun m!768361 () Bool)

(assert (=> b!826157 m!768361))

(declare-fun m!768363 () Bool)

(assert (=> b!826157 m!768363))

(declare-fun m!768365 () Bool)

(assert (=> b!826157 m!768365))

(declare-fun m!768367 () Bool)

(assert (=> b!826157 m!768367))

(declare-fun m!768369 () Bool)

(assert (=> b!826157 m!768369))

(declare-fun m!768371 () Bool)

(assert (=> b!826157 m!768371))

(declare-fun m!768373 () Bool)

(assert (=> b!826157 m!768373))

(assert (=> b!826157 m!768373))

(declare-fun m!768375 () Bool)

(assert (=> b!826157 m!768375))

(declare-fun m!768377 () Bool)

(assert (=> b!826157 m!768377))

(declare-fun m!768379 () Bool)

(assert (=> b!826157 m!768379))

(assert (=> b!826157 m!768367))

(declare-fun m!768381 () Bool)

(assert (=> b!826157 m!768381))

(declare-fun m!768383 () Bool)

(assert (=> start!71128 m!768383))

(declare-fun m!768385 () Bool)

(assert (=> start!71128 m!768385))

(declare-fun m!768387 () Bool)

(assert (=> start!71128 m!768387))

(declare-fun m!768389 () Bool)

(assert (=> b!826155 m!768389))

(assert (=> b!826155 m!768389))

(declare-fun m!768391 () Bool)

(assert (=> b!826155 m!768391))

(declare-fun m!768393 () Bool)

(assert (=> b!826151 m!768393))

(assert (=> b!826151 m!768393))

(declare-fun m!768395 () Bool)

(assert (=> b!826151 m!768395))

(declare-fun m!768397 () Bool)

(assert (=> b!826153 m!768397))

(declare-fun m!768399 () Bool)

(assert (=> b!826153 m!768399))

(declare-fun m!768401 () Bool)

(assert (=> b!826153 m!768401))

(check-sat (not b!826151) (not b_next!13315) (not b!826157) (not b!826150) b_and!22215 (not start!71128) (not b!826153) tp_is_empty!15025 (not b!826156) (not mapNonEmpty!24163) (not b!826155))
(check-sat b_and!22215 (not b_next!13315))
