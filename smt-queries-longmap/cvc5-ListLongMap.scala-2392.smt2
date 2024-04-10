; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37858 () Bool)

(assert start!37858)

(declare-fun b_free!8917 () Bool)

(declare-fun b_next!8917 () Bool)

(assert (=> start!37858 (= b_free!8917 (not b_next!8917))))

(declare-fun tp!31509 () Bool)

(declare-fun b_and!16183 () Bool)

(assert (=> start!37858 (= tp!31509 b_and!16183)))

(declare-fun b!389018 () Bool)

(declare-fun res!222474 () Bool)

(declare-fun e!235710 () Bool)

(assert (=> b!389018 (=> (not res!222474) (not e!235710))))

(declare-datatypes ((array!23073 0))(
  ( (array!23074 (arr!11003 (Array (_ BitVec 32) (_ BitVec 64))) (size!11355 (_ BitVec 32))) )
))
(declare-fun lt!182793 () array!23073)

(declare-datatypes ((List!6361 0))(
  ( (Nil!6358) (Cons!6357 (h!7213 (_ BitVec 64)) (t!11515 List!6361)) )
))
(declare-fun arrayNoDuplicates!0 (array!23073 (_ BitVec 32) List!6361) Bool)

(assert (=> b!389018 (= res!222474 (arrayNoDuplicates!0 lt!182793 #b00000000000000000000000000000000 Nil!6358))))

(declare-fun mapNonEmpty!15954 () Bool)

(declare-fun mapRes!15954 () Bool)

(declare-fun tp!31508 () Bool)

(declare-fun e!235707 () Bool)

(assert (=> mapNonEmpty!15954 (= mapRes!15954 (and tp!31508 e!235707))))

(declare-datatypes ((V!13891 0))(
  ( (V!13892 (val!4839 Int)) )
))
(declare-datatypes ((ValueCell!4451 0))(
  ( (ValueCellFull!4451 (v!7044 V!13891)) (EmptyCell!4451) )
))
(declare-datatypes ((array!23075 0))(
  ( (array!23076 (arr!11004 (Array (_ BitVec 32) ValueCell!4451)) (size!11356 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23075)

(declare-fun mapKey!15954 () (_ BitVec 32))

(declare-fun mapRest!15954 () (Array (_ BitVec 32) ValueCell!4451))

(declare-fun mapValue!15954 () ValueCell!4451)

(assert (=> mapNonEmpty!15954 (= (arr!11004 _values!506) (store mapRest!15954 mapKey!15954 mapValue!15954))))

(declare-fun b!389019 () Bool)

(declare-fun e!235708 () Bool)

(assert (=> b!389019 (= e!235708 e!235710)))

(declare-fun res!222469 () Bool)

(assert (=> b!389019 (=> (not res!222469) (not e!235710))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23073 (_ BitVec 32)) Bool)

(assert (=> b!389019 (= res!222469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182793 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23073)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!389019 (= lt!182793 (array!23074 (store (arr!11003 _keys!658) i!548 k!778) (size!11355 _keys!658)))))

(declare-fun b!389020 () Bool)

(declare-fun res!222465 () Bool)

(assert (=> b!389020 (=> (not res!222465) (not e!235708))))

(assert (=> b!389020 (= res!222465 (or (= (select (arr!11003 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11003 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389021 () Bool)

(declare-fun tp_is_empty!9589 () Bool)

(assert (=> b!389021 (= e!235707 tp_is_empty!9589)))

(declare-datatypes ((tuple2!6508 0))(
  ( (tuple2!6509 (_1!3265 (_ BitVec 64)) (_2!3265 V!13891)) )
))
(declare-datatypes ((List!6362 0))(
  ( (Nil!6359) (Cons!6358 (h!7214 tuple2!6508) (t!11516 List!6362)) )
))
(declare-datatypes ((ListLongMap!5421 0))(
  ( (ListLongMap!5422 (toList!2726 List!6362)) )
))
(declare-fun lt!182792 () ListLongMap!5421)

(declare-fun b!389022 () Bool)

(declare-fun lt!182796 () tuple2!6508)

(declare-fun lt!182788 () tuple2!6508)

(declare-fun e!235705 () Bool)

(declare-fun lt!182791 () ListLongMap!5421)

(declare-fun +!1021 (ListLongMap!5421 tuple2!6508) ListLongMap!5421)

(assert (=> b!389022 (= e!235705 (= lt!182792 (+!1021 (+!1021 lt!182791 lt!182788) lt!182796)))))

(declare-fun b!389023 () Bool)

(declare-fun e!235712 () Bool)

(assert (=> b!389023 (= e!235710 (not e!235712))))

(declare-fun res!222471 () Bool)

(assert (=> b!389023 (=> res!222471 e!235712)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389023 (= res!222471 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13891)

(declare-fun minValue!472 () V!13891)

(declare-fun getCurrentListMap!2075 (array!23073 array!23075 (_ BitVec 32) (_ BitVec 32) V!13891 V!13891 (_ BitVec 32) Int) ListLongMap!5421)

(assert (=> b!389023 (= lt!182792 (getCurrentListMap!2075 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182797 () ListLongMap!5421)

(declare-fun lt!182790 () array!23075)

(assert (=> b!389023 (= lt!182797 (getCurrentListMap!2075 lt!182793 lt!182790 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182795 () ListLongMap!5421)

(declare-fun lt!182789 () ListLongMap!5421)

(assert (=> b!389023 (and (= lt!182795 lt!182789) (= lt!182789 lt!182795))))

(declare-fun v!373 () V!13891)

(assert (=> b!389023 (= lt!182789 (+!1021 lt!182791 (tuple2!6509 k!778 v!373)))))

(declare-datatypes ((Unit!11920 0))(
  ( (Unit!11921) )
))
(declare-fun lt!182794 () Unit!11920)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!239 (array!23073 array!23075 (_ BitVec 32) (_ BitVec 32) V!13891 V!13891 (_ BitVec 32) (_ BitVec 64) V!13891 (_ BitVec 32) Int) Unit!11920)

(assert (=> b!389023 (= lt!182794 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!239 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!955 (array!23073 array!23075 (_ BitVec 32) (_ BitVec 32) V!13891 V!13891 (_ BitVec 32) Int) ListLongMap!5421)

(assert (=> b!389023 (= lt!182795 (getCurrentListMapNoExtraKeys!955 lt!182793 lt!182790 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389023 (= lt!182790 (array!23076 (store (arr!11004 _values!506) i!548 (ValueCellFull!4451 v!373)) (size!11356 _values!506)))))

(assert (=> b!389023 (= lt!182791 (getCurrentListMapNoExtraKeys!955 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!222473 () Bool)

(assert (=> start!37858 (=> (not res!222473) (not e!235708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37858 (= res!222473 (validMask!0 mask!970))))

(assert (=> start!37858 e!235708))

(declare-fun e!235711 () Bool)

(declare-fun array_inv!8090 (array!23075) Bool)

(assert (=> start!37858 (and (array_inv!8090 _values!506) e!235711)))

(assert (=> start!37858 tp!31509))

(assert (=> start!37858 true))

(assert (=> start!37858 tp_is_empty!9589))

(declare-fun array_inv!8091 (array!23073) Bool)

(assert (=> start!37858 (array_inv!8091 _keys!658)))

(declare-fun b!389024 () Bool)

(declare-fun res!222476 () Bool)

(assert (=> b!389024 (=> (not res!222476) (not e!235708))))

(declare-fun arrayContainsKey!0 (array!23073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389024 (= res!222476 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!389025 () Bool)

(declare-fun res!222468 () Bool)

(assert (=> b!389025 (=> (not res!222468) (not e!235708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389025 (= res!222468 (validKeyInArray!0 k!778))))

(declare-fun b!389026 () Bool)

(declare-fun e!235706 () Bool)

(assert (=> b!389026 (= e!235711 (and e!235706 mapRes!15954))))

(declare-fun condMapEmpty!15954 () Bool)

(declare-fun mapDefault!15954 () ValueCell!4451)

