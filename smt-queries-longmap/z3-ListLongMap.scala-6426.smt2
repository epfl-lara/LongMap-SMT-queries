; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82520 () Bool)

(assert start!82520)

(declare-fun b_free!18619 () Bool)

(declare-fun b_next!18619 () Bool)

(assert (=> start!82520 (= b_free!18619 (not b_next!18619))))

(declare-fun tp!64828 () Bool)

(declare-fun b_and!30117 () Bool)

(assert (=> start!82520 (= tp!64828 b_and!30117)))

(declare-fun b!961082 () Bool)

(declare-fun e!541838 () Bool)

(declare-fun tp_is_empty!21331 () Bool)

(assert (=> b!961082 (= e!541838 tp_is_empty!21331)))

(declare-fun b!961083 () Bool)

(declare-fun e!541840 () Bool)

(assert (=> b!961083 (= e!541840 tp_is_empty!21331)))

(declare-fun b!961084 () Bool)

(declare-fun e!541842 () Bool)

(assert (=> b!961084 (= e!541842 false)))

(declare-fun lt!430981 () Bool)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33425 0))(
  ( (V!33426 (val!10716 Int)) )
))
(declare-fun minValue!1328 () V!33425)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58784 0))(
  ( (array!58785 (arr!28261 (Array (_ BitVec 32) (_ BitVec 64))) (size!28741 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58784)

(declare-datatypes ((ValueCell!10184 0))(
  ( (ValueCellFull!10184 (v!13270 V!33425)) (EmptyCell!10184) )
))
(declare-datatypes ((array!58786 0))(
  ( (array!58787 (arr!28262 (Array (_ BitVec 32) ValueCell!10184)) (size!28742 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58786)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33425)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13804 0))(
  ( (tuple2!13805 (_1!6913 (_ BitVec 64)) (_2!6913 V!33425)) )
))
(declare-datatypes ((List!19634 0))(
  ( (Nil!19631) (Cons!19630 (h!20798 tuple2!13804) (t!27989 List!19634)) )
))
(declare-datatypes ((ListLongMap!12503 0))(
  ( (ListLongMap!12504 (toList!6267 List!19634)) )
))
(declare-fun contains!5379 (ListLongMap!12503 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3500 (array!58784 array!58786 (_ BitVec 32) (_ BitVec 32) V!33425 V!33425 (_ BitVec 32) Int) ListLongMap!12503)

(assert (=> b!961084 (= lt!430981 (contains!5379 (getCurrentListMap!3500 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28261 _keys!1668) i!793)))))

(declare-fun mapIsEmpty!33976 () Bool)

(declare-fun mapRes!33976 () Bool)

(assert (=> mapIsEmpty!33976 mapRes!33976))

(declare-fun b!961085 () Bool)

(declare-fun res!643072 () Bool)

(assert (=> b!961085 (=> (not res!643072) (not e!541842))))

(assert (=> b!961085 (= res!643072 (and (= (size!28742 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28741 _keys!1668) (size!28742 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!643075 () Bool)

(assert (=> start!82520 (=> (not res!643075) (not e!541842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82520 (= res!643075 (validMask!0 mask!2088))))

(assert (=> start!82520 e!541842))

(assert (=> start!82520 true))

(assert (=> start!82520 tp_is_empty!21331))

(declare-fun array_inv!21985 (array!58784) Bool)

(assert (=> start!82520 (array_inv!21985 _keys!1668)))

(declare-fun e!541839 () Bool)

(declare-fun array_inv!21986 (array!58786) Bool)

(assert (=> start!82520 (and (array_inv!21986 _values!1386) e!541839)))

(assert (=> start!82520 tp!64828))

(declare-fun b!961086 () Bool)

(declare-fun res!643071 () Bool)

(assert (=> b!961086 (=> (not res!643071) (not e!541842))))

(declare-datatypes ((List!19635 0))(
  ( (Nil!19632) (Cons!19631 (h!20799 (_ BitVec 64)) (t!27990 List!19635)) )
))
(declare-fun arrayNoDuplicates!0 (array!58784 (_ BitVec 32) List!19635) Bool)

(assert (=> b!961086 (= res!643071 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19632))))

(declare-fun b!961087 () Bool)

(declare-fun res!643073 () Bool)

(assert (=> b!961087 (=> (not res!643073) (not e!541842))))

(assert (=> b!961087 (= res!643073 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28741 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28741 _keys!1668))))))

(declare-fun b!961088 () Bool)

(declare-fun res!643070 () Bool)

(assert (=> b!961088 (=> (not res!643070) (not e!541842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961088 (= res!643070 (validKeyInArray!0 (select (arr!28261 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33976 () Bool)

(declare-fun tp!64827 () Bool)

(assert (=> mapNonEmpty!33976 (= mapRes!33976 (and tp!64827 e!541838))))

(declare-fun mapRest!33976 () (Array (_ BitVec 32) ValueCell!10184))

(declare-fun mapValue!33976 () ValueCell!10184)

(declare-fun mapKey!33976 () (_ BitVec 32))

(assert (=> mapNonEmpty!33976 (= (arr!28262 _values!1386) (store mapRest!33976 mapKey!33976 mapValue!33976))))

(declare-fun b!961089 () Bool)

(declare-fun res!643074 () Bool)

(assert (=> b!961089 (=> (not res!643074) (not e!541842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58784 (_ BitVec 32)) Bool)

(assert (=> b!961089 (= res!643074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!961090 () Bool)

(assert (=> b!961090 (= e!541839 (and e!541840 mapRes!33976))))

(declare-fun condMapEmpty!33976 () Bool)

(declare-fun mapDefault!33976 () ValueCell!10184)

(assert (=> b!961090 (= condMapEmpty!33976 (= (arr!28262 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10184)) mapDefault!33976)))))

(assert (= (and start!82520 res!643075) b!961085))

(assert (= (and b!961085 res!643072) b!961089))

(assert (= (and b!961089 res!643074) b!961086))

(assert (= (and b!961086 res!643071) b!961087))

(assert (= (and b!961087 res!643073) b!961088))

(assert (= (and b!961088 res!643070) b!961084))

(assert (= (and b!961090 condMapEmpty!33976) mapIsEmpty!33976))

(assert (= (and b!961090 (not condMapEmpty!33976)) mapNonEmpty!33976))

(get-info :version)

(assert (= (and mapNonEmpty!33976 ((_ is ValueCellFull!10184) mapValue!33976)) b!961082))

(assert (= (and b!961090 ((_ is ValueCellFull!10184) mapDefault!33976)) b!961083))

(assert (= start!82520 b!961090))

(declare-fun m!891783 () Bool)

(assert (=> mapNonEmpty!33976 m!891783))

(declare-fun m!891785 () Bool)

(assert (=> b!961089 m!891785))

(declare-fun m!891787 () Bool)

(assert (=> b!961088 m!891787))

(assert (=> b!961088 m!891787))

(declare-fun m!891789 () Bool)

(assert (=> b!961088 m!891789))

(declare-fun m!891791 () Bool)

(assert (=> start!82520 m!891791))

(declare-fun m!891793 () Bool)

(assert (=> start!82520 m!891793))

(declare-fun m!891795 () Bool)

(assert (=> start!82520 m!891795))

(declare-fun m!891797 () Bool)

(assert (=> b!961084 m!891797))

(assert (=> b!961084 m!891787))

(assert (=> b!961084 m!891797))

(assert (=> b!961084 m!891787))

(declare-fun m!891799 () Bool)

(assert (=> b!961084 m!891799))

(declare-fun m!891801 () Bool)

(assert (=> b!961086 m!891801))

(check-sat b_and!30117 (not b!961088) (not b!961086) (not b!961089) (not b!961084) (not b_next!18619) (not mapNonEmpty!33976) (not start!82520) tp_is_empty!21331)
(check-sat b_and!30117 (not b_next!18619))
