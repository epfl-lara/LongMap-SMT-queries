; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38986 () Bool)

(assert start!38986)

(declare-fun b!408419 () Bool)

(declare-fun res!236299 () Bool)

(declare-fun e!245152 () Bool)

(assert (=> b!408419 (=> (not res!236299) (not e!245152))))

(declare-datatypes ((array!24685 0))(
  ( (array!24686 (arr!11792 (Array (_ BitVec 32) (_ BitVec 64))) (size!12144 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24685)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24685 (_ BitVec 32)) Bool)

(assert (=> b!408419 (= res!236299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408420 () Bool)

(declare-fun res!236298 () Bool)

(assert (=> b!408420 (=> (not res!236298) (not e!245152))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408420 (= res!236298 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12144 _keys!709))))))

(declare-fun mapNonEmpty!17229 () Bool)

(declare-fun mapRes!17229 () Bool)

(declare-fun tp!33348 () Bool)

(declare-fun e!245150 () Bool)

(assert (=> mapNonEmpty!17229 (= mapRes!17229 (and tp!33348 e!245150))))

(declare-datatypes ((V!14979 0))(
  ( (V!14980 (val!5247 Int)) )
))
(declare-datatypes ((ValueCell!4859 0))(
  ( (ValueCellFull!4859 (v!7494 V!14979)) (EmptyCell!4859) )
))
(declare-fun mapValue!17229 () ValueCell!4859)

(declare-fun mapKey!17229 () (_ BitVec 32))

(declare-datatypes ((array!24687 0))(
  ( (array!24688 (arr!11793 (Array (_ BitVec 32) ValueCell!4859)) (size!12145 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24687)

(declare-fun mapRest!17229 () (Array (_ BitVec 32) ValueCell!4859))

(assert (=> mapNonEmpty!17229 (= (arr!11793 _values!549) (store mapRest!17229 mapKey!17229 mapValue!17229))))

(declare-fun b!408421 () Bool)

(declare-fun e!245149 () Bool)

(assert (=> b!408421 (= e!245149 false)))

(declare-fun lt!188795 () Bool)

(declare-fun lt!188794 () array!24685)

(declare-datatypes ((List!6833 0))(
  ( (Nil!6830) (Cons!6829 (h!7685 (_ BitVec 64)) (t!12007 List!6833)) )
))
(declare-fun arrayNoDuplicates!0 (array!24685 (_ BitVec 32) List!6833) Bool)

(assert (=> b!408421 (= lt!188795 (arrayNoDuplicates!0 lt!188794 #b00000000000000000000000000000000 Nil!6830))))

(declare-fun mapIsEmpty!17229 () Bool)

(assert (=> mapIsEmpty!17229 mapRes!17229))

(declare-fun b!408422 () Bool)

(declare-fun res!236307 () Bool)

(assert (=> b!408422 (=> (not res!236307) (not e!245152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408422 (= res!236307 (validMask!0 mask!1025))))

(declare-fun res!236306 () Bool)

(assert (=> start!38986 (=> (not res!236306) (not e!245152))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38986 (= res!236306 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12144 _keys!709))))))

(assert (=> start!38986 e!245152))

(assert (=> start!38986 true))

(declare-fun e!245154 () Bool)

(declare-fun array_inv!8602 (array!24687) Bool)

(assert (=> start!38986 (and (array_inv!8602 _values!549) e!245154)))

(declare-fun array_inv!8603 (array!24685) Bool)

(assert (=> start!38986 (array_inv!8603 _keys!709)))

(declare-fun b!408423 () Bool)

(declare-fun res!236300 () Bool)

(assert (=> b!408423 (=> (not res!236300) (not e!245152))))

(assert (=> b!408423 (= res!236300 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6830))))

(declare-fun b!408424 () Bool)

(assert (=> b!408424 (= e!245152 e!245149)))

(declare-fun res!236304 () Bool)

(assert (=> b!408424 (=> (not res!236304) (not e!245149))))

(assert (=> b!408424 (= res!236304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188794 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!408424 (= lt!188794 (array!24686 (store (arr!11792 _keys!709) i!563 k!794) (size!12144 _keys!709)))))

(declare-fun b!408425 () Bool)

(declare-fun e!245151 () Bool)

(declare-fun tp_is_empty!10405 () Bool)

(assert (=> b!408425 (= e!245151 tp_is_empty!10405)))

(declare-fun b!408426 () Bool)

(declare-fun res!236302 () Bool)

(assert (=> b!408426 (=> (not res!236302) (not e!245152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408426 (= res!236302 (validKeyInArray!0 k!794))))

(declare-fun b!408427 () Bool)

(declare-fun res!236305 () Bool)

(assert (=> b!408427 (=> (not res!236305) (not e!245152))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408427 (= res!236305 (and (= (size!12145 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12144 _keys!709) (size!12145 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408428 () Bool)

(declare-fun res!236301 () Bool)

(assert (=> b!408428 (=> (not res!236301) (not e!245152))))

(assert (=> b!408428 (= res!236301 (or (= (select (arr!11792 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11792 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408429 () Bool)

(assert (=> b!408429 (= e!245154 (and e!245151 mapRes!17229))))

(declare-fun condMapEmpty!17229 () Bool)

(declare-fun mapDefault!17229 () ValueCell!4859)

