; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84268 () Bool)

(assert start!84268)

(declare-fun b!984295 () Bool)

(declare-fun e!554903 () Bool)

(declare-fun tp_is_empty!22903 () Bool)

(assert (=> b!984295 (= e!554903 tp_is_empty!22903)))

(declare-fun b!984296 () Bool)

(declare-fun e!554907 () Bool)

(assert (=> b!984296 (= e!554907 tp_is_empty!22903)))

(declare-fun res!658417 () Bool)

(declare-fun e!554905 () Bool)

(assert (=> start!84268 (=> (not res!658417) (not e!554905))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84268 (= res!658417 (validMask!0 mask!1948))))

(assert (=> start!84268 e!554905))

(assert (=> start!84268 true))

(declare-datatypes ((V!35521 0))(
  ( (V!35522 (val!11502 Int)) )
))
(declare-datatypes ((ValueCell!10970 0))(
  ( (ValueCellFull!10970 (v!14061 V!35521)) (EmptyCell!10970) )
))
(declare-datatypes ((array!61832 0))(
  ( (array!61833 (arr!29769 (Array (_ BitVec 32) ValueCell!10970)) (size!30249 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61832)

(declare-fun e!554906 () Bool)

(declare-fun array_inv!23035 (array!61832) Bool)

(assert (=> start!84268 (and (array_inv!23035 _values!1278) e!554906)))

(declare-datatypes ((array!61834 0))(
  ( (array!61835 (arr!29770 (Array (_ BitVec 32) (_ BitVec 64))) (size!30250 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61834)

(declare-fun array_inv!23036 (array!61834) Bool)

(assert (=> start!84268 (array_inv!23036 _keys!1544)))

(declare-fun b!984297 () Bool)

(declare-fun res!658416 () Bool)

(assert (=> b!984297 (=> (not res!658416) (not e!554905))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984297 (= res!658416 (and (= (size!30249 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30250 _keys!1544) (size!30249 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36383 () Bool)

(declare-fun mapRes!36383 () Bool)

(assert (=> mapIsEmpty!36383 mapRes!36383))

(declare-fun b!984298 () Bool)

(declare-fun res!658415 () Bool)

(assert (=> b!984298 (=> (not res!658415) (not e!554905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61834 (_ BitVec 32)) Bool)

(assert (=> b!984298 (= res!658415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984299 () Bool)

(assert (=> b!984299 (= e!554905 false)))

(declare-fun lt!436872 () Bool)

(declare-datatypes ((List!20626 0))(
  ( (Nil!20623) (Cons!20622 (h!21790 (_ BitVec 64)) (t!29409 List!20626)) )
))
(declare-fun arrayNoDuplicates!0 (array!61834 (_ BitVec 32) List!20626) Bool)

(assert (=> b!984299 (= lt!436872 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20623))))

(declare-fun mapNonEmpty!36383 () Bool)

(declare-fun tp!69068 () Bool)

(assert (=> mapNonEmpty!36383 (= mapRes!36383 (and tp!69068 e!554907))))

(declare-fun mapRest!36383 () (Array (_ BitVec 32) ValueCell!10970))

(declare-fun mapKey!36383 () (_ BitVec 32))

(declare-fun mapValue!36383 () ValueCell!10970)

(assert (=> mapNonEmpty!36383 (= (arr!29769 _values!1278) (store mapRest!36383 mapKey!36383 mapValue!36383))))

(declare-fun b!984300 () Bool)

(assert (=> b!984300 (= e!554906 (and e!554903 mapRes!36383))))

(declare-fun condMapEmpty!36383 () Bool)

(declare-fun mapDefault!36383 () ValueCell!10970)

(assert (=> b!984300 (= condMapEmpty!36383 (= (arr!29769 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10970)) mapDefault!36383)))))

(assert (= (and start!84268 res!658417) b!984297))

(assert (= (and b!984297 res!658416) b!984298))

(assert (= (and b!984298 res!658415) b!984299))

(assert (= (and b!984300 condMapEmpty!36383) mapIsEmpty!36383))

(assert (= (and b!984300 (not condMapEmpty!36383)) mapNonEmpty!36383))

(get-info :version)

(assert (= (and mapNonEmpty!36383 ((_ is ValueCellFull!10970) mapValue!36383)) b!984296))

(assert (= (and b!984300 ((_ is ValueCellFull!10970) mapDefault!36383)) b!984295))

(assert (= start!84268 b!984300))

(declare-fun m!911975 () Bool)

(assert (=> start!84268 m!911975))

(declare-fun m!911977 () Bool)

(assert (=> start!84268 m!911977))

(declare-fun m!911979 () Bool)

(assert (=> start!84268 m!911979))

(declare-fun m!911981 () Bool)

(assert (=> b!984298 m!911981))

(declare-fun m!911983 () Bool)

(assert (=> b!984299 m!911983))

(declare-fun m!911985 () Bool)

(assert (=> mapNonEmpty!36383 m!911985))

(check-sat (not b!984299) (not mapNonEmpty!36383) (not b!984298) tp_is_empty!22903 (not start!84268))
(check-sat)
