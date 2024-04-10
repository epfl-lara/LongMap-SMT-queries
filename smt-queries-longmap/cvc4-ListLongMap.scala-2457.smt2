; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38564 () Bool)

(assert start!38564)

(declare-fun b_free!9101 () Bool)

(declare-fun b_next!9101 () Bool)

(assert (=> start!38564 (= b_free!9101 (not b_next!9101))))

(declare-fun tp!32427 () Bool)

(declare-fun b_and!16487 () Bool)

(assert (=> start!38564 (= tp!32427 b_and!16487)))

(declare-fun b!399034 () Bool)

(declare-fun e!241063 () Bool)

(assert (=> b!399034 (= e!241063 (not true))))

(declare-fun e!241064 () Bool)

(assert (=> b!399034 e!241064))

(declare-fun c!54608 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399034 (= c!54608 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12094 0))(
  ( (Unit!12095) )
))
(declare-fun lt!187529 () Unit!12094)

(declare-datatypes ((V!14415 0))(
  ( (V!14416 (val!5036 Int)) )
))
(declare-fun minValue!515 () V!14415)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4648 0))(
  ( (ValueCellFull!4648 (v!7283 V!14415)) (EmptyCell!4648) )
))
(declare-datatypes ((array!23877 0))(
  ( (array!23878 (arr!11388 (Array (_ BitVec 32) ValueCell!4648)) (size!11740 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23877)

(declare-fun zeroValue!515 () V!14415)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!14415)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23879 0))(
  ( (array!23880 (arr!11389 (Array (_ BitVec 32) (_ BitVec 64))) (size!11741 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23879)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!305 (array!23879 array!23877 (_ BitVec 32) (_ BitVec 32) V!14415 V!14415 (_ BitVec 32) (_ BitVec 64) V!14415 (_ BitVec 32) Int) Unit!12094)

(assert (=> b!399034 (= lt!187529 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!305 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399035 () Bool)

(declare-fun e!241068 () Bool)

(declare-fun tp_is_empty!9983 () Bool)

(assert (=> b!399035 (= e!241068 tp_is_empty!9983)))

(declare-fun res!229394 () Bool)

(declare-fun e!241065 () Bool)

(assert (=> start!38564 (=> (not res!229394) (not e!241065))))

(assert (=> start!38564 (= res!229394 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11741 _keys!709))))))

(assert (=> start!38564 e!241065))

(assert (=> start!38564 tp_is_empty!9983))

(assert (=> start!38564 tp!32427))

(assert (=> start!38564 true))

(declare-fun e!241062 () Bool)

(declare-fun array_inv!8346 (array!23877) Bool)

(assert (=> start!38564 (and (array_inv!8346 _values!549) e!241062)))

(declare-fun array_inv!8347 (array!23879) Bool)

(assert (=> start!38564 (array_inv!8347 _keys!709)))

(declare-fun b!399036 () Bool)

(declare-fun res!229396 () Bool)

(assert (=> b!399036 (=> (not res!229396) (not e!241065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23879 (_ BitVec 32)) Bool)

(assert (=> b!399036 (= res!229396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-datatypes ((tuple2!6664 0))(
  ( (tuple2!6665 (_1!3343 (_ BitVec 64)) (_2!3343 V!14415)) )
))
(declare-datatypes ((List!6590 0))(
  ( (Nil!6587) (Cons!6586 (h!7442 tuple2!6664) (t!11764 List!6590)) )
))
(declare-datatypes ((ListLongMap!5577 0))(
  ( (ListLongMap!5578 (toList!2804 List!6590)) )
))
(declare-fun call!27967 () ListLongMap!5577)

(declare-fun b!399037 () Bool)

(declare-fun call!27968 () ListLongMap!5577)

(declare-fun +!1094 (ListLongMap!5577 tuple2!6664) ListLongMap!5577)

(assert (=> b!399037 (= e!241064 (= call!27967 (+!1094 call!27968 (tuple2!6665 k!794 v!412))))))

(declare-fun b!399038 () Bool)

(declare-fun res!229392 () Bool)

(assert (=> b!399038 (=> (not res!229392) (not e!241063))))

(assert (=> b!399038 (= res!229392 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11741 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399039 () Bool)

(declare-fun res!229401 () Bool)

(assert (=> b!399039 (=> (not res!229401) (not e!241065))))

(assert (=> b!399039 (= res!229401 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11741 _keys!709))))))

(declare-fun b!399040 () Bool)

(declare-fun e!241067 () Bool)

(assert (=> b!399040 (= e!241067 tp_is_empty!9983)))

(declare-fun b!399041 () Bool)

(declare-fun res!229393 () Bool)

(assert (=> b!399041 (=> (not res!229393) (not e!241065))))

(declare-datatypes ((List!6591 0))(
  ( (Nil!6588) (Cons!6587 (h!7443 (_ BitVec 64)) (t!11765 List!6591)) )
))
(declare-fun arrayNoDuplicates!0 (array!23879 (_ BitVec 32) List!6591) Bool)

(assert (=> b!399041 (= res!229393 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6588))))

(declare-fun b!399042 () Bool)

(declare-fun res!229397 () Bool)

(assert (=> b!399042 (=> (not res!229397) (not e!241065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399042 (= res!229397 (validMask!0 mask!1025))))

(declare-fun lt!187528 () array!23879)

(declare-fun bm!27964 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1022 (array!23879 array!23877 (_ BitVec 32) (_ BitVec 32) V!14415 V!14415 (_ BitVec 32) Int) ListLongMap!5577)

(assert (=> bm!27964 (= call!27968 (getCurrentListMapNoExtraKeys!1022 (ite c!54608 _keys!709 lt!187528) (ite c!54608 _values!549 (array!23878 (store (arr!11388 _values!549) i!563 (ValueCellFull!4648 v!412)) (size!11740 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399043 () Bool)

(declare-fun res!229400 () Bool)

(assert (=> b!399043 (=> (not res!229400) (not e!241065))))

(assert (=> b!399043 (= res!229400 (or (= (select (arr!11389 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11389 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!27965 () Bool)

(assert (=> bm!27965 (= call!27967 (getCurrentListMapNoExtraKeys!1022 (ite c!54608 lt!187528 _keys!709) (ite c!54608 (array!23878 (store (arr!11388 _values!549) i!563 (ValueCellFull!4648 v!412)) (size!11740 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399044 () Bool)

(declare-fun res!229398 () Bool)

(assert (=> b!399044 (=> (not res!229398) (not e!241065))))

(assert (=> b!399044 (= res!229398 (and (= (size!11740 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11741 _keys!709) (size!11740 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399045 () Bool)

(assert (=> b!399045 (= e!241065 e!241063)))

(declare-fun res!229399 () Bool)

(assert (=> b!399045 (=> (not res!229399) (not e!241063))))

(assert (=> b!399045 (= res!229399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187528 mask!1025))))

(assert (=> b!399045 (= lt!187528 (array!23880 (store (arr!11389 _keys!709) i!563 k!794) (size!11741 _keys!709)))))

(declare-fun b!399046 () Bool)

(declare-fun res!229390 () Bool)

(assert (=> b!399046 (=> (not res!229390) (not e!241063))))

(assert (=> b!399046 (= res!229390 (arrayNoDuplicates!0 lt!187528 #b00000000000000000000000000000000 Nil!6588))))

(declare-fun b!399047 () Bool)

(assert (=> b!399047 (= e!241064 (= call!27968 call!27967))))

(declare-fun mapNonEmpty!16596 () Bool)

(declare-fun mapRes!16596 () Bool)

(declare-fun tp!32426 () Bool)

(assert (=> mapNonEmpty!16596 (= mapRes!16596 (and tp!32426 e!241068))))

(declare-fun mapValue!16596 () ValueCell!4648)

(declare-fun mapRest!16596 () (Array (_ BitVec 32) ValueCell!4648))

(declare-fun mapKey!16596 () (_ BitVec 32))

(assert (=> mapNonEmpty!16596 (= (arr!11388 _values!549) (store mapRest!16596 mapKey!16596 mapValue!16596))))

(declare-fun b!399048 () Bool)

(declare-fun res!229395 () Bool)

(assert (=> b!399048 (=> (not res!229395) (not e!241065))))

(declare-fun arrayContainsKey!0 (array!23879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399048 (= res!229395 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!399049 () Bool)

(assert (=> b!399049 (= e!241062 (and e!241067 mapRes!16596))))

(declare-fun condMapEmpty!16596 () Bool)

(declare-fun mapDefault!16596 () ValueCell!4648)

