; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40584 () Bool)

(assert start!40584)

(declare-fun b_free!10595 () Bool)

(declare-fun b_next!10595 () Bool)

(assert (=> start!40584 (= b_free!10595 (not b_next!10595))))

(declare-fun tp!37604 () Bool)

(declare-fun b_and!18603 () Bool)

(assert (=> start!40584 (= tp!37604 b_and!18603)))

(declare-fun b!447557 () Bool)

(declare-fun e!262774 () Bool)

(assert (=> b!447557 (= e!262774 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17015 0))(
  ( (V!17016 (val!6011 Int)) )
))
(declare-fun zeroValue!515 () V!17015)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17015)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27673 0))(
  ( (array!27674 (arr!13282 (Array (_ BitVec 32) (_ BitVec 64))) (size!13634 (_ BitVec 32))) )
))
(declare-fun lt!203990 () array!27673)

(declare-fun minValue!515 () V!17015)

(declare-datatypes ((tuple2!7884 0))(
  ( (tuple2!7885 (_1!3953 (_ BitVec 64)) (_2!3953 V!17015)) )
))
(declare-datatypes ((List!7948 0))(
  ( (Nil!7945) (Cons!7944 (h!8800 tuple2!7884) (t!13710 List!7948)) )
))
(declare-datatypes ((ListLongMap!6797 0))(
  ( (ListLongMap!6798 (toList!3414 List!7948)) )
))
(declare-fun lt!203991 () ListLongMap!6797)

(declare-datatypes ((ValueCell!5623 0))(
  ( (ValueCellFull!5623 (v!8266 V!17015)) (EmptyCell!5623) )
))
(declare-datatypes ((array!27675 0))(
  ( (array!27676 (arr!13283 (Array (_ BitVec 32) ValueCell!5623)) (size!13635 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27675)

(declare-fun getCurrentListMapNoExtraKeys!1600 (array!27673 array!27675 (_ BitVec 32) (_ BitVec 32) V!17015 V!17015 (_ BitVec 32) Int) ListLongMap!6797)

(assert (=> b!447557 (= lt!203991 (getCurrentListMapNoExtraKeys!1600 lt!203990 (array!27676 (store (arr!13283 _values!549) i!563 (ValueCellFull!5623 v!412)) (size!13635 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!27673)

(declare-fun lt!203989 () ListLongMap!6797)

(assert (=> b!447557 (= lt!203989 (getCurrentListMapNoExtraKeys!1600 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447558 () Bool)

(declare-fun res!265832 () Bool)

(declare-fun e!262773 () Bool)

(assert (=> b!447558 (=> (not res!265832) (not e!262773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27673 (_ BitVec 32)) Bool)

(assert (=> b!447558 (= res!265832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447559 () Bool)

(declare-fun res!265834 () Bool)

(assert (=> b!447559 (=> (not res!265834) (not e!262773))))

(declare-datatypes ((List!7949 0))(
  ( (Nil!7946) (Cons!7945 (h!8801 (_ BitVec 64)) (t!13711 List!7949)) )
))
(declare-fun arrayNoDuplicates!0 (array!27673 (_ BitVec 32) List!7949) Bool)

(assert (=> b!447559 (= res!265834 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7946))))

(declare-fun b!447561 () Bool)

(declare-fun e!262776 () Bool)

(declare-fun e!262777 () Bool)

(declare-fun mapRes!19533 () Bool)

(assert (=> b!447561 (= e!262776 (and e!262777 mapRes!19533))))

(declare-fun condMapEmpty!19533 () Bool)

(declare-fun mapDefault!19533 () ValueCell!5623)

