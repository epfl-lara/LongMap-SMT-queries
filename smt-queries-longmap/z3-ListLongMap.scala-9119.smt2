; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109500 () Bool)

(assert start!109500)

(declare-fun b_free!28989 () Bool)

(declare-fun b_next!28989 () Bool)

(assert (=> start!109500 (= b_free!28989 (not b_next!28989))))

(declare-fun tp!102086 () Bool)

(declare-fun b_and!47079 () Bool)

(assert (=> start!109500 (= tp!102086 b_and!47079)))

(declare-fun b!1296903 () Bool)

(declare-fun e!739889 () Bool)

(assert (=> b!1296903 (= e!739889 false)))

(declare-datatypes ((V!51275 0))(
  ( (V!51276 (val!17389 Int)) )
))
(declare-fun minValue!1387 () V!51275)

(declare-fun zeroValue!1387 () V!51275)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580529 () Bool)

(declare-datatypes ((ValueCell!16416 0))(
  ( (ValueCellFull!16416 (v!19992 V!51275)) (EmptyCell!16416) )
))
(declare-datatypes ((array!86274 0))(
  ( (array!86275 (arr!41638 (Array (_ BitVec 32) ValueCell!16416)) (size!42188 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86274)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86276 0))(
  ( (array!86277 (arr!41639 (Array (_ BitVec 32) (_ BitVec 64))) (size!42189 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86276)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22406 0))(
  ( (tuple2!22407 (_1!11214 (_ BitVec 64)) (_2!11214 V!51275)) )
))
(declare-datatypes ((List!29542 0))(
  ( (Nil!29539) (Cons!29538 (h!30747 tuple2!22406) (t!43106 List!29542)) )
))
(declare-datatypes ((ListLongMap!20063 0))(
  ( (ListLongMap!20064 (toList!10047 List!29542)) )
))
(declare-fun contains!8165 (ListLongMap!20063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5076 (array!86276 array!86274 (_ BitVec 32) (_ BitVec 32) V!51275 V!51275 (_ BitVec 32) Int) ListLongMap!20063)

(assert (=> b!1296903 (= lt!580529 (contains!8165 (getCurrentListMap!5076 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1296905 () Bool)

(declare-fun e!739888 () Bool)

(declare-fun e!739892 () Bool)

(declare-fun mapRes!53504 () Bool)

(assert (=> b!1296905 (= e!739888 (and e!739892 mapRes!53504))))

(declare-fun condMapEmpty!53504 () Bool)

(declare-fun mapDefault!53504 () ValueCell!16416)

(assert (=> b!1296905 (= condMapEmpty!53504 (= (arr!41638 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16416)) mapDefault!53504)))))

(declare-fun b!1296906 () Bool)

(declare-fun e!739891 () Bool)

(declare-fun tp_is_empty!34629 () Bool)

(assert (=> b!1296906 (= e!739891 tp_is_empty!34629)))

(declare-fun mapIsEmpty!53504 () Bool)

(assert (=> mapIsEmpty!53504 mapRes!53504))

(declare-fun b!1296907 () Bool)

(declare-fun res!861908 () Bool)

(assert (=> b!1296907 (=> (not res!861908) (not e!739889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86276 (_ BitVec 32)) Bool)

(assert (=> b!1296907 (= res!861908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!53504 () Bool)

(declare-fun tp!102085 () Bool)

(assert (=> mapNonEmpty!53504 (= mapRes!53504 (and tp!102085 e!739891))))

(declare-fun mapValue!53504 () ValueCell!16416)

(declare-fun mapRest!53504 () (Array (_ BitVec 32) ValueCell!16416))

(declare-fun mapKey!53504 () (_ BitVec 32))

(assert (=> mapNonEmpty!53504 (= (arr!41638 _values!1445) (store mapRest!53504 mapKey!53504 mapValue!53504))))

(declare-fun b!1296908 () Bool)

(assert (=> b!1296908 (= e!739892 tp_is_empty!34629)))

(declare-fun res!861909 () Bool)

(assert (=> start!109500 (=> (not res!861909) (not e!739889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109500 (= res!861909 (validMask!0 mask!2175))))

(assert (=> start!109500 e!739889))

(assert (=> start!109500 tp_is_empty!34629))

(assert (=> start!109500 true))

(declare-fun array_inv!31515 (array!86274) Bool)

(assert (=> start!109500 (and (array_inv!31515 _values!1445) e!739888)))

(declare-fun array_inv!31516 (array!86276) Bool)

(assert (=> start!109500 (array_inv!31516 _keys!1741)))

(assert (=> start!109500 tp!102086))

(declare-fun b!1296904 () Bool)

(declare-fun res!861912 () Bool)

(assert (=> b!1296904 (=> (not res!861912) (not e!739889))))

(declare-datatypes ((List!29543 0))(
  ( (Nil!29540) (Cons!29539 (h!30748 (_ BitVec 64)) (t!43107 List!29543)) )
))
(declare-fun arrayNoDuplicates!0 (array!86276 (_ BitVec 32) List!29543) Bool)

(assert (=> b!1296904 (= res!861912 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29540))))

(declare-fun b!1296909 () Bool)

(declare-fun res!861911 () Bool)

(assert (=> b!1296909 (=> (not res!861911) (not e!739889))))

(assert (=> b!1296909 (= res!861911 (and (= (size!42188 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42189 _keys!1741) (size!42188 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296910 () Bool)

(declare-fun res!861910 () Bool)

(assert (=> b!1296910 (=> (not res!861910) (not e!739889))))

(assert (=> b!1296910 (= res!861910 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42189 _keys!1741))))))

(assert (= (and start!109500 res!861909) b!1296909))

(assert (= (and b!1296909 res!861911) b!1296907))

(assert (= (and b!1296907 res!861908) b!1296904))

(assert (= (and b!1296904 res!861912) b!1296910))

(assert (= (and b!1296910 res!861910) b!1296903))

(assert (= (and b!1296905 condMapEmpty!53504) mapIsEmpty!53504))

(assert (= (and b!1296905 (not condMapEmpty!53504)) mapNonEmpty!53504))

(get-info :version)

(assert (= (and mapNonEmpty!53504 ((_ is ValueCellFull!16416) mapValue!53504)) b!1296906))

(assert (= (and b!1296905 ((_ is ValueCellFull!16416) mapDefault!53504)) b!1296908))

(assert (= start!109500 b!1296905))

(declare-fun m!1188675 () Bool)

(assert (=> b!1296904 m!1188675))

(declare-fun m!1188677 () Bool)

(assert (=> start!109500 m!1188677))

(declare-fun m!1188679 () Bool)

(assert (=> start!109500 m!1188679))

(declare-fun m!1188681 () Bool)

(assert (=> start!109500 m!1188681))

(declare-fun m!1188683 () Bool)

(assert (=> mapNonEmpty!53504 m!1188683))

(declare-fun m!1188685 () Bool)

(assert (=> b!1296903 m!1188685))

(assert (=> b!1296903 m!1188685))

(declare-fun m!1188687 () Bool)

(assert (=> b!1296903 m!1188687))

(declare-fun m!1188689 () Bool)

(assert (=> b!1296907 m!1188689))

(check-sat (not b!1296907) (not start!109500) b_and!47079 (not b!1296903) (not b_next!28989) (not mapNonEmpty!53504) tp_is_empty!34629 (not b!1296904))
(check-sat b_and!47079 (not b_next!28989))
