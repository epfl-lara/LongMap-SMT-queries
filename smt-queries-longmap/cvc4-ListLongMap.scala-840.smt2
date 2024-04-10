; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20140 () Bool)

(assert start!20140)

(declare-fun b_free!4799 () Bool)

(declare-fun b_next!4799 () Bool)

(assert (=> start!20140 (= b_free!4799 (not b_next!4799))))

(declare-fun tp!17428 () Bool)

(declare-fun b_and!11545 () Bool)

(assert (=> start!20140 (= tp!17428 b_and!11545)))

(declare-fun b!197534 () Bool)

(declare-fun res!93454 () Bool)

(declare-fun e!129972 () Bool)

(assert (=> b!197534 (=> (not res!93454) (not e!129972))))

(declare-datatypes ((array!8563 0))(
  ( (array!8564 (arr!4032 (Array (_ BitVec 32) (_ BitVec 64))) (size!4357 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8563)

(declare-datatypes ((V!5853 0))(
  ( (V!5854 (val!2372 Int)) )
))
(declare-datatypes ((ValueCell!1984 0))(
  ( (ValueCellFull!1984 (v!4342 V!5853)) (EmptyCell!1984) )
))
(declare-datatypes ((array!8565 0))(
  ( (array!8566 (arr!4033 (Array (_ BitVec 32) ValueCell!1984)) (size!4358 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8565)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197534 (= res!93454 (and (= (size!4358 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4357 _keys!825) (size!4358 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197535 () Bool)

(declare-fun res!93457 () Bool)

(assert (=> b!197535 (=> (not res!93457) (not e!129972))))

(declare-datatypes ((List!2516 0))(
  ( (Nil!2513) (Cons!2512 (h!3154 (_ BitVec 64)) (t!7447 List!2516)) )
))
(declare-fun arrayNoDuplicates!0 (array!8563 (_ BitVec 32) List!2516) Bool)

(assert (=> b!197535 (= res!93457 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2513))))

(declare-fun mapIsEmpty!8051 () Bool)

(declare-fun mapRes!8051 () Bool)

(assert (=> mapIsEmpty!8051 mapRes!8051))

(declare-fun b!197536 () Bool)

(declare-fun res!93460 () Bool)

(assert (=> b!197536 (=> (not res!93460) (not e!129972))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197536 (= res!93460 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8051 () Bool)

(declare-fun tp!17429 () Bool)

(declare-fun e!129971 () Bool)

(assert (=> mapNonEmpty!8051 (= mapRes!8051 (and tp!17429 e!129971))))

(declare-fun mapRest!8051 () (Array (_ BitVec 32) ValueCell!1984))

(declare-fun mapValue!8051 () ValueCell!1984)

(declare-fun mapKey!8051 () (_ BitVec 32))

(assert (=> mapNonEmpty!8051 (= (arr!4033 _values!649) (store mapRest!8051 mapKey!8051 mapValue!8051))))

(declare-fun b!197537 () Bool)

(declare-fun res!93459 () Bool)

(assert (=> b!197537 (=> (not res!93459) (not e!129972))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197537 (= res!93459 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4357 _keys!825))))))

(declare-fun res!93455 () Bool)

(assert (=> start!20140 (=> (not res!93455) (not e!129972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20140 (= res!93455 (validMask!0 mask!1149))))

(assert (=> start!20140 e!129972))

(declare-fun e!129974 () Bool)

(declare-fun array_inv!2629 (array!8565) Bool)

(assert (=> start!20140 (and (array_inv!2629 _values!649) e!129974)))

(assert (=> start!20140 true))

(declare-fun tp_is_empty!4655 () Bool)

(assert (=> start!20140 tp_is_empty!4655))

(declare-fun array_inv!2630 (array!8563) Bool)

(assert (=> start!20140 (array_inv!2630 _keys!825)))

(assert (=> start!20140 tp!17428))

(declare-fun b!197538 () Bool)

(declare-fun e!129970 () Bool)

(assert (=> b!197538 (= e!129970 tp_is_empty!4655)))

(declare-fun b!197539 () Bool)

(declare-fun res!93458 () Bool)

(assert (=> b!197539 (=> (not res!93458) (not e!129972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8563 (_ BitVec 32)) Bool)

(assert (=> b!197539 (= res!93458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197540 () Bool)

(assert (=> b!197540 (= e!129974 (and e!129970 mapRes!8051))))

(declare-fun condMapEmpty!8051 () Bool)

(declare-fun mapDefault!8051 () ValueCell!1984)

