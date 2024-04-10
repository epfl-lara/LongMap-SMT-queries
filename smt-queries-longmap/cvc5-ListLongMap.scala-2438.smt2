; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38446 () Bool)

(assert start!38446)

(declare-fun mapNonEmpty!16419 () Bool)

(declare-fun mapRes!16419 () Bool)

(declare-fun tp!32214 () Bool)

(declare-fun e!239965 () Bool)

(assert (=> mapNonEmpty!16419 (= mapRes!16419 (and tp!32214 e!239965))))

(declare-datatypes ((V!14259 0))(
  ( (V!14260 (val!4977 Int)) )
))
(declare-datatypes ((ValueCell!4589 0))(
  ( (ValueCellFull!4589 (v!7224 V!14259)) (EmptyCell!4589) )
))
(declare-fun mapRest!16419 () (Array (_ BitVec 32) ValueCell!4589))

(declare-fun mapValue!16419 () ValueCell!4589)

(declare-datatypes ((array!23643 0))(
  ( (array!23644 (arr!11271 (Array (_ BitVec 32) ValueCell!4589)) (size!11623 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23643)

(declare-fun mapKey!16419 () (_ BitVec 32))

(assert (=> mapNonEmpty!16419 (= (arr!11271 _values!549) (store mapRest!16419 mapKey!16419 mapValue!16419))))

(declare-fun b!396594 () Bool)

(declare-fun e!239966 () Bool)

(declare-fun e!239970 () Bool)

(assert (=> b!396594 (= e!239966 e!239970)))

(declare-fun res!227553 () Bool)

(assert (=> b!396594 (=> (not res!227553) (not e!239970))))

(declare-datatypes ((array!23645 0))(
  ( (array!23646 (arr!11272 (Array (_ BitVec 32) (_ BitVec 64))) (size!11624 (_ BitVec 32))) )
))
(declare-fun lt!187175 () array!23645)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23645 (_ BitVec 32)) Bool)

(assert (=> b!396594 (= res!227553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187175 mask!1025))))

(declare-fun _keys!709 () array!23645)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396594 (= lt!187175 (array!23646 (store (arr!11272 _keys!709) i!563 k!794) (size!11624 _keys!709)))))

(declare-fun b!396595 () Bool)

(declare-fun res!227558 () Bool)

(assert (=> b!396595 (=> (not res!227558) (not e!239966))))

(assert (=> b!396595 (= res!227558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396596 () Bool)

(declare-fun res!227554 () Bool)

(assert (=> b!396596 (=> (not res!227554) (not e!239966))))

(assert (=> b!396596 (= res!227554 (or (= (select (arr!11272 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11272 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396597 () Bool)

(declare-fun res!227552 () Bool)

(assert (=> b!396597 (=> (not res!227552) (not e!239966))))

(assert (=> b!396597 (= res!227552 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11624 _keys!709))))))

(declare-fun b!396598 () Bool)

(declare-fun res!227550 () Bool)

(assert (=> b!396598 (=> (not res!227550) (not e!239966))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396598 (= res!227550 (and (= (size!11623 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11624 _keys!709) (size!11623 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396599 () Bool)

(declare-fun tp_is_empty!9865 () Bool)

(assert (=> b!396599 (= e!239965 tp_is_empty!9865)))

(declare-fun b!396600 () Bool)

(declare-fun res!227557 () Bool)

(assert (=> b!396600 (=> (not res!227557) (not e!239966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396600 (= res!227557 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!16419 () Bool)

(assert (=> mapIsEmpty!16419 mapRes!16419))

(declare-fun b!396601 () Bool)

(declare-fun res!227551 () Bool)

(assert (=> b!396601 (=> (not res!227551) (not e!239966))))

(declare-fun arrayContainsKey!0 (array!23645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396601 (= res!227551 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!396602 () Bool)

(declare-fun res!227555 () Bool)

(assert (=> b!396602 (=> (not res!227555) (not e!239966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396602 (= res!227555 (validMask!0 mask!1025))))

(declare-fun b!396603 () Bool)

(declare-fun res!227556 () Bool)

(assert (=> b!396603 (=> (not res!227556) (not e!239966))))

(declare-datatypes ((List!6530 0))(
  ( (Nil!6527) (Cons!6526 (h!7382 (_ BitVec 64)) (t!11704 List!6530)) )
))
(declare-fun arrayNoDuplicates!0 (array!23645 (_ BitVec 32) List!6530) Bool)

(assert (=> b!396603 (= res!227556 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6527))))

(declare-fun res!227559 () Bool)

(assert (=> start!38446 (=> (not res!227559) (not e!239966))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38446 (= res!227559 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11624 _keys!709))))))

(assert (=> start!38446 e!239966))

(assert (=> start!38446 true))

(declare-fun e!239967 () Bool)

(declare-fun array_inv!8266 (array!23643) Bool)

(assert (=> start!38446 (and (array_inv!8266 _values!549) e!239967)))

(declare-fun array_inv!8267 (array!23645) Bool)

(assert (=> start!38446 (array_inv!8267 _keys!709)))

(declare-fun b!396593 () Bool)

(assert (=> b!396593 (= e!239970 false)))

(declare-fun lt!187174 () Bool)

(assert (=> b!396593 (= lt!187174 (arrayNoDuplicates!0 lt!187175 #b00000000000000000000000000000000 Nil!6527))))

(declare-fun b!396604 () Bool)

(declare-fun e!239968 () Bool)

(assert (=> b!396604 (= e!239968 tp_is_empty!9865)))

(declare-fun b!396605 () Bool)

(assert (=> b!396605 (= e!239967 (and e!239968 mapRes!16419))))

(declare-fun condMapEmpty!16419 () Bool)

(declare-fun mapDefault!16419 () ValueCell!4589)

