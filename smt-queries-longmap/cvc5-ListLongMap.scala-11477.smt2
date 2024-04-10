; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133660 () Bool)

(assert start!133660)

(declare-fun b!1562796 () Bool)

(declare-fun e!870913 () Bool)

(declare-fun tp_is_empty!38743 () Bool)

(assert (=> b!1562796 (= e!870913 tp_is_empty!38743)))

(declare-fun mapNonEmpty!59490 () Bool)

(declare-fun mapRes!59490 () Bool)

(declare-fun tp!113325 () Bool)

(declare-fun e!870910 () Bool)

(assert (=> mapNonEmpty!59490 (= mapRes!59490 (and tp!113325 e!870910))))

(declare-datatypes ((V!59865 0))(
  ( (V!59866 (val!19455 Int)) )
))
(declare-datatypes ((ValueCell!18341 0))(
  ( (ValueCellFull!18341 (v!22207 V!59865)) (EmptyCell!18341) )
))
(declare-fun mapValue!59490 () ValueCell!18341)

(declare-fun mapRest!59490 () (Array (_ BitVec 32) ValueCell!18341))

(declare-datatypes ((array!104194 0))(
  ( (array!104195 (arr!50289 (Array (_ BitVec 32) ValueCell!18341)) (size!50839 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104194)

(declare-fun mapKey!59490 () (_ BitVec 32))

(assert (=> mapNonEmpty!59490 (= (arr!50289 _values!487) (store mapRest!59490 mapKey!59490 mapValue!59490))))

(declare-fun mapIsEmpty!59490 () Bool)

(assert (=> mapIsEmpty!59490 mapRes!59490))

(declare-fun b!1562798 () Bool)

(declare-fun e!870909 () Bool)

(assert (=> b!1562798 (= e!870909 (and e!870913 mapRes!59490))))

(declare-fun condMapEmpty!59490 () Bool)

(declare-fun mapDefault!59490 () ValueCell!18341)

