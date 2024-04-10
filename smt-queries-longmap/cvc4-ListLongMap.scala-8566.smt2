; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104608 () Bool)

(assert start!104608)

(declare-fun b!1247413 () Bool)

(declare-fun res!832355 () Bool)

(declare-fun e!707643 () Bool)

(assert (=> b!1247413 (=> (not res!832355) (not e!707643))))

(declare-datatypes ((array!80370 0))(
  ( (array!80371 (arr!38754 (Array (_ BitVec 32) (_ BitVec 64))) (size!39290 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80370)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80370 (_ BitVec 32)) Bool)

(assert (=> b!1247413 (= res!832355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48760 () Bool)

(declare-fun mapRes!48760 () Bool)

(assert (=> mapIsEmpty!48760 mapRes!48760))

(declare-fun b!1247414 () Bool)

(declare-fun e!707644 () Bool)

(declare-fun tp_is_empty!31337 () Bool)

(assert (=> b!1247414 (= e!707644 tp_is_empty!31337)))

(declare-fun b!1247415 () Bool)

(declare-fun e!707647 () Bool)

(assert (=> b!1247415 (= e!707647 (and e!707644 mapRes!48760))))

(declare-fun condMapEmpty!48760 () Bool)

(declare-datatypes ((V!47147 0))(
  ( (V!47148 (val!15731 Int)) )
))
(declare-datatypes ((ValueCell!14905 0))(
  ( (ValueCellFull!14905 (v!18427 V!47147)) (EmptyCell!14905) )
))
(declare-datatypes ((array!80372 0))(
  ( (array!80373 (arr!38755 (Array (_ BitVec 32) ValueCell!14905)) (size!39291 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80372)

(declare-fun mapDefault!48760 () ValueCell!14905)

