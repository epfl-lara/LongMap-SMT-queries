; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3680 () Bool)

(assert start!3680)

(declare-datatypes ((V!1219 0))(
  ( (V!1220 (val!549 Int)) )
))
(declare-datatypes ((ValueCell!323 0))(
  ( (ValueCellFull!323 (v!1634 V!1219)) (EmptyCell!323) )
))
(declare-datatypes ((array!1329 0))(
  ( (array!1330 (arr!627 (Array (_ BitVec 32) ValueCell!323)) (size!728 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1329)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1331 0))(
  ( (array!1332 (arr!628 (Array (_ BitVec 32) (_ BitVec 64))) (size!729 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1331)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun b!25780 () Bool)

(declare-fun e!16688 () Bool)

(assert (=> b!25780 (= e!16688 (and (= (size!728 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!729 _keys!1833) (size!728 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011) (= (size!729 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294)) (bvsgt #b00000000000000000000000000000000 (size!729 _keys!1833))))))

(declare-fun mapIsEmpty!1069 () Bool)

(declare-fun mapRes!1069 () Bool)

(assert (=> mapIsEmpty!1069 mapRes!1069))

(declare-fun mapNonEmpty!1069 () Bool)

(declare-fun tp!3589 () Bool)

(declare-fun e!16689 () Bool)

(assert (=> mapNonEmpty!1069 (= mapRes!1069 (and tp!3589 e!16689))))

(declare-fun mapRest!1069 () (Array (_ BitVec 32) ValueCell!323))

(declare-fun mapKey!1069 () (_ BitVec 32))

(declare-fun mapValue!1069 () ValueCell!323)

(assert (=> mapNonEmpty!1069 (= (arr!627 _values!1501) (store mapRest!1069 mapKey!1069 mapValue!1069))))

(declare-fun b!25781 () Bool)

(declare-fun e!16685 () Bool)

(declare-fun tp_is_empty!1045 () Bool)

(assert (=> b!25781 (= e!16685 tp_is_empty!1045)))

(declare-fun b!25782 () Bool)

(assert (=> b!25782 (= e!16689 tp_is_empty!1045)))

(declare-fun b!25783 () Bool)

(declare-fun e!16687 () Bool)

(assert (=> b!25783 (= e!16687 (and e!16685 mapRes!1069))))

(declare-fun condMapEmpty!1069 () Bool)

(declare-fun mapDefault!1069 () ValueCell!323)

