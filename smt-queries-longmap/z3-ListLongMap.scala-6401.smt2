; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82184 () Bool)

(assert start!82184)

(declare-fun b_free!18475 () Bool)

(declare-fun b_next!18475 () Bool)

(assert (=> start!82184 (= b_free!18475 (not b_next!18475))))

(declare-fun tp!64386 () Bool)

(declare-fun b_and!29937 () Bool)

(assert (=> start!82184 (= tp!64386 b_and!29937)))

(declare-fun b!957852 () Bool)

(declare-fun e!539983 () Bool)

(declare-fun e!539986 () Bool)

(declare-fun mapRes!33751 () Bool)

(assert (=> b!957852 (= e!539983 (and e!539986 mapRes!33751))))

(declare-fun condMapEmpty!33751 () Bool)

(declare-datatypes ((V!33225 0))(
  ( (V!33226 (val!10641 Int)) )
))
(declare-datatypes ((ValueCell!10109 0))(
  ( (ValueCellFull!10109 (v!13197 V!33225)) (EmptyCell!10109) )
))
(declare-datatypes ((array!58402 0))(
  ( (array!58403 (arr!28075 (Array (_ BitVec 32) ValueCell!10109)) (size!28556 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58402)

(declare-fun mapDefault!33751 () ValueCell!10109)

(assert (=> b!957852 (= condMapEmpty!33751 (= (arr!28075 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10109)) mapDefault!33751)))))

(declare-fun b!957853 () Bool)

(declare-fun res!641204 () Bool)

(declare-fun e!539987 () Bool)

(assert (=> b!957853 (=> (not res!641204) (not e!539987))))

(declare-datatypes ((array!58404 0))(
  ( (array!58405 (arr!28076 (Array (_ BitVec 32) (_ BitVec 64))) (size!28557 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58404)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957853 (= res!641204 (validKeyInArray!0 (select (arr!28076 _keys!1668) i!793)))))

(declare-fun b!957854 () Bool)

(declare-fun res!641203 () Bool)

(assert (=> b!957854 (=> (not res!641203) (not e!539987))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!957854 (= res!641203 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28557 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28557 _keys!1668))))))

(declare-fun b!957855 () Bool)

(declare-fun e!539985 () Bool)

(declare-fun tp_is_empty!21181 () Bool)

(assert (=> b!957855 (= e!539985 tp_is_empty!21181)))

(declare-fun mapNonEmpty!33751 () Bool)

(declare-fun tp!64387 () Bool)

(assert (=> mapNonEmpty!33751 (= mapRes!33751 (and tp!64387 e!539985))))

(declare-fun mapRest!33751 () (Array (_ BitVec 32) ValueCell!10109))

(declare-fun mapKey!33751 () (_ BitVec 32))

(declare-fun mapValue!33751 () ValueCell!10109)

(assert (=> mapNonEmpty!33751 (= (arr!28075 _values!1386) (store mapRest!33751 mapKey!33751 mapValue!33751))))

(declare-fun b!957856 () Bool)

(declare-fun res!641206 () Bool)

(assert (=> b!957856 (=> (not res!641206) (not e!539987))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58404 (_ BitVec 32)) Bool)

(assert (=> b!957856 (= res!641206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun res!641207 () Bool)

(assert (=> start!82184 (=> (not res!641207) (not e!539987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82184 (= res!641207 (validMask!0 mask!2088))))

(assert (=> start!82184 e!539987))

(assert (=> start!82184 true))

(assert (=> start!82184 tp_is_empty!21181))

(declare-fun array_inv!21833 (array!58404) Bool)

(assert (=> start!82184 (array_inv!21833 _keys!1668)))

(declare-fun array_inv!21834 (array!58402) Bool)

(assert (=> start!82184 (and (array_inv!21834 _values!1386) e!539983)))

(assert (=> start!82184 tp!64386))

(declare-fun mapIsEmpty!33751 () Bool)

(assert (=> mapIsEmpty!33751 mapRes!33751))

(declare-fun b!957857 () Bool)

(declare-fun res!641205 () Bool)

(assert (=> b!957857 (=> (not res!641205) (not e!539987))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957857 (= res!641205 (and (= (size!28556 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28557 _keys!1668) (size!28556 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957858 () Bool)

(assert (=> b!957858 (= e!539987 false)))

(declare-fun lt!430168 () Bool)

(declare-fun minValue!1328 () V!33225)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33225)

(declare-datatypes ((tuple2!13766 0))(
  ( (tuple2!13767 (_1!6894 (_ BitVec 64)) (_2!6894 V!33225)) )
))
(declare-datatypes ((List!19552 0))(
  ( (Nil!19549) (Cons!19548 (h!20710 tuple2!13766) (t!27906 List!19552)) )
))
(declare-datatypes ((ListLongMap!12453 0))(
  ( (ListLongMap!12454 (toList!6242 List!19552)) )
))
(declare-fun contains!5288 (ListLongMap!12453 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3404 (array!58404 array!58402 (_ BitVec 32) (_ BitVec 32) V!33225 V!33225 (_ BitVec 32) Int) ListLongMap!12453)

(assert (=> b!957858 (= lt!430168 (contains!5288 (getCurrentListMap!3404 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28076 _keys!1668) i!793)))))

(declare-fun b!957859 () Bool)

(declare-fun res!641208 () Bool)

(assert (=> b!957859 (=> (not res!641208) (not e!539987))))

(declare-datatypes ((List!19553 0))(
  ( (Nil!19550) (Cons!19549 (h!20711 (_ BitVec 64)) (t!27907 List!19553)) )
))
(declare-fun arrayNoDuplicates!0 (array!58404 (_ BitVec 32) List!19553) Bool)

(assert (=> b!957859 (= res!641208 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19550))))

(declare-fun b!957860 () Bool)

(assert (=> b!957860 (= e!539986 tp_is_empty!21181)))

(assert (= (and start!82184 res!641207) b!957857))

(assert (= (and b!957857 res!641205) b!957856))

(assert (= (and b!957856 res!641206) b!957859))

(assert (= (and b!957859 res!641208) b!957854))

(assert (= (and b!957854 res!641203) b!957853))

(assert (= (and b!957853 res!641204) b!957858))

(assert (= (and b!957852 condMapEmpty!33751) mapIsEmpty!33751))

(assert (= (and b!957852 (not condMapEmpty!33751)) mapNonEmpty!33751))

(get-info :version)

(assert (= (and mapNonEmpty!33751 ((_ is ValueCellFull!10109) mapValue!33751)) b!957855))

(assert (= (and b!957852 ((_ is ValueCellFull!10109) mapDefault!33751)) b!957860))

(assert (= start!82184 b!957852))

(declare-fun m!888099 () Bool)

(assert (=> start!82184 m!888099))

(declare-fun m!888101 () Bool)

(assert (=> start!82184 m!888101))

(declare-fun m!888103 () Bool)

(assert (=> start!82184 m!888103))

(declare-fun m!888105 () Bool)

(assert (=> b!957859 m!888105))

(declare-fun m!888107 () Bool)

(assert (=> b!957856 m!888107))

(declare-fun m!888109 () Bool)

(assert (=> b!957858 m!888109))

(declare-fun m!888111 () Bool)

(assert (=> b!957858 m!888111))

(assert (=> b!957858 m!888109))

(assert (=> b!957858 m!888111))

(declare-fun m!888113 () Bool)

(assert (=> b!957858 m!888113))

(assert (=> b!957853 m!888111))

(assert (=> b!957853 m!888111))

(declare-fun m!888115 () Bool)

(assert (=> b!957853 m!888115))

(declare-fun m!888117 () Bool)

(assert (=> mapNonEmpty!33751 m!888117))

(check-sat (not b_next!18475) b_and!29937 (not b!957853) (not b!957859) (not b!957856) (not mapNonEmpty!33751) tp_is_empty!21181 (not b!957858) (not start!82184))
(check-sat b_and!29937 (not b_next!18475))
