; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82192 () Bool)

(assert start!82192)

(declare-fun b_free!18465 () Bool)

(declare-fun b_next!18465 () Bool)

(assert (=> start!82192 (= b_free!18465 (not b_next!18465))))

(declare-fun tp!64356 () Bool)

(declare-fun b_and!29953 () Bool)

(assert (=> start!82192 (= tp!64356 b_and!29953)))

(declare-fun b!957956 () Bool)

(declare-fun e!540057 () Bool)

(assert (=> b!957956 (= e!540057 false)))

(declare-datatypes ((V!33211 0))(
  ( (V!33212 (val!10636 Int)) )
))
(declare-fun minValue!1328 () V!33211)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58445 0))(
  ( (array!58446 (arr!28096 (Array (_ BitVec 32) (_ BitVec 64))) (size!28575 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58445)

(declare-datatypes ((ValueCell!10104 0))(
  ( (ValueCellFull!10104 (v!13193 V!33211)) (EmptyCell!10104) )
))
(declare-datatypes ((array!58447 0))(
  ( (array!58448 (arr!28097 (Array (_ BitVec 32) ValueCell!10104)) (size!28576 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58447)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33211)

(declare-fun from!2064 () (_ BitVec 32))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun lt!430389 () Bool)

(declare-datatypes ((tuple2!13710 0))(
  ( (tuple2!13711 (_1!6866 (_ BitVec 64)) (_2!6866 V!33211)) )
))
(declare-datatypes ((List!19532 0))(
  ( (Nil!19529) (Cons!19528 (h!20690 tuple2!13710) (t!27895 List!19532)) )
))
(declare-datatypes ((ListLongMap!12407 0))(
  ( (ListLongMap!12408 (toList!6219 List!19532)) )
))
(declare-fun contains!5320 (ListLongMap!12407 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3452 (array!58445 array!58447 (_ BitVec 32) (_ BitVec 32) V!33211 V!33211 (_ BitVec 32) Int) ListLongMap!12407)

(assert (=> b!957956 (= lt!430389 (contains!5320 (getCurrentListMap!3452 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28096 _keys!1668) i!793)))))

(declare-fun b!957957 () Bool)

(declare-fun res!641224 () Bool)

(assert (=> b!957957 (=> (not res!641224) (not e!540057))))

(declare-datatypes ((List!19533 0))(
  ( (Nil!19530) (Cons!19529 (h!20691 (_ BitVec 64)) (t!27896 List!19533)) )
))
(declare-fun arrayNoDuplicates!0 (array!58445 (_ BitVec 32) List!19533) Bool)

(assert (=> b!957957 (= res!641224 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19530))))

(declare-fun mapNonEmpty!33736 () Bool)

(declare-fun mapRes!33736 () Bool)

(declare-fun tp!64355 () Bool)

(declare-fun e!540058 () Bool)

(assert (=> mapNonEmpty!33736 (= mapRes!33736 (and tp!64355 e!540058))))

(declare-fun mapKey!33736 () (_ BitVec 32))

(declare-fun mapRest!33736 () (Array (_ BitVec 32) ValueCell!10104))

(declare-fun mapValue!33736 () ValueCell!10104)

(assert (=> mapNonEmpty!33736 (= (arr!28097 _values!1386) (store mapRest!33736 mapKey!33736 mapValue!33736))))

(declare-fun b!957959 () Bool)

(declare-fun e!540056 () Bool)

(declare-fun e!540059 () Bool)

(assert (=> b!957959 (= e!540056 (and e!540059 mapRes!33736))))

(declare-fun condMapEmpty!33736 () Bool)

(declare-fun mapDefault!33736 () ValueCell!10104)

(assert (=> b!957959 (= condMapEmpty!33736 (= (arr!28097 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10104)) mapDefault!33736)))))

(declare-fun b!957960 () Bool)

(declare-fun res!641227 () Bool)

(assert (=> b!957960 (=> (not res!641227) (not e!540057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58445 (_ BitVec 32)) Bool)

(assert (=> b!957960 (= res!641227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33736 () Bool)

(assert (=> mapIsEmpty!33736 mapRes!33736))

(declare-fun b!957961 () Bool)

(declare-fun res!641223 () Bool)

(assert (=> b!957961 (=> (not res!641223) (not e!540057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957961 (= res!641223 (validKeyInArray!0 (select (arr!28096 _keys!1668) i!793)))))

(declare-fun b!957962 () Bool)

(declare-fun res!641228 () Bool)

(assert (=> b!957962 (=> (not res!641228) (not e!540057))))

(assert (=> b!957962 (= res!641228 (and (= (size!28576 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28575 _keys!1668) (size!28576 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957963 () Bool)

(declare-fun tp_is_empty!21171 () Bool)

(assert (=> b!957963 (= e!540059 tp_is_empty!21171)))

(declare-fun b!957964 () Bool)

(declare-fun res!641226 () Bool)

(assert (=> b!957964 (=> (not res!641226) (not e!540057))))

(assert (=> b!957964 (= res!641226 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28575 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28575 _keys!1668))))))

(declare-fun res!641225 () Bool)

(assert (=> start!82192 (=> (not res!641225) (not e!540057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82192 (= res!641225 (validMask!0 mask!2088))))

(assert (=> start!82192 e!540057))

(assert (=> start!82192 true))

(assert (=> start!82192 tp_is_empty!21171))

(declare-fun array_inv!21793 (array!58445) Bool)

(assert (=> start!82192 (array_inv!21793 _keys!1668)))

(declare-fun array_inv!21794 (array!58447) Bool)

(assert (=> start!82192 (and (array_inv!21794 _values!1386) e!540056)))

(assert (=> start!82192 tp!64356))

(declare-fun b!957958 () Bool)

(assert (=> b!957958 (= e!540058 tp_is_empty!21171)))

(assert (= (and start!82192 res!641225) b!957962))

(assert (= (and b!957962 res!641228) b!957960))

(assert (= (and b!957960 res!641227) b!957957))

(assert (= (and b!957957 res!641224) b!957964))

(assert (= (and b!957964 res!641226) b!957961))

(assert (= (and b!957961 res!641223) b!957956))

(assert (= (and b!957959 condMapEmpty!33736) mapIsEmpty!33736))

(assert (= (and b!957959 (not condMapEmpty!33736)) mapNonEmpty!33736))

(get-info :version)

(assert (= (and mapNonEmpty!33736 ((_ is ValueCellFull!10104) mapValue!33736)) b!957958))

(assert (= (and b!957959 ((_ is ValueCellFull!10104) mapDefault!33736)) b!957963))

(assert (= start!82192 b!957959))

(declare-fun m!888757 () Bool)

(assert (=> b!957961 m!888757))

(assert (=> b!957961 m!888757))

(declare-fun m!888759 () Bool)

(assert (=> b!957961 m!888759))

(declare-fun m!888761 () Bool)

(assert (=> b!957957 m!888761))

(declare-fun m!888763 () Bool)

(assert (=> b!957956 m!888763))

(assert (=> b!957956 m!888757))

(assert (=> b!957956 m!888763))

(assert (=> b!957956 m!888757))

(declare-fun m!888765 () Bool)

(assert (=> b!957956 m!888765))

(declare-fun m!888767 () Bool)

(assert (=> mapNonEmpty!33736 m!888767))

(declare-fun m!888769 () Bool)

(assert (=> b!957960 m!888769))

(declare-fun m!888771 () Bool)

(assert (=> start!82192 m!888771))

(declare-fun m!888773 () Bool)

(assert (=> start!82192 m!888773))

(declare-fun m!888775 () Bool)

(assert (=> start!82192 m!888775))

(check-sat (not b!957957) (not b!957961) (not b!957960) (not b_next!18465) (not mapNonEmpty!33736) (not start!82192) b_and!29953 tp_is_empty!21171 (not b!957956))
(check-sat b_and!29953 (not b_next!18465))
