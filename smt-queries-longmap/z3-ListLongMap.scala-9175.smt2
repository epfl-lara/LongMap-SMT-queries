; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110356 () Bool)

(assert start!110356)

(declare-fun b!1306092 () Bool)

(declare-fun e!745028 () Bool)

(declare-fun tp_is_empty!34965 () Bool)

(assert (=> b!1306092 (= e!745028 tp_is_empty!34965)))

(declare-fun res!867142 () Bool)

(declare-fun e!745030 () Bool)

(assert (=> start!110356 (=> (not res!867142) (not e!745030))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110356 (= res!867142 (validMask!0 mask!2040))))

(assert (=> start!110356 e!745030))

(assert (=> start!110356 true))

(declare-datatypes ((V!51723 0))(
  ( (V!51724 (val!17557 Int)) )
))
(declare-datatypes ((ValueCell!16584 0))(
  ( (ValueCellFull!16584 (v!20183 V!51723)) (EmptyCell!16584) )
))
(declare-datatypes ((array!86946 0))(
  ( (array!86947 (arr!41958 (Array (_ BitVec 32) ValueCell!16584)) (size!42508 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86946)

(declare-fun e!745029 () Bool)

(declare-fun array_inv!31725 (array!86946) Bool)

(assert (=> start!110356 (and (array_inv!31725 _values!1354) e!745029)))

(declare-datatypes ((array!86948 0))(
  ( (array!86949 (arr!41959 (Array (_ BitVec 32) (_ BitVec 64))) (size!42509 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86948)

(declare-fun array_inv!31726 (array!86948) Bool)

(assert (=> start!110356 (array_inv!31726 _keys!1628)))

(declare-fun b!1306093 () Bool)

(declare-fun e!745031 () Bool)

(assert (=> b!1306093 (= e!745031 tp_is_empty!34965)))

(declare-fun mapIsEmpty!54061 () Bool)

(declare-fun mapRes!54061 () Bool)

(assert (=> mapIsEmpty!54061 mapRes!54061))

(declare-fun b!1306094 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306094 (= e!745030 (and (= (size!42508 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42509 _keys!1628) (size!42508 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011) (not (= (size!42509 _keys!1628) (bvadd #b00000000000000000000000000000001 mask!2040)))))))

(declare-fun mapNonEmpty!54061 () Bool)

(declare-fun tp!103141 () Bool)

(assert (=> mapNonEmpty!54061 (= mapRes!54061 (and tp!103141 e!745028))))

(declare-fun mapValue!54061 () ValueCell!16584)

(declare-fun mapRest!54061 () (Array (_ BitVec 32) ValueCell!16584))

(declare-fun mapKey!54061 () (_ BitVec 32))

(assert (=> mapNonEmpty!54061 (= (arr!41958 _values!1354) (store mapRest!54061 mapKey!54061 mapValue!54061))))

(declare-fun b!1306095 () Bool)

(assert (=> b!1306095 (= e!745029 (and e!745031 mapRes!54061))))

(declare-fun condMapEmpty!54061 () Bool)

(declare-fun mapDefault!54061 () ValueCell!16584)

(assert (=> b!1306095 (= condMapEmpty!54061 (= (arr!41958 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16584)) mapDefault!54061)))))

(assert (= (and start!110356 res!867142) b!1306094))

(assert (= (and b!1306095 condMapEmpty!54061) mapIsEmpty!54061))

(assert (= (and b!1306095 (not condMapEmpty!54061)) mapNonEmpty!54061))

(get-info :version)

(assert (= (and mapNonEmpty!54061 ((_ is ValueCellFull!16584) mapValue!54061)) b!1306092))

(assert (= (and b!1306095 ((_ is ValueCellFull!16584) mapDefault!54061)) b!1306093))

(assert (= start!110356 b!1306095))

(declare-fun m!1197265 () Bool)

(assert (=> start!110356 m!1197265))

(declare-fun m!1197267 () Bool)

(assert (=> start!110356 m!1197267))

(declare-fun m!1197269 () Bool)

(assert (=> start!110356 m!1197269))

(declare-fun m!1197271 () Bool)

(assert (=> mapNonEmpty!54061 m!1197271))

(check-sat (not start!110356) (not mapNonEmpty!54061) tp_is_empty!34965)
(check-sat)
