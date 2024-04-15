; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81938 () Bool)

(assert start!81938)

(declare-fun b!955748 () Bool)

(declare-fun e!538425 () Bool)

(declare-fun e!538422 () Bool)

(declare-fun mapRes!33454 () Bool)

(assert (=> b!955748 (= e!538425 (and e!538422 mapRes!33454))))

(declare-fun condMapEmpty!33454 () Bool)

(declare-datatypes ((V!32977 0))(
  ( (V!32978 (val!10548 Int)) )
))
(declare-datatypes ((ValueCell!10016 0))(
  ( (ValueCellFull!10016 (v!13102 V!32977)) (EmptyCell!10016) )
))
(declare-datatypes ((array!58046 0))(
  ( (array!58047 (arr!27903 (Array (_ BitVec 32) ValueCell!10016)) (size!28384 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58046)

(declare-fun mapDefault!33454 () ValueCell!10016)

(assert (=> b!955748 (= condMapEmpty!33454 (= (arr!27903 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10016)) mapDefault!33454)))))

(declare-fun res!640065 () Bool)

(declare-fun e!538423 () Bool)

(assert (=> start!81938 (=> (not res!640065) (not e!538423))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81938 (= res!640065 (validMask!0 mask!1823))))

(assert (=> start!81938 e!538423))

(assert (=> start!81938 true))

(declare-fun array_inv!21715 (array!58046) Bool)

(assert (=> start!81938 (and (array_inv!21715 _values!1197) e!538425)))

(declare-datatypes ((array!58048 0))(
  ( (array!58049 (arr!27904 (Array (_ BitVec 32) (_ BitVec 64))) (size!28385 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58048)

(declare-fun array_inv!21716 (array!58048) Bool)

(assert (=> start!81938 (array_inv!21716 _keys!1441)))

(declare-fun mapNonEmpty!33454 () Bool)

(declare-fun tp!64033 () Bool)

(declare-fun e!538421 () Bool)

(assert (=> mapNonEmpty!33454 (= mapRes!33454 (and tp!64033 e!538421))))

(declare-fun mapRest!33454 () (Array (_ BitVec 32) ValueCell!10016))

(declare-fun mapKey!33454 () (_ BitVec 32))

(declare-fun mapValue!33454 () ValueCell!10016)

(assert (=> mapNonEmpty!33454 (= (arr!27903 _values!1197) (store mapRest!33454 mapKey!33454 mapValue!33454))))

(declare-fun mapIsEmpty!33454 () Bool)

(assert (=> mapIsEmpty!33454 mapRes!33454))

(declare-fun b!955749 () Bool)

(declare-fun res!640064 () Bool)

(assert (=> b!955749 (=> (not res!640064) (not e!538423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58048 (_ BitVec 32)) Bool)

(assert (=> b!955749 (= res!640064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955750 () Bool)

(declare-fun tp_is_empty!20995 () Bool)

(assert (=> b!955750 (= e!538422 tp_is_empty!20995)))

(declare-fun b!955751 () Bool)

(assert (=> b!955751 (= e!538423 false)))

(declare-fun lt!429834 () Bool)

(declare-datatypes ((List!19476 0))(
  ( (Nil!19473) (Cons!19472 (h!20634 (_ BitVec 64)) (t!27828 List!19476)) )
))
(declare-fun arrayNoDuplicates!0 (array!58048 (_ BitVec 32) List!19476) Bool)

(assert (=> b!955751 (= lt!429834 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19473))))

(declare-fun b!955752 () Bool)

(declare-fun res!640066 () Bool)

(assert (=> b!955752 (=> (not res!640066) (not e!538423))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955752 (= res!640066 (and (= (size!28384 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28385 _keys!1441) (size!28384 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955753 () Bool)

(assert (=> b!955753 (= e!538421 tp_is_empty!20995)))

(assert (= (and start!81938 res!640065) b!955752))

(assert (= (and b!955752 res!640066) b!955749))

(assert (= (and b!955749 res!640064) b!955751))

(assert (= (and b!955748 condMapEmpty!33454) mapIsEmpty!33454))

(assert (= (and b!955748 (not condMapEmpty!33454)) mapNonEmpty!33454))

(get-info :version)

(assert (= (and mapNonEmpty!33454 ((_ is ValueCellFull!10016) mapValue!33454)) b!955753))

(assert (= (and b!955748 ((_ is ValueCellFull!10016) mapDefault!33454)) b!955750))

(assert (= start!81938 b!955748))

(declare-fun m!886659 () Bool)

(assert (=> start!81938 m!886659))

(declare-fun m!886661 () Bool)

(assert (=> start!81938 m!886661))

(declare-fun m!886663 () Bool)

(assert (=> start!81938 m!886663))

(declare-fun m!886665 () Bool)

(assert (=> mapNonEmpty!33454 m!886665))

(declare-fun m!886667 () Bool)

(assert (=> b!955749 m!886667))

(declare-fun m!886669 () Bool)

(assert (=> b!955751 m!886669))

(check-sat tp_is_empty!20995 (not b!955749) (not b!955751) (not start!81938) (not mapNonEmpty!33454))
(check-sat)
