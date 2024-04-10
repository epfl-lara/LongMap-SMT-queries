; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83256 () Bool)

(assert start!83256)

(declare-fun b_free!19249 () Bool)

(declare-fun b_next!19249 () Bool)

(assert (=> start!83256 (= b_free!19249 (not b_next!19249))))

(declare-fun tp!67025 () Bool)

(declare-fun b_and!30737 () Bool)

(assert (=> start!83256 (= tp!67025 b_and!30737)))

(declare-fun b!971539 () Bool)

(declare-fun res!650292 () Bool)

(declare-fun e!547666 () Bool)

(assert (=> b!971539 (=> (not res!650292) (not e!547666))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34513 0))(
  ( (V!34514 (val!11124 Int)) )
))
(declare-datatypes ((ValueCell!10592 0))(
  ( (ValueCellFull!10592 (v!13683 V!34513)) (EmptyCell!10592) )
))
(declare-datatypes ((array!60341 0))(
  ( (array!60342 (arr!29034 (Array (_ BitVec 32) ValueCell!10592)) (size!29513 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60341)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60343 0))(
  ( (array!60344 (arr!29035 (Array (_ BitVec 32) (_ BitVec 64))) (size!29514 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60343)

(assert (=> b!971539 (= res!650292 (and (= (size!29513 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29514 _keys!1717) (size!29513 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971540 () Bool)

(declare-fun res!650291 () Bool)

(assert (=> b!971540 (=> (not res!650291) (not e!547666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60343 (_ BitVec 32)) Bool)

(assert (=> b!971540 (= res!650291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971541 () Bool)

(declare-fun res!650290 () Bool)

(assert (=> b!971541 (=> (not res!650290) (not e!547666))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!971541 (= res!650290 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29514 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29514 _keys!1717))))))

(declare-fun b!971542 () Bool)

(declare-fun e!547669 () Bool)

(declare-fun tp_is_empty!22147 () Bool)

(assert (=> b!971542 (= e!547669 tp_is_empty!22147)))

(declare-fun b!971543 () Bool)

(declare-fun e!547665 () Bool)

(declare-fun e!547667 () Bool)

(declare-fun mapRes!35230 () Bool)

(assert (=> b!971543 (= e!547665 (and e!547667 mapRes!35230))))

(declare-fun condMapEmpty!35230 () Bool)

(declare-fun mapDefault!35230 () ValueCell!10592)

