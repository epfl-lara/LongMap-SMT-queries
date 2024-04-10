; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106992 () Bool)

(assert start!106992)

(declare-fun mapNonEmpty!50602 () Bool)

(declare-fun mapRes!50602 () Bool)

(declare-fun tp!96781 () Bool)

(declare-fun e!722940 () Bool)

(assert (=> mapNonEmpty!50602 (= mapRes!50602 (and tp!96781 e!722940))))

(declare-datatypes ((V!48767 0))(
  ( (V!48768 (val!16415 Int)) )
))
(declare-datatypes ((ValueCell!15487 0))(
  ( (ValueCellFull!15487 (v!19052 V!48767)) (EmptyCell!15487) )
))
(declare-datatypes ((array!82634 0))(
  ( (array!82635 (arr!39854 (Array (_ BitVec 32) ValueCell!15487)) (size!40390 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82634)

(declare-fun mapRest!50602 () (Array (_ BitVec 32) ValueCell!15487))

(declare-fun mapValue!50602 () ValueCell!15487)

(declare-fun mapKey!50602 () (_ BitVec 32))

(assert (=> mapNonEmpty!50602 (= (arr!39854 _values!1134) (store mapRest!50602 mapKey!50602 mapValue!50602))))

(declare-fun b!1268628 () Bool)

(declare-fun tp_is_empty!32681 () Bool)

(assert (=> b!1268628 (= e!722940 tp_is_empty!32681)))

(declare-fun b!1268629 () Bool)

(declare-fun e!722942 () Bool)

(declare-fun e!722939 () Bool)

(assert (=> b!1268629 (= e!722942 (and e!722939 mapRes!50602))))

(declare-fun condMapEmpty!50602 () Bool)

(declare-fun mapDefault!50602 () ValueCell!15487)

