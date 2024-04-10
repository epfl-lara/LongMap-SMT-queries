; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3984 () Bool)

(assert start!3984)

(declare-fun b_free!889 () Bool)

(declare-fun b_next!889 () Bool)

(assert (=> start!3984 (= b_free!889 (not b_next!889))))

(declare-fun tp!4087 () Bool)

(declare-fun b_and!1699 () Bool)

(assert (=> start!3984 (= tp!4087 b_and!1699)))

(declare-fun b!28754 () Bool)

(declare-fun res!17172 () Bool)

(declare-fun e!18593 () Bool)

(assert (=> b!28754 (=> (not res!17172) (not e!18593))))

(declare-datatypes ((array!1721 0))(
  ( (array!1722 (arr!814 (Array (_ BitVec 32) (_ BitVec 64))) (size!915 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1721)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1721 (_ BitVec 32)) Bool)

(assert (=> b!28754 (= res!17172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!28755 () Bool)

(declare-fun e!18595 () Bool)

(declare-fun tp_is_empty!1243 () Bool)

(assert (=> b!28755 (= e!18595 tp_is_empty!1243)))

(declare-fun b!28756 () Bool)

(declare-fun res!17173 () Bool)

(assert (=> b!28756 (=> (not res!17173) (not e!18593))))

(declare-datatypes ((V!1483 0))(
  ( (V!1484 (val!648 Int)) )
))
(declare-datatypes ((ValueCell!422 0))(
  ( (ValueCellFull!422 (v!1737 V!1483)) (EmptyCell!422) )
))
(declare-datatypes ((array!1723 0))(
  ( (array!1724 (arr!815 (Array (_ BitVec 32) ValueCell!422)) (size!916 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1723)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!28756 (= res!17173 (and (= (size!916 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!915 _keys!1833) (size!916 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28757 () Bool)

(declare-fun e!18590 () Bool)

(declare-fun e!18596 () Bool)

(assert (=> b!28757 (= e!18590 (not e!18596))))

(declare-fun res!17174 () Bool)

(assert (=> b!28757 (=> res!17174 e!18596)))

(assert (=> b!28757 (= res!17174 (not (= (size!915 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((tuple2!1078 0))(
  ( (tuple2!1079 (_1!550 (_ BitVec 64)) (_2!550 V!1483)) )
))
(declare-datatypes ((List!677 0))(
  ( (Nil!674) (Cons!673 (h!1240 tuple2!1078) (t!3370 List!677)) )
))
(declare-datatypes ((ListLongMap!655 0))(
  ( (ListLongMap!656 (toList!343 List!677)) )
))
(declare-fun lt!10924 () ListLongMap!655)

(declare-fun lt!10925 () (_ BitVec 32))

(declare-fun contains!283 (ListLongMap!655 (_ BitVec 64)) Bool)

(assert (=> b!28757 (contains!283 lt!10924 (select (arr!814 _keys!1833) lt!10925))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((Unit!651 0))(
  ( (Unit!652) )
))
(declare-fun lt!10922 () Unit!651)

(declare-fun zeroValue!1443 () V!1483)

(declare-fun minValue!1443 () V!1483)

(declare-fun lemmaValidKeyInArrayIsInListMap!19 (array!1721 array!1723 (_ BitVec 32) (_ BitVec 32) V!1483 V!1483 (_ BitVec 32) Int) Unit!651)

(assert (=> b!28757 (= lt!10922 (lemmaValidKeyInArrayIsInListMap!19 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10925 defaultEntry!1504))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1721 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28757 (= lt!10925 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28758 () Bool)

(declare-fun res!17177 () Bool)

(assert (=> b!28758 (=> (not res!17177) (not e!18590))))

(declare-fun arrayContainsKey!0 (array!1721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28758 (= res!17177 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1393 () Bool)

(declare-fun mapRes!1393 () Bool)

(declare-fun tp!4086 () Bool)

(declare-fun e!18592 () Bool)

(assert (=> mapNonEmpty!1393 (= mapRes!1393 (and tp!4086 e!18592))))

(declare-fun mapKey!1393 () (_ BitVec 32))

(declare-fun mapRest!1393 () (Array (_ BitVec 32) ValueCell!422))

(declare-fun mapValue!1393 () ValueCell!422)

(assert (=> mapNonEmpty!1393 (= (arr!815 _values!1501) (store mapRest!1393 mapKey!1393 mapValue!1393))))

(declare-fun b!28759 () Bool)

(declare-fun res!17178 () Bool)

(assert (=> b!28759 (=> (not res!17178) (not e!18593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28759 (= res!17178 (validKeyInArray!0 k!1304))))

(declare-fun b!28760 () Bool)

(assert (=> b!28760 (= e!18593 e!18590)))

(declare-fun res!17171 () Bool)

(assert (=> b!28760 (=> (not res!17171) (not e!18590))))

(assert (=> b!28760 (= res!17171 (not (contains!283 lt!10924 k!1304)))))

(declare-fun getCurrentListMap!173 (array!1721 array!1723 (_ BitVec 32) (_ BitVec 32) V!1483 V!1483 (_ BitVec 32) Int) ListLongMap!655)

(assert (=> b!28760 (= lt!10924 (getCurrentListMap!173 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!17175 () Bool)

(assert (=> start!3984 (=> (not res!17175) (not e!18593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3984 (= res!17175 (validMask!0 mask!2294))))

(assert (=> start!3984 e!18593))

(assert (=> start!3984 true))

(assert (=> start!3984 tp!4087))

(declare-fun e!18591 () Bool)

(declare-fun array_inv!559 (array!1723) Bool)

(assert (=> start!3984 (and (array_inv!559 _values!1501) e!18591)))

(declare-fun array_inv!560 (array!1721) Bool)

(assert (=> start!3984 (array_inv!560 _keys!1833)))

(assert (=> start!3984 tp_is_empty!1243))

(declare-fun b!28761 () Bool)

(declare-fun res!17176 () Bool)

(assert (=> b!28761 (=> (not res!17176) (not e!18593))))

(declare-datatypes ((List!678 0))(
  ( (Nil!675) (Cons!674 (h!1241 (_ BitVec 64)) (t!3371 List!678)) )
))
(declare-fun arrayNoDuplicates!0 (array!1721 (_ BitVec 32) List!678) Bool)

(assert (=> b!28761 (= res!17176 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!675))))

(declare-fun b!28762 () Bool)

(assert (=> b!28762 (= e!18592 tp_is_empty!1243)))

(declare-fun b!28763 () Bool)

(assert (=> b!28763 (= e!18596 true)))

(declare-datatypes ((SeekEntryResult!72 0))(
  ( (MissingZero!72 (index!2410 (_ BitVec 32))) (Found!72 (index!2411 (_ BitVec 32))) (Intermediate!72 (undefined!884 Bool) (index!2412 (_ BitVec 32)) (x!6350 (_ BitVec 32))) (Undefined!72) (MissingVacant!72 (index!2413 (_ BitVec 32))) )
))
(declare-fun lt!10923 () SeekEntryResult!72)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1721 (_ BitVec 32)) SeekEntryResult!72)

(assert (=> b!28763 (= lt!10923 (seekEntryOrOpen!0 k!1304 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1393 () Bool)

(assert (=> mapIsEmpty!1393 mapRes!1393))

(declare-fun b!28764 () Bool)

(assert (=> b!28764 (= e!18591 (and e!18595 mapRes!1393))))

(declare-fun condMapEmpty!1393 () Bool)

(declare-fun mapDefault!1393 () ValueCell!422)

