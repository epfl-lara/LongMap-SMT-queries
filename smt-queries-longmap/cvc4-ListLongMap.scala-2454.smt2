; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38546 () Bool)

(assert start!38546)

(declare-fun b_free!9083 () Bool)

(declare-fun b_next!9083 () Bool)

(assert (=> start!38546 (= b_free!9083 (not b_next!9083))))

(declare-fun tp!32373 () Bool)

(declare-fun b_and!16469 () Bool)

(assert (=> start!38546 (= tp!32373 b_and!16469)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!27910 () Bool)

(declare-datatypes ((V!14391 0))(
  ( (V!14392 (val!5027 Int)) )
))
(declare-datatypes ((ValueCell!4639 0))(
  ( (ValueCellFull!4639 (v!7274 V!14391)) (EmptyCell!4639) )
))
(declare-datatypes ((array!23841 0))(
  ( (array!23842 (arr!11370 (Array (_ BitVec 32) ValueCell!4639)) (size!11722 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23841)

(declare-fun zeroValue!515 () V!14391)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!54581 () Bool)

(declare-fun v!412 () V!14391)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23843 0))(
  ( (array!23844 (arr!11371 (Array (_ BitVec 32) (_ BitVec 64))) (size!11723 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23843)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!14391)

(declare-datatypes ((tuple2!6648 0))(
  ( (tuple2!6649 (_1!3335 (_ BitVec 64)) (_2!3335 V!14391)) )
))
(declare-datatypes ((List!6576 0))(
  ( (Nil!6573) (Cons!6572 (h!7428 tuple2!6648) (t!11750 List!6576)) )
))
(declare-datatypes ((ListLongMap!5561 0))(
  ( (ListLongMap!5562 (toList!2796 List!6576)) )
))
(declare-fun call!27914 () ListLongMap!5561)

(declare-fun lt!187475 () array!23843)

(declare-fun getCurrentListMapNoExtraKeys!1015 (array!23843 array!23841 (_ BitVec 32) (_ BitVec 32) V!14391 V!14391 (_ BitVec 32) Int) ListLongMap!5561)

(assert (=> bm!27910 (= call!27914 (getCurrentListMapNoExtraKeys!1015 (ite c!54581 lt!187475 _keys!709) (ite c!54581 (array!23842 (store (arr!11370 _values!549) i!563 (ValueCellFull!4639 v!412)) (size!11722 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398575 () Bool)

(declare-fun res!229076 () Bool)

(declare-fun e!240874 () Bool)

(assert (=> b!398575 (=> (not res!229076) (not e!240874))))

(assert (=> b!398575 (= res!229076 (or (= (select (arr!11371 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11371 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398576 () Bool)

(declare-fun res!229067 () Bool)

(assert (=> b!398576 (=> (not res!229067) (not e!240874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398576 (= res!229067 (validMask!0 mask!1025))))

(declare-fun b!398577 () Bool)

(declare-fun res!229068 () Bool)

(declare-fun e!240876 () Bool)

(assert (=> b!398577 (=> (not res!229068) (not e!240876))))

(declare-datatypes ((List!6577 0))(
  ( (Nil!6574) (Cons!6573 (h!7429 (_ BitVec 64)) (t!11751 List!6577)) )
))
(declare-fun arrayNoDuplicates!0 (array!23843 (_ BitVec 32) List!6577) Bool)

(assert (=> b!398577 (= res!229068 (arrayNoDuplicates!0 lt!187475 #b00000000000000000000000000000000 Nil!6574))))

(declare-fun b!398578 () Bool)

(assert (=> b!398578 (= e!240874 e!240876)))

(declare-fun res!229073 () Bool)

(assert (=> b!398578 (=> (not res!229073) (not e!240876))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23843 (_ BitVec 32)) Bool)

(assert (=> b!398578 (= res!229073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187475 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!398578 (= lt!187475 (array!23844 (store (arr!11371 _keys!709) i!563 k!794) (size!11723 _keys!709)))))

(declare-fun b!398579 () Bool)

(declare-fun res!229070 () Bool)

(assert (=> b!398579 (=> (not res!229070) (not e!240876))))

(assert (=> b!398579 (= res!229070 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11723 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398581 () Bool)

(declare-fun e!240878 () Bool)

(declare-fun e!240873 () Bool)

(declare-fun mapRes!16569 () Bool)

(assert (=> b!398581 (= e!240878 (and e!240873 mapRes!16569))))

(declare-fun condMapEmpty!16569 () Bool)

(declare-fun mapDefault!16569 () ValueCell!4639)

