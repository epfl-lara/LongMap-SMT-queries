; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40330 () Bool)

(assert start!40330)

(declare-fun res!262436 () Bool)

(declare-fun e!260696 () Bool)

(assert (=> start!40330 (=> (not res!262436) (not e!260696))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27269 0))(
  ( (array!27270 (arr!13083 (Array (_ BitVec 32) (_ BitVec 64))) (size!13435 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27269)

(assert (=> start!40330 (= res!262436 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13435 _keys!709))))))

(assert (=> start!40330 e!260696))

(assert (=> start!40330 true))

(declare-datatypes ((V!16743 0))(
  ( (V!16744 (val!5909 Int)) )
))
(declare-datatypes ((ValueCell!5521 0))(
  ( (ValueCellFull!5521 (v!8160 V!16743)) (EmptyCell!5521) )
))
(declare-datatypes ((array!27271 0))(
  ( (array!27272 (arr!13084 (Array (_ BitVec 32) ValueCell!5521)) (size!13436 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27271)

(declare-fun e!260693 () Bool)

(declare-fun array_inv!9488 (array!27271) Bool)

(assert (=> start!40330 (and (array_inv!9488 _values!549) e!260693)))

(declare-fun array_inv!9489 (array!27269) Bool)

(assert (=> start!40330 (array_inv!9489 _keys!709)))

(declare-fun b!442995 () Bool)

(declare-fun e!260694 () Bool)

(assert (=> b!442995 (= e!260694 false)))

(declare-fun lt!203276 () Bool)

(declare-fun lt!203275 () array!27269)

(declare-datatypes ((List!7848 0))(
  ( (Nil!7845) (Cons!7844 (h!8700 (_ BitVec 64)) (t!13606 List!7848)) )
))
(declare-fun arrayNoDuplicates!0 (array!27269 (_ BitVec 32) List!7848) Bool)

(assert (=> b!442995 (= lt!203276 (arrayNoDuplicates!0 lt!203275 #b00000000000000000000000000000000 Nil!7845))))

(declare-fun b!442996 () Bool)

(declare-fun res!262441 () Bool)

(assert (=> b!442996 (=> (not res!262441) (not e!260696))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27269 (_ BitVec 32)) Bool)

(assert (=> b!442996 (= res!262441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442997 () Bool)

(assert (=> b!442997 (= e!260696 e!260694)))

(declare-fun res!262443 () Bool)

(assert (=> b!442997 (=> (not res!262443) (not e!260694))))

(assert (=> b!442997 (= res!262443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203275 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442997 (= lt!203275 (array!27270 (store (arr!13083 _keys!709) i!563 k!794) (size!13435 _keys!709)))))

(declare-fun b!442998 () Bool)

(declare-fun e!260698 () Bool)

(declare-fun mapRes!19218 () Bool)

(assert (=> b!442998 (= e!260693 (and e!260698 mapRes!19218))))

(declare-fun condMapEmpty!19218 () Bool)

(declare-fun mapDefault!19218 () ValueCell!5521)

