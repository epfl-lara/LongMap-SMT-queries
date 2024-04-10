; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41994 () Bool)

(assert start!41994)

(declare-fun b_free!11567 () Bool)

(declare-fun b_next!11567 () Bool)

(assert (=> start!41994 (= b_free!11567 (not b_next!11567))))

(declare-fun tp!40717 () Bool)

(declare-fun b_and!19965 () Bool)

(assert (=> start!41994 (= tp!40717 b_and!19965)))

(declare-fun b!468858 () Bool)

(declare-fun e!274469 () Bool)

(declare-fun tp_is_empty!12995 () Bool)

(assert (=> b!468858 (= e!274469 tp_is_empty!12995)))

(declare-fun b!468859 () Bool)

(declare-fun e!274468 () Bool)

(declare-fun e!274466 () Bool)

(declare-fun mapRes!21187 () Bool)

(assert (=> b!468859 (= e!274468 (and e!274466 mapRes!21187))))

(declare-fun condMapEmpty!21187 () Bool)

(declare-datatypes ((V!18431 0))(
  ( (V!18432 (val!6542 Int)) )
))
(declare-datatypes ((ValueCell!6154 0))(
  ( (ValueCellFull!6154 (v!8831 V!18431)) (EmptyCell!6154) )
))
(declare-datatypes ((array!29765 0))(
  ( (array!29766 (arr!14308 (Array (_ BitVec 32) ValueCell!6154)) (size!14660 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29765)

(declare-fun mapDefault!21187 () ValueCell!6154)

