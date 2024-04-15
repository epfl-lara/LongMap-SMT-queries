; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81980 () Bool)

(assert start!81980)

(declare-fun b!956126 () Bool)

(declare-fun e!538739 () Bool)

(declare-fun e!538738 () Bool)

(declare-fun mapRes!33517 () Bool)

(assert (=> b!956126 (= e!538739 (and e!538738 mapRes!33517))))

(declare-fun condMapEmpty!33517 () Bool)

(declare-datatypes ((V!33033 0))(
  ( (V!33034 (val!10569 Int)) )
))
(declare-datatypes ((ValueCell!10037 0))(
  ( (ValueCellFull!10037 (v!13123 V!33033)) (EmptyCell!10037) )
))
(declare-datatypes ((array!58118 0))(
  ( (array!58119 (arr!27939 (Array (_ BitVec 32) ValueCell!10037)) (size!28420 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58118)

(declare-fun mapDefault!33517 () ValueCell!10037)

(assert (=> b!956126 (= condMapEmpty!33517 (= (arr!27939 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10037)) mapDefault!33517)))))

(declare-fun mapNonEmpty!33517 () Bool)

(declare-fun tp!64096 () Bool)

(declare-fun e!538740 () Bool)

(assert (=> mapNonEmpty!33517 (= mapRes!33517 (and tp!64096 e!538740))))

(declare-fun mapValue!33517 () ValueCell!10037)

(declare-fun mapKey!33517 () (_ BitVec 32))

(declare-fun mapRest!33517 () (Array (_ BitVec 32) ValueCell!10037))

(assert (=> mapNonEmpty!33517 (= (arr!27939 _values!1197) (store mapRest!33517 mapKey!33517 mapValue!33517))))

(declare-fun mapIsEmpty!33517 () Bool)

(assert (=> mapIsEmpty!33517 mapRes!33517))

(declare-fun res!640254 () Bool)

(declare-fun e!538737 () Bool)

(assert (=> start!81980 (=> (not res!640254) (not e!538737))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81980 (= res!640254 (validMask!0 mask!1823))))

(assert (=> start!81980 e!538737))

(assert (=> start!81980 true))

(declare-fun array_inv!21741 (array!58118) Bool)

(assert (=> start!81980 (and (array_inv!21741 _values!1197) e!538739)))

(declare-datatypes ((array!58120 0))(
  ( (array!58121 (arr!27940 (Array (_ BitVec 32) (_ BitVec 64))) (size!28421 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58120)

(declare-fun array_inv!21742 (array!58120) Bool)

(assert (=> start!81980 (array_inv!21742 _keys!1441)))

(declare-fun b!956127 () Bool)

(declare-fun tp_is_empty!21037 () Bool)

(assert (=> b!956127 (= e!538740 tp_is_empty!21037)))

(declare-fun b!956128 () Bool)

(declare-fun res!640253 () Bool)

(assert (=> b!956128 (=> (not res!640253) (not e!538737))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956128 (= res!640253 (and (= (size!28420 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28421 _keys!1441) (size!28420 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956129 () Bool)

(assert (=> b!956129 (= e!538737 false)))

(declare-fun lt!429897 () Bool)

(declare-datatypes ((List!19490 0))(
  ( (Nil!19487) (Cons!19486 (h!20648 (_ BitVec 64)) (t!27842 List!19490)) )
))
(declare-fun arrayNoDuplicates!0 (array!58120 (_ BitVec 32) List!19490) Bool)

(assert (=> b!956129 (= lt!429897 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19487))))

(declare-fun b!956130 () Bool)

(declare-fun res!640255 () Bool)

(assert (=> b!956130 (=> (not res!640255) (not e!538737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58120 (_ BitVec 32)) Bool)

(assert (=> b!956130 (= res!640255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956131 () Bool)

(assert (=> b!956131 (= e!538738 tp_is_empty!21037)))

(assert (= (and start!81980 res!640254) b!956128))

(assert (= (and b!956128 res!640253) b!956130))

(assert (= (and b!956130 res!640255) b!956129))

(assert (= (and b!956126 condMapEmpty!33517) mapIsEmpty!33517))

(assert (= (and b!956126 (not condMapEmpty!33517)) mapNonEmpty!33517))

(get-info :version)

(assert (= (and mapNonEmpty!33517 ((_ is ValueCellFull!10037) mapValue!33517)) b!956127))

(assert (= (and b!956126 ((_ is ValueCellFull!10037) mapDefault!33517)) b!956131))

(assert (= start!81980 b!956126))

(declare-fun m!886911 () Bool)

(assert (=> mapNonEmpty!33517 m!886911))

(declare-fun m!886913 () Bool)

(assert (=> start!81980 m!886913))

(declare-fun m!886915 () Bool)

(assert (=> start!81980 m!886915))

(declare-fun m!886917 () Bool)

(assert (=> start!81980 m!886917))

(declare-fun m!886919 () Bool)

(assert (=> b!956129 m!886919))

(declare-fun m!886921 () Bool)

(assert (=> b!956130 m!886921))

(check-sat tp_is_empty!21037 (not b!956130) (not start!81980) (not mapNonEmpty!33517) (not b!956129))
(check-sat)
