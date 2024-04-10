; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39778 () Bool)

(assert start!39778)

(declare-fun b_free!10045 () Bool)

(declare-fun b_next!10045 () Bool)

(assert (=> start!39778 (= b_free!10045 (not b_next!10045))))

(declare-fun tp!35663 () Bool)

(declare-fun b_and!17749 () Bool)

(assert (=> start!39778 (= tp!35663 b_and!17749)))

(declare-fun b!428667 () Bool)

(declare-fun res!251657 () Bool)

(declare-fun e!254009 () Bool)

(assert (=> b!428667 (=> (not res!251657) (not e!254009))))

(declare-datatypes ((array!26231 0))(
  ( (array!26232 (arr!12565 (Array (_ BitVec 32) (_ BitVec 64))) (size!12917 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26231)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16035 0))(
  ( (V!16036 (val!5643 Int)) )
))
(declare-datatypes ((ValueCell!5255 0))(
  ( (ValueCellFull!5255 (v!7890 V!16035)) (EmptyCell!5255) )
))
(declare-datatypes ((array!26233 0))(
  ( (array!26234 (arr!12566 (Array (_ BitVec 32) ValueCell!5255)) (size!12918 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26233)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!428667 (= res!251657 (and (= (size!12918 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12917 _keys!709) (size!12918 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428668 () Bool)

(declare-fun res!251661 () Bool)

(assert (=> b!428668 (=> (not res!251661) (not e!254009))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428668 (= res!251661 (or (= (select (arr!12565 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12565 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428669 () Bool)

(declare-fun res!251655 () Bool)

(assert (=> b!428669 (=> (not res!251655) (not e!254009))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428669 (= res!251655 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!428670 () Bool)

(declare-fun e!254005 () Bool)

(assert (=> b!428670 (= e!254009 e!254005)))

(declare-fun res!251662 () Bool)

(assert (=> b!428670 (=> (not res!251662) (not e!254005))))

(declare-fun lt!195873 () array!26231)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26231 (_ BitVec 32)) Bool)

(assert (=> b!428670 (= res!251662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195873 mask!1025))))

(assert (=> b!428670 (= lt!195873 (array!26232 (store (arr!12565 _keys!709) i!563 k!794) (size!12917 _keys!709)))))

(declare-fun b!428671 () Bool)

(declare-fun res!251652 () Bool)

(assert (=> b!428671 (=> (not res!251652) (not e!254009))))

(declare-datatypes ((List!7443 0))(
  ( (Nil!7440) (Cons!7439 (h!8295 (_ BitVec 64)) (t!12937 List!7443)) )
))
(declare-fun arrayNoDuplicates!0 (array!26231 (_ BitVec 32) List!7443) Bool)

(assert (=> b!428671 (= res!251652 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7440))))

(declare-fun b!428672 () Bool)

(declare-datatypes ((Unit!12586 0))(
  ( (Unit!12587) )
))
(declare-fun e!254003 () Unit!12586)

(declare-fun Unit!12588 () Unit!12586)

(assert (=> b!428672 (= e!254003 Unit!12588)))

(declare-fun lt!195871 () Unit!12586)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26231 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12586)

(assert (=> b!428672 (= lt!195871 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428672 false))

(declare-fun b!428673 () Bool)

(declare-fun res!251659 () Bool)

(assert (=> b!428673 (=> (not res!251659) (not e!254009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428673 (= res!251659 (validKeyInArray!0 k!794))))

(declare-fun b!428674 () Bool)

(declare-fun e!254004 () Bool)

(declare-fun e!254006 () Bool)

(declare-fun mapRes!18417 () Bool)

(assert (=> b!428674 (= e!254004 (and e!254006 mapRes!18417))))

(declare-fun condMapEmpty!18417 () Bool)

(declare-fun mapDefault!18417 () ValueCell!5255)

