; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81720 () Bool)

(assert start!81720)

(declare-fun mapNonEmpty!33178 () Bool)

(declare-fun mapRes!33178 () Bool)

(declare-fun tp!63568 () Bool)

(declare-fun e!537021 () Bool)

(assert (=> mapNonEmpty!33178 (= mapRes!33178 (and tp!63568 e!537021))))

(declare-datatypes ((V!32745 0))(
  ( (V!32746 (val!10461 Int)) )
))
(declare-datatypes ((ValueCell!9929 0))(
  ( (ValueCellFull!9929 (v!13014 V!32745)) (EmptyCell!9929) )
))
(declare-fun mapValue!33178 () ValueCell!9929)

(declare-fun mapRest!33178 () (Array (_ BitVec 32) ValueCell!9929))

(declare-datatypes ((array!57710 0))(
  ( (array!57711 (arr!27740 (Array (_ BitVec 32) ValueCell!9929)) (size!28221 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57710)

(declare-fun mapKey!33178 () (_ BitVec 32))

(assert (=> mapNonEmpty!33178 (= (arr!27740 _values!1197) (store mapRest!33178 mapKey!33178 mapValue!33178))))

(declare-fun b!953422 () Bool)

(declare-fun e!537022 () Bool)

(declare-fun e!537023 () Bool)

(assert (=> b!953422 (= e!537022 (and e!537023 mapRes!33178))))

(declare-fun condMapEmpty!33178 () Bool)

(declare-fun mapDefault!33178 () ValueCell!9929)

(assert (=> b!953422 (= condMapEmpty!33178 (= (arr!27740 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9929)) mapDefault!33178)))))

(declare-fun b!953423 () Bool)

(declare-fun tp_is_empty!20821 () Bool)

(assert (=> b!953423 (= e!537023 tp_is_empty!20821)))

(declare-fun res!638585 () Bool)

(declare-fun e!537024 () Bool)

(assert (=> start!81720 (=> (not res!638585) (not e!537024))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81720 (= res!638585 (validMask!0 mask!1823))))

(assert (=> start!81720 e!537024))

(assert (=> start!81720 true))

(declare-fun array_inv!21597 (array!57710) Bool)

(assert (=> start!81720 (and (array_inv!21597 _values!1197) e!537022)))

(declare-datatypes ((array!57712 0))(
  ( (array!57713 (arr!27741 (Array (_ BitVec 32) (_ BitVec 64))) (size!28222 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57712)

(declare-fun array_inv!21598 (array!57712) Bool)

(assert (=> start!81720 (array_inv!21598 _keys!1441)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun b!953424 () Bool)

(assert (=> b!953424 (= e!537024 (and (= (size!28221 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28222 _keys!1441) (size!28221 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (not (= (size!28222 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)))))))

(declare-fun b!953425 () Bool)

(assert (=> b!953425 (= e!537021 tp_is_empty!20821)))

(declare-fun mapIsEmpty!33178 () Bool)

(assert (=> mapIsEmpty!33178 mapRes!33178))

(assert (= (and start!81720 res!638585) b!953424))

(assert (= (and b!953422 condMapEmpty!33178) mapIsEmpty!33178))

(assert (= (and b!953422 (not condMapEmpty!33178)) mapNonEmpty!33178))

(get-info :version)

(assert (= (and mapNonEmpty!33178 ((_ is ValueCellFull!9929) mapValue!33178)) b!953425))

(assert (= (and b!953422 ((_ is ValueCellFull!9929) mapDefault!33178)) b!953423))

(assert (= start!81720 b!953422))

(declare-fun m!884897 () Bool)

(assert (=> mapNonEmpty!33178 m!884897))

(declare-fun m!884899 () Bool)

(assert (=> start!81720 m!884899))

(declare-fun m!884901 () Bool)

(assert (=> start!81720 m!884901))

(declare-fun m!884903 () Bool)

(assert (=> start!81720 m!884903))

(check-sat (not start!81720) (not mapNonEmpty!33178) tp_is_empty!20821)
(check-sat)
