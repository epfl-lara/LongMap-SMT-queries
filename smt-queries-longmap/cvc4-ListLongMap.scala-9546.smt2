; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113142 () Bool)

(assert start!113142)

(declare-fun b_free!31193 () Bool)

(declare-fun b_next!31193 () Bool)

(assert (=> start!113142 (= b_free!31193 (not b_next!31193))))

(declare-fun tp!109384 () Bool)

(declare-fun b_and!50293 () Bool)

(assert (=> start!113142 (= tp!109384 b_and!50293)))

(declare-fun b!1341561 () Bool)

(declare-fun res!890009 () Bool)

(declare-fun e!763925 () Bool)

(assert (=> b!1341561 (=> (not res!890009) (not e!763925))))

(declare-datatypes ((array!91238 0))(
  ( (array!91239 (arr!44075 (Array (_ BitVec 32) (_ BitVec 64))) (size!44625 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91238)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341561 (= res!890009 (validKeyInArray!0 (select (arr!44075 _keys!1571) from!1960)))))

(declare-fun b!1341563 () Bool)

(declare-fun res!890002 () Bool)

(assert (=> b!1341563 (=> (not res!890002) (not e!763925))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341563 (= res!890002 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341564 () Bool)

(declare-fun e!763926 () Bool)

(declare-fun tp_is_empty!37193 () Bool)

(assert (=> b!1341564 (= e!763926 tp_is_empty!37193)))

(declare-fun mapIsEmpty!57496 () Bool)

(declare-fun mapRes!57496 () Bool)

(assert (=> mapIsEmpty!57496 mapRes!57496))

(declare-fun b!1341565 () Bool)

(declare-fun e!763927 () Bool)

(assert (=> b!1341565 (= e!763927 tp_is_empty!37193)))

(declare-fun b!1341566 () Bool)

(declare-fun res!890010 () Bool)

(assert (=> b!1341566 (=> (not res!890010) (not e!763925))))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1341566 (= res!890010 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44625 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341567 () Bool)

(declare-fun res!890008 () Bool)

(assert (=> b!1341567 (=> (not res!890008) (not e!763925))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54693 0))(
  ( (V!54694 (val!18671 Int)) )
))
(declare-datatypes ((ValueCell!17698 0))(
  ( (ValueCellFull!17698 (v!21319 V!54693)) (EmptyCell!17698) )
))
(declare-datatypes ((array!91240 0))(
  ( (array!91241 (arr!44076 (Array (_ BitVec 32) ValueCell!17698)) (size!44626 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91240)

(assert (=> b!1341567 (= res!890008 (and (= (size!44626 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44625 _keys!1571) (size!44626 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341568 () Bool)

(declare-fun res!890004 () Bool)

(assert (=> b!1341568 (=> (not res!890004) (not e!763925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91238 (_ BitVec 32)) Bool)

(assert (=> b!1341568 (= res!890004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57496 () Bool)

(declare-fun tp!109383 () Bool)

(assert (=> mapNonEmpty!57496 (= mapRes!57496 (and tp!109383 e!763927))))

(declare-fun mapRest!57496 () (Array (_ BitVec 32) ValueCell!17698))

(declare-fun mapValue!57496 () ValueCell!17698)

(declare-fun mapKey!57496 () (_ BitVec 32))

(assert (=> mapNonEmpty!57496 (= (arr!44076 _values!1303) (store mapRest!57496 mapKey!57496 mapValue!57496))))

(declare-fun b!1341569 () Bool)

(declare-fun res!890003 () Bool)

(assert (=> b!1341569 (=> (not res!890003) (not e!763925))))

(declare-datatypes ((List!31201 0))(
  ( (Nil!31198) (Cons!31197 (h!32406 (_ BitVec 64)) (t!45605 List!31201)) )
))
(declare-fun arrayNoDuplicates!0 (array!91238 (_ BitVec 32) List!31201) Bool)

(assert (=> b!1341569 (= res!890003 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31198))))

(declare-fun b!1341570 () Bool)

(declare-fun res!890007 () Bool)

(assert (=> b!1341570 (=> (not res!890007) (not e!763925))))

(assert (=> b!1341570 (= res!890007 (not (= (select (arr!44075 _keys!1571) from!1960) k!1142)))))

(declare-fun res!890005 () Bool)

(assert (=> start!113142 (=> (not res!890005) (not e!763925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113142 (= res!890005 (validMask!0 mask!1977))))

(assert (=> start!113142 e!763925))

(assert (=> start!113142 tp_is_empty!37193))

(assert (=> start!113142 true))

(declare-fun array_inv!33225 (array!91238) Bool)

(assert (=> start!113142 (array_inv!33225 _keys!1571)))

(declare-fun e!763928 () Bool)

(declare-fun array_inv!33226 (array!91240) Bool)

(assert (=> start!113142 (and (array_inv!33226 _values!1303) e!763928)))

(assert (=> start!113142 tp!109384))

(declare-fun b!1341562 () Bool)

(assert (=> b!1341562 (= e!763925 (not true))))

(declare-datatypes ((tuple2!24044 0))(
  ( (tuple2!24045 (_1!12033 (_ BitVec 64)) (_2!12033 V!54693)) )
))
(declare-datatypes ((List!31202 0))(
  ( (Nil!31199) (Cons!31198 (h!32407 tuple2!24044) (t!45606 List!31202)) )
))
(declare-datatypes ((ListLongMap!21701 0))(
  ( (ListLongMap!21702 (toList!10866 List!31202)) )
))
(declare-fun lt!594165 () ListLongMap!21701)

(declare-fun contains!9042 (ListLongMap!21701 (_ BitVec 64)) Bool)

(assert (=> b!1341562 (contains!9042 lt!594165 k!1142)))

(declare-fun zeroValue!1245 () V!54693)

(declare-datatypes ((Unit!44035 0))(
  ( (Unit!44036) )
))
(declare-fun lt!594164 () Unit!44035)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!348 ((_ BitVec 64) (_ BitVec 64) V!54693 ListLongMap!21701) Unit!44035)

(assert (=> b!1341562 (= lt!594164 (lemmaInListMapAfterAddingDiffThenInBefore!348 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594165))))

(declare-fun minValue!1245 () V!54693)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4779 (ListLongMap!21701 tuple2!24044) ListLongMap!21701)

(declare-fun getCurrentListMapNoExtraKeys!6421 (array!91238 array!91240 (_ BitVec 32) (_ BitVec 32) V!54693 V!54693 (_ BitVec 32) Int) ListLongMap!21701)

(declare-fun get!22248 (ValueCell!17698 V!54693) V!54693)

(declare-fun dynLambda!3718 (Int (_ BitVec 64)) V!54693)

(assert (=> b!1341562 (= lt!594165 (+!4779 (getCurrentListMapNoExtraKeys!6421 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24045 (select (arr!44075 _keys!1571) from!1960) (get!22248 (select (arr!44076 _values!1303) from!1960) (dynLambda!3718 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341571 () Bool)

(declare-fun res!890006 () Bool)

(assert (=> b!1341571 (=> (not res!890006) (not e!763925))))

(declare-fun getCurrentListMap!5830 (array!91238 array!91240 (_ BitVec 32) (_ BitVec 32) V!54693 V!54693 (_ BitVec 32) Int) ListLongMap!21701)

(assert (=> b!1341571 (= res!890006 (contains!9042 (getCurrentListMap!5830 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1341572 () Bool)

(assert (=> b!1341572 (= e!763928 (and e!763926 mapRes!57496))))

(declare-fun condMapEmpty!57496 () Bool)

(declare-fun mapDefault!57496 () ValueCell!17698)

