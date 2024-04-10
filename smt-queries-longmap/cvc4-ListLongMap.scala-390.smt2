; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7354 () Bool)

(assert start!7354)

(declare-fun res!27482 () Bool)

(declare-fun e!30220 () Bool)

(assert (=> start!7354 (=> (not res!27482) (not e!30220))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7354 (= res!27482 (validMask!0 mask!2458))))

(assert (=> start!7354 e!30220))

(assert (=> start!7354 true))

(declare-datatypes ((V!2427 0))(
  ( (V!2428 (val!1049 Int)) )
))
(declare-datatypes ((ValueCell!721 0))(
  ( (ValueCellFull!721 (v!2109 V!2427)) (EmptyCell!721) )
))
(declare-datatypes ((array!3103 0))(
  ( (array!3104 (arr!1489 (Array (_ BitVec 32) ValueCell!721)) (size!1711 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3103)

(declare-fun e!30223 () Bool)

(declare-fun array_inv!896 (array!3103) Bool)

(assert (=> start!7354 (and (array_inv!896 _values!1550) e!30223)))

(declare-datatypes ((array!3105 0))(
  ( (array!3106 (arr!1490 (Array (_ BitVec 32) (_ BitVec 64))) (size!1712 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3105)

(declare-fun array_inv!897 (array!3105) Bool)

(assert (=> start!7354 (array_inv!897 _keys!1940)))

(declare-fun b!47228 () Bool)

(assert (=> b!47228 (= e!30220 (and (bvsle #b00000000000000000000000000000000 (size!1712 _keys!1940)) (bvsge (size!1712 _keys!1940) #b01111111111111111111111111111111)))))

(declare-fun b!47229 () Bool)

(declare-fun e!30221 () Bool)

(declare-fun tp_is_empty!2021 () Bool)

(assert (=> b!47229 (= e!30221 tp_is_empty!2021)))

(declare-fun b!47230 () Bool)

(declare-fun res!27481 () Bool)

(assert (=> b!47230 (=> (not res!27481) (not e!30220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3105 (_ BitVec 32)) Bool)

(assert (=> b!47230 (= res!27481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun mapNonEmpty!2066 () Bool)

(declare-fun mapRes!2066 () Bool)

(declare-fun tp!6215 () Bool)

(declare-fun e!30224 () Bool)

(assert (=> mapNonEmpty!2066 (= mapRes!2066 (and tp!6215 e!30224))))

(declare-fun mapRest!2066 () (Array (_ BitVec 32) ValueCell!721))

(declare-fun mapValue!2066 () ValueCell!721)

(declare-fun mapKey!2066 () (_ BitVec 32))

(assert (=> mapNonEmpty!2066 (= (arr!1489 _values!1550) (store mapRest!2066 mapKey!2066 mapValue!2066))))

(declare-fun b!47231 () Bool)

(declare-fun res!27483 () Bool)

(assert (=> b!47231 (=> (not res!27483) (not e!30220))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47231 (= res!27483 (and (= (size!1711 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1712 _keys!1940) (size!1711 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47232 () Bool)

(assert (=> b!47232 (= e!30224 tp_is_empty!2021)))

(declare-fun mapIsEmpty!2066 () Bool)

(assert (=> mapIsEmpty!2066 mapRes!2066))

(declare-fun b!47233 () Bool)

(assert (=> b!47233 (= e!30223 (and e!30221 mapRes!2066))))

(declare-fun condMapEmpty!2066 () Bool)

(declare-fun mapDefault!2066 () ValueCell!721)

