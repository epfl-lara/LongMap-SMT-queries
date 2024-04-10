; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113296 () Bool)

(assert start!113296)

(declare-fun b_free!31347 () Bool)

(declare-fun b_next!31347 () Bool)

(assert (=> start!113296 (= b_free!31347 (not b_next!31347))))

(declare-fun tp!109845 () Bool)

(declare-fun b_and!50569 () Bool)

(assert (=> start!113296 (= tp!109845 b_and!50569)))

(declare-fun b!1344255 () Bool)

(declare-fun res!891884 () Bool)

(declare-fun e!765083 () Bool)

(assert (=> b!1344255 (=> (not res!891884) (not e!765083))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91536 0))(
  ( (array!91537 (arr!44224 (Array (_ BitVec 32) (_ BitVec 64))) (size!44774 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91536)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344255 (= res!891884 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44774 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344256 () Bool)

(declare-fun e!765081 () Bool)

(declare-fun tp_is_empty!37347 () Bool)

(assert (=> b!1344256 (= e!765081 tp_is_empty!37347)))

(declare-fun res!891885 () Bool)

(assert (=> start!113296 (=> (not res!891885) (not e!765083))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113296 (= res!891885 (validMask!0 mask!1977))))

(assert (=> start!113296 e!765083))

(assert (=> start!113296 tp_is_empty!37347))

(assert (=> start!113296 true))

(declare-fun array_inv!33327 (array!91536) Bool)

(assert (=> start!113296 (array_inv!33327 _keys!1571)))

(declare-datatypes ((V!54899 0))(
  ( (V!54900 (val!18748 Int)) )
))
(declare-datatypes ((ValueCell!17775 0))(
  ( (ValueCellFull!17775 (v!21396 V!54899)) (EmptyCell!17775) )
))
(declare-datatypes ((array!91538 0))(
  ( (array!91539 (arr!44225 (Array (_ BitVec 32) ValueCell!17775)) (size!44775 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91538)

(declare-fun e!765080 () Bool)

(declare-fun array_inv!33328 (array!91538) Bool)

(assert (=> start!113296 (and (array_inv!33328 _values!1303) e!765080)))

(assert (=> start!113296 tp!109845))

(declare-fun b!1344257 () Bool)

(declare-fun mapRes!57727 () Bool)

(assert (=> b!1344257 (= e!765080 (and e!765081 mapRes!57727))))

(declare-fun condMapEmpty!57727 () Bool)

(declare-fun mapDefault!57727 () ValueCell!17775)

(assert (=> b!1344257 (= condMapEmpty!57727 (= (arr!44225 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17775)) mapDefault!57727)))))

(declare-fun b!1344258 () Bool)

(declare-fun res!891881 () Bool)

(assert (=> b!1344258 (=> (not res!891881) (not e!765083))))

(declare-datatypes ((List!31314 0))(
  ( (Nil!31311) (Cons!31310 (h!32519 (_ BitVec 64)) (t!45838 List!31314)) )
))
(declare-fun arrayNoDuplicates!0 (array!91536 (_ BitVec 32) List!31314) Bool)

(assert (=> b!1344258 (= res!891881 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31311))))

(declare-fun b!1344259 () Bool)

(declare-fun e!765079 () Bool)

(assert (=> b!1344259 (= e!765079 tp_is_empty!37347)))

(declare-fun b!1344260 () Bool)

(assert (=> b!1344260 (= e!765083 false)))

(declare-fun zeroValue!1245 () V!54899)

(declare-fun lt!595170 () Bool)

(declare-fun minValue!1245 () V!54899)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24158 0))(
  ( (tuple2!24159 (_1!12090 (_ BitVec 64)) (_2!12090 V!54899)) )
))
(declare-datatypes ((List!31315 0))(
  ( (Nil!31312) (Cons!31311 (h!32520 tuple2!24158) (t!45839 List!31315)) )
))
(declare-datatypes ((ListLongMap!21815 0))(
  ( (ListLongMap!21816 (toList!10923 List!31315)) )
))
(declare-fun contains!9099 (ListLongMap!21815 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5879 (array!91536 array!91538 (_ BitVec 32) (_ BitVec 32) V!54899 V!54899 (_ BitVec 32) Int) ListLongMap!21815)

(assert (=> b!1344260 (= lt!595170 (contains!9099 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344261 () Bool)

(declare-fun res!891882 () Bool)

(assert (=> b!1344261 (=> (not res!891882) (not e!765083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91536 (_ BitVec 32)) Bool)

(assert (=> b!1344261 (= res!891882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57727 () Bool)

(declare-fun tp!109846 () Bool)

(assert (=> mapNonEmpty!57727 (= mapRes!57727 (and tp!109846 e!765079))))

(declare-fun mapValue!57727 () ValueCell!17775)

(declare-fun mapRest!57727 () (Array (_ BitVec 32) ValueCell!17775))

(declare-fun mapKey!57727 () (_ BitVec 32))

(assert (=> mapNonEmpty!57727 (= (arr!44225 _values!1303) (store mapRest!57727 mapKey!57727 mapValue!57727))))

(declare-fun mapIsEmpty!57727 () Bool)

(assert (=> mapIsEmpty!57727 mapRes!57727))

(declare-fun b!1344262 () Bool)

(declare-fun res!891883 () Bool)

(assert (=> b!1344262 (=> (not res!891883) (not e!765083))))

(assert (=> b!1344262 (= res!891883 (and (= (size!44775 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44774 _keys!1571) (size!44775 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113296 res!891885) b!1344262))

(assert (= (and b!1344262 res!891883) b!1344261))

(assert (= (and b!1344261 res!891882) b!1344258))

(assert (= (and b!1344258 res!891881) b!1344255))

(assert (= (and b!1344255 res!891884) b!1344260))

(assert (= (and b!1344257 condMapEmpty!57727) mapIsEmpty!57727))

(assert (= (and b!1344257 (not condMapEmpty!57727)) mapNonEmpty!57727))

(get-info :version)

(assert (= (and mapNonEmpty!57727 ((_ is ValueCellFull!17775) mapValue!57727)) b!1344259))

(assert (= (and b!1344257 ((_ is ValueCellFull!17775) mapDefault!57727)) b!1344256))

(assert (= start!113296 b!1344257))

(declare-fun m!1231919 () Bool)

(assert (=> mapNonEmpty!57727 m!1231919))

(declare-fun m!1231921 () Bool)

(assert (=> b!1344261 m!1231921))

(declare-fun m!1231923 () Bool)

(assert (=> b!1344258 m!1231923))

(declare-fun m!1231925 () Bool)

(assert (=> b!1344260 m!1231925))

(assert (=> b!1344260 m!1231925))

(declare-fun m!1231927 () Bool)

(assert (=> b!1344260 m!1231927))

(declare-fun m!1231929 () Bool)

(assert (=> start!113296 m!1231929))

(declare-fun m!1231931 () Bool)

(assert (=> start!113296 m!1231931))

(declare-fun m!1231933 () Bool)

(assert (=> start!113296 m!1231933))

(check-sat b_and!50569 (not start!113296) tp_is_empty!37347 (not b!1344258) (not b!1344261) (not b!1344260) (not mapNonEmpty!57727) (not b_next!31347))
(check-sat b_and!50569 (not b_next!31347))
