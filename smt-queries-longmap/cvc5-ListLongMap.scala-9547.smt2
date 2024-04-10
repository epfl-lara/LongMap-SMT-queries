; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113144 () Bool)

(assert start!113144)

(declare-fun b_free!31195 () Bool)

(declare-fun b_next!31195 () Bool)

(assert (=> start!113144 (= b_free!31195 (not b_next!31195))))

(declare-fun tp!109389 () Bool)

(declare-fun b_and!50297 () Bool)

(assert (=> start!113144 (= tp!109389 b_and!50297)))

(declare-fun b!1341599 () Bool)

(declare-fun res!890037 () Bool)

(declare-fun e!763942 () Bool)

(assert (=> b!1341599 (=> (not res!890037) (not e!763942))))

(declare-datatypes ((array!91242 0))(
  ( (array!91243 (arr!44077 (Array (_ BitVec 32) (_ BitVec 64))) (size!44627 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91242)

(declare-datatypes ((List!31203 0))(
  ( (Nil!31200) (Cons!31199 (h!32408 (_ BitVec 64)) (t!45609 List!31203)) )
))
(declare-fun arrayNoDuplicates!0 (array!91242 (_ BitVec 32) List!31203) Bool)

(assert (=> b!1341599 (= res!890037 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31200))))

(declare-fun b!1341600 () Bool)

(assert (=> b!1341600 (= e!763942 (not true))))

(declare-datatypes ((V!54697 0))(
  ( (V!54698 (val!18672 Int)) )
))
(declare-datatypes ((tuple2!24046 0))(
  ( (tuple2!24047 (_1!12034 (_ BitVec 64)) (_2!12034 V!54697)) )
))
(declare-datatypes ((List!31204 0))(
  ( (Nil!31201) (Cons!31200 (h!32409 tuple2!24046) (t!45610 List!31204)) )
))
(declare-datatypes ((ListLongMap!21703 0))(
  ( (ListLongMap!21704 (toList!10867 List!31204)) )
))
(declare-fun lt!594171 () ListLongMap!21703)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9043 (ListLongMap!21703 (_ BitVec 64)) Bool)

(assert (=> b!1341600 (contains!9043 lt!594171 k!1142)))

(declare-datatypes ((Unit!44037 0))(
  ( (Unit!44038) )
))
(declare-fun lt!594170 () Unit!44037)

(declare-fun zeroValue!1245 () V!54697)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!349 ((_ BitVec 64) (_ BitVec 64) V!54697 ListLongMap!21703) Unit!44037)

(assert (=> b!1341600 (= lt!594170 (lemmaInListMapAfterAddingDiffThenInBefore!349 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594171))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17699 0))(
  ( (ValueCellFull!17699 (v!21320 V!54697)) (EmptyCell!17699) )
))
(declare-datatypes ((array!91244 0))(
  ( (array!91245 (arr!44078 (Array (_ BitVec 32) ValueCell!17699)) (size!44628 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91244)

(declare-fun minValue!1245 () V!54697)

(declare-fun +!4780 (ListLongMap!21703 tuple2!24046) ListLongMap!21703)

(declare-fun getCurrentListMapNoExtraKeys!6422 (array!91242 array!91244 (_ BitVec 32) (_ BitVec 32) V!54697 V!54697 (_ BitVec 32) Int) ListLongMap!21703)

(declare-fun get!22251 (ValueCell!17699 V!54697) V!54697)

(declare-fun dynLambda!3719 (Int (_ BitVec 64)) V!54697)

(assert (=> b!1341600 (= lt!594171 (+!4780 (getCurrentListMapNoExtraKeys!6422 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24047 (select (arr!44077 _keys!1571) from!1960) (get!22251 (select (arr!44078 _values!1303) from!1960) (dynLambda!3719 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341601 () Bool)

(declare-fun e!763943 () Bool)

(declare-fun tp_is_empty!37195 () Bool)

(assert (=> b!1341601 (= e!763943 tp_is_empty!37195)))

(declare-fun b!1341602 () Bool)

(declare-fun res!890032 () Bool)

(assert (=> b!1341602 (=> (not res!890032) (not e!763942))))

(assert (=> b!1341602 (= res!890032 (and (= (size!44628 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44627 _keys!1571) (size!44628 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341603 () Bool)

(declare-fun res!890036 () Bool)

(assert (=> b!1341603 (=> (not res!890036) (not e!763942))))

(declare-fun getCurrentListMap!5831 (array!91242 array!91244 (_ BitVec 32) (_ BitVec 32) V!54697 V!54697 (_ BitVec 32) Int) ListLongMap!21703)

(assert (=> b!1341603 (= res!890036 (contains!9043 (getCurrentListMap!5831 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapNonEmpty!57499 () Bool)

(declare-fun mapRes!57499 () Bool)

(declare-fun tp!109390 () Bool)

(declare-fun e!763940 () Bool)

(assert (=> mapNonEmpty!57499 (= mapRes!57499 (and tp!109390 e!763940))))

(declare-fun mapKey!57499 () (_ BitVec 32))

(declare-fun mapRest!57499 () (Array (_ BitVec 32) ValueCell!17699))

(declare-fun mapValue!57499 () ValueCell!17699)

(assert (=> mapNonEmpty!57499 (= (arr!44078 _values!1303) (store mapRest!57499 mapKey!57499 mapValue!57499))))

(declare-fun b!1341604 () Bool)

(declare-fun e!763941 () Bool)

(assert (=> b!1341604 (= e!763941 (and e!763943 mapRes!57499))))

(declare-fun condMapEmpty!57499 () Bool)

(declare-fun mapDefault!57499 () ValueCell!17699)

