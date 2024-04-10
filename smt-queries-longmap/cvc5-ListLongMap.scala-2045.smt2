; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35438 () Bool)

(assert start!35438)

(declare-fun b_free!7825 () Bool)

(declare-fun b_next!7825 () Bool)

(assert (=> start!35438 (= b_free!7825 (not b_next!7825))))

(declare-fun tp!27260 () Bool)

(declare-fun b_and!15067 () Bool)

(assert (=> start!35438 (= tp!27260 b_and!15067)))

(declare-fun b!354848 () Bool)

(declare-fun res!196747 () Bool)

(declare-fun e!217479 () Bool)

(assert (=> b!354848 (=> (not res!196747) (not e!217479))))

(declare-datatypes ((array!19363 0))(
  ( (array!19364 (arr!9175 (Array (_ BitVec 32) (_ BitVec 64))) (size!9527 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19363)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19363 (_ BitVec 32)) Bool)

(assert (=> b!354848 (= res!196747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354849 () Bool)

(declare-fun res!196750 () Bool)

(assert (=> b!354849 (=> (not res!196750) (not e!217479))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11499 0))(
  ( (V!11500 (val!3990 Int)) )
))
(declare-datatypes ((ValueCell!3602 0))(
  ( (ValueCellFull!3602 (v!6184 V!11499)) (EmptyCell!3602) )
))
(declare-datatypes ((array!19365 0))(
  ( (array!19366 (arr!9176 (Array (_ BitVec 32) ValueCell!3602)) (size!9528 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19365)

(assert (=> b!354849 (= res!196750 (and (= (size!9528 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9527 _keys!1456) (size!9528 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354850 () Bool)

(assert (=> b!354850 (= e!217479 (not true))))

(declare-fun minValue!1150 () V!11499)

(declare-fun defaultEntry!1216 () Int)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11499)

(declare-datatypes ((tuple2!5670 0))(
  ( (tuple2!5671 (_1!2846 (_ BitVec 64)) (_2!2846 V!11499)) )
))
(declare-datatypes ((List!5313 0))(
  ( (Nil!5310) (Cons!5309 (h!6165 tuple2!5670) (t!10463 List!5313)) )
))
(declare-datatypes ((ListLongMap!4583 0))(
  ( (ListLongMap!4584 (toList!2307 List!5313)) )
))
(declare-fun contains!2387 (ListLongMap!4583 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1828 (array!19363 array!19365 (_ BitVec 32) (_ BitVec 32) V!11499 V!11499 (_ BitVec 32) Int) ListLongMap!4583)

(assert (=> b!354850 (contains!2387 (getCurrentListMap!1828 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9175 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10936 0))(
  ( (Unit!10937) )
))
(declare-fun lt!165752 () Unit!10936)

(declare-fun lemmaValidKeyInArrayIsInListMap!185 (array!19363 array!19365 (_ BitVec 32) (_ BitVec 32) V!11499 V!11499 (_ BitVec 32) Int) Unit!10936)

(assert (=> b!354850 (= lt!165752 (lemmaValidKeyInArrayIsInListMap!185 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapIsEmpty!13344 () Bool)

(declare-fun mapRes!13344 () Bool)

(assert (=> mapIsEmpty!13344 mapRes!13344))

(declare-fun b!354851 () Bool)

(declare-fun res!196742 () Bool)

(assert (=> b!354851 (=> (not res!196742) (not e!217479))))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!354851 (= res!196742 (= (select (arr!9175 _keys!1456) from!1805) k!1077))))

(declare-fun b!354852 () Bool)

(declare-fun res!196743 () Bool)

(assert (=> b!354852 (=> (not res!196743) (not e!217479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354852 (= res!196743 (validKeyInArray!0 (select (arr!9175 _keys!1456) from!1805)))))

(declare-fun mapNonEmpty!13344 () Bool)

(declare-fun tp!27261 () Bool)

(declare-fun e!217480 () Bool)

(assert (=> mapNonEmpty!13344 (= mapRes!13344 (and tp!27261 e!217480))))

(declare-fun mapValue!13344 () ValueCell!3602)

(declare-fun mapRest!13344 () (Array (_ BitVec 32) ValueCell!3602))

(declare-fun mapKey!13344 () (_ BitVec 32))

(assert (=> mapNonEmpty!13344 (= (arr!9176 _values!1208) (store mapRest!13344 mapKey!13344 mapValue!13344))))

(declare-fun b!354853 () Bool)

(declare-fun res!196749 () Bool)

(assert (=> b!354853 (=> (not res!196749) (not e!217479))))

(declare-fun arrayContainsKey!0 (array!19363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354853 (= res!196749 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun b!354854 () Bool)

(declare-fun res!196748 () Bool)

(assert (=> b!354854 (=> (not res!196748) (not e!217479))))

(declare-datatypes ((List!5314 0))(
  ( (Nil!5311) (Cons!5310 (h!6166 (_ BitVec 64)) (t!10464 List!5314)) )
))
(declare-fun arrayNoDuplicates!0 (array!19363 (_ BitVec 32) List!5314) Bool)

(assert (=> b!354854 (= res!196748 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5311))))

(declare-fun b!354855 () Bool)

(declare-fun res!196745 () Bool)

(assert (=> b!354855 (=> (not res!196745) (not e!217479))))

(assert (=> b!354855 (= res!196745 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9527 _keys!1456))))))

(declare-fun b!354856 () Bool)

(declare-fun tp_is_empty!7891 () Bool)

(assert (=> b!354856 (= e!217480 tp_is_empty!7891)))

(declare-fun b!354857 () Bool)

(declare-fun res!196744 () Bool)

(assert (=> b!354857 (=> (not res!196744) (not e!217479))))

(assert (=> b!354857 (= res!196744 (validKeyInArray!0 k!1077))))

(declare-fun b!354858 () Bool)

(declare-fun e!217477 () Bool)

(assert (=> b!354858 (= e!217477 tp_is_empty!7891)))

(declare-fun res!196746 () Bool)

(assert (=> start!35438 (=> (not res!196746) (not e!217479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35438 (= res!196746 (validMask!0 mask!1842))))

(assert (=> start!35438 e!217479))

(assert (=> start!35438 tp_is_empty!7891))

(assert (=> start!35438 true))

(assert (=> start!35438 tp!27260))

(declare-fun array_inv!6744 (array!19363) Bool)

(assert (=> start!35438 (array_inv!6744 _keys!1456)))

(declare-fun e!217481 () Bool)

(declare-fun array_inv!6745 (array!19365) Bool)

(assert (=> start!35438 (and (array_inv!6745 _values!1208) e!217481)))

(declare-fun b!354859 () Bool)

(assert (=> b!354859 (= e!217481 (and e!217477 mapRes!13344))))

(declare-fun condMapEmpty!13344 () Bool)

(declare-fun mapDefault!13344 () ValueCell!3602)

