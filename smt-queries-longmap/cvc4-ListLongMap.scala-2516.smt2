; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38918 () Bool)

(assert start!38918)

(declare-fun b!407093 () Bool)

(declare-fun res!235284 () Bool)

(declare-fun e!244538 () Bool)

(assert (=> b!407093 (=> (not res!235284) (not e!244538))))

(declare-datatypes ((array!24557 0))(
  ( (array!24558 (arr!11728 (Array (_ BitVec 32) (_ BitVec 64))) (size!12080 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24557)

(declare-datatypes ((List!6806 0))(
  ( (Nil!6803) (Cons!6802 (h!7658 (_ BitVec 64)) (t!11980 List!6806)) )
))
(declare-fun arrayNoDuplicates!0 (array!24557 (_ BitVec 32) List!6806) Bool)

(assert (=> b!407093 (= res!235284 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6803))))

(declare-fun b!407094 () Bool)

(declare-fun res!235279 () Bool)

(assert (=> b!407094 (=> (not res!235279) (not e!244538))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407094 (= res!235279 (validMask!0 mask!1025))))

(declare-fun b!407095 () Bool)

(declare-fun res!235283 () Bool)

(assert (=> b!407095 (=> (not res!235283) (not e!244538))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407095 (= res!235283 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12080 _keys!709))))))

(declare-fun mapIsEmpty!17127 () Bool)

(declare-fun mapRes!17127 () Bool)

(assert (=> mapIsEmpty!17127 mapRes!17127))

(declare-fun b!407096 () Bool)

(declare-fun res!235286 () Bool)

(assert (=> b!407096 (=> (not res!235286) (not e!244538))))

(assert (=> b!407096 (= res!235286 (or (= (select (arr!11728 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11728 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407097 () Bool)

(declare-fun res!235285 () Bool)

(assert (=> b!407097 (=> (not res!235285) (not e!244538))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407097 (= res!235285 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17127 () Bool)

(declare-fun tp!33246 () Bool)

(declare-fun e!244542 () Bool)

(assert (=> mapNonEmpty!17127 (= mapRes!17127 (and tp!33246 e!244542))))

(declare-fun mapKey!17127 () (_ BitVec 32))

(declare-datatypes ((V!14887 0))(
  ( (V!14888 (val!5213 Int)) )
))
(declare-datatypes ((ValueCell!4825 0))(
  ( (ValueCellFull!4825 (v!7460 V!14887)) (EmptyCell!4825) )
))
(declare-datatypes ((array!24559 0))(
  ( (array!24560 (arr!11729 (Array (_ BitVec 32) ValueCell!4825)) (size!12081 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24559)

(declare-fun mapValue!17127 () ValueCell!4825)

(declare-fun mapRest!17127 () (Array (_ BitVec 32) ValueCell!4825))

(assert (=> mapNonEmpty!17127 (= (arr!11729 _values!549) (store mapRest!17127 mapKey!17127 mapValue!17127))))

(declare-fun res!235281 () Bool)

(assert (=> start!38918 (=> (not res!235281) (not e!244538))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38918 (= res!235281 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12080 _keys!709))))))

(assert (=> start!38918 e!244538))

(assert (=> start!38918 true))

(declare-fun e!244540 () Bool)

(declare-fun array_inv!8560 (array!24559) Bool)

(assert (=> start!38918 (and (array_inv!8560 _values!549) e!244540)))

(declare-fun array_inv!8561 (array!24557) Bool)

(assert (=> start!38918 (array_inv!8561 _keys!709)))

(declare-fun b!407098 () Bool)

(declare-fun tp_is_empty!10337 () Bool)

(assert (=> b!407098 (= e!244542 tp_is_empty!10337)))

(declare-fun b!407099 () Bool)

(declare-fun e!244539 () Bool)

(assert (=> b!407099 (= e!244539 false)))

(declare-fun lt!188590 () Bool)

(declare-fun lt!188591 () array!24557)

(assert (=> b!407099 (= lt!188590 (arrayNoDuplicates!0 lt!188591 #b00000000000000000000000000000000 Nil!6803))))

(declare-fun b!407100 () Bool)

(declare-fun res!235278 () Bool)

(assert (=> b!407100 (=> (not res!235278) (not e!244538))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!407100 (= res!235278 (and (= (size!12081 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12080 _keys!709) (size!12081 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407101 () Bool)

(declare-fun e!244541 () Bool)

(assert (=> b!407101 (= e!244540 (and e!244541 mapRes!17127))))

(declare-fun condMapEmpty!17127 () Bool)

(declare-fun mapDefault!17127 () ValueCell!4825)

