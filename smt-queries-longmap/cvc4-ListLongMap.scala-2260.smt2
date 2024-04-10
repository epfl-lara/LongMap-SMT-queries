; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37026 () Bool)

(assert start!37026)

(declare-fun b_free!8153 () Bool)

(declare-fun b_next!8153 () Bool)

(assert (=> start!37026 (= b_free!8153 (not b_next!8153))))

(declare-fun tp!29174 () Bool)

(declare-fun b_and!15395 () Bool)

(assert (=> start!37026 (= tp!29174 b_and!15395)))

(declare-fun b!372023 () Bool)

(declare-fun e!226990 () Bool)

(declare-fun e!226986 () Bool)

(assert (=> b!372023 (= e!226990 e!226986)))

(declare-fun res!209247 () Bool)

(assert (=> b!372023 (=> (not res!209247) (not e!226986))))

(declare-datatypes ((array!21543 0))(
  ( (array!21544 (arr!10240 (Array (_ BitVec 32) (_ BitVec 64))) (size!10592 (_ BitVec 32))) )
))
(declare-fun lt!170532 () array!21543)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21543 (_ BitVec 32)) Bool)

(assert (=> b!372023 (= res!209247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170532 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21543)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372023 (= lt!170532 (array!21544 (store (arr!10240 _keys!658) i!548 k!778) (size!10592 _keys!658)))))

(declare-fun b!372024 () Bool)

(declare-fun res!209243 () Bool)

(assert (=> b!372024 (=> (not res!209243) (not e!226990))))

(assert (=> b!372024 (= res!209243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372025 () Bool)

(declare-fun res!209248 () Bool)

(assert (=> b!372025 (=> (not res!209248) (not e!226990))))

(assert (=> b!372025 (= res!209248 (or (= (select (arr!10240 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10240 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372026 () Bool)

(declare-fun res!209246 () Bool)

(assert (=> b!372026 (=> (not res!209246) (not e!226990))))

(declare-datatypes ((List!5740 0))(
  ( (Nil!5737) (Cons!5736 (h!6592 (_ BitVec 64)) (t!10890 List!5740)) )
))
(declare-fun arrayNoDuplicates!0 (array!21543 (_ BitVec 32) List!5740) Bool)

(assert (=> b!372026 (= res!209246 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5737))))

(declare-fun b!372027 () Bool)

(declare-fun res!209245 () Bool)

(assert (=> b!372027 (=> (not res!209245) (not e!226990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372027 (= res!209245 (validKeyInArray!0 k!778))))

(declare-fun b!372028 () Bool)

(declare-fun e!226988 () Bool)

(declare-fun tp_is_empty!8801 () Bool)

(assert (=> b!372028 (= e!226988 tp_is_empty!8801)))

(declare-fun b!372030 () Bool)

(assert (=> b!372030 (= e!226986 (not true))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12839 0))(
  ( (V!12840 (val!4445 Int)) )
))
(declare-datatypes ((ValueCell!4057 0))(
  ( (ValueCellFull!4057 (v!6642 V!12839)) (EmptyCell!4057) )
))
(declare-datatypes ((array!21545 0))(
  ( (array!21546 (arr!10241 (Array (_ BitVec 32) ValueCell!4057)) (size!10593 (_ BitVec 32))) )
))
(declare-fun lt!170527 () array!21545)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5898 0))(
  ( (tuple2!5899 (_1!2960 (_ BitVec 64)) (_2!2960 V!12839)) )
))
(declare-datatypes ((List!5741 0))(
  ( (Nil!5738) (Cons!5737 (h!6593 tuple2!5898) (t!10891 List!5741)) )
))
(declare-datatypes ((ListLongMap!4811 0))(
  ( (ListLongMap!4812 (toList!2421 List!5741)) )
))
(declare-fun lt!170528 () ListLongMap!4811)

(declare-fun zeroValue!472 () V!12839)

(declare-fun minValue!472 () V!12839)

(declare-fun getCurrentListMap!1864 (array!21543 array!21545 (_ BitVec 32) (_ BitVec 32) V!12839 V!12839 (_ BitVec 32) Int) ListLongMap!4811)

(assert (=> b!372030 (= lt!170528 (getCurrentListMap!1864 lt!170532 lt!170527 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170529 () ListLongMap!4811)

(declare-fun lt!170531 () ListLongMap!4811)

(assert (=> b!372030 (and (= lt!170529 lt!170531) (= lt!170531 lt!170529))))

(declare-fun v!373 () V!12839)

(declare-fun lt!170530 () ListLongMap!4811)

(declare-fun +!767 (ListLongMap!4811 tuple2!5898) ListLongMap!4811)

(assert (=> b!372030 (= lt!170531 (+!767 lt!170530 (tuple2!5899 k!778 v!373)))))

(declare-fun _values!506 () array!21545)

(declare-datatypes ((Unit!11440 0))(
  ( (Unit!11441) )
))
(declare-fun lt!170526 () Unit!11440)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!22 (array!21543 array!21545 (_ BitVec 32) (_ BitVec 32) V!12839 V!12839 (_ BitVec 32) (_ BitVec 64) V!12839 (_ BitVec 32) Int) Unit!11440)

(assert (=> b!372030 (= lt!170526 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!22 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!698 (array!21543 array!21545 (_ BitVec 32) (_ BitVec 32) V!12839 V!12839 (_ BitVec 32) Int) ListLongMap!4811)

(assert (=> b!372030 (= lt!170529 (getCurrentListMapNoExtraKeys!698 lt!170532 lt!170527 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372030 (= lt!170527 (array!21546 (store (arr!10241 _values!506) i!548 (ValueCellFull!4057 v!373)) (size!10593 _values!506)))))

(assert (=> b!372030 (= lt!170530 (getCurrentListMapNoExtraKeys!698 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14766 () Bool)

(declare-fun mapRes!14766 () Bool)

(assert (=> mapIsEmpty!14766 mapRes!14766))

(declare-fun b!372031 () Bool)

(declare-fun res!209242 () Bool)

(assert (=> b!372031 (=> (not res!209242) (not e!226990))))

(assert (=> b!372031 (= res!209242 (and (= (size!10593 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10592 _keys!658) (size!10593 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14766 () Bool)

(declare-fun tp!29175 () Bool)

(declare-fun e!226987 () Bool)

(assert (=> mapNonEmpty!14766 (= mapRes!14766 (and tp!29175 e!226987))))

(declare-fun mapRest!14766 () (Array (_ BitVec 32) ValueCell!4057))

(declare-fun mapKey!14766 () (_ BitVec 32))

(declare-fun mapValue!14766 () ValueCell!4057)

(assert (=> mapNonEmpty!14766 (= (arr!10241 _values!506) (store mapRest!14766 mapKey!14766 mapValue!14766))))

(declare-fun b!372032 () Bool)

(declare-fun e!226989 () Bool)

(assert (=> b!372032 (= e!226989 (and e!226988 mapRes!14766))))

(declare-fun condMapEmpty!14766 () Bool)

(declare-fun mapDefault!14766 () ValueCell!4057)

