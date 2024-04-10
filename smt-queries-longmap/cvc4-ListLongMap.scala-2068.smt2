; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35580 () Bool)

(assert start!35580)

(declare-fun b!356757 () Bool)

(declare-fun e!218545 () Bool)

(declare-fun tp_is_empty!8033 () Bool)

(assert (=> b!356757 (= e!218545 tp_is_empty!8033)))

(declare-fun mapIsEmpty!13557 () Bool)

(declare-fun mapRes!13557 () Bool)

(assert (=> mapIsEmpty!13557 mapRes!13557))

(declare-fun mapNonEmpty!13557 () Bool)

(declare-fun tp!27534 () Bool)

(assert (=> mapNonEmpty!13557 (= mapRes!13557 (and tp!27534 e!218545))))

(declare-datatypes ((V!11687 0))(
  ( (V!11688 (val!4061 Int)) )
))
(declare-datatypes ((ValueCell!3673 0))(
  ( (ValueCellFull!3673 (v!6255 V!11687)) (EmptyCell!3673) )
))
(declare-fun mapRest!13557 () (Array (_ BitVec 32) ValueCell!3673))

(declare-fun mapKey!13557 () (_ BitVec 32))

(declare-datatypes ((array!19635 0))(
  ( (array!19636 (arr!9311 (Array (_ BitVec 32) ValueCell!3673)) (size!9663 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19635)

(declare-fun mapValue!13557 () ValueCell!3673)

(assert (=> mapNonEmpty!13557 (= (arr!9311 _values!1208) (store mapRest!13557 mapKey!13557 mapValue!13557))))

(declare-fun b!356758 () Bool)

(declare-fun res!198019 () Bool)

(declare-fun e!218542 () Bool)

(assert (=> b!356758 (=> (not res!198019) (not e!218542))))

(declare-datatypes ((array!19637 0))(
  ( (array!19638 (arr!9312 (Array (_ BitVec 32) (_ BitVec 64))) (size!9664 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19637)

(declare-datatypes ((List!5377 0))(
  ( (Nil!5374) (Cons!5373 (h!6229 (_ BitVec 64)) (t!10527 List!5377)) )
))
(declare-fun arrayNoDuplicates!0 (array!19637 (_ BitVec 32) List!5377) Bool)

(assert (=> b!356758 (= res!198019 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5374))))

(declare-fun b!356759 () Bool)

(declare-fun res!198017 () Bool)

(assert (=> b!356759 (=> (not res!198017) (not e!218542))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356759 (= res!198017 (validKeyInArray!0 k!1077))))

(declare-fun res!198016 () Bool)

(assert (=> start!35580 (=> (not res!198016) (not e!218542))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35580 (= res!198016 (validMask!0 mask!1842))))

(assert (=> start!35580 e!218542))

(assert (=> start!35580 tp_is_empty!8033))

(assert (=> start!35580 true))

(declare-fun array_inv!6844 (array!19637) Bool)

(assert (=> start!35580 (array_inv!6844 _keys!1456)))

(declare-fun e!218544 () Bool)

(declare-fun array_inv!6845 (array!19635) Bool)

(assert (=> start!35580 (and (array_inv!6845 _values!1208) e!218544)))

(declare-fun b!356760 () Bool)

(declare-fun res!198014 () Bool)

(assert (=> b!356760 (=> (not res!198014) (not e!218542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19637 (_ BitVec 32)) Bool)

(assert (=> b!356760 (= res!198014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356761 () Bool)

(declare-fun res!198018 () Bool)

(assert (=> b!356761 (=> (not res!198018) (not e!218542))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356761 (= res!198018 (not (= (select (arr!9312 _keys!1456) from!1805) k!1077)))))

(declare-fun b!356762 () Bool)

(declare-fun e!218546 () Bool)

(assert (=> b!356762 (= e!218546 tp_is_empty!8033)))

(declare-fun b!356763 () Bool)

(declare-fun res!198012 () Bool)

(assert (=> b!356763 (=> (not res!198012) (not e!218542))))

(declare-fun arrayContainsKey!0 (array!19637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356763 (= res!198012 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!356764 () Bool)

(assert (=> b!356764 (= e!218544 (and e!218546 mapRes!13557))))

(declare-fun condMapEmpty!13557 () Bool)

(declare-fun mapDefault!13557 () ValueCell!3673)

