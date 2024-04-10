; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111780 () Bool)

(assert start!111780)

(declare-fun b_free!30437 () Bool)

(declare-fun b_next!30437 () Bool)

(assert (=> start!111780 (= b_free!30437 (not b_next!30437))))

(declare-fun tp!106786 () Bool)

(declare-fun b_and!48975 () Bool)

(assert (=> start!111780 (= tp!106786 b_and!48975)))

(declare-fun b!1324567 () Bool)

(declare-fun res!879181 () Bool)

(declare-fun e!755115 () Bool)

(assert (=> b!1324567 (=> (not res!879181) (not e!755115))))

(declare-datatypes ((array!89428 0))(
  ( (array!89429 (arr!43188 (Array (_ BitVec 32) (_ BitVec 64))) (size!43738 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89428)

(declare-datatypes ((List!30615 0))(
  ( (Nil!30612) (Cons!30611 (h!31820 (_ BitVec 64)) (t!44541 List!30615)) )
))
(declare-fun arrayNoDuplicates!0 (array!89428 (_ BitVec 32) List!30615) Bool)

(assert (=> b!1324567 (= res!879181 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30612))))

(declare-fun b!1324568 () Bool)

(declare-fun res!879183 () Bool)

(assert (=> b!1324568 (=> (not res!879183) (not e!755115))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1324568 (= res!879183 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43738 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324569 () Bool)

(declare-fun res!879185 () Bool)

(assert (=> b!1324569 (=> (not res!879185) (not e!755115))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89428 (_ BitVec 32)) Bool)

(assert (=> b!1324569 (= res!879185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324570 () Bool)

(declare-fun e!755119 () Bool)

(declare-fun tp_is_empty!36257 () Bool)

(assert (=> b!1324570 (= e!755119 tp_is_empty!36257)))

(declare-fun b!1324571 () Bool)

(declare-fun e!755116 () Bool)

(assert (=> b!1324571 (= e!755116 tp_is_empty!36257)))

(declare-fun res!879184 () Bool)

(assert (=> start!111780 (=> (not res!879184) (not e!755115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111780 (= res!879184 (validMask!0 mask!2019))))

(assert (=> start!111780 e!755115))

(declare-fun array_inv!32601 (array!89428) Bool)

(assert (=> start!111780 (array_inv!32601 _keys!1609)))

(assert (=> start!111780 true))

(assert (=> start!111780 tp_is_empty!36257))

(declare-datatypes ((V!53445 0))(
  ( (V!53446 (val!18203 Int)) )
))
(declare-datatypes ((ValueCell!17230 0))(
  ( (ValueCellFull!17230 (v!20833 V!53445)) (EmptyCell!17230) )
))
(declare-datatypes ((array!89430 0))(
  ( (array!89431 (arr!43189 (Array (_ BitVec 32) ValueCell!17230)) (size!43739 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89430)

(declare-fun e!755118 () Bool)

(declare-fun array_inv!32602 (array!89430) Bool)

(assert (=> start!111780 (and (array_inv!32602 _values!1337) e!755118)))

(assert (=> start!111780 tp!106786))

(declare-fun mapIsEmpty!56033 () Bool)

(declare-fun mapRes!56033 () Bool)

(assert (=> mapIsEmpty!56033 mapRes!56033))

(declare-fun b!1324572 () Bool)

(assert (=> b!1324572 (= e!755115 false)))

(declare-fun zeroValue!1279 () V!53445)

(declare-fun minValue!1279 () V!53445)

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!589479 () Bool)

(declare-datatypes ((tuple2!23474 0))(
  ( (tuple2!23475 (_1!11748 (_ BitVec 64)) (_2!11748 V!53445)) )
))
(declare-datatypes ((List!30616 0))(
  ( (Nil!30613) (Cons!30612 (h!31821 tuple2!23474) (t!44542 List!30616)) )
))
(declare-datatypes ((ListLongMap!21131 0))(
  ( (ListLongMap!21132 (toList!10581 List!30616)) )
))
(declare-fun contains!8736 (ListLongMap!21131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5577 (array!89428 array!89430 (_ BitVec 32) (_ BitVec 32) V!53445 V!53445 (_ BitVec 32) Int) ListLongMap!21131)

(assert (=> b!1324572 (= lt!589479 (contains!8736 (getCurrentListMap!5577 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1324573 () Bool)

(assert (=> b!1324573 (= e!755118 (and e!755116 mapRes!56033))))

(declare-fun condMapEmpty!56033 () Bool)

(declare-fun mapDefault!56033 () ValueCell!17230)

