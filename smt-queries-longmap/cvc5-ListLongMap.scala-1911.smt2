; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34030 () Bool)

(assert start!34030)

(declare-fun b_free!7135 () Bool)

(declare-fun b_next!7135 () Bool)

(assert (=> start!34030 (= b_free!7135 (not b_next!7135))))

(declare-fun tp!24926 () Bool)

(declare-fun b_and!14327 () Bool)

(assert (=> start!34030 (= tp!24926 b_and!14327)))

(declare-fun b!339069 () Bool)

(declare-fun e!208035 () Bool)

(declare-datatypes ((array!17771 0))(
  ( (array!17772 (arr!8410 (Array (_ BitVec 32) (_ BitVec 64))) (size!8762 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17771)

(declare-datatypes ((SeekEntryResult!3249 0))(
  ( (MissingZero!3249 (index!15175 (_ BitVec 32))) (Found!3249 (index!15176 (_ BitVec 32))) (Intermediate!3249 (undefined!4061 Bool) (index!15177 (_ BitVec 32)) (x!33779 (_ BitVec 32))) (Undefined!3249) (MissingVacant!3249 (index!15178 (_ BitVec 32))) )
))
(declare-fun lt!161044 () SeekEntryResult!3249)

(assert (=> b!339069 (= e!208035 (and (= (select (arr!8410 _keys!1895) (index!15175 lt!161044)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8762 _keys!1895)) (bvsge (size!8762 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!339070 () Bool)

(declare-fun e!208031 () Bool)

(assert (=> b!339070 (= e!208031 e!208035)))

(declare-fun res!187301 () Bool)

(assert (=> b!339070 (=> (not res!187301) (not e!208035))))

(declare-fun lt!161046 () Bool)

(assert (=> b!339070 (= res!187301 (not lt!161046))))

(declare-datatypes ((Unit!10550 0))(
  ( (Unit!10551) )
))
(declare-fun lt!161047 () Unit!10550)

(declare-fun e!208032 () Unit!10550)

(assert (=> b!339070 (= lt!161047 e!208032)))

(declare-fun c!52503 () Bool)

(assert (=> b!339070 (= c!52503 lt!161046)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339070 (= lt!161046 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!339071 () Bool)

(declare-fun res!187293 () Bool)

(declare-fun e!208036 () Bool)

(assert (=> b!339071 (=> (not res!187293) (not e!208036))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17771 (_ BitVec 32)) Bool)

(assert (=> b!339071 (= res!187293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339072 () Bool)

(declare-fun res!187299 () Bool)

(assert (=> b!339072 (=> (not res!187299) (not e!208036))))

(declare-datatypes ((V!10427 0))(
  ( (V!10428 (val!3588 Int)) )
))
(declare-datatypes ((ValueCell!3200 0))(
  ( (ValueCellFull!3200 (v!5756 V!10427)) (EmptyCell!3200) )
))
(declare-datatypes ((array!17773 0))(
  ( (array!17774 (arr!8411 (Array (_ BitVec 32) ValueCell!3200)) (size!8763 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17773)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339072 (= res!187299 (and (= (size!8763 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8762 _keys!1895) (size!8763 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339073 () Bool)

(declare-fun res!187300 () Bool)

(assert (=> b!339073 (=> (not res!187300) (not e!208036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339073 (= res!187300 (validKeyInArray!0 k!1348))))

(declare-fun b!339075 () Bool)

(declare-fun res!187297 () Bool)

(assert (=> b!339075 (=> (not res!187297) (not e!208035))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!339075 (= res!187297 (inRange!0 (index!15175 lt!161044) mask!2385))))

(declare-fun b!339076 () Bool)

(declare-fun Unit!10552 () Unit!10550)

(assert (=> b!339076 (= e!208032 Unit!10552)))

(declare-fun zeroValue!1467 () V!10427)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10427)

(declare-fun lt!161045 () Unit!10550)

(declare-fun lemmaArrayContainsKeyThenInListMap!281 (array!17771 array!17773 (_ BitVec 32) (_ BitVec 32) V!10427 V!10427 (_ BitVec 64) (_ BitVec 32) Int) Unit!10550)

(declare-fun arrayScanForKey!0 (array!17771 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339076 (= lt!161045 (lemmaArrayContainsKeyThenInListMap!281 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339076 false))

(declare-fun b!339077 () Bool)

(declare-fun e!208037 () Bool)

(declare-fun e!208034 () Bool)

(declare-fun mapRes!12045 () Bool)

(assert (=> b!339077 (= e!208037 (and e!208034 mapRes!12045))))

(declare-fun condMapEmpty!12045 () Bool)

(declare-fun mapDefault!12045 () ValueCell!3200)

