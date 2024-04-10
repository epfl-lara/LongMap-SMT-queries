; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40252 () Bool)

(assert start!40252)

(declare-fun b_free!10519 () Bool)

(declare-fun b_next!10519 () Bool)

(assert (=> start!40252 (= b_free!10519 (not b_next!10519))))

(declare-fun tp!37086 () Bool)

(declare-fun b_and!18487 () Bool)

(assert (=> start!40252 (= tp!37086 b_and!18487)))

(declare-fun b!441812 () Bool)

(declare-fun res!261624 () Bool)

(declare-fun e!260096 () Bool)

(assert (=> b!441812 (=> (not res!261624) (not e!260096))))

(declare-datatypes ((array!27153 0))(
  ( (array!27154 (arr!13026 (Array (_ BitVec 32) (_ BitVec 64))) (size!13378 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27153)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441812 (= res!261624 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!441813 () Bool)

(declare-fun e!260095 () Bool)

(assert (=> b!441813 (= e!260095 (not true))))

(declare-datatypes ((V!16667 0))(
  ( (V!16668 (val!5880 Int)) )
))
(declare-fun minValue!515 () V!16667)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!203012 () array!27153)

(declare-datatypes ((ValueCell!5492 0))(
  ( (ValueCellFull!5492 (v!8127 V!16667)) (EmptyCell!5492) )
))
(declare-datatypes ((array!27155 0))(
  ( (array!27156 (arr!13027 (Array (_ BitVec 32) ValueCell!5492)) (size!13379 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27155)

(declare-fun lt!203014 () array!27155)

(declare-fun zeroValue!515 () V!16667)

(declare-fun v!412 () V!16667)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7826 0))(
  ( (tuple2!7827 (_1!3924 (_ BitVec 64)) (_2!3924 V!16667)) )
))
(declare-datatypes ((List!7821 0))(
  ( (Nil!7818) (Cons!7817 (h!8673 tuple2!7826) (t!13577 List!7821)) )
))
(declare-datatypes ((ListLongMap!6739 0))(
  ( (ListLongMap!6740 (toList!3385 List!7821)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1574 (array!27153 array!27155 (_ BitVec 32) (_ BitVec 32) V!16667 V!16667 (_ BitVec 32) Int) ListLongMap!6739)

(declare-fun +!1521 (ListLongMap!6739 tuple2!7826) ListLongMap!6739)

(assert (=> b!441813 (= (getCurrentListMapNoExtraKeys!1574 lt!203012 lt!203014 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1521 (getCurrentListMapNoExtraKeys!1574 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7827 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13146 0))(
  ( (Unit!13147) )
))
(declare-fun lt!203011 () Unit!13146)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!690 (array!27153 array!27155 (_ BitVec 32) (_ BitVec 32) V!16667 V!16667 (_ BitVec 32) (_ BitVec 64) V!16667 (_ BitVec 32) Int) Unit!13146)

(assert (=> b!441813 (= lt!203011 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!690 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441814 () Bool)

(declare-fun e!260092 () Bool)

(declare-fun tp_is_empty!11671 () Bool)

(assert (=> b!441814 (= e!260092 tp_is_empty!11671)))

(declare-fun b!441815 () Bool)

(declare-fun e!260093 () Bool)

(assert (=> b!441815 (= e!260093 tp_is_empty!11671)))

(declare-fun mapIsEmpty!19128 () Bool)

(declare-fun mapRes!19128 () Bool)

(assert (=> mapIsEmpty!19128 mapRes!19128))

(declare-fun b!441817 () Bool)

(declare-fun e!260091 () Bool)

(assert (=> b!441817 (= e!260091 e!260095)))

(declare-fun res!261618 () Bool)

(assert (=> b!441817 (=> (not res!261618) (not e!260095))))

(assert (=> b!441817 (= res!261618 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!203013 () ListLongMap!6739)

(assert (=> b!441817 (= lt!203013 (getCurrentListMapNoExtraKeys!1574 lt!203012 lt!203014 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441817 (= lt!203014 (array!27156 (store (arr!13027 _values!549) i!563 (ValueCellFull!5492 v!412)) (size!13379 _values!549)))))

(declare-fun lt!203015 () ListLongMap!6739)

(assert (=> b!441817 (= lt!203015 (getCurrentListMapNoExtraKeys!1574 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441818 () Bool)

(declare-fun res!261614 () Bool)

(assert (=> b!441818 (=> (not res!261614) (not e!260096))))

(declare-datatypes ((List!7822 0))(
  ( (Nil!7819) (Cons!7818 (h!8674 (_ BitVec 64)) (t!13578 List!7822)) )
))
(declare-fun arrayNoDuplicates!0 (array!27153 (_ BitVec 32) List!7822) Bool)

(assert (=> b!441818 (= res!261614 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7819))))

(declare-fun b!441819 () Bool)

(declare-fun res!261616 () Bool)

(assert (=> b!441819 (=> (not res!261616) (not e!260096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441819 (= res!261616 (validMask!0 mask!1025))))

(declare-fun b!441820 () Bool)

(assert (=> b!441820 (= e!260096 e!260091)))

(declare-fun res!261613 () Bool)

(assert (=> b!441820 (=> (not res!261613) (not e!260091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27153 (_ BitVec 32)) Bool)

(assert (=> b!441820 (= res!261613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203012 mask!1025))))

(assert (=> b!441820 (= lt!203012 (array!27154 (store (arr!13026 _keys!709) i!563 k!794) (size!13378 _keys!709)))))

(declare-fun b!441821 () Bool)

(declare-fun res!261612 () Bool)

(assert (=> b!441821 (=> (not res!261612) (not e!260096))))

(assert (=> b!441821 (= res!261612 (or (= (select (arr!13026 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13026 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441822 () Bool)

(declare-fun res!261620 () Bool)

(assert (=> b!441822 (=> (not res!261620) (not e!260096))))

(assert (=> b!441822 (= res!261620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441816 () Bool)

(declare-fun res!261619 () Bool)

(assert (=> b!441816 (=> (not res!261619) (not e!260091))))

(assert (=> b!441816 (= res!261619 (bvsle from!863 i!563))))

(declare-fun res!261623 () Bool)

(assert (=> start!40252 (=> (not res!261623) (not e!260096))))

(assert (=> start!40252 (= res!261623 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13378 _keys!709))))))

(assert (=> start!40252 e!260096))

(assert (=> start!40252 tp_is_empty!11671))

(assert (=> start!40252 tp!37086))

(assert (=> start!40252 true))

(declare-fun e!260094 () Bool)

(declare-fun array_inv!9454 (array!27155) Bool)

(assert (=> start!40252 (and (array_inv!9454 _values!549) e!260094)))

(declare-fun array_inv!9455 (array!27153) Bool)

(assert (=> start!40252 (array_inv!9455 _keys!709)))

(declare-fun b!441823 () Bool)

(declare-fun res!261622 () Bool)

(assert (=> b!441823 (=> (not res!261622) (not e!260096))))

(assert (=> b!441823 (= res!261622 (and (= (size!13379 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13378 _keys!709) (size!13379 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441824 () Bool)

(declare-fun res!261615 () Bool)

(assert (=> b!441824 (=> (not res!261615) (not e!260096))))

(assert (=> b!441824 (= res!261615 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13378 _keys!709))))))

(declare-fun b!441825 () Bool)

(assert (=> b!441825 (= e!260094 (and e!260093 mapRes!19128))))

(declare-fun condMapEmpty!19128 () Bool)

(declare-fun mapDefault!19128 () ValueCell!5492)

