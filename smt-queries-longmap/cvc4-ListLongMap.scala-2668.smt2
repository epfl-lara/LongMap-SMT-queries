; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39830 () Bool)

(assert start!39830)

(declare-fun b_free!10097 () Bool)

(declare-fun b_next!10097 () Bool)

(assert (=> start!39830 (= b_free!10097 (not b_next!10097))))

(declare-fun tp!35819 () Bool)

(declare-fun b_and!17853 () Bool)

(assert (=> start!39830 (= tp!35819 b_and!17853)))

(declare-fun b!430208 () Bool)

(declare-datatypes ((Unit!12655 0))(
  ( (Unit!12656) )
))
(declare-fun e!254717 () Unit!12655)

(declare-fun Unit!12657 () Unit!12655)

(assert (=> b!430208 (= e!254717 Unit!12657)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!196696 () Unit!12655)

(declare-datatypes ((array!26333 0))(
  ( (array!26334 (arr!12616 (Array (_ BitVec 32) (_ BitVec 64))) (size!12968 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26333)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26333 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12655)

(assert (=> b!430208 (= lt!196696 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430208 false))

(declare-fun b!430209 () Bool)

(declare-fun res!252755 () Bool)

(declare-fun e!254720 () Bool)

(assert (=> b!430209 (=> (not res!252755) (not e!254720))))

(declare-fun lt!196694 () array!26333)

(declare-datatypes ((List!7484 0))(
  ( (Nil!7481) (Cons!7480 (h!8336 (_ BitVec 64)) (t!13030 List!7484)) )
))
(declare-fun arrayNoDuplicates!0 (array!26333 (_ BitVec 32) List!7484) Bool)

(assert (=> b!430209 (= res!252755 (arrayNoDuplicates!0 lt!196694 #b00000000000000000000000000000000 Nil!7481))))

(declare-fun b!430210 () Bool)

(declare-fun e!254719 () Bool)

(assert (=> b!430210 (= e!254719 e!254720)))

(declare-fun res!252760 () Bool)

(assert (=> b!430210 (=> (not res!252760) (not e!254720))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26333 (_ BitVec 32)) Bool)

(assert (=> b!430210 (= res!252760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196694 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430210 (= lt!196694 (array!26334 (store (arr!12616 _keys!709) i!563 k!794) (size!12968 _keys!709)))))

(declare-fun b!430211 () Bool)

(declare-fun res!252759 () Bool)

(assert (=> b!430211 (=> (not res!252759) (not e!254719))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16103 0))(
  ( (V!16104 (val!5669 Int)) )
))
(declare-datatypes ((ValueCell!5281 0))(
  ( (ValueCellFull!5281 (v!7916 V!16103)) (EmptyCell!5281) )
))
(declare-datatypes ((array!26335 0))(
  ( (array!26336 (arr!12617 (Array (_ BitVec 32) ValueCell!5281)) (size!12969 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26335)

(assert (=> b!430211 (= res!252759 (and (= (size!12969 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12968 _keys!709) (size!12969 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430212 () Bool)

(declare-fun res!252764 () Bool)

(assert (=> b!430212 (=> (not res!252764) (not e!254719))))

(assert (=> b!430212 (= res!252764 (or (= (select (arr!12616 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12616 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430213 () Bool)

(declare-fun e!254714 () Bool)

(declare-fun e!254715 () Bool)

(declare-fun mapRes!18495 () Bool)

(assert (=> b!430213 (= e!254714 (and e!254715 mapRes!18495))))

(declare-fun condMapEmpty!18495 () Bool)

(declare-fun mapDefault!18495 () ValueCell!5281)

