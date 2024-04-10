; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97026 () Bool)

(assert start!97026)

(declare-fun b!1103594 () Bool)

(declare-fun e!629991 () Bool)

(declare-fun tp_is_empty!27315 () Bool)

(assert (=> b!1103594 (= e!629991 tp_is_empty!27315)))

(declare-fun b!1103595 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((array!71553 0))(
  ( (array!71554 (arr!34433 (Array (_ BitVec 32) (_ BitVec 64))) (size!34969 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71553)

(declare-fun e!629989 () Bool)

(assert (=> b!1103595 (= e!629989 (and (= (select (arr!34433 _keys!1208) i!673) k0!934) (not (= (size!34969 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)))))))

(declare-fun b!1103596 () Bool)

(declare-fun res!736254 () Bool)

(assert (=> b!1103596 (=> (not res!736254) (not e!629989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71553 (_ BitVec 32)) Bool)

(assert (=> b!1103596 (= res!736254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103597 () Bool)

(declare-fun res!736253 () Bool)

(assert (=> b!1103597 (=> (not res!736253) (not e!629989))))

(assert (=> b!1103597 (= res!736253 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34969 _keys!1208))))))

(declare-fun mapIsEmpty!42778 () Bool)

(declare-fun mapRes!42778 () Bool)

(assert (=> mapIsEmpty!42778 mapRes!42778))

(declare-fun res!736257 () Bool)

(assert (=> start!97026 (=> (not res!736257) (not e!629989))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97026 (= res!736257 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34969 _keys!1208))))))

(assert (=> start!97026 e!629989))

(declare-fun array_inv!26516 (array!71553) Bool)

(assert (=> start!97026 (array_inv!26516 _keys!1208)))

(assert (=> start!97026 true))

(declare-datatypes ((V!41547 0))(
  ( (V!41548 (val!13714 Int)) )
))
(declare-datatypes ((ValueCell!12948 0))(
  ( (ValueCellFull!12948 (v!16346 V!41547)) (EmptyCell!12948) )
))
(declare-datatypes ((array!71555 0))(
  ( (array!71556 (arr!34434 (Array (_ BitVec 32) ValueCell!12948)) (size!34970 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71555)

(declare-fun e!629987 () Bool)

(declare-fun array_inv!26517 (array!71555) Bool)

(assert (=> start!97026 (and (array_inv!26517 _values!996) e!629987)))

(declare-fun b!1103598 () Bool)

(declare-fun res!736256 () Bool)

(assert (=> b!1103598 (=> (not res!736256) (not e!629989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103598 (= res!736256 (validMask!0 mask!1564))))

(declare-fun b!1103599 () Bool)

(declare-fun e!629990 () Bool)

(assert (=> b!1103599 (= e!629987 (and e!629990 mapRes!42778))))

(declare-fun condMapEmpty!42778 () Bool)

(declare-fun mapDefault!42778 () ValueCell!12948)

(assert (=> b!1103599 (= condMapEmpty!42778 (= (arr!34434 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12948)) mapDefault!42778)))))

(declare-fun b!1103600 () Bool)

(declare-fun res!736252 () Bool)

(assert (=> b!1103600 (=> (not res!736252) (not e!629989))))

(declare-datatypes ((List!24043 0))(
  ( (Nil!24040) (Cons!24039 (h!25248 (_ BitVec 64)) (t!34308 List!24043)) )
))
(declare-fun arrayNoDuplicates!0 (array!71553 (_ BitVec 32) List!24043) Bool)

(assert (=> b!1103600 (= res!736252 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24040))))

(declare-fun b!1103601 () Bool)

(declare-fun res!736251 () Bool)

(assert (=> b!1103601 (=> (not res!736251) (not e!629989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103601 (= res!736251 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!42778 () Bool)

(declare-fun tp!81698 () Bool)

(assert (=> mapNonEmpty!42778 (= mapRes!42778 (and tp!81698 e!629991))))

(declare-fun mapKey!42778 () (_ BitVec 32))

(declare-fun mapValue!42778 () ValueCell!12948)

(declare-fun mapRest!42778 () (Array (_ BitVec 32) ValueCell!12948))

(assert (=> mapNonEmpty!42778 (= (arr!34434 _values!996) (store mapRest!42778 mapKey!42778 mapValue!42778))))

(declare-fun b!1103602 () Bool)

(assert (=> b!1103602 (= e!629990 tp_is_empty!27315)))

(declare-fun b!1103603 () Bool)

(declare-fun res!736255 () Bool)

(assert (=> b!1103603 (=> (not res!736255) (not e!629989))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1103603 (= res!736255 (and (= (size!34970 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34969 _keys!1208) (size!34970 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97026 res!736257) b!1103598))

(assert (= (and b!1103598 res!736256) b!1103603))

(assert (= (and b!1103603 res!736255) b!1103596))

(assert (= (and b!1103596 res!736254) b!1103600))

(assert (= (and b!1103600 res!736252) b!1103597))

(assert (= (and b!1103597 res!736253) b!1103601))

(assert (= (and b!1103601 res!736251) b!1103595))

(assert (= (and b!1103599 condMapEmpty!42778) mapIsEmpty!42778))

(assert (= (and b!1103599 (not condMapEmpty!42778)) mapNonEmpty!42778))

(get-info :version)

(assert (= (and mapNonEmpty!42778 ((_ is ValueCellFull!12948) mapValue!42778)) b!1103594))

(assert (= (and b!1103599 ((_ is ValueCellFull!12948) mapDefault!42778)) b!1103602))

(assert (= start!97026 b!1103599))

(declare-fun m!1023685 () Bool)

(assert (=> mapNonEmpty!42778 m!1023685))

(declare-fun m!1023687 () Bool)

(assert (=> b!1103600 m!1023687))

(declare-fun m!1023689 () Bool)

(assert (=> b!1103598 m!1023689))

(declare-fun m!1023691 () Bool)

(assert (=> b!1103595 m!1023691))

(declare-fun m!1023693 () Bool)

(assert (=> b!1103596 m!1023693))

(declare-fun m!1023695 () Bool)

(assert (=> b!1103601 m!1023695))

(declare-fun m!1023697 () Bool)

(assert (=> start!97026 m!1023697))

(declare-fun m!1023699 () Bool)

(assert (=> start!97026 m!1023699))

(check-sat tp_is_empty!27315 (not b!1103601) (not mapNonEmpty!42778) (not b!1103598) (not b!1103600) (not b!1103596) (not start!97026))
(check-sat)
