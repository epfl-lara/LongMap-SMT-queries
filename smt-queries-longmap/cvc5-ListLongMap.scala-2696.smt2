; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39994 () Bool)

(assert start!39994)

(declare-fun b_free!10261 () Bool)

(declare-fun b_next!10261 () Bool)

(assert (=> start!39994 (= b_free!10261 (not b_next!10261))))

(declare-fun tp!36312 () Bool)

(declare-fun b_and!18181 () Bool)

(assert (=> start!39994 (= tp!36312 b_and!18181)))

(declare-fun b!435292 () Bool)

(declare-datatypes ((Unit!12921 0))(
  ( (Unit!12922) )
))
(declare-fun e!257173 () Unit!12921)

(declare-fun Unit!12923 () Unit!12921)

(assert (=> b!435292 (= e!257173 Unit!12923)))

(declare-fun lt!200382 () Unit!12921)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26655 0))(
  ( (array!26656 (arr!12777 (Array (_ BitVec 32) (_ BitVec 64))) (size!13129 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26655)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26655 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12921)

(assert (=> b!435292 (= lt!200382 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435292 false))

(declare-fun b!435293 () Bool)

(declare-fun e!257178 () Bool)

(declare-fun e!257175 () Bool)

(assert (=> b!435293 (= e!257178 e!257175)))

(declare-fun res!256453 () Bool)

(assert (=> b!435293 (=> (not res!256453) (not e!257175))))

(declare-fun lt!200384 () array!26655)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26655 (_ BitVec 32)) Bool)

(assert (=> b!435293 (= res!256453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200384 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!435293 (= lt!200384 (array!26656 (store (arr!12777 _keys!709) i!563 k!794) (size!13129 _keys!709)))))

(declare-fun b!435294 () Bool)

(declare-fun res!256446 () Bool)

(assert (=> b!435294 (=> (not res!256446) (not e!257178))))

(assert (=> b!435294 (= res!256446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435295 () Bool)

(declare-fun res!256442 () Bool)

(assert (=> b!435295 (=> (not res!256442) (not e!257178))))

(assert (=> b!435295 (= res!256442 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13129 _keys!709))))))

(declare-fun mapNonEmpty!18741 () Bool)

(declare-fun mapRes!18741 () Bool)

(declare-fun tp!36311 () Bool)

(declare-fun e!257180 () Bool)

(assert (=> mapNonEmpty!18741 (= mapRes!18741 (and tp!36311 e!257180))))

(declare-datatypes ((V!16323 0))(
  ( (V!16324 (val!5751 Int)) )
))
(declare-datatypes ((ValueCell!5363 0))(
  ( (ValueCellFull!5363 (v!7998 V!16323)) (EmptyCell!5363) )
))
(declare-fun mapRest!18741 () (Array (_ BitVec 32) ValueCell!5363))

(declare-datatypes ((array!26657 0))(
  ( (array!26658 (arr!12778 (Array (_ BitVec 32) ValueCell!5363)) (size!13130 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26657)

(declare-fun mapKey!18741 () (_ BitVec 32))

(declare-fun mapValue!18741 () ValueCell!5363)

(assert (=> mapNonEmpty!18741 (= (arr!12778 _values!549) (store mapRest!18741 mapKey!18741 mapValue!18741))))

(declare-fun b!435296 () Bool)

(declare-fun res!256452 () Bool)

(assert (=> b!435296 (=> (not res!256452) (not e!257178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435296 (= res!256452 (validKeyInArray!0 k!794))))

(declare-fun res!256448 () Bool)

(assert (=> start!39994 (=> (not res!256448) (not e!257178))))

(assert (=> start!39994 (= res!256448 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13129 _keys!709))))))

(assert (=> start!39994 e!257178))

(declare-fun tp_is_empty!11413 () Bool)

(assert (=> start!39994 tp_is_empty!11413))

(assert (=> start!39994 tp!36312))

(assert (=> start!39994 true))

(declare-fun e!257181 () Bool)

(declare-fun array_inv!9288 (array!26657) Bool)

(assert (=> start!39994 (and (array_inv!9288 _values!549) e!257181)))

(declare-fun array_inv!9289 (array!26655) Bool)

(assert (=> start!39994 (array_inv!9289 _keys!709)))

(declare-fun b!435297 () Bool)

(declare-fun e!257176 () Bool)

(assert (=> b!435297 (= e!257181 (and e!257176 mapRes!18741))))

(declare-fun condMapEmpty!18741 () Bool)

(declare-fun mapDefault!18741 () ValueCell!5363)

