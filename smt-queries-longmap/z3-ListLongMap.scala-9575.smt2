; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113312 () Bool)

(assert start!113312)

(declare-fun b_free!31363 () Bool)

(declare-fun b_next!31363 () Bool)

(assert (=> start!113312 (= b_free!31363 (not b_next!31363))))

(declare-fun tp!109894 () Bool)

(declare-fun b_and!50567 () Bool)

(assert (=> start!113312 (= tp!109894 b_and!50567)))

(declare-fun b!1344383 () Bool)

(declare-fun e!765166 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344383 (= e!765166 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun b!1344384 () Bool)

(declare-fun res!891978 () Bool)

(assert (=> b!1344384 (=> (not res!891978) (not e!765166))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91513 0))(
  ( (array!91514 (arr!44213 (Array (_ BitVec 32) (_ BitVec 64))) (size!44765 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91513)

(assert (=> b!1344384 (= res!891978 (not (= (select (arr!44213 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!891983 () Bool)

(assert (=> start!113312 (=> (not res!891983) (not e!765166))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113312 (= res!891983 (validMask!0 mask!1977))))

(assert (=> start!113312 e!765166))

(declare-fun tp_is_empty!37363 () Bool)

(assert (=> start!113312 tp_is_empty!37363))

(assert (=> start!113312 true))

(declare-fun array_inv!33509 (array!91513) Bool)

(assert (=> start!113312 (array_inv!33509 _keys!1571)))

(declare-datatypes ((V!54921 0))(
  ( (V!54922 (val!18756 Int)) )
))
(declare-datatypes ((ValueCell!17783 0))(
  ( (ValueCellFull!17783 (v!21403 V!54921)) (EmptyCell!17783) )
))
(declare-datatypes ((array!91515 0))(
  ( (array!91516 (arr!44214 (Array (_ BitVec 32) ValueCell!17783)) (size!44766 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91515)

(declare-fun e!765170 () Bool)

(declare-fun array_inv!33510 (array!91515) Bool)

(assert (=> start!113312 (and (array_inv!33510 _values!1303) e!765170)))

(assert (=> start!113312 tp!109894))

(declare-fun b!1344385 () Bool)

(declare-fun res!891982 () Bool)

(assert (=> b!1344385 (=> (not res!891982) (not e!765166))))

(assert (=> b!1344385 (= res!891982 (and (= (size!44766 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44765 _keys!1571) (size!44766 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57751 () Bool)

(declare-fun mapRes!57751 () Bool)

(declare-fun tp!109895 () Bool)

(declare-fun e!765167 () Bool)

(assert (=> mapNonEmpty!57751 (= mapRes!57751 (and tp!109895 e!765167))))

(declare-fun mapKey!57751 () (_ BitVec 32))

(declare-fun mapValue!57751 () ValueCell!17783)

(declare-fun mapRest!57751 () (Array (_ BitVec 32) ValueCell!17783))

(assert (=> mapNonEmpty!57751 (= (arr!44214 _values!1303) (store mapRest!57751 mapKey!57751 mapValue!57751))))

(declare-fun b!1344386 () Bool)

(declare-fun res!891979 () Bool)

(assert (=> b!1344386 (=> (not res!891979) (not e!765166))))

(assert (=> b!1344386 (= res!891979 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44765 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344387 () Bool)

(declare-fun res!891985 () Bool)

(assert (=> b!1344387 (=> (not res!891985) (not e!765166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91513 (_ BitVec 32)) Bool)

(assert (=> b!1344387 (= res!891985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344388 () Bool)

(declare-fun e!765169 () Bool)

(assert (=> b!1344388 (= e!765169 tp_is_empty!37363)))

(declare-fun mapIsEmpty!57751 () Bool)

(assert (=> mapIsEmpty!57751 mapRes!57751))

(declare-fun b!1344389 () Bool)

(assert (=> b!1344389 (= e!765170 (and e!765169 mapRes!57751))))

(declare-fun condMapEmpty!57751 () Bool)

(declare-fun mapDefault!57751 () ValueCell!17783)

(assert (=> b!1344389 (= condMapEmpty!57751 (= (arr!44214 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17783)) mapDefault!57751)))))

(declare-fun b!1344390 () Bool)

(declare-fun res!891984 () Bool)

(assert (=> b!1344390 (=> (not res!891984) (not e!765166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344390 (= res!891984 (validKeyInArray!0 (select (arr!44213 _keys!1571) from!1960)))))

(declare-fun b!1344391 () Bool)

(declare-fun res!891980 () Bool)

(assert (=> b!1344391 (=> (not res!891980) (not e!765166))))

(declare-datatypes ((List!31373 0))(
  ( (Nil!31370) (Cons!31369 (h!32578 (_ BitVec 64)) (t!45889 List!31373)) )
))
(declare-fun arrayNoDuplicates!0 (array!91513 (_ BitVec 32) List!31373) Bool)

(assert (=> b!1344391 (= res!891980 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31370))))

(declare-fun b!1344392 () Bool)

(declare-fun res!891981 () Bool)

(assert (=> b!1344392 (=> (not res!891981) (not e!765166))))

(declare-fun minValue!1245 () V!54921)

(declare-fun zeroValue!1245 () V!54921)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24232 0))(
  ( (tuple2!24233 (_1!12127 (_ BitVec 64)) (_2!12127 V!54921)) )
))
(declare-datatypes ((List!31374 0))(
  ( (Nil!31371) (Cons!31370 (h!32579 tuple2!24232) (t!45890 List!31374)) )
))
(declare-datatypes ((ListLongMap!21889 0))(
  ( (ListLongMap!21890 (toList!10960 List!31374)) )
))
(declare-fun contains!9065 (ListLongMap!21889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5806 (array!91513 array!91515 (_ BitVec 32) (_ BitVec 32) V!54921 V!54921 (_ BitVec 32) Int) ListLongMap!21889)

(assert (=> b!1344392 (= res!891981 (contains!9065 (getCurrentListMap!5806 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344393 () Bool)

(assert (=> b!1344393 (= e!765167 tp_is_empty!37363)))

(assert (= (and start!113312 res!891983) b!1344385))

(assert (= (and b!1344385 res!891982) b!1344387))

(assert (= (and b!1344387 res!891985) b!1344391))

(assert (= (and b!1344391 res!891980) b!1344386))

(assert (= (and b!1344386 res!891979) b!1344392))

(assert (= (and b!1344392 res!891981) b!1344384))

(assert (= (and b!1344384 res!891978) b!1344390))

(assert (= (and b!1344390 res!891984) b!1344383))

(assert (= (and b!1344389 condMapEmpty!57751) mapIsEmpty!57751))

(assert (= (and b!1344389 (not condMapEmpty!57751)) mapNonEmpty!57751))

(get-info :version)

(assert (= (and mapNonEmpty!57751 ((_ is ValueCellFull!17783) mapValue!57751)) b!1344393))

(assert (= (and b!1344389 ((_ is ValueCellFull!17783) mapDefault!57751)) b!1344388))

(assert (= start!113312 b!1344389))

(declare-fun m!1231531 () Bool)

(assert (=> b!1344392 m!1231531))

(assert (=> b!1344392 m!1231531))

(declare-fun m!1231533 () Bool)

(assert (=> b!1344392 m!1231533))

(declare-fun m!1231535 () Bool)

(assert (=> b!1344387 m!1231535))

(declare-fun m!1231537 () Bool)

(assert (=> b!1344384 m!1231537))

(declare-fun m!1231539 () Bool)

(assert (=> mapNonEmpty!57751 m!1231539))

(assert (=> b!1344390 m!1231537))

(assert (=> b!1344390 m!1231537))

(declare-fun m!1231541 () Bool)

(assert (=> b!1344390 m!1231541))

(declare-fun m!1231543 () Bool)

(assert (=> start!113312 m!1231543))

(declare-fun m!1231545 () Bool)

(assert (=> start!113312 m!1231545))

(declare-fun m!1231547 () Bool)

(assert (=> start!113312 m!1231547))

(declare-fun m!1231549 () Bool)

(assert (=> b!1344391 m!1231549))

(check-sat (not b!1344391) (not b!1344392) (not b!1344387) (not mapNonEmpty!57751) b_and!50567 (not start!113312) (not b_next!31363) tp_is_empty!37363 (not b!1344390))
(check-sat b_and!50567 (not b_next!31363))
