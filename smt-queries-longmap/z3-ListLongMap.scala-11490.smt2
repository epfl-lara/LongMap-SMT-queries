; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134150 () Bool)

(assert start!134150)

(declare-fun b_free!32101 () Bool)

(declare-fun b_next!32101 () Bool)

(assert (=> start!134150 (= b_free!32101 (not b_next!32101))))

(declare-fun tp!113507 () Bool)

(declare-fun b_and!51673 () Bool)

(assert (=> start!134150 (= tp!113507 b_and!51673)))

(declare-fun mapNonEmpty!59607 () Bool)

(declare-fun mapRes!59607 () Bool)

(declare-fun tp!113508 () Bool)

(declare-fun e!873072 () Bool)

(assert (=> mapNonEmpty!59607 (= mapRes!59607 (and tp!113508 e!873072))))

(declare-datatypes ((V!59969 0))(
  ( (V!59970 (val!19494 Int)) )
))
(declare-datatypes ((ValueCell!18380 0))(
  ( (ValueCellFull!18380 (v!22238 V!59969)) (EmptyCell!18380) )
))
(declare-fun mapValue!59607 () ValueCell!18380)

(declare-fun mapRest!59607 () (Array (_ BitVec 32) ValueCell!18380))

(declare-fun mapKey!59607 () (_ BitVec 32))

