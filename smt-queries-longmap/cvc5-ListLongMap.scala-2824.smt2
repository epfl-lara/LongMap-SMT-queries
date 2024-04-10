; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40908 () Bool)

(assert start!40908)

(declare-fun b_free!10843 () Bool)

(declare-fun b_next!10843 () Bool)

(assert (=> start!40908 (= b_free!10843 (not b_next!10843))))

(declare-fun tp!38356 () Bool)

(declare-fun b_and!18985 () Bool)

(assert (=> start!40908 (= tp!38356 b_and!18985)))

(declare-fun mapIsEmpty!19912 () Bool)

(declare-fun mapRes!19912 () Bool)

(assert (=> mapIsEmpty!19912 mapRes!19912))

(declare-fun b!454592 () Bool)

(declare-fun res!270897 () Bool)

(declare-fun e!265942 () Bool)

(assert (=> b!454592 (=> (not res!270897) (not e!265942))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454592 (= res!270897 (validMask!0 mask!1025))))

(declare-fun b!454594 () Bool)

(declare-fun res!270888 () Bool)

(assert (=> b!454594 (=> (not res!270888) (not e!265942))))

(declare-datatypes ((array!28167 0))(
  ( (array!28168 (arr!13527 (Array (_ BitVec 32) (_ BitVec 64))) (size!13879 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28167)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454594 (= res!270888 (or (= (select (arr!13527 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13527 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454595 () Bool)

(declare-fun e!265945 () Bool)

(assert (=> b!454595 (= e!265942 e!265945)))

(declare-fun res!270896 () Bool)

(assert (=> b!454595 (=> (not res!270896) (not e!265945))))

(declare-fun lt!206166 () array!28167)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28167 (_ BitVec 32)) Bool)

(assert (=> b!454595 (= res!270896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206166 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!454595 (= lt!206166 (array!28168 (store (arr!13527 _keys!709) i!563 k!794) (size!13879 _keys!709)))))

(declare-fun b!454596 () Bool)

(declare-fun res!270889 () Bool)

(assert (=> b!454596 (=> (not res!270889) (not e!265942))))

(declare-fun arrayContainsKey!0 (array!28167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454596 (= res!270889 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!454597 () Bool)

(declare-fun e!265941 () Bool)

(declare-fun tp_is_empty!12181 () Bool)

(assert (=> b!454597 (= e!265941 tp_is_empty!12181)))

(declare-fun b!454598 () Bool)

(declare-fun res!270894 () Bool)

(assert (=> b!454598 (=> (not res!270894) (not e!265942))))

(assert (=> b!454598 (= res!270894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454599 () Bool)

(declare-fun res!270899 () Bool)

(assert (=> b!454599 (=> (not res!270899) (not e!265942))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17347 0))(
  ( (V!17348 (val!6135 Int)) )
))
(declare-datatypes ((ValueCell!5747 0))(
  ( (ValueCellFull!5747 (v!8401 V!17347)) (EmptyCell!5747) )
))
(declare-datatypes ((array!28169 0))(
  ( (array!28170 (arr!13528 (Array (_ BitVec 32) ValueCell!5747)) (size!13880 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28169)

(assert (=> b!454599 (= res!270899 (and (= (size!13880 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13879 _keys!709) (size!13880 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454600 () Bool)

(declare-fun res!270898 () Bool)

(assert (=> b!454600 (=> (not res!270898) (not e!265942))))

(declare-datatypes ((List!8144 0))(
  ( (Nil!8141) (Cons!8140 (h!8996 (_ BitVec 64)) (t!13972 List!8144)) )
))
(declare-fun arrayNoDuplicates!0 (array!28167 (_ BitVec 32) List!8144) Bool)

(assert (=> b!454600 (= res!270898 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8141))))

(declare-fun b!454601 () Bool)

(declare-fun res!270892 () Bool)

(assert (=> b!454601 (=> (not res!270892) (not e!265945))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!454601 (= res!270892 (bvsle from!863 i!563))))

(declare-fun b!454593 () Bool)

(declare-fun res!270895 () Bool)

(assert (=> b!454593 (=> (not res!270895) (not e!265942))))

(assert (=> b!454593 (= res!270895 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13879 _keys!709))))))

(declare-fun res!270893 () Bool)

(assert (=> start!40908 (=> (not res!270893) (not e!265942))))

(assert (=> start!40908 (= res!270893 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13879 _keys!709))))))

(assert (=> start!40908 e!265942))

(assert (=> start!40908 tp_is_empty!12181))

(assert (=> start!40908 tp!38356))

(assert (=> start!40908 true))

(declare-fun e!265940 () Bool)

(declare-fun array_inv!9798 (array!28169) Bool)

(assert (=> start!40908 (and (array_inv!9798 _values!549) e!265940)))

(declare-fun array_inv!9799 (array!28167) Bool)

(assert (=> start!40908 (array_inv!9799 _keys!709)))

(declare-fun b!454602 () Bool)

(assert (=> b!454602 (= e!265945 false)))

(declare-fun minValue!515 () V!17347)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17347)

(declare-fun v!412 () V!17347)

(declare-datatypes ((tuple2!8082 0))(
  ( (tuple2!8083 (_1!4052 (_ BitVec 64)) (_2!4052 V!17347)) )
))
(declare-datatypes ((List!8145 0))(
  ( (Nil!8142) (Cons!8141 (h!8997 tuple2!8082) (t!13973 List!8145)) )
))
(declare-datatypes ((ListLongMap!6995 0))(
  ( (ListLongMap!6996 (toList!3513 List!8145)) )
))
(declare-fun lt!206168 () ListLongMap!6995)

(declare-fun getCurrentListMapNoExtraKeys!1696 (array!28167 array!28169 (_ BitVec 32) (_ BitVec 32) V!17347 V!17347 (_ BitVec 32) Int) ListLongMap!6995)

(assert (=> b!454602 (= lt!206168 (getCurrentListMapNoExtraKeys!1696 lt!206166 (array!28170 (store (arr!13528 _values!549) i!563 (ValueCellFull!5747 v!412)) (size!13880 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206167 () ListLongMap!6995)

(assert (=> b!454602 (= lt!206167 (getCurrentListMapNoExtraKeys!1696 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19912 () Bool)

(declare-fun tp!38355 () Bool)

(declare-fun e!265944 () Bool)

(assert (=> mapNonEmpty!19912 (= mapRes!19912 (and tp!38355 e!265944))))

(declare-fun mapValue!19912 () ValueCell!5747)

(declare-fun mapKey!19912 () (_ BitVec 32))

(declare-fun mapRest!19912 () (Array (_ BitVec 32) ValueCell!5747))

(assert (=> mapNonEmpty!19912 (= (arr!13528 _values!549) (store mapRest!19912 mapKey!19912 mapValue!19912))))

(declare-fun b!454603 () Bool)

(assert (=> b!454603 (= e!265940 (and e!265941 mapRes!19912))))

(declare-fun condMapEmpty!19912 () Bool)

(declare-fun mapDefault!19912 () ValueCell!5747)

