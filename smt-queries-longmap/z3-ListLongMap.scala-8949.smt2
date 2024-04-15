; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108420 () Bool)

(assert start!108420)

(declare-fun b_free!27967 () Bool)

(declare-fun b_next!27967 () Bool)

(assert (=> start!108420 (= b_free!27967 (not b_next!27967))))

(declare-fun tp!99012 () Bool)

(declare-fun b_and!46009 () Bool)

(assert (=> start!108420 (= tp!99012 b_and!46009)))

(declare-fun b!1279546 () Bool)

(declare-fun res!849990 () Bool)

(declare-fun e!731091 () Bool)

(assert (=> b!1279546 (=> (not res!849990) (not e!731091))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84189 0))(
  ( (array!84190 (arr!40599 (Array (_ BitVec 32) (_ BitVec 64))) (size!41151 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84189)

(assert (=> b!1279546 (= res!849990 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41151 _keys!1741))))))

(declare-fun b!1279548 () Bool)

(declare-fun res!849989 () Bool)

(assert (=> b!1279548 (=> (not res!849989) (not e!731091))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49913 0))(
  ( (V!49914 (val!16878 Int)) )
))
(declare-datatypes ((ValueCell!15905 0))(
  ( (ValueCellFull!15905 (v!19477 V!49913)) (EmptyCell!15905) )
))
(declare-datatypes ((array!84191 0))(
  ( (array!84192 (arr!40600 (Array (_ BitVec 32) ValueCell!15905)) (size!41152 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84191)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279548 (= res!849989 (and (= (size!41152 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41151 _keys!1741) (size!41152 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279549 () Bool)

(declare-fun e!731087 () Bool)

(declare-fun tp_is_empty!33607 () Bool)

(assert (=> b!1279549 (= e!731087 tp_is_empty!33607)))

(declare-fun b!1279550 () Bool)

(declare-fun res!849991 () Bool)

(assert (=> b!1279550 (=> (not res!849991) (not e!731091))))

(declare-fun minValue!1387 () V!49913)

(declare-fun zeroValue!1387 () V!49913)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21674 0))(
  ( (tuple2!21675 (_1!10848 (_ BitVec 64)) (_2!10848 V!49913)) )
))
(declare-datatypes ((List!28863 0))(
  ( (Nil!28860) (Cons!28859 (h!30068 tuple2!21674) (t!42395 List!28863)) )
))
(declare-datatypes ((ListLongMap!19331 0))(
  ( (ListLongMap!19332 (toList!9681 List!28863)) )
))
(declare-fun contains!7726 (ListLongMap!19331 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4655 (array!84189 array!84191 (_ BitVec 32) (_ BitVec 32) V!49913 V!49913 (_ BitVec 32) Int) ListLongMap!19331)

(assert (=> b!1279550 (= res!849991 (contains!7726 (getCurrentListMap!4655 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279551 () Bool)

(declare-fun e!731088 () Bool)

(declare-fun mapRes!51962 () Bool)

(assert (=> b!1279551 (= e!731088 (and e!731087 mapRes!51962))))

(declare-fun condMapEmpty!51962 () Bool)

(declare-fun mapDefault!51962 () ValueCell!15905)

(assert (=> b!1279551 (= condMapEmpty!51962 (= (arr!40600 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15905)) mapDefault!51962)))))

(declare-fun mapNonEmpty!51962 () Bool)

(declare-fun tp!99011 () Bool)

(declare-fun e!731090 () Bool)

(assert (=> mapNonEmpty!51962 (= mapRes!51962 (and tp!99011 e!731090))))

(declare-fun mapKey!51962 () (_ BitVec 32))

(declare-fun mapValue!51962 () ValueCell!15905)

(declare-fun mapRest!51962 () (Array (_ BitVec 32) ValueCell!15905))

(assert (=> mapNonEmpty!51962 (= (arr!40600 _values!1445) (store mapRest!51962 mapKey!51962 mapValue!51962))))

(declare-fun mapIsEmpty!51962 () Bool)

(assert (=> mapIsEmpty!51962 mapRes!51962))

(declare-fun res!849988 () Bool)

(assert (=> start!108420 (=> (not res!849988) (not e!731091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108420 (= res!849988 (validMask!0 mask!2175))))

(assert (=> start!108420 e!731091))

(assert (=> start!108420 tp_is_empty!33607))

(assert (=> start!108420 true))

(declare-fun array_inv!30987 (array!84191) Bool)

(assert (=> start!108420 (and (array_inv!30987 _values!1445) e!731088)))

(declare-fun array_inv!30988 (array!84189) Bool)

(assert (=> start!108420 (array_inv!30988 _keys!1741)))

(assert (=> start!108420 tp!99012))

(declare-fun b!1279547 () Bool)

(declare-fun res!849987 () Bool)

(assert (=> b!1279547 (=> (not res!849987) (not e!731091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84189 (_ BitVec 32)) Bool)

(assert (=> b!1279547 (= res!849987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279552 () Bool)

(declare-fun res!849992 () Bool)

(assert (=> b!1279552 (=> (not res!849992) (not e!731091))))

(declare-datatypes ((List!28864 0))(
  ( (Nil!28861) (Cons!28860 (h!30069 (_ BitVec 64)) (t!42396 List!28864)) )
))
(declare-fun arrayNoDuplicates!0 (array!84189 (_ BitVec 32) List!28864) Bool)

(assert (=> b!1279552 (= res!849992 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28861))))

(declare-fun b!1279553 () Bool)

(assert (=> b!1279553 (= e!731091 (bvsgt from!2144 (size!41151 _keys!1741)))))

(declare-fun b!1279554 () Bool)

(assert (=> b!1279554 (= e!731090 tp_is_empty!33607)))

(assert (= (and start!108420 res!849988) b!1279548))

(assert (= (and b!1279548 res!849989) b!1279547))

(assert (= (and b!1279547 res!849987) b!1279552))

(assert (= (and b!1279552 res!849992) b!1279546))

(assert (= (and b!1279546 res!849990) b!1279550))

(assert (= (and b!1279550 res!849991) b!1279553))

(assert (= (and b!1279551 condMapEmpty!51962) mapIsEmpty!51962))

(assert (= (and b!1279551 (not condMapEmpty!51962)) mapNonEmpty!51962))

(get-info :version)

(assert (= (and mapNonEmpty!51962 ((_ is ValueCellFull!15905) mapValue!51962)) b!1279554))

(assert (= (and b!1279551 ((_ is ValueCellFull!15905) mapDefault!51962)) b!1279549))

(assert (= start!108420 b!1279551))

(declare-fun m!1174017 () Bool)

(assert (=> start!108420 m!1174017))

(declare-fun m!1174019 () Bool)

(assert (=> start!108420 m!1174019))

(declare-fun m!1174021 () Bool)

(assert (=> start!108420 m!1174021))

(declare-fun m!1174023 () Bool)

(assert (=> mapNonEmpty!51962 m!1174023))

(declare-fun m!1174025 () Bool)

(assert (=> b!1279552 m!1174025))

(declare-fun m!1174027 () Bool)

(assert (=> b!1279550 m!1174027))

(assert (=> b!1279550 m!1174027))

(declare-fun m!1174029 () Bool)

(assert (=> b!1279550 m!1174029))

(declare-fun m!1174031 () Bool)

(assert (=> b!1279547 m!1174031))

(check-sat (not mapNonEmpty!51962) (not b_next!27967) (not start!108420) (not b!1279550) b_and!46009 (not b!1279552) tp_is_empty!33607 (not b!1279547))
(check-sat b_and!46009 (not b_next!27967))
