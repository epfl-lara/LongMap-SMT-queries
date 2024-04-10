; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35420 () Bool)

(assert start!35420)

(declare-fun b!354566 () Bool)

(declare-fun res!196542 () Bool)

(declare-fun e!217344 () Bool)

(assert (=> b!354566 (=> (not res!196542) (not e!217344))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19327 0))(
  ( (array!19328 (arr!9157 (Array (_ BitVec 32) (_ BitVec 64))) (size!9509 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19327)

(declare-datatypes ((V!11475 0))(
  ( (V!11476 (val!3981 Int)) )
))
(declare-datatypes ((ValueCell!3593 0))(
  ( (ValueCellFull!3593 (v!6175 V!11475)) (EmptyCell!3593) )
))
(declare-datatypes ((array!19329 0))(
  ( (array!19330 (arr!9158 (Array (_ BitVec 32) ValueCell!3593)) (size!9510 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19329)

(assert (=> b!354566 (= res!196542 (and (= (size!9510 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9509 _keys!1456) (size!9510 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13317 () Bool)

(declare-fun mapRes!13317 () Bool)

(declare-fun tp!27213 () Bool)

(declare-fun e!217346 () Bool)

(assert (=> mapNonEmpty!13317 (= mapRes!13317 (and tp!27213 e!217346))))

(declare-fun mapKey!13317 () (_ BitVec 32))

(declare-fun mapRest!13317 () (Array (_ BitVec 32) ValueCell!3593))

(declare-fun mapValue!13317 () ValueCell!3593)

(assert (=> mapNonEmpty!13317 (= (arr!9158 _values!1208) (store mapRest!13317 mapKey!13317 mapValue!13317))))

(declare-fun b!354567 () Bool)

(declare-fun tp_is_empty!7873 () Bool)

(assert (=> b!354567 (= e!217346 tp_is_empty!7873)))

(declare-fun b!354568 () Bool)

(assert (=> b!354568 (= e!217344 false)))

(declare-fun lt!165725 () Bool)

(declare-datatypes ((List!5301 0))(
  ( (Nil!5298) (Cons!5297 (h!6153 (_ BitVec 64)) (t!10451 List!5301)) )
))
(declare-fun arrayNoDuplicates!0 (array!19327 (_ BitVec 32) List!5301) Bool)

(assert (=> b!354568 (= lt!165725 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5298))))

(declare-fun b!354569 () Bool)

(declare-fun e!217345 () Bool)

(declare-fun e!217342 () Bool)

(assert (=> b!354569 (= e!217345 (and e!217342 mapRes!13317))))

(declare-fun condMapEmpty!13317 () Bool)

(declare-fun mapDefault!13317 () ValueCell!3593)

