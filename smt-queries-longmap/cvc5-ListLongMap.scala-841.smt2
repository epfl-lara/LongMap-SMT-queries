; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20142 () Bool)

(assert start!20142)

(declare-fun b_free!4801 () Bool)

(declare-fun b_next!4801 () Bool)

(assert (=> start!20142 (= b_free!4801 (not b_next!4801))))

(declare-fun tp!17435 () Bool)

(declare-fun b_and!11547 () Bool)

(assert (=> start!20142 (= tp!17435 b_and!11547)))

(declare-fun res!93481 () Bool)

(declare-fun e!129987 () Bool)

(assert (=> start!20142 (=> (not res!93481) (not e!129987))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20142 (= res!93481 (validMask!0 mask!1149))))

(assert (=> start!20142 e!129987))

(declare-datatypes ((V!5857 0))(
  ( (V!5858 (val!2373 Int)) )
))
(declare-datatypes ((ValueCell!1985 0))(
  ( (ValueCellFull!1985 (v!4343 V!5857)) (EmptyCell!1985) )
))
(declare-datatypes ((array!8567 0))(
  ( (array!8568 (arr!4034 (Array (_ BitVec 32) ValueCell!1985)) (size!4359 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8567)

(declare-fun e!129989 () Bool)

(declare-fun array_inv!2631 (array!8567) Bool)

(assert (=> start!20142 (and (array_inv!2631 _values!649) e!129989)))

(assert (=> start!20142 true))

(declare-fun tp_is_empty!4657 () Bool)

(assert (=> start!20142 tp_is_empty!4657))

(declare-datatypes ((array!8569 0))(
  ( (array!8570 (arr!4035 (Array (_ BitVec 32) (_ BitVec 64))) (size!4360 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8569)

(declare-fun array_inv!2632 (array!8569) Bool)

(assert (=> start!20142 (array_inv!2632 _keys!825)))

(assert (=> start!20142 tp!17435))

(declare-fun mapNonEmpty!8054 () Bool)

(declare-fun mapRes!8054 () Bool)

(declare-fun tp!17434 () Bool)

(declare-fun e!129985 () Bool)

(assert (=> mapNonEmpty!8054 (= mapRes!8054 (and tp!17434 e!129985))))

(declare-fun mapValue!8054 () ValueCell!1985)

(declare-fun mapRest!8054 () (Array (_ BitVec 32) ValueCell!1985))

(declare-fun mapKey!8054 () (_ BitVec 32))

(assert (=> mapNonEmpty!8054 (= (arr!4034 _values!649) (store mapRest!8054 mapKey!8054 mapValue!8054))))

(declare-fun b!197564 () Bool)

(declare-fun res!93480 () Bool)

(assert (=> b!197564 (=> (not res!93480) (not e!129987))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197564 (= res!93480 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4360 _keys!825))))))

(declare-fun b!197565 () Bool)

(declare-fun res!93479 () Bool)

(assert (=> b!197565 (=> (not res!93479) (not e!129987))))

(declare-datatypes ((List!2517 0))(
  ( (Nil!2514) (Cons!2513 (h!3155 (_ BitVec 64)) (t!7448 List!2517)) )
))
(declare-fun arrayNoDuplicates!0 (array!8569 (_ BitVec 32) List!2517) Bool)

(assert (=> b!197565 (= res!93479 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2514))))

(declare-fun b!197566 () Bool)

(declare-fun res!93477 () Bool)

(assert (=> b!197566 (=> (not res!93477) (not e!129987))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197566 (= res!93477 (and (= (size!4359 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4360 _keys!825) (size!4359 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197567 () Bool)

(assert (=> b!197567 (= e!129985 tp_is_empty!4657)))

(declare-fun b!197568 () Bool)

(declare-fun e!129986 () Bool)

(assert (=> b!197568 (= e!129989 (and e!129986 mapRes!8054))))

(declare-fun condMapEmpty!8054 () Bool)

(declare-fun mapDefault!8054 () ValueCell!1985)

