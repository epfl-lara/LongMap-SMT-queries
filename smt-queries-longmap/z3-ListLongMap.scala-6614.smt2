; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83594 () Bool)

(assert start!83594)

(declare-fun res!653809 () Bool)

(declare-fun e!550428 () Bool)

(assert (=> start!83594 (=> (not res!653809) (not e!550428))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83594 (= res!653809 (validMask!0 mask!1948))))

(assert (=> start!83594 e!550428))

(assert (=> start!83594 true))

(declare-datatypes ((V!34929 0))(
  ( (V!34930 (val!11280 Int)) )
))
(declare-datatypes ((ValueCell!10748 0))(
  ( (ValueCellFull!10748 (v!13840 V!34929)) (EmptyCell!10748) )
))
(declare-datatypes ((array!60878 0))(
  ( (array!60879 (arr!29302 (Array (_ BitVec 32) ValueCell!10748)) (size!29783 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60878)

(declare-fun e!550427 () Bool)

(declare-fun array_inv!22695 (array!60878) Bool)

(assert (=> start!83594 (and (array_inv!22695 _values!1278) e!550427)))

(declare-datatypes ((array!60880 0))(
  ( (array!60881 (arr!29303 (Array (_ BitVec 32) (_ BitVec 64))) (size!29784 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60880)

(declare-fun array_inv!22696 (array!60880) Bool)

(assert (=> start!83594 (array_inv!22696 _keys!1544)))

(declare-fun b!976663 () Bool)

(declare-fun e!550425 () Bool)

(declare-fun mapRes!35702 () Bool)

(assert (=> b!976663 (= e!550427 (and e!550425 mapRes!35702))))

(declare-fun condMapEmpty!35702 () Bool)

(declare-fun mapDefault!35702 () ValueCell!10748)

(assert (=> b!976663 (= condMapEmpty!35702 (= (arr!29302 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10748)) mapDefault!35702)))))

(declare-fun b!976664 () Bool)

(declare-fun e!550424 () Bool)

(declare-fun tp_is_empty!22459 () Bool)

(assert (=> b!976664 (= e!550424 tp_is_empty!22459)))

(declare-fun mapNonEmpty!35702 () Bool)

(declare-fun tp!67955 () Bool)

(assert (=> mapNonEmpty!35702 (= mapRes!35702 (and tp!67955 e!550424))))

(declare-fun mapRest!35702 () (Array (_ BitVec 32) ValueCell!10748))

(declare-fun mapValue!35702 () ValueCell!10748)

(declare-fun mapKey!35702 () (_ BitVec 32))

(assert (=> mapNonEmpty!35702 (= (arr!29302 _values!1278) (store mapRest!35702 mapKey!35702 mapValue!35702))))

(declare-fun b!976665 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!976665 (= e!550428 (and (= (size!29783 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29784 _keys!1544) (size!29783 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011) (not (= (size!29784 _keys!1544) (bvadd #b00000000000000000000000000000001 mask!1948)))))))

(declare-fun b!976666 () Bool)

(assert (=> b!976666 (= e!550425 tp_is_empty!22459)))

(declare-fun mapIsEmpty!35702 () Bool)

(assert (=> mapIsEmpty!35702 mapRes!35702))

(assert (= (and start!83594 res!653809) b!976665))

(assert (= (and b!976663 condMapEmpty!35702) mapIsEmpty!35702))

(assert (= (and b!976663 (not condMapEmpty!35702)) mapNonEmpty!35702))

(get-info :version)

(assert (= (and mapNonEmpty!35702 ((_ is ValueCellFull!10748) mapValue!35702)) b!976664))

(assert (= (and b!976663 ((_ is ValueCellFull!10748) mapDefault!35702)) b!976666))

(assert (= start!83594 b!976663))

(declare-fun m!903613 () Bool)

(assert (=> start!83594 m!903613))

(declare-fun m!903615 () Bool)

(assert (=> start!83594 m!903615))

(declare-fun m!903617 () Bool)

(assert (=> start!83594 m!903617))

(declare-fun m!903619 () Bool)

(assert (=> mapNonEmpty!35702 m!903619))

(check-sat (not start!83594) (not mapNonEmpty!35702) tp_is_empty!22459)
(check-sat)
