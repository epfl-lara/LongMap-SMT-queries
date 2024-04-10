; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78454 () Bool)

(assert start!78454)

(declare-fun mapIsEmpty!30555 () Bool)

(declare-fun mapRes!30555 () Bool)

(assert (=> mapIsEmpty!30555 mapRes!30555))

(declare-fun b!914932 () Bool)

(declare-fun e!513375 () Bool)

(declare-datatypes ((array!54404 0))(
  ( (array!54405 (arr!26150 (Array (_ BitVec 32) (_ BitVec 64))) (size!26609 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54404)

(assert (=> b!914932 (= e!513375 (and (bvsle #b00000000000000000000000000000000 (size!26609 _keys!1487)) (bvsge (size!26609 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun b!914933 () Bool)

(declare-fun res!616938 () Bool)

(assert (=> b!914933 (=> (not res!616938) (not e!513375))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30571 0))(
  ( (V!30572 (val!9653 Int)) )
))
(declare-datatypes ((ValueCell!9121 0))(
  ( (ValueCellFull!9121 (v!12170 V!30571)) (EmptyCell!9121) )
))
(declare-datatypes ((array!54406 0))(
  ( (array!54407 (arr!26151 (Array (_ BitVec 32) ValueCell!9121)) (size!26610 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54406)

(assert (=> b!914933 (= res!616938 (and (= (size!26610 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26609 _keys!1487) (size!26610 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!914934 () Bool)

(declare-fun e!513377 () Bool)

(declare-fun tp_is_empty!19205 () Bool)

(assert (=> b!914934 (= e!513377 tp_is_empty!19205)))

(declare-fun b!914935 () Bool)

(declare-fun e!513376 () Bool)

(assert (=> b!914935 (= e!513376 tp_is_empty!19205)))

(declare-fun b!914936 () Bool)

(declare-fun res!616940 () Bool)

(assert (=> b!914936 (=> (not res!616940) (not e!513375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54404 (_ BitVec 32)) Bool)

(assert (=> b!914936 (= res!616940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!914937 () Bool)

(declare-fun e!513374 () Bool)

(assert (=> b!914937 (= e!513374 (and e!513376 mapRes!30555))))

(declare-fun condMapEmpty!30555 () Bool)

(declare-fun mapDefault!30555 () ValueCell!9121)

