; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39776 () Bool)

(assert start!39776)

(declare-fun b_free!10043 () Bool)

(declare-fun b_next!10043 () Bool)

(assert (=> start!39776 (= b_free!10043 (not b_next!10043))))

(declare-fun tp!35657 () Bool)

(declare-fun b_and!17745 () Bool)

(assert (=> start!39776 (= tp!35657 b_and!17745)))

(declare-fun b!428607 () Bool)

(declare-fun res!251616 () Bool)

(declare-fun e!253980 () Bool)

(assert (=> b!428607 (=> (not res!251616) (not e!253980))))

(declare-datatypes ((array!26227 0))(
  ( (array!26228 (arr!12563 (Array (_ BitVec 32) (_ BitVec 64))) (size!12915 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26227)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26227 (_ BitVec 32)) Bool)

(assert (=> b!428607 (= res!251616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428608 () Bool)

(declare-fun res!251621 () Bool)

(assert (=> b!428608 (=> (not res!251621) (not e!253980))))

(declare-datatypes ((List!7441 0))(
  ( (Nil!7438) (Cons!7437 (h!8293 (_ BitVec 64)) (t!12933 List!7441)) )
))
(declare-fun arrayNoDuplicates!0 (array!26227 (_ BitVec 32) List!7441) Bool)

(assert (=> b!428608 (= res!251621 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7438))))

(declare-fun b!428609 () Bool)

(declare-fun e!253979 () Bool)

(declare-fun tp_is_empty!11195 () Bool)

(assert (=> b!428609 (= e!253979 tp_is_empty!11195)))

(declare-fun b!428610 () Bool)

(declare-datatypes ((Unit!12582 0))(
  ( (Unit!12583) )
))
(declare-fun e!253978 () Unit!12582)

(declare-fun Unit!12584 () Unit!12582)

(assert (=> b!428610 (= e!253978 Unit!12584)))

(declare-fun lt!195843 () Unit!12582)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12582)

(assert (=> b!428610 (= lt!195843 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428610 false))

(declare-fun b!428612 () Bool)

(declare-fun Unit!12585 () Unit!12582)

(assert (=> b!428612 (= e!253978 Unit!12585)))

(declare-fun b!428613 () Bool)

(declare-fun res!251610 () Bool)

(assert (=> b!428613 (=> (not res!251610) (not e!253980))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428613 (= res!251610 (or (= (select (arr!12563 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12563 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428614 () Bool)

(declare-fun e!253975 () Bool)

(declare-fun e!253977 () Bool)

(assert (=> b!428614 (= e!253975 e!253977)))

(declare-fun res!251613 () Bool)

(assert (=> b!428614 (=> (not res!251613) (not e!253977))))

(assert (=> b!428614 (= res!251613 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16031 0))(
  ( (V!16032 (val!5642 Int)) )
))
(declare-fun minValue!515 () V!16031)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16031)

(declare-fun lt!195841 () array!26227)

(declare-datatypes ((tuple2!7428 0))(
  ( (tuple2!7429 (_1!3725 (_ BitVec 64)) (_2!3725 V!16031)) )
))
(declare-datatypes ((List!7442 0))(
  ( (Nil!7439) (Cons!7438 (h!8294 tuple2!7428) (t!12934 List!7442)) )
))
(declare-datatypes ((ListLongMap!6341 0))(
  ( (ListLongMap!6342 (toList!3186 List!7442)) )
))
(declare-fun lt!195844 () ListLongMap!6341)

(declare-datatypes ((ValueCell!5254 0))(
  ( (ValueCellFull!5254 (v!7889 V!16031)) (EmptyCell!5254) )
))
(declare-datatypes ((array!26229 0))(
  ( (array!26230 (arr!12564 (Array (_ BitVec 32) ValueCell!5254)) (size!12916 (_ BitVec 32))) )
))
(declare-fun lt!195837 () array!26229)

(declare-fun getCurrentListMapNoExtraKeys!1388 (array!26227 array!26229 (_ BitVec 32) (_ BitVec 32) V!16031 V!16031 (_ BitVec 32) Int) ListLongMap!6341)

(assert (=> b!428614 (= lt!195844 (getCurrentListMapNoExtraKeys!1388 lt!195841 lt!195837 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26229)

(declare-fun v!412 () V!16031)

(assert (=> b!428614 (= lt!195837 (array!26230 (store (arr!12564 _values!549) i!563 (ValueCellFull!5254 v!412)) (size!12916 _values!549)))))

(declare-fun lt!195838 () ListLongMap!6341)

(assert (=> b!428614 (= lt!195838 (getCurrentListMapNoExtraKeys!1388 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428615 () Bool)

(declare-fun e!253983 () Bool)

(declare-fun e!253982 () Bool)

(declare-fun mapRes!18414 () Bool)

(assert (=> b!428615 (= e!253983 (and e!253982 mapRes!18414))))

(declare-fun condMapEmpty!18414 () Bool)

(declare-fun mapDefault!18414 () ValueCell!5254)

