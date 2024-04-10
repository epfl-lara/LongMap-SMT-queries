; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39962 () Bool)

(assert start!39962)

(declare-fun b_free!10229 () Bool)

(declare-fun b_next!10229 () Bool)

(assert (=> start!39962 (= b_free!10229 (not b_next!10229))))

(declare-fun tp!36215 () Bool)

(declare-fun b_and!18117 () Bool)

(assert (=> start!39962 (= tp!36215 b_and!18117)))

(declare-fun b!434300 () Bool)

(declare-fun e!256698 () Bool)

(assert (=> b!434300 (= e!256698 true)))

(declare-datatypes ((V!16279 0))(
  ( (V!16280 (val!5735 Int)) )
))
(declare-datatypes ((tuple2!7588 0))(
  ( (tuple2!7589 (_1!3805 (_ BitVec 64)) (_2!3805 V!16279)) )
))
(declare-datatypes ((List!7592 0))(
  ( (Nil!7589) (Cons!7588 (h!8444 tuple2!7588) (t!13270 List!7592)) )
))
(declare-datatypes ((ListLongMap!6501 0))(
  ( (ListLongMap!6502 (toList!3266 List!7592)) )
))
(declare-fun lt!199670 () ListLongMap!6501)

(declare-fun lt!199667 () tuple2!7588)

(declare-fun lt!199669 () ListLongMap!6501)

(declare-fun lt!199668 () tuple2!7588)

(declare-fun +!1414 (ListLongMap!6501 tuple2!7588) ListLongMap!6501)

(assert (=> b!434300 (= lt!199669 (+!1414 (+!1414 lt!199670 lt!199667) lt!199668))))

(declare-fun lt!199663 () V!16279)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16279)

(declare-datatypes ((Unit!12877 0))(
  ( (Unit!12878) )
))
(declare-fun lt!199664 () Unit!12877)

(declare-datatypes ((array!26595 0))(
  ( (array!26596 (arr!12747 (Array (_ BitVec 32) (_ BitVec 64))) (size!13099 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26595)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!400 (ListLongMap!6501 (_ BitVec 64) V!16279 (_ BitVec 64) V!16279) Unit!12877)

(assert (=> b!434300 (= lt!199664 (addCommutativeForDiffKeys!400 lt!199670 k!794 v!412 (select (arr!12747 _keys!709) from!863) lt!199663))))

(declare-fun b!434301 () Bool)

(declare-fun res!255727 () Bool)

(declare-fun e!256697 () Bool)

(assert (=> b!434301 (=> (not res!255727) (not e!256697))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434301 (= res!255727 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13099 _keys!709))))))

(declare-fun b!434302 () Bool)

(declare-fun res!255726 () Bool)

(assert (=> b!434302 (=> (not res!255726) (not e!256697))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26595 (_ BitVec 32)) Bool)

(assert (=> b!434302 (= res!255726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!434303 () Bool)

(declare-fun res!255734 () Bool)

(declare-fun e!256695 () Bool)

(assert (=> b!434303 (=> (not res!255734) (not e!256695))))

(declare-fun lt!199660 () array!26595)

(declare-datatypes ((List!7593 0))(
  ( (Nil!7590) (Cons!7589 (h!8445 (_ BitVec 64)) (t!13271 List!7593)) )
))
(declare-fun arrayNoDuplicates!0 (array!26595 (_ BitVec 32) List!7593) Bool)

(assert (=> b!434303 (= res!255734 (arrayNoDuplicates!0 lt!199660 #b00000000000000000000000000000000 Nil!7590))))

(declare-fun b!434304 () Bool)

(declare-fun res!255731 () Bool)

(assert (=> b!434304 (=> (not res!255731) (not e!256697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434304 (= res!255731 (validMask!0 mask!1025))))

(declare-fun b!434305 () Bool)

(declare-fun res!255725 () Bool)

(assert (=> b!434305 (=> (not res!255725) (not e!256697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434305 (= res!255725 (validKeyInArray!0 k!794))))

(declare-fun b!434306 () Bool)

(declare-fun res!255723 () Bool)

(assert (=> b!434306 (=> (not res!255723) (not e!256697))))

(assert (=> b!434306 (= res!255723 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7590))))

(declare-fun b!434307 () Bool)

(declare-fun e!256694 () Unit!12877)

(declare-fun Unit!12879 () Unit!12877)

(assert (=> b!434307 (= e!256694 Unit!12879)))

(declare-fun b!434308 () Bool)

(declare-fun res!255721 () Bool)

(assert (=> b!434308 (=> (not res!255721) (not e!256697))))

(declare-fun arrayContainsKey!0 (array!26595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434308 (= res!255721 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18693 () Bool)

(declare-fun mapRes!18693 () Bool)

(assert (=> mapIsEmpty!18693 mapRes!18693))

(declare-fun b!434309 () Bool)

(declare-fun e!256699 () Bool)

(declare-fun e!256700 () Bool)

(assert (=> b!434309 (= e!256699 (not e!256700))))

(declare-fun res!255730 () Bool)

(assert (=> b!434309 (=> res!255730 e!256700)))

(assert (=> b!434309 (= res!255730 (not (validKeyInArray!0 (select (arr!12747 _keys!709) from!863))))))

(declare-fun lt!199659 () ListLongMap!6501)

(declare-fun lt!199658 () ListLongMap!6501)

(assert (=> b!434309 (= lt!199659 lt!199658)))

(assert (=> b!434309 (= lt!199658 (+!1414 lt!199670 lt!199668))))

(declare-fun minValue!515 () V!16279)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16279)

(declare-datatypes ((ValueCell!5347 0))(
  ( (ValueCellFull!5347 (v!7982 V!16279)) (EmptyCell!5347) )
))
(declare-datatypes ((array!26597 0))(
  ( (array!26598 (arr!12748 (Array (_ BitVec 32) ValueCell!5347)) (size!13100 (_ BitVec 32))) )
))
(declare-fun lt!199666 () array!26597)

(declare-fun getCurrentListMapNoExtraKeys!1459 (array!26595 array!26597 (_ BitVec 32) (_ BitVec 32) V!16279 V!16279 (_ BitVec 32) Int) ListLongMap!6501)

(assert (=> b!434309 (= lt!199659 (getCurrentListMapNoExtraKeys!1459 lt!199660 lt!199666 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434309 (= lt!199668 (tuple2!7589 k!794 v!412))))

(declare-fun _values!549 () array!26597)

(assert (=> b!434309 (= lt!199670 (getCurrentListMapNoExtraKeys!1459 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!199661 () Unit!12877)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!590 (array!26595 array!26597 (_ BitVec 32) (_ BitVec 32) V!16279 V!16279 (_ BitVec 32) (_ BitVec 64) V!16279 (_ BitVec 32) Int) Unit!12877)

(assert (=> b!434309 (= lt!199661 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!590 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434310 () Bool)

(declare-fun e!256696 () Bool)

(declare-fun e!256693 () Bool)

(assert (=> b!434310 (= e!256696 (and e!256693 mapRes!18693))))

(declare-fun condMapEmpty!18693 () Bool)

(declare-fun mapDefault!18693 () ValueCell!5347)

