; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43276 () Bool)

(assert start!43276)

(declare-fun b_free!12143 () Bool)

(declare-fun b_next!12143 () Bool)

(assert (=> start!43276 (= b_free!12143 (not b_next!12143))))

(declare-fun tp!42700 () Bool)

(declare-fun b_and!20895 () Bool)

(assert (=> start!43276 (= tp!42700 b_and!20895)))

(declare-fun b!479468 () Bool)

(declare-fun res!286007 () Bool)

(declare-fun e!282090 () Bool)

(assert (=> b!479468 (=> (not res!286007) (not e!282090))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19277 0))(
  ( (V!19278 (val!6875 Int)) )
))
(declare-datatypes ((ValueCell!6466 0))(
  ( (ValueCellFull!6466 (v!9164 V!19277)) (EmptyCell!6466) )
))
(declare-datatypes ((array!30983 0))(
  ( (array!30984 (arr!14898 (Array (_ BitVec 32) ValueCell!6466)) (size!15256 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30983)

(declare-datatypes ((array!30985 0))(
  ( (array!30986 (arr!14899 (Array (_ BitVec 32) (_ BitVec 64))) (size!15257 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30985)

(assert (=> b!479468 (= res!286007 (and (= (size!15256 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15257 _keys!1874) (size!15256 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479469 () Bool)

(declare-fun res!286006 () Bool)

(assert (=> b!479469 (=> (not res!286006) (not e!282090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30985 (_ BitVec 32)) Bool)

(assert (=> b!479469 (= res!286006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479470 () Bool)

(declare-fun res!286008 () Bool)

(assert (=> b!479470 (=> (not res!286008) (not e!282090))))

(declare-datatypes ((List!9102 0))(
  ( (Nil!9099) (Cons!9098 (h!9954 (_ BitVec 64)) (t!15308 List!9102)) )
))
(declare-fun arrayNoDuplicates!0 (array!30985 (_ BitVec 32) List!9102) Bool)

(assert (=> b!479470 (= res!286008 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9099))))

(declare-fun res!286005 () Bool)

(assert (=> start!43276 (=> (not res!286005) (not e!282090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43276 (= res!286005 (validMask!0 mask!2352))))

(assert (=> start!43276 e!282090))

(assert (=> start!43276 true))

(declare-fun tp_is_empty!13655 () Bool)

(assert (=> start!43276 tp_is_empty!13655))

(declare-fun e!282087 () Bool)

(declare-fun array_inv!10746 (array!30983) Bool)

(assert (=> start!43276 (and (array_inv!10746 _values!1516) e!282087)))

(assert (=> start!43276 tp!42700))

(declare-fun array_inv!10747 (array!30985) Bool)

(assert (=> start!43276 (array_inv!10747 _keys!1874)))

(declare-fun b!479471 () Bool)

(declare-fun e!282088 () Bool)

(declare-fun mapRes!22180 () Bool)

(assert (=> b!479471 (= e!282087 (and e!282088 mapRes!22180))))

(declare-fun condMapEmpty!22180 () Bool)

(declare-fun mapDefault!22180 () ValueCell!6466)

