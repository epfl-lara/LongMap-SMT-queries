; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40470 () Bool)

(assert start!40470)

(declare-fun b_free!10541 () Bool)

(declare-fun b_next!10541 () Bool)

(assert (=> start!40470 (= b_free!10541 (not b_next!10541))))

(declare-fun tp!37400 () Bool)

(declare-fun b_and!18525 () Bool)

(assert (=> start!40470 (= tp!37400 b_and!18525)))

(declare-fun b!445552 () Bool)

(declare-fun e!261881 () Bool)

(assert (=> b!445552 (= e!261881 (not true))))

(declare-fun e!261875 () Bool)

(assert (=> b!445552 e!261875))

(declare-fun c!55857 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445552 (= c!55857 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!16911 0))(
  ( (V!16912 (val!5972 Int)) )
))
(declare-fun minValue!515 () V!16911)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5584 0))(
  ( (ValueCellFull!5584 (v!8223 V!16911)) (EmptyCell!5584) )
))
(declare-datatypes ((array!27517 0))(
  ( (array!27518 (arr!13206 (Array (_ BitVec 32) ValueCell!5584)) (size!13558 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27517)

(declare-fun zeroValue!515 () V!16911)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13160 0))(
  ( (Unit!13161) )
))
(declare-fun lt!203647 () Unit!13160)

(declare-fun v!412 () V!16911)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27519 0))(
  ( (array!27520 (arr!13207 (Array (_ BitVec 32) (_ BitVec 64))) (size!13559 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27519)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!696 (array!27519 array!27517 (_ BitVec 32) (_ BitVec 32) V!16911 V!16911 (_ BitVec 32) (_ BitVec 64) V!16911 (_ BitVec 32) Int) Unit!13160)

(assert (=> b!445552 (= lt!203647 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!696 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!264393 () Bool)

(declare-fun e!261878 () Bool)

(assert (=> start!40470 (=> (not res!264393) (not e!261878))))

(assert (=> start!40470 (= res!264393 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13559 _keys!709))))))

(assert (=> start!40470 e!261878))

(declare-fun tp_is_empty!11855 () Bool)

(assert (=> start!40470 tp_is_empty!11855))

(assert (=> start!40470 tp!37400))

(assert (=> start!40470 true))

(declare-fun e!261877 () Bool)

(declare-fun array_inv!9576 (array!27517) Bool)

(assert (=> start!40470 (and (array_inv!9576 _values!549) e!261877)))

(declare-fun array_inv!9577 (array!27519) Bool)

(assert (=> start!40470 (array_inv!9577 _keys!709)))

(declare-fun mapNonEmpty!19410 () Bool)

(declare-fun mapRes!19410 () Bool)

(declare-fun tp!37401 () Bool)

(declare-fun e!261879 () Bool)

(assert (=> mapNonEmpty!19410 (= mapRes!19410 (and tp!37401 e!261879))))

(declare-fun mapValue!19410 () ValueCell!5584)

(declare-fun mapKey!19410 () (_ BitVec 32))

(declare-fun mapRest!19410 () (Array (_ BitVec 32) ValueCell!5584))

(assert (=> mapNonEmpty!19410 (= (arr!13206 _values!549) (store mapRest!19410 mapKey!19410 mapValue!19410))))

(declare-fun b!445553 () Bool)

(declare-fun res!264396 () Bool)

(assert (=> b!445553 (=> (not res!264396) (not e!261878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445553 (= res!264396 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19410 () Bool)

(assert (=> mapIsEmpty!19410 mapRes!19410))

(declare-fun b!445554 () Bool)

(assert (=> b!445554 (= e!261878 e!261881)))

(declare-fun res!264387 () Bool)

(assert (=> b!445554 (=> (not res!264387) (not e!261881))))

(declare-fun lt!203648 () array!27519)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27519 (_ BitVec 32)) Bool)

(assert (=> b!445554 (= res!264387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203648 mask!1025))))

(assert (=> b!445554 (= lt!203648 (array!27520 (store (arr!13207 _keys!709) i!563 k!794) (size!13559 _keys!709)))))

(declare-fun b!445555 () Bool)

(declare-fun e!261876 () Bool)

(assert (=> b!445555 (= e!261876 tp_is_empty!11855)))

(declare-fun b!445556 () Bool)

(declare-fun res!264395 () Bool)

(assert (=> b!445556 (=> (not res!264395) (not e!261878))))

(declare-fun arrayContainsKey!0 (array!27519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445556 (= res!264395 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!445557 () Bool)

(declare-fun res!264390 () Bool)

(assert (=> b!445557 (=> (not res!264390) (not e!261878))))

(assert (=> b!445557 (= res!264390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445558 () Bool)

(declare-fun res!264388 () Bool)

(assert (=> b!445558 (=> (not res!264388) (not e!261881))))

(declare-datatypes ((List!7894 0))(
  ( (Nil!7891) (Cons!7890 (h!8746 (_ BitVec 64)) (t!13652 List!7894)) )
))
(declare-fun arrayNoDuplicates!0 (array!27519 (_ BitVec 32) List!7894) Bool)

(assert (=> b!445558 (= res!264388 (arrayNoDuplicates!0 lt!203648 #b00000000000000000000000000000000 Nil!7891))))

(declare-fun b!445559 () Bool)

(declare-datatypes ((tuple2!7844 0))(
  ( (tuple2!7845 (_1!3933 (_ BitVec 64)) (_2!3933 V!16911)) )
))
(declare-datatypes ((List!7895 0))(
  ( (Nil!7892) (Cons!7891 (h!8747 tuple2!7844) (t!13653 List!7895)) )
))
(declare-datatypes ((ListLongMap!6757 0))(
  ( (ListLongMap!6758 (toList!3394 List!7895)) )
))
(declare-fun call!29579 () ListLongMap!6757)

(declare-fun call!29580 () ListLongMap!6757)

(assert (=> b!445559 (= e!261875 (= call!29579 call!29580))))

(declare-fun b!445560 () Bool)

(declare-fun +!1525 (ListLongMap!6757 tuple2!7844) ListLongMap!6757)

(assert (=> b!445560 (= e!261875 (= call!29580 (+!1525 call!29579 (tuple2!7845 k!794 v!412))))))

(declare-fun b!445561 () Bool)

(declare-fun res!264389 () Bool)

(assert (=> b!445561 (=> (not res!264389) (not e!261878))))

(assert (=> b!445561 (= res!264389 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7891))))

(declare-fun b!445562 () Bool)

(declare-fun res!264392 () Bool)

(assert (=> b!445562 (=> (not res!264392) (not e!261881))))

(assert (=> b!445562 (= res!264392 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13559 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445563 () Bool)

(declare-fun res!264386 () Bool)

(assert (=> b!445563 (=> (not res!264386) (not e!261878))))

(assert (=> b!445563 (= res!264386 (or (= (select (arr!13207 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13207 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445564 () Bool)

(declare-fun res!264397 () Bool)

(assert (=> b!445564 (=> (not res!264397) (not e!261878))))

(assert (=> b!445564 (= res!264397 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13559 _keys!709))))))

(declare-fun b!445565 () Bool)

(assert (=> b!445565 (= e!261877 (and e!261876 mapRes!19410))))

(declare-fun condMapEmpty!19410 () Bool)

(declare-fun mapDefault!19410 () ValueCell!5584)

