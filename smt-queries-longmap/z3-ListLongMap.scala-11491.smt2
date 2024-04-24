; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134156 () Bool)

(assert start!134156)

(declare-fun b_free!32107 () Bool)

(declare-fun b_next!32107 () Bool)

(assert (=> start!134156 (= b_free!32107 (not b_next!32107))))

(declare-fun tp!113526 () Bool)

(declare-fun b_and!51679 () Bool)

(assert (=> start!134156 (= tp!113526 b_and!51679)))

(declare-fun b!1566311 () Bool)

(declare-fun res!1070010 () Bool)

(declare-fun e!873123 () Bool)

(assert (=> b!1566311 (=> (not res!1070010) (not e!873123))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104470 0))(
  ( (array!104471 (arr!50420 (Array (_ BitVec 32) (_ BitVec 64))) (size!50971 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104470)

(assert (=> b!1566311 (= res!1070010 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50971 _keys!637)) (bvslt from!782 (size!50971 _keys!637))))))

(declare-fun b!1566312 () Bool)

(declare-fun e!873122 () Bool)

(declare-fun tp_is_empty!38827 () Bool)

(assert (=> b!1566312 (= e!873122 tp_is_empty!38827)))

(declare-fun b!1566313 () Bool)

(declare-fun e!873126 () Bool)

(assert (=> b!1566313 (= e!873126 false)))

(declare-fun lt!672883 () Bool)

(declare-datatypes ((V!59977 0))(
  ( (V!59978 (val!19497 Int)) )
))
(declare-datatypes ((tuple2!25214 0))(
  ( (tuple2!25215 (_1!12618 (_ BitVec 64)) (_2!12618 V!59977)) )
))
(declare-datatypes ((List!36577 0))(
  ( (Nil!36574) (Cons!36573 (h!38037 tuple2!25214) (t!51416 List!36577)) )
))
(declare-datatypes ((ListLongMap!22657 0))(
  ( (ListLongMap!22658 (toList!11344 List!36577)) )
))
(declare-fun lt!672884 () ListLongMap!22657)

(declare-fun contains!10345 (ListLongMap!22657 (_ BitVec 64)) Bool)

