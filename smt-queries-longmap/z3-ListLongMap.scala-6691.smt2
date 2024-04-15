; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84100 () Bool)

(assert start!84100)

(declare-fun b!983315 () Bool)

(declare-fun e!554311 () Bool)

(declare-fun e!554310 () Bool)

(declare-fun mapRes!36410 () Bool)

(assert (=> b!983315 (= e!554311 (and e!554310 mapRes!36410))))

(declare-fun condMapEmpty!36410 () Bool)

(declare-datatypes ((V!35545 0))(
  ( (V!35546 (val!11511 Int)) )
))
(declare-datatypes ((ValueCell!10979 0))(
  ( (ValueCellFull!10979 (v!14072 V!35545)) (EmptyCell!10979) )
))
(declare-datatypes ((array!61760 0))(
  ( (array!61761 (arr!29738 (Array (_ BitVec 32) ValueCell!10979)) (size!30219 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61760)

(declare-fun mapDefault!36410 () ValueCell!10979)

(assert (=> b!983315 (= condMapEmpty!36410 (= (arr!29738 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10979)) mapDefault!36410)))))

(declare-fun b!983316 () Bool)

(declare-fun res!658043 () Bool)

(declare-fun e!554312 () Bool)

(assert (=> b!983316 (=> (not res!658043) (not e!554312))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61762 0))(
  ( (array!61763 (arr!29739 (Array (_ BitVec 32) (_ BitVec 64))) (size!30220 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61762)

(assert (=> b!983316 (= res!658043 (and (= (size!30219 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30220 _keys!1544) (size!30219 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983317 () Bool)

(declare-fun e!554308 () Bool)

(declare-fun tp_is_empty!22921 () Bool)

(assert (=> b!983317 (= e!554308 tp_is_empty!22921)))

(declare-fun b!983318 () Bool)

(assert (=> b!983318 (= e!554310 tp_is_empty!22921)))

(declare-fun res!658044 () Bool)

(assert (=> start!84100 (=> (not res!658044) (not e!554312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84100 (= res!658044 (validMask!0 mask!1948))))

(assert (=> start!84100 e!554312))

(assert (=> start!84100 true))

(declare-fun array_inv!23001 (array!61760) Bool)

(assert (=> start!84100 (and (array_inv!23001 _values!1278) e!554311)))

(declare-fun array_inv!23002 (array!61762) Bool)

(assert (=> start!84100 (array_inv!23002 _keys!1544)))

(declare-fun mapIsEmpty!36410 () Bool)

(assert (=> mapIsEmpty!36410 mapRes!36410))

(declare-fun b!983319 () Bool)

(declare-fun res!658042 () Bool)

(assert (=> b!983319 (=> (not res!658042) (not e!554312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61762 (_ BitVec 32)) Bool)

(assert (=> b!983319 (= res!658042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983320 () Bool)

(assert (=> b!983320 (= e!554312 false)))

(declare-fun lt!436302 () Bool)

(declare-datatypes ((List!20654 0))(
  ( (Nil!20651) (Cons!20650 (h!21812 (_ BitVec 64)) (t!29436 List!20654)) )
))
(declare-fun arrayNoDuplicates!0 (array!61762 (_ BitVec 32) List!20654) Bool)

(assert (=> b!983320 (= lt!436302 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20651))))

(declare-fun mapNonEmpty!36410 () Bool)

(declare-fun tp!69095 () Bool)

(assert (=> mapNonEmpty!36410 (= mapRes!36410 (and tp!69095 e!554308))))

(declare-fun mapKey!36410 () (_ BitVec 32))

(declare-fun mapValue!36410 () ValueCell!10979)

(declare-fun mapRest!36410 () (Array (_ BitVec 32) ValueCell!10979))

(assert (=> mapNonEmpty!36410 (= (arr!29738 _values!1278) (store mapRest!36410 mapKey!36410 mapValue!36410))))

(assert (= (and start!84100 res!658044) b!983316))

(assert (= (and b!983316 res!658043) b!983319))

(assert (= (and b!983319 res!658042) b!983320))

(assert (= (and b!983315 condMapEmpty!36410) mapIsEmpty!36410))

(assert (= (and b!983315 (not condMapEmpty!36410)) mapNonEmpty!36410))

(get-info :version)

(assert (= (and mapNonEmpty!36410 ((_ is ValueCellFull!10979) mapValue!36410)) b!983317))

(assert (= (and b!983315 ((_ is ValueCellFull!10979) mapDefault!36410)) b!983318))

(assert (= start!84100 b!983315))

(declare-fun m!910031 () Bool)

(assert (=> start!84100 m!910031))

(declare-fun m!910033 () Bool)

(assert (=> start!84100 m!910033))

(declare-fun m!910035 () Bool)

(assert (=> start!84100 m!910035))

(declare-fun m!910037 () Bool)

(assert (=> b!983319 m!910037))

(declare-fun m!910039 () Bool)

(assert (=> b!983320 m!910039))

(declare-fun m!910041 () Bool)

(assert (=> mapNonEmpty!36410 m!910041))

(check-sat tp_is_empty!22921 (not b!983319) (not mapNonEmpty!36410) (not b!983320) (not start!84100))
(check-sat)
