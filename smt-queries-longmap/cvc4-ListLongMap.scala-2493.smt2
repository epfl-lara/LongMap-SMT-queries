; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38780 () Bool)

(assert start!38780)

(declare-fun b!404402 () Bool)

(declare-fun e!243297 () Bool)

(declare-fun tp_is_empty!10199 () Bool)

(assert (=> b!404402 (= e!243297 tp_is_empty!10199)))

(declare-fun b!404403 () Bool)

(declare-fun e!243295 () Bool)

(declare-fun e!243298 () Bool)

(assert (=> b!404403 (= e!243295 e!243298)))

(declare-fun res!233210 () Bool)

(assert (=> b!404403 (=> (not res!233210) (not e!243298))))

(declare-datatypes ((array!24293 0))(
  ( (array!24294 (arr!11596 (Array (_ BitVec 32) (_ BitVec 64))) (size!11948 (_ BitVec 32))) )
))
(declare-fun lt!188177 () array!24293)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24293 (_ BitVec 32)) Bool)

(assert (=> b!404403 (= res!233210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188177 mask!1025))))

(declare-fun _keys!709 () array!24293)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404403 (= lt!188177 (array!24294 (store (arr!11596 _keys!709) i!563 k!794) (size!11948 _keys!709)))))

(declare-fun b!404404 () Bool)

(assert (=> b!404404 (= e!243298 false)))

(declare-fun lt!188176 () Bool)

(declare-datatypes ((List!6752 0))(
  ( (Nil!6749) (Cons!6748 (h!7604 (_ BitVec 64)) (t!11926 List!6752)) )
))
(declare-fun arrayNoDuplicates!0 (array!24293 (_ BitVec 32) List!6752) Bool)

(assert (=> b!404404 (= lt!188176 (arrayNoDuplicates!0 lt!188177 #b00000000000000000000000000000000 Nil!6749))))

(declare-fun mapNonEmpty!16920 () Bool)

(declare-fun mapRes!16920 () Bool)

(declare-fun tp!33039 () Bool)

(assert (=> mapNonEmpty!16920 (= mapRes!16920 (and tp!33039 e!243297))))

(declare-datatypes ((V!14703 0))(
  ( (V!14704 (val!5144 Int)) )
))
(declare-datatypes ((ValueCell!4756 0))(
  ( (ValueCellFull!4756 (v!7391 V!14703)) (EmptyCell!4756) )
))
(declare-fun mapRest!16920 () (Array (_ BitVec 32) ValueCell!4756))

(declare-fun mapValue!16920 () ValueCell!4756)

(declare-datatypes ((array!24295 0))(
  ( (array!24296 (arr!11597 (Array (_ BitVec 32) ValueCell!4756)) (size!11949 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24295)

(declare-fun mapKey!16920 () (_ BitVec 32))

(assert (=> mapNonEmpty!16920 (= (arr!11597 _values!549) (store mapRest!16920 mapKey!16920 mapValue!16920))))

(declare-fun b!404405 () Bool)

(declare-fun res!233213 () Bool)

(assert (=> b!404405 (=> (not res!233213) (not e!243295))))

(assert (=> b!404405 (= res!233213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404406 () Bool)

(declare-fun e!243299 () Bool)

(declare-fun e!243296 () Bool)

(assert (=> b!404406 (= e!243299 (and e!243296 mapRes!16920))))

(declare-fun condMapEmpty!16920 () Bool)

(declare-fun mapDefault!16920 () ValueCell!4756)

