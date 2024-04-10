; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20286 () Bool)

(assert start!20286)

(declare-fun b_free!4945 () Bool)

(declare-fun b_next!4945 () Bool)

(assert (=> start!20286 (= b_free!4945 (not b_next!4945))))

(declare-fun tp!17867 () Bool)

(declare-fun b_and!11691 () Bool)

(assert (=> start!20286 (= tp!17867 b_and!11691)))

(declare-fun b!199724 () Bool)

(declare-fun res!94988 () Bool)

(declare-fun e!131067 () Bool)

(assert (=> b!199724 (=> (not res!94988) (not e!131067))))

(declare-datatypes ((array!8841 0))(
  ( (array!8842 (arr!4171 (Array (_ BitVec 32) (_ BitVec 64))) (size!4496 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8841)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8841 (_ BitVec 32)) Bool)

(assert (=> b!199724 (= res!94988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199725 () Bool)

(declare-fun res!94987 () Bool)

(assert (=> b!199725 (=> (not res!94987) (not e!131067))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6049 0))(
  ( (V!6050 (val!2445 Int)) )
))
(declare-datatypes ((ValueCell!2057 0))(
  ( (ValueCellFull!2057 (v!4415 V!6049)) (EmptyCell!2057) )
))
(declare-datatypes ((array!8843 0))(
  ( (array!8844 (arr!4172 (Array (_ BitVec 32) ValueCell!2057)) (size!4497 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8843)

(assert (=> b!199725 (= res!94987 (and (= (size!4497 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4496 _keys!825) (size!4497 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199726 () Bool)

(declare-fun res!94993 () Bool)

(assert (=> b!199726 (=> (not res!94993) (not e!131067))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199726 (= res!94993 (validKeyInArray!0 k!843))))

(declare-fun res!94990 () Bool)

(assert (=> start!20286 (=> (not res!94990) (not e!131067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20286 (= res!94990 (validMask!0 mask!1149))))

(assert (=> start!20286 e!131067))

(declare-fun e!131068 () Bool)

(declare-fun array_inv!2741 (array!8843) Bool)

(assert (=> start!20286 (and (array_inv!2741 _values!649) e!131068)))

(assert (=> start!20286 true))

(declare-fun tp_is_empty!4801 () Bool)

(assert (=> start!20286 tp_is_empty!4801))

(declare-fun array_inv!2742 (array!8841) Bool)

(assert (=> start!20286 (array_inv!2742 _keys!825)))

(assert (=> start!20286 tp!17867))

(declare-fun b!199727 () Bool)

(declare-fun res!94991 () Bool)

(assert (=> b!199727 (=> (not res!94991) (not e!131067))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199727 (= res!94991 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4496 _keys!825))))))

(declare-fun mapIsEmpty!8270 () Bool)

(declare-fun mapRes!8270 () Bool)

(assert (=> mapIsEmpty!8270 mapRes!8270))

(declare-fun b!199728 () Bool)

(declare-fun e!131066 () Bool)

(assert (=> b!199728 (= e!131068 (and e!131066 mapRes!8270))))

(declare-fun condMapEmpty!8270 () Bool)

(declare-fun mapDefault!8270 () ValueCell!2057)

