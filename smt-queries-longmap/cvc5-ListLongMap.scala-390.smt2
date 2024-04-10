; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7350 () Bool)

(assert start!7350)

(declare-fun mapNonEmpty!2060 () Bool)

(declare-fun mapRes!2060 () Bool)

(declare-fun tp!6209 () Bool)

(declare-fun e!30193 () Bool)

(assert (=> mapNonEmpty!2060 (= mapRes!2060 (and tp!6209 e!30193))))

(declare-datatypes ((V!2423 0))(
  ( (V!2424 (val!1047 Int)) )
))
(declare-datatypes ((ValueCell!719 0))(
  ( (ValueCellFull!719 (v!2107 V!2423)) (EmptyCell!719) )
))
(declare-fun mapRest!2060 () (Array (_ BitVec 32) ValueCell!719))

(declare-fun mapKey!2060 () (_ BitVec 32))

(declare-datatypes ((array!3095 0))(
  ( (array!3096 (arr!1485 (Array (_ BitVec 32) ValueCell!719)) (size!1707 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3095)

(declare-fun mapValue!2060 () ValueCell!719)

(assert (=> mapNonEmpty!2060 (= (arr!1485 _values!1550) (store mapRest!2060 mapKey!2060 mapValue!2060))))

(declare-fun mapIsEmpty!2060 () Bool)

(assert (=> mapIsEmpty!2060 mapRes!2060))

(declare-fun res!27465 () Bool)

(declare-fun e!30194 () Bool)

(assert (=> start!7350 (=> (not res!27465) (not e!30194))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7350 (= res!27465 (validMask!0 mask!2458))))

(assert (=> start!7350 e!30194))

(assert (=> start!7350 true))

(declare-fun e!30192 () Bool)

(declare-fun array_inv!892 (array!3095) Bool)

(assert (=> start!7350 (and (array_inv!892 _values!1550) e!30192)))

(declare-datatypes ((array!3097 0))(
  ( (array!3098 (arr!1486 (Array (_ BitVec 32) (_ BitVec 64))) (size!1708 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3097)

(declare-fun array_inv!893 (array!3097) Bool)

(assert (=> start!7350 (array_inv!893 _keys!1940)))

(declare-fun b!47192 () Bool)

(declare-fun tp_is_empty!2017 () Bool)

(assert (=> b!47192 (= e!30193 tp_is_empty!2017)))

(declare-fun b!47193 () Bool)

(declare-fun res!27464 () Bool)

(assert (=> b!47193 (=> (not res!27464) (not e!30194))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47193 (= res!27464 (and (= (size!1707 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1708 _keys!1940) (size!1707 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47194 () Bool)

(declare-fun res!27463 () Bool)

(assert (=> b!47194 (=> (not res!27463) (not e!30194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3097 (_ BitVec 32)) Bool)

(assert (=> b!47194 (= res!27463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47195 () Bool)

(assert (=> b!47195 (= e!30194 (and (bvsle #b00000000000000000000000000000000 (size!1708 _keys!1940)) (bvsge (size!1708 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47196 () Bool)

(declare-fun e!30191 () Bool)

(assert (=> b!47196 (= e!30192 (and e!30191 mapRes!2060))))

(declare-fun condMapEmpty!2060 () Bool)

(declare-fun mapDefault!2060 () ValueCell!719)

