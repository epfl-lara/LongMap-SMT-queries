; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84094 () Bool)

(assert start!84094)

(declare-fun mapNonEmpty!36374 () Bool)

(declare-fun mapRes!36374 () Bool)

(declare-fun tp!69058 () Bool)

(declare-fun e!554279 () Bool)

(assert (=> mapNonEmpty!36374 (= mapRes!36374 (and tp!69058 e!554279))))

(declare-datatypes ((V!35513 0))(
  ( (V!35514 (val!11499 Int)) )
))
(declare-datatypes ((ValueCell!10967 0))(
  ( (ValueCellFull!10967 (v!14061 V!35513)) (EmptyCell!10967) )
))
(declare-datatypes ((array!61783 0))(
  ( (array!61784 (arr!29749 (Array (_ BitVec 32) ValueCell!10967)) (size!30228 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61783)

(declare-fun mapKey!36374 () (_ BitVec 32))

(declare-fun mapValue!36374 () ValueCell!10967)

(declare-fun mapRest!36374 () (Array (_ BitVec 32) ValueCell!10967))

(assert (=> mapNonEmpty!36374 (= (arr!29749 _values!1278) (store mapRest!36374 mapKey!36374 mapValue!36374))))

(declare-fun b!983338 () Bool)

(declare-fun res!658044 () Bool)

(declare-fun e!554278 () Bool)

(assert (=> b!983338 (=> (not res!658044) (not e!554278))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61785 0))(
  ( (array!61786 (arr!29750 (Array (_ BitVec 32) (_ BitVec 64))) (size!30229 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61785)

(assert (=> b!983338 (= res!658044 (and (= (size!30228 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30229 _keys!1544) (size!30228 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983339 () Bool)

(declare-fun e!554276 () Bool)

(declare-fun e!554277 () Bool)

(assert (=> b!983339 (= e!554276 (and e!554277 mapRes!36374))))

(declare-fun condMapEmpty!36374 () Bool)

(declare-fun mapDefault!36374 () ValueCell!10967)

