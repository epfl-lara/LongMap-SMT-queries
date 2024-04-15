; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134020 () Bool)

(assert start!134020)

(declare-fun b_free!32197 () Bool)

(declare-fun b_next!32197 () Bool)

(assert (=> start!134020 (= b_free!32197 (not b_next!32197))))

(declare-fun tp!113910 () Bool)

(declare-fun b_and!51823 () Bool)

(assert (=> start!134020 (= tp!113910 b_and!51823)))

(declare-fun b!1566600 () Bool)

(declare-fun e!873224 () Bool)

(declare-fun tp_is_empty!38977 () Bool)

(assert (=> b!1566600 (= e!873224 tp_is_empty!38977)))

(declare-fun mapNonEmpty!59865 () Bool)

(declare-fun mapRes!59865 () Bool)

(declare-fun tp!113911 () Bool)

(declare-fun e!873228 () Bool)

(assert (=> mapNonEmpty!59865 (= mapRes!59865 (and tp!113911 e!873228))))

(declare-datatypes ((V!60177 0))(
  ( (V!60178 (val!19572 Int)) )
))
(declare-datatypes ((ValueCell!18458 0))(
  ( (ValueCellFull!18458 (v!22327 V!60177)) (EmptyCell!18458) )
))
(declare-fun mapValue!59865 () ValueCell!18458)

