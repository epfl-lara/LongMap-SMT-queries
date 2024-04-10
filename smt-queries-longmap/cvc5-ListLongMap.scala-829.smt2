; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20070 () Bool)

(assert start!20070)

(declare-fun b!196521 () Bool)

(declare-fun e!129445 () Bool)

(declare-fun tp_is_empty!4585 () Bool)

(assert (=> b!196521 (= e!129445 tp_is_empty!4585)))

(declare-fun res!92757 () Bool)

(declare-fun e!129449 () Bool)

(assert (=> start!20070 (=> (not res!92757) (not e!129449))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20070 (= res!92757 (validMask!0 mask!1149))))

(assert (=> start!20070 e!129449))

(assert (=> start!20070 true))

(declare-datatypes ((V!5761 0))(
  ( (V!5762 (val!2337 Int)) )
))
(declare-datatypes ((ValueCell!1949 0))(
  ( (ValueCellFull!1949 (v!4307 V!5761)) (EmptyCell!1949) )
))
(declare-datatypes ((array!8427 0))(
  ( (array!8428 (arr!3964 (Array (_ BitVec 32) ValueCell!1949)) (size!4289 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8427)

(declare-fun e!129448 () Bool)

(declare-fun array_inv!2583 (array!8427) Bool)

(assert (=> start!20070 (and (array_inv!2583 _values!649) e!129448)))

(declare-datatypes ((array!8429 0))(
  ( (array!8430 (arr!3965 (Array (_ BitVec 32) (_ BitVec 64))) (size!4290 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8429)

(declare-fun array_inv!2584 (array!8429) Bool)

(assert (=> start!20070 (array_inv!2584 _keys!825)))

(declare-fun mapIsEmpty!7946 () Bool)

(declare-fun mapRes!7946 () Bool)

(assert (=> mapIsEmpty!7946 mapRes!7946))

(declare-fun b!196522 () Bool)

(assert (=> b!196522 (= e!129449 false)))

(declare-fun lt!97632 () Bool)

(declare-datatypes ((List!2477 0))(
  ( (Nil!2474) (Cons!2473 (h!3115 (_ BitVec 64)) (t!7408 List!2477)) )
))
(declare-fun arrayNoDuplicates!0 (array!8429 (_ BitVec 32) List!2477) Bool)

(assert (=> b!196522 (= lt!97632 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2474))))

(declare-fun mapNonEmpty!7946 () Bool)

(declare-fun tp!17234 () Bool)

(assert (=> mapNonEmpty!7946 (= mapRes!7946 (and tp!17234 e!129445))))

(declare-fun mapKey!7946 () (_ BitVec 32))

(declare-fun mapValue!7946 () ValueCell!1949)

(declare-fun mapRest!7946 () (Array (_ BitVec 32) ValueCell!1949))

(assert (=> mapNonEmpty!7946 (= (arr!3964 _values!649) (store mapRest!7946 mapKey!7946 mapValue!7946))))

(declare-fun b!196523 () Bool)

(declare-fun e!129446 () Bool)

(assert (=> b!196523 (= e!129448 (and e!129446 mapRes!7946))))

(declare-fun condMapEmpty!7946 () Bool)

(declare-fun mapDefault!7946 () ValueCell!1949)

