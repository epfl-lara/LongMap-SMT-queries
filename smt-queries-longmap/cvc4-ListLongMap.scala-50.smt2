; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!816 () Bool)

(assert start!816)

(declare-fun b_free!209 () Bool)

(declare-fun b_next!209 () Bool)

(assert (=> start!816 (= b_free!209 (not b_next!209))))

(declare-fun tp!857 () Bool)

(declare-fun b_and!355 () Bool)

(assert (=> start!816 (= tp!857 b_and!355)))

(declare-fun b!6236 () Bool)

(declare-fun e!3412 () Bool)

(declare-fun e!3415 () Bool)

(assert (=> b!6236 (= e!3412 e!3415)))

(declare-fun res!6697 () Bool)

(assert (=> b!6236 (=> res!6697 e!3415)))

(declare-datatypes ((array!507 0))(
  ( (array!508 (arr!242 (Array (_ BitVec 32) (_ BitVec 64))) (size!304 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!507)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!6236 (= res!6697 (not (= (size!304 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1146 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!507 (_ BitVec 32)) Bool)

(assert (=> b!6236 (arrayForallSeekEntryOrOpenFound!0 lt!1146 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!97 0))(
  ( (Unit!98) )
))
(declare-fun lt!1144 () Unit!97)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!97)

(assert (=> b!6236 (= lt!1144 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1146))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!507 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6236 (= lt!1146 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!401 () Bool)

(declare-fun mapRes!401 () Bool)

(declare-fun tp!856 () Bool)

(declare-fun e!3419 () Bool)

(assert (=> mapNonEmpty!401 (= mapRes!401 (and tp!856 e!3419))))

(declare-datatypes ((V!559 0))(
  ( (V!560 (val!149 Int)) )
))
(declare-datatypes ((ValueCell!127 0))(
  ( (ValueCellFull!127 (v!1240 V!559)) (EmptyCell!127) )
))
(declare-fun mapValue!401 () ValueCell!127)

(declare-fun mapKey!401 () (_ BitVec 32))

(declare-datatypes ((array!509 0))(
  ( (array!510 (arr!243 (Array (_ BitVec 32) ValueCell!127)) (size!305 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!509)

(declare-fun mapRest!401 () (Array (_ BitVec 32) ValueCell!127))

(assert (=> mapNonEmpty!401 (= (arr!243 _values!1492) (store mapRest!401 mapKey!401 mapValue!401))))

(declare-fun b!6237 () Bool)

(declare-fun res!6695 () Bool)

(declare-fun e!3416 () Bool)

(assert (=> b!6237 (=> (not res!6695) (not e!3416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6237 (= res!6695 (validKeyInArray!0 k!1278))))

(declare-fun mapIsEmpty!401 () Bool)

(assert (=> mapIsEmpty!401 mapRes!401))

(declare-fun b!6238 () Bool)

(declare-fun e!3414 () Bool)

(declare-fun tp_is_empty!287 () Bool)

(assert (=> b!6238 (= e!3414 tp_is_empty!287)))

(declare-fun b!6239 () Bool)

(declare-fun res!6693 () Bool)

(assert (=> b!6239 (=> (not res!6693) (not e!3416))))

(declare-datatypes ((List!162 0))(
  ( (Nil!159) (Cons!158 (h!724 (_ BitVec 64)) (t!2297 List!162)) )
))
(declare-fun arrayNoDuplicates!0 (array!507 (_ BitVec 32) List!162) Bool)

(assert (=> b!6239 (= res!6693 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!159))))

(declare-fun b!6240 () Bool)

(declare-fun e!3418 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6240 (= e!3418 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6241 () Bool)

(assert (=> b!6241 (= e!3416 (not e!3412))))

(declare-fun res!6698 () Bool)

(assert (=> b!6241 (=> res!6698 e!3412)))

(declare-fun arrayContainsKey!0 (array!507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6241 (= res!6698 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6241 e!3418))

(declare-fun c!446 () Bool)

(assert (=> b!6241 (= c!446 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1145 () Unit!97)

(declare-fun defaultEntry!1495 () Int)

(declare-fun zeroValue!1434 () V!559)

(declare-fun minValue!1434 () V!559)

(declare-fun lemmaKeyInListMapIsInArray!34 (array!507 array!509 (_ BitVec 32) (_ BitVec 32) V!559 V!559 (_ BitVec 64) Int) Unit!97)

(assert (=> b!6241 (= lt!1145 (lemmaKeyInListMapIsInArray!34 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun res!6700 () Bool)

(assert (=> start!816 (=> (not res!6700) (not e!3416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!816 (= res!6700 (validMask!0 mask!2250))))

(assert (=> start!816 e!3416))

(assert (=> start!816 tp!857))

(assert (=> start!816 true))

(declare-fun e!3413 () Bool)

(declare-fun array_inv!175 (array!509) Bool)

(assert (=> start!816 (and (array_inv!175 _values!1492) e!3413)))

(assert (=> start!816 tp_is_empty!287))

(declare-fun array_inv!176 (array!507) Bool)

(assert (=> start!816 (array_inv!176 _keys!1806)))

(declare-fun b!6242 () Bool)

(assert (=> b!6242 (= e!3413 (and e!3414 mapRes!401))))

(declare-fun condMapEmpty!401 () Bool)

(declare-fun mapDefault!401 () ValueCell!127)

