; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83184 () Bool)

(assert start!83184)

(declare-fun b_free!19177 () Bool)

(declare-fun b_next!19177 () Bool)

(assert (=> start!83184 (= b_free!19177 (not b_next!19177))))

(declare-fun tp!66809 () Bool)

(declare-fun b_and!30665 () Bool)

(assert (=> start!83184 (= tp!66809 b_and!30665)))

(declare-fun b!970493 () Bool)

(declare-fun res!649564 () Bool)

(declare-fun e!547128 () Bool)

(assert (=> b!970493 (=> (not res!649564) (not e!547128))))

(declare-datatypes ((array!60205 0))(
  ( (array!60206 (arr!28966 (Array (_ BitVec 32) (_ BitVec 64))) (size!29445 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60205)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!970493 (= res!649564 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29445 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29445 _keys!1717))))))

(declare-fun b!970494 () Bool)

(declare-fun res!649569 () Bool)

(assert (=> b!970494 (=> (not res!649569) (not e!547128))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60205 (_ BitVec 32)) Bool)

(assert (=> b!970494 (= res!649569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970495 () Bool)

(declare-fun e!547126 () Bool)

(declare-fun tp_is_empty!22075 () Bool)

(assert (=> b!970495 (= e!547126 tp_is_empty!22075)))

(declare-fun b!970496 () Bool)

(declare-fun e!547125 () Bool)

(declare-fun mapRes!35122 () Bool)

(assert (=> b!970496 (= e!547125 (and e!547126 mapRes!35122))))

(declare-fun condMapEmpty!35122 () Bool)

(declare-datatypes ((V!34417 0))(
  ( (V!34418 (val!11088 Int)) )
))
(declare-datatypes ((ValueCell!10556 0))(
  ( (ValueCellFull!10556 (v!13647 V!34417)) (EmptyCell!10556) )
))
(declare-datatypes ((array!60207 0))(
  ( (array!60208 (arr!28967 (Array (_ BitVec 32) ValueCell!10556)) (size!29446 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60207)

(declare-fun mapDefault!35122 () ValueCell!10556)

