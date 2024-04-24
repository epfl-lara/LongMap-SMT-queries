; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108674 () Bool)

(assert start!108674)

(declare-fun b_free!27997 () Bool)

(declare-fun b_next!27997 () Bool)

(assert (=> start!108674 (= b_free!27997 (not b_next!27997))))

(declare-fun tp!99100 () Bool)

(declare-fun b_and!46059 () Bool)

(assert (=> start!108674 (= tp!99100 b_and!46059)))

(declare-fun mapIsEmpty!52007 () Bool)

(declare-fun mapRes!52007 () Bool)

(assert (=> mapIsEmpty!52007 mapRes!52007))

(declare-fun mapNonEmpty!52007 () Bool)

(declare-fun tp!99101 () Bool)

(declare-fun e!732192 () Bool)

(assert (=> mapNonEmpty!52007 (= mapRes!52007 (and tp!99101 e!732192))))

(declare-datatypes ((V!49953 0))(
  ( (V!49954 (val!16893 Int)) )
))
(declare-datatypes ((ValueCell!15920 0))(
  ( (ValueCellFull!15920 (v!19488 V!49953)) (EmptyCell!15920) )
))
(declare-fun mapValue!52007 () ValueCell!15920)

(declare-datatypes ((array!84383 0))(
  ( (array!84384 (arr!40691 (Array (_ BitVec 32) ValueCell!15920)) (size!41242 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84383)

(declare-fun mapKey!52007 () (_ BitVec 32))

(declare-fun mapRest!52007 () (Array (_ BitVec 32) ValueCell!15920))

(assert (=> mapNonEmpty!52007 (= (arr!40691 _values!1445) (store mapRest!52007 mapKey!52007 mapValue!52007))))

(declare-fun res!850769 () Bool)

(declare-fun e!732191 () Bool)

(assert (=> start!108674 (=> (not res!850769) (not e!732191))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108674 (= res!850769 (validMask!0 mask!2175))))

(assert (=> start!108674 e!732191))

(declare-fun tp_is_empty!33637 () Bool)

(assert (=> start!108674 tp_is_empty!33637))

(assert (=> start!108674 true))

(declare-fun e!732188 () Bool)

(declare-fun array_inv!31085 (array!84383) Bool)

(assert (=> start!108674 (and (array_inv!31085 _values!1445) e!732188)))

(declare-datatypes ((array!84385 0))(
  ( (array!84386 (arr!40692 (Array (_ BitVec 32) (_ BitVec 64))) (size!41243 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84385)

(declare-fun array_inv!31086 (array!84385) Bool)

(assert (=> start!108674 (array_inv!31086 _keys!1741)))

(assert (=> start!108674 tp!99100))

(declare-fun b!1281282 () Bool)

(declare-fun res!850770 () Bool)

(assert (=> b!1281282 (=> (not res!850770) (not e!732191))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1281282 (= res!850770 (and (= (size!41242 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41243 _keys!1741) (size!41242 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1281283 () Bool)

(declare-fun e!732190 () Bool)

(assert (=> b!1281283 (= e!732190 tp_is_empty!33637)))

(declare-fun b!1281284 () Bool)

(declare-fun res!850766 () Bool)

(assert (=> b!1281284 (=> (not res!850766) (not e!732191))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1281284 (= res!850766 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41243 _keys!1741))))))

(declare-fun b!1281285 () Bool)

(assert (=> b!1281285 (= e!732191 false)))

(declare-fun minValue!1387 () V!49953)

(declare-fun zeroValue!1387 () V!49953)

(declare-fun lt!576552 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21640 0))(
  ( (tuple2!21641 (_1!10831 (_ BitVec 64)) (_2!10831 V!49953)) )
))
(declare-datatypes ((List!28853 0))(
  ( (Nil!28850) (Cons!28849 (h!30067 tuple2!21640) (t!42385 List!28853)) )
))
(declare-datatypes ((ListLongMap!19305 0))(
  ( (ListLongMap!19306 (toList!9668 List!28853)) )
))
(declare-fun contains!7797 (ListLongMap!19305 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4737 (array!84385 array!84383 (_ BitVec 32) (_ BitVec 32) V!49953 V!49953 (_ BitVec 32) Int) ListLongMap!19305)

(assert (=> b!1281285 (= lt!576552 (contains!7797 (getCurrentListMap!4737 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1281286 () Bool)

(assert (=> b!1281286 (= e!732188 (and e!732190 mapRes!52007))))

(declare-fun condMapEmpty!52007 () Bool)

(declare-fun mapDefault!52007 () ValueCell!15920)

(assert (=> b!1281286 (= condMapEmpty!52007 (= (arr!40691 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15920)) mapDefault!52007)))))

(declare-fun b!1281287 () Bool)

(assert (=> b!1281287 (= e!732192 tp_is_empty!33637)))

(declare-fun b!1281288 () Bool)

(declare-fun res!850768 () Bool)

(assert (=> b!1281288 (=> (not res!850768) (not e!732191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84385 (_ BitVec 32)) Bool)

(assert (=> b!1281288 (= res!850768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1281289 () Bool)

(declare-fun res!850767 () Bool)

(assert (=> b!1281289 (=> (not res!850767) (not e!732191))))

(declare-datatypes ((List!28854 0))(
  ( (Nil!28851) (Cons!28850 (h!30068 (_ BitVec 64)) (t!42386 List!28854)) )
))
(declare-fun arrayNoDuplicates!0 (array!84385 (_ BitVec 32) List!28854) Bool)

(assert (=> b!1281289 (= res!850767 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28851))))

(assert (= (and start!108674 res!850769) b!1281282))

(assert (= (and b!1281282 res!850770) b!1281288))

(assert (= (and b!1281288 res!850768) b!1281289))

(assert (= (and b!1281289 res!850767) b!1281284))

(assert (= (and b!1281284 res!850766) b!1281285))

(assert (= (and b!1281286 condMapEmpty!52007) mapIsEmpty!52007))

(assert (= (and b!1281286 (not condMapEmpty!52007)) mapNonEmpty!52007))

(get-info :version)

(assert (= (and mapNonEmpty!52007 ((_ is ValueCellFull!15920) mapValue!52007)) b!1281287))

(assert (= (and b!1281286 ((_ is ValueCellFull!15920) mapDefault!52007)) b!1281283))

(assert (= start!108674 b!1281286))

(declare-fun m!1176369 () Bool)

(assert (=> b!1281289 m!1176369))

(declare-fun m!1176371 () Bool)

(assert (=> b!1281288 m!1176371))

(declare-fun m!1176373 () Bool)

(assert (=> start!108674 m!1176373))

(declare-fun m!1176375 () Bool)

(assert (=> start!108674 m!1176375))

(declare-fun m!1176377 () Bool)

(assert (=> start!108674 m!1176377))

(declare-fun m!1176379 () Bool)

(assert (=> mapNonEmpty!52007 m!1176379))

(declare-fun m!1176381 () Bool)

(assert (=> b!1281285 m!1176381))

(assert (=> b!1281285 m!1176381))

(declare-fun m!1176383 () Bool)

(assert (=> b!1281285 m!1176383))

(check-sat (not b_next!27997) (not b!1281288) (not b!1281289) tp_is_empty!33637 (not mapNonEmpty!52007) (not b!1281285) b_and!46059 (not start!108674))
(check-sat b_and!46059 (not b_next!27997))
