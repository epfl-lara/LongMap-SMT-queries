; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71314 () Bool)

(assert start!71314)

(declare-fun b_free!13315 () Bool)

(declare-fun b_next!13315 () Bool)

(assert (=> start!71314 (= b_free!13315 (not b_next!13315))))

(declare-fun tp!46704 () Bool)

(declare-fun b_and!22251 () Bool)

(assert (=> start!71314 (= tp!46704 b_and!22251)))

(declare-fun b!827289 () Bool)

(declare-fun res!563672 () Bool)

(declare-fun e!460745 () Bool)

(assert (=> b!827289 (=> (not res!563672) (not e!460745))))

(declare-datatypes ((array!46233 0))(
  ( (array!46234 (arr!22157 (Array (_ BitVec 32) (_ BitVec 64))) (size!22577 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46233)

(declare-datatypes ((List!15719 0))(
  ( (Nil!15716) (Cons!15715 (h!16850 (_ BitVec 64)) (t!22058 List!15719)) )
))
(declare-fun arrayNoDuplicates!0 (array!46233 (_ BitVec 32) List!15719) Bool)

(assert (=> b!827289 (= res!563672 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15716))))

(declare-fun b!827290 () Bool)

(declare-fun res!563674 () Bool)

(assert (=> b!827290 (=> (not res!563674) (not e!460745))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25035 0))(
  ( (V!25036 (val!7560 Int)) )
))
(declare-datatypes ((ValueCell!7097 0))(
  ( (ValueCellFull!7097 (v!9994 V!25035)) (EmptyCell!7097) )
))
(declare-datatypes ((array!46235 0))(
  ( (array!46236 (arr!22158 (Array (_ BitVec 32) ValueCell!7097)) (size!22578 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46235)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827290 (= res!563674 (and (= (size!22578 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22577 _keys!976) (size!22578 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827291 () Bool)

(declare-fun e!460746 () Bool)

(assert (=> b!827291 (= e!460746 true)))

(declare-datatypes ((tuple2!9942 0))(
  ( (tuple2!9943 (_1!4982 (_ BitVec 64)) (_2!4982 V!25035)) )
))
(declare-fun lt!374259 () tuple2!9942)

(declare-fun lt!374253 () tuple2!9942)

(declare-datatypes ((List!15720 0))(
  ( (Nil!15717) (Cons!15716 (h!16851 tuple2!9942) (t!22059 List!15720)) )
))
(declare-datatypes ((ListLongMap!8767 0))(
  ( (ListLongMap!8768 (toList!4399 List!15720)) )
))
(declare-fun lt!374261 () ListLongMap!8767)

(declare-fun lt!374263 () ListLongMap!8767)

(declare-fun +!1945 (ListLongMap!8767 tuple2!9942) ListLongMap!8767)

(assert (=> b!827291 (= lt!374263 (+!1945 (+!1945 lt!374261 lt!374259) lt!374253))))

(declare-fun lt!374265 () ListLongMap!8767)

(declare-fun lt!374262 () ListLongMap!8767)

(declare-fun lt!374257 () ListLongMap!8767)

(assert (=> b!827291 (and (= lt!374265 lt!374262) (= lt!374257 lt!374262) (= lt!374257 lt!374265))))

(declare-fun lt!374260 () ListLongMap!8767)

(assert (=> b!827291 (= lt!374262 (+!1945 lt!374260 lt!374259))))

(declare-fun lt!374266 () ListLongMap!8767)

(assert (=> b!827291 (= lt!374265 (+!1945 lt!374266 lt!374259))))

(declare-datatypes ((Unit!28350 0))(
  ( (Unit!28351) )
))
(declare-fun lt!374258 () Unit!28350)

(declare-fun zeroValueBefore!34 () V!25035)

(declare-fun zeroValueAfter!34 () V!25035)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!229 (ListLongMap!8767 (_ BitVec 64) V!25035 V!25035) Unit!28350)

(assert (=> b!827291 (= lt!374258 (addSameAsAddTwiceSameKeyDiffValues!229 lt!374266 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460749 () Bool)

(assert (=> b!827291 e!460749))

(declare-fun res!563675 () Bool)

(assert (=> b!827291 (=> (not res!563675) (not e!460749))))

(declare-fun lt!374254 () ListLongMap!8767)

(assert (=> b!827291 (= res!563675 (= lt!374254 lt!374260))))

(declare-fun lt!374264 () tuple2!9942)

(assert (=> b!827291 (= lt!374260 (+!1945 lt!374266 lt!374264))))

(assert (=> b!827291 (= lt!374266 (+!1945 lt!374261 lt!374253))))

(assert (=> b!827291 (= lt!374259 (tuple2!9943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460744 () Bool)

(assert (=> b!827291 e!460744))

(declare-fun res!563673 () Bool)

(assert (=> b!827291 (=> (not res!563673) (not e!460744))))

(assert (=> b!827291 (= res!563673 (= lt!374254 (+!1945 (+!1945 lt!374261 lt!374264) lt!374253)))))

(declare-fun minValue!754 () V!25035)

(assert (=> b!827291 (= lt!374253 (tuple2!9943 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!827291 (= lt!374264 (tuple2!9943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2520 (array!46233 array!46235 (_ BitVec 32) (_ BitVec 32) V!25035 V!25035 (_ BitVec 32) Int) ListLongMap!8767)

(assert (=> b!827291 (= lt!374257 (getCurrentListMap!2520 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827291 (= lt!374254 (getCurrentListMap!2520 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827292 () Bool)

(assert (=> b!827292 (= e!460745 (not e!460746))))

(declare-fun res!563671 () Bool)

(assert (=> b!827292 (=> res!563671 e!460746)))

(assert (=> b!827292 (= res!563671 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!374256 () ListLongMap!8767)

(assert (=> b!827292 (= lt!374261 lt!374256)))

(declare-fun lt!374255 () Unit!28350)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!565 (array!46233 array!46235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25035 V!25035 V!25035 V!25035 (_ BitVec 32) Int) Unit!28350)

(assert (=> b!827292 (= lt!374255 (lemmaNoChangeToArrayThenSameMapNoExtras!565 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2477 (array!46233 array!46235 (_ BitVec 32) (_ BitVec 32) V!25035 V!25035 (_ BitVec 32) Int) ListLongMap!8767)

(assert (=> b!827292 (= lt!374256 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827292 (= lt!374261 (getCurrentListMapNoExtraKeys!2477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24163 () Bool)

(declare-fun mapRes!24163 () Bool)

(declare-fun tp!46705 () Bool)

(declare-fun e!460743 () Bool)

(assert (=> mapNonEmpty!24163 (= mapRes!24163 (and tp!46705 e!460743))))

(declare-fun mapKey!24163 () (_ BitVec 32))

(declare-fun mapValue!24163 () ValueCell!7097)

(declare-fun mapRest!24163 () (Array (_ BitVec 32) ValueCell!7097))

(assert (=> mapNonEmpty!24163 (= (arr!22158 _values!788) (store mapRest!24163 mapKey!24163 mapValue!24163))))

(declare-fun mapIsEmpty!24163 () Bool)

(assert (=> mapIsEmpty!24163 mapRes!24163))

(declare-fun b!827293 () Bool)

(declare-fun tp_is_empty!15025 () Bool)

(assert (=> b!827293 (= e!460743 tp_is_empty!15025)))

(declare-fun b!827294 () Bool)

(assert (=> b!827294 (= e!460749 (= lt!374257 (+!1945 (+!1945 lt!374256 lt!374253) lt!374259)))))

(declare-fun b!827295 () Bool)

(declare-fun e!460748 () Bool)

(assert (=> b!827295 (= e!460748 tp_is_empty!15025)))

(declare-fun b!827296 () Bool)

(declare-fun e!460747 () Bool)

(assert (=> b!827296 (= e!460747 (and e!460748 mapRes!24163))))

(declare-fun condMapEmpty!24163 () Bool)

(declare-fun mapDefault!24163 () ValueCell!7097)

(assert (=> b!827296 (= condMapEmpty!24163 (= (arr!22158 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7097)) mapDefault!24163)))))

(declare-fun b!827297 () Bool)

(assert (=> b!827297 (= e!460744 (= lt!374257 (+!1945 (+!1945 lt!374256 (tuple2!9943 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374253)))))

(declare-fun b!827288 () Bool)

(declare-fun res!563676 () Bool)

(assert (=> b!827288 (=> (not res!563676) (not e!460745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46233 (_ BitVec 32)) Bool)

(assert (=> b!827288 (= res!563676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563677 () Bool)

(assert (=> start!71314 (=> (not res!563677) (not e!460745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71314 (= res!563677 (validMask!0 mask!1312))))

(assert (=> start!71314 e!460745))

(assert (=> start!71314 tp_is_empty!15025))

(declare-fun array_inv!17703 (array!46233) Bool)

(assert (=> start!71314 (array_inv!17703 _keys!976)))

(assert (=> start!71314 true))

(declare-fun array_inv!17704 (array!46235) Bool)

(assert (=> start!71314 (and (array_inv!17704 _values!788) e!460747)))

(assert (=> start!71314 tp!46704))

(assert (= (and start!71314 res!563677) b!827290))

(assert (= (and b!827290 res!563674) b!827288))

(assert (= (and b!827288 res!563676) b!827289))

(assert (= (and b!827289 res!563672) b!827292))

(assert (= (and b!827292 (not res!563671)) b!827291))

(assert (= (and b!827291 res!563673) b!827297))

(assert (= (and b!827291 res!563675) b!827294))

(assert (= (and b!827296 condMapEmpty!24163) mapIsEmpty!24163))

(assert (= (and b!827296 (not condMapEmpty!24163)) mapNonEmpty!24163))

(get-info :version)

(assert (= (and mapNonEmpty!24163 ((_ is ValueCellFull!7097) mapValue!24163)) b!827293))

(assert (= (and b!827296 ((_ is ValueCellFull!7097) mapDefault!24163)) b!827295))

(assert (= start!71314 b!827296))

(declare-fun m!770389 () Bool)

(assert (=> b!827289 m!770389))

(declare-fun m!770391 () Bool)

(assert (=> b!827288 m!770391))

(declare-fun m!770393 () Bool)

(assert (=> b!827292 m!770393))

(declare-fun m!770395 () Bool)

(assert (=> b!827292 m!770395))

(declare-fun m!770397 () Bool)

(assert (=> b!827292 m!770397))

(declare-fun m!770399 () Bool)

(assert (=> b!827291 m!770399))

(declare-fun m!770401 () Bool)

(assert (=> b!827291 m!770401))

(declare-fun m!770403 () Bool)

(assert (=> b!827291 m!770403))

(declare-fun m!770405 () Bool)

(assert (=> b!827291 m!770405))

(declare-fun m!770407 () Bool)

(assert (=> b!827291 m!770407))

(declare-fun m!770409 () Bool)

(assert (=> b!827291 m!770409))

(declare-fun m!770411 () Bool)

(assert (=> b!827291 m!770411))

(declare-fun m!770413 () Bool)

(assert (=> b!827291 m!770413))

(declare-fun m!770415 () Bool)

(assert (=> b!827291 m!770415))

(assert (=> b!827291 m!770411))

(declare-fun m!770417 () Bool)

(assert (=> b!827291 m!770417))

(assert (=> b!827291 m!770407))

(declare-fun m!770419 () Bool)

(assert (=> b!827291 m!770419))

(declare-fun m!770421 () Bool)

(assert (=> b!827294 m!770421))

(assert (=> b!827294 m!770421))

(declare-fun m!770423 () Bool)

(assert (=> b!827294 m!770423))

(declare-fun m!770425 () Bool)

(assert (=> start!71314 m!770425))

(declare-fun m!770427 () Bool)

(assert (=> start!71314 m!770427))

(declare-fun m!770429 () Bool)

(assert (=> start!71314 m!770429))

(declare-fun m!770431 () Bool)

(assert (=> mapNonEmpty!24163 m!770431))

(declare-fun m!770433 () Bool)

(assert (=> b!827297 m!770433))

(assert (=> b!827297 m!770433))

(declare-fun m!770435 () Bool)

(assert (=> b!827297 m!770435))

(check-sat tp_is_empty!15025 (not b!827292) (not b!827294) (not b_next!13315) b_and!22251 (not start!71314) (not b!827291) (not b!827297) (not b!827288) (not b!827289) (not mapNonEmpty!24163))
(check-sat b_and!22251 (not b_next!13315))
