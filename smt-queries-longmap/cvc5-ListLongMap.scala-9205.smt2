; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110578 () Bool)

(assert start!110578)

(declare-fun b_free!29413 () Bool)

(declare-fun b_next!29413 () Bool)

(assert (=> start!110578 (= b_free!29413 (not b_next!29413))))

(declare-fun tp!103560 () Bool)

(declare-fun b_and!47621 () Bool)

(assert (=> start!110578 (= tp!103560 b_and!47621)))

(declare-fun b!1308211 () Bool)

(declare-fun res!868404 () Bool)

(declare-fun e!746458 () Bool)

(assert (=> b!1308211 (=> (not res!868404) (not e!746458))))

(declare-datatypes ((array!87284 0))(
  ( (array!87285 (arr!42122 (Array (_ BitVec 32) (_ BitVec 64))) (size!42672 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87284)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308211 (= res!868404 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42672 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!868396 () Bool)

(assert (=> start!110578 (=> (not res!868396) (not e!746458))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110578 (= res!868396 (validMask!0 mask!2040))))

(assert (=> start!110578 e!746458))

(assert (=> start!110578 tp!103560))

(declare-fun array_inv!31835 (array!87284) Bool)

(assert (=> start!110578 (array_inv!31835 _keys!1628)))

(assert (=> start!110578 true))

(declare-fun tp_is_empty!35143 () Bool)

(assert (=> start!110578 tp_is_empty!35143))

(declare-datatypes ((V!51961 0))(
  ( (V!51962 (val!17646 Int)) )
))
(declare-datatypes ((ValueCell!16673 0))(
  ( (ValueCellFull!16673 (v!20273 V!51961)) (EmptyCell!16673) )
))
(declare-datatypes ((array!87286 0))(
  ( (array!87287 (arr!42123 (Array (_ BitVec 32) ValueCell!16673)) (size!42673 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87286)

(declare-fun e!746461 () Bool)

(declare-fun array_inv!31836 (array!87286) Bool)

(assert (=> start!110578 (and (array_inv!31836 _values!1354) e!746461)))

(declare-fun mapIsEmpty!54343 () Bool)

(declare-fun mapRes!54343 () Bool)

(assert (=> mapIsEmpty!54343 mapRes!54343))

(declare-fun b!1308212 () Bool)

(declare-fun e!746462 () Bool)

(assert (=> b!1308212 (= e!746462 tp_is_empty!35143)))

(declare-fun b!1308213 () Bool)

(declare-fun e!746460 () Bool)

(assert (=> b!1308213 (= e!746461 (and e!746460 mapRes!54343))))

(declare-fun condMapEmpty!54343 () Bool)

(declare-fun mapDefault!54343 () ValueCell!16673)

