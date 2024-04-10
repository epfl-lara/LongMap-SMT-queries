; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33670 () Bool)

(assert start!33670)

(declare-fun b_free!6905 () Bool)

(declare-fun b_next!6905 () Bool)

(assert (=> start!33670 (= b_free!6905 (not b_next!6905))))

(declare-fun tp!24218 () Bool)

(declare-fun b_and!14085 () Bool)

(assert (=> start!33670 (= tp!24218 b_and!14085)))

(declare-fun b!334437 () Bool)

(declare-fun e!205299 () Bool)

(declare-fun tp_is_empty!6857 () Bool)

(assert (=> b!334437 (= e!205299 tp_is_empty!6857)))

(declare-fun b!334438 () Bool)

(declare-fun e!205296 () Bool)

(declare-fun e!205298 () Bool)

(assert (=> b!334438 (= e!205296 e!205298)))

(declare-fun res!184373 () Bool)

(assert (=> b!334438 (=> (not res!184373) (not e!205298))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3162 0))(
  ( (MissingZero!3162 (index!14827 (_ BitVec 32))) (Found!3162 (index!14828 (_ BitVec 32))) (Intermediate!3162 (undefined!3974 Bool) (index!14829 (_ BitVec 32)) (x!33320 (_ BitVec 32))) (Undefined!3162) (MissingVacant!3162 (index!14830 (_ BitVec 32))) )
))
(declare-fun lt!159523 () SeekEntryResult!3162)

(declare-datatypes ((array!17307 0))(
  ( (array!17308 (arr!8184 (Array (_ BitVec 32) (_ BitVec 64))) (size!8536 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17307)

(assert (=> b!334438 (= res!184373 (and (is-Found!3162 lt!159523) (= (select (arr!8184 _keys!1895) (index!14828 lt!159523)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17307 (_ BitVec 32)) SeekEntryResult!3162)

(assert (=> b!334438 (= lt!159523 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun res!184378 () Bool)

(assert (=> start!33670 (=> (not res!184378) (not e!205296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33670 (= res!184378 (validMask!0 mask!2385))))

(assert (=> start!33670 e!205296))

(assert (=> start!33670 true))

(assert (=> start!33670 tp_is_empty!6857))

(assert (=> start!33670 tp!24218))

(declare-datatypes ((V!10119 0))(
  ( (V!10120 (val!3473 Int)) )
))
(declare-datatypes ((ValueCell!3085 0))(
  ( (ValueCellFull!3085 (v!5635 V!10119)) (EmptyCell!3085) )
))
(declare-datatypes ((array!17309 0))(
  ( (array!17310 (arr!8185 (Array (_ BitVec 32) ValueCell!3085)) (size!8537 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17309)

(declare-fun e!205295 () Bool)

(declare-fun array_inv!6084 (array!17309) Bool)

(assert (=> start!33670 (and (array_inv!6084 _values!1525) e!205295)))

(declare-fun array_inv!6085 (array!17307) Bool)

(assert (=> start!33670 (array_inv!6085 _keys!1895)))

(declare-fun mapNonEmpty!11682 () Bool)

(declare-fun mapRes!11682 () Bool)

(declare-fun tp!24219 () Bool)

(assert (=> mapNonEmpty!11682 (= mapRes!11682 (and tp!24219 e!205299))))

(declare-fun mapKey!11682 () (_ BitVec 32))

(declare-fun mapRest!11682 () (Array (_ BitVec 32) ValueCell!3085))

(declare-fun mapValue!11682 () ValueCell!3085)

(assert (=> mapNonEmpty!11682 (= (arr!8185 _values!1525) (store mapRest!11682 mapKey!11682 mapValue!11682))))

(declare-fun b!334439 () Bool)

(declare-fun res!184372 () Bool)

(assert (=> b!334439 (=> (not res!184372) (not e!205296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334439 (= res!184372 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!11682 () Bool)

(assert (=> mapIsEmpty!11682 mapRes!11682))

(declare-fun b!334440 () Bool)

(declare-fun res!184375 () Bool)

(assert (=> b!334440 (=> (not res!184375) (not e!205296))))

(declare-datatypes ((List!4665 0))(
  ( (Nil!4662) (Cons!4661 (h!5517 (_ BitVec 64)) (t!9753 List!4665)) )
))
(declare-fun arrayNoDuplicates!0 (array!17307 (_ BitVec 32) List!4665) Bool)

(assert (=> b!334440 (= res!184375 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4662))))

(declare-fun b!334441 () Bool)

(declare-fun e!205297 () Bool)

(assert (=> b!334441 (= e!205295 (and e!205297 mapRes!11682))))

(declare-fun condMapEmpty!11682 () Bool)

(declare-fun mapDefault!11682 () ValueCell!3085)

