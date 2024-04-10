; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40914 () Bool)

(assert start!40914)

(declare-fun b_free!10849 () Bool)

(declare-fun b_next!10849 () Bool)

(assert (=> start!40914 (= b_free!10849 (not b_next!10849))))

(declare-fun tp!38374 () Bool)

(declare-fun b_and!18991 () Bool)

(assert (=> start!40914 (= tp!38374 b_and!18991)))

(declare-fun b!454727 () Bool)

(declare-fun e!265998 () Bool)

(assert (=> b!454727 (= e!265998 false)))

(declare-datatypes ((V!17355 0))(
  ( (V!17356 (val!6138 Int)) )
))
(declare-fun minValue!515 () V!17355)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5750 0))(
  ( (ValueCellFull!5750 (v!8404 V!17355)) (EmptyCell!5750) )
))
(declare-datatypes ((array!28177 0))(
  ( (array!28178 (arr!13532 (Array (_ BitVec 32) ValueCell!5750)) (size!13884 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28177)

(declare-datatypes ((tuple2!8086 0))(
  ( (tuple2!8087 (_1!4054 (_ BitVec 64)) (_2!4054 V!17355)) )
))
(declare-datatypes ((List!8148 0))(
  ( (Nil!8145) (Cons!8144 (h!9000 tuple2!8086) (t!13976 List!8148)) )
))
(declare-datatypes ((ListLongMap!6999 0))(
  ( (ListLongMap!7000 (toList!3515 List!8148)) )
))
(declare-fun lt!206193 () ListLongMap!6999)

(declare-fun zeroValue!515 () V!17355)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17355)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!28179 0))(
  ( (array!28180 (arr!13533 (Array (_ BitVec 32) (_ BitVec 64))) (size!13885 (_ BitVec 32))) )
))
(declare-fun lt!206195 () array!28179)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1698 (array!28179 array!28177 (_ BitVec 32) (_ BitVec 32) V!17355 V!17355 (_ BitVec 32) Int) ListLongMap!6999)

(assert (=> b!454727 (= lt!206193 (getCurrentListMapNoExtraKeys!1698 lt!206195 (array!28178 (store (arr!13532 _values!549) i!563 (ValueCellFull!5750 v!412)) (size!13884 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206194 () ListLongMap!6999)

(declare-fun _keys!709 () array!28179)

(assert (=> b!454727 (= lt!206194 (getCurrentListMapNoExtraKeys!1698 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454728 () Bool)

(declare-fun res!270997 () Bool)

(declare-fun e!265994 () Bool)

(assert (=> b!454728 (=> (not res!270997) (not e!265994))))

(assert (=> b!454728 (= res!270997 (and (= (size!13884 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13885 _keys!709) (size!13884 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454729 () Bool)

(declare-fun res!270998 () Bool)

(assert (=> b!454729 (=> (not res!270998) (not e!265994))))

(assert (=> b!454729 (= res!270998 (or (= (select (arr!13533 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13533 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454730 () Bool)

(declare-fun res!271000 () Bool)

(assert (=> b!454730 (=> (not res!271000) (not e!265994))))

(assert (=> b!454730 (= res!271000 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13885 _keys!709))))))

(declare-fun mapNonEmpty!19921 () Bool)

(declare-fun mapRes!19921 () Bool)

(declare-fun tp!38373 () Bool)

(declare-fun e!265999 () Bool)

(assert (=> mapNonEmpty!19921 (= mapRes!19921 (and tp!38373 e!265999))))

(declare-fun mapKey!19921 () (_ BitVec 32))

(declare-fun mapValue!19921 () ValueCell!5750)

(declare-fun mapRest!19921 () (Array (_ BitVec 32) ValueCell!5750))

(assert (=> mapNonEmpty!19921 (= (arr!13532 _values!549) (store mapRest!19921 mapKey!19921 mapValue!19921))))

(declare-fun b!454732 () Bool)

(declare-fun res!271006 () Bool)

(assert (=> b!454732 (=> (not res!271006) (not e!265998))))

(declare-datatypes ((List!8149 0))(
  ( (Nil!8146) (Cons!8145 (h!9001 (_ BitVec 64)) (t!13977 List!8149)) )
))
(declare-fun arrayNoDuplicates!0 (array!28179 (_ BitVec 32) List!8149) Bool)

(assert (=> b!454732 (= res!271006 (arrayNoDuplicates!0 lt!206195 #b00000000000000000000000000000000 Nil!8146))))

(declare-fun b!454733 () Bool)

(declare-fun res!270996 () Bool)

(assert (=> b!454733 (=> (not res!270996) (not e!265998))))

(assert (=> b!454733 (= res!270996 (bvsle from!863 i!563))))

(declare-fun b!454734 () Bool)

(declare-fun res!271002 () Bool)

(assert (=> b!454734 (=> (not res!271002) (not e!265994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28179 (_ BitVec 32)) Bool)

(assert (=> b!454734 (= res!271002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454735 () Bool)

(declare-fun res!271001 () Bool)

(assert (=> b!454735 (=> (not res!271001) (not e!265994))))

(assert (=> b!454735 (= res!271001 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8146))))

(declare-fun b!454736 () Bool)

(declare-fun res!270999 () Bool)

(assert (=> b!454736 (=> (not res!270999) (not e!265994))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454736 (= res!270999 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!454737 () Bool)

(declare-fun e!265997 () Bool)

(declare-fun tp_is_empty!12187 () Bool)

(assert (=> b!454737 (= e!265997 tp_is_empty!12187)))

(declare-fun b!454738 () Bool)

(declare-fun res!271007 () Bool)

(assert (=> b!454738 (=> (not res!271007) (not e!265994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454738 (= res!271007 (validKeyInArray!0 k!794))))

(declare-fun res!271005 () Bool)

(assert (=> start!40914 (=> (not res!271005) (not e!265994))))

(assert (=> start!40914 (= res!271005 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13885 _keys!709))))))

(assert (=> start!40914 e!265994))

(assert (=> start!40914 tp_is_empty!12187))

(assert (=> start!40914 tp!38374))

(assert (=> start!40914 true))

(declare-fun e!265995 () Bool)

(declare-fun array_inv!9802 (array!28177) Bool)

(assert (=> start!40914 (and (array_inv!9802 _values!549) e!265995)))

(declare-fun array_inv!9803 (array!28179) Bool)

(assert (=> start!40914 (array_inv!9803 _keys!709)))

(declare-fun b!454731 () Bool)

(assert (=> b!454731 (= e!265999 tp_is_empty!12187)))

(declare-fun b!454739 () Bool)

(assert (=> b!454739 (= e!265995 (and e!265997 mapRes!19921))))

(declare-fun condMapEmpty!19921 () Bool)

(declare-fun mapDefault!19921 () ValueCell!5750)

