; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40906 () Bool)

(assert start!40906)

(declare-fun b_free!10841 () Bool)

(declare-fun b_next!10841 () Bool)

(assert (=> start!40906 (= b_free!10841 (not b_next!10841))))

(declare-fun tp!38349 () Bool)

(declare-fun b_and!18983 () Bool)

(assert (=> start!40906 (= tp!38349 b_and!18983)))

(declare-fun b!454547 () Bool)

(declare-fun e!265922 () Bool)

(declare-fun tp_is_empty!12179 () Bool)

(assert (=> b!454547 (= e!265922 tp_is_empty!12179)))

(declare-fun mapNonEmpty!19909 () Bool)

(declare-fun mapRes!19909 () Bool)

(declare-fun tp!38350 () Bool)

(declare-fun e!265927 () Bool)

(assert (=> mapNonEmpty!19909 (= mapRes!19909 (and tp!38350 e!265927))))

(declare-datatypes ((V!17343 0))(
  ( (V!17344 (val!6134 Int)) )
))
(declare-datatypes ((ValueCell!5746 0))(
  ( (ValueCellFull!5746 (v!8400 V!17343)) (EmptyCell!5746) )
))
(declare-fun mapValue!19909 () ValueCell!5746)

(declare-fun mapRest!19909 () (Array (_ BitVec 32) ValueCell!5746))

(declare-datatypes ((array!28163 0))(
  ( (array!28164 (arr!13525 (Array (_ BitVec 32) ValueCell!5746)) (size!13877 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28163)

(declare-fun mapKey!19909 () (_ BitVec 32))

(assert (=> mapNonEmpty!19909 (= (arr!13525 _values!549) (store mapRest!19909 mapKey!19909 mapValue!19909))))

(declare-fun b!454548 () Bool)

(declare-fun res!270858 () Bool)

(declare-fun e!265926 () Bool)

(assert (=> b!454548 (=> (not res!270858) (not e!265926))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454548 (= res!270858 (bvsle from!863 i!563))))

(declare-fun b!454549 () Bool)

(declare-fun res!270855 () Bool)

(assert (=> b!454549 (=> (not res!270855) (not e!265926))))

(declare-datatypes ((array!28165 0))(
  ( (array!28166 (arr!13526 (Array (_ BitVec 32) (_ BitVec 64))) (size!13878 (_ BitVec 32))) )
))
(declare-fun lt!206158 () array!28165)

(declare-datatypes ((List!8142 0))(
  ( (Nil!8139) (Cons!8138 (h!8994 (_ BitVec 64)) (t!13970 List!8142)) )
))
(declare-fun arrayNoDuplicates!0 (array!28165 (_ BitVec 32) List!8142) Bool)

(assert (=> b!454549 (= res!270855 (arrayNoDuplicates!0 lt!206158 #b00000000000000000000000000000000 Nil!8139))))

(declare-fun b!454550 () Bool)

(assert (=> b!454550 (= e!265927 tp_is_empty!12179)))

(declare-fun b!454551 () Bool)

(declare-fun res!270853 () Bool)

(declare-fun e!265923 () Bool)

(assert (=> b!454551 (=> (not res!270853) (not e!265923))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454551 (= res!270853 (validKeyInArray!0 k!794))))

(declare-fun b!454552 () Bool)

(declare-fun res!270859 () Bool)

(assert (=> b!454552 (=> (not res!270859) (not e!265923))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454552 (= res!270859 (validMask!0 mask!1025))))

(declare-fun b!454553 () Bool)

(declare-fun res!270856 () Bool)

(assert (=> b!454553 (=> (not res!270856) (not e!265923))))

(declare-fun _keys!709 () array!28165)

(declare-fun arrayContainsKey!0 (array!28165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454553 (= res!270856 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!454554 () Bool)

(assert (=> b!454554 (= e!265926 false)))

(declare-fun minValue!515 () V!17343)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17343)

(declare-fun v!412 () V!17343)

(declare-datatypes ((tuple2!8080 0))(
  ( (tuple2!8081 (_1!4051 (_ BitVec 64)) (_2!4051 V!17343)) )
))
(declare-datatypes ((List!8143 0))(
  ( (Nil!8140) (Cons!8139 (h!8995 tuple2!8080) (t!13971 List!8143)) )
))
(declare-datatypes ((ListLongMap!6993 0))(
  ( (ListLongMap!6994 (toList!3512 List!8143)) )
))
(declare-fun lt!206157 () ListLongMap!6993)

(declare-fun getCurrentListMapNoExtraKeys!1695 (array!28165 array!28163 (_ BitVec 32) (_ BitVec 32) V!17343 V!17343 (_ BitVec 32) Int) ListLongMap!6993)

(assert (=> b!454554 (= lt!206157 (getCurrentListMapNoExtraKeys!1695 lt!206158 (array!28164 (store (arr!13525 _values!549) i!563 (ValueCellFull!5746 v!412)) (size!13877 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206159 () ListLongMap!6993)

(assert (=> b!454554 (= lt!206159 (getCurrentListMapNoExtraKeys!1695 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454555 () Bool)

(declare-fun res!270857 () Bool)

(assert (=> b!454555 (=> (not res!270857) (not e!265923))))

(assert (=> b!454555 (= res!270857 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8139))))

(declare-fun b!454556 () Bool)

(declare-fun e!265925 () Bool)

(assert (=> b!454556 (= e!265925 (and e!265922 mapRes!19909))))

(declare-fun condMapEmpty!19909 () Bool)

(declare-fun mapDefault!19909 () ValueCell!5746)

