; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110482 () Bool)

(assert start!110482)

(declare-fun mapIsEmpty!54199 () Bool)

(declare-fun mapRes!54199 () Bool)

(assert (=> mapIsEmpty!54199 mapRes!54199))

(declare-fun b!1306880 () Bool)

(declare-fun res!867540 () Bool)

(declare-fun e!745707 () Bool)

(assert (=> b!1306880 (=> (not res!867540) (not e!745707))))

(declare-datatypes ((array!87011 0))(
  ( (array!87012 (arr!41986 (Array (_ BitVec 32) (_ BitVec 64))) (size!42538 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87011)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51833 0))(
  ( (V!51834 (val!17598 Int)) )
))
(declare-datatypes ((ValueCell!16625 0))(
  ( (ValueCellFull!16625 (v!20224 V!51833)) (EmptyCell!16625) )
))
(declare-datatypes ((array!87013 0))(
  ( (array!87014 (arr!41987 (Array (_ BitVec 32) ValueCell!16625)) (size!42539 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87013)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306880 (= res!867540 (and (= (size!42539 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42538 _keys!1628) (size!42539 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306881 () Bool)

(declare-fun res!867541 () Bool)

(assert (=> b!1306881 (=> (not res!867541) (not e!745707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87011 (_ BitVec 32)) Bool)

(assert (=> b!1306881 (= res!867541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun b!1306882 () Bool)

(assert (=> b!1306882 (= e!745707 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42538 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!2020 (size!42538 _keys!1628))))))

(declare-fun b!1306883 () Bool)

(declare-fun e!745705 () Bool)

(declare-fun tp_is_empty!35047 () Bool)

(assert (=> b!1306883 (= e!745705 tp_is_empty!35047)))

(declare-fun mapNonEmpty!54199 () Bool)

(declare-fun tp!103280 () Bool)

(declare-fun e!745708 () Bool)

(assert (=> mapNonEmpty!54199 (= mapRes!54199 (and tp!103280 e!745708))))

(declare-fun mapRest!54199 () (Array (_ BitVec 32) ValueCell!16625))

(declare-fun mapKey!54199 () (_ BitVec 32))

(declare-fun mapValue!54199 () ValueCell!16625)

(assert (=> mapNonEmpty!54199 (= (arr!41987 _values!1354) (store mapRest!54199 mapKey!54199 mapValue!54199))))

(declare-fun b!1306884 () Bool)

(assert (=> b!1306884 (= e!745708 tp_is_empty!35047)))

(declare-fun res!867538 () Bool)

(assert (=> start!110482 (=> (not res!867538) (not e!745707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110482 (= res!867538 (validMask!0 mask!2040))))

(assert (=> start!110482 e!745707))

(declare-fun array_inv!31931 (array!87011) Bool)

(assert (=> start!110482 (array_inv!31931 _keys!1628)))

(assert (=> start!110482 true))

(declare-fun e!745706 () Bool)

(declare-fun array_inv!31932 (array!87013) Bool)

(assert (=> start!110482 (and (array_inv!31932 _values!1354) e!745706)))

(declare-fun b!1306885 () Bool)

(assert (=> b!1306885 (= e!745706 (and e!745705 mapRes!54199))))

(declare-fun condMapEmpty!54199 () Bool)

(declare-fun mapDefault!54199 () ValueCell!16625)

(assert (=> b!1306885 (= condMapEmpty!54199 (= (arr!41987 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16625)) mapDefault!54199)))))

(declare-fun b!1306886 () Bool)

(declare-fun res!867539 () Bool)

(assert (=> b!1306886 (=> (not res!867539) (not e!745707))))

(declare-datatypes ((List!29855 0))(
  ( (Nil!29852) (Cons!29851 (h!31060 (_ BitVec 64)) (t!43453 List!29855)) )
))
(declare-fun arrayNoDuplicates!0 (array!87011 (_ BitVec 32) List!29855) Bool)

(assert (=> b!1306886 (= res!867539 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29852))))

(assert (= (and start!110482 res!867538) b!1306880))

(assert (= (and b!1306880 res!867540) b!1306881))

(assert (= (and b!1306881 res!867541) b!1306886))

(assert (= (and b!1306886 res!867539) b!1306882))

(assert (= (and b!1306885 condMapEmpty!54199) mapIsEmpty!54199))

(assert (= (and b!1306885 (not condMapEmpty!54199)) mapNonEmpty!54199))

(get-info :version)

(assert (= (and mapNonEmpty!54199 ((_ is ValueCellFull!16625) mapValue!54199)) b!1306884))

(assert (= (and b!1306885 ((_ is ValueCellFull!16625) mapDefault!54199)) b!1306883))

(assert (= start!110482 b!1306885))

(declare-fun m!1197297 () Bool)

(assert (=> b!1306881 m!1197297))

(declare-fun m!1197299 () Bool)

(assert (=> mapNonEmpty!54199 m!1197299))

(declare-fun m!1197301 () Bool)

(assert (=> start!110482 m!1197301))

(declare-fun m!1197303 () Bool)

(assert (=> start!110482 m!1197303))

(declare-fun m!1197305 () Bool)

(assert (=> start!110482 m!1197305))

(declare-fun m!1197307 () Bool)

(assert (=> b!1306886 m!1197307))

(check-sat (not b!1306886) (not start!110482) tp_is_empty!35047 (not mapNonEmpty!54199) (not b!1306881))
(check-sat)
