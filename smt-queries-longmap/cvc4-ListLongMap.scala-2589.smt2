; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39356 () Bool)

(assert start!39356)

(declare-fun b_free!9623 () Bool)

(declare-fun b_next!9623 () Bool)

(assert (=> start!39356 (= b_free!9623 (not b_next!9623))))

(declare-fun tp!34397 () Bool)

(declare-fun b_and!17121 () Bool)

(assert (=> start!39356 (= tp!34397 b_and!17121)))

(declare-fun b!417666 () Bool)

(declare-fun res!243277 () Bool)

(declare-fun e!249161 () Bool)

(assert (=> b!417666 (=> (not res!243277) (not e!249161))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417666 (= res!243277 (bvsle from!863 i!563))))

(declare-fun b!417667 () Bool)

(declare-fun e!249164 () Bool)

(assert (=> b!417667 (= e!249161 e!249164)))

(declare-fun res!243272 () Bool)

(assert (=> b!417667 (=> (not res!243272) (not e!249164))))

(assert (=> b!417667 (= res!243272 (= from!863 i!563))))

(declare-datatypes ((V!15471 0))(
  ( (V!15472 (val!5432 Int)) )
))
(declare-fun minValue!515 () V!15471)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25401 0))(
  ( (array!25402 (arr!12150 (Array (_ BitVec 32) (_ BitVec 64))) (size!12502 (_ BitVec 32))) )
))
(declare-fun lt!191362 () array!25401)

(declare-fun zeroValue!515 () V!15471)

(declare-datatypes ((ValueCell!5044 0))(
  ( (ValueCellFull!5044 (v!7679 V!15471)) (EmptyCell!5044) )
))
(declare-datatypes ((array!25403 0))(
  ( (array!25404 (arr!12151 (Array (_ BitVec 32) ValueCell!5044)) (size!12503 (_ BitVec 32))) )
))
(declare-fun lt!191359 () array!25403)

(declare-datatypes ((tuple2!7094 0))(
  ( (tuple2!7095 (_1!3558 (_ BitVec 64)) (_2!3558 V!15471)) )
))
(declare-datatypes ((List!7111 0))(
  ( (Nil!7108) (Cons!7107 (h!7963 tuple2!7094) (t!12399 List!7111)) )
))
(declare-datatypes ((ListLongMap!6007 0))(
  ( (ListLongMap!6008 (toList!3019 List!7111)) )
))
(declare-fun lt!191357 () ListLongMap!6007)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1224 (array!25401 array!25403 (_ BitVec 32) (_ BitVec 32) V!15471 V!15471 (_ BitVec 32) Int) ListLongMap!6007)

(assert (=> b!417667 (= lt!191357 (getCurrentListMapNoExtraKeys!1224 lt!191362 lt!191359 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25403)

(declare-fun v!412 () V!15471)

(assert (=> b!417667 (= lt!191359 (array!25404 (store (arr!12151 _values!549) i!563 (ValueCellFull!5044 v!412)) (size!12503 _values!549)))))

(declare-fun lt!191355 () ListLongMap!6007)

(declare-fun _keys!709 () array!25401)

(assert (=> b!417667 (= lt!191355 (getCurrentListMapNoExtraKeys!1224 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!417668 () Bool)

(declare-fun res!243271 () Bool)

(declare-fun e!249165 () Bool)

(assert (=> b!417668 (=> (not res!243271) (not e!249165))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417668 (= res!243271 (validKeyInArray!0 k!794))))

(declare-fun bm!29044 () Bool)

(declare-fun call!29047 () ListLongMap!6007)

(declare-fun c!55148 () Bool)

(assert (=> bm!29044 (= call!29047 (getCurrentListMapNoExtraKeys!1224 (ite c!55148 lt!191362 _keys!709) (ite c!55148 lt!191359 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417670 () Bool)

(declare-fun e!249166 () Bool)

(assert (=> b!417670 (= e!249164 (not e!249166))))

(declare-fun res!243274 () Bool)

(assert (=> b!417670 (=> res!243274 e!249166)))

(assert (=> b!417670 (= res!243274 (validKeyInArray!0 (select (arr!12150 _keys!709) from!863)))))

(declare-fun e!249162 () Bool)

(assert (=> b!417670 e!249162))

(assert (=> b!417670 (= c!55148 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12342 0))(
  ( (Unit!12343) )
))
(declare-fun lt!191361 () Unit!12342)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!427 (array!25401 array!25403 (_ BitVec 32) (_ BitVec 32) V!15471 V!15471 (_ BitVec 32) (_ BitVec 64) V!15471 (_ BitVec 32) Int) Unit!12342)

(assert (=> b!417670 (= lt!191361 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!427 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417671 () Bool)

(declare-fun res!243269 () Bool)

(assert (=> b!417671 (=> (not res!243269) (not e!249165))))

(assert (=> b!417671 (= res!243269 (or (= (select (arr!12150 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12150 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417672 () Bool)

(declare-fun e!249160 () Bool)

(declare-fun e!249163 () Bool)

(declare-fun mapRes!17784 () Bool)

(assert (=> b!417672 (= e!249160 (and e!249163 mapRes!17784))))

(declare-fun condMapEmpty!17784 () Bool)

(declare-fun mapDefault!17784 () ValueCell!5044)

