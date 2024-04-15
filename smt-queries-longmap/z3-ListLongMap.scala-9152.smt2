; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109792 () Bool)

(assert start!109792)

(declare-fun b_free!29185 () Bool)

(declare-fun b_next!29185 () Bool)

(assert (=> start!109792 (= b_free!29185 (not b_next!29185))))

(declare-fun tp!102689 () Bool)

(declare-fun b_and!47281 () Bool)

(assert (=> start!109792 (= tp!102689 b_and!47281)))

(declare-fun mapNonEmpty!53813 () Bool)

(declare-fun mapRes!53813 () Bool)

(declare-fun tp!102690 () Bool)

(declare-fun e!741812 () Bool)

(assert (=> mapNonEmpty!53813 (= mapRes!53813 (and tp!102690 e!741812))))

(declare-datatypes ((V!51537 0))(
  ( (V!51538 (val!17487 Int)) )
))
(declare-datatypes ((ValueCell!16514 0))(
  ( (ValueCellFull!16514 (v!20094 V!51537)) (EmptyCell!16514) )
))
(declare-fun mapRest!53813 () (Array (_ BitVec 32) ValueCell!16514))

(declare-fun mapValue!53813 () ValueCell!16514)

(declare-datatypes ((array!86561 0))(
  ( (array!86562 (arr!41777 (Array (_ BitVec 32) ValueCell!16514)) (size!42329 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86561)

(declare-fun mapKey!53813 () (_ BitVec 32))

(assert (=> mapNonEmpty!53813 (= (arr!41777 _values!1445) (store mapRest!53813 mapKey!53813 mapValue!53813))))

(declare-fun b!1300420 () Bool)

(declare-fun tp_is_empty!34825 () Bool)

(assert (=> b!1300420 (= e!741812 tp_is_empty!34825)))

(declare-fun b!1300421 () Bool)

(declare-fun res!864168 () Bool)

(declare-fun e!741810 () Bool)

(assert (=> b!1300421 (=> (not res!864168) (not e!741810))))

(declare-datatypes ((array!86563 0))(
  ( (array!86564 (arr!41778 (Array (_ BitVec 32) (_ BitVec 64))) (size!42330 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86563)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86563 (_ BitVec 32)) Bool)

(assert (=> b!1300421 (= res!864168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!864170 () Bool)

(assert (=> start!109792 (=> (not res!864170) (not e!741810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109792 (= res!864170 (validMask!0 mask!2175))))

(assert (=> start!109792 e!741810))

(assert (=> start!109792 tp_is_empty!34825))

(assert (=> start!109792 true))

(declare-fun e!741813 () Bool)

(declare-fun array_inv!31777 (array!86561) Bool)

(assert (=> start!109792 (and (array_inv!31777 _values!1445) e!741813)))

(declare-fun array_inv!31778 (array!86563) Bool)

(assert (=> start!109792 (array_inv!31778 _keys!1741)))

(assert (=> start!109792 tp!102689))

(declare-fun b!1300422 () Bool)

(declare-fun res!864166 () Bool)

(assert (=> b!1300422 (=> (not res!864166) (not e!741810))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1300422 (= res!864166 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42330 _keys!1741))))))

(declare-fun b!1300423 () Bool)

(assert (=> b!1300423 (= e!741810 false)))

(declare-fun zeroValue!1387 () V!51537)

(declare-fun lt!581218 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun minValue!1387 () V!51537)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22606 0))(
  ( (tuple2!22607 (_1!11314 (_ BitVec 64)) (_2!11314 V!51537)) )
))
(declare-datatypes ((List!29724 0))(
  ( (Nil!29721) (Cons!29720 (h!30929 tuple2!22606) (t!43290 List!29724)) )
))
(declare-datatypes ((ListLongMap!20263 0))(
  ( (ListLongMap!20264 (toList!10147 List!29724)) )
))
(declare-fun contains!8203 (ListLongMap!20263 (_ BitVec 64)) Bool)

(declare-fun +!4489 (ListLongMap!20263 tuple2!22606) ListLongMap!20263)

(declare-fun getCurrentListMapNoExtraKeys!6120 (array!86563 array!86561 (_ BitVec 32) (_ BitVec 32) V!51537 V!51537 (_ BitVec 32) Int) ListLongMap!20263)

(assert (=> b!1300423 (= lt!581218 (contains!8203 (+!4489 (getCurrentListMapNoExtraKeys!6120 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22607 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun b!1300424 () Bool)

(declare-fun e!741809 () Bool)

(assert (=> b!1300424 (= e!741809 tp_is_empty!34825)))

(declare-fun b!1300425 () Bool)

(assert (=> b!1300425 (= e!741813 (and e!741809 mapRes!53813))))

(declare-fun condMapEmpty!53813 () Bool)

(declare-fun mapDefault!53813 () ValueCell!16514)

(assert (=> b!1300425 (= condMapEmpty!53813 (= (arr!41777 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16514)) mapDefault!53813)))))

(declare-fun b!1300426 () Bool)

(declare-fun res!864163 () Bool)

(assert (=> b!1300426 (=> (not res!864163) (not e!741810))))

(declare-datatypes ((List!29725 0))(
  ( (Nil!29722) (Cons!29721 (h!30930 (_ BitVec 64)) (t!43291 List!29725)) )
))
(declare-fun arrayNoDuplicates!0 (array!86563 (_ BitVec 32) List!29725) Bool)

(assert (=> b!1300426 (= res!864163 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29722))))

(declare-fun b!1300427 () Bool)

(declare-fun res!864165 () Bool)

(assert (=> b!1300427 (=> (not res!864165) (not e!741810))))

(assert (=> b!1300427 (= res!864165 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1300428 () Bool)

(declare-fun res!864169 () Bool)

(assert (=> b!1300428 (=> (not res!864169) (not e!741810))))

(assert (=> b!1300428 (= res!864169 (and (= (size!42329 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42330 _keys!1741) (size!42329 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300429 () Bool)

(declare-fun res!864162 () Bool)

(assert (=> b!1300429 (=> (not res!864162) (not e!741810))))

(assert (=> b!1300429 (= res!864162 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42330 _keys!1741))))))

(declare-fun b!1300430 () Bool)

(declare-fun res!864167 () Bool)

(assert (=> b!1300430 (=> (not res!864167) (not e!741810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300430 (= res!864167 (validKeyInArray!0 (select (arr!41778 _keys!1741) from!2144)))))

(declare-fun mapIsEmpty!53813 () Bool)

(assert (=> mapIsEmpty!53813 mapRes!53813))

(declare-fun b!1300431 () Bool)

(declare-fun res!864164 () Bool)

(assert (=> b!1300431 (=> (not res!864164) (not e!741810))))

(declare-fun getCurrentListMap!5062 (array!86563 array!86561 (_ BitVec 32) (_ BitVec 32) V!51537 V!51537 (_ BitVec 32) Int) ListLongMap!20263)

(assert (=> b!1300431 (= res!864164 (contains!8203 (getCurrentListMap!5062 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109792 res!864170) b!1300428))

(assert (= (and b!1300428 res!864169) b!1300421))

(assert (= (and b!1300421 res!864168) b!1300426))

(assert (= (and b!1300426 res!864163) b!1300429))

(assert (= (and b!1300429 res!864162) b!1300431))

(assert (= (and b!1300431 res!864164) b!1300422))

(assert (= (and b!1300422 res!864166) b!1300430))

(assert (= (and b!1300430 res!864167) b!1300427))

(assert (= (and b!1300427 res!864165) b!1300423))

(assert (= (and b!1300425 condMapEmpty!53813) mapIsEmpty!53813))

(assert (= (and b!1300425 (not condMapEmpty!53813)) mapNonEmpty!53813))

(get-info :version)

(assert (= (and mapNonEmpty!53813 ((_ is ValueCellFull!16514) mapValue!53813)) b!1300420))

(assert (= (and b!1300425 ((_ is ValueCellFull!16514) mapDefault!53813)) b!1300424))

(assert (= start!109792 b!1300425))

(declare-fun m!1190903 () Bool)

(assert (=> b!1300431 m!1190903))

(assert (=> b!1300431 m!1190903))

(declare-fun m!1190905 () Bool)

(assert (=> b!1300431 m!1190905))

(declare-fun m!1190907 () Bool)

(assert (=> b!1300426 m!1190907))

(declare-fun m!1190909 () Bool)

(assert (=> b!1300423 m!1190909))

(assert (=> b!1300423 m!1190909))

(declare-fun m!1190911 () Bool)

(assert (=> b!1300423 m!1190911))

(assert (=> b!1300423 m!1190911))

(declare-fun m!1190913 () Bool)

(assert (=> b!1300423 m!1190913))

(declare-fun m!1190915 () Bool)

(assert (=> b!1300430 m!1190915))

(assert (=> b!1300430 m!1190915))

(declare-fun m!1190917 () Bool)

(assert (=> b!1300430 m!1190917))

(declare-fun m!1190919 () Bool)

(assert (=> start!109792 m!1190919))

(declare-fun m!1190921 () Bool)

(assert (=> start!109792 m!1190921))

(declare-fun m!1190923 () Bool)

(assert (=> start!109792 m!1190923))

(declare-fun m!1190925 () Bool)

(assert (=> b!1300421 m!1190925))

(declare-fun m!1190927 () Bool)

(assert (=> mapNonEmpty!53813 m!1190927))

(check-sat (not b!1300431) (not b!1300421) (not b!1300426) (not b!1300430) (not mapNonEmpty!53813) (not start!109792) b_and!47281 (not b!1300423) (not b_next!29185) tp_is_empty!34825)
(check-sat b_and!47281 (not b_next!29185))
