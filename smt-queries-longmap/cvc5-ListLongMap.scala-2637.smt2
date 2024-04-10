; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39640 () Bool)

(assert start!39640)

(declare-fun b_free!9907 () Bool)

(declare-fun b_next!9907 () Bool)

(assert (=> start!39640 (= b_free!9907 (not b_next!9907))))

(declare-fun tp!35249 () Bool)

(declare-fun b_and!17563 () Bool)

(assert (=> start!39640 (= tp!35249 b_and!17563)))

(declare-fun mapIsEmpty!18210 () Bool)

(declare-fun mapRes!18210 () Bool)

(assert (=> mapIsEmpty!18210 mapRes!18210))

(declare-fun b!425183 () Bool)

(declare-fun res!248877 () Bool)

(declare-fun e!252454 () Bool)

(assert (=> b!425183 (=> (not res!248877) (not e!252454))))

(declare-datatypes ((array!25957 0))(
  ( (array!25958 (arr!12428 (Array (_ BitVec 32) (_ BitVec 64))) (size!12780 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25957)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425183 (= res!248877 (or (= (select (arr!12428 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12428 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425184 () Bool)

(declare-fun res!248880 () Bool)

(declare-fun e!252452 () Bool)

(assert (=> b!425184 (=> (not res!248880) (not e!252452))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!425184 (= res!248880 (bvsle from!863 i!563))))

(declare-fun b!425185 () Bool)

(assert (=> b!425185 (= e!252454 e!252452)))

(declare-fun res!248883 () Bool)

(assert (=> b!425185 (=> (not res!248883) (not e!252452))))

(declare-fun lt!194570 () array!25957)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25957 (_ BitVec 32)) Bool)

(assert (=> b!425185 (= res!248883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194570 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!425185 (= lt!194570 (array!25958 (store (arr!12428 _keys!709) i!563 k!794) (size!12780 _keys!709)))))

(declare-fun b!425186 () Bool)

(declare-fun res!248882 () Bool)

(assert (=> b!425186 (=> (not res!248882) (not e!252452))))

(declare-datatypes ((List!7331 0))(
  ( (Nil!7328) (Cons!7327 (h!8183 (_ BitVec 64)) (t!12775 List!7331)) )
))
(declare-fun arrayNoDuplicates!0 (array!25957 (_ BitVec 32) List!7331) Bool)

(assert (=> b!425186 (= res!248882 (arrayNoDuplicates!0 lt!194570 #b00000000000000000000000000000000 Nil!7328))))

(declare-fun b!425187 () Bool)

(declare-fun res!248888 () Bool)

(assert (=> b!425187 (=> (not res!248888) (not e!252454))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15851 0))(
  ( (V!15852 (val!5574 Int)) )
))
(declare-datatypes ((ValueCell!5186 0))(
  ( (ValueCellFull!5186 (v!7821 V!15851)) (EmptyCell!5186) )
))
(declare-datatypes ((array!25959 0))(
  ( (array!25960 (arr!12429 (Array (_ BitVec 32) ValueCell!5186)) (size!12781 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25959)

(assert (=> b!425187 (= res!248888 (and (= (size!12781 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12780 _keys!709) (size!12781 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425188 () Bool)

(declare-fun e!252450 () Bool)

(declare-fun e!252453 () Bool)

(assert (=> b!425188 (= e!252450 (and e!252453 mapRes!18210))))

(declare-fun condMapEmpty!18210 () Bool)

(declare-fun mapDefault!18210 () ValueCell!5186)