(assert (=> b!1566313 (= lt!672883 (contains!10345 lt!672884 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566314 () Bool)

(declare-fun res!1070012 () Bool)

(assert (=> b!1566314 (=> (not res!1070012) (not e!873123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566314 (= res!1070012 (not (validKeyInArray!0 (select (arr!50420 _keys!637) from!782))))))

(declare-fun b!1566315 () Bool)

(declare-fun res!1070009 () Bool)

(assert (=> b!1566315 (=> (not res!1070009) (not e!873123))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18383 0))(
  ( (ValueCellFull!18383 (v!22241 V!59977)) (EmptyCell!18383) )
))
(declare-datatypes ((array!104472 0))(
  ( (array!104473 (arr!50421 (Array (_ BitVec 32) ValueCell!18383)) (size!50972 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104472)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566315 (= res!1070009 (and (= (size!50972 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50971 _keys!637) (size!50972 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1070015 () Bool)

(assert (=> start!134156 (=> (not res!1070015) (not e!873123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134156 (= res!1070015 (validMask!0 mask!947))))

(assert (=> start!134156 e!873123))

(assert (=> start!134156 tp!113526))

(assert (=> start!134156 tp_is_empty!38827))

(assert (=> start!134156 true))

(declare-fun array_inv!39427 (array!104470) Bool)

(assert (=> start!134156 (array_inv!39427 _keys!637)))

(declare-fun e!873125 () Bool)

(declare-fun array_inv!39428 (array!104472) Bool)

(assert (=> start!134156 (and (array_inv!39428 _values!487) e!873125)))

(declare-fun b!1566316 () Bool)

(declare-fun e!873127 () Bool)

(assert (=> b!1566316 (= e!873127 tp_is_empty!38827)))

(declare-fun mapNonEmpty!59616 () Bool)

(declare-fun mapRes!59616 () Bool)

(declare-fun tp!113525 () Bool)

(assert (=> mapNonEmpty!59616 (= mapRes!59616 (and tp!113525 e!873122))))

(declare-fun mapRest!59616 () (Array (_ BitVec 32) ValueCell!18383))

(declare-fun mapValue!59616 () ValueCell!18383)

(declare-fun mapKey!59616 () (_ BitVec 32))

(assert (=> mapNonEmpty!59616 (= (arr!50421 _values!487) (store mapRest!59616 mapKey!59616 mapValue!59616))))

(declare-fun b!1566317 () Bool)

(assert (=> b!1566317 (= e!873125 (and e!873127 mapRes!59616))))

(declare-fun condMapEmpty!59616 () Bool)

(declare-fun mapDefault!59616 () ValueCell!18383)

(assert (=> b!1566317 (= condMapEmpty!59616 (= (arr!50421 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18383)) mapDefault!59616)))))

(declare-fun b!1566318 () Bool)

(declare-fun res!1070013 () Bool)

(assert (=> b!1566318 (=> (not res!1070013) (not e!873123))))

(declare-datatypes ((List!36578 0))(
  ( (Nil!36575) (Cons!36574 (h!38038 (_ BitVec 64)) (t!51417 List!36578)) )
))
(declare-fun arrayNoDuplicates!0 (array!104470 (_ BitVec 32) List!36578) Bool)

(assert (=> b!1566318 (= res!1070013 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36575))))

(declare-fun mapIsEmpty!59616 () Bool)

(assert (=> mapIsEmpty!59616 mapRes!59616))

(declare-fun b!1566319 () Bool)

(assert (=> b!1566319 (= e!873123 e!873126)))

(declare-fun res!1070014 () Bool)

(assert (=> b!1566319 (=> (not res!1070014) (not e!873126))))

(assert (=> b!1566319 (= res!1070014 (not (contains!10345 lt!672884 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59977)

(declare-fun minValue!453 () V!59977)

(declare-fun getCurrentListMapNoExtraKeys!6740 (array!104470 array!104472 (_ BitVec 32) (_ BitVec 32) V!59977 V!59977 (_ BitVec 32) Int) ListLongMap!22657)

(assert (=> b!1566319 (= lt!672884 (getCurrentListMapNoExtraKeys!6740 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566320 () Bool)

(declare-fun res!1070011 () Bool)

(assert (=> b!1566320 (=> (not res!1070011) (not e!873123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104470 (_ BitVec 32)) Bool)

(assert (=> b!1566320 (= res!1070011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!134156 res!1070015) b!1566315))

(assert (= (and b!1566315 res!1070009) b!1566320))

(assert (= (and b!1566320 res!1070011) b!1566318))

(assert (= (and b!1566318 res!1070013) b!1566311))

(assert (= (and b!1566311 res!1070010) b!1566314))

(assert (= (and b!1566314 res!1070012) b!1566319))

(assert (= (and b!1566319 res!1070014) b!1566313))

(assert (= (and b!1566317 condMapEmpty!59616) mapIsEmpty!59616))

(assert (= (and b!1566317 (not condMapEmpty!59616)) mapNonEmpty!59616))

(get-info :version)

(assert (= (and mapNonEmpty!59616 ((_ is ValueCellFull!18383) mapValue!59616)) b!1566312))

(assert (= (and b!1566317 ((_ is ValueCellFull!18383) mapDefault!59616)) b!1566316))

(assert (= start!134156 b!1566317))

(declare-fun m!1441539 () Bool)

(assert (=> mapNonEmpty!59616 m!1441539))

(declare-fun m!1441541 () Bool)

(assert (=> b!1566319 m!1441541))

(declare-fun m!1441543 () Bool)

(assert (=> b!1566319 m!1441543))

(declare-fun m!1441545 () Bool)

(assert (=> start!134156 m!1441545))

(declare-fun m!1441547 () Bool)

(assert (=> start!134156 m!1441547))

(declare-fun m!1441549 () Bool)

(assert (=> start!134156 m!1441549))

(declare-fun m!1441551 () Bool)

(assert (=> b!1566314 m!1441551))

(assert (=> b!1566314 m!1441551))

(declare-fun m!1441553 () Bool)

(assert (=> b!1566314 m!1441553))

(declare-fun m!1441555 () Bool)

(assert (=> b!1566318 m!1441555))

(declare-fun m!1441557 () Bool)

(assert (=> b!1566320 m!1441557))

(declare-fun m!1441559 () Bool)

(assert (=> b!1566313 m!1441559))

(check-sat (not mapNonEmpty!59616) (not start!134156) (not b!1566319) (not b!1566313) (not b!1566320) b_and!51679 tp_is_empty!38827 (not b_next!32107) (not b!1566318) (not b!1566314))
(check-sat b_and!51679 (not b_next!32107))
