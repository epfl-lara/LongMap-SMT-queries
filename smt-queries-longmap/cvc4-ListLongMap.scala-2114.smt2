; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35856 () Bool)

(assert start!35856)

(declare-fun b!360447 () Bool)

(declare-fun e!220694 () Bool)

(declare-fun tp_is_empty!8309 () Bool)

(assert (=> b!360447 (= e!220694 tp_is_empty!8309)))

(declare-fun b!360448 () Bool)

(declare-fun e!220697 () Bool)

(assert (=> b!360448 (= e!220697 tp_is_empty!8309)))

(declare-fun b!360449 () Bool)

(declare-fun e!220693 () Bool)

(assert (=> b!360449 (= e!220693 (not true))))

(declare-datatypes ((array!20169 0))(
  ( (array!20170 (arr!9578 (Array (_ BitVec 32) (_ BitVec 64))) (size!9930 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20169)

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!20169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!360449 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-datatypes ((V!12055 0))(
  ( (V!12056 (val!4199 Int)) )
))
(declare-fun minValue!1150 () V!12055)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3811 0))(
  ( (ValueCellFull!3811 (v!6393 V!12055)) (EmptyCell!3811) )
))
(declare-datatypes ((array!20171 0))(
  ( (array!20172 (arr!9579 (Array (_ BitVec 32) ValueCell!3811)) (size!9931 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20171)

(declare-datatypes ((Unit!11088 0))(
  ( (Unit!11089) )
))
(declare-fun lt!166451 () Unit!11088)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!12055)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!59 (array!20169 array!20171 (_ BitVec 32) (_ BitVec 32) V!12055 V!12055 (_ BitVec 64) (_ BitVec 32)) Unit!11088)

(assert (=> b!360449 (= lt!166451 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!59 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!360450 () Bool)

(declare-fun res!200467 () Bool)

(assert (=> b!360450 (=> (not res!200467) (not e!220693))))

(assert (=> b!360450 (= res!200467 (and (= (size!9931 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9930 _keys!1456) (size!9931 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!360451 () Bool)

(declare-fun res!200466 () Bool)

(assert (=> b!360451 (=> (not res!200466) (not e!220693))))

(assert (=> b!360451 (= res!200466 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun res!200461 () Bool)

(assert (=> start!35856 (=> (not res!200461) (not e!220693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35856 (= res!200461 (validMask!0 mask!1842))))

(assert (=> start!35856 e!220693))

(assert (=> start!35856 tp_is_empty!8309))

(assert (=> start!35856 true))

(declare-fun array_inv!7046 (array!20169) Bool)

(assert (=> start!35856 (array_inv!7046 _keys!1456)))

(declare-fun e!220696 () Bool)

(declare-fun array_inv!7047 (array!20171) Bool)

(assert (=> start!35856 (and (array_inv!7047 _values!1208) e!220696)))

(declare-fun b!360452 () Bool)

(declare-fun res!200462 () Bool)

(assert (=> b!360452 (=> (not res!200462) (not e!220693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!360452 (= res!200462 (validKeyInArray!0 k!1077))))

(declare-fun b!360453 () Bool)

(declare-fun res!200464 () Bool)

(assert (=> b!360453 (=> (not res!200464) (not e!220693))))

(declare-datatypes ((List!5489 0))(
  ( (Nil!5486) (Cons!5485 (h!6341 (_ BitVec 64)) (t!10639 List!5489)) )
))
(declare-fun arrayNoDuplicates!0 (array!20169 (_ BitVec 32) List!5489) Bool)

(assert (=> b!360453 (= res!200464 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5486))))

(declare-fun b!360454 () Bool)

(declare-fun res!200460 () Bool)

(assert (=> b!360454 (=> (not res!200460) (not e!220693))))

(assert (=> b!360454 (= res!200460 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9930 _keys!1456))))))

(declare-fun mapIsEmpty!13971 () Bool)

(declare-fun mapRes!13971 () Bool)

(assert (=> mapIsEmpty!13971 mapRes!13971))

(declare-fun b!360455 () Bool)

(declare-fun res!200465 () Bool)

(assert (=> b!360455 (=> (not res!200465) (not e!220693))))

(assert (=> b!360455 (= res!200465 (not (= (select (arr!9578 _keys!1456) from!1805) k!1077)))))

(declare-fun mapNonEmpty!13971 () Bool)

(declare-fun tp!28038 () Bool)

(assert (=> mapNonEmpty!13971 (= mapRes!13971 (and tp!28038 e!220697))))

(declare-fun mapKey!13971 () (_ BitVec 32))

(declare-fun mapValue!13971 () ValueCell!3811)

(declare-fun mapRest!13971 () (Array (_ BitVec 32) ValueCell!3811))

(assert (=> mapNonEmpty!13971 (= (arr!9579 _values!1208) (store mapRest!13971 mapKey!13971 mapValue!13971))))

(declare-fun b!360456 () Bool)

(assert (=> b!360456 (= e!220696 (and e!220694 mapRes!13971))))

(declare-fun condMapEmpty!13971 () Bool)

(declare-fun mapDefault!13971 () ValueCell!3811)

