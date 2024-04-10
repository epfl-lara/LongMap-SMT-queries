; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20256 () Bool)

(assert start!20256)

(declare-fun b_free!4915 () Bool)

(declare-fun b_next!4915 () Bool)

(assert (=> start!20256 (= b_free!4915 (not b_next!4915))))

(declare-fun tp!17776 () Bool)

(declare-fun b_and!11661 () Bool)

(assert (=> start!20256 (= tp!17776 b_and!11661)))

(declare-fun b!199274 () Bool)

(declare-fun e!130840 () Bool)

(declare-fun tp_is_empty!4771 () Bool)

(assert (=> b!199274 (= e!130840 tp_is_empty!4771)))

(declare-fun b!199275 () Bool)

(declare-fun res!94672 () Bool)

(declare-fun e!130844 () Bool)

(assert (=> b!199275 (=> (not res!94672) (not e!130844))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199275 (= res!94672 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8225 () Bool)

(declare-fun mapRes!8225 () Bool)

(declare-fun tp!17777 () Bool)

(declare-fun e!130843 () Bool)

(assert (=> mapNonEmpty!8225 (= mapRes!8225 (and tp!17777 e!130843))))

(declare-datatypes ((V!6009 0))(
  ( (V!6010 (val!2430 Int)) )
))
(declare-datatypes ((ValueCell!2042 0))(
  ( (ValueCellFull!2042 (v!4400 V!6009)) (EmptyCell!2042) )
))
(declare-fun mapRest!8225 () (Array (_ BitVec 32) ValueCell!2042))

(declare-datatypes ((array!8783 0))(
  ( (array!8784 (arr!4142 (Array (_ BitVec 32) ValueCell!2042)) (size!4467 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8783)

(declare-fun mapValue!8225 () ValueCell!2042)

(declare-fun mapKey!8225 () (_ BitVec 32))

(assert (=> mapNonEmpty!8225 (= (arr!4142 _values!649) (store mapRest!8225 mapKey!8225 mapValue!8225))))

(declare-fun res!94674 () Bool)

(assert (=> start!20256 (=> (not res!94674) (not e!130844))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20256 (= res!94674 (validMask!0 mask!1149))))

(assert (=> start!20256 e!130844))

(declare-fun e!130841 () Bool)

(declare-fun array_inv!2717 (array!8783) Bool)

(assert (=> start!20256 (and (array_inv!2717 _values!649) e!130841)))

(assert (=> start!20256 true))

(assert (=> start!20256 tp_is_empty!4771))

(declare-datatypes ((array!8785 0))(
  ( (array!8786 (arr!4143 (Array (_ BitVec 32) (_ BitVec 64))) (size!4468 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8785)

(declare-fun array_inv!2718 (array!8785) Bool)

(assert (=> start!20256 (array_inv!2718 _keys!825)))

(assert (=> start!20256 tp!17776))

(declare-fun b!199276 () Bool)

(declare-fun res!94675 () Bool)

(assert (=> b!199276 (=> (not res!94675) (not e!130844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8785 (_ BitVec 32)) Bool)

(assert (=> b!199276 (= res!94675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199277 () Bool)

(assert (=> b!199277 (= e!130841 (and e!130840 mapRes!8225))))

(declare-fun condMapEmpty!8225 () Bool)

(declare-fun mapDefault!8225 () ValueCell!2042)

