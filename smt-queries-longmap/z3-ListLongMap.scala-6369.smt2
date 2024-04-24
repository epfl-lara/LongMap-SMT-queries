; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82118 () Bool)

(assert start!82118)

(declare-fun b!956836 () Bool)

(declare-fun e!539107 () Bool)

(declare-fun tp_is_empty!20989 () Bool)

(assert (=> b!956836 (= e!539107 tp_is_empty!20989)))

(declare-fun b!956837 () Bool)

(declare-fun e!539110 () Bool)

(assert (=> b!956837 (= e!539110 false)))

(declare-fun lt!430422 () Bool)

(declare-datatypes ((array!58126 0))(
  ( (array!58127 (arr!27938 (Array (_ BitVec 32) (_ BitVec 64))) (size!28418 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58126)

(declare-datatypes ((List!19459 0))(
  ( (Nil!19456) (Cons!19455 (h!20623 (_ BitVec 64)) (t!27812 List!19459)) )
))
(declare-fun arrayNoDuplicates!0 (array!58126 (_ BitVec 32) List!19459) Bool)

(assert (=> b!956837 (= lt!430422 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19456))))

(declare-fun b!956838 () Bool)

(declare-fun res!640492 () Bool)

(assert (=> b!956838 (=> (not res!640492) (not e!539110))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58126 (_ BitVec 32)) Bool)

(assert (=> b!956838 (= res!640492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!640493 () Bool)

(assert (=> start!82118 (=> (not res!640493) (not e!539110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82118 (= res!640493 (validMask!0 mask!1823))))

(assert (=> start!82118 e!539110))

(assert (=> start!82118 true))

(declare-datatypes ((V!32969 0))(
  ( (V!32970 (val!10545 Int)) )
))
(declare-datatypes ((ValueCell!10013 0))(
  ( (ValueCellFull!10013 (v!13097 V!32969)) (EmptyCell!10013) )
))
(declare-datatypes ((array!58128 0))(
  ( (array!58129 (arr!27939 (Array (_ BitVec 32) ValueCell!10013)) (size!28419 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58128)

(declare-fun e!539106 () Bool)

(declare-fun array_inv!21755 (array!58128) Bool)

(assert (=> start!82118 (and (array_inv!21755 _values!1197) e!539106)))

(declare-fun array_inv!21756 (array!58126) Bool)

(assert (=> start!82118 (array_inv!21756 _keys!1441)))

(declare-fun b!956839 () Bool)

(declare-fun e!539109 () Bool)

(assert (=> b!956839 (= e!539109 tp_is_empty!20989)))

(declare-fun b!956840 () Bool)

(declare-fun mapRes!33445 () Bool)

(assert (=> b!956840 (= e!539106 (and e!539109 mapRes!33445))))

(declare-fun condMapEmpty!33445 () Bool)

(declare-fun mapDefault!33445 () ValueCell!10013)

(assert (=> b!956840 (= condMapEmpty!33445 (= (arr!27939 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10013)) mapDefault!33445)))))

(declare-fun b!956841 () Bool)

(declare-fun res!640491 () Bool)

(assert (=> b!956841 (=> (not res!640491) (not e!539110))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956841 (= res!640491 (and (= (size!28419 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28418 _keys!1441) (size!28419 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33445 () Bool)

(assert (=> mapIsEmpty!33445 mapRes!33445))

(declare-fun mapNonEmpty!33445 () Bool)

(declare-fun tp!64024 () Bool)

(assert (=> mapNonEmpty!33445 (= mapRes!33445 (and tp!64024 e!539107))))

(declare-fun mapKey!33445 () (_ BitVec 32))

(declare-fun mapValue!33445 () ValueCell!10013)

(declare-fun mapRest!33445 () (Array (_ BitVec 32) ValueCell!10013))

(assert (=> mapNonEmpty!33445 (= (arr!27939 _values!1197) (store mapRest!33445 mapKey!33445 mapValue!33445))))

(assert (= (and start!82118 res!640493) b!956841))

(assert (= (and b!956841 res!640491) b!956838))

(assert (= (and b!956838 res!640492) b!956837))

(assert (= (and b!956840 condMapEmpty!33445) mapIsEmpty!33445))

(assert (= (and b!956840 (not condMapEmpty!33445)) mapNonEmpty!33445))

(get-info :version)

(assert (= (and mapNonEmpty!33445 ((_ is ValueCellFull!10013) mapValue!33445)) b!956836))

(assert (= (and b!956840 ((_ is ValueCellFull!10013) mapDefault!33445)) b!956839))

(assert (= start!82118 b!956840))

(declare-fun m!888675 () Bool)

(assert (=> b!956837 m!888675))

(declare-fun m!888677 () Bool)

(assert (=> b!956838 m!888677))

(declare-fun m!888679 () Bool)

(assert (=> start!82118 m!888679))

(declare-fun m!888681 () Bool)

(assert (=> start!82118 m!888681))

(declare-fun m!888683 () Bool)

(assert (=> start!82118 m!888683))

(declare-fun m!888685 () Bool)

(assert (=> mapNonEmpty!33445 m!888685))

(check-sat tp_is_empty!20989 (not mapNonEmpty!33445) (not b!956838) (not b!956837) (not start!82118))
(check-sat)
