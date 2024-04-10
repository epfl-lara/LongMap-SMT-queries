; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!792 () Bool)

(assert start!792)

(declare-fun b_free!185 () Bool)

(declare-fun b_next!185 () Bool)

(assert (=> start!792 (= b_free!185 (not b_next!185))))

(declare-fun tp!784 () Bool)

(declare-fun b_and!331 () Bool)

(assert (=> start!792 (= tp!784 b_and!331)))

(declare-fun b!5796 () Bool)

(declare-fun e!3153 () Bool)

(assert (=> b!5796 (= e!3153 true)))

(declare-fun lt!1056 () (_ BitVec 32))

(declare-datatypes ((array!461 0))(
  ( (array!462 (arr!219 (Array (_ BitVec 32) (_ BitVec 64))) (size!281 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!461)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!461 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!5796 (= lt!1056 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!365 () Bool)

(declare-fun mapRes!365 () Bool)

(assert (=> mapIsEmpty!365 mapRes!365))

(declare-fun b!5797 () Bool)

(declare-fun res!6438 () Bool)

(declare-fun e!3158 () Bool)

(assert (=> b!5797 (=> (not res!6438) (not e!3158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5797 (= res!6438 (validKeyInArray!0 k!1278))))

(declare-fun b!5798 () Bool)

(declare-fun e!3157 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!5798 (= e!3157 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5799 () Bool)

(declare-fun res!6433 () Bool)

(assert (=> b!5799 (=> (not res!6433) (not e!3158))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!527 0))(
  ( (V!528 (val!137 Int)) )
))
(declare-datatypes ((ValueCell!115 0))(
  ( (ValueCellFull!115 (v!1228 V!527)) (EmptyCell!115) )
))
(declare-datatypes ((array!463 0))(
  ( (array!464 (arr!220 (Array (_ BitVec 32) ValueCell!115)) (size!282 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!463)

(declare-fun minValue!1434 () V!527)

(declare-fun zeroValue!1434 () V!527)

(declare-datatypes ((tuple2!136 0))(
  ( (tuple2!137 (_1!68 (_ BitVec 64)) (_2!68 V!527)) )
))
(declare-datatypes ((List!148 0))(
  ( (Nil!145) (Cons!144 (h!710 tuple2!136) (t!2283 List!148)) )
))
(declare-datatypes ((ListLongMap!141 0))(
  ( (ListLongMap!142 (toList!86 List!148)) )
))
(declare-fun contains!60 (ListLongMap!141 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!45 (array!461 array!463 (_ BitVec 32) (_ BitVec 32) V!527 V!527 (_ BitVec 32) Int) ListLongMap!141)

(assert (=> b!5799 (= res!6433 (contains!60 (getCurrentListMap!45 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!5800 () Bool)

(declare-fun res!6435 () Bool)

(assert (=> b!5800 (=> (not res!6435) (not e!3158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!461 (_ BitVec 32)) Bool)

(assert (=> b!5800 (= res!6435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!6437 () Bool)

(assert (=> start!792 (=> (not res!6437) (not e!3158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!792 (= res!6437 (validMask!0 mask!2250))))

(assert (=> start!792 e!3158))

(assert (=> start!792 tp!784))

(assert (=> start!792 true))

(declare-fun e!3156 () Bool)

(declare-fun array_inv!161 (array!463) Bool)

(assert (=> start!792 (and (array_inv!161 _values!1492) e!3156)))

(declare-fun tp_is_empty!263 () Bool)

(assert (=> start!792 tp_is_empty!263))

(declare-fun array_inv!162 (array!461) Bool)

(assert (=> start!792 (array_inv!162 _keys!1806)))

(declare-fun mapNonEmpty!365 () Bool)

(declare-fun tp!785 () Bool)

(declare-fun e!3155 () Bool)

(assert (=> mapNonEmpty!365 (= mapRes!365 (and tp!785 e!3155))))

(declare-fun mapValue!365 () ValueCell!115)

(declare-fun mapRest!365 () (Array (_ BitVec 32) ValueCell!115))

(declare-fun mapKey!365 () (_ BitVec 32))

(assert (=> mapNonEmpty!365 (= (arr!220 _values!1492) (store mapRest!365 mapKey!365 mapValue!365))))

(declare-fun b!5801 () Bool)

(declare-fun arrayContainsKey!0 (array!461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5801 (= e!3157 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!5802 () Bool)

(assert (=> b!5802 (= e!3158 (not e!3153))))

(declare-fun res!6436 () Bool)

(assert (=> b!5802 (=> res!6436 e!3153)))

(assert (=> b!5802 (= res!6436 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!5802 e!3157))

(declare-fun c!410 () Bool)

(assert (=> b!5802 (= c!410 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!85 0))(
  ( (Unit!86) )
))
(declare-fun lt!1055 () Unit!85)

(declare-fun lemmaKeyInListMapIsInArray!28 (array!461 array!463 (_ BitVec 32) (_ BitVec 32) V!527 V!527 (_ BitVec 64) Int) Unit!85)

(assert (=> b!5802 (= lt!1055 (lemmaKeyInListMapIsInArray!28 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!5803 () Bool)

(assert (=> b!5803 (= e!3155 tp_is_empty!263)))

(declare-fun b!5804 () Bool)

(declare-fun res!6434 () Bool)

(assert (=> b!5804 (=> (not res!6434) (not e!3158))))

(declare-datatypes ((List!149 0))(
  ( (Nil!146) (Cons!145 (h!711 (_ BitVec 64)) (t!2284 List!149)) )
))
(declare-fun arrayNoDuplicates!0 (array!461 (_ BitVec 32) List!149) Bool)

(assert (=> b!5804 (= res!6434 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!146))))

(declare-fun b!5805 () Bool)

(declare-fun res!6439 () Bool)

(assert (=> b!5805 (=> (not res!6439) (not e!3158))))

(assert (=> b!5805 (= res!6439 (and (= (size!282 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!281 _keys!1806) (size!282 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!5806 () Bool)

(declare-fun e!3152 () Bool)

(assert (=> b!5806 (= e!3156 (and e!3152 mapRes!365))))

(declare-fun condMapEmpty!365 () Bool)

(declare-fun mapDefault!365 () ValueCell!115)

