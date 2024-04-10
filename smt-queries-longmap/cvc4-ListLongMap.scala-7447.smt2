; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94580 () Bool)

(assert start!94580)

(declare-fun b_free!21863 () Bool)

(declare-fun b_next!21863 () Bool)

(assert (=> start!94580 (= b_free!21863 (not b_next!21863))))

(declare-fun tp!77042 () Bool)

(declare-fun b_and!34675 () Bool)

(assert (=> start!94580 (= tp!77042 b_and!34675)))

(declare-fun b!1069449 () Bool)

(declare-fun res!713556 () Bool)

(declare-fun e!610330 () Bool)

(assert (=> b!1069449 (=> (not res!713556) (not e!610330))))

(declare-datatypes ((array!68325 0))(
  ( (array!68326 (arr!32860 (Array (_ BitVec 32) (_ BitVec 64))) (size!33396 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68325)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68325 (_ BitVec 32)) Bool)

(assert (=> b!1069449 (= res!713556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40210 () Bool)

(declare-fun mapRes!40210 () Bool)

(declare-fun tp!77041 () Bool)

(declare-fun e!610332 () Bool)

(assert (=> mapNonEmpty!40210 (= mapRes!40210 (and tp!77041 e!610332))))

(declare-datatypes ((V!39365 0))(
  ( (V!39366 (val!12887 Int)) )
))
(declare-datatypes ((ValueCell!12133 0))(
  ( (ValueCellFull!12133 (v!15503 V!39365)) (EmptyCell!12133) )
))
(declare-fun mapRest!40210 () (Array (_ BitVec 32) ValueCell!12133))

(declare-fun mapKey!40210 () (_ BitVec 32))

(declare-datatypes ((array!68327 0))(
  ( (array!68328 (arr!32861 (Array (_ BitVec 32) ValueCell!12133)) (size!33397 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68327)

(declare-fun mapValue!40210 () ValueCell!12133)

(assert (=> mapNonEmpty!40210 (= (arr!32861 _values!955) (store mapRest!40210 mapKey!40210 mapValue!40210))))

(declare-fun mapIsEmpty!40210 () Bool)

(assert (=> mapIsEmpty!40210 mapRes!40210))

(declare-fun b!1069450 () Bool)

(declare-fun e!610329 () Bool)

(declare-fun tp_is_empty!25673 () Bool)

(assert (=> b!1069450 (= e!610329 tp_is_empty!25673)))

(declare-fun b!1069451 () Bool)

(declare-fun e!610331 () Bool)

(assert (=> b!1069451 (= e!610331 (and e!610329 mapRes!40210))))

(declare-fun condMapEmpty!40210 () Bool)

(declare-fun mapDefault!40210 () ValueCell!12133)

