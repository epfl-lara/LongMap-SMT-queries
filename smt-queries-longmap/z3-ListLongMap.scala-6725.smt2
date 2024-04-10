; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84324 () Bool)

(assert start!84324)

(declare-fun mapNonEmpty!36719 () Bool)

(declare-fun mapRes!36719 () Bool)

(declare-fun tp!69574 () Bool)

(declare-fun e!556163 () Bool)

(assert (=> mapNonEmpty!36719 (= mapRes!36719 (and tp!69574 e!556163))))

(declare-datatypes ((V!35819 0))(
  ( (V!35820 (val!11614 Int)) )
))
(declare-datatypes ((ValueCell!11082 0))(
  ( (ValueCellFull!11082 (v!14176 V!35819)) (EmptyCell!11082) )
))
(declare-fun mapRest!36719 () (Array (_ BitVec 32) ValueCell!11082))

(declare-datatypes ((array!62221 0))(
  ( (array!62222 (arr!29968 (Array (_ BitVec 32) ValueCell!11082)) (size!30447 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62221)

(declare-fun mapKey!36719 () (_ BitVec 32))

(declare-fun mapValue!36719 () ValueCell!11082)

(assert (=> mapNonEmpty!36719 (= (arr!29968 _values!1278) (store mapRest!36719 mapKey!36719 mapValue!36719))))

(declare-fun b!986416 () Bool)

(declare-fun e!556164 () Bool)

(declare-fun e!556167 () Bool)

(assert (=> b!986416 (= e!556164 (and e!556167 mapRes!36719))))

(declare-fun condMapEmpty!36719 () Bool)

(declare-fun mapDefault!36719 () ValueCell!11082)

(assert (=> b!986416 (= condMapEmpty!36719 (= (arr!29968 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11082)) mapDefault!36719)))))

(declare-fun b!986417 () Bool)

(declare-fun res!659981 () Bool)

(declare-fun e!556166 () Bool)

(assert (=> b!986417 (=> (not res!659981) (not e!556166))))

(declare-datatypes ((array!62223 0))(
  ( (array!62224 (arr!29969 (Array (_ BitVec 32) (_ BitVec 64))) (size!30448 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62223)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62223 (_ BitVec 32)) Bool)

(assert (=> b!986417 (= res!659981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986418 () Bool)

(declare-fun res!659979 () Bool)

(assert (=> b!986418 (=> (not res!659979) (not e!556166))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986418 (= res!659979 (and (= (size!30447 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30448 _keys!1544) (size!30447 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!659980 () Bool)

(assert (=> start!84324 (=> (not res!659980) (not e!556166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84324 (= res!659980 (validMask!0 mask!1948))))

(assert (=> start!84324 e!556166))

(assert (=> start!84324 true))

(declare-fun array_inv!23163 (array!62221) Bool)

(assert (=> start!84324 (and (array_inv!23163 _values!1278) e!556164)))

(declare-fun array_inv!23164 (array!62223) Bool)

(assert (=> start!84324 (array_inv!23164 _keys!1544)))

(declare-fun b!986419 () Bool)

(declare-fun tp_is_empty!23127 () Bool)

(assert (=> b!986419 (= e!556163 tp_is_empty!23127)))

(declare-fun b!986420 () Bool)

(assert (=> b!986420 (= e!556166 false)))

(declare-fun lt!437486 () Bool)

(declare-datatypes ((List!20742 0))(
  ( (Nil!20739) (Cons!20738 (h!21900 (_ BitVec 64)) (t!29641 List!20742)) )
))
(declare-fun arrayNoDuplicates!0 (array!62223 (_ BitVec 32) List!20742) Bool)

(assert (=> b!986420 (= lt!437486 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20739))))

(declare-fun mapIsEmpty!36719 () Bool)

(assert (=> mapIsEmpty!36719 mapRes!36719))

(declare-fun b!986421 () Bool)

(assert (=> b!986421 (= e!556167 tp_is_empty!23127)))

(assert (= (and start!84324 res!659980) b!986418))

(assert (= (and b!986418 res!659979) b!986417))

(assert (= (and b!986417 res!659981) b!986420))

(assert (= (and b!986416 condMapEmpty!36719) mapIsEmpty!36719))

(assert (= (and b!986416 (not condMapEmpty!36719)) mapNonEmpty!36719))

(get-info :version)

(assert (= (and mapNonEmpty!36719 ((_ is ValueCellFull!11082) mapValue!36719)) b!986419))

(assert (= (and b!986416 ((_ is ValueCellFull!11082) mapDefault!36719)) b!986421))

(assert (= start!84324 b!986416))

(declare-fun m!913255 () Bool)

(assert (=> mapNonEmpty!36719 m!913255))

(declare-fun m!913257 () Bool)

(assert (=> b!986417 m!913257))

(declare-fun m!913259 () Bool)

(assert (=> start!84324 m!913259))

(declare-fun m!913261 () Bool)

(assert (=> start!84324 m!913261))

(declare-fun m!913263 () Bool)

(assert (=> start!84324 m!913263))

(declare-fun m!913265 () Bool)

(assert (=> b!986420 m!913265))

(check-sat (not start!84324) (not mapNonEmpty!36719) (not b!986417) tp_is_empty!23127 (not b!986420))
(check-sat)
