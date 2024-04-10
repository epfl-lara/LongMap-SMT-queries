; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!830 () Bool)

(assert start!830)

(declare-fun b_free!223 () Bool)

(declare-fun b_next!223 () Bool)

(assert (=> start!830 (= b_free!223 (not b_next!223))))

(declare-fun tp!899 () Bool)

(declare-fun b_and!369 () Bool)

(assert (=> start!830 (= tp!899 b_and!369)))

(declare-fun mapIsEmpty!422 () Bool)

(declare-fun mapRes!422 () Bool)

(assert (=> mapIsEmpty!422 mapRes!422))

(declare-fun b!6509 () Bool)

(declare-fun res!6865 () Bool)

(declare-fun e!3580 () Bool)

(assert (=> b!6509 (=> (not res!6865) (not e!3580))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6509 (= res!6865 (validKeyInArray!0 k!1278))))

(declare-fun res!6861 () Bool)

(assert (=> start!830 (=> (not res!6861) (not e!3580))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!830 (= res!6861 (validMask!0 mask!2250))))

(assert (=> start!830 e!3580))

(assert (=> start!830 tp!899))

(assert (=> start!830 true))

(declare-datatypes ((V!579 0))(
  ( (V!580 (val!156 Int)) )
))
(declare-datatypes ((ValueCell!134 0))(
  ( (ValueCellFull!134 (v!1247 V!579)) (EmptyCell!134) )
))
(declare-datatypes ((array!535 0))(
  ( (array!536 (arr!256 (Array (_ BitVec 32) ValueCell!134)) (size!318 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!535)

(declare-fun e!3585 () Bool)

(declare-fun array_inv!187 (array!535) Bool)

(assert (=> start!830 (and (array_inv!187 _values!1492) e!3585)))

(declare-fun tp_is_empty!301 () Bool)

(assert (=> start!830 tp_is_empty!301))

(declare-datatypes ((array!537 0))(
  ( (array!538 (arr!257 (Array (_ BitVec 32) (_ BitVec 64))) (size!319 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!537)

(declare-fun array_inv!188 (array!537) Bool)

(assert (=> start!830 (array_inv!188 _keys!1806)))

(declare-fun b!6510 () Bool)

(declare-fun e!3586 () Bool)

(declare-fun arrayContainsKey!0 (array!537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6510 (= e!3586 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6511 () Bool)

(declare-fun res!6862 () Bool)

(assert (=> b!6511 (=> (not res!6862) (not e!3580))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!579)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!579)

(declare-datatypes ((tuple2!162 0))(
  ( (tuple2!163 (_1!81 (_ BitVec 64)) (_2!81 V!579)) )
))
(declare-datatypes ((List!173 0))(
  ( (Nil!170) (Cons!169 (h!735 tuple2!162) (t!2308 List!173)) )
))
(declare-datatypes ((ListLongMap!167 0))(
  ( (ListLongMap!168 (toList!99 List!173)) )
))
(declare-fun contains!73 (ListLongMap!167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!58 (array!537 array!535 (_ BitVec 32) (_ BitVec 32) V!579 V!579 (_ BitVec 32) Int) ListLongMap!167)

(assert (=> b!6511 (= res!6862 (contains!73 (getCurrentListMap!58 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!6512 () Bool)

(declare-fun e!3587 () Bool)

(declare-fun e!3583 () Bool)

(assert (=> b!6512 (= e!3587 e!3583)))

(declare-fun res!6867 () Bool)

(assert (=> b!6512 (=> res!6867 e!3583)))

(assert (=> b!6512 (= res!6867 (not (= (size!319 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1228 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!537 (_ BitVec 32)) Bool)

(assert (=> b!6512 (arrayForallSeekEntryOrOpenFound!0 lt!1228 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!111 0))(
  ( (Unit!112) )
))
(declare-fun lt!1229 () Unit!111)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!537 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!111)

(assert (=> b!6512 (= lt!1229 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1228))))

(declare-fun arrayScanForKey!0 (array!537 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6512 (= lt!1228 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6513 () Bool)

(declare-fun res!6866 () Bool)

(assert (=> b!6513 (=> (not res!6866) (not e!3580))))

(assert (=> b!6513 (= res!6866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!422 () Bool)

(declare-fun tp!898 () Bool)

(declare-fun e!3581 () Bool)

(assert (=> mapNonEmpty!422 (= mapRes!422 (and tp!898 e!3581))))

(declare-fun mapKey!422 () (_ BitVec 32))

(declare-fun mapRest!422 () (Array (_ BitVec 32) ValueCell!134))

(declare-fun mapValue!422 () ValueCell!134)

(assert (=> mapNonEmpty!422 (= (arr!256 _values!1492) (store mapRest!422 mapKey!422 mapValue!422))))

(declare-fun b!6514 () Bool)

(assert (=> b!6514 (= e!3580 (not e!3587))))

(declare-fun res!6868 () Bool)

(assert (=> b!6514 (=> res!6868 e!3587)))

(assert (=> b!6514 (= res!6868 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6514 e!3586))

(declare-fun c!467 () Bool)

(assert (=> b!6514 (= c!467 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1230 () Unit!111)

(declare-fun lemmaKeyInListMapIsInArray!39 (array!537 array!535 (_ BitVec 32) (_ BitVec 32) V!579 V!579 (_ BitVec 64) Int) Unit!111)

(assert (=> b!6514 (= lt!1230 (lemmaKeyInListMapIsInArray!39 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!6515 () Bool)

(declare-fun e!3584 () Bool)

(assert (=> b!6515 (= e!3585 (and e!3584 mapRes!422))))

(declare-fun condMapEmpty!422 () Bool)

(declare-fun mapDefault!422 () ValueCell!134)

