; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40472 () Bool)

(assert start!40472)

(declare-fun b_free!10543 () Bool)

(declare-fun b_next!10543 () Bool)

(assert (=> start!40472 (= b_free!10543 (not b_next!10543))))

(declare-fun tp!37406 () Bool)

(declare-fun b_and!18527 () Bool)

(assert (=> start!40472 (= tp!37406 b_and!18527)))

(declare-fun b!445603 () Bool)

(declare-fun res!264424 () Bool)

(declare-fun e!261896 () Bool)

(assert (=> b!445603 (=> (not res!264424) (not e!261896))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27521 0))(
  ( (array!27522 (arr!13208 (Array (_ BitVec 32) (_ BitVec 64))) (size!13560 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27521)

(assert (=> b!445603 (= res!264424 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13560 _keys!709))))))

(declare-fun b!445604 () Bool)

(declare-fun res!264422 () Bool)

(assert (=> b!445604 (=> (not res!264422) (not e!261896))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445604 (= res!264422 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!445605 () Bool)

(declare-fun e!261898 () Bool)

(declare-fun tp_is_empty!11857 () Bool)

(assert (=> b!445605 (= e!261898 tp_is_empty!11857)))

(declare-fun res!264429 () Bool)

(assert (=> start!40472 (=> (not res!264429) (not e!261896))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40472 (= res!264429 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13560 _keys!709))))))

(assert (=> start!40472 e!261896))

(assert (=> start!40472 tp_is_empty!11857))

(assert (=> start!40472 tp!37406))

(assert (=> start!40472 true))

(declare-datatypes ((V!16915 0))(
  ( (V!16916 (val!5973 Int)) )
))
(declare-datatypes ((ValueCell!5585 0))(
  ( (ValueCellFull!5585 (v!8224 V!16915)) (EmptyCell!5585) )
))
(declare-datatypes ((array!27523 0))(
  ( (array!27524 (arr!13209 (Array (_ BitVec 32) ValueCell!5585)) (size!13561 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27523)

(declare-fun e!261897 () Bool)

(declare-fun array_inv!9578 (array!27523) Bool)

(assert (=> start!40472 (and (array_inv!9578 _values!549) e!261897)))

(declare-fun array_inv!9579 (array!27521) Bool)

(assert (=> start!40472 (array_inv!9579 _keys!709)))

(declare-fun b!445606 () Bool)

(declare-fun e!261899 () Bool)

(assert (=> b!445606 (= e!261896 e!261899)))

(declare-fun res!264423 () Bool)

(assert (=> b!445606 (=> (not res!264423) (not e!261899))))

(declare-fun lt!203653 () array!27521)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27521 (_ BitVec 32)) Bool)

(assert (=> b!445606 (= res!264423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203653 mask!1025))))

(assert (=> b!445606 (= lt!203653 (array!27522 (store (arr!13208 _keys!709) i!563 k!794) (size!13560 _keys!709)))))

(declare-fun b!445607 () Bool)

(declare-fun res!264426 () Bool)

(assert (=> b!445607 (=> (not res!264426) (not e!261899))))

(assert (=> b!445607 (= res!264426 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13560 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445608 () Bool)

(declare-fun res!264431 () Bool)

(assert (=> b!445608 (=> (not res!264431) (not e!261899))))

(declare-datatypes ((List!7896 0))(
  ( (Nil!7893) (Cons!7892 (h!8748 (_ BitVec 64)) (t!13654 List!7896)) )
))
(declare-fun arrayNoDuplicates!0 (array!27521 (_ BitVec 32) List!7896) Bool)

(assert (=> b!445608 (= res!264431 (arrayNoDuplicates!0 lt!203653 #b00000000000000000000000000000000 Nil!7893))))

(declare-fun b!445609 () Bool)

(assert (=> b!445609 (= e!261899 (not true))))

(declare-fun e!261902 () Bool)

(assert (=> b!445609 e!261902))

(declare-fun c!55860 () Bool)

(assert (=> b!445609 (= c!55860 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!16915)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!13162 0))(
  ( (Unit!13163) )
))
(declare-fun lt!203654 () Unit!13162)

(declare-fun zeroValue!515 () V!16915)

(declare-fun v!412 () V!16915)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!697 (array!27521 array!27523 (_ BitVec 32) (_ BitVec 32) V!16915 V!16915 (_ BitVec 32) (_ BitVec 64) V!16915 (_ BitVec 32) Int) Unit!13162)

(assert (=> b!445609 (= lt!203654 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!697 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445610 () Bool)

(declare-fun res!264433 () Bool)

(assert (=> b!445610 (=> (not res!264433) (not e!261896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445610 (= res!264433 (validMask!0 mask!1025))))

(declare-fun b!445611 () Bool)

(declare-fun res!264427 () Bool)

(assert (=> b!445611 (=> (not res!264427) (not e!261896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445611 (= res!264427 (validKeyInArray!0 k!794))))

(declare-fun b!445612 () Bool)

(declare-fun e!261900 () Bool)

(assert (=> b!445612 (= e!261900 tp_is_empty!11857)))

(declare-fun b!445613 () Bool)

(declare-fun mapRes!19413 () Bool)

(assert (=> b!445613 (= e!261897 (and e!261898 mapRes!19413))))

(declare-fun condMapEmpty!19413 () Bool)

(declare-fun mapDefault!19413 () ValueCell!5585)

