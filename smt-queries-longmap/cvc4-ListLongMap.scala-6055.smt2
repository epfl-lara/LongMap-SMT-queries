; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78380 () Bool)

(assert start!78380)

(declare-fun b_free!16745 () Bool)

(declare-fun b_next!16745 () Bool)

(assert (=> start!78380 (= b_free!16745 (not b_next!16745))))

(declare-fun tp!58522 () Bool)

(declare-fun b_and!27357 () Bool)

(assert (=> start!78380 (= tp!58522 b_and!27357)))

(declare-fun b!914285 () Bool)

(declare-fun res!616596 () Bool)

(declare-fun e!512897 () Bool)

(assert (=> b!914285 (=> (not res!616596) (not e!512897))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!914285 (= res!616596 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!30483 () Bool)

(declare-fun mapRes!30483 () Bool)

(assert (=> mapIsEmpty!30483 mapRes!30483))

(declare-fun b!914286 () Bool)

(declare-fun res!616594 () Bool)

(declare-fun e!512891 () Bool)

(assert (=> b!914286 (=> (not res!616594) (not e!512891))))

(declare-datatypes ((V!30515 0))(
  ( (V!30516 (val!9632 Int)) )
))
(declare-datatypes ((ValueCell!9100 0))(
  ( (ValueCellFull!9100 (v!12148 V!30515)) (EmptyCell!9100) )
))
(declare-datatypes ((array!54320 0))(
  ( (array!54321 (arr!26111 (Array (_ BitVec 32) ValueCell!9100)) (size!26570 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54320)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!54322 0))(
  ( (array!54323 (arr!26112 (Array (_ BitVec 32) (_ BitVec 64))) (size!26571 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54322)

(assert (=> b!914286 (= res!616594 (and (= (size!26570 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26571 _keys!1386) (size!26570 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!914287 () Bool)

(declare-fun e!512893 () Bool)

(declare-fun tp_is_empty!19163 () Bool)

(assert (=> b!914287 (= e!512893 tp_is_empty!19163)))

(declare-fun res!616601 () Bool)

(assert (=> start!78380 (=> (not res!616601) (not e!512891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78380 (= res!616601 (validMask!0 mask!1756))))

(assert (=> start!78380 e!512891))

(declare-fun e!512896 () Bool)

(declare-fun array_inv!20392 (array!54320) Bool)

(assert (=> start!78380 (and (array_inv!20392 _values!1152) e!512896)))

(assert (=> start!78380 tp!58522))

(assert (=> start!78380 true))

(assert (=> start!78380 tp_is_empty!19163))

(declare-fun array_inv!20393 (array!54322) Bool)

(assert (=> start!78380 (array_inv!20393 _keys!1386)))

(declare-fun b!914288 () Bool)

(declare-fun res!616595 () Bool)

(assert (=> b!914288 (=> (not res!616595) (not e!512891))))

(declare-datatypes ((List!18344 0))(
  ( (Nil!18341) (Cons!18340 (h!19486 (_ BitVec 64)) (t!25949 List!18344)) )
))
(declare-fun arrayNoDuplicates!0 (array!54322 (_ BitVec 32) List!18344) Bool)

(assert (=> b!914288 (= res!616595 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18341))))

(declare-fun b!914289 () Bool)

(declare-fun e!512895 () Bool)

(assert (=> b!914289 (= e!512897 (not e!512895))))

(declare-fun res!616592 () Bool)

(assert (=> b!914289 (=> res!616592 e!512895)))

(assert (=> b!914289 (= res!616592 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26571 _keys!1386))))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!411433 () V!30515)

(declare-fun get!13714 (ValueCell!9100 V!30515) V!30515)

(declare-fun dynLambda!1397 (Int (_ BitVec 64)) V!30515)

(assert (=> b!914289 (= lt!411433 (get!13714 (select (arr!26111 _values!1152) i!717) (dynLambda!1397 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!54322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!914289 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun zeroValue!1094 () V!30515)

(declare-fun minValue!1094 () V!30515)

(declare-datatypes ((Unit!30952 0))(
  ( (Unit!30953) )
))
(declare-fun lt!411434 () Unit!30952)

(declare-fun lemmaKeyInListMapIsInArray!288 (array!54322 array!54320 (_ BitVec 32) (_ BitVec 32) V!30515 V!30515 (_ BitVec 64) Int) Unit!30952)

(assert (=> b!914289 (= lt!411434 (lemmaKeyInListMapIsInArray!288 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!914290 () Bool)

(declare-fun res!616593 () Bool)

(assert (=> b!914290 (=> (not res!616593) (not e!512897))))

(assert (=> b!914290 (= res!616593 (and (= (select (arr!26112 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!914291 () Bool)

(assert (=> b!914291 (= e!512891 e!512897)))

(declare-fun res!616598 () Bool)

(assert (=> b!914291 (=> (not res!616598) (not e!512897))))

(declare-datatypes ((tuple2!12556 0))(
  ( (tuple2!12557 (_1!6289 (_ BitVec 64)) (_2!6289 V!30515)) )
))
(declare-datatypes ((List!18345 0))(
  ( (Nil!18342) (Cons!18341 (h!19487 tuple2!12556) (t!25950 List!18345)) )
))
(declare-datatypes ((ListLongMap!11253 0))(
  ( (ListLongMap!11254 (toList!5642 List!18345)) )
))
(declare-fun lt!411435 () ListLongMap!11253)

(declare-fun contains!4692 (ListLongMap!11253 (_ BitVec 64)) Bool)

(assert (=> b!914291 (= res!616598 (contains!4692 lt!411435 k!1033))))

(declare-fun getCurrentListMap!2903 (array!54322 array!54320 (_ BitVec 32) (_ BitVec 32) V!30515 V!30515 (_ BitVec 32) Int) ListLongMap!11253)

(assert (=> b!914291 (= lt!411435 (getCurrentListMap!2903 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!914292 () Bool)

(declare-fun res!616599 () Bool)

(declare-fun e!512890 () Bool)

(assert (=> b!914292 (=> res!616599 e!512890)))

(declare-fun lt!411432 () ListLongMap!11253)

(declare-fun apply!520 (ListLongMap!11253 (_ BitVec 64)) V!30515)

(assert (=> b!914292 (= res!616599 (not (= (apply!520 lt!411432 k!1033) lt!411433)))))

(declare-fun mapNonEmpty!30483 () Bool)

(declare-fun tp!58523 () Bool)

(assert (=> mapNonEmpty!30483 (= mapRes!30483 (and tp!58523 e!512893))))

(declare-fun mapKey!30483 () (_ BitVec 32))

(declare-fun mapValue!30483 () ValueCell!9100)

(declare-fun mapRest!30483 () (Array (_ BitVec 32) ValueCell!9100))

(assert (=> mapNonEmpty!30483 (= (arr!26111 _values!1152) (store mapRest!30483 mapKey!30483 mapValue!30483))))

(declare-fun b!914293 () Bool)

(declare-fun res!616597 () Bool)

(assert (=> b!914293 (=> (not res!616597) (not e!512891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54322 (_ BitVec 32)) Bool)

(assert (=> b!914293 (= res!616597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!914294 () Bool)

(declare-fun e!512894 () Bool)

(assert (=> b!914294 (= e!512894 tp_is_empty!19163)))

(declare-fun b!914295 () Bool)

(assert (=> b!914295 (= e!512890 (bvslt i!717 (size!26570 _values!1152)))))

(assert (=> b!914295 (= (apply!520 lt!411435 k!1033) lt!411433)))

(declare-fun lt!411431 () Unit!30952)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!63 (array!54322 array!54320 (_ BitVec 32) (_ BitVec 32) V!30515 V!30515 (_ BitVec 64) V!30515 (_ BitVec 32) Int) Unit!30952)

(assert (=> b!914295 (= lt!411431 (lemmaListMapApplyFromThenApplyFromZero!63 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!411433 i!717 defaultEntry!1160))))

(declare-fun b!914296 () Bool)

(assert (=> b!914296 (= e!512896 (and e!512894 mapRes!30483))))

(declare-fun condMapEmpty!30483 () Bool)

(declare-fun mapDefault!30483 () ValueCell!9100)

