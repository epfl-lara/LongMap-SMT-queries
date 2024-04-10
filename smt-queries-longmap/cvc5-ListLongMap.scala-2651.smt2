; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39724 () Bool)

(assert start!39724)

(declare-fun b_free!9991 () Bool)

(declare-fun b_next!9991 () Bool)

(assert (=> start!39724 (= b_free!9991 (not b_next!9991))))

(declare-fun tp!35502 () Bool)

(declare-fun b_and!17647 () Bool)

(assert (=> start!39724 (= tp!35502 b_and!17647)))

(declare-fun res!250523 () Bool)

(declare-fun e!253338 () Bool)

(assert (=> start!39724 (=> (not res!250523) (not e!253338))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26123 0))(
  ( (array!26124 (arr!12511 (Array (_ BitVec 32) (_ BitVec 64))) (size!12863 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26123)

(assert (=> start!39724 (= res!250523 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12863 _keys!709))))))

(assert (=> start!39724 e!253338))

(declare-fun tp_is_empty!11143 () Bool)

(assert (=> start!39724 tp_is_empty!11143))

(assert (=> start!39724 tp!35502))

(assert (=> start!39724 true))

(declare-datatypes ((V!15963 0))(
  ( (V!15964 (val!5616 Int)) )
))
(declare-datatypes ((ValueCell!5228 0))(
  ( (ValueCellFull!5228 (v!7863 V!15963)) (EmptyCell!5228) )
))
(declare-datatypes ((array!26125 0))(
  ( (array!26126 (arr!12512 (Array (_ BitVec 32) ValueCell!5228)) (size!12864 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26125)

(declare-fun e!253337 () Bool)

(declare-fun array_inv!9116 (array!26125) Bool)

(assert (=> start!39724 (and (array_inv!9116 _values!549) e!253337)))

(declare-fun array_inv!9117 (array!26123) Bool)

(assert (=> start!39724 (array_inv!9117 _keys!709)))

(declare-fun b!427201 () Bool)

(declare-fun e!253334 () Bool)

(declare-fun e!253336 () Bool)

(assert (=> b!427201 (= e!253334 e!253336)))

(declare-fun res!250522 () Bool)

(assert (=> b!427201 (=> (not res!250522) (not e!253336))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427201 (= res!250522 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15963)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15963)

(declare-fun lt!195200 () array!26125)

(declare-datatypes ((tuple2!7378 0))(
  ( (tuple2!7379 (_1!3700 (_ BitVec 64)) (_2!3700 V!15963)) )
))
(declare-datatypes ((List!7394 0))(
  ( (Nil!7391) (Cons!7390 (h!8246 tuple2!7378) (t!12838 List!7394)) )
))
(declare-datatypes ((ListLongMap!6291 0))(
  ( (ListLongMap!6292 (toList!3161 List!7394)) )
))
(declare-fun lt!195203 () ListLongMap!6291)

(declare-fun lt!195199 () array!26123)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1365 (array!26123 array!26125 (_ BitVec 32) (_ BitVec 32) V!15963 V!15963 (_ BitVec 32) Int) ListLongMap!6291)

(assert (=> b!427201 (= lt!195203 (getCurrentListMapNoExtraKeys!1365 lt!195199 lt!195200 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15963)

(assert (=> b!427201 (= lt!195200 (array!26126 (store (arr!12512 _values!549) i!563 (ValueCellFull!5228 v!412)) (size!12864 _values!549)))))

(declare-fun lt!195201 () ListLongMap!6291)

(assert (=> b!427201 (= lt!195201 (getCurrentListMapNoExtraKeys!1365 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427202 () Bool)

(declare-fun res!250525 () Bool)

(assert (=> b!427202 (=> (not res!250525) (not e!253334))))

(declare-datatypes ((List!7395 0))(
  ( (Nil!7392) (Cons!7391 (h!8247 (_ BitVec 64)) (t!12839 List!7395)) )
))
(declare-fun arrayNoDuplicates!0 (array!26123 (_ BitVec 32) List!7395) Bool)

(assert (=> b!427202 (= res!250525 (arrayNoDuplicates!0 lt!195199 #b00000000000000000000000000000000 Nil!7392))))

(declare-fun b!427203 () Bool)

(assert (=> b!427203 (= e!253338 e!253334)))

(declare-fun res!250530 () Bool)

(assert (=> b!427203 (=> (not res!250530) (not e!253334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26123 (_ BitVec 32)) Bool)

(assert (=> b!427203 (= res!250530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195199 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!427203 (= lt!195199 (array!26124 (store (arr!12511 _keys!709) i!563 k!794) (size!12863 _keys!709)))))

(declare-fun b!427204 () Bool)

(declare-fun res!250527 () Bool)

(assert (=> b!427204 (=> (not res!250527) (not e!253338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427204 (= res!250527 (validKeyInArray!0 k!794))))

(declare-fun b!427205 () Bool)

(declare-fun e!253340 () Bool)

(declare-fun mapRes!18336 () Bool)

(assert (=> b!427205 (= e!253337 (and e!253340 mapRes!18336))))

(declare-fun condMapEmpty!18336 () Bool)

(declare-fun mapDefault!18336 () ValueCell!5228)

