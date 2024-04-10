; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70734 () Bool)

(assert start!70734)

(declare-fun b_free!13007 () Bool)

(declare-fun b_next!13007 () Bool)

(assert (=> start!70734 (= b_free!13007 (not b_next!13007))))

(declare-fun tp!45763 () Bool)

(declare-fun b_and!21869 () Bool)

(assert (=> start!70734 (= tp!45763 b_and!21869)))

(declare-fun b!821601 () Bool)

(declare-fun e!456647 () Bool)

(declare-fun tp_is_empty!14717 () Bool)

(assert (=> b!821601 (= e!456647 tp_is_empty!14717)))

(declare-fun b!821602 () Bool)

(declare-fun e!456650 () Bool)

(assert (=> b!821602 (= e!456650 true)))

(declare-datatypes ((V!24623 0))(
  ( (V!24624 (val!7406 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24623)

(declare-datatypes ((tuple2!9774 0))(
  ( (tuple2!9775 (_1!4898 (_ BitVec 64)) (_2!4898 V!24623)) )
))
(declare-datatypes ((List!15590 0))(
  ( (Nil!15587) (Cons!15586 (h!16715 tuple2!9774) (t!21925 List!15590)) )
))
(declare-datatypes ((ListLongMap!8597 0))(
  ( (ListLongMap!8598 (toList!4314 List!15590)) )
))
(declare-fun lt!369305 () ListLongMap!8597)

(declare-datatypes ((array!45630 0))(
  ( (array!45631 (arr!21866 (Array (_ BitVec 32) (_ BitVec 64))) (size!22287 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45630)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24623)

(declare-datatypes ((ValueCell!6943 0))(
  ( (ValueCellFull!6943 (v!9837 V!24623)) (EmptyCell!6943) )
))
(declare-datatypes ((array!45632 0))(
  ( (array!45633 (arr!21867 (Array (_ BitVec 32) ValueCell!6943)) (size!22288 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45632)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2483 (array!45630 array!45632 (_ BitVec 32) (_ BitVec 32) V!24623 V!24623 (_ BitVec 32) Int) ListLongMap!8597)

(assert (=> b!821602 (= lt!369305 (getCurrentListMap!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821603 () Bool)

(declare-fun e!456649 () Bool)

(declare-fun e!456648 () Bool)

(declare-fun mapRes!23683 () Bool)

(assert (=> b!821603 (= e!456649 (and e!456648 mapRes!23683))))

(declare-fun condMapEmpty!23683 () Bool)

(declare-fun mapDefault!23683 () ValueCell!6943)

