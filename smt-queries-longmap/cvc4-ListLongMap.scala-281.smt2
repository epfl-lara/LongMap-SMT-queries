; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4578 () Bool)

(assert start!4578)

(declare-fun b_free!1277 () Bool)

(declare-fun b_next!1277 () Bool)

(assert (=> start!4578 (= b_free!1277 (not b_next!1277))))

(declare-fun tp!5278 () Bool)

(declare-fun b_and!2105 () Bool)

(assert (=> start!4578 (= tp!5278 b_and!2105)))

(declare-fun mapIsEmpty!2002 () Bool)

(declare-fun mapRes!2002 () Bool)

(assert (=> mapIsEmpty!2002 mapRes!2002))

(declare-fun b!35802 () Bool)

(declare-fun res!21729 () Bool)

(declare-fun e!22625 () Bool)

(assert (=> b!35802 (=> (not res!21729) (not e!22625))))

(declare-datatypes ((array!2477 0))(
  ( (array!2478 (arr!1183 (Array (_ BitVec 32) (_ BitVec 64))) (size!1284 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2477)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2477 (_ BitVec 32)) Bool)

(assert (=> b!35802 (= res!21729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35803 () Bool)

(declare-fun res!21723 () Bool)

(assert (=> b!35803 (=> (not res!21723) (not e!22625))))

(declare-datatypes ((List!947 0))(
  ( (Nil!944) (Cons!943 (h!1510 (_ BitVec 64)) (t!3658 List!947)) )
))
(declare-fun arrayNoDuplicates!0 (array!2477 (_ BitVec 32) List!947) Bool)

(assert (=> b!35803 (= res!21723 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!944))))

(declare-fun b!35804 () Bool)

(declare-fun e!22622 () Bool)

(declare-fun tp_is_empty!1631 () Bool)

(assert (=> b!35804 (= e!22622 tp_is_empty!1631)))

(declare-fun b!35805 () Bool)

(declare-fun e!22624 () Bool)

(assert (=> b!35805 (= e!22624 (and e!22622 mapRes!2002))))

(declare-fun condMapEmpty!2002 () Bool)

(declare-datatypes ((V!1999 0))(
  ( (V!2000 (val!842 Int)) )
))
(declare-datatypes ((ValueCell!616 0))(
  ( (ValueCellFull!616 (v!1940 V!1999)) (EmptyCell!616) )
))
(declare-datatypes ((array!2479 0))(
  ( (array!2480 (arr!1184 (Array (_ BitVec 32) ValueCell!616)) (size!1285 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2479)

(declare-fun mapDefault!2002 () ValueCell!616)