(declare-datatypes ((array!104572 0))(
  ( (array!104573 (arr!50472 (Array (_ BitVec 32) ValueCell!18458)) (size!51024 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104572)

(declare-fun mapRest!59865 () (Array (_ BitVec 32) ValueCell!18458))

(declare-fun mapKey!59865 () (_ BitVec 32))

(assert (=> mapNonEmpty!59865 (= (arr!50472 _values!487) (store mapRest!59865 mapKey!59865 mapValue!59865))))

(declare-fun b!1566601 () Bool)

(declare-fun res!1070786 () Bool)

(declare-fun e!873225 () Bool)

(assert (=> b!1566601 (=> (not res!1070786) (not e!873225))))

(declare-datatypes ((array!104574 0))(
  ( (array!104575 (arr!50473 (Array (_ BitVec 32) (_ BitVec 64))) (size!51025 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104574)

(declare-datatypes ((List!36686 0))(
  ( (Nil!36683) (Cons!36682 (h!38130 (_ BitVec 64)) (t!51582 List!36686)) )
))
(declare-fun arrayNoDuplicates!0 (array!104574 (_ BitVec 32) List!36686) Bool)

(assert (=> b!1566601 (= res!1070786 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36683))))

(declare-fun b!1566602 () Bool)

(declare-fun res!1070785 () Bool)

(assert (=> b!1566602 (=> (not res!1070785) (not e!873225))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104574 (_ BitVec 32)) Bool)

(assert (=> b!1566602 (= res!1070785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566603 () Bool)

(declare-fun e!873227 () Bool)

(assert (=> b!1566603 (= e!873225 e!873227)))

(declare-fun res!1070791 () Bool)

(assert (=> b!1566603 (=> (not res!1070791) (not e!873227))))

(declare-datatypes ((tuple2!25326 0))(
  ( (tuple2!25327 (_1!12674 (_ BitVec 64)) (_2!12674 V!60177)) )
))
(declare-datatypes ((List!36687 0))(
  ( (Nil!36684) (Cons!36683 (h!38131 tuple2!25326) (t!51583 List!36687)) )
))
(declare-datatypes ((ListLongMap!22761 0))(
  ( (ListLongMap!22762 (toList!11396 List!36687)) )
))
(declare-fun lt!672540 () ListLongMap!22761)

(declare-fun contains!10311 (ListLongMap!22761 (_ BitVec 64)) Bool)

(assert (=> b!1566603 (= res!1070791 (not (contains!10311 lt!672540 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60177)

(declare-fun minValue!453 () V!60177)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6747 (array!104574 array!104572 (_ BitVec 32) (_ BitVec 32) V!60177 V!60177 (_ BitVec 32) Int) ListLongMap!22761)

(assert (=> b!1566603 (= lt!672540 (getCurrentListMapNoExtraKeys!6747 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566604 () Bool)

(assert (=> b!1566604 (= e!873228 tp_is_empty!38977)))

(declare-fun b!1566605 () Bool)

(assert (=> b!1566605 (= e!873227 false)))

(declare-fun lt!672541 () Bool)

(assert (=> b!1566605 (= lt!672541 (contains!10311 lt!672540 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566606 () Bool)

(declare-fun res!1070790 () Bool)

(assert (=> b!1566606 (=> (not res!1070790) (not e!873225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566606 (= res!1070790 (not (validKeyInArray!0 (select (arr!50473 _keys!637) from!782))))))

(declare-fun mapIsEmpty!59865 () Bool)

(assert (=> mapIsEmpty!59865 mapRes!59865))

(declare-fun res!1070788 () Bool)

(assert (=> start!134020 (=> (not res!1070788) (not e!873225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134020 (= res!1070788 (validMask!0 mask!947))))

(assert (=> start!134020 e!873225))

(assert (=> start!134020 tp!113910))

(assert (=> start!134020 tp_is_empty!38977))

(assert (=> start!134020 true))

(declare-fun array_inv!39419 (array!104574) Bool)

(assert (=> start!134020 (array_inv!39419 _keys!637)))

(declare-fun e!873226 () Bool)

(declare-fun array_inv!39420 (array!104572) Bool)

(assert (=> start!134020 (and (array_inv!39420 _values!487) e!873226)))

(declare-fun b!1566607 () Bool)

(declare-fun res!1070789 () Bool)

(assert (=> b!1566607 (=> (not res!1070789) (not e!873225))))

(assert (=> b!1566607 (= res!1070789 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51025 _keys!637)) (bvslt from!782 (size!51025 _keys!637))))))

(declare-fun b!1566608 () Bool)

(assert (=> b!1566608 (= e!873226 (and e!873224 mapRes!59865))))

(declare-fun condMapEmpty!59865 () Bool)

(declare-fun mapDefault!59865 () ValueCell!18458)

(assert (=> b!1566608 (= condMapEmpty!59865 (= (arr!50472 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18458)) mapDefault!59865)))))

(declare-fun b!1566609 () Bool)

(declare-fun res!1070787 () Bool)

(assert (=> b!1566609 (=> (not res!1070787) (not e!873225))))

(assert (=> b!1566609 (= res!1070787 (and (= (size!51024 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51025 _keys!637) (size!51024 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!134020 res!1070788) b!1566609))

(assert (= (and b!1566609 res!1070787) b!1566602))

(assert (= (and b!1566602 res!1070785) b!1566601))

(assert (= (and b!1566601 res!1070786) b!1566607))

(assert (= (and b!1566607 res!1070789) b!1566606))

(assert (= (and b!1566606 res!1070790) b!1566603))

(assert (= (and b!1566603 res!1070791) b!1566605))

(assert (= (and b!1566608 condMapEmpty!59865) mapIsEmpty!59865))

(assert (= (and b!1566608 (not condMapEmpty!59865)) mapNonEmpty!59865))

(get-info :version)

(assert (= (and mapNonEmpty!59865 ((_ is ValueCellFull!18458) mapValue!59865)) b!1566604))

(assert (= (and b!1566608 ((_ is ValueCellFull!18458) mapDefault!59865)) b!1566600))

(assert (= start!134020 b!1566608))

(declare-fun m!1441021 () Bool)

(assert (=> b!1566601 m!1441021))

(declare-fun m!1441023 () Bool)

(assert (=> b!1566606 m!1441023))

(assert (=> b!1566606 m!1441023))

(declare-fun m!1441025 () Bool)

(assert (=> b!1566606 m!1441025))

(declare-fun m!1441027 () Bool)

(assert (=> b!1566605 m!1441027))

(declare-fun m!1441029 () Bool)

(assert (=> start!134020 m!1441029))

(declare-fun m!1441031 () Bool)

(assert (=> start!134020 m!1441031))

(declare-fun m!1441033 () Bool)

(assert (=> start!134020 m!1441033))

(declare-fun m!1441035 () Bool)

(assert (=> b!1566603 m!1441035))

(declare-fun m!1441037 () Bool)

(assert (=> b!1566603 m!1441037))

(declare-fun m!1441039 () Bool)

(assert (=> b!1566602 m!1441039))

(declare-fun m!1441041 () Bool)

(assert (=> mapNonEmpty!59865 m!1441041))

(check-sat tp_is_empty!38977 (not start!134020) (not mapNonEmpty!59865) (not b_next!32197) (not b!1566603) b_and!51823 (not b!1566602) (not b!1566605) (not b!1566601) (not b!1566606))
(check-sat b_and!51823 (not b_next!32197))
