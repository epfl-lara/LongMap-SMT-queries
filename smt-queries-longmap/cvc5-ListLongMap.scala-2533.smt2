; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39016 () Bool)

(assert start!39016)

(declare-fun b!409004 () Bool)

(declare-fun e!245420 () Bool)

(declare-fun tp_is_empty!10435 () Bool)

(assert (=> b!409004 (= e!245420 tp_is_empty!10435)))

(declare-fun res!236750 () Bool)

(declare-fun e!245423 () Bool)

(assert (=> start!39016 (=> (not res!236750) (not e!245423))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24743 0))(
  ( (array!24744 (arr!11821 (Array (_ BitVec 32) (_ BitVec 64))) (size!12173 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24743)

(assert (=> start!39016 (= res!236750 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12173 _keys!709))))))

(assert (=> start!39016 e!245423))

(assert (=> start!39016 true))

(declare-datatypes ((V!15019 0))(
  ( (V!15020 (val!5262 Int)) )
))
(declare-datatypes ((ValueCell!4874 0))(
  ( (ValueCellFull!4874 (v!7509 V!15019)) (EmptyCell!4874) )
))
(declare-datatypes ((array!24745 0))(
  ( (array!24746 (arr!11822 (Array (_ BitVec 32) ValueCell!4874)) (size!12174 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24745)

(declare-fun e!245424 () Bool)

(declare-fun array_inv!8626 (array!24745) Bool)

(assert (=> start!39016 (and (array_inv!8626 _values!549) e!245424)))

(declare-fun array_inv!8627 (array!24743) Bool)

(assert (=> start!39016 (array_inv!8627 _keys!709)))

(declare-fun mapIsEmpty!17274 () Bool)

(declare-fun mapRes!17274 () Bool)

(assert (=> mapIsEmpty!17274 mapRes!17274))

(declare-fun b!409005 () Bool)

(declare-fun res!236748 () Bool)

(assert (=> b!409005 (=> (not res!236748) (not e!245423))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409005 (= res!236748 (validKeyInArray!0 k!794))))

(declare-fun b!409006 () Bool)

(declare-fun res!236751 () Bool)

(assert (=> b!409006 (=> (not res!236751) (not e!245423))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409006 (= res!236751 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17274 () Bool)

(declare-fun tp!33393 () Bool)

(assert (=> mapNonEmpty!17274 (= mapRes!17274 (and tp!33393 e!245420))))

(declare-fun mapKey!17274 () (_ BitVec 32))

(declare-fun mapRest!17274 () (Array (_ BitVec 32) ValueCell!4874))

(declare-fun mapValue!17274 () ValueCell!4874)

(assert (=> mapNonEmpty!17274 (= (arr!11822 _values!549) (store mapRest!17274 mapKey!17274 mapValue!17274))))

(declare-fun b!409007 () Bool)

(declare-fun res!236749 () Bool)

(assert (=> b!409007 (=> (not res!236749) (not e!245423))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409007 (= res!236749 (or (= (select (arr!11821 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11821 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409008 () Bool)

(declare-fun res!236754 () Bool)

(assert (=> b!409008 (=> (not res!236754) (not e!245423))))

(assert (=> b!409008 (= res!236754 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12173 _keys!709))))))

(declare-fun b!409009 () Bool)

(declare-fun e!245422 () Bool)

(assert (=> b!409009 (= e!245423 e!245422)))

(declare-fun res!236752 () Bool)

(assert (=> b!409009 (=> (not res!236752) (not e!245422))))

(declare-fun lt!188884 () array!24743)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24743 (_ BitVec 32)) Bool)

(assert (=> b!409009 (= res!236752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188884 mask!1025))))

(assert (=> b!409009 (= lt!188884 (array!24744 (store (arr!11821 _keys!709) i!563 k!794) (size!12173 _keys!709)))))

(declare-fun b!409010 () Bool)

(declare-fun res!236756 () Bool)

(assert (=> b!409010 (=> (not res!236756) (not e!245423))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!409010 (= res!236756 (and (= (size!12174 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12173 _keys!709) (size!12174 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409011 () Bool)

(declare-fun e!245419 () Bool)

(assert (=> b!409011 (= e!245424 (and e!245419 mapRes!17274))))

(declare-fun condMapEmpty!17274 () Bool)

(declare-fun mapDefault!17274 () ValueCell!4874)

