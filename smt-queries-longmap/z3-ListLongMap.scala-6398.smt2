; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82186 () Bool)

(assert start!82186)

(declare-fun b_free!18459 () Bool)

(declare-fun b_next!18459 () Bool)

(assert (=> start!82186 (= b_free!18459 (not b_next!18459))))

(declare-fun tp!64338 () Bool)

(declare-fun b_and!29947 () Bool)

(assert (=> start!82186 (= tp!64338 b_and!29947)))

(declare-fun b!957875 () Bool)

(declare-fun e!540015 () Bool)

(declare-fun e!540014 () Bool)

(declare-fun mapRes!33727 () Bool)

(assert (=> b!957875 (= e!540015 (and e!540014 mapRes!33727))))

(declare-fun condMapEmpty!33727 () Bool)

(declare-datatypes ((V!33203 0))(
  ( (V!33204 (val!10633 Int)) )
))
(declare-datatypes ((ValueCell!10101 0))(
  ( (ValueCellFull!10101 (v!13190 V!33203)) (EmptyCell!10101) )
))
(declare-datatypes ((array!58433 0))(
  ( (array!58434 (arr!28090 (Array (_ BitVec 32) ValueCell!10101)) (size!28569 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58433)

(declare-fun mapDefault!33727 () ValueCell!10101)

(assert (=> b!957875 (= condMapEmpty!33727 (= (arr!28090 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10101)) mapDefault!33727)))))

(declare-fun mapIsEmpty!33727 () Bool)

(assert (=> mapIsEmpty!33727 mapRes!33727))

(declare-fun b!957876 () Bool)

(declare-fun e!540011 () Bool)

(declare-fun tp_is_empty!21165 () Bool)

(assert (=> b!957876 (= e!540011 tp_is_empty!21165)))

(declare-fun b!957877 () Bool)

(declare-fun res!641172 () Bool)

(declare-fun e!540012 () Bool)

(assert (=> b!957877 (=> (not res!641172) (not e!540012))))

(declare-datatypes ((array!58435 0))(
  ( (array!58436 (arr!28091 (Array (_ BitVec 32) (_ BitVec 64))) (size!28570 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58435)

(declare-datatypes ((List!19528 0))(
  ( (Nil!19525) (Cons!19524 (h!20686 (_ BitVec 64)) (t!27891 List!19528)) )
))
(declare-fun arrayNoDuplicates!0 (array!58435 (_ BitVec 32) List!19528) Bool)

(assert (=> b!957877 (= res!641172 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19525))))

(declare-fun b!957878 () Bool)

(declare-fun res!641169 () Bool)

(assert (=> b!957878 (=> (not res!641169) (not e!540012))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun mask!2088 () (_ BitVec 32))

(assert (=> b!957878 (= res!641169 (and (= (size!28569 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28570 _keys!1668) (size!28569 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!641170 () Bool)

(assert (=> start!82186 (=> (not res!641170) (not e!540012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82186 (= res!641170 (validMask!0 mask!2088))))

(assert (=> start!82186 e!540012))

(assert (=> start!82186 true))

(assert (=> start!82186 tp_is_empty!21165))

(declare-fun array_inv!21787 (array!58435) Bool)

(assert (=> start!82186 (array_inv!21787 _keys!1668)))

(declare-fun array_inv!21788 (array!58433) Bool)

(assert (=> start!82186 (and (array_inv!21788 _values!1386) e!540015)))

(assert (=> start!82186 tp!64338))

(declare-fun b!957879 () Bool)

(declare-fun res!641174 () Bool)

(assert (=> b!957879 (=> (not res!641174) (not e!540012))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957879 (= res!641174 (validKeyInArray!0 (select (arr!28091 _keys!1668) i!793)))))

(declare-fun b!957880 () Bool)

(declare-fun res!641173 () Bool)

(assert (=> b!957880 (=> (not res!641173) (not e!540012))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!957880 (= res!641173 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28570 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28570 _keys!1668))))))

(declare-fun b!957881 () Bool)

(declare-fun res!641171 () Bool)

(assert (=> b!957881 (=> (not res!641171) (not e!540012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58435 (_ BitVec 32)) Bool)

(assert (=> b!957881 (= res!641171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapNonEmpty!33727 () Bool)

(declare-fun tp!64337 () Bool)

(assert (=> mapNonEmpty!33727 (= mapRes!33727 (and tp!64337 e!540011))))

(declare-fun mapKey!33727 () (_ BitVec 32))

(declare-fun mapValue!33727 () ValueCell!10101)

(declare-fun mapRest!33727 () (Array (_ BitVec 32) ValueCell!10101))

(assert (=> mapNonEmpty!33727 (= (arr!28090 _values!1386) (store mapRest!33727 mapKey!33727 mapValue!33727))))

(declare-fun b!957882 () Bool)

(assert (=> b!957882 (= e!540012 false)))

(declare-fun lt!430380 () Bool)

(declare-fun minValue!1328 () V!33203)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33203)

(declare-datatypes ((tuple2!13706 0))(
  ( (tuple2!13707 (_1!6864 (_ BitVec 64)) (_2!6864 V!33203)) )
))
(declare-datatypes ((List!19529 0))(
  ( (Nil!19526) (Cons!19525 (h!20687 tuple2!13706) (t!27892 List!19529)) )
))
(declare-datatypes ((ListLongMap!12403 0))(
  ( (ListLongMap!12404 (toList!6217 List!19529)) )
))
(declare-fun contains!5318 (ListLongMap!12403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3450 (array!58435 array!58433 (_ BitVec 32) (_ BitVec 32) V!33203 V!33203 (_ BitVec 32) Int) ListLongMap!12403)

(assert (=> b!957882 (= lt!430380 (contains!5318 (getCurrentListMap!3450 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28091 _keys!1668) i!793)))))

(declare-fun b!957883 () Bool)

(assert (=> b!957883 (= e!540014 tp_is_empty!21165)))

(assert (= (and start!82186 res!641170) b!957878))

(assert (= (and b!957878 res!641169) b!957881))

(assert (= (and b!957881 res!641171) b!957877))

(assert (= (and b!957877 res!641172) b!957880))

(assert (= (and b!957880 res!641173) b!957879))

(assert (= (and b!957879 res!641174) b!957882))

(assert (= (and b!957875 condMapEmpty!33727) mapIsEmpty!33727))

(assert (= (and b!957875 (not condMapEmpty!33727)) mapNonEmpty!33727))

(get-info :version)

(assert (= (and mapNonEmpty!33727 ((_ is ValueCellFull!10101) mapValue!33727)) b!957876))

(assert (= (and b!957875 ((_ is ValueCellFull!10101) mapDefault!33727)) b!957883))

(assert (= start!82186 b!957875))

(declare-fun m!888697 () Bool)

(assert (=> b!957879 m!888697))

(assert (=> b!957879 m!888697))

(declare-fun m!888699 () Bool)

(assert (=> b!957879 m!888699))

(declare-fun m!888701 () Bool)

(assert (=> b!957877 m!888701))

(declare-fun m!888703 () Bool)

(assert (=> b!957881 m!888703))

(declare-fun m!888705 () Bool)

(assert (=> start!82186 m!888705))

(declare-fun m!888707 () Bool)

(assert (=> start!82186 m!888707))

(declare-fun m!888709 () Bool)

(assert (=> start!82186 m!888709))

(declare-fun m!888711 () Bool)

(assert (=> b!957882 m!888711))

(assert (=> b!957882 m!888697))

(assert (=> b!957882 m!888711))

(assert (=> b!957882 m!888697))

(declare-fun m!888713 () Bool)

(assert (=> b!957882 m!888713))

(declare-fun m!888715 () Bool)

(assert (=> mapNonEmpty!33727 m!888715))

(check-sat b_and!29947 (not mapNonEmpty!33727) (not b!957877) (not b!957879) (not b!957881) (not b!957882) (not start!82186) tp_is_empty!21165 (not b_next!18459))
(check-sat b_and!29947 (not b_next!18459))
