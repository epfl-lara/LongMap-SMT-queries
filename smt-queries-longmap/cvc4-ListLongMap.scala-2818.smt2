; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40876 () Bool)

(assert start!40876)

(declare-fun b_free!10811 () Bool)

(declare-fun b_next!10811 () Bool)

(assert (=> start!40876 (= b_free!10811 (not b_next!10811))))

(declare-fun tp!38260 () Bool)

(declare-fun b_and!18953 () Bool)

(assert (=> start!40876 (= tp!38260 b_and!18953)))

(declare-fun b!453872 () Bool)

(declare-fun res!270320 () Bool)

(declare-fun e!265656 () Bool)

(assert (=> b!453872 (=> (not res!270320) (not e!265656))))

(declare-datatypes ((array!28105 0))(
  ( (array!28106 (arr!13496 (Array (_ BitVec 32) (_ BitVec 64))) (size!13848 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28105)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!453872 (= res!270320 (or (= (select (arr!13496 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13496 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453873 () Bool)

(declare-fun e!265654 () Bool)

(declare-fun tp_is_empty!12149 () Bool)

(assert (=> b!453873 (= e!265654 tp_is_empty!12149)))

(declare-fun b!453874 () Bool)

(declare-fun res!270316 () Bool)

(assert (=> b!453874 (=> (not res!270316) (not e!265656))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453874 (= res!270316 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!453875 () Bool)

(declare-fun res!270318 () Bool)

(assert (=> b!453875 (=> (not res!270318) (not e!265656))))

(declare-datatypes ((List!8119 0))(
  ( (Nil!8116) (Cons!8115 (h!8971 (_ BitVec 64)) (t!13947 List!8119)) )
))
(declare-fun arrayNoDuplicates!0 (array!28105 (_ BitVec 32) List!8119) Bool)

(assert (=> b!453875 (= res!270318 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8116))))

(declare-fun e!265652 () Bool)

(declare-fun b!453876 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!453876 (= e!265652 (and (not (= from!863 i!563)) (bvslt from!863 i!563) (or (bvslt (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13848 _keys!709)))))))

(declare-datatypes ((V!17303 0))(
  ( (V!17304 (val!6119 Int)) )
))
(declare-fun minValue!515 () V!17303)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5731 0))(
  ( (ValueCellFull!5731 (v!8385 V!17303)) (EmptyCell!5731) )
))
(declare-datatypes ((array!28107 0))(
  ( (array!28108 (arr!13497 (Array (_ BitVec 32) ValueCell!5731)) (size!13849 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28107)

(declare-fun lt!206022 () array!28105)

(declare-fun v!412 () V!17303)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17303)

(declare-datatypes ((tuple2!8062 0))(
  ( (tuple2!8063 (_1!4042 (_ BitVec 64)) (_2!4042 V!17303)) )
))
(declare-datatypes ((List!8120 0))(
  ( (Nil!8117) (Cons!8116 (h!8972 tuple2!8062) (t!13948 List!8120)) )
))
(declare-datatypes ((ListLongMap!6975 0))(
  ( (ListLongMap!6976 (toList!3503 List!8120)) )
))
(declare-fun lt!206024 () ListLongMap!6975)

(declare-fun getCurrentListMapNoExtraKeys!1686 (array!28105 array!28107 (_ BitVec 32) (_ BitVec 32) V!17303 V!17303 (_ BitVec 32) Int) ListLongMap!6975)

(assert (=> b!453876 (= lt!206024 (getCurrentListMapNoExtraKeys!1686 lt!206022 (array!28108 (store (arr!13497 _values!549) i!563 (ValueCellFull!5731 v!412)) (size!13849 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206023 () ListLongMap!6975)

(assert (=> b!453876 (= lt!206023 (getCurrentListMapNoExtraKeys!1686 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!453877 () Bool)

(declare-fun res!270323 () Bool)

(assert (=> b!453877 (=> (not res!270323) (not e!265656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453877 (= res!270323 (validMask!0 mask!1025))))

(declare-fun b!453878 () Bool)

(declare-fun e!265653 () Bool)

(declare-fun mapRes!19864 () Bool)

(assert (=> b!453878 (= e!265653 (and e!265654 mapRes!19864))))

(declare-fun condMapEmpty!19864 () Bool)

(declare-fun mapDefault!19864 () ValueCell!5731)

