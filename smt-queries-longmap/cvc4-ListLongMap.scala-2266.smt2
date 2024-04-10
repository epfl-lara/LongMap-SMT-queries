; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37062 () Bool)

(assert start!37062)

(declare-fun b_free!8189 () Bool)

(declare-fun b_next!8189 () Bool)

(assert (=> start!37062 (= b_free!8189 (not b_next!8189))))

(declare-fun tp!29282 () Bool)

(declare-fun b_and!15431 () Bool)

(assert (=> start!37062 (= tp!29282 b_and!15431)))

(declare-fun b!372725 () Bool)

(declare-fun e!227315 () Bool)

(assert (=> b!372725 (= e!227315 (not true))))

(declare-datatypes ((V!12887 0))(
  ( (V!12888 (val!4463 Int)) )
))
(declare-datatypes ((ValueCell!4075 0))(
  ( (ValueCellFull!4075 (v!6660 V!12887)) (EmptyCell!4075) )
))
(declare-datatypes ((array!21615 0))(
  ( (array!21616 (arr!10276 (Array (_ BitVec 32) ValueCell!4075)) (size!10628 (_ BitVec 32))) )
))
(declare-fun lt!170906 () array!21615)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!21617 0))(
  ( (array!21618 (arr!10277 (Array (_ BitVec 32) (_ BitVec 64))) (size!10629 (_ BitVec 32))) )
))
(declare-fun lt!170904 () array!21617)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5916 0))(
  ( (tuple2!5917 (_1!2969 (_ BitVec 64)) (_2!2969 V!12887)) )
))
(declare-datatypes ((List!5762 0))(
  ( (Nil!5759) (Cons!5758 (h!6614 tuple2!5916) (t!10912 List!5762)) )
))
(declare-datatypes ((ListLongMap!4829 0))(
  ( (ListLongMap!4830 (toList!2430 List!5762)) )
))
(declare-fun lt!170910 () ListLongMap!4829)

(declare-fun zeroValue!472 () V!12887)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!12887)

(declare-fun getCurrentListMap!1873 (array!21617 array!21615 (_ BitVec 32) (_ BitVec 32) V!12887 V!12887 (_ BitVec 32) Int) ListLongMap!4829)

(assert (=> b!372725 (= lt!170910 (getCurrentListMap!1873 lt!170904 lt!170906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170905 () ListLongMap!4829)

(declare-fun lt!170909 () ListLongMap!4829)

(assert (=> b!372725 (and (= lt!170905 lt!170909) (= lt!170909 lt!170905))))

(declare-fun v!373 () V!12887)

(declare-fun lt!170907 () ListLongMap!4829)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun +!776 (ListLongMap!4829 tuple2!5916) ListLongMap!4829)

(assert (=> b!372725 (= lt!170909 (+!776 lt!170907 (tuple2!5917 k!778 v!373)))))

(declare-fun _keys!658 () array!21617)

(declare-fun _values!506 () array!21615)

(declare-datatypes ((Unit!11458 0))(
  ( (Unit!11459) )
))
(declare-fun lt!170908 () Unit!11458)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!31 (array!21617 array!21615 (_ BitVec 32) (_ BitVec 32) V!12887 V!12887 (_ BitVec 32) (_ BitVec 64) V!12887 (_ BitVec 32) Int) Unit!11458)

(assert (=> b!372725 (= lt!170908 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!31 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!707 (array!21617 array!21615 (_ BitVec 32) (_ BitVec 32) V!12887 V!12887 (_ BitVec 32) Int) ListLongMap!4829)

(assert (=> b!372725 (= lt!170905 (getCurrentListMapNoExtraKeys!707 lt!170904 lt!170906 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372725 (= lt!170906 (array!21616 (store (arr!10276 _values!506) i!548 (ValueCellFull!4075 v!373)) (size!10628 _values!506)))))

(assert (=> b!372725 (= lt!170907 (getCurrentListMapNoExtraKeys!707 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372726 () Bool)

(declare-fun res!209780 () Bool)

(declare-fun e!227312 () Bool)

(assert (=> b!372726 (=> (not res!209780) (not e!227312))))

(assert (=> b!372726 (= res!209780 (and (= (size!10628 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10629 _keys!658) (size!10628 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372727 () Bool)

(declare-fun res!209789 () Bool)

(assert (=> b!372727 (=> (not res!209789) (not e!227312))))

(assert (=> b!372727 (= res!209789 (or (= (select (arr!10277 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10277 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372728 () Bool)

(declare-fun res!209786 () Bool)

(assert (=> b!372728 (=> (not res!209786) (not e!227312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372728 (= res!209786 (validKeyInArray!0 k!778))))

(declare-fun b!372729 () Bool)

(declare-fun e!227310 () Bool)

(declare-fun e!227314 () Bool)

(declare-fun mapRes!14820 () Bool)

(assert (=> b!372729 (= e!227310 (and e!227314 mapRes!14820))))

(declare-fun condMapEmpty!14820 () Bool)

(declare-fun mapDefault!14820 () ValueCell!4075)

