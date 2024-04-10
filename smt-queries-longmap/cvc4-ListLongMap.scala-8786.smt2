; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106900 () Bool)

(assert start!106900)

(declare-fun mapNonEmpty!50515 () Bool)

(declare-fun mapRes!50515 () Bool)

(declare-fun tp!96694 () Bool)

(declare-fun e!722487 () Bool)

(assert (=> mapNonEmpty!50515 (= mapRes!50515 (and tp!96694 e!722487))))

(declare-datatypes ((V!48703 0))(
  ( (V!48704 (val!16391 Int)) )
))
(declare-datatypes ((ValueCell!15463 0))(
  ( (ValueCellFull!15463 (v!19027 V!48703)) (EmptyCell!15463) )
))
(declare-datatypes ((array!82532 0))(
  ( (array!82533 (arr!39808 (Array (_ BitVec 32) ValueCell!15463)) (size!40344 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82532)

(declare-fun mapKey!50515 () (_ BitVec 32))

(declare-fun mapRest!50515 () (Array (_ BitVec 32) ValueCell!15463))

(declare-fun mapValue!50515 () ValueCell!15463)

(assert (=> mapNonEmpty!50515 (= (arr!39808 _values!1134) (store mapRest!50515 mapKey!50515 mapValue!50515))))

(declare-fun b!1268053 () Bool)

(declare-fun e!722488 () Bool)

(declare-fun e!722485 () Bool)

(assert (=> b!1268053 (= e!722488 (and e!722485 mapRes!50515))))

(declare-fun condMapEmpty!50515 () Bool)

(declare-fun mapDefault!50515 () ValueCell!15463)

