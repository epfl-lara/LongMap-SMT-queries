; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113190 () Bool)

(assert start!113190)

(declare-fun b_free!31241 () Bool)

(declare-fun b_next!31241 () Bool)

(assert (=> start!113190 (= b_free!31241 (not b_next!31241))))

(declare-fun tp!109528 () Bool)

(declare-fun b_and!50389 () Bool)

(assert (=> start!113190 (= tp!109528 b_and!50389)))

(declare-fun b!1342473 () Bool)

(declare-fun res!890657 () Bool)

(declare-fun e!764285 () Bool)

(assert (=> b!1342473 (=> (not res!890657) (not e!764285))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91332 0))(
  ( (array!91333 (arr!44122 (Array (_ BitVec 32) (_ BitVec 64))) (size!44672 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91332)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54757 0))(
  ( (V!54758 (val!18695 Int)) )
))
(declare-datatypes ((ValueCell!17722 0))(
  ( (ValueCellFull!17722 (v!21343 V!54757)) (EmptyCell!17722) )
))
(declare-datatypes ((array!91334 0))(
  ( (array!91335 (arr!44123 (Array (_ BitVec 32) ValueCell!17722)) (size!44673 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91334)

(assert (=> b!1342473 (= res!890657 (and (= (size!44673 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44672 _keys!1571) (size!44673 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342475 () Bool)

(declare-fun res!890654 () Bool)

(assert (=> b!1342475 (=> (not res!890654) (not e!764285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91332 (_ BitVec 32)) Bool)

(assert (=> b!1342475 (= res!890654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342476 () Bool)

(assert (=> b!1342476 (= e!764285 (not true))))

(declare-datatypes ((tuple2!24078 0))(
  ( (tuple2!24079 (_1!12050 (_ BitVec 64)) (_2!12050 V!54757)) )
))
(declare-datatypes ((List!31235 0))(
  ( (Nil!31232) (Cons!31231 (h!32440 tuple2!24078) (t!45687 List!31235)) )
))
(declare-datatypes ((ListLongMap!21735 0))(
  ( (ListLongMap!21736 (toList!10883 List!31235)) )
))
(declare-fun lt!594496 () ListLongMap!21735)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9059 (ListLongMap!21735 (_ BitVec 64)) Bool)

(assert (=> b!1342476 (contains!9059 lt!594496 k!1142)))

(declare-datatypes ((Unit!44065 0))(
  ( (Unit!44066) )
))
(declare-fun lt!594494 () Unit!44065)

(declare-fun lt!594495 () V!54757)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!363 ((_ BitVec 64) (_ BitVec 64) V!54757 ListLongMap!21735) Unit!44065)

(assert (=> b!1342476 (= lt!594494 (lemmaInListMapAfterAddingDiffThenInBefore!363 k!1142 (select (arr!44122 _keys!1571) from!1960) lt!594495 lt!594496))))

(declare-fun lt!594498 () ListLongMap!21735)

(assert (=> b!1342476 (contains!9059 lt!594498 k!1142)))

(declare-fun lt!594497 () Unit!44065)

(declare-fun zeroValue!1245 () V!54757)

(assert (=> b!1342476 (= lt!594497 (lemmaInListMapAfterAddingDiffThenInBefore!363 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594498))))

(declare-fun +!4794 (ListLongMap!21735 tuple2!24078) ListLongMap!21735)

(assert (=> b!1342476 (= lt!594498 (+!4794 lt!594496 (tuple2!24079 (select (arr!44122 _keys!1571) from!1960) lt!594495)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22279 (ValueCell!17722 V!54757) V!54757)

(declare-fun dynLambda!3733 (Int (_ BitVec 64)) V!54757)

(assert (=> b!1342476 (= lt!594495 (get!22279 (select (arr!44123 _values!1303) from!1960) (dynLambda!3733 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54757)

(declare-fun getCurrentListMapNoExtraKeys!6436 (array!91332 array!91334 (_ BitVec 32) (_ BitVec 32) V!54757 V!54757 (_ BitVec 32) Int) ListLongMap!21735)

(assert (=> b!1342476 (= lt!594496 (getCurrentListMapNoExtraKeys!6436 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342477 () Bool)

(declare-fun e!764286 () Bool)

(declare-fun tp_is_empty!37241 () Bool)

(assert (=> b!1342477 (= e!764286 tp_is_empty!37241)))

(declare-fun b!1342478 () Bool)

(declare-fun res!890656 () Bool)

(assert (=> b!1342478 (=> (not res!890656) (not e!764285))))

(declare-datatypes ((List!31236 0))(
  ( (Nil!31233) (Cons!31232 (h!32441 (_ BitVec 64)) (t!45688 List!31236)) )
))
(declare-fun arrayNoDuplicates!0 (array!91332 (_ BitVec 32) List!31236) Bool)

(assert (=> b!1342478 (= res!890656 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31233))))

(declare-fun mapIsEmpty!57568 () Bool)

(declare-fun mapRes!57568 () Bool)

(assert (=> mapIsEmpty!57568 mapRes!57568))

(declare-fun b!1342479 () Bool)

(declare-fun res!890653 () Bool)

(assert (=> b!1342479 (=> (not res!890653) (not e!764285))))

(assert (=> b!1342479 (= res!890653 (not (= (select (arr!44122 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1342480 () Bool)

(declare-fun res!890651 () Bool)

(assert (=> b!1342480 (=> (not res!890651) (not e!764285))))

(assert (=> b!1342480 (= res!890651 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57568 () Bool)

(declare-fun tp!109527 () Bool)

(declare-fun e!764288 () Bool)

(assert (=> mapNonEmpty!57568 (= mapRes!57568 (and tp!109527 e!764288))))

(declare-fun mapRest!57568 () (Array (_ BitVec 32) ValueCell!17722))

(declare-fun mapValue!57568 () ValueCell!17722)

(declare-fun mapKey!57568 () (_ BitVec 32))

(assert (=> mapNonEmpty!57568 (= (arr!44123 _values!1303) (store mapRest!57568 mapKey!57568 mapValue!57568))))

(declare-fun b!1342474 () Bool)

(declare-fun res!890658 () Bool)

(assert (=> b!1342474 (=> (not res!890658) (not e!764285))))

(assert (=> b!1342474 (= res!890658 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44672 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!890650 () Bool)

(assert (=> start!113190 (=> (not res!890650) (not e!764285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113190 (= res!890650 (validMask!0 mask!1977))))

(assert (=> start!113190 e!764285))

(assert (=> start!113190 tp_is_empty!37241))

(assert (=> start!113190 true))

(declare-fun array_inv!33255 (array!91332) Bool)

(assert (=> start!113190 (array_inv!33255 _keys!1571)))

(declare-fun e!764287 () Bool)

(declare-fun array_inv!33256 (array!91334) Bool)

(assert (=> start!113190 (and (array_inv!33256 _values!1303) e!764287)))

(assert (=> start!113190 tp!109528))

(declare-fun b!1342481 () Bool)

(declare-fun res!890655 () Bool)

(assert (=> b!1342481 (=> (not res!890655) (not e!764285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342481 (= res!890655 (validKeyInArray!0 (select (arr!44122 _keys!1571) from!1960)))))

(declare-fun b!1342482 () Bool)

(assert (=> b!1342482 (= e!764288 tp_is_empty!37241)))

(declare-fun b!1342483 () Bool)

(assert (=> b!1342483 (= e!764287 (and e!764286 mapRes!57568))))

(declare-fun condMapEmpty!57568 () Bool)

(declare-fun mapDefault!57568 () ValueCell!17722)

