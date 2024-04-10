; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20700 () Bool)

(assert start!20700)

(declare-fun b_free!5359 () Bool)

(declare-fun b_next!5359 () Bool)

(assert (=> start!20700 (= b_free!5359 (not b_next!5359))))

(declare-fun tp!19109 () Bool)

(declare-fun b_and!12105 () Bool)

(assert (=> start!20700 (= tp!19109 b_and!12105)))

(declare-fun res!100398 () Bool)

(declare-fun e!135207 () Bool)

(assert (=> start!20700 (=> (not res!100398) (not e!135207))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20700 (= res!100398 (validMask!0 mask!1149))))

(assert (=> start!20700 e!135207))

(declare-datatypes ((V!6601 0))(
  ( (V!6602 (val!2652 Int)) )
))
(declare-datatypes ((ValueCell!2264 0))(
  ( (ValueCellFull!2264 (v!4622 V!6601)) (EmptyCell!2264) )
))
(declare-datatypes ((array!9639 0))(
  ( (array!9640 (arr!4570 (Array (_ BitVec 32) ValueCell!2264)) (size!4895 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9639)

(declare-fun e!135205 () Bool)

(declare-fun array_inv!3023 (array!9639) Bool)

(assert (=> start!20700 (and (array_inv!3023 _values!649) e!135205)))

(assert (=> start!20700 true))

(declare-fun tp_is_empty!5215 () Bool)

(assert (=> start!20700 tp_is_empty!5215))

(declare-datatypes ((array!9641 0))(
  ( (array!9642 (arr!4571 (Array (_ BitVec 32) (_ BitVec 64))) (size!4896 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9641)

(declare-fun array_inv!3024 (array!9641) Bool)

(assert (=> start!20700 (array_inv!3024 _keys!825)))

(assert (=> start!20700 tp!19109))

(declare-fun b!206996 () Bool)

(declare-fun res!100402 () Bool)

(assert (=> b!206996 (=> (not res!100402) (not e!135207))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206996 (= res!100402 (= (select (arr!4571 _keys!825) i!601) k!843))))

(declare-fun b!206997 () Bool)

(declare-fun res!100401 () Bool)

(assert (=> b!206997 (=> (not res!100401) (not e!135207))))

(assert (=> b!206997 (= res!100401 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4896 _keys!825))))))

(declare-fun b!206998 () Bool)

(declare-fun res!100397 () Bool)

(assert (=> b!206998 (=> (not res!100397) (not e!135207))))

(declare-datatypes ((List!2917 0))(
  ( (Nil!2914) (Cons!2913 (h!3555 (_ BitVec 64)) (t!7848 List!2917)) )
))
(declare-fun arrayNoDuplicates!0 (array!9641 (_ BitVec 32) List!2917) Bool)

(assert (=> b!206998 (= res!100397 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2914))))

(declare-fun b!206999 () Bool)

(declare-fun e!135206 () Bool)

(declare-fun mapRes!8891 () Bool)

(assert (=> b!206999 (= e!135205 (and e!135206 mapRes!8891))))

(declare-fun condMapEmpty!8891 () Bool)

(declare-fun mapDefault!8891 () ValueCell!2264)

