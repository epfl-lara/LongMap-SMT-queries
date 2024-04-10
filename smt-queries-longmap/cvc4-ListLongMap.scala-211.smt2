; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3952 () Bool)

(assert start!3952)

(declare-fun b_free!857 () Bool)

(declare-fun b_next!857 () Bool)

(assert (=> start!3952 (= b_free!857 (not b_next!857))))

(declare-fun tp!3990 () Bool)

(declare-fun b_and!1667 () Bool)

(assert (=> start!3952 (= tp!3990 b_and!1667)))

(declare-fun b!28237 () Bool)

(declare-fun e!18276 () Bool)

(assert (=> b!28237 (= e!18276 false)))

(declare-fun lt!10760 () (_ BitVec 32))

(declare-datatypes ((array!1661 0))(
  ( (array!1662 (arr!784 (Array (_ BitVec 32) (_ BitVec 64))) (size!885 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1661)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1661 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28237 (= lt!10760 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1345 () Bool)

(declare-fun mapRes!1345 () Bool)

(declare-fun tp!3991 () Bool)

(declare-fun e!18277 () Bool)

(assert (=> mapNonEmpty!1345 (= mapRes!1345 (and tp!3991 e!18277))))

(declare-datatypes ((V!1439 0))(
  ( (V!1440 (val!632 Int)) )
))
(declare-datatypes ((ValueCell!406 0))(
  ( (ValueCellFull!406 (v!1721 V!1439)) (EmptyCell!406) )
))
(declare-datatypes ((array!1663 0))(
  ( (array!1664 (arr!785 (Array (_ BitVec 32) ValueCell!406)) (size!886 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1663)

(declare-fun mapRest!1345 () (Array (_ BitVec 32) ValueCell!406))

(declare-fun mapValue!1345 () ValueCell!406)

(declare-fun mapKey!1345 () (_ BitVec 32))

(assert (=> mapNonEmpty!1345 (= (arr!785 _values!1501) (store mapRest!1345 mapKey!1345 mapValue!1345))))

(declare-fun b!28238 () Bool)

(declare-fun res!16802 () Bool)

(assert (=> b!28238 (=> (not res!16802) (not e!18276))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1661 (_ BitVec 32)) Bool)

(assert (=> b!28238 (= res!16802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1345 () Bool)

(assert (=> mapIsEmpty!1345 mapRes!1345))

(declare-fun b!28239 () Bool)

(declare-fun e!18275 () Bool)

(declare-fun tp_is_empty!1211 () Bool)

(assert (=> b!28239 (= e!18275 tp_is_empty!1211)))

(declare-fun b!28240 () Bool)

(declare-fun res!16801 () Bool)

(assert (=> b!28240 (=> (not res!16801) (not e!18276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28240 (= res!16801 (validKeyInArray!0 k!1304))))

(declare-fun b!28241 () Bool)

(declare-fun res!16798 () Bool)

(assert (=> b!28241 (=> (not res!16798) (not e!18276))))

(declare-fun arrayContainsKey!0 (array!1661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28241 (= res!16798 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28242 () Bool)

(declare-fun res!16797 () Bool)

(assert (=> b!28242 (=> (not res!16797) (not e!18276))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1439)

(declare-fun minValue!1443 () V!1439)

(declare-datatypes ((tuple2!1054 0))(
  ( (tuple2!1055 (_1!538 (_ BitVec 64)) (_2!538 V!1439)) )
))
(declare-datatypes ((List!655 0))(
  ( (Nil!652) (Cons!651 (h!1218 tuple2!1054) (t!3348 List!655)) )
))
(declare-datatypes ((ListLongMap!631 0))(
  ( (ListLongMap!632 (toList!331 List!655)) )
))
(declare-fun contains!271 (ListLongMap!631 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!161 (array!1661 array!1663 (_ BitVec 32) (_ BitVec 32) V!1439 V!1439 (_ BitVec 32) Int) ListLongMap!631)

(assert (=> b!28242 (= res!16797 (not (contains!271 (getCurrentListMap!161 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!28243 () Bool)

(declare-fun res!16800 () Bool)

(assert (=> b!28243 (=> (not res!16800) (not e!18276))))

(declare-datatypes ((List!656 0))(
  ( (Nil!653) (Cons!652 (h!1219 (_ BitVec 64)) (t!3349 List!656)) )
))
(declare-fun arrayNoDuplicates!0 (array!1661 (_ BitVec 32) List!656) Bool)

(assert (=> b!28243 (= res!16800 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!653))))

(declare-fun b!28244 () Bool)

(declare-fun res!16803 () Bool)

(assert (=> b!28244 (=> (not res!16803) (not e!18276))))

(assert (=> b!28244 (= res!16803 (and (= (size!886 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!885 _keys!1833) (size!886 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28245 () Bool)

(declare-fun e!18274 () Bool)

(assert (=> b!28245 (= e!18274 (and e!18275 mapRes!1345))))

(declare-fun condMapEmpty!1345 () Bool)

(declare-fun mapDefault!1345 () ValueCell!406)

