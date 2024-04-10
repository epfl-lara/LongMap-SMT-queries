; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104534 () Bool)

(assert start!104534)

(declare-fun mapIsEmpty!48700 () Bool)

(declare-fun mapRes!48700 () Bool)

(assert (=> mapIsEmpty!48700 mapRes!48700))

(declare-fun b!1247001 () Bool)

(declare-fun e!707323 () Bool)

(declare-fun tp_is_empty!31307 () Bool)

(assert (=> b!1247001 (= e!707323 tp_is_empty!31307)))

(declare-fun mapNonEmpty!48700 () Bool)

(declare-fun tp!92801 () Bool)

(declare-fun e!707327 () Bool)

(assert (=> mapNonEmpty!48700 (= mapRes!48700 (and tp!92801 e!707327))))

(declare-datatypes ((V!47107 0))(
  ( (V!47108 (val!15716 Int)) )
))
(declare-datatypes ((ValueCell!14890 0))(
  ( (ValueCellFull!14890 (v!18411 V!47107)) (EmptyCell!14890) )
))
(declare-fun mapValue!48700 () ValueCell!14890)

(declare-datatypes ((array!80304 0))(
  ( (array!80305 (arr!38726 (Array (_ BitVec 32) ValueCell!14890)) (size!39262 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80304)

(declare-fun mapKey!48700 () (_ BitVec 32))

(declare-fun mapRest!48700 () (Array (_ BitVec 32) ValueCell!14890))

(assert (=> mapNonEmpty!48700 (= (arr!38726 _values!914) (store mapRest!48700 mapKey!48700 mapValue!48700))))

(declare-fun b!1247002 () Bool)

(declare-fun e!707324 () Bool)

(assert (=> b!1247002 (= e!707324 (and e!707323 mapRes!48700))))

(declare-fun condMapEmpty!48700 () Bool)

(declare-fun mapDefault!48700 () ValueCell!14890)

