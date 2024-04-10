; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!750 () Bool)

(assert start!750)

(declare-fun b_free!163 () Bool)

(declare-fun b_next!163 () Bool)

(assert (=> start!750 (= b_free!163 (not b_next!163))))

(declare-fun tp!715 () Bool)

(declare-fun b_and!307 () Bool)

(assert (=> start!750 (= tp!715 b_and!307)))

(declare-fun mapNonEmpty!329 () Bool)

(declare-fun mapRes!329 () Bool)

(declare-fun tp!716 () Bool)

(declare-fun e!2853 () Bool)

(assert (=> mapNonEmpty!329 (= mapRes!329 (and tp!716 e!2853))))

(declare-datatypes ((V!499 0))(
  ( (V!500 (val!126 Int)) )
))
(declare-datatypes ((ValueCell!104 0))(
  ( (ValueCellFull!104 (v!1216 V!499)) (EmptyCell!104) )
))
(declare-fun mapRest!329 () (Array (_ BitVec 32) ValueCell!104))

(declare-fun mapKey!329 () (_ BitVec 32))

(declare-fun mapValue!329 () ValueCell!104)

(declare-datatypes ((array!417 0))(
  ( (array!418 (arr!198 (Array (_ BitVec 32) ValueCell!104)) (size!260 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!417)

(assert (=> mapNonEmpty!329 (= (arr!198 _values!1492) (store mapRest!329 mapKey!329 mapValue!329))))

(declare-fun b!5289 () Bool)

(declare-fun res!6163 () Bool)

(declare-fun e!2851 () Bool)

(assert (=> b!5289 (=> (not res!6163) (not e!2851))))

(declare-datatypes ((array!419 0))(
  ( (array!420 (arr!199 (Array (_ BitVec 32) (_ BitVec 64))) (size!261 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!419)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!419 (_ BitVec 32)) Bool)

(assert (=> b!5289 (= res!6163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!5290 () Bool)

(declare-fun e!2849 () Bool)

(assert (=> b!5290 (= e!2851 (not e!2849))))

(declare-fun res!6161 () Bool)

(assert (=> b!5290 (=> res!6161 e!2849)))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!5290 (= res!6161 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(declare-fun e!2854 () Bool)

(assert (=> b!5290 e!2854))

(declare-fun c!347 () Bool)

(assert (=> b!5290 (= c!347 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!499)

(declare-datatypes ((Unit!65 0))(
  ( (Unit!66) )
))
(declare-fun lt!915 () Unit!65)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!499)

(declare-fun lemmaKeyInListMapIsInArray!19 (array!419 array!417 (_ BitVec 32) (_ BitVec 32) V!499 V!499 (_ BitVec 64) Int) Unit!65)

(assert (=> b!5290 (= lt!915 (lemmaKeyInListMapIsInArray!19 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun mapIsEmpty!329 () Bool)

(assert (=> mapIsEmpty!329 mapRes!329))

(declare-fun b!5291 () Bool)

(declare-fun res!6166 () Bool)

(assert (=> b!5291 (=> (not res!6166) (not e!2851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!5291 (= res!6166 (validKeyInArray!0 k!1278))))

(declare-fun b!5292 () Bool)

(assert (=> b!5292 (= e!2854 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!5293 () Bool)

(declare-fun e!2850 () Bool)

(declare-fun tp_is_empty!241 () Bool)

(assert (=> b!5293 (= e!2850 tp_is_empty!241)))

(declare-fun b!5288 () Bool)

(assert (=> b!5288 (= e!2854 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun res!6164 () Bool)

(assert (=> start!750 (=> (not res!6164) (not e!2851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!750 (= res!6164 (validMask!0 mask!2250))))

(assert (=> start!750 e!2851))

(assert (=> start!750 tp!715))

(assert (=> start!750 true))

(declare-fun e!2852 () Bool)

(declare-fun array_inv!145 (array!417) Bool)

(assert (=> start!750 (and (array_inv!145 _values!1492) e!2852)))

(assert (=> start!750 tp_is_empty!241))

(declare-fun array_inv!146 (array!419) Bool)

(assert (=> start!750 (array_inv!146 _keys!1806)))

(declare-fun b!5294 () Bool)

(declare-fun res!6162 () Bool)

(assert (=> b!5294 (=> (not res!6162) (not e!2851))))

(declare-datatypes ((tuple2!118 0))(
  ( (tuple2!119 (_1!59 (_ BitVec 64)) (_2!59 V!499)) )
))
(declare-datatypes ((List!130 0))(
  ( (Nil!127) (Cons!126 (h!692 tuple2!118) (t!2263 List!130)) )
))
(declare-datatypes ((ListLongMap!123 0))(
  ( (ListLongMap!124 (toList!77 List!130)) )
))
(declare-fun contains!50 (ListLongMap!123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!36 (array!419 array!417 (_ BitVec 32) (_ BitVec 32) V!499 V!499 (_ BitVec 32) Int) ListLongMap!123)

(assert (=> b!5294 (= res!6162 (contains!50 (getCurrentListMap!36 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!5295 () Bool)

(declare-fun res!6160 () Bool)

(assert (=> b!5295 (=> (not res!6160) (not e!2851))))

(declare-datatypes ((List!131 0))(
  ( (Nil!128) (Cons!127 (h!693 (_ BitVec 64)) (t!2264 List!131)) )
))
(declare-fun arrayNoDuplicates!0 (array!419 (_ BitVec 32) List!131) Bool)

(assert (=> b!5295 (= res!6160 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!128))))

(declare-fun b!5296 () Bool)

(assert (=> b!5296 (= e!2849 (and (bvslt #b00000000000000000000000000000000 (size!261 _keys!1806)) (bvslt (size!261 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun b!5297 () Bool)

(assert (=> b!5297 (= e!2852 (and e!2850 mapRes!329))))

(declare-fun condMapEmpty!329 () Bool)

(declare-fun mapDefault!329 () ValueCell!104)

