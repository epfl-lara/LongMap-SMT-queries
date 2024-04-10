; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40688 () Bool)

(assert start!40688)

(declare-fun b_free!10699 () Bool)

(declare-fun b_next!10699 () Bool)

(assert (=> start!40688 (= b_free!10699 (not b_next!10699))))

(declare-fun tp!37917 () Bool)

(declare-fun b_and!18707 () Bool)

(assert (=> start!40688 (= tp!37917 b_and!18707)))

(declare-fun b!449903 () Bool)

(declare-fun e!263714 () Bool)

(declare-fun tp_is_empty!12037 () Bool)

(assert (=> b!449903 (= e!263714 tp_is_empty!12037)))

(declare-fun res!267713 () Bool)

(declare-fun e!263715 () Bool)

(assert (=> start!40688 (=> (not res!267713) (not e!263715))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27881 0))(
  ( (array!27882 (arr!13386 (Array (_ BitVec 32) (_ BitVec 64))) (size!13738 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27881)

(assert (=> start!40688 (= res!267713 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13738 _keys!709))))))

(assert (=> start!40688 e!263715))

(assert (=> start!40688 tp_is_empty!12037))

(assert (=> start!40688 tp!37917))

(assert (=> start!40688 true))

(declare-datatypes ((V!17155 0))(
  ( (V!17156 (val!6063 Int)) )
))
(declare-datatypes ((ValueCell!5675 0))(
  ( (ValueCellFull!5675 (v!8318 V!17155)) (EmptyCell!5675) )
))
(declare-datatypes ((array!27883 0))(
  ( (array!27884 (arr!13387 (Array (_ BitVec 32) ValueCell!5675)) (size!13739 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27883)

(declare-fun e!263716 () Bool)

(declare-fun array_inv!9696 (array!27883) Bool)

(assert (=> start!40688 (and (array_inv!9696 _values!549) e!263716)))

(declare-fun array_inv!9697 (array!27881) Bool)

(assert (=> start!40688 (array_inv!9697 _keys!709)))

(declare-fun b!449904 () Bool)

(declare-fun e!263713 () Bool)

(assert (=> b!449904 (= e!263713 (not (bvslt from!863 (size!13738 _keys!709))))))

(declare-fun e!263717 () Bool)

(assert (=> b!449904 e!263717))

(declare-fun c!55955 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449904 (= c!55955 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!17155)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!13182 0))(
  ( (Unit!13183) )
))
(declare-fun lt!204465 () Unit!13182)

(declare-fun zeroValue!515 () V!17155)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17155)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!706 (array!27881 array!27883 (_ BitVec 32) (_ BitVec 32) V!17155 V!17155 (_ BitVec 32) (_ BitVec 64) V!17155 (_ BitVec 32) Int) Unit!13182)

(assert (=> b!449904 (= lt!204465 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!706 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449905 () Bool)

(declare-fun e!263718 () Bool)

(assert (=> b!449905 (= e!263718 tp_is_empty!12037)))

(declare-fun b!449906 () Bool)

(declare-fun res!267707 () Bool)

(assert (=> b!449906 (=> (not res!267707) (not e!263715))))

(declare-datatypes ((List!8027 0))(
  ( (Nil!8024) (Cons!8023 (h!8879 (_ BitVec 64)) (t!13789 List!8027)) )
))
(declare-fun arrayNoDuplicates!0 (array!27881 (_ BitVec 32) List!8027) Bool)

(assert (=> b!449906 (= res!267707 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8024))))

(declare-fun b!449907 () Bool)

(declare-datatypes ((tuple2!7958 0))(
  ( (tuple2!7959 (_1!3990 (_ BitVec 64)) (_2!3990 V!17155)) )
))
(declare-datatypes ((List!8028 0))(
  ( (Nil!8025) (Cons!8024 (h!8880 tuple2!7958) (t!13790 List!8028)) )
))
(declare-datatypes ((ListLongMap!6871 0))(
  ( (ListLongMap!6872 (toList!3451 List!8028)) )
))
(declare-fun call!29690 () ListLongMap!6871)

(declare-fun call!29689 () ListLongMap!6871)

(declare-fun +!1536 (ListLongMap!6871 tuple2!7958) ListLongMap!6871)

(assert (=> b!449907 (= e!263717 (= call!29689 (+!1536 call!29690 (tuple2!7959 k!794 v!412))))))

(declare-fun b!449908 () Bool)

(declare-fun res!267714 () Bool)

(declare-fun e!263720 () Bool)

(assert (=> b!449908 (=> (not res!267714) (not e!263720))))

(declare-fun lt!204461 () array!27881)

(assert (=> b!449908 (= res!267714 (arrayNoDuplicates!0 lt!204461 #b00000000000000000000000000000000 Nil!8024))))

(declare-fun b!449909 () Bool)

(declare-fun res!267712 () Bool)

(assert (=> b!449909 (=> (not res!267712) (not e!263715))))

(assert (=> b!449909 (= res!267712 (or (= (select (arr!13386 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13386 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449910 () Bool)

(assert (=> b!449910 (= e!263717 (= call!29690 call!29689))))

(declare-fun b!449911 () Bool)

(declare-fun res!267702 () Bool)

(assert (=> b!449911 (=> (not res!267702) (not e!263715))))

(assert (=> b!449911 (= res!267702 (and (= (size!13739 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13738 _keys!709) (size!13739 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449912 () Bool)

(assert (=> b!449912 (= e!263720 e!263713)))

(declare-fun res!267705 () Bool)

(assert (=> b!449912 (=> (not res!267705) (not e!263713))))

(assert (=> b!449912 (= res!267705 (= from!863 i!563))))

(declare-fun lt!204464 () ListLongMap!6871)

(declare-fun lt!204462 () array!27883)

(declare-fun getCurrentListMapNoExtraKeys!1637 (array!27881 array!27883 (_ BitVec 32) (_ BitVec 32) V!17155 V!17155 (_ BitVec 32) Int) ListLongMap!6871)

(assert (=> b!449912 (= lt!204464 (getCurrentListMapNoExtraKeys!1637 lt!204461 lt!204462 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!449912 (= lt!204462 (array!27884 (store (arr!13387 _values!549) i!563 (ValueCellFull!5675 v!412)) (size!13739 _values!549)))))

(declare-fun lt!204463 () ListLongMap!6871)

(assert (=> b!449912 (= lt!204463 (getCurrentListMapNoExtraKeys!1637 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449913 () Bool)

(declare-fun res!267710 () Bool)

(assert (=> b!449913 (=> (not res!267710) (not e!263715))))

(declare-fun arrayContainsKey!0 (array!27881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449913 (= res!267710 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!449914 () Bool)

(declare-fun mapRes!19689 () Bool)

(assert (=> b!449914 (= e!263716 (and e!263718 mapRes!19689))))

(declare-fun condMapEmpty!19689 () Bool)

(declare-fun mapDefault!19689 () ValueCell!5675)

