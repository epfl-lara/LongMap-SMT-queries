; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84238 () Bool)

(assert start!84238)

(declare-fun b_free!19939 () Bool)

(declare-fun b_next!19939 () Bool)

(assert (=> start!84238 (= b_free!19939 (not b_next!19939))))

(declare-fun tp!69420 () Bool)

(declare-fun b_and!31955 () Bool)

(assert (=> start!84238 (= tp!69420 b_and!31955)))

(declare-fun mapIsEmpty!36590 () Bool)

(declare-fun mapRes!36590 () Bool)

(assert (=> mapIsEmpty!36590 mapRes!36590))

(declare-fun b!985472 () Bool)

(declare-fun e!555494 () Bool)

(declare-fun tp_is_empty!23041 () Bool)

(assert (=> b!985472 (= e!555494 tp_is_empty!23041)))

(declare-fun res!659447 () Bool)

(declare-fun e!555496 () Bool)

(assert (=> start!84238 (=> (not res!659447) (not e!555496))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84238 (= res!659447 (validMask!0 mask!1948))))

(assert (=> start!84238 e!555496))

(assert (=> start!84238 true))

(assert (=> start!84238 tp_is_empty!23041))

(declare-datatypes ((V!35705 0))(
  ( (V!35706 (val!11571 Int)) )
))
(declare-datatypes ((ValueCell!11039 0))(
  ( (ValueCellFull!11039 (v!14133 V!35705)) (EmptyCell!11039) )
))
(declare-datatypes ((array!62057 0))(
  ( (array!62058 (arr!29886 (Array (_ BitVec 32) ValueCell!11039)) (size!30365 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62057)

(declare-fun e!555493 () Bool)

(declare-fun array_inv!23101 (array!62057) Bool)

(assert (=> start!84238 (and (array_inv!23101 _values!1278) e!555493)))

(assert (=> start!84238 tp!69420))

(declare-datatypes ((array!62059 0))(
  ( (array!62060 (arr!29887 (Array (_ BitVec 32) (_ BitVec 64))) (size!30366 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62059)

(declare-fun array_inv!23102 (array!62059) Bool)

(assert (=> start!84238 (array_inv!23102 _keys!1544)))

(declare-fun b!985473 () Bool)

(declare-fun res!659442 () Bool)

(assert (=> b!985473 (=> (not res!659442) (not e!555496))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985473 (= res!659442 (validKeyInArray!0 (select (arr!29887 _keys!1544) from!1932)))))

(declare-fun b!985474 () Bool)

(declare-fun res!659444 () Bool)

(assert (=> b!985474 (=> (not res!659444) (not e!555496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62059 (_ BitVec 32)) Bool)

(assert (=> b!985474 (= res!659444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985475 () Bool)

(declare-fun e!555497 () Bool)

(assert (=> b!985475 (= e!555496 e!555497)))

(declare-fun res!659446 () Bool)

(assert (=> b!985475 (=> (not res!659446) (not e!555497))))

(assert (=> b!985475 (= res!659446 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29887 _keys!1544) from!1932))))))

(declare-fun lt!437257 () V!35705)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15514 (ValueCell!11039 V!35705) V!35705)

(declare-fun dynLambda!1839 (Int (_ BitVec 64)) V!35705)

(assert (=> b!985475 (= lt!437257 (get!15514 (select (arr!29886 _values!1278) from!1932) (dynLambda!1839 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35705)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35705)

(declare-datatypes ((tuple2!14808 0))(
  ( (tuple2!14809 (_1!7415 (_ BitVec 64)) (_2!7415 V!35705)) )
))
(declare-datatypes ((List!20699 0))(
  ( (Nil!20696) (Cons!20695 (h!21857 tuple2!14808) (t!29582 List!20699)) )
))
(declare-datatypes ((ListLongMap!13505 0))(
  ( (ListLongMap!13506 (toList!6768 List!20699)) )
))
(declare-fun lt!437259 () ListLongMap!13505)

(declare-fun getCurrentListMapNoExtraKeys!3459 (array!62059 array!62057 (_ BitVec 32) (_ BitVec 32) V!35705 V!35705 (_ BitVec 32) Int) ListLongMap!13505)

(assert (=> b!985475 (= lt!437259 (getCurrentListMapNoExtraKeys!3459 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985476 () Bool)

(declare-fun res!659440 () Bool)

(assert (=> b!985476 (=> (not res!659440) (not e!555496))))

(assert (=> b!985476 (= res!659440 (and (= (size!30365 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30366 _keys!1544) (size!30365 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985477 () Bool)

(declare-fun res!659441 () Bool)

(assert (=> b!985477 (=> (not res!659441) (not e!555496))))

(assert (=> b!985477 (= res!659441 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30366 _keys!1544))))))

(declare-fun b!985478 () Bool)

(declare-fun e!555498 () Bool)

(assert (=> b!985478 (= e!555498 tp_is_empty!23041)))

(declare-fun b!985479 () Bool)

(declare-fun res!659443 () Bool)

(assert (=> b!985479 (=> (not res!659443) (not e!555496))))

(declare-datatypes ((List!20700 0))(
  ( (Nil!20697) (Cons!20696 (h!21858 (_ BitVec 64)) (t!29583 List!20700)) )
))
(declare-fun arrayNoDuplicates!0 (array!62059 (_ BitVec 32) List!20700) Bool)

(assert (=> b!985479 (= res!659443 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20697))))

(declare-fun b!985480 () Bool)

(assert (=> b!985480 (= e!555493 (and e!555494 mapRes!36590))))

(declare-fun condMapEmpty!36590 () Bool)

(declare-fun mapDefault!36590 () ValueCell!11039)

