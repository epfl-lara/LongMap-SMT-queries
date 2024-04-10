; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94106 () Bool)

(assert start!94106)

(declare-fun b_free!21521 () Bool)

(declare-fun b_next!21521 () Bool)

(assert (=> start!94106 (= b_free!21521 (not b_next!21521))))

(declare-fun tp!75995 () Bool)

(declare-fun b_and!34263 () Bool)

(assert (=> start!94106 (= tp!75995 b_and!34263)))

(declare-fun mapNonEmpty!39676 () Bool)

(declare-fun mapRes!39676 () Bool)

(declare-fun tp!75994 () Bool)

(declare-fun e!606527 () Bool)

(assert (=> mapNonEmpty!39676 (= mapRes!39676 (and tp!75994 e!606527))))

(declare-fun mapKey!39676 () (_ BitVec 32))

(declare-datatypes ((V!38909 0))(
  ( (V!38910 (val!12716 Int)) )
))
(declare-datatypes ((ValueCell!11962 0))(
  ( (ValueCellFull!11962 (v!15328 V!38909)) (EmptyCell!11962) )
))
(declare-fun mapRest!39676 () (Array (_ BitVec 32) ValueCell!11962))

(declare-datatypes ((array!67653 0))(
  ( (array!67654 (arr!32531 (Array (_ BitVec 32) ValueCell!11962)) (size!33067 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67653)

(declare-fun mapValue!39676 () ValueCell!11962)

(assert (=> mapNonEmpty!39676 (= (arr!32531 _values!955) (store mapRest!39676 mapKey!39676 mapValue!39676))))

(declare-fun b!1064264 () Bool)

(declare-fun e!606528 () Bool)

(declare-fun e!606531 () Bool)

(assert (=> b!1064264 (= e!606528 (and e!606531 mapRes!39676))))

(declare-fun condMapEmpty!39676 () Bool)

(declare-fun mapDefault!39676 () ValueCell!11962)

