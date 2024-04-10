; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20154 () Bool)

(assert start!20154)

(declare-fun b_free!4813 () Bool)

(declare-fun b_next!4813 () Bool)

(assert (=> start!20154 (= b_free!4813 (not b_next!4813))))

(declare-fun tp!17470 () Bool)

(declare-fun b_and!11559 () Bool)

(assert (=> start!20154 (= tp!17470 b_and!11559)))

(declare-fun mapIsEmpty!8072 () Bool)

(declare-fun mapRes!8072 () Bool)

(assert (=> mapIsEmpty!8072 mapRes!8072))

(declare-fun b!197744 () Bool)

(declare-fun res!93603 () Bool)

(declare-fun e!130076 () Bool)

(assert (=> b!197744 (=> (not res!93603) (not e!130076))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197744 (= res!93603 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8072 () Bool)

(declare-fun tp!17471 () Bool)

(declare-fun e!130079 () Bool)

(assert (=> mapNonEmpty!8072 (= mapRes!8072 (and tp!17471 e!130079))))

(declare-datatypes ((V!5873 0))(
  ( (V!5874 (val!2379 Int)) )
))
(declare-datatypes ((ValueCell!1991 0))(
  ( (ValueCellFull!1991 (v!4349 V!5873)) (EmptyCell!1991) )
))
(declare-fun mapValue!8072 () ValueCell!1991)

(declare-fun mapKey!8072 () (_ BitVec 32))

(declare-fun mapRest!8072 () (Array (_ BitVec 32) ValueCell!1991))

(declare-datatypes ((array!8591 0))(
  ( (array!8592 (arr!4046 (Array (_ BitVec 32) ValueCell!1991)) (size!4371 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8591)

(assert (=> mapNonEmpty!8072 (= (arr!4046 _values!649) (store mapRest!8072 mapKey!8072 mapValue!8072))))

(declare-fun b!197745 () Bool)

(declare-fun e!130075 () Bool)

(declare-fun tp_is_empty!4669 () Bool)

(assert (=> b!197745 (= e!130075 tp_is_empty!4669)))

(declare-fun res!93601 () Bool)

(assert (=> start!20154 (=> (not res!93601) (not e!130076))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20154 (= res!93601 (validMask!0 mask!1149))))

(assert (=> start!20154 e!130076))

(declare-fun e!130078 () Bool)

(declare-fun array_inv!2641 (array!8591) Bool)

(assert (=> start!20154 (and (array_inv!2641 _values!649) e!130078)))

(assert (=> start!20154 true))

(assert (=> start!20154 tp_is_empty!4669))

(declare-datatypes ((array!8593 0))(
  ( (array!8594 (arr!4047 (Array (_ BitVec 32) (_ BitVec 64))) (size!4372 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8593)

(declare-fun array_inv!2642 (array!8593) Bool)

(assert (=> start!20154 (array_inv!2642 _keys!825)))

(assert (=> start!20154 tp!17470))

(declare-fun b!197746 () Bool)

(declare-fun res!93605 () Bool)

(assert (=> b!197746 (=> (not res!93605) (not e!130076))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197746 (= res!93605 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4372 _keys!825))))))

(declare-fun b!197747 () Bool)

(declare-fun res!93602 () Bool)

(assert (=> b!197747 (=> (not res!93602) (not e!130076))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197747 (= res!93602 (and (= (size!4371 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4372 _keys!825) (size!4371 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197748 () Bool)

(declare-fun res!93604 () Bool)

(assert (=> b!197748 (=> (not res!93604) (not e!130076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8593 (_ BitVec 32)) Bool)

(assert (=> b!197748 (= res!93604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197749 () Bool)

(declare-fun res!93607 () Bool)

(assert (=> b!197749 (=> (not res!93607) (not e!130076))))

(assert (=> b!197749 (= res!93607 (= (select (arr!4047 _keys!825) i!601) k!843))))

(declare-fun b!197750 () Bool)

(assert (=> b!197750 (= e!130078 (and e!130075 mapRes!8072))))

(declare-fun condMapEmpty!8072 () Bool)

(declare-fun mapDefault!8072 () ValueCell!1991)

