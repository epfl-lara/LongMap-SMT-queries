; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113768 () Bool)

(assert start!113768)

(declare-fun b_free!31537 () Bool)

(declare-fun b_next!31537 () Bool)

(assert (=> start!113768 (= b_free!31537 (not b_next!31537))))

(declare-fun tp!110420 () Bool)

(declare-fun b_and!50865 () Bool)

(assert (=> start!113768 (= tp!110420 b_and!50865)))

(declare-fun b!1349144 () Bool)

(declare-fun e!767672 () Bool)

(declare-fun tp_is_empty!37537 () Bool)

(assert (=> b!1349144 (= e!767672 tp_is_empty!37537)))

(declare-fun res!894826 () Bool)

(declare-fun e!767674 () Bool)

(assert (=> start!113768 (=> (not res!894826) (not e!767674))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113768 (= res!894826 (validMask!0 mask!1977))))

(assert (=> start!113768 e!767674))

(assert (=> start!113768 tp_is_empty!37537))

(assert (=> start!113768 true))

(declare-datatypes ((array!92017 0))(
  ( (array!92018 (arr!44459 (Array (_ BitVec 32) (_ BitVec 64))) (size!45010 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92017)

(declare-fun array_inv!33753 (array!92017) Bool)

(assert (=> start!113768 (array_inv!33753 _keys!1571)))

(declare-datatypes ((V!55153 0))(
  ( (V!55154 (val!18843 Int)) )
))
(declare-datatypes ((ValueCell!17870 0))(
  ( (ValueCellFull!17870 (v!21489 V!55153)) (EmptyCell!17870) )
))
(declare-datatypes ((array!92019 0))(
  ( (array!92020 (arr!44460 (Array (_ BitVec 32) ValueCell!17870)) (size!45011 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92019)

(declare-fun e!767675 () Bool)

(declare-fun array_inv!33754 (array!92019) Bool)

(assert (=> start!113768 (and (array_inv!33754 _values!1303) e!767675)))

(assert (=> start!113768 tp!110420))

(declare-fun b!1349145 () Bool)

(declare-fun res!894827 () Bool)

(assert (=> b!1349145 (=> (not res!894827) (not e!767674))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1349145 (= res!894827 (not (= (select (arr!44459 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349146 () Bool)

(declare-fun res!894824 () Bool)

(assert (=> b!1349146 (=> (not res!894824) (not e!767674))))

(declare-datatypes ((List!31482 0))(
  ( (Nil!31479) (Cons!31478 (h!32696 (_ BitVec 64)) (t!46090 List!31482)) )
))
(declare-fun arrayNoDuplicates!0 (array!92017 (_ BitVec 32) List!31482) Bool)

(assert (=> b!1349146 (= res!894824 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31479))))

(declare-fun b!1349147 () Bool)

(declare-fun res!894825 () Bool)

(assert (=> b!1349147 (=> (not res!894825) (not e!767674))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1349147 (= res!894825 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1349148 () Bool)

(assert (=> b!1349148 (= e!767674 (not true))))

(declare-datatypes ((tuple2!24344 0))(
  ( (tuple2!24345 (_1!12183 (_ BitVec 64)) (_2!12183 V!55153)) )
))
(declare-datatypes ((List!31483 0))(
  ( (Nil!31480) (Cons!31479 (h!32697 tuple2!24344) (t!46091 List!31483)) )
))
(declare-datatypes ((ListLongMap!22009 0))(
  ( (ListLongMap!22010 (toList!11020 List!31483)) )
))
(declare-fun lt!596345 () ListLongMap!22009)

(declare-fun contains!9209 (ListLongMap!22009 (_ BitVec 64)) Bool)

(assert (=> b!1349148 (contains!9209 lt!596345 k0!1142)))

(declare-datatypes ((Unit!44097 0))(
  ( (Unit!44098) )
))
(declare-fun lt!596346 () Unit!44097)

(declare-fun zeroValue!1245 () V!55153)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!397 ((_ BitVec 64) (_ BitVec 64) V!55153 ListLongMap!22009) Unit!44097)

(assert (=> b!1349148 (= lt!596346 (lemmaInListMapAfterAddingDiffThenInBefore!397 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!596345))))

(declare-fun minValue!1245 () V!55153)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4881 (ListLongMap!22009 tuple2!24344) ListLongMap!22009)

(declare-fun getCurrentListMapNoExtraKeys!6534 (array!92017 array!92019 (_ BitVec 32) (_ BitVec 32) V!55153 V!55153 (_ BitVec 32) Int) ListLongMap!22009)

(declare-fun get!22472 (ValueCell!17870 V!55153) V!55153)

(declare-fun dynLambda!3835 (Int (_ BitVec 64)) V!55153)

(assert (=> b!1349148 (= lt!596345 (+!4881 (getCurrentListMapNoExtraKeys!6534 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24345 (select (arr!44459 _keys!1571) from!1960) (get!22472 (select (arr!44460 _values!1303) from!1960) (dynLambda!3835 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1349149 () Bool)

(declare-fun e!767673 () Bool)

(assert (=> b!1349149 (= e!767673 tp_is_empty!37537)))

(declare-fun b!1349150 () Bool)

(declare-fun res!894828 () Bool)

(assert (=> b!1349150 (=> (not res!894828) (not e!767674))))

(assert (=> b!1349150 (= res!894828 (and (= (size!45011 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45010 _keys!1571) (size!45011 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349151 () Bool)

(declare-fun mapRes!58016 () Bool)

(assert (=> b!1349151 (= e!767675 (and e!767673 mapRes!58016))))

(declare-fun condMapEmpty!58016 () Bool)

(declare-fun mapDefault!58016 () ValueCell!17870)

(assert (=> b!1349151 (= condMapEmpty!58016 (= (arr!44460 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17870)) mapDefault!58016)))))

(declare-fun mapIsEmpty!58016 () Bool)

(assert (=> mapIsEmpty!58016 mapRes!58016))

(declare-fun b!1349152 () Bool)

(declare-fun res!894821 () Bool)

(assert (=> b!1349152 (=> (not res!894821) (not e!767674))))

(declare-fun getCurrentListMap!5958 (array!92017 array!92019 (_ BitVec 32) (_ BitVec 32) V!55153 V!55153 (_ BitVec 32) Int) ListLongMap!22009)

(assert (=> b!1349152 (= res!894821 (contains!9209 (getCurrentListMap!5958 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1349153 () Bool)

(declare-fun res!894829 () Bool)

(assert (=> b!1349153 (=> (not res!894829) (not e!767674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349153 (= res!894829 (validKeyInArray!0 (select (arr!44459 _keys!1571) from!1960)))))

(declare-fun b!1349154 () Bool)

(declare-fun res!894822 () Bool)

(assert (=> b!1349154 (=> (not res!894822) (not e!767674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92017 (_ BitVec 32)) Bool)

(assert (=> b!1349154 (= res!894822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!58016 () Bool)

(declare-fun tp!110419 () Bool)

(assert (=> mapNonEmpty!58016 (= mapRes!58016 (and tp!110419 e!767672))))

(declare-fun mapValue!58016 () ValueCell!17870)

(declare-fun mapRest!58016 () (Array (_ BitVec 32) ValueCell!17870))

(declare-fun mapKey!58016 () (_ BitVec 32))

(assert (=> mapNonEmpty!58016 (= (arr!44460 _values!1303) (store mapRest!58016 mapKey!58016 mapValue!58016))))

(declare-fun b!1349155 () Bool)

(declare-fun res!894823 () Bool)

(assert (=> b!1349155 (=> (not res!894823) (not e!767674))))

(assert (=> b!1349155 (= res!894823 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45010 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113768 res!894826) b!1349150))

(assert (= (and b!1349150 res!894828) b!1349154))

(assert (= (and b!1349154 res!894822) b!1349146))

(assert (= (and b!1349146 res!894824) b!1349155))

(assert (= (and b!1349155 res!894823) b!1349152))

(assert (= (and b!1349152 res!894821) b!1349145))

(assert (= (and b!1349145 res!894827) b!1349153))

(assert (= (and b!1349153 res!894829) b!1349147))

(assert (= (and b!1349147 res!894825) b!1349148))

(assert (= (and b!1349151 condMapEmpty!58016) mapIsEmpty!58016))

(assert (= (and b!1349151 (not condMapEmpty!58016)) mapNonEmpty!58016))

(get-info :version)

(assert (= (and mapNonEmpty!58016 ((_ is ValueCellFull!17870) mapValue!58016)) b!1349144))

(assert (= (and b!1349151 ((_ is ValueCellFull!17870) mapDefault!58016)) b!1349149))

(assert (= start!113768 b!1349151))

(declare-fun b_lambda!24605 () Bool)

(assert (=> (not b_lambda!24605) (not b!1349148)))

(declare-fun t!46089 () Bool)

(declare-fun tb!12411 () Bool)

(assert (=> (and start!113768 (= defaultEntry!1306 defaultEntry!1306) t!46089) tb!12411))

(declare-fun result!25923 () Bool)

(assert (=> tb!12411 (= result!25923 tp_is_empty!37537)))

(assert (=> b!1349148 t!46089))

(declare-fun b_and!50867 () Bool)

(assert (= b_and!50865 (and (=> t!46089 result!25923) b_and!50867)))

(declare-fun m!1236487 () Bool)

(assert (=> b!1349153 m!1236487))

(assert (=> b!1349153 m!1236487))

(declare-fun m!1236489 () Bool)

(assert (=> b!1349153 m!1236489))

(declare-fun m!1236491 () Bool)

(assert (=> b!1349146 m!1236491))

(declare-fun m!1236493 () Bool)

(assert (=> mapNonEmpty!58016 m!1236493))

(declare-fun m!1236495 () Bool)

(assert (=> b!1349148 m!1236495))

(declare-fun m!1236497 () Bool)

(assert (=> b!1349148 m!1236497))

(declare-fun m!1236499 () Bool)

(assert (=> b!1349148 m!1236499))

(declare-fun m!1236501 () Bool)

(assert (=> b!1349148 m!1236501))

(assert (=> b!1349148 m!1236495))

(declare-fun m!1236503 () Bool)

(assert (=> b!1349148 m!1236503))

(assert (=> b!1349148 m!1236497))

(declare-fun m!1236505 () Bool)

(assert (=> b!1349148 m!1236505))

(declare-fun m!1236507 () Bool)

(assert (=> b!1349148 m!1236507))

(assert (=> b!1349148 m!1236499))

(assert (=> b!1349148 m!1236487))

(declare-fun m!1236509 () Bool)

(assert (=> b!1349154 m!1236509))

(declare-fun m!1236511 () Bool)

(assert (=> b!1349152 m!1236511))

(assert (=> b!1349152 m!1236511))

(declare-fun m!1236513 () Bool)

(assert (=> b!1349152 m!1236513))

(assert (=> b!1349145 m!1236487))

(declare-fun m!1236515 () Bool)

(assert (=> start!113768 m!1236515))

(declare-fun m!1236517 () Bool)

(assert (=> start!113768 m!1236517))

(declare-fun m!1236519 () Bool)

(assert (=> start!113768 m!1236519))

(check-sat b_and!50867 (not b!1349154) (not b_next!31537) (not b!1349146) (not b!1349153) (not mapNonEmpty!58016) (not b!1349152) (not start!113768) (not b_lambda!24605) tp_is_empty!37537 (not b!1349148))
(check-sat b_and!50867 (not b_next!31537))
