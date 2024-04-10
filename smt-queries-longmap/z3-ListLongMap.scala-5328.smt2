; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71230 () Bool)

(assert start!71230)

(declare-fun b_free!13377 () Bool)

(declare-fun b_next!13377 () Bool)

(assert (=> start!71230 (= b_free!13377 (not b_next!13377))))

(declare-fun tp!46893 () Bool)

(declare-fun b_and!22315 () Bool)

(assert (=> start!71230 (= tp!46893 b_and!22315)))

(declare-fun b!827407 () Bool)

(declare-fun res!563959 () Bool)

(declare-fun e!460917 () Bool)

(assert (=> b!827407 (=> (not res!563959) (not e!460917))))

(declare-datatypes ((array!46350 0))(
  ( (array!46351 (arr!22219 (Array (_ BitVec 32) (_ BitVec 64))) (size!22640 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46350)

(declare-datatypes ((List!15859 0))(
  ( (Nil!15856) (Cons!15855 (h!16984 (_ BitVec 64)) (t!22208 List!15859)) )
))
(declare-fun arrayNoDuplicates!0 (array!46350 (_ BitVec 32) List!15859) Bool)

(assert (=> b!827407 (= res!563959 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15856))))

(declare-fun b!827408 () Bool)

(declare-fun res!563957 () Bool)

(assert (=> b!827408 (=> (not res!563957) (not e!460917))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46350 (_ BitVec 32)) Bool)

(assert (=> b!827408 (= res!563957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827409 () Bool)

(declare-fun res!563960 () Bool)

(assert (=> b!827409 (=> (not res!563960) (not e!460917))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25117 0))(
  ( (V!25118 (val!7591 Int)) )
))
(declare-datatypes ((ValueCell!7128 0))(
  ( (ValueCellFull!7128 (v!10026 V!25117)) (EmptyCell!7128) )
))
(declare-datatypes ((array!46352 0))(
  ( (array!46353 (arr!22220 (Array (_ BitVec 32) ValueCell!7128)) (size!22641 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46352)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827409 (= res!563960 (and (= (size!22641 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22640 _keys!976) (size!22641 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24259 () Bool)

(declare-fun mapRes!24259 () Bool)

(assert (=> mapIsEmpty!24259 mapRes!24259))

(declare-fun b!827410 () Bool)

(declare-fun e!460919 () Bool)

(declare-fun tp_is_empty!15087 () Bool)

(assert (=> b!827410 (= e!460919 tp_is_empty!15087)))

(declare-fun b!827411 () Bool)

(declare-fun e!460915 () Bool)

(assert (=> b!827411 (= e!460915 (and e!460919 mapRes!24259))))

(declare-fun condMapEmpty!24259 () Bool)

(declare-fun mapDefault!24259 () ValueCell!7128)

(assert (=> b!827411 (= condMapEmpty!24259 (= (arr!22220 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7128)) mapDefault!24259)))))

(declare-fun b!827412 () Bool)

(declare-fun e!460916 () Bool)

(assert (=> b!827412 (= e!460916 tp_is_empty!15087)))

(declare-fun mapNonEmpty!24259 () Bool)

(declare-fun tp!46894 () Bool)

(assert (=> mapNonEmpty!24259 (= mapRes!24259 (and tp!46894 e!460916))))

(declare-fun mapValue!24259 () ValueCell!7128)

(declare-fun mapRest!24259 () (Array (_ BitVec 32) ValueCell!7128))

(declare-fun mapKey!24259 () (_ BitVec 32))

(assert (=> mapNonEmpty!24259 (= (arr!22220 _values!788) (store mapRest!24259 mapKey!24259 mapValue!24259))))

(declare-fun b!827413 () Bool)

(assert (=> b!827413 (= e!460917 false)))

(declare-datatypes ((tuple2!10064 0))(
  ( (tuple2!10065 (_1!5043 (_ BitVec 64)) (_2!5043 V!25117)) )
))
(declare-datatypes ((List!15860 0))(
  ( (Nil!15857) (Cons!15856 (h!16985 tuple2!10064) (t!22209 List!15860)) )
))
(declare-datatypes ((ListLongMap!8887 0))(
  ( (ListLongMap!8888 (toList!4459 List!15860)) )
))
(declare-fun lt!374896 () ListLongMap!8887)

(declare-fun zeroValueAfter!34 () V!25117)

(declare-fun minValue!754 () V!25117)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2461 (array!46350 array!46352 (_ BitVec 32) (_ BitVec 32) V!25117 V!25117 (_ BitVec 32) Int) ListLongMap!8887)

(assert (=> b!827413 (= lt!374896 (getCurrentListMapNoExtraKeys!2461 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25117)

(declare-fun lt!374897 () ListLongMap!8887)

(assert (=> b!827413 (= lt!374897 (getCurrentListMapNoExtraKeys!2461 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!563958 () Bool)

(assert (=> start!71230 (=> (not res!563958) (not e!460917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71230 (= res!563958 (validMask!0 mask!1312))))

(assert (=> start!71230 e!460917))

(assert (=> start!71230 tp_is_empty!15087))

(declare-fun array_inv!17705 (array!46350) Bool)

(assert (=> start!71230 (array_inv!17705 _keys!976)))

(assert (=> start!71230 true))

(declare-fun array_inv!17706 (array!46352) Bool)

(assert (=> start!71230 (and (array_inv!17706 _values!788) e!460915)))

(assert (=> start!71230 tp!46893))

(assert (= (and start!71230 res!563958) b!827409))

(assert (= (and b!827409 res!563960) b!827408))

(assert (= (and b!827408 res!563957) b!827407))

(assert (= (and b!827407 res!563959) b!827413))

(assert (= (and b!827411 condMapEmpty!24259) mapIsEmpty!24259))

(assert (= (and b!827411 (not condMapEmpty!24259)) mapNonEmpty!24259))

(get-info :version)

(assert (= (and mapNonEmpty!24259 ((_ is ValueCellFull!7128) mapValue!24259)) b!827412))

(assert (= (and b!827411 ((_ is ValueCellFull!7128) mapDefault!24259)) b!827410))

(assert (= start!71230 b!827411))

(declare-fun m!770495 () Bool)

(assert (=> b!827413 m!770495))

(declare-fun m!770497 () Bool)

(assert (=> b!827413 m!770497))

(declare-fun m!770499 () Bool)

(assert (=> b!827408 m!770499))

(declare-fun m!770501 () Bool)

(assert (=> start!71230 m!770501))

(declare-fun m!770503 () Bool)

(assert (=> start!71230 m!770503))

(declare-fun m!770505 () Bool)

(assert (=> start!71230 m!770505))

(declare-fun m!770507 () Bool)

(assert (=> b!827407 m!770507))

(declare-fun m!770509 () Bool)

(assert (=> mapNonEmpty!24259 m!770509))

(check-sat (not b!827408) (not mapNonEmpty!24259) (not start!71230) tp_is_empty!15087 (not b!827413) (not b!827407) b_and!22315 (not b_next!13377))
(check-sat b_and!22315 (not b_next!13377))
