; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83386 () Bool)

(assert start!83386)

(declare-fun b_free!19379 () Bool)

(declare-fun b_next!19379 () Bool)

(assert (=> start!83386 (= b_free!19379 (not b_next!19379))))

(declare-fun tp!67416 () Bool)

(declare-fun b_and!30979 () Bool)

(assert (=> start!83386 (= tp!67416 b_and!30979)))

(declare-fun b!973771 () Bool)

(declare-fun res!651824 () Bool)

(declare-fun e!548893 () Bool)

(assert (=> b!973771 (=> (not res!651824) (not e!548893))))

(declare-datatypes ((array!60595 0))(
  ( (array!60596 (arr!29161 (Array (_ BitVec 32) (_ BitVec 64))) (size!29640 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60595)

(declare-datatypes ((List!20230 0))(
  ( (Nil!20227) (Cons!20226 (h!21388 (_ BitVec 64)) (t!28707 List!20230)) )
))
(declare-fun arrayNoDuplicates!0 (array!60595 (_ BitVec 32) List!20230) Bool)

(assert (=> b!973771 (= res!651824 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20227))))

(declare-fun b!973772 () Bool)

(declare-fun e!548892 () Bool)

(declare-fun tp_is_empty!22277 () Bool)

(assert (=> b!973772 (= e!548892 tp_is_empty!22277)))

(declare-fun b!973774 () Bool)

(declare-fun e!548894 () Bool)

(declare-fun mapRes!35425 () Bool)

(assert (=> b!973774 (= e!548894 (and e!548892 mapRes!35425))))

(declare-fun condMapEmpty!35425 () Bool)

(declare-datatypes ((V!34685 0))(
  ( (V!34686 (val!11189 Int)) )
))
(declare-datatypes ((ValueCell!10657 0))(
  ( (ValueCellFull!10657 (v!13748 V!34685)) (EmptyCell!10657) )
))
(declare-datatypes ((array!60597 0))(
  ( (array!60598 (arr!29162 (Array (_ BitVec 32) ValueCell!10657)) (size!29641 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60597)

(declare-fun mapDefault!35425 () ValueCell!10657)

