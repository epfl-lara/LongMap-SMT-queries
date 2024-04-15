; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108844 () Bool)

(assert start!108844)

(declare-fun b_free!28357 () Bool)

(declare-fun b_next!28357 () Bool)

(assert (=> start!108844 (= b_free!28357 (not b_next!28357))))

(declare-fun tp!100188 () Bool)

(declare-fun b_and!46405 () Bool)

(assert (=> start!108844 (= tp!100188 b_and!46405)))

(declare-fun b!1285351 () Bool)

(declare-fun res!853892 () Bool)

(declare-fun e!734207 () Bool)

(assert (=> b!1285351 (=> (not res!853892) (not e!734207))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84939 0))(
  ( (array!84940 (arr!40972 (Array (_ BitVec 32) (_ BitVec 64))) (size!41524 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84939)

(assert (=> b!1285351 (= res!853892 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41524 _keys!1741))))))

(declare-fun mapNonEmpty!52553 () Bool)

(declare-fun mapRes!52553 () Bool)

(declare-fun tp!100187 () Bool)

(declare-fun e!734210 () Bool)

(assert (=> mapNonEmpty!52553 (= mapRes!52553 (and tp!100187 e!734210))))

(declare-datatypes ((V!50433 0))(
  ( (V!50434 (val!17073 Int)) )
))
(declare-datatypes ((ValueCell!16100 0))(
  ( (ValueCellFull!16100 (v!19674 V!50433)) (EmptyCell!16100) )
))
(declare-fun mapValue!52553 () ValueCell!16100)

(declare-datatypes ((array!84941 0))(
  ( (array!84942 (arr!40973 (Array (_ BitVec 32) ValueCell!16100)) (size!41525 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84941)

(declare-fun mapRest!52553 () (Array (_ BitVec 32) ValueCell!16100))

(declare-fun mapKey!52553 () (_ BitVec 32))

(assert (=> mapNonEmpty!52553 (= (arr!40973 _values!1445) (store mapRest!52553 mapKey!52553 mapValue!52553))))

(declare-fun b!1285352 () Bool)

(declare-fun res!853889 () Bool)

(assert (=> b!1285352 (=> (not res!853889) (not e!734207))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun mask!2175 () (_ BitVec 32))

(assert (=> b!1285352 (= res!853889 (and (= (size!41525 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41524 _keys!1741) (size!41525 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285353 () Bool)

(assert (=> b!1285353 (= e!734207 false)))

(declare-fun minValue!1387 () V!50433)

(declare-fun zeroValue!1387 () V!50433)

(declare-fun lt!576735 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21948 0))(
  ( (tuple2!21949 (_1!10985 (_ BitVec 64)) (_2!10985 V!50433)) )
))
(declare-datatypes ((List!29128 0))(
  ( (Nil!29125) (Cons!29124 (h!30333 tuple2!21948) (t!42664 List!29128)) )
))
(declare-datatypes ((ListLongMap!19605 0))(
  ( (ListLongMap!19606 (toList!9818 List!29128)) )
))
(declare-fun contains!7865 (ListLongMap!19605 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4788 (array!84939 array!84941 (_ BitVec 32) (_ BitVec 32) V!50433 V!50433 (_ BitVec 32) Int) ListLongMap!19605)

(assert (=> b!1285353 (= lt!576735 (contains!7865 (getCurrentListMap!4788 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52553 () Bool)

(assert (=> mapIsEmpty!52553 mapRes!52553))

(declare-fun b!1285354 () Bool)

(declare-fun res!853891 () Bool)

(assert (=> b!1285354 (=> (not res!853891) (not e!734207))))

(declare-datatypes ((List!29129 0))(
  ( (Nil!29126) (Cons!29125 (h!30334 (_ BitVec 64)) (t!42665 List!29129)) )
))
(declare-fun arrayNoDuplicates!0 (array!84939 (_ BitVec 32) List!29129) Bool)

(assert (=> b!1285354 (= res!853891 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29126))))

(declare-fun b!1285355 () Bool)

(declare-fun res!853890 () Bool)

(assert (=> b!1285355 (=> (not res!853890) (not e!734207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84939 (_ BitVec 32)) Bool)

(assert (=> b!1285355 (= res!853890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!853893 () Bool)

(assert (=> start!108844 (=> (not res!853893) (not e!734207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108844 (= res!853893 (validMask!0 mask!2175))))

(assert (=> start!108844 e!734207))

(declare-fun tp_is_empty!33997 () Bool)

(assert (=> start!108844 tp_is_empty!33997))

(assert (=> start!108844 true))

(declare-fun e!734209 () Bool)

(declare-fun array_inv!31235 (array!84941) Bool)

(assert (=> start!108844 (and (array_inv!31235 _values!1445) e!734209)))

(declare-fun array_inv!31236 (array!84939) Bool)

(assert (=> start!108844 (array_inv!31236 _keys!1741)))

(assert (=> start!108844 tp!100188))

(declare-fun b!1285356 () Bool)

(assert (=> b!1285356 (= e!734210 tp_is_empty!33997)))

(declare-fun b!1285357 () Bool)

(declare-fun e!734208 () Bool)

(assert (=> b!1285357 (= e!734208 tp_is_empty!33997)))

(declare-fun b!1285358 () Bool)

(assert (=> b!1285358 (= e!734209 (and e!734208 mapRes!52553))))

(declare-fun condMapEmpty!52553 () Bool)

(declare-fun mapDefault!52553 () ValueCell!16100)

(assert (=> b!1285358 (= condMapEmpty!52553 (= (arr!40973 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16100)) mapDefault!52553)))))

(assert (= (and start!108844 res!853893) b!1285352))

(assert (= (and b!1285352 res!853889) b!1285355))

(assert (= (and b!1285355 res!853890) b!1285354))

(assert (= (and b!1285354 res!853891) b!1285351))

(assert (= (and b!1285351 res!853892) b!1285353))

(assert (= (and b!1285358 condMapEmpty!52553) mapIsEmpty!52553))

(assert (= (and b!1285358 (not condMapEmpty!52553)) mapNonEmpty!52553))

(get-info :version)

(assert (= (and mapNonEmpty!52553 ((_ is ValueCellFull!16100) mapValue!52553)) b!1285356))

(assert (= (and b!1285358 ((_ is ValueCellFull!16100) mapDefault!52553)) b!1285357))

(assert (= start!108844 b!1285358))

(declare-fun m!1178281 () Bool)

(assert (=> mapNonEmpty!52553 m!1178281))

(declare-fun m!1178283 () Bool)

(assert (=> b!1285354 m!1178283))

(declare-fun m!1178285 () Bool)

(assert (=> start!108844 m!1178285))

(declare-fun m!1178287 () Bool)

(assert (=> start!108844 m!1178287))

(declare-fun m!1178289 () Bool)

(assert (=> start!108844 m!1178289))

(declare-fun m!1178291 () Bool)

(assert (=> b!1285353 m!1178291))

(assert (=> b!1285353 m!1178291))

(declare-fun m!1178293 () Bool)

(assert (=> b!1285353 m!1178293))

(declare-fun m!1178295 () Bool)

(assert (=> b!1285355 m!1178295))

(check-sat (not b!1285354) (not b!1285353) (not start!108844) b_and!46405 (not b_next!28357) tp_is_empty!33997 (not mapNonEmpty!52553) (not b!1285355))
(check-sat b_and!46405 (not b_next!28357))
