; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40544 () Bool)

(assert start!40544)

(declare-fun b_free!10571 () Bool)

(declare-fun b_next!10571 () Bool)

(assert (=> start!40544 (= b_free!10571 (not b_next!10571))))

(declare-fun tp!37529 () Bool)

(declare-fun b_and!18571 () Bool)

(assert (=> start!40544 (= tp!37529 b_and!18571)))

(declare-fun b!446917 () Bool)

(declare-fun res!265357 () Bool)

(declare-fun e!262493 () Bool)

(assert (=> b!446917 (=> (not res!265357) (not e!262493))))

(declare-datatypes ((array!27623 0))(
  ( (array!27624 (arr!13258 (Array (_ BitVec 32) (_ BitVec 64))) (size!13610 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27623)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446917 (= res!265357 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!446918 () Bool)

(declare-fun res!265360 () Bool)

(declare-fun e!262492 () Bool)

(assert (=> b!446918 (=> (not res!265360) (not e!262492))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!446918 (= res!265360 (and (bvsgt from!863 i!563) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13610 _keys!709))))))

(declare-fun b!446919 () Bool)

(assert (=> b!446919 (= e!262493 e!262492)))

(declare-fun res!265359 () Bool)

(assert (=> b!446919 (=> (not res!265359) (not e!262492))))

(declare-fun lt!203861 () array!27623)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27623 (_ BitVec 32)) Bool)

(assert (=> b!446919 (= res!265359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203861 mask!1025))))

(assert (=> b!446919 (= lt!203861 (array!27624 (store (arr!13258 _keys!709) i!563 k!794) (size!13610 _keys!709)))))

(declare-datatypes ((V!16983 0))(
  ( (V!16984 (val!5999 Int)) )
))
(declare-fun minValue!515 () V!16983)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5611 0))(
  ( (ValueCellFull!5611 (v!8254 V!16983)) (EmptyCell!5611) )
))
(declare-datatypes ((array!27625 0))(
  ( (array!27626 (arr!13259 (Array (_ BitVec 32) ValueCell!5611)) (size!13611 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27625)

(declare-fun zeroValue!515 () V!16983)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun b!446920 () Bool)

(declare-fun v!412 () V!16983)

(declare-datatypes ((tuple2!7868 0))(
  ( (tuple2!7869 (_1!3945 (_ BitVec 64)) (_2!3945 V!16983)) )
))
(declare-datatypes ((List!7930 0))(
  ( (Nil!7927) (Cons!7926 (h!8782 tuple2!7868) (t!13690 List!7930)) )
))
(declare-datatypes ((ListLongMap!6781 0))(
  ( (ListLongMap!6782 (toList!3406 List!7930)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1592 (array!27623 array!27625 (_ BitVec 32) (_ BitVec 32) V!16983 V!16983 (_ BitVec 32) Int) ListLongMap!6781)

(assert (=> b!446920 (= e!262492 (not (= (getCurrentListMapNoExtraKeys!1592 lt!203861 (array!27626 (store (arr!13259 _values!549) i!563 (ValueCellFull!5611 v!412)) (size!13611 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) (getCurrentListMapNoExtraKeys!1592 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))))

(declare-fun b!446921 () Bool)

(declare-fun res!265364 () Bool)

(assert (=> b!446921 (=> (not res!265364) (not e!262493))))

(assert (=> b!446921 (= res!265364 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13610 _keys!709))))))

(declare-fun b!446922 () Bool)

(declare-fun res!265355 () Bool)

(assert (=> b!446922 (=> (not res!265355) (not e!262493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446922 (= res!265355 (validKeyInArray!0 k!794))))

(declare-fun b!446923 () Bool)

(declare-fun e!262489 () Bool)

(declare-fun tp_is_empty!11909 () Bool)

(assert (=> b!446923 (= e!262489 tp_is_empty!11909)))

(declare-fun b!446924 () Bool)

(declare-fun res!265358 () Bool)

(assert (=> b!446924 (=> (not res!265358) (not e!262493))))

(assert (=> b!446924 (= res!265358 (or (= (select (arr!13258 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13258 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446925 () Bool)

(declare-fun e!262494 () Bool)

(assert (=> b!446925 (= e!262494 tp_is_empty!11909)))

(declare-fun b!446926 () Bool)

(declare-fun res!265362 () Bool)

(assert (=> b!446926 (=> (not res!265362) (not e!262493))))

(assert (=> b!446926 (= res!265362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!265361 () Bool)

(assert (=> start!40544 (=> (not res!265361) (not e!262493))))

(assert (=> start!40544 (= res!265361 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13610 _keys!709))))))

(assert (=> start!40544 e!262493))

(assert (=> start!40544 tp_is_empty!11909))

(assert (=> start!40544 tp!37529))

(assert (=> start!40544 true))

(declare-fun e!262490 () Bool)

(declare-fun array_inv!9614 (array!27625) Bool)

(assert (=> start!40544 (and (array_inv!9614 _values!549) e!262490)))

(declare-fun array_inv!9615 (array!27623) Bool)

(assert (=> start!40544 (array_inv!9615 _keys!709)))

(declare-fun b!446927 () Bool)

(declare-fun res!265356 () Bool)

(assert (=> b!446927 (=> (not res!265356) (not e!262493))))

(assert (=> b!446927 (= res!265356 (and (= (size!13611 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13610 _keys!709) (size!13611 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19494 () Bool)

(declare-fun mapRes!19494 () Bool)

(declare-fun tp!37530 () Bool)

(assert (=> mapNonEmpty!19494 (= mapRes!19494 (and tp!37530 e!262489))))

(declare-fun mapValue!19494 () ValueCell!5611)

(declare-fun mapKey!19494 () (_ BitVec 32))

(declare-fun mapRest!19494 () (Array (_ BitVec 32) ValueCell!5611))

(assert (=> mapNonEmpty!19494 (= (arr!13259 _values!549) (store mapRest!19494 mapKey!19494 mapValue!19494))))

(declare-fun b!446928 () Bool)

(declare-fun res!265365 () Bool)

(assert (=> b!446928 (=> (not res!265365) (not e!262492))))

(declare-datatypes ((List!7931 0))(
  ( (Nil!7928) (Cons!7927 (h!8783 (_ BitVec 64)) (t!13691 List!7931)) )
))
(declare-fun arrayNoDuplicates!0 (array!27623 (_ BitVec 32) List!7931) Bool)

(assert (=> b!446928 (= res!265365 (arrayNoDuplicates!0 lt!203861 #b00000000000000000000000000000000 Nil!7928))))

(declare-fun b!446929 () Bool)

(declare-fun res!265363 () Bool)

(assert (=> b!446929 (=> (not res!265363) (not e!262493))))

(assert (=> b!446929 (= res!265363 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7928))))

(declare-fun b!446930 () Bool)

(declare-fun res!265354 () Bool)

(assert (=> b!446930 (=> (not res!265354) (not e!262493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446930 (= res!265354 (validMask!0 mask!1025))))

(declare-fun b!446931 () Bool)

(assert (=> b!446931 (= e!262490 (and e!262494 mapRes!19494))))

(declare-fun condMapEmpty!19494 () Bool)

(declare-fun mapDefault!19494 () ValueCell!5611)

