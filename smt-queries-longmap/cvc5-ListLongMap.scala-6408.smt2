; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82244 () Bool)

(assert start!82244)

(declare-fun b_free!18517 () Bool)

(declare-fun b_next!18517 () Bool)

(assert (=> start!82244 (= b_free!18517 (not b_next!18517))))

(declare-fun tp!64511 () Bool)

(declare-fun b_and!30005 () Bool)

(assert (=> start!82244 (= tp!64511 b_and!30005)))

(declare-fun b!958659 () Bool)

(declare-fun res!641695 () Bool)

(declare-fun e!540450 () Bool)

(assert (=> b!958659 (=> (not res!641695) (not e!540450))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58545 0))(
  ( (array!58546 (arr!28146 (Array (_ BitVec 32) (_ BitVec 64))) (size!28625 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58545)

(declare-datatypes ((V!33281 0))(
  ( (V!33282 (val!10662 Int)) )
))
(declare-datatypes ((ValueCell!10130 0))(
  ( (ValueCellFull!10130 (v!13219 V!33281)) (EmptyCell!10130) )
))
(declare-datatypes ((array!58547 0))(
  ( (array!58548 (arr!28147 (Array (_ BitVec 32) ValueCell!10130)) (size!28626 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58547)

(assert (=> b!958659 (= res!641695 (and (= (size!28626 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28625 _keys!1668) (size!28626 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958660 () Bool)

(declare-fun res!641693 () Bool)

(assert (=> b!958660 (=> (not res!641693) (not e!540450))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958660 (= res!641693 (validKeyInArray!0 (select (arr!28146 _keys!1668) i!793)))))

(declare-fun b!958661 () Bool)

(declare-fun res!641694 () Bool)

(assert (=> b!958661 (=> (not res!641694) (not e!540450))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!958661 (= res!641694 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28625 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28625 _keys!1668))))))

(declare-fun b!958662 () Bool)

(assert (=> b!958662 (= e!540450 false)))

(declare-fun lt!430467 () Bool)

(declare-fun minValue!1328 () V!33281)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33281)

(declare-datatypes ((tuple2!13746 0))(
  ( (tuple2!13747 (_1!6884 (_ BitVec 64)) (_2!6884 V!33281)) )
))
(declare-datatypes ((List!19568 0))(
  ( (Nil!19565) (Cons!19564 (h!20726 tuple2!13746) (t!27931 List!19568)) )
))
(declare-datatypes ((ListLongMap!12443 0))(
  ( (ListLongMap!12444 (toList!6237 List!19568)) )
))
(declare-fun contains!5338 (ListLongMap!12443 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3470 (array!58545 array!58547 (_ BitVec 32) (_ BitVec 32) V!33281 V!33281 (_ BitVec 32) Int) ListLongMap!12443)

(assert (=> b!958662 (= lt!430467 (contains!5338 (getCurrentListMap!3470 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28146 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33814 () Bool)

(declare-fun mapRes!33814 () Bool)

(declare-fun tp!64512 () Bool)

(declare-fun e!540449 () Bool)

(assert (=> mapNonEmpty!33814 (= mapRes!33814 (and tp!64512 e!540449))))

(declare-fun mapValue!33814 () ValueCell!10130)

(declare-fun mapRest!33814 () (Array (_ BitVec 32) ValueCell!10130))

(declare-fun mapKey!33814 () (_ BitVec 32))

(assert (=> mapNonEmpty!33814 (= (arr!28147 _values!1386) (store mapRest!33814 mapKey!33814 mapValue!33814))))

(declare-fun b!958663 () Bool)

(declare-fun e!540447 () Bool)

(declare-fun tp_is_empty!21223 () Bool)

(assert (=> b!958663 (= e!540447 tp_is_empty!21223)))

(declare-fun b!958664 () Bool)

(declare-fun e!540448 () Bool)

(assert (=> b!958664 (= e!540448 (and e!540447 mapRes!33814))))

(declare-fun condMapEmpty!33814 () Bool)

(declare-fun mapDefault!33814 () ValueCell!10130)

