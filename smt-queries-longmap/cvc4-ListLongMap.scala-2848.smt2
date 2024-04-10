; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41078 () Bool)

(assert start!41078)

(declare-fun b_free!10991 () Bool)

(declare-fun b_next!10991 () Bool)

(assert (=> start!41078 (= b_free!10991 (not b_next!10991))))

(declare-fun tp!38803 () Bool)

(declare-fun b_and!19189 () Bool)

(assert (=> start!41078 (= tp!38803 b_and!19189)))

(declare-fun b!458303 () Bool)

(declare-fun res!273815 () Bool)

(declare-fun e!267563 () Bool)

(assert (=> b!458303 (=> (not res!273815) (not e!267563))))

(declare-datatypes ((array!28457 0))(
  ( (array!28458 (arr!13671 (Array (_ BitVec 32) (_ BitVec 64))) (size!14023 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28457)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458303 (= res!273815 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!458304 () Bool)

(declare-fun e!267568 () Bool)

(declare-fun e!267567 () Bool)

(assert (=> b!458304 (= e!267568 (not e!267567))))

(declare-fun res!273818 () Bool)

(assert (=> b!458304 (=> res!273818 e!267567)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458304 (= res!273818 (not (validKeyInArray!0 (select (arr!13671 _keys!709) from!863))))))

(declare-datatypes ((V!17543 0))(
  ( (V!17544 (val!6209 Int)) )
))
(declare-datatypes ((tuple2!8182 0))(
  ( (tuple2!8183 (_1!4102 (_ BitVec 64)) (_2!4102 V!17543)) )
))
(declare-datatypes ((List!8254 0))(
  ( (Nil!8251) (Cons!8250 (h!9106 tuple2!8182) (t!14124 List!8254)) )
))
(declare-datatypes ((ListLongMap!7095 0))(
  ( (ListLongMap!7096 (toList!3563 List!8254)) )
))
(declare-fun lt!207310 () ListLongMap!7095)

(declare-fun lt!207306 () ListLongMap!7095)

(assert (=> b!458304 (= lt!207310 lt!207306)))

(declare-fun lt!207309 () ListLongMap!7095)

(declare-fun v!412 () V!17543)

(declare-fun +!1599 (ListLongMap!7095 tuple2!8182) ListLongMap!7095)

(assert (=> b!458304 (= lt!207306 (+!1599 lt!207309 (tuple2!8183 k!794 v!412)))))

(declare-fun minValue!515 () V!17543)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5821 0))(
  ( (ValueCellFull!5821 (v!8479 V!17543)) (EmptyCell!5821) )
))
(declare-datatypes ((array!28459 0))(
  ( (array!28460 (arr!13672 (Array (_ BitVec 32) ValueCell!5821)) (size!14024 (_ BitVec 32))) )
))
(declare-fun lt!207308 () array!28459)

(declare-fun zeroValue!515 () V!17543)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!207305 () array!28457)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1745 (array!28457 array!28459 (_ BitVec 32) (_ BitVec 32) V!17543 V!17543 (_ BitVec 32) Int) ListLongMap!7095)

(assert (=> b!458304 (= lt!207310 (getCurrentListMapNoExtraKeys!1745 lt!207305 lt!207308 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28459)

(assert (=> b!458304 (= lt!207309 (getCurrentListMapNoExtraKeys!1745 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13318 0))(
  ( (Unit!13319) )
))
(declare-fun lt!207311 () Unit!13318)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!758 (array!28457 array!28459 (_ BitVec 32) (_ BitVec 32) V!17543 V!17543 (_ BitVec 32) (_ BitVec 64) V!17543 (_ BitVec 32) Int) Unit!13318)

(assert (=> b!458304 (= lt!207311 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!758 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458305 () Bool)

(assert (=> b!458305 (= e!267567 (or (not (= (select (arr!13671 _keys!709) from!863) k!794)) (bvsge from!863 (size!14023 _keys!709)) (bvslt (size!14023 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun lt!207312 () ListLongMap!7095)

(declare-fun get!6734 (ValueCell!5821 V!17543) V!17543)

(declare-fun dynLambda!888 (Int (_ BitVec 64)) V!17543)

(assert (=> b!458305 (= lt!207312 (+!1599 lt!207306 (tuple2!8183 (select (arr!13671 _keys!709) from!863) (get!6734 (select (arr!13672 _values!549) from!863) (dynLambda!888 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458306 () Bool)

(declare-fun res!273817 () Bool)

(assert (=> b!458306 (=> (not res!273817) (not e!267563))))

(declare-datatypes ((List!8255 0))(
  ( (Nil!8252) (Cons!8251 (h!9107 (_ BitVec 64)) (t!14125 List!8255)) )
))
(declare-fun arrayNoDuplicates!0 (array!28457 (_ BitVec 32) List!8255) Bool)

(assert (=> b!458306 (= res!273817 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8252))))

(declare-fun b!458307 () Bool)

(declare-fun res!273819 () Bool)

(assert (=> b!458307 (=> (not res!273819) (not e!267563))))

(assert (=> b!458307 (= res!273819 (validKeyInArray!0 k!794))))

(declare-fun b!458308 () Bool)

(declare-fun res!273821 () Bool)

(declare-fun e!267569 () Bool)

(assert (=> b!458308 (=> (not res!273821) (not e!267569))))

(assert (=> b!458308 (= res!273821 (arrayNoDuplicates!0 lt!207305 #b00000000000000000000000000000000 Nil!8252))))

(declare-fun b!458309 () Bool)

(declare-fun res!273820 () Bool)

(assert (=> b!458309 (=> (not res!273820) (not e!267569))))

(assert (=> b!458309 (= res!273820 (bvsle from!863 i!563))))

(declare-fun b!458310 () Bool)

(declare-fun e!267564 () Bool)

(declare-fun tp_is_empty!12329 () Bool)

(assert (=> b!458310 (= e!267564 tp_is_empty!12329)))

(declare-fun b!458311 () Bool)

(declare-fun e!267570 () Bool)

(declare-fun e!267565 () Bool)

(declare-fun mapRes!20137 () Bool)

(assert (=> b!458311 (= e!267570 (and e!267565 mapRes!20137))))

(declare-fun condMapEmpty!20137 () Bool)

(declare-fun mapDefault!20137 () ValueCell!5821)

