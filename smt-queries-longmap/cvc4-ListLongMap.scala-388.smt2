; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7328 () Bool)

(assert start!7328)

(declare-fun mapNonEmpty!2042 () Bool)

(declare-fun mapRes!2042 () Bool)

(declare-fun tp!6191 () Bool)

(declare-fun e!30111 () Bool)

(assert (=> mapNonEmpty!2042 (= mapRes!2042 (and tp!6191 e!30111))))

(declare-datatypes ((V!2411 0))(
  ( (V!2412 (val!1043 Int)) )
))
(declare-datatypes ((ValueCell!715 0))(
  ( (ValueCellFull!715 (v!2103 V!2411)) (EmptyCell!715) )
))
(declare-fun mapRest!2042 () (Array (_ BitVec 32) ValueCell!715))

(declare-datatypes ((array!3077 0))(
  ( (array!3078 (arr!1478 (Array (_ BitVec 32) ValueCell!715)) (size!1700 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3077)

(declare-fun mapValue!2042 () ValueCell!715)

(declare-fun mapKey!2042 () (_ BitVec 32))

(assert (=> mapNonEmpty!2042 (= (arr!1478 _values!1550) (store mapRest!2042 mapKey!2042 mapValue!2042))))

(declare-fun b!47094 () Bool)

(declare-fun e!30110 () Bool)

(declare-fun tp_is_empty!2009 () Bool)

(assert (=> b!47094 (= e!30110 tp_is_empty!2009)))

(declare-datatypes ((array!3079 0))(
  ( (array!3080 (arr!1479 (Array (_ BitVec 32) (_ BitVec 64))) (size!1701 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3079)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun e!30113 () Bool)

(declare-fun b!47095 () Bool)

(assert (=> b!47095 (= e!30113 (and (= (size!1700 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1701 _keys!1940) (size!1700 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011) (= (size!1701 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458)) (bvsgt #b00000000000000000000000000000000 (size!1701 _keys!1940))))))

(declare-fun res!27423 () Bool)

(assert (=> start!7328 (=> (not res!27423) (not e!30113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7328 (= res!27423 (validMask!0 mask!2458))))

(assert (=> start!7328 e!30113))

(assert (=> start!7328 true))

(declare-fun e!30112 () Bool)

(declare-fun array_inv!886 (array!3077) Bool)

(assert (=> start!7328 (and (array_inv!886 _values!1550) e!30112)))

(declare-fun array_inv!887 (array!3079) Bool)

(assert (=> start!7328 (array_inv!887 _keys!1940)))

(declare-fun mapIsEmpty!2042 () Bool)

(assert (=> mapIsEmpty!2042 mapRes!2042))

(declare-fun b!47096 () Bool)

(assert (=> b!47096 (= e!30112 (and e!30110 mapRes!2042))))

(declare-fun condMapEmpty!2042 () Bool)

(declare-fun mapDefault!2042 () ValueCell!715)

