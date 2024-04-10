; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113602 () Bool)

(assert start!113602)

(declare-fun b_free!31569 () Bool)

(declare-fun b_next!31569 () Bool)

(assert (=> start!113602 (= b_free!31569 (not b_next!31569))))

(declare-fun tp!110518 () Bool)

(declare-fun b_and!50927 () Bool)

(assert (=> start!113602 (= tp!110518 b_and!50927)))

(declare-fun b!1348595 () Bool)

(declare-fun res!894779 () Bool)

(declare-fun e!767190 () Bool)

(assert (=> b!1348595 (=> (not res!894779) (not e!767190))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91966 0))(
  ( (array!91967 (arr!44437 (Array (_ BitVec 32) (_ BitVec 64))) (size!44987 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91966)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1348595 (= res!894779 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44987 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348596 () Bool)

(declare-fun res!894777 () Bool)

(assert (=> b!1348596 (=> (not res!894777) (not e!767190))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91966 (_ BitVec 32)) Bool)

(assert (=> b!1348596 (= res!894777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!894778 () Bool)

(assert (=> start!113602 (=> (not res!894778) (not e!767190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113602 (= res!894778 (validMask!0 mask!1977))))

(assert (=> start!113602 e!767190))

(declare-fun tp_is_empty!37569 () Bool)

(assert (=> start!113602 tp_is_empty!37569))

(assert (=> start!113602 true))

(declare-fun array_inv!33473 (array!91966) Bool)

(assert (=> start!113602 (array_inv!33473 _keys!1571)))

(declare-datatypes ((V!55195 0))(
  ( (V!55196 (val!18859 Int)) )
))
(declare-datatypes ((ValueCell!17886 0))(
  ( (ValueCellFull!17886 (v!21511 V!55195)) (EmptyCell!17886) )
))
(declare-datatypes ((array!91968 0))(
  ( (array!91969 (arr!44438 (Array (_ BitVec 32) ValueCell!17886)) (size!44988 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91968)

(declare-fun e!767189 () Bool)

(declare-fun array_inv!33474 (array!91968) Bool)

(assert (=> start!113602 (and (array_inv!33474 _values!1303) e!767189)))

(assert (=> start!113602 tp!110518))

(declare-fun b!1348597 () Bool)

(declare-fun res!894773 () Bool)

(assert (=> b!1348597 (=> (not res!894773) (not e!767190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348597 (= res!894773 (validKeyInArray!0 (select (arr!44437 _keys!1571) from!1960)))))

(declare-fun b!1348598 () Bool)

(declare-fun e!767192 () Bool)

(declare-fun mapRes!58067 () Bool)

(assert (=> b!1348598 (= e!767189 (and e!767192 mapRes!58067))))

(declare-fun condMapEmpty!58067 () Bool)

(declare-fun mapDefault!58067 () ValueCell!17886)

(assert (=> b!1348598 (= condMapEmpty!58067 (= (arr!44438 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17886)) mapDefault!58067)))))

(declare-fun b!1348599 () Bool)

(declare-fun res!894776 () Bool)

(assert (=> b!1348599 (=> (not res!894776) (not e!767190))))

(assert (=> b!1348599 (= res!894776 (not (= (select (arr!44437 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348600 () Bool)

(assert (=> b!1348600 (= e!767192 tp_is_empty!37569)))

(declare-fun b!1348601 () Bool)

(declare-fun res!894772 () Bool)

(assert (=> b!1348601 (=> (not res!894772) (not e!767190))))

(declare-datatypes ((List!31470 0))(
  ( (Nil!31467) (Cons!31466 (h!32675 (_ BitVec 64)) (t!46108 List!31470)) )
))
(declare-fun arrayNoDuplicates!0 (array!91966 (_ BitVec 32) List!31470) Bool)

(assert (=> b!1348601 (= res!894772 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31467))))

(declare-fun b!1348602 () Bool)

(declare-fun e!767193 () Bool)

(assert (=> b!1348602 (= e!767193 tp_is_empty!37569)))

(declare-fun mapNonEmpty!58067 () Bool)

(declare-fun tp!110519 () Bool)

(assert (=> mapNonEmpty!58067 (= mapRes!58067 (and tp!110519 e!767193))))

(declare-fun mapValue!58067 () ValueCell!17886)

(declare-fun mapKey!58067 () (_ BitVec 32))

(declare-fun mapRest!58067 () (Array (_ BitVec 32) ValueCell!17886))

(assert (=> mapNonEmpty!58067 (= (arr!44438 _values!1303) (store mapRest!58067 mapKey!58067 mapValue!58067))))

(declare-fun b!1348603 () Bool)

(declare-fun res!894775 () Bool)

(assert (=> b!1348603 (=> (not res!894775) (not e!767190))))

(declare-fun minValue!1245 () V!55195)

(declare-fun zeroValue!1245 () V!55195)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24318 0))(
  ( (tuple2!24319 (_1!12170 (_ BitVec 64)) (_2!12170 V!55195)) )
))
(declare-datatypes ((List!31471 0))(
  ( (Nil!31468) (Cons!31467 (h!32676 tuple2!24318) (t!46109 List!31471)) )
))
(declare-datatypes ((ListLongMap!21975 0))(
  ( (ListLongMap!21976 (toList!11003 List!31471)) )
))
(declare-fun contains!9183 (ListLongMap!21975 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5952 (array!91966 array!91968 (_ BitVec 32) (_ BitVec 32) V!55195 V!55195 (_ BitVec 32) Int) ListLongMap!21975)

(assert (=> b!1348603 (= res!894775 (contains!9183 (getCurrentListMap!5952 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348604 () Bool)

(assert (=> b!1348604 (= e!767190 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1960 (size!44988 _values!1303))))))

(declare-fun mapIsEmpty!58067 () Bool)

(assert (=> mapIsEmpty!58067 mapRes!58067))

(declare-fun b!1348605 () Bool)

(declare-fun res!894774 () Bool)

(assert (=> b!1348605 (=> (not res!894774) (not e!767190))))

(assert (=> b!1348605 (= res!894774 (and (= (size!44988 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44987 _keys!1571) (size!44988 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113602 res!894778) b!1348605))

(assert (= (and b!1348605 res!894774) b!1348596))

(assert (= (and b!1348596 res!894777) b!1348601))

(assert (= (and b!1348601 res!894772) b!1348595))

(assert (= (and b!1348595 res!894779) b!1348603))

(assert (= (and b!1348603 res!894775) b!1348599))

(assert (= (and b!1348599 res!894776) b!1348597))

(assert (= (and b!1348597 res!894773) b!1348604))

(assert (= (and b!1348598 condMapEmpty!58067) mapIsEmpty!58067))

(assert (= (and b!1348598 (not condMapEmpty!58067)) mapNonEmpty!58067))

(get-info :version)

(assert (= (and mapNonEmpty!58067 ((_ is ValueCellFull!17886) mapValue!58067)) b!1348602))

(assert (= (and b!1348598 ((_ is ValueCellFull!17886) mapDefault!58067)) b!1348600))

(assert (= start!113602 b!1348598))

(declare-fun m!1235639 () Bool)

(assert (=> b!1348601 m!1235639))

(declare-fun m!1235641 () Bool)

(assert (=> mapNonEmpty!58067 m!1235641))

(declare-fun m!1235643 () Bool)

(assert (=> b!1348597 m!1235643))

(assert (=> b!1348597 m!1235643))

(declare-fun m!1235645 () Bool)

(assert (=> b!1348597 m!1235645))

(declare-fun m!1235647 () Bool)

(assert (=> b!1348596 m!1235647))

(declare-fun m!1235649 () Bool)

(assert (=> start!113602 m!1235649))

(declare-fun m!1235651 () Bool)

(assert (=> start!113602 m!1235651))

(declare-fun m!1235653 () Bool)

(assert (=> start!113602 m!1235653))

(assert (=> b!1348599 m!1235643))

(declare-fun m!1235655 () Bool)

(assert (=> b!1348603 m!1235655))

(assert (=> b!1348603 m!1235655))

(declare-fun m!1235657 () Bool)

(assert (=> b!1348603 m!1235657))

(check-sat tp_is_empty!37569 (not start!113602) (not b_next!31569) (not b!1348596) (not mapNonEmpty!58067) b_and!50927 (not b!1348603) (not b!1348597) (not b!1348601))
(check-sat b_and!50927 (not b_next!31569))
