; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40336 () Bool)

(assert start!40336)

(declare-fun mapNonEmpty!19227 () Bool)

(declare-fun mapRes!19227 () Bool)

(declare-fun tp!37209 () Bool)

(declare-fun e!260747 () Bool)

(assert (=> mapNonEmpty!19227 (= mapRes!19227 (and tp!37209 e!260747))))

(declare-fun mapKey!19227 () (_ BitVec 32))

(declare-datatypes ((V!16751 0))(
  ( (V!16752 (val!5912 Int)) )
))
(declare-datatypes ((ValueCell!5524 0))(
  ( (ValueCellFull!5524 (v!8163 V!16751)) (EmptyCell!5524) )
))
(declare-fun mapValue!19227 () ValueCell!5524)

(declare-datatypes ((array!27281 0))(
  ( (array!27282 (arr!13089 (Array (_ BitVec 32) ValueCell!5524)) (size!13441 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27281)

(declare-fun mapRest!19227 () (Array (_ BitVec 32) ValueCell!5524))

(assert (=> mapNonEmpty!19227 (= (arr!13089 _values!549) (store mapRest!19227 mapKey!19227 mapValue!19227))))

(declare-fun b!443112 () Bool)

(declare-fun res!262535 () Bool)

(declare-fun e!260751 () Bool)

(assert (=> b!443112 (=> (not res!262535) (not e!260751))))

(declare-datatypes ((array!27283 0))(
  ( (array!27284 (arr!13090 (Array (_ BitVec 32) (_ BitVec 64))) (size!13442 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27283)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443112 (= res!262535 (or (= (select (arr!13090 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13090 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443113 () Bool)

(declare-fun e!260750 () Bool)

(assert (=> b!443113 (= e!260751 e!260750)))

(declare-fun res!262526 () Bool)

(assert (=> b!443113 (=> (not res!262526) (not e!260750))))

(declare-fun lt!203294 () array!27283)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27283 (_ BitVec 32)) Bool)

(assert (=> b!443113 (= res!262526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203294 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!443113 (= lt!203294 (array!27284 (store (arr!13090 _keys!709) i!563 k!794) (size!13442 _keys!709)))))

(declare-fun b!443114 () Bool)

(declare-fun res!262527 () Bool)

(assert (=> b!443114 (=> (not res!262527) (not e!260751))))

(assert (=> b!443114 (= res!262527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443115 () Bool)

(declare-fun res!262530 () Bool)

(assert (=> b!443115 (=> (not res!262530) (not e!260751))))

(declare-fun arrayContainsKey!0 (array!27283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443115 (= res!262530 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!443116 () Bool)

(declare-fun e!260748 () Bool)

(declare-fun e!260749 () Bool)

(assert (=> b!443116 (= e!260748 (and e!260749 mapRes!19227))))

(declare-fun condMapEmpty!19227 () Bool)

(declare-fun mapDefault!19227 () ValueCell!5524)

