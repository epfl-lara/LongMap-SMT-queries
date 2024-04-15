; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133676 () Bool)

(assert start!133676)

(declare-fun b_free!32089 () Bool)

(declare-fun b_next!32089 () Bool)

(assert (=> start!133676 (= b_free!32089 (not b_next!32089))))

(declare-fun tp!113473 () Bool)

(declare-fun b_and!51641 () Bool)

(assert (=> start!133676 (= tp!113473 b_and!51641)))

(declare-fun b!1563292 () Bool)

(declare-fun e!871257 () Bool)

(assert (=> b!1563292 (= e!871257 false)))

(declare-fun lt!671635 () Bool)

(declare-datatypes ((V!59953 0))(
  ( (V!59954 (val!19488 Int)) )
))
(declare-datatypes ((tuple2!25216 0))(
  ( (tuple2!25217 (_1!12619 (_ BitVec 64)) (_2!12619 V!59953)) )
))
(declare-datatypes ((List!36573 0))(
  ( (Nil!36570) (Cons!36569 (h!38016 tuple2!25216) (t!51412 List!36573)) )
))
(declare-datatypes ((ListLongMap!22651 0))(
  ( (ListLongMap!22652 (toList!11341 List!36573)) )
))
(declare-fun lt!671636 () ListLongMap!22651)

(declare-fun contains!10251 (ListLongMap!22651 (_ BitVec 64)) Bool)

