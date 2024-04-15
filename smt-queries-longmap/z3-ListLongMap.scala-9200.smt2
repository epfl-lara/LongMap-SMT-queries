; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110548 () Bool)

(assert start!110548)

(declare-fun b_free!29383 () Bool)

(declare-fun b_next!29383 () Bool)

(assert (=> start!110548 (= b_free!29383 (not b_next!29383))))

(declare-fun tp!103471 () Bool)

(declare-fun b_and!47573 () Bool)

(assert (=> start!110548 (= tp!103471 b_and!47573)))

(declare-fun b!1307665 () Bool)

(declare-fun res!868026 () Bool)

(declare-fun e!746202 () Bool)

(assert (=> b!1307665 (=> (not res!868026) (not e!746202))))

(declare-datatypes ((array!87141 0))(
  ( (array!87142 (arr!42051 (Array (_ BitVec 32) (_ BitVec 64))) (size!42603 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87141)

(declare-datatypes ((List!29905 0))(
  ( (Nil!29902) (Cons!29901 (h!31110 (_ BitVec 64)) (t!43503 List!29905)) )
))
(declare-fun arrayNoDuplicates!0 (array!87141 (_ BitVec 32) List!29905) Bool)

(assert (=> b!1307665 (= res!868026 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29902))))

(declare-fun b!1307666 () Bool)

(declare-fun res!868030 () Bool)

(assert (=> b!1307666 (=> (not res!868030) (not e!746202))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51921 0))(
  ( (V!51922 (val!17631 Int)) )
))
(declare-datatypes ((ValueCell!16658 0))(
  ( (ValueCellFull!16658 (v!20257 V!51921)) (EmptyCell!16658) )
))
(declare-datatypes ((array!87143 0))(
  ( (array!87144 (arr!42052 (Array (_ BitVec 32) ValueCell!16658)) (size!42604 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87143)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1307666 (= res!868030 (and (= (size!42604 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42603 _keys!1628) (size!42604 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1307667 () Bool)

(declare-fun res!868028 () Bool)

(assert (=> b!1307667 (=> (not res!868028) (not e!746202))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1307667 (= res!868028 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42603 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54298 () Bool)

(declare-fun mapRes!54298 () Bool)

(assert (=> mapIsEmpty!54298 mapRes!54298))

(declare-fun b!1307669 () Bool)

(declare-fun e!746203 () Bool)

(declare-fun tp_is_empty!35113 () Bool)

(assert (=> b!1307669 (= e!746203 tp_is_empty!35113)))

(declare-fun b!1307670 () Bool)

(assert (=> b!1307670 (= e!746202 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!584907 () Bool)

(declare-fun minValue!1296 () V!51921)

(declare-fun zeroValue!1296 () V!51921)

(declare-datatypes ((tuple2!22778 0))(
  ( (tuple2!22779 (_1!11400 (_ BitVec 64)) (_2!11400 V!51921)) )
))
(declare-datatypes ((List!29906 0))(
  ( (Nil!29903) (Cons!29902 (h!31111 tuple2!22778) (t!43504 List!29906)) )
))
(declare-datatypes ((ListLongMap!20435 0))(
  ( (ListLongMap!20436 (toList!10233 List!29906)) )
))
(declare-fun contains!8310 (ListLongMap!20435 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5128 (array!87141 array!87143 (_ BitVec 32) (_ BitVec 32) V!51921 V!51921 (_ BitVec 32) Int) ListLongMap!20435)

(assert (=> b!1307670 (= lt!584907 (contains!8310 (getCurrentListMap!5128 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1307671 () Bool)

(declare-fun res!868029 () Bool)

(assert (=> b!1307671 (=> (not res!868029) (not e!746202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87141 (_ BitVec 32)) Bool)

(assert (=> b!1307671 (= res!868029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54298 () Bool)

(declare-fun tp!103472 () Bool)

(declare-fun e!746200 () Bool)

(assert (=> mapNonEmpty!54298 (= mapRes!54298 (and tp!103472 e!746200))))

(declare-fun mapKey!54298 () (_ BitVec 32))

(declare-fun mapValue!54298 () ValueCell!16658)

(declare-fun mapRest!54298 () (Array (_ BitVec 32) ValueCell!16658))

(assert (=> mapNonEmpty!54298 (= (arr!42052 _values!1354) (store mapRest!54298 mapKey!54298 mapValue!54298))))

(declare-fun b!1307672 () Bool)

(declare-fun e!746201 () Bool)

(assert (=> b!1307672 (= e!746201 (and e!746203 mapRes!54298))))

(declare-fun condMapEmpty!54298 () Bool)

(declare-fun mapDefault!54298 () ValueCell!16658)

(assert (=> b!1307672 (= condMapEmpty!54298 (= (arr!42052 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16658)) mapDefault!54298)))))

(declare-fun res!868027 () Bool)

(assert (=> start!110548 (=> (not res!868027) (not e!746202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110548 (= res!868027 (validMask!0 mask!2040))))

(assert (=> start!110548 e!746202))

(assert (=> start!110548 tp!103471))

(declare-fun array_inv!31983 (array!87141) Bool)

(assert (=> start!110548 (array_inv!31983 _keys!1628)))

(assert (=> start!110548 true))

(assert (=> start!110548 tp_is_empty!35113))

(declare-fun array_inv!31984 (array!87143) Bool)

(assert (=> start!110548 (and (array_inv!31984 _values!1354) e!746201)))

(declare-fun b!1307668 () Bool)

(assert (=> b!1307668 (= e!746200 tp_is_empty!35113)))

(assert (= (and start!110548 res!868027) b!1307666))

(assert (= (and b!1307666 res!868030) b!1307671))

(assert (= (and b!1307671 res!868029) b!1307665))

(assert (= (and b!1307665 res!868026) b!1307667))

(assert (= (and b!1307667 res!868028) b!1307670))

(assert (= (and b!1307672 condMapEmpty!54298) mapIsEmpty!54298))

(assert (= (and b!1307672 (not condMapEmpty!54298)) mapNonEmpty!54298))

(get-info :version)

(assert (= (and mapNonEmpty!54298 ((_ is ValueCellFull!16658) mapValue!54298)) b!1307668))

(assert (= (and b!1307672 ((_ is ValueCellFull!16658) mapDefault!54298)) b!1307669))

(assert (= start!110548 b!1307672))

(declare-fun m!1197813 () Bool)

(assert (=> mapNonEmpty!54298 m!1197813))

(declare-fun m!1197815 () Bool)

(assert (=> b!1307671 m!1197815))

(declare-fun m!1197817 () Bool)

(assert (=> b!1307665 m!1197817))

(declare-fun m!1197819 () Bool)

(assert (=> start!110548 m!1197819))

(declare-fun m!1197821 () Bool)

(assert (=> start!110548 m!1197821))

(declare-fun m!1197823 () Bool)

(assert (=> start!110548 m!1197823))

(declare-fun m!1197825 () Bool)

(assert (=> b!1307670 m!1197825))

(assert (=> b!1307670 m!1197825))

(declare-fun m!1197827 () Bool)

(assert (=> b!1307670 m!1197827))

(check-sat (not mapNonEmpty!54298) (not b!1307671) b_and!47573 (not start!110548) tp_is_empty!35113 (not b_next!29383) (not b!1307670) (not b!1307665))
(check-sat b_and!47573 (not b_next!29383))
