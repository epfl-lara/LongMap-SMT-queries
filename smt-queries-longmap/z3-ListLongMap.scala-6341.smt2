; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81740 () Bool)

(assert start!81740)

(declare-fun mapIsEmpty!33181 () Bool)

(declare-fun mapRes!33181 () Bool)

(assert (=> mapIsEmpty!33181 mapRes!33181))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun e!537185 () Bool)

(declare-fun b!953673 () Bool)

(declare-datatypes ((array!57749 0))(
  ( (array!57750 (arr!27759 (Array (_ BitVec 32) (_ BitVec 64))) (size!28238 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57749)

(declare-datatypes ((V!32747 0))(
  ( (V!32748 (val!10462 Int)) )
))
(declare-datatypes ((ValueCell!9930 0))(
  ( (ValueCellFull!9930 (v!13016 V!32747)) (EmptyCell!9930) )
))
(declare-datatypes ((array!57751 0))(
  ( (array!57752 (arr!27760 (Array (_ BitVec 32) ValueCell!9930)) (size!28239 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57751)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!953673 (= e!537185 (and (= (size!28239 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28238 _keys!1441) (size!28239 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011) (not (= (size!28238 _keys!1441) (bvadd #b00000000000000000000000000000001 mask!1823)))))))

(declare-fun b!953674 () Bool)

(declare-fun e!537188 () Bool)

(declare-fun tp_is_empty!20823 () Bool)

(assert (=> b!953674 (= e!537188 tp_is_empty!20823)))

(declare-fun res!638698 () Bool)

(assert (=> start!81740 (=> (not res!638698) (not e!537185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81740 (= res!638698 (validMask!0 mask!1823))))

(assert (=> start!81740 e!537185))

(assert (=> start!81740 true))

(declare-fun e!537186 () Bool)

(declare-fun array_inv!21549 (array!57751) Bool)

(assert (=> start!81740 (and (array_inv!21549 _values!1197) e!537186)))

(declare-fun array_inv!21550 (array!57749) Bool)

(assert (=> start!81740 (array_inv!21550 _keys!1441)))

(declare-fun b!953675 () Bool)

(assert (=> b!953675 (= e!537186 (and e!537188 mapRes!33181))))

(declare-fun condMapEmpty!33181 () Bool)

(declare-fun mapDefault!33181 () ValueCell!9930)

(assert (=> b!953675 (= condMapEmpty!33181 (= (arr!27760 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9930)) mapDefault!33181)))))

(declare-fun b!953676 () Bool)

(declare-fun e!537187 () Bool)

(assert (=> b!953676 (= e!537187 tp_is_empty!20823)))

(declare-fun mapNonEmpty!33181 () Bool)

(declare-fun tp!63570 () Bool)

(assert (=> mapNonEmpty!33181 (= mapRes!33181 (and tp!63570 e!537187))))

(declare-fun mapRest!33181 () (Array (_ BitVec 32) ValueCell!9930))

(declare-fun mapValue!33181 () ValueCell!9930)

(declare-fun mapKey!33181 () (_ BitVec 32))

(assert (=> mapNonEmpty!33181 (= (arr!27760 _values!1197) (store mapRest!33181 mapKey!33181 mapValue!33181))))

(assert (= (and start!81740 res!638698) b!953673))

(assert (= (and b!953675 condMapEmpty!33181) mapIsEmpty!33181))

(assert (= (and b!953675 (not condMapEmpty!33181)) mapNonEmpty!33181))

(get-info :version)

(assert (= (and mapNonEmpty!33181 ((_ is ValueCellFull!9930) mapValue!33181)) b!953676))

(assert (= (and b!953675 ((_ is ValueCellFull!9930) mapDefault!33181)) b!953674))

(assert (= start!81740 b!953675))

(declare-fun m!885663 () Bool)

(assert (=> start!81740 m!885663))

(declare-fun m!885665 () Bool)

(assert (=> start!81740 m!885665))

(declare-fun m!885667 () Bool)

(assert (=> start!81740 m!885667))

(declare-fun m!885669 () Bool)

(assert (=> mapNonEmpty!33181 m!885669))

(check-sat (not start!81740) (not mapNonEmpty!33181) tp_is_empty!20823)
(check-sat)
