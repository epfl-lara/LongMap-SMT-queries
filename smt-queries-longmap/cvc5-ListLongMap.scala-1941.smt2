; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34340 () Bool)

(assert start!34340)

(declare-fun b_free!7315 () Bool)

(declare-fun b_next!7315 () Bool)

(assert (=> start!34340 (= b_free!7315 (not b_next!7315))))

(declare-fun tp!25485 () Bool)

(declare-fun b_and!14519 () Bool)

(assert (=> start!34340 (= tp!25485 b_and!14519)))

(declare-fun b!342911 () Bool)

(declare-fun e!210269 () Bool)

(declare-fun tp_is_empty!7267 () Bool)

(assert (=> b!342911 (= e!210269 tp_is_empty!7267)))

(declare-fun res!189563 () Bool)

(declare-fun e!210270 () Bool)

(assert (=> start!34340 (=> (not res!189563) (not e!210270))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34340 (= res!189563 (validMask!0 mask!2385))))

(assert (=> start!34340 e!210270))

(assert (=> start!34340 true))

(assert (=> start!34340 tp_is_empty!7267))

(assert (=> start!34340 tp!25485))

(declare-datatypes ((V!10667 0))(
  ( (V!10668 (val!3678 Int)) )
))
(declare-datatypes ((ValueCell!3290 0))(
  ( (ValueCellFull!3290 (v!5852 V!10667)) (EmptyCell!3290) )
))
(declare-datatypes ((array!18125 0))(
  ( (array!18126 (arr!8581 (Array (_ BitVec 32) ValueCell!3290)) (size!8933 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18125)

(declare-fun e!210271 () Bool)

(declare-fun array_inv!6354 (array!18125) Bool)

(assert (=> start!34340 (and (array_inv!6354 _values!1525) e!210271)))

(declare-datatypes ((array!18127 0))(
  ( (array!18128 (arr!8582 (Array (_ BitVec 32) (_ BitVec 64))) (size!8934 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18127)

(declare-fun array_inv!6355 (array!18127) Bool)

(assert (=> start!34340 (array_inv!6355 _keys!1895)))

(declare-fun b!342912 () Bool)

(declare-fun res!189569 () Bool)

(assert (=> b!342912 (=> (not res!189569) (not e!210270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18127 (_ BitVec 32)) Bool)

(assert (=> b!342912 (= res!189569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342913 () Bool)

(declare-fun e!210273 () Bool)

(assert (=> b!342913 (= e!210273 false)))

(declare-datatypes ((Unit!10697 0))(
  ( (Unit!10698) )
))
(declare-fun lt!162277 () Unit!10697)

(declare-fun e!210272 () Unit!10697)

(assert (=> b!342913 (= lt!162277 e!210272)))

(declare-fun c!52854 () Bool)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342913 (= c!52854 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!342914 () Bool)

(declare-fun res!189566 () Bool)

(assert (=> b!342914 (=> (not res!189566) (not e!210270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342914 (= res!189566 (validKeyInArray!0 k!1348))))

(declare-fun b!342915 () Bool)

(declare-fun Unit!10699 () Unit!10697)

(assert (=> b!342915 (= e!210272 Unit!10699)))

(declare-fun b!342916 () Bool)

(assert (=> b!342916 (= e!210270 e!210273)))

(declare-fun res!189568 () Bool)

(assert (=> b!342916 (=> (not res!189568) (not e!210273))))

(declare-datatypes ((SeekEntryResult!3310 0))(
  ( (MissingZero!3310 (index!15419 (_ BitVec 32))) (Found!3310 (index!15420 (_ BitVec 32))) (Intermediate!3310 (undefined!4122 Bool) (index!15421 (_ BitVec 32)) (x!34140 (_ BitVec 32))) (Undefined!3310) (MissingVacant!3310 (index!15422 (_ BitVec 32))) )
))
(declare-fun lt!162276 () SeekEntryResult!3310)

(assert (=> b!342916 (= res!189568 (and (not (is-Found!3310 lt!162276)) (not (is-MissingZero!3310 lt!162276)) (is-MissingVacant!3310 lt!162276)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18127 (_ BitVec 32)) SeekEntryResult!3310)

(assert (=> b!342916 (= lt!162276 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12333 () Bool)

(declare-fun mapRes!12333 () Bool)

(assert (=> mapIsEmpty!12333 mapRes!12333))

(declare-fun b!342917 () Bool)

(declare-fun res!189565 () Bool)

(assert (=> b!342917 (=> (not res!189565) (not e!210270))))

(declare-fun zeroValue!1467 () V!10667)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10667)

(declare-datatypes ((tuple2!5328 0))(
  ( (tuple2!5329 (_1!2675 (_ BitVec 64)) (_2!2675 V!10667)) )
))
(declare-datatypes ((List!4948 0))(
  ( (Nil!4945) (Cons!4944 (h!5800 tuple2!5328) (t!10060 List!4948)) )
))
(declare-datatypes ((ListLongMap!4241 0))(
  ( (ListLongMap!4242 (toList!2136 List!4948)) )
))
(declare-fun contains!2192 (ListLongMap!4241 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1657 (array!18127 array!18125 (_ BitVec 32) (_ BitVec 32) V!10667 V!10667 (_ BitVec 32) Int) ListLongMap!4241)

(assert (=> b!342917 (= res!189565 (not (contains!2192 (getCurrentListMap!1657 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun mapNonEmpty!12333 () Bool)

(declare-fun tp!25484 () Bool)

(declare-fun e!210268 () Bool)

(assert (=> mapNonEmpty!12333 (= mapRes!12333 (and tp!25484 e!210268))))

(declare-fun mapKey!12333 () (_ BitVec 32))

(declare-fun mapRest!12333 () (Array (_ BitVec 32) ValueCell!3290))

(declare-fun mapValue!12333 () ValueCell!3290)

(assert (=> mapNonEmpty!12333 (= (arr!8581 _values!1525) (store mapRest!12333 mapKey!12333 mapValue!12333))))

(declare-fun b!342918 () Bool)

(assert (=> b!342918 (= e!210271 (and e!210269 mapRes!12333))))

(declare-fun condMapEmpty!12333 () Bool)

(declare-fun mapDefault!12333 () ValueCell!3290)

