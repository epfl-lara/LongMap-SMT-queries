; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40478 () Bool)

(assert start!40478)

(declare-fun b_free!10549 () Bool)

(declare-fun b_next!10549 () Bool)

(assert (=> start!40478 (= b_free!10549 (not b_next!10549))))

(declare-fun tp!37425 () Bool)

(declare-fun b_and!18533 () Bool)

(assert (=> start!40478 (= tp!37425 b_and!18533)))

(declare-fun b!445756 () Bool)

(declare-fun res!264533 () Bool)

(declare-fun e!261960 () Bool)

(assert (=> b!445756 (=> (not res!264533) (not e!261960))))

(declare-datatypes ((array!27533 0))(
  ( (array!27534 (arr!13214 (Array (_ BitVec 32) (_ BitVec 64))) (size!13566 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27533)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445756 (= res!264533 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19422 () Bool)

(declare-fun mapRes!19422 () Bool)

(assert (=> mapIsEmpty!19422 mapRes!19422))

(declare-fun b!445757 () Bool)

(declare-fun res!264537 () Bool)

(assert (=> b!445757 (=> (not res!264537) (not e!261960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445757 (= res!264537 (validKeyInArray!0 k!794))))

(declare-fun b!445758 () Bool)

(declare-fun e!261959 () Bool)

(declare-datatypes ((V!16923 0))(
  ( (V!16924 (val!5976 Int)) )
))
(declare-fun v!412 () V!16923)

(declare-datatypes ((tuple2!7850 0))(
  ( (tuple2!7851 (_1!3936 (_ BitVec 64)) (_2!3936 V!16923)) )
))
(declare-datatypes ((List!7901 0))(
  ( (Nil!7898) (Cons!7897 (h!8753 tuple2!7850) (t!13659 List!7901)) )
))
(declare-datatypes ((ListLongMap!6763 0))(
  ( (ListLongMap!6764 (toList!3397 List!7901)) )
))
(declare-fun call!29604 () ListLongMap!6763)

(declare-fun call!29603 () ListLongMap!6763)

(declare-fun +!1528 (ListLongMap!6763 tuple2!7850) ListLongMap!6763)

(assert (=> b!445758 (= e!261959 (= call!29604 (+!1528 call!29603 (tuple2!7851 k!794 v!412))))))

(declare-fun minValue!515 () V!16923)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!55869 () Bool)

(declare-datatypes ((ValueCell!5588 0))(
  ( (ValueCellFull!5588 (v!8227 V!16923)) (EmptyCell!5588) )
))
(declare-datatypes ((array!27535 0))(
  ( (array!27536 (arr!13215 (Array (_ BitVec 32) ValueCell!5588)) (size!13567 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27535)

(declare-fun zeroValue!515 () V!16923)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!203672 () array!27533)

(declare-fun bm!29600 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1584 (array!27533 array!27535 (_ BitVec 32) (_ BitVec 32) V!16923 V!16923 (_ BitVec 32) Int) ListLongMap!6763)

(assert (=> bm!29600 (= call!29604 (getCurrentListMapNoExtraKeys!1584 (ite c!55869 lt!203672 _keys!709) (ite c!55869 (array!27536 (store (arr!13215 _values!549) i!563 (ValueCellFull!5588 v!412)) (size!13567 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445759 () Bool)

(declare-fun res!264531 () Bool)

(assert (=> b!445759 (=> (not res!264531) (not e!261960))))

(assert (=> b!445759 (= res!264531 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13566 _keys!709))))))

(declare-fun b!445760 () Bool)

(assert (=> b!445760 (= e!261959 (= call!29603 call!29604))))

(declare-fun b!445761 () Bool)

(declare-fun res!264541 () Bool)

(assert (=> b!445761 (=> (not res!264541) (not e!261960))))

(assert (=> b!445761 (= res!264541 (or (= (select (arr!13214 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13214 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445762 () Bool)

(declare-fun res!264539 () Bool)

(assert (=> b!445762 (=> (not res!264539) (not e!261960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445762 (= res!264539 (validMask!0 mask!1025))))

(declare-fun b!445763 () Bool)

(declare-fun e!261963 () Bool)

(assert (=> b!445763 (= e!261963 (not true))))

(assert (=> b!445763 e!261959))

(assert (=> b!445763 (= c!55869 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13166 0))(
  ( (Unit!13167) )
))
(declare-fun lt!203671 () Unit!13166)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!699 (array!27533 array!27535 (_ BitVec 32) (_ BitVec 32) V!16923 V!16923 (_ BitVec 32) (_ BitVec 64) V!16923 (_ BitVec 32) Int) Unit!13166)

(assert (=> b!445763 (= lt!203671 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!699 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!264532 () Bool)

(assert (=> start!40478 (=> (not res!264532) (not e!261960))))

(assert (=> start!40478 (= res!264532 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13566 _keys!709))))))

(assert (=> start!40478 e!261960))

(declare-fun tp_is_empty!11863 () Bool)

(assert (=> start!40478 tp_is_empty!11863))

(assert (=> start!40478 tp!37425))

(assert (=> start!40478 true))

(declare-fun e!261962 () Bool)

(declare-fun array_inv!9582 (array!27535) Bool)

(assert (=> start!40478 (and (array_inv!9582 _values!549) e!261962)))

(declare-fun array_inv!9583 (array!27533) Bool)

(assert (=> start!40478 (array_inv!9583 _keys!709)))

(declare-fun mapNonEmpty!19422 () Bool)

(declare-fun tp!37424 () Bool)

(declare-fun e!261961 () Bool)

(assert (=> mapNonEmpty!19422 (= mapRes!19422 (and tp!37424 e!261961))))

(declare-fun mapValue!19422 () ValueCell!5588)

(declare-fun mapRest!19422 () (Array (_ BitVec 32) ValueCell!5588))

(declare-fun mapKey!19422 () (_ BitVec 32))

(assert (=> mapNonEmpty!19422 (= (arr!13215 _values!549) (store mapRest!19422 mapKey!19422 mapValue!19422))))

(declare-fun b!445764 () Bool)

(declare-fun res!264534 () Bool)

(assert (=> b!445764 (=> (not res!264534) (not e!261963))))

(declare-datatypes ((List!7902 0))(
  ( (Nil!7899) (Cons!7898 (h!8754 (_ BitVec 64)) (t!13660 List!7902)) )
))
(declare-fun arrayNoDuplicates!0 (array!27533 (_ BitVec 32) List!7902) Bool)

(assert (=> b!445764 (= res!264534 (arrayNoDuplicates!0 lt!203672 #b00000000000000000000000000000000 Nil!7899))))

(declare-fun b!445765 () Bool)

(declare-fun res!264535 () Bool)

(assert (=> b!445765 (=> (not res!264535) (not e!261960))))

(assert (=> b!445765 (= res!264535 (and (= (size!13567 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13566 _keys!709) (size!13567 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445766 () Bool)

(assert (=> b!445766 (= e!261960 e!261963)))

(declare-fun res!264536 () Bool)

(assert (=> b!445766 (=> (not res!264536) (not e!261963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27533 (_ BitVec 32)) Bool)

(assert (=> b!445766 (= res!264536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203672 mask!1025))))

(assert (=> b!445766 (= lt!203672 (array!27534 (store (arr!13214 _keys!709) i!563 k!794) (size!13566 _keys!709)))))

(declare-fun b!445767 () Bool)

(declare-fun e!261964 () Bool)

(assert (=> b!445767 (= e!261962 (and e!261964 mapRes!19422))))

(declare-fun condMapEmpty!19422 () Bool)

(declare-fun mapDefault!19422 () ValueCell!5588)

