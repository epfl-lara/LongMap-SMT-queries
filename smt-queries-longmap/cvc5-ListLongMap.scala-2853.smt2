; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41148 () Bool)

(assert start!41148)

(declare-fun b_free!11017 () Bool)

(declare-fun b_next!11017 () Bool)

(assert (=> start!41148 (= b_free!11017 (not b_next!11017))))

(declare-fun tp!38887 () Bool)

(declare-fun b_and!19273 () Bool)

(assert (=> start!41148 (= tp!38887 b_and!19273)))

(declare-fun b!459342 () Bool)

(declare-fun e!268108 () Bool)

(declare-fun e!268110 () Bool)

(assert (=> b!459342 (= e!268108 (not e!268110))))

(declare-fun res!274510 () Bool)

(assert (=> b!459342 (=> res!274510 e!268110)))

(declare-datatypes ((array!28511 0))(
  ( (array!28512 (arr!13696 (Array (_ BitVec 32) (_ BitVec 64))) (size!14048 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28511)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459342 (= res!274510 (not (validKeyInArray!0 (select (arr!13696 _keys!709) from!863))))))

(declare-datatypes ((V!17579 0))(
  ( (V!17580 (val!6222 Int)) )
))
(declare-datatypes ((tuple2!8206 0))(
  ( (tuple2!8207 (_1!4114 (_ BitVec 64)) (_2!4114 V!17579)) )
))
(declare-datatypes ((List!8276 0))(
  ( (Nil!8273) (Cons!8272 (h!9128 tuple2!8206) (t!14172 List!8276)) )
))
(declare-datatypes ((ListLongMap!7119 0))(
  ( (ListLongMap!7120 (toList!3575 List!8276)) )
))
(declare-fun lt!207815 () ListLongMap!7119)

(declare-fun lt!207813 () ListLongMap!7119)

(assert (=> b!459342 (= lt!207815 lt!207813)))

(declare-fun lt!207819 () ListLongMap!7119)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17579)

(declare-fun +!1611 (ListLongMap!7119 tuple2!8206) ListLongMap!7119)

(assert (=> b!459342 (= lt!207813 (+!1611 lt!207819 (tuple2!8207 k!794 v!412)))))

(declare-fun minValue!515 () V!17579)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!207812 () array!28511)

(declare-datatypes ((ValueCell!5834 0))(
  ( (ValueCellFull!5834 (v!8500 V!17579)) (EmptyCell!5834) )
))
(declare-datatypes ((array!28513 0))(
  ( (array!28514 (arr!13697 (Array (_ BitVec 32) ValueCell!5834)) (size!14049 (_ BitVec 32))) )
))
(declare-fun lt!207818 () array!28513)

(declare-fun zeroValue!515 () V!17579)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1755 (array!28511 array!28513 (_ BitVec 32) (_ BitVec 32) V!17579 V!17579 (_ BitVec 32) Int) ListLongMap!7119)

(assert (=> b!459342 (= lt!207815 (getCurrentListMapNoExtraKeys!1755 lt!207812 lt!207818 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28513)

(assert (=> b!459342 (= lt!207819 (getCurrentListMapNoExtraKeys!1755 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13348 0))(
  ( (Unit!13349) )
))
(declare-fun lt!207816 () Unit!13348)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!767 (array!28511 array!28513 (_ BitVec 32) (_ BitVec 32) V!17579 V!17579 (_ BitVec 32) (_ BitVec 64) V!17579 (_ BitVec 32) Int) Unit!13348)

(assert (=> b!459342 (= lt!207816 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!767 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459343 () Bool)

(declare-fun res!274505 () Bool)

(declare-fun e!268112 () Bool)

(assert (=> b!459343 (=> (not res!274505) (not e!268112))))

(declare-datatypes ((List!8277 0))(
  ( (Nil!8274) (Cons!8273 (h!9129 (_ BitVec 64)) (t!14173 List!8277)) )
))
(declare-fun arrayNoDuplicates!0 (array!28511 (_ BitVec 32) List!8277) Bool)

(assert (=> b!459343 (= res!274505 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8274))))

(declare-fun b!459344 () Bool)

(declare-fun res!274503 () Bool)

(declare-fun e!268107 () Bool)

(assert (=> b!459344 (=> (not res!274503) (not e!268107))))

(assert (=> b!459344 (= res!274503 (bvsle from!863 i!563))))

(declare-fun b!459345 () Bool)

(declare-fun res!274500 () Bool)

(assert (=> b!459345 (=> (not res!274500) (not e!268112))))

(declare-fun arrayContainsKey!0 (array!28511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459345 (= res!274500 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20182 () Bool)

(declare-fun mapRes!20182 () Bool)

(assert (=> mapIsEmpty!20182 mapRes!20182))

(declare-fun b!459346 () Bool)

(declare-fun e!268111 () Unit!13348)

(declare-fun Unit!13350 () Unit!13348)

(assert (=> b!459346 (= e!268111 Unit!13350)))

(declare-fun b!459347 () Bool)

(declare-fun res!274497 () Bool)

(assert (=> b!459347 (=> (not res!274497) (not e!268112))))

(assert (=> b!459347 (= res!274497 (validKeyInArray!0 k!794))))

(declare-fun b!459348 () Bool)

(declare-fun e!268109 () Bool)

(declare-fun e!268106 () Bool)

(assert (=> b!459348 (= e!268109 (and e!268106 mapRes!20182))))

(declare-fun condMapEmpty!20182 () Bool)

(declare-fun mapDefault!20182 () ValueCell!5834)

