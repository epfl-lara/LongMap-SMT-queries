; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70872 () Bool)

(assert start!70872)

(declare-fun b_free!13109 () Bool)

(declare-fun b_next!13109 () Bool)

(assert (=> start!70872 (= b_free!13109 (not b_next!13109))))

(declare-fun tp!46075 () Bool)

(declare-fun b_and!21993 () Bool)

(assert (=> start!70872 (= tp!46075 b_and!21993)))

(declare-fun mapNonEmpty!23842 () Bool)

(declare-fun mapRes!23842 () Bool)

(declare-fun tp!46074 () Bool)

(declare-fun e!457780 () Bool)

(assert (=> mapNonEmpty!23842 (= mapRes!23842 (and tp!46074 e!457780))))

(declare-datatypes ((V!24759 0))(
  ( (V!24760 (val!7457 Int)) )
))
(declare-datatypes ((ValueCell!6994 0))(
  ( (ValueCellFull!6994 (v!9889 V!24759)) (EmptyCell!6994) )
))
(declare-fun mapRest!23842 () (Array (_ BitVec 32) ValueCell!6994))

(declare-fun mapKey!23842 () (_ BitVec 32))

(declare-datatypes ((array!45832 0))(
  ( (array!45833 (arr!21965 (Array (_ BitVec 32) ValueCell!6994)) (size!22386 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45832)

(declare-fun mapValue!23842 () ValueCell!6994)

(assert (=> mapNonEmpty!23842 (= (arr!21965 _values!788) (store mapRest!23842 mapKey!23842 mapValue!23842))))

(declare-fun b!823163 () Bool)

(declare-fun e!457783 () Bool)

(declare-fun e!457784 () Bool)

(assert (=> b!823163 (= e!457783 (and e!457784 mapRes!23842))))

(declare-fun condMapEmpty!23842 () Bool)

(declare-fun mapDefault!23842 () ValueCell!6994)

