; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113774 () Bool)

(assert start!113774)

(declare-fun b_free!31543 () Bool)

(declare-fun b_next!31543 () Bool)

(assert (=> start!113774 (= b_free!31543 (not b_next!31543))))

(declare-fun tp!110437 () Bool)

(declare-fun b_and!50877 () Bool)

(assert (=> start!113774 (= tp!110437 b_and!50877)))

(declare-fun b!1349258 () Bool)

(declare-fun res!894904 () Bool)

(declare-fun e!767719 () Bool)

(assert (=> b!1349258 (=> (not res!894904) (not e!767719))))

(declare-datatypes ((V!55161 0))(
  ( (V!55162 (val!18846 Int)) )
))
(declare-fun minValue!1245 () V!55161)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!92029 0))(
  ( (array!92030 (arr!44465 (Array (_ BitVec 32) (_ BitVec 64))) (size!45016 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92029)

(declare-fun zeroValue!1245 () V!55161)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17873 0))(
  ( (ValueCellFull!17873 (v!21492 V!55161)) (EmptyCell!17873) )
))
(declare-datatypes ((array!92031 0))(
  ( (array!92032 (arr!44466 (Array (_ BitVec 32) ValueCell!17873)) (size!45017 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92031)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24350 0))(
  ( (tuple2!24351 (_1!12186 (_ BitVec 64)) (_2!12186 V!55161)) )
))
(declare-datatypes ((List!31487 0))(
  ( (Nil!31484) (Cons!31483 (h!32701 tuple2!24350) (t!46101 List!31487)) )
))
(declare-datatypes ((ListLongMap!22015 0))(
  ( (ListLongMap!22016 (toList!11023 List!31487)) )
))
(declare-fun contains!9212 (ListLongMap!22015 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5961 (array!92029 array!92031 (_ BitVec 32) (_ BitVec 32) V!55161 V!55161 (_ BitVec 32) Int) ListLongMap!22015)

(assert (=> b!1349258 (= res!894904 (contains!9212 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1349259 () Bool)

(declare-fun e!767718 () Bool)

(declare-fun tp_is_empty!37543 () Bool)

(assert (=> b!1349259 (= e!767718 tp_is_empty!37543)))

(declare-fun mapIsEmpty!58025 () Bool)

(declare-fun mapRes!58025 () Bool)

(assert (=> mapIsEmpty!58025 mapRes!58025))

(declare-fun b!1349260 () Bool)

(declare-fun res!894909 () Bool)

(assert (=> b!1349260 (=> (not res!894909) (not e!767719))))

(assert (=> b!1349260 (= res!894909 (not (= (select (arr!44465 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349261 () Bool)

(declare-fun res!894907 () Bool)

(assert (=> b!1349261 (=> (not res!894907) (not e!767719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349261 (= res!894907 (validKeyInArray!0 (select (arr!44465 _keys!1571) from!1960)))))

(declare-fun b!1349262 () Bool)

(declare-fun res!894906 () Bool)

(assert (=> b!1349262 (=> (not res!894906) (not e!767719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92029 (_ BitVec 32)) Bool)

(assert (=> b!1349262 (= res!894906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!894910 () Bool)

(assert (=> start!113774 (=> (not res!894910) (not e!767719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113774 (= res!894910 (validMask!0 mask!1977))))

(assert (=> start!113774 e!767719))

(assert (=> start!113774 tp_is_empty!37543))

(assert (=> start!113774 true))

(declare-fun array_inv!33759 (array!92029) Bool)

(assert (=> start!113774 (array_inv!33759 _keys!1571)))

(declare-fun e!767717 () Bool)

(declare-fun array_inv!33760 (array!92031) Bool)

(assert (=> start!113774 (and (array_inv!33760 _values!1303) e!767717)))

(assert (=> start!113774 tp!110437))

(declare-fun b!1349263 () Bool)

(declare-fun res!894905 () Bool)

(assert (=> b!1349263 (=> (not res!894905) (not e!767719))))

(assert (=> b!1349263 (= res!894905 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1349264 () Bool)

(declare-fun res!894902 () Bool)

(assert (=> b!1349264 (=> (not res!894902) (not e!767719))))

(declare-datatypes ((List!31488 0))(
  ( (Nil!31485) (Cons!31484 (h!32702 (_ BitVec 64)) (t!46102 List!31488)) )
))
(declare-fun arrayNoDuplicates!0 (array!92029 (_ BitVec 32) List!31488) Bool)

(assert (=> b!1349264 (= res!894902 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31485))))

(declare-fun b!1349265 () Bool)

(assert (=> b!1349265 (= e!767719 (not (not (= k0!1142 (select (arr!44465 _keys!1571) from!1960)))))))

(declare-fun lt!596363 () ListLongMap!22015)

(assert (=> b!1349265 (contains!9212 lt!596363 k0!1142)))

(declare-datatypes ((Unit!44101 0))(
  ( (Unit!44102) )
))
(declare-fun lt!596364 () Unit!44101)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!399 ((_ BitVec 64) (_ BitVec 64) V!55161 ListLongMap!22015) Unit!44101)

(assert (=> b!1349265 (= lt!596364 (lemmaInListMapAfterAddingDiffThenInBefore!399 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!596363))))

(declare-fun +!4883 (ListLongMap!22015 tuple2!24350) ListLongMap!22015)

(declare-fun getCurrentListMapNoExtraKeys!6536 (array!92029 array!92031 (_ BitVec 32) (_ BitVec 32) V!55161 V!55161 (_ BitVec 32) Int) ListLongMap!22015)

(declare-fun get!22476 (ValueCell!17873 V!55161) V!55161)

(declare-fun dynLambda!3837 (Int (_ BitVec 64)) V!55161)

(assert (=> b!1349265 (= lt!596363 (+!4883 (getCurrentListMapNoExtraKeys!6536 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24351 (select (arr!44465 _keys!1571) from!1960) (get!22476 (select (arr!44466 _values!1303) from!1960) (dynLambda!3837 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1349266 () Bool)

(declare-fun e!767720 () Bool)

(assert (=> b!1349266 (= e!767720 tp_is_empty!37543)))

(declare-fun mapNonEmpty!58025 () Bool)

(declare-fun tp!110438 () Bool)

(assert (=> mapNonEmpty!58025 (= mapRes!58025 (and tp!110438 e!767718))))

(declare-fun mapRest!58025 () (Array (_ BitVec 32) ValueCell!17873))

(declare-fun mapKey!58025 () (_ BitVec 32))

(declare-fun mapValue!58025 () ValueCell!17873)

(assert (=> mapNonEmpty!58025 (= (arr!44466 _values!1303) (store mapRest!58025 mapKey!58025 mapValue!58025))))

(declare-fun b!1349267 () Bool)

(assert (=> b!1349267 (= e!767717 (and e!767720 mapRes!58025))))

(declare-fun condMapEmpty!58025 () Bool)

(declare-fun mapDefault!58025 () ValueCell!17873)

(assert (=> b!1349267 (= condMapEmpty!58025 (= (arr!44466 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17873)) mapDefault!58025)))))

(declare-fun b!1349268 () Bool)

(declare-fun res!894908 () Bool)

(assert (=> b!1349268 (=> (not res!894908) (not e!767719))))

(assert (=> b!1349268 (= res!894908 (and (= (size!45017 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45016 _keys!1571) (size!45017 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349269 () Bool)

(declare-fun res!894903 () Bool)

(assert (=> b!1349269 (=> (not res!894903) (not e!767719))))

(assert (=> b!1349269 (= res!894903 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45016 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113774 res!894910) b!1349268))

(assert (= (and b!1349268 res!894908) b!1349262))

(assert (= (and b!1349262 res!894906) b!1349264))

(assert (= (and b!1349264 res!894902) b!1349269))

(assert (= (and b!1349269 res!894903) b!1349258))

(assert (= (and b!1349258 res!894904) b!1349260))

(assert (= (and b!1349260 res!894909) b!1349261))

(assert (= (and b!1349261 res!894907) b!1349263))

(assert (= (and b!1349263 res!894905) b!1349265))

(assert (= (and b!1349267 condMapEmpty!58025) mapIsEmpty!58025))

(assert (= (and b!1349267 (not condMapEmpty!58025)) mapNonEmpty!58025))

(get-info :version)

(assert (= (and mapNonEmpty!58025 ((_ is ValueCellFull!17873) mapValue!58025)) b!1349259))

(assert (= (and b!1349267 ((_ is ValueCellFull!17873) mapDefault!58025)) b!1349266))

(assert (= start!113774 b!1349267))

(declare-fun b_lambda!24611 () Bool)

(assert (=> (not b_lambda!24611) (not b!1349265)))

(declare-fun t!46100 () Bool)

(declare-fun tb!12417 () Bool)

(assert (=> (and start!113774 (= defaultEntry!1306 defaultEntry!1306) t!46100) tb!12417))

(declare-fun result!25935 () Bool)

(assert (=> tb!12417 (= result!25935 tp_is_empty!37543)))

(assert (=> b!1349265 t!46100))

(declare-fun b_and!50879 () Bool)

(assert (= b_and!50877 (and (=> t!46100 result!25935) b_and!50879)))

(declare-fun m!1236589 () Bool)

(assert (=> b!1349262 m!1236589))

(declare-fun m!1236591 () Bool)

(assert (=> b!1349264 m!1236591))

(declare-fun m!1236593 () Bool)

(assert (=> b!1349261 m!1236593))

(assert (=> b!1349261 m!1236593))

(declare-fun m!1236595 () Bool)

(assert (=> b!1349261 m!1236595))

(declare-fun m!1236597 () Bool)

(assert (=> start!113774 m!1236597))

(declare-fun m!1236599 () Bool)

(assert (=> start!113774 m!1236599))

(declare-fun m!1236601 () Bool)

(assert (=> start!113774 m!1236601))

(declare-fun m!1236603 () Bool)

(assert (=> mapNonEmpty!58025 m!1236603))

(declare-fun m!1236605 () Bool)

(assert (=> b!1349265 m!1236605))

(declare-fun m!1236607 () Bool)

(assert (=> b!1349265 m!1236607))

(declare-fun m!1236609 () Bool)

(assert (=> b!1349265 m!1236609))

(declare-fun m!1236611 () Bool)

(assert (=> b!1349265 m!1236611))

(declare-fun m!1236613 () Bool)

(assert (=> b!1349265 m!1236613))

(assert (=> b!1349265 m!1236607))

(declare-fun m!1236615 () Bool)

(assert (=> b!1349265 m!1236615))

(assert (=> b!1349265 m!1236611))

(assert (=> b!1349265 m!1236593))

(declare-fun m!1236617 () Bool)

(assert (=> b!1349265 m!1236617))

(assert (=> b!1349265 m!1236609))

(assert (=> b!1349260 m!1236593))

(declare-fun m!1236619 () Bool)

(assert (=> b!1349258 m!1236619))

(assert (=> b!1349258 m!1236619))

(declare-fun m!1236621 () Bool)

(assert (=> b!1349258 m!1236621))

(check-sat b_and!50879 (not b_lambda!24611) (not b!1349258) (not mapNonEmpty!58025) (not b!1349264) (not b!1349262) tp_is_empty!37543 (not b!1349261) (not b!1349265) (not start!113774) (not b_next!31543))
(check-sat b_and!50879 (not b_next!31543))
