; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81982 () Bool)

(assert start!81982)

(declare-fun b!956221 () Bool)

(declare-fun e!538764 () Bool)

(assert (=> b!956221 (= e!538764 false)))

(declare-fun lt!430109 () Bool)

(declare-datatypes ((array!58141 0))(
  ( (array!58142 (arr!27950 (Array (_ BitVec 32) (_ BitVec 64))) (size!28429 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58141)

(declare-datatypes ((List!19472 0))(
  ( (Nil!19469) (Cons!19468 (h!20630 (_ BitVec 64)) (t!27833 List!19472)) )
))
(declare-fun arrayNoDuplicates!0 (array!58141 (_ BitVec 32) List!19472) Bool)

(assert (=> b!956221 (= lt!430109 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19469))))

(declare-fun b!956222 () Bool)

(declare-fun e!538766 () Bool)

(declare-fun tp_is_empty!21021 () Bool)

(assert (=> b!956222 (= e!538766 tp_is_empty!21021)))

(declare-fun mapNonEmpty!33493 () Bool)

(declare-fun mapRes!33493 () Bool)

(declare-fun tp!64071 () Bool)

(assert (=> mapNonEmpty!33493 (= mapRes!33493 (and tp!64071 e!538766))))

(declare-datatypes ((V!33011 0))(
  ( (V!33012 (val!10561 Int)) )
))
(declare-datatypes ((ValueCell!10029 0))(
  ( (ValueCellFull!10029 (v!13116 V!33011)) (EmptyCell!10029) )
))
(declare-datatypes ((array!58143 0))(
  ( (array!58144 (arr!27951 (Array (_ BitVec 32) ValueCell!10029)) (size!28430 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58143)

(declare-fun mapKey!33493 () (_ BitVec 32))

(declare-fun mapValue!33493 () ValueCell!10029)

(declare-fun mapRest!33493 () (Array (_ BitVec 32) ValueCell!10029))

(assert (=> mapNonEmpty!33493 (= (arr!27951 _values!1197) (store mapRest!33493 mapKey!33493 mapValue!33493))))

(declare-fun b!956224 () Bool)

(declare-fun res!640292 () Bool)

(assert (=> b!956224 (=> (not res!640292) (not e!538764))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58141 (_ BitVec 32)) Bool)

(assert (=> b!956224 (= res!640292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!956225 () Bool)

(declare-fun e!538768 () Bool)

(assert (=> b!956225 (= e!538768 tp_is_empty!21021)))

(declare-fun mapIsEmpty!33493 () Bool)

(assert (=> mapIsEmpty!33493 mapRes!33493))

(declare-fun b!956226 () Bool)

(declare-fun e!538765 () Bool)

(assert (=> b!956226 (= e!538765 (and e!538768 mapRes!33493))))

(declare-fun condMapEmpty!33493 () Bool)

(declare-fun mapDefault!33493 () ValueCell!10029)

(assert (=> b!956226 (= condMapEmpty!33493 (= (arr!27951 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10029)) mapDefault!33493)))))

(declare-fun b!956223 () Bool)

(declare-fun res!640291 () Bool)

(assert (=> b!956223 (=> (not res!640291) (not e!538764))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956223 (= res!640291 (and (= (size!28430 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28429 _keys!1441) (size!28430 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!640293 () Bool)

(assert (=> start!81982 (=> (not res!640293) (not e!538764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81982 (= res!640293 (validMask!0 mask!1823))))

(assert (=> start!81982 e!538764))

(assert (=> start!81982 true))

(declare-fun array_inv!21687 (array!58143) Bool)

(assert (=> start!81982 (and (array_inv!21687 _values!1197) e!538765)))

(declare-fun array_inv!21688 (array!58141) Bool)

(assert (=> start!81982 (array_inv!21688 _keys!1441)))

(assert (= (and start!81982 res!640293) b!956223))

(assert (= (and b!956223 res!640291) b!956224))

(assert (= (and b!956224 res!640292) b!956221))

(assert (= (and b!956226 condMapEmpty!33493) mapIsEmpty!33493))

(assert (= (and b!956226 (not condMapEmpty!33493)) mapNonEmpty!33493))

(get-info :version)

(assert (= (and mapNonEmpty!33493 ((_ is ValueCellFull!10029) mapValue!33493)) b!956222))

(assert (= (and b!956226 ((_ is ValueCellFull!10029) mapDefault!33493)) b!956225))

(assert (= start!81982 b!956226))

(declare-fun m!887573 () Bool)

(assert (=> b!956221 m!887573))

(declare-fun m!887575 () Bool)

(assert (=> mapNonEmpty!33493 m!887575))

(declare-fun m!887577 () Bool)

(assert (=> b!956224 m!887577))

(declare-fun m!887579 () Bool)

(assert (=> start!81982 m!887579))

(declare-fun m!887581 () Bool)

(assert (=> start!81982 m!887581))

(declare-fun m!887583 () Bool)

(assert (=> start!81982 m!887583))

(check-sat (not b!956221) (not start!81982) (not b!956224) tp_is_empty!21021 (not mapNonEmpty!33493))
(check-sat)