(declare-datatypes ((array!104458 0))(
  ( (array!104459 (arr!50414 (Array (_ BitVec 32) ValueCell!18380)) (size!50965 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104458)

(assert (=> mapNonEmpty!59607 (= (arr!50414 _values!487) (store mapRest!59607 mapKey!59607 mapValue!59607))))

(declare-fun b!1566221 () Bool)

(declare-fun res!1069946 () Bool)

(declare-fun e!873070 () Bool)

(assert (=> b!1566221 (=> (not res!1069946) (not e!873070))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104460 0))(
  ( (array!104461 (arr!50415 (Array (_ BitVec 32) (_ BitVec 64))) (size!50966 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104460)

(assert (=> b!1566221 (= res!1069946 (and (= (size!50965 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50966 _keys!637) (size!50965 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566222 () Bool)

(declare-fun res!1069951 () Bool)

(assert (=> b!1566222 (=> (not res!1069951) (not e!873070))))

(declare-datatypes ((List!36571 0))(
  ( (Nil!36568) (Cons!36567 (h!38031 (_ BitVec 64)) (t!51410 List!36571)) )
))
(declare-fun arrayNoDuplicates!0 (array!104460 (_ BitVec 32) List!36571) Bool)

(assert (=> b!1566222 (= res!1069951 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36568))))

(declare-fun res!1069950 () Bool)

(assert (=> start!134150 (=> (not res!1069950) (not e!873070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134150 (= res!1069950 (validMask!0 mask!947))))

(assert (=> start!134150 e!873070))

(assert (=> start!134150 tp!113507))

(declare-fun tp_is_empty!38821 () Bool)

(assert (=> start!134150 tp_is_empty!38821))

(assert (=> start!134150 true))

(declare-fun array_inv!39421 (array!104460) Bool)

(assert (=> start!134150 (array_inv!39421 _keys!637)))

(declare-fun e!873069 () Bool)

(declare-fun array_inv!39422 (array!104458) Bool)

(assert (=> start!134150 (and (array_inv!39422 _values!487) e!873069)))

(declare-fun b!1566223 () Bool)

(declare-fun e!873073 () Bool)

(assert (=> b!1566223 (= e!873069 (and e!873073 mapRes!59607))))

(declare-fun condMapEmpty!59607 () Bool)

(declare-fun mapDefault!59607 () ValueCell!18380)

(assert (=> b!1566223 (= condMapEmpty!59607 (= (arr!50414 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18380)) mapDefault!59607)))))

(declare-fun mapIsEmpty!59607 () Bool)

(assert (=> mapIsEmpty!59607 mapRes!59607))

(declare-fun b!1566224 () Bool)

(declare-fun e!873068 () Bool)

(assert (=> b!1566224 (= e!873070 e!873068)))

(declare-fun res!1069947 () Bool)

(assert (=> b!1566224 (=> (not res!1069947) (not e!873068))))

(declare-datatypes ((tuple2!25208 0))(
  ( (tuple2!25209 (_1!12615 (_ BitVec 64)) (_2!12615 V!59969)) )
))
(declare-datatypes ((List!36572 0))(
  ( (Nil!36569) (Cons!36568 (h!38032 tuple2!25208) (t!51411 List!36572)) )
))
(declare-datatypes ((ListLongMap!22651 0))(
  ( (ListLongMap!22652 (toList!11341 List!36572)) )
))
(declare-fun lt!672865 () ListLongMap!22651)

(declare-fun contains!10342 (ListLongMap!22651 (_ BitVec 64)) Bool)

(assert (=> b!1566224 (= res!1069947 (not (contains!10342 lt!672865 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59969)

(declare-fun minValue!453 () V!59969)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6737 (array!104460 array!104458 (_ BitVec 32) (_ BitVec 32) V!59969 V!59969 (_ BitVec 32) Int) ListLongMap!22651)

(assert (=> b!1566224 (= lt!672865 (getCurrentListMapNoExtraKeys!6737 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566225 () Bool)

(declare-fun res!1069948 () Bool)

(assert (=> b!1566225 (=> (not res!1069948) (not e!873070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566225 (= res!1069948 (not (validKeyInArray!0 (select (arr!50415 _keys!637) from!782))))))

(declare-fun b!1566226 () Bool)

(assert (=> b!1566226 (= e!873068 false)))

(declare-fun lt!672866 () Bool)

(assert (=> b!1566226 (= lt!672866 (contains!10342 lt!672865 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566227 () Bool)

(declare-fun res!1069949 () Bool)

(assert (=> b!1566227 (=> (not res!1069949) (not e!873070))))

(assert (=> b!1566227 (= res!1069949 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50966 _keys!637)) (bvslt from!782 (size!50966 _keys!637))))))

(declare-fun b!1566228 () Bool)

(assert (=> b!1566228 (= e!873073 tp_is_empty!38821)))

(declare-fun b!1566229 () Bool)

(assert (=> b!1566229 (= e!873072 tp_is_empty!38821)))

(declare-fun b!1566230 () Bool)

(declare-fun res!1069952 () Bool)

(assert (=> b!1566230 (=> (not res!1069952) (not e!873070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104460 (_ BitVec 32)) Bool)

(assert (=> b!1566230 (= res!1069952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!134150 res!1069950) b!1566221))

(assert (= (and b!1566221 res!1069946) b!1566230))

(assert (= (and b!1566230 res!1069952) b!1566222))

(assert (= (and b!1566222 res!1069951) b!1566227))

(assert (= (and b!1566227 res!1069949) b!1566225))

(assert (= (and b!1566225 res!1069948) b!1566224))

(assert (= (and b!1566224 res!1069947) b!1566226))

(assert (= (and b!1566223 condMapEmpty!59607) mapIsEmpty!59607))

(assert (= (and b!1566223 (not condMapEmpty!59607)) mapNonEmpty!59607))

(get-info :version)

(assert (= (and mapNonEmpty!59607 ((_ is ValueCellFull!18380) mapValue!59607)) b!1566229))

(assert (= (and b!1566223 ((_ is ValueCellFull!18380) mapDefault!59607)) b!1566228))

(assert (= start!134150 b!1566223))

(declare-fun m!1441473 () Bool)

(assert (=> start!134150 m!1441473))

(declare-fun m!1441475 () Bool)

(assert (=> start!134150 m!1441475))

(declare-fun m!1441477 () Bool)

(assert (=> start!134150 m!1441477))

(declare-fun m!1441479 () Bool)

(assert (=> b!1566230 m!1441479))

(declare-fun m!1441481 () Bool)

(assert (=> b!1566226 m!1441481))

(declare-fun m!1441483 () Bool)

(assert (=> b!1566225 m!1441483))

(assert (=> b!1566225 m!1441483))

(declare-fun m!1441485 () Bool)

(assert (=> b!1566225 m!1441485))

(declare-fun m!1441487 () Bool)

(assert (=> b!1566222 m!1441487))

(declare-fun m!1441489 () Bool)

(assert (=> b!1566224 m!1441489))

(declare-fun m!1441491 () Bool)

(assert (=> b!1566224 m!1441491))

(declare-fun m!1441493 () Bool)

(assert (=> mapNonEmpty!59607 m!1441493))

(check-sat (not start!134150) (not b_next!32101) tp_is_empty!38821 (not b!1566230) b_and!51673 (not b!1566222) (not b!1566224) (not mapNonEmpty!59607) (not b!1566225) (not b!1566226))
(check-sat b_and!51673 (not b_next!32101))