(assert (=> b!1563292 (= lt!671635 (contains!10251 lt!671636 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1563293 () Bool)

(declare-fun res!1068832 () Bool)

(declare-fun e!871253 () Bool)

(assert (=> b!1563293 (=> (not res!1068832) (not e!871253))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104234 0))(
  ( (array!104235 (arr!50310 (Array (_ BitVec 32) (_ BitVec 64))) (size!50862 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104234)

(declare-datatypes ((ValueCell!18374 0))(
  ( (ValueCellFull!18374 (v!22236 V!59953)) (EmptyCell!18374) )
))
(declare-datatypes ((array!104236 0))(
  ( (array!104237 (arr!50311 (Array (_ BitVec 32) ValueCell!18374)) (size!50863 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104236)

(assert (=> b!1563293 (= res!1068832 (and (= (size!50863 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50862 _keys!637) (size!50863 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563294 () Bool)

(assert (=> b!1563294 (= e!871253 e!871257)))

(declare-fun res!1068831 () Bool)

(assert (=> b!1563294 (=> (not res!1068831) (not e!871257))))

(assert (=> b!1563294 (= res!1068831 (not (contains!10251 lt!671636 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59953)

(declare-fun minValue!453 () V!59953)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6713 (array!104234 array!104236 (_ BitVec 32) (_ BitVec 32) V!59953 V!59953 (_ BitVec 32) Int) ListLongMap!22651)

(assert (=> b!1563294 (= lt!671636 (getCurrentListMapNoExtraKeys!6713 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563295 () Bool)

(declare-fun e!871258 () Bool)

(declare-fun tp_is_empty!38809 () Bool)

(assert (=> b!1563295 (= e!871258 tp_is_empty!38809)))

(declare-fun b!1563296 () Bool)

(declare-fun res!1068835 () Bool)

(assert (=> b!1563296 (=> (not res!1068835) (not e!871253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563296 (= res!1068835 (not (validKeyInArray!0 (select (arr!50310 _keys!637) from!782))))))

(declare-fun b!1563297 () Bool)

(declare-fun e!871256 () Bool)

(assert (=> b!1563297 (= e!871256 tp_is_empty!38809)))

(declare-fun res!1068834 () Bool)

(assert (=> start!133676 (=> (not res!1068834) (not e!871253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133676 (= res!1068834 (validMask!0 mask!947))))

(assert (=> start!133676 e!871253))

(assert (=> start!133676 tp!113473))

(assert (=> start!133676 tp_is_empty!38809))

(assert (=> start!133676 true))

(declare-fun array_inv!39289 (array!104234) Bool)

(assert (=> start!133676 (array_inv!39289 _keys!637)))

(declare-fun e!871254 () Bool)

(declare-fun array_inv!39290 (array!104236) Bool)

(assert (=> start!133676 (and (array_inv!39290 _values!487) e!871254)))

(declare-fun b!1563298 () Bool)

(declare-fun res!1068836 () Bool)

(assert (=> b!1563298 (=> (not res!1068836) (not e!871253))))

(declare-datatypes ((List!36574 0))(
  ( (Nil!36571) (Cons!36570 (h!38017 (_ BitVec 64)) (t!51413 List!36574)) )
))
(declare-fun arrayNoDuplicates!0 (array!104234 (_ BitVec 32) List!36574) Bool)

(assert (=> b!1563298 (= res!1068836 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36571))))

(declare-fun b!1563299 () Bool)

(declare-fun mapRes!59589 () Bool)

(assert (=> b!1563299 (= e!871254 (and e!871258 mapRes!59589))))

(declare-fun condMapEmpty!59589 () Bool)

(declare-fun mapDefault!59589 () ValueCell!18374)

(assert (=> b!1563299 (= condMapEmpty!59589 (= (arr!50311 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18374)) mapDefault!59589)))))

(declare-fun mapNonEmpty!59589 () Bool)

(declare-fun tp!113472 () Bool)

(assert (=> mapNonEmpty!59589 (= mapRes!59589 (and tp!113472 e!871256))))

(declare-fun mapRest!59589 () (Array (_ BitVec 32) ValueCell!18374))

(declare-fun mapValue!59589 () ValueCell!18374)

(declare-fun mapKey!59589 () (_ BitVec 32))

(assert (=> mapNonEmpty!59589 (= (arr!50311 _values!487) (store mapRest!59589 mapKey!59589 mapValue!59589))))

(declare-fun b!1563300 () Bool)

(declare-fun res!1068833 () Bool)

(assert (=> b!1563300 (=> (not res!1068833) (not e!871253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104234 (_ BitVec 32)) Bool)

(assert (=> b!1563300 (= res!1068833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563301 () Bool)

(declare-fun res!1068837 () Bool)

(assert (=> b!1563301 (=> (not res!1068837) (not e!871253))))

(assert (=> b!1563301 (= res!1068837 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50862 _keys!637)) (bvslt from!782 (size!50862 _keys!637))))))

(declare-fun mapIsEmpty!59589 () Bool)

(assert (=> mapIsEmpty!59589 mapRes!59589))

(assert (= (and start!133676 res!1068834) b!1563293))

(assert (= (and b!1563293 res!1068832) b!1563300))

(assert (= (and b!1563300 res!1068833) b!1563298))

(assert (= (and b!1563298 res!1068836) b!1563301))

(assert (= (and b!1563301 res!1068837) b!1563296))

(assert (= (and b!1563296 res!1068835) b!1563294))

(assert (= (and b!1563294 res!1068831) b!1563292))

(assert (= (and b!1563299 condMapEmpty!59589) mapIsEmpty!59589))

(assert (= (and b!1563299 (not condMapEmpty!59589)) mapNonEmpty!59589))

(get-info :version)

(assert (= (and mapNonEmpty!59589 ((_ is ValueCellFull!18374) mapValue!59589)) b!1563297))

(assert (= (and b!1563299 ((_ is ValueCellFull!18374) mapDefault!59589)) b!1563295))

(assert (= start!133676 b!1563299))

(declare-fun m!1438191 () Bool)

(assert (=> start!133676 m!1438191))

(declare-fun m!1438193 () Bool)

(assert (=> start!133676 m!1438193))

(declare-fun m!1438195 () Bool)

(assert (=> start!133676 m!1438195))

(declare-fun m!1438197 () Bool)

(assert (=> b!1563296 m!1438197))

(assert (=> b!1563296 m!1438197))

(declare-fun m!1438199 () Bool)

(assert (=> b!1563296 m!1438199))

(declare-fun m!1438201 () Bool)

(assert (=> b!1563292 m!1438201))

(declare-fun m!1438203 () Bool)

(assert (=> mapNonEmpty!59589 m!1438203))

(declare-fun m!1438205 () Bool)

(assert (=> b!1563298 m!1438205))

(declare-fun m!1438207 () Bool)

(assert (=> b!1563294 m!1438207))

(declare-fun m!1438209 () Bool)

(assert (=> b!1563294 m!1438209))

(declare-fun m!1438211 () Bool)

(assert (=> b!1563300 m!1438211))

(check-sat (not b_next!32089) (not mapNonEmpty!59589) (not b!1563292) (not b!1563300) (not b!1563296) b_and!51641 tp_is_empty!38809 (not b!1563294) (not start!133676) (not b!1563298))
(check-sat b_and!51641 (not b_next!32089))
