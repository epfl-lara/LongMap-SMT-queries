; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34308 () Bool)

(assert start!34308)

(declare-fun b_free!7283 () Bool)

(declare-fun b_next!7283 () Bool)

(assert (=> start!34308 (= b_free!7283 (not b_next!7283))))

(declare-fun tp!25389 () Bool)

(declare-fun b_and!14487 () Bool)

(assert (=> start!34308 (= tp!25389 b_and!14487)))

(declare-fun mapNonEmpty!12285 () Bool)

(declare-fun mapRes!12285 () Bool)

(declare-fun tp!25388 () Bool)

(declare-fun e!209936 () Bool)

(assert (=> mapNonEmpty!12285 (= mapRes!12285 (and tp!25388 e!209936))))

(declare-fun mapKey!12285 () (_ BitVec 32))

(declare-datatypes ((V!10623 0))(
  ( (V!10624 (val!3662 Int)) )
))
(declare-datatypes ((ValueCell!3274 0))(
  ( (ValueCellFull!3274 (v!5836 V!10623)) (EmptyCell!3274) )
))
(declare-datatypes ((array!18067 0))(
  ( (array!18068 (arr!8552 (Array (_ BitVec 32) ValueCell!3274)) (size!8904 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18067)

(declare-fun mapValue!12285 () ValueCell!3274)

(declare-fun mapRest!12285 () (Array (_ BitVec 32) ValueCell!3274))

(assert (=> mapNonEmpty!12285 (= (arr!8552 _values!1525) (store mapRest!12285 mapKey!12285 mapValue!12285))))

(declare-fun b!342335 () Bool)

(declare-datatypes ((Unit!10653 0))(
  ( (Unit!10654) )
))
(declare-fun e!209932 () Unit!10653)

(declare-fun Unit!10655 () Unit!10653)

(assert (=> b!342335 (= e!209932 Unit!10655)))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10623)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18069 0))(
  ( (array!18070 (arr!8553 (Array (_ BitVec 32) (_ BitVec 64))) (size!8905 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18069)

(declare-fun lt!162122 () Unit!10653)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10623)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun lemmaArrayContainsKeyThenInListMap!300 (array!18069 array!18067 (_ BitVec 32) (_ BitVec 32) V!10623 V!10623 (_ BitVec 64) (_ BitVec 32) Int) Unit!10653)

(declare-fun arrayScanForKey!0 (array!18069 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342335 (= lt!162122 (lemmaArrayContainsKeyThenInListMap!300 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342335 false))

(declare-fun mapIsEmpty!12285 () Bool)

(assert (=> mapIsEmpty!12285 mapRes!12285))

(declare-fun res!189227 () Bool)

(declare-fun e!209931 () Bool)

(assert (=> start!34308 (=> (not res!189227) (not e!209931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34308 (= res!189227 (validMask!0 mask!2385))))

(assert (=> start!34308 e!209931))

(assert (=> start!34308 true))

(declare-fun tp_is_empty!7235 () Bool)

(assert (=> start!34308 tp_is_empty!7235))

(assert (=> start!34308 tp!25389))

(declare-fun e!209934 () Bool)

(declare-fun array_inv!6334 (array!18067) Bool)

(assert (=> start!34308 (and (array_inv!6334 _values!1525) e!209934)))

(declare-fun array_inv!6335 (array!18069) Bool)

(assert (=> start!34308 (array_inv!6335 _keys!1895)))

(declare-fun b!342336 () Bool)

(declare-fun res!189232 () Bool)

(assert (=> b!342336 (=> (not res!189232) (not e!209931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342336 (= res!189232 (validKeyInArray!0 k!1348))))

(declare-fun b!342337 () Bool)

(declare-fun res!189229 () Bool)

(assert (=> b!342337 (=> (not res!189229) (not e!209931))))

(declare-datatypes ((tuple2!5310 0))(
  ( (tuple2!5311 (_1!2666 (_ BitVec 64)) (_2!2666 V!10623)) )
))
(declare-datatypes ((List!4927 0))(
  ( (Nil!4924) (Cons!4923 (h!5779 tuple2!5310) (t!10039 List!4927)) )
))
(declare-datatypes ((ListLongMap!4223 0))(
  ( (ListLongMap!4224 (toList!2127 List!4927)) )
))
(declare-fun contains!2183 (ListLongMap!4223 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1648 (array!18069 array!18067 (_ BitVec 32) (_ BitVec 32) V!10623 V!10623 (_ BitVec 32) Int) ListLongMap!4223)

(assert (=> b!342337 (= res!189229 (not (contains!2183 (getCurrentListMap!1648 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!342338 () Bool)

(declare-fun res!189230 () Bool)

(assert (=> b!342338 (=> (not res!189230) (not e!209931))))

(declare-datatypes ((List!4928 0))(
  ( (Nil!4925) (Cons!4924 (h!5780 (_ BitVec 64)) (t!10040 List!4928)) )
))
(declare-fun arrayNoDuplicates!0 (array!18069 (_ BitVec 32) List!4928) Bool)

(assert (=> b!342338 (= res!189230 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4925))))

(declare-fun b!342339 () Bool)

(declare-fun e!209935 () Bool)

(assert (=> b!342339 (= e!209935 tp_is_empty!7235)))

(declare-fun b!342340 () Bool)

(declare-fun Unit!10656 () Unit!10653)

(assert (=> b!342340 (= e!209932 Unit!10656)))

(declare-fun b!342341 () Bool)

(declare-fun res!189233 () Bool)

(assert (=> b!342341 (=> (not res!189233) (not e!209931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18069 (_ BitVec 32)) Bool)

(assert (=> b!342341 (= res!189233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342342 () Bool)

(declare-fun e!209937 () Bool)

(assert (=> b!342342 (= e!209931 e!209937)))

(declare-fun res!189231 () Bool)

(assert (=> b!342342 (=> (not res!189231) (not e!209937))))

(declare-datatypes ((SeekEntryResult!3301 0))(
  ( (MissingZero!3301 (index!15383 (_ BitVec 32))) (Found!3301 (index!15384 (_ BitVec 32))) (Intermediate!3301 (undefined!4113 Bool) (index!15385 (_ BitVec 32)) (x!34083 (_ BitVec 32))) (Undefined!3301) (MissingVacant!3301 (index!15386 (_ BitVec 32))) )
))
(declare-fun lt!162124 () SeekEntryResult!3301)

(assert (=> b!342342 (= res!189231 (and (not (is-Found!3301 lt!162124)) (not (is-MissingZero!3301 lt!162124)) (is-MissingVacant!3301 lt!162124)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18069 (_ BitVec 32)) SeekEntryResult!3301)

(assert (=> b!342342 (= lt!162124 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!342343 () Bool)

(assert (=> b!342343 (= e!209937 false)))

(declare-fun lt!162123 () Unit!10653)

(assert (=> b!342343 (= lt!162123 e!209932)))

(declare-fun c!52806 () Bool)

(declare-fun arrayContainsKey!0 (array!18069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342343 (= c!52806 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!342344 () Bool)

(assert (=> b!342344 (= e!209934 (and e!209935 mapRes!12285))))

(declare-fun condMapEmpty!12285 () Bool)

(declare-fun mapDefault!12285 () ValueCell!3274)

