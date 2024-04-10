; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35586 () Bool)

(assert start!35586)

(declare-fun b!356856 () Bool)

(declare-fun res!198089 () Bool)

(declare-fun e!218587 () Bool)

(assert (=> b!356856 (=> (not res!198089) (not e!218587))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356856 (= res!198089 (validKeyInArray!0 k!1077))))

(declare-fun b!356857 () Bool)

(declare-fun e!218590 () Bool)

(declare-fun tp_is_empty!8039 () Bool)

(assert (=> b!356857 (= e!218590 tp_is_empty!8039)))

(declare-fun b!356858 () Bool)

(declare-fun res!198088 () Bool)

(assert (=> b!356858 (=> (not res!198088) (not e!218587))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19647 0))(
  ( (array!19648 (arr!9317 (Array (_ BitVec 32) (_ BitVec 64))) (size!9669 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19647)

(declare-datatypes ((V!11695 0))(
  ( (V!11696 (val!4064 Int)) )
))
(declare-datatypes ((ValueCell!3676 0))(
  ( (ValueCellFull!3676 (v!6258 V!11695)) (EmptyCell!3676) )
))
(declare-datatypes ((array!19649 0))(
  ( (array!19650 (arr!9318 (Array (_ BitVec 32) ValueCell!3676)) (size!9670 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19649)

(assert (=> b!356858 (= res!198088 (and (= (size!9670 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9669 _keys!1456) (size!9670 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356859 () Bool)

(assert (=> b!356859 (= e!218587 (not true))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356859 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11695)

(declare-datatypes ((Unit!10988 0))(
  ( (Unit!10989) )
))
(declare-fun lt!165974 () Unit!10988)

(declare-fun zeroValue!1150 () V!11695)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!13 (array!19647 array!19649 (_ BitVec 32) (_ BitVec 32) V!11695 V!11695 (_ BitVec 64) (_ BitVec 32)) Unit!10988)

(assert (=> b!356859 (= lt!165974 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!13 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!356860 () Bool)

(declare-fun res!198084 () Bool)

(assert (=> b!356860 (=> (not res!198084) (not e!218587))))

(declare-datatypes ((List!5379 0))(
  ( (Nil!5376) (Cons!5375 (h!6231 (_ BitVec 64)) (t!10529 List!5379)) )
))
(declare-fun arrayNoDuplicates!0 (array!19647 (_ BitVec 32) List!5379) Bool)

(assert (=> b!356860 (= res!198084 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5376))))

(declare-fun b!356861 () Bool)

(declare-fun res!198087 () Bool)

(assert (=> b!356861 (=> (not res!198087) (not e!218587))))

(assert (=> b!356861 (= res!198087 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun res!198085 () Bool)

(assert (=> start!35586 (=> (not res!198085) (not e!218587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35586 (= res!198085 (validMask!0 mask!1842))))

(assert (=> start!35586 e!218587))

(assert (=> start!35586 tp_is_empty!8039))

(assert (=> start!35586 true))

(declare-fun array_inv!6850 (array!19647) Bool)

(assert (=> start!35586 (array_inv!6850 _keys!1456)))

(declare-fun e!218589 () Bool)

(declare-fun array_inv!6851 (array!19649) Bool)

(assert (=> start!35586 (and (array_inv!6851 _values!1208) e!218589)))

(declare-fun b!356862 () Bool)

(declare-fun e!218591 () Bool)

(assert (=> b!356862 (= e!218591 tp_is_empty!8039)))

(declare-fun b!356863 () Bool)

(declare-fun res!198090 () Bool)

(assert (=> b!356863 (=> (not res!198090) (not e!218587))))

(assert (=> b!356863 (= res!198090 (not (= (select (arr!9317 _keys!1456) from!1805) k!1077)))))

(declare-fun mapNonEmpty!13566 () Bool)

(declare-fun mapRes!13566 () Bool)

(declare-fun tp!27543 () Bool)

(assert (=> mapNonEmpty!13566 (= mapRes!13566 (and tp!27543 e!218591))))

(declare-fun mapKey!13566 () (_ BitVec 32))

(declare-fun mapValue!13566 () ValueCell!3676)

(declare-fun mapRest!13566 () (Array (_ BitVec 32) ValueCell!3676))

(assert (=> mapNonEmpty!13566 (= (arr!9318 _values!1208) (store mapRest!13566 mapKey!13566 mapValue!13566))))

(declare-fun b!356864 () Bool)

(declare-fun res!198091 () Bool)

(assert (=> b!356864 (=> (not res!198091) (not e!218587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19647 (_ BitVec 32)) Bool)

(assert (=> b!356864 (= res!198091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13566 () Bool)

(assert (=> mapIsEmpty!13566 mapRes!13566))

(declare-fun b!356865 () Bool)

(declare-fun res!198086 () Bool)

(assert (=> b!356865 (=> (not res!198086) (not e!218587))))

(assert (=> b!356865 (= res!198086 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9669 _keys!1456))))))

(declare-fun b!356866 () Bool)

(assert (=> b!356866 (= e!218589 (and e!218590 mapRes!13566))))

(declare-fun condMapEmpty!13566 () Bool)

(declare-fun mapDefault!13566 () ValueCell!3676)

