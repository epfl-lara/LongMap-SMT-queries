; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35588 () Bool)

(assert start!35588)

(declare-fun b!356889 () Bool)

(declare-fun res!198114 () Bool)

(declare-fun e!218606 () Bool)

(assert (=> b!356889 (=> (not res!198114) (not e!218606))))

(declare-datatypes ((array!19651 0))(
  ( (array!19652 (arr!9319 (Array (_ BitVec 32) (_ BitVec 64))) (size!9671 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19651)

(declare-datatypes ((List!5380 0))(
  ( (Nil!5377) (Cons!5376 (h!6232 (_ BitVec 64)) (t!10530 List!5380)) )
))
(declare-fun arrayNoDuplicates!0 (array!19651 (_ BitVec 32) List!5380) Bool)

(assert (=> b!356889 (= res!198114 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5377))))

(declare-fun b!356890 () Bool)

(declare-fun res!198113 () Bool)

(assert (=> b!356890 (=> (not res!198113) (not e!218606))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356890 (= res!198113 (not (= (select (arr!9319 _keys!1456) from!1805) k!1077)))))

(declare-fun b!356891 () Bool)

(declare-fun res!198108 () Bool)

(assert (=> b!356891 (=> (not res!198108) (not e!218606))))

(declare-fun arrayContainsKey!0 (array!19651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356891 (= res!198108 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!356892 () Bool)

(declare-fun e!218602 () Bool)

(declare-fun tp_is_empty!8041 () Bool)

(assert (=> b!356892 (= e!218602 tp_is_empty!8041)))

(declare-fun b!356893 () Bool)

(declare-fun res!198111 () Bool)

(assert (=> b!356893 (=> (not res!198111) (not e!218606))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11699 0))(
  ( (V!11700 (val!4065 Int)) )
))
(declare-datatypes ((ValueCell!3677 0))(
  ( (ValueCellFull!3677 (v!6259 V!11699)) (EmptyCell!3677) )
))
(declare-datatypes ((array!19653 0))(
  ( (array!19654 (arr!9320 (Array (_ BitVec 32) ValueCell!3677)) (size!9672 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19653)

(assert (=> b!356893 (= res!198111 (and (= (size!9672 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9671 _keys!1456) (size!9672 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356894 () Bool)

(assert (=> b!356894 (= e!218606 (not true))))

(assert (=> b!356894 (arrayContainsKey!0 _keys!1456 k!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11699)

(declare-fun zeroValue!1150 () V!11699)

(declare-datatypes ((Unit!10990 0))(
  ( (Unit!10991) )
))
(declare-fun lt!165977 () Unit!10990)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!14 (array!19651 array!19653 (_ BitVec 32) (_ BitVec 32) V!11699 V!11699 (_ BitVec 64) (_ BitVec 32)) Unit!10990)

(assert (=> b!356894 (= lt!165977 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!14 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k!1077 from!1805))))

(declare-fun res!198110 () Bool)

(assert (=> start!35588 (=> (not res!198110) (not e!218606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35588 (= res!198110 (validMask!0 mask!1842))))

(assert (=> start!35588 e!218606))

(assert (=> start!35588 tp_is_empty!8041))

(assert (=> start!35588 true))

(declare-fun array_inv!6852 (array!19651) Bool)

(assert (=> start!35588 (array_inv!6852 _keys!1456)))

(declare-fun e!218605 () Bool)

(declare-fun array_inv!6853 (array!19653) Bool)

(assert (=> start!35588 (and (array_inv!6853 _values!1208) e!218605)))

(declare-fun b!356895 () Bool)

(declare-fun res!198112 () Bool)

(assert (=> b!356895 (=> (not res!198112) (not e!218606))))

(assert (=> b!356895 (= res!198112 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9671 _keys!1456))))))

(declare-fun b!356896 () Bool)

(declare-fun e!218604 () Bool)

(assert (=> b!356896 (= e!218604 tp_is_empty!8041)))

(declare-fun b!356897 () Bool)

(declare-fun mapRes!13569 () Bool)

(assert (=> b!356897 (= e!218605 (and e!218602 mapRes!13569))))

(declare-fun condMapEmpty!13569 () Bool)

(declare-fun mapDefault!13569 () ValueCell!3677)

