; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35642 () Bool)

(assert start!35642)

(declare-fun b_free!7897 () Bool)

(declare-fun b_next!7897 () Bool)

(assert (=> start!35642 (= b_free!7897 (not b_next!7897))))

(declare-fun tp!27675 () Bool)

(declare-fun b_and!15139 () Bool)

(assert (=> start!35642 (= tp!27675 b_and!15139)))

(declare-fun b!357827 () Bool)

(declare-fun e!219057 () Bool)

(declare-fun e!219054 () Bool)

(assert (=> b!357827 (= e!219057 (not e!219054))))

(declare-fun res!198807 () Bool)

(assert (=> b!357827 (=> res!198807 e!219054)))

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((array!19757 0))(
  ( (array!19758 (arr!9372 (Array (_ BitVec 32) (_ BitVec 64))) (size!9724 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19757)

(assert (=> b!357827 (= res!198807 (or (bvslt (bvadd #b00000000000000000000000000000001 from!1805) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!1805) (size!9724 _keys!1456))))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357827 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11771 0))(
  ( (V!11772 (val!4092 Int)) )
))
(declare-datatypes ((ValueCell!3704 0))(
  ( (ValueCellFull!3704 (v!6286 V!11771)) (EmptyCell!3704) )
))
(declare-datatypes ((array!19759 0))(
  ( (array!19760 (arr!9373 (Array (_ BitVec 32) ValueCell!3704)) (size!9725 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19759)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11771)

(declare-datatypes ((Unit!11030 0))(
  ( (Unit!11031) )
))
(declare-fun lt!166106 () Unit!11030)

(declare-fun minValue!1150 () V!11771)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!34 (array!19757 array!19759 (_ BitVec 32) (_ BitVec 32) V!11771 V!11771 (_ BitVec 64) (_ BitVec 32)) Unit!11030)

(assert (=> b!357827 (= lt!166106 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!34 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun b!357828 () Bool)

(declare-fun res!198804 () Bool)

(assert (=> b!357828 (=> (not res!198804) (not e!219057))))

(assert (=> b!357828 (= res!198804 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9724 _keys!1456))))))

(declare-fun mapIsEmpty!13650 () Bool)

(declare-fun mapRes!13650 () Bool)

(assert (=> mapIsEmpty!13650 mapRes!13650))

(declare-fun b!357829 () Bool)

(declare-fun res!198805 () Bool)

(assert (=> b!357829 (=> (not res!198805) (not e!219057))))

(assert (=> b!357829 (= res!198805 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun res!198811 () Bool)

(assert (=> start!35642 (=> (not res!198811) (not e!219057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35642 (= res!198811 (validMask!0 mask!1842))))

(assert (=> start!35642 e!219057))

(declare-fun tp_is_empty!8095 () Bool)

(assert (=> start!35642 tp_is_empty!8095))

(assert (=> start!35642 true))

(assert (=> start!35642 tp!27675))

(declare-fun array_inv!6888 (array!19757) Bool)

(assert (=> start!35642 (array_inv!6888 _keys!1456)))

(declare-fun e!219059 () Bool)

(declare-fun array_inv!6889 (array!19759) Bool)

(assert (=> start!35642 (and (array_inv!6889 _values!1208) e!219059)))

(declare-fun b!357830 () Bool)

(declare-fun res!198809 () Bool)

(assert (=> b!357830 (=> (not res!198809) (not e!219057))))

(declare-datatypes ((List!5409 0))(
  ( (Nil!5406) (Cons!5405 (h!6261 (_ BitVec 64)) (t!10559 List!5409)) )
))
(declare-fun arrayNoDuplicates!0 (array!19757 (_ BitVec 32) List!5409) Bool)

(assert (=> b!357830 (= res!198809 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5406))))

(declare-fun b!357831 () Bool)

(declare-fun res!198810 () Bool)

(assert (=> b!357831 (=> (not res!198810) (not e!219057))))

(assert (=> b!357831 (= res!198810 (not (= (select (arr!9372 _keys!1456) from!1805) k!1077)))))

(declare-fun b!357832 () Bool)

(declare-fun e!219058 () Bool)

(assert (=> b!357832 (= e!219058 tp_is_empty!8095)))

(declare-fun b!357833 () Bool)

(declare-fun res!198806 () Bool)

(assert (=> b!357833 (=> (not res!198806) (not e!219057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357833 (= res!198806 (validKeyInArray!0 k!1077))))

(declare-fun b!357834 () Bool)

(assert (=> b!357834 (= e!219059 (and e!219058 mapRes!13650))))

(declare-fun condMapEmpty!13650 () Bool)

(declare-fun mapDefault!13650 () ValueCell!3704)

