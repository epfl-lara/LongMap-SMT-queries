; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82268 () Bool)

(assert start!82268)

(declare-fun b_free!18541 () Bool)

(declare-fun b_next!18541 () Bool)

(assert (=> start!82268 (= b_free!18541 (not b_next!18541))))

(declare-fun tp!64584 () Bool)

(declare-fun b_and!30029 () Bool)

(assert (=> start!82268 (= tp!64584 b_and!30029)))

(declare-fun b!959002 () Bool)

(declare-fun res!641929 () Bool)

(declare-fun e!540629 () Bool)

(assert (=> b!959002 (=> (not res!641929) (not e!540629))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-datatypes ((V!33313 0))(
  ( (V!33314 (val!10674 Int)) )
))
(declare-fun minValue!1328 () V!33313)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58591 0))(
  ( (array!58592 (arr!28169 (Array (_ BitVec 32) (_ BitVec 64))) (size!28648 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58591)

(declare-datatypes ((ValueCell!10142 0))(
  ( (ValueCellFull!10142 (v!13231 V!33313)) (EmptyCell!10142) )
))
(declare-datatypes ((array!58593 0))(
  ( (array!58594 (arr!28170 (Array (_ BitVec 32) ValueCell!10142)) (size!28649 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58593)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33313)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13764 0))(
  ( (tuple2!13765 (_1!6893 (_ BitVec 64)) (_2!6893 V!33313)) )
))
(declare-datatypes ((List!19583 0))(
  ( (Nil!19580) (Cons!19579 (h!20741 tuple2!13764) (t!27946 List!19583)) )
))
(declare-datatypes ((ListLongMap!12461 0))(
  ( (ListLongMap!12462 (toList!6246 List!19583)) )
))
(declare-fun contains!5347 (ListLongMap!12461 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3479 (array!58591 array!58593 (_ BitVec 32) (_ BitVec 32) V!33313 V!33313 (_ BitVec 32) Int) ListLongMap!12461)

(assert (=> b!959002 (= res!641929 (contains!5347 (getCurrentListMap!3479 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28169 _keys!1668) i!793)))))

(declare-fun b!959003 () Bool)

(declare-fun res!641931 () Bool)

(assert (=> b!959003 (=> (not res!641931) (not e!540629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58591 (_ BitVec 32)) Bool)

(assert (=> b!959003 (= res!641931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959004 () Bool)

(declare-fun res!641933 () Bool)

(assert (=> b!959004 (=> (not res!641933) (not e!540629))))

(assert (=> b!959004 (= res!641933 (and (= (size!28649 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28648 _keys!1668) (size!28649 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!959005 () Bool)

(assert (=> b!959005 (= e!540629 (not true))))

(assert (=> b!959005 (contains!5347 (getCurrentListMap!3479 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 #b00000000000000000000000000000000 defaultEntry!1389) (select (arr!28169 _keys!1668) i!793))))

(declare-datatypes ((Unit!32167 0))(
  ( (Unit!32168) )
))
(declare-fun lt!430503 () Unit!32167)

(declare-fun lemmaInListMapFromThenInFromSmaller!5 (array!58591 array!58593 (_ BitVec 32) (_ BitVec 32) V!33313 V!33313 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32167)

(assert (=> b!959005 (= lt!430503 (lemmaInListMapFromThenInFromSmaller!5 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 #b00000000000000000000000000000000 i!793 defaultEntry!1389))))

(declare-fun b!959006 () Bool)

(declare-fun res!641930 () Bool)

(assert (=> b!959006 (=> (not res!641930) (not e!540629))))

(assert (=> b!959006 (= res!641930 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28648 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28648 _keys!1668))))))

(declare-fun b!959007 () Bool)

(declare-fun e!540626 () Bool)

(declare-fun tp_is_empty!21247 () Bool)

(assert (=> b!959007 (= e!540626 tp_is_empty!21247)))

(declare-fun b!959008 () Bool)

(declare-fun res!641928 () Bool)

(assert (=> b!959008 (=> (not res!641928) (not e!540629))))

(declare-datatypes ((List!19584 0))(
  ( (Nil!19581) (Cons!19580 (h!20742 (_ BitVec 64)) (t!27947 List!19584)) )
))
(declare-fun arrayNoDuplicates!0 (array!58591 (_ BitVec 32) List!19584) Bool)

(assert (=> b!959008 (= res!641928 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19581))))

(declare-fun mapIsEmpty!33850 () Bool)

(declare-fun mapRes!33850 () Bool)

(assert (=> mapIsEmpty!33850 mapRes!33850))

(declare-fun b!959009 () Bool)

(declare-fun e!540628 () Bool)

(declare-fun e!540627 () Bool)

(assert (=> b!959009 (= e!540628 (and e!540627 mapRes!33850))))

(declare-fun condMapEmpty!33850 () Bool)

(declare-fun mapDefault!33850 () ValueCell!10142)

