; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81906 () Bool)

(assert start!81906)

(declare-fun mapNonEmpty!33178 () Bool)

(declare-fun mapRes!33178 () Bool)

(declare-fun tp!63568 () Bool)

(declare-fun e!537752 () Bool)

(assert (=> mapNonEmpty!33178 (= mapRes!33178 (and tp!63568 e!537752))))

(declare-datatypes ((V!32745 0))(
  ( (V!32746 (val!10461 Int)) )
))
(declare-datatypes ((ValueCell!9929 0))(
  ( (ValueCellFull!9929 (v!13012 V!32745)) (EmptyCell!9929) )
))
(declare-datatypes ((array!57796 0))(
  ( (array!57797 (arr!27778 (Array (_ BitVec 32) ValueCell!9929)) (size!28258 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57796)

(declare-fun mapKey!33178 () (_ BitVec 32))

(declare-fun mapRest!33178 () (Array (_ BitVec 32) ValueCell!9929))

(declare-fun mapValue!33178 () ValueCell!9929)

(assert (=> mapNonEmpty!33178 (= (arr!27778 _values!1197) (store mapRest!33178 mapKey!33178 mapValue!33178))))

(declare-fun res!639039 () Bool)

(declare-fun e!537755 () Bool)

(assert (=> start!81906 (=> (not res!639039) (not e!537755))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81906 (= res!639039 (validMask!0 mask!1823))))

(assert (=> start!81906 e!537755))

(assert (=> start!81906 true))

(declare-fun e!537751 () Bool)

(declare-fun array_inv!21637 (array!57796) Bool)

(assert (=> start!81906 (and (array_inv!21637 _values!1197) e!537751)))

(declare-datatypes ((array!57798 0))(
  ( (array!57799 (arr!27779 (Array (_ BitVec 32) (_ BitVec 64))) (size!28259 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57798)

(declare-fun array_inv!21638 (array!57798) Bool)

(assert (=> start!81906 (array_inv!21638 _keys!1441)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun b!954564 () Bool)

(assert (=> b!954564 (= e!537755 (and (= (size!28258 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28259 _keys!1441) (size!28258 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (not (= (size!28259 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)))))))

(declare-fun mapIsEmpty!33178 () Bool)

(assert (=> mapIsEmpty!33178 mapRes!33178))

(declare-fun b!954565 () Bool)

(declare-fun e!537753 () Bool)

(declare-fun tp_is_empty!20821 () Bool)

(assert (=> b!954565 (= e!537753 tp_is_empty!20821)))

(declare-fun b!954566 () Bool)

(assert (=> b!954566 (= e!537752 tp_is_empty!20821)))

(declare-fun b!954567 () Bool)

(assert (=> b!954567 (= e!537751 (and e!537753 mapRes!33178))))

(declare-fun condMapEmpty!33178 () Bool)

(declare-fun mapDefault!33178 () ValueCell!9929)

(assert (=> b!954567 (= condMapEmpty!33178 (= (arr!27778 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9929)) mapDefault!33178)))))

(assert (= (and start!81906 res!639039) b!954564))

(assert (= (and b!954567 condMapEmpty!33178) mapIsEmpty!33178))

(assert (= (and b!954567 (not condMapEmpty!33178)) mapNonEmpty!33178))

(get-info :version)

(assert (= (and mapNonEmpty!33178 ((_ is ValueCellFull!9929) mapValue!33178)) b!954566))

(assert (= (and b!954567 ((_ is ValueCellFull!9929) mapDefault!33178)) b!954565))

(assert (= start!81906 b!954567))

(declare-fun m!886949 () Bool)

(assert (=> mapNonEmpty!33178 m!886949))

(declare-fun m!886951 () Bool)

(assert (=> start!81906 m!886951))

(declare-fun m!886953 () Bool)

(assert (=> start!81906 m!886953))

(declare-fun m!886955 () Bool)

(assert (=> start!81906 m!886955))

(check-sat (not start!81906) (not mapNonEmpty!33178) tp_is_empty!20821)
(check-sat)
