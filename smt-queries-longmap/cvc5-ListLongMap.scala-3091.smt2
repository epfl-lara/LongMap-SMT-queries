; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43486 () Bool)

(assert start!43486)

(declare-fun b_free!12265 () Bool)

(declare-fun b_next!12265 () Bool)

(assert (=> start!43486 (= b_free!12265 (not b_next!12265))))

(declare-fun tp!43077 () Bool)

(declare-fun b_and!21025 () Bool)

(assert (=> start!43486 (= tp!43077 b_and!21025)))

(declare-fun mapIsEmpty!22375 () Bool)

(declare-fun mapRes!22375 () Bool)

(assert (=> mapIsEmpty!22375 mapRes!22375))

(declare-fun b!481838 () Bool)

(declare-fun e!283492 () Bool)

(declare-fun tp_is_empty!13777 () Bool)

(assert (=> b!481838 (= e!283492 tp_is_empty!13777)))

(declare-fun b!481839 () Bool)

(declare-fun res!287242 () Bool)

(declare-fun e!283491 () Bool)

(assert (=> b!481839 (=> (not res!287242) (not e!283491))))

(declare-datatypes ((array!31215 0))(
  ( (array!31216 (arr!15010 (Array (_ BitVec 32) (_ BitVec 64))) (size!15368 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31215)

(declare-datatypes ((List!9179 0))(
  ( (Nil!9176) (Cons!9175 (h!10031 (_ BitVec 64)) (t!15393 List!9179)) )
))
(declare-fun arrayNoDuplicates!0 (array!31215 (_ BitVec 32) List!9179) Bool)

(assert (=> b!481839 (= res!287242 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9176))))

(declare-fun mapNonEmpty!22375 () Bool)

(declare-fun tp!43078 () Bool)

(assert (=> mapNonEmpty!22375 (= mapRes!22375 (and tp!43078 e!283492))))

(declare-datatypes ((V!19441 0))(
  ( (V!19442 (val!6936 Int)) )
))
(declare-datatypes ((ValueCell!6527 0))(
  ( (ValueCellFull!6527 (v!9229 V!19441)) (EmptyCell!6527) )
))
(declare-fun mapValue!22375 () ValueCell!6527)

(declare-fun mapKey!22375 () (_ BitVec 32))

(declare-fun mapRest!22375 () (Array (_ BitVec 32) ValueCell!6527))

(declare-datatypes ((array!31217 0))(
  ( (array!31218 (arr!15011 (Array (_ BitVec 32) ValueCell!6527)) (size!15369 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31217)

(assert (=> mapNonEmpty!22375 (= (arr!15011 _values!1516) (store mapRest!22375 mapKey!22375 mapValue!22375))))

(declare-fun b!481840 () Bool)

(declare-fun e!283490 () Bool)

(assert (=> b!481840 (= e!283490 tp_is_empty!13777)))

(declare-fun b!481841 () Bool)

(declare-fun res!287245 () Bool)

(assert (=> b!481841 (=> (not res!287245) (not e!283491))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31215 (_ BitVec 32)) Bool)

(assert (=> b!481841 (= res!287245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!287244 () Bool)

(assert (=> start!43486 (=> (not res!287244) (not e!283491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43486 (= res!287244 (validMask!0 mask!2352))))

(assert (=> start!43486 e!283491))

(assert (=> start!43486 true))

(assert (=> start!43486 tp_is_empty!13777))

(declare-fun e!283493 () Bool)

(declare-fun array_inv!10824 (array!31217) Bool)

(assert (=> start!43486 (and (array_inv!10824 _values!1516) e!283493)))

(assert (=> start!43486 tp!43077))

(declare-fun array_inv!10825 (array!31215) Bool)

(assert (=> start!43486 (array_inv!10825 _keys!1874)))

(declare-fun b!481842 () Bool)

(assert (=> b!481842 (= e!283493 (and e!283490 mapRes!22375))))

(declare-fun condMapEmpty!22375 () Bool)

(declare-fun mapDefault!22375 () ValueCell!6527)

