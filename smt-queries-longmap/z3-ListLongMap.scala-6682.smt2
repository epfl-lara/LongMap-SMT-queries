; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84046 () Bool)

(assert start!84046)

(declare-fun b_free!19819 () Bool)

(declare-fun b_next!19819 () Bool)

(assert (=> start!84046 (= b_free!19819 (not b_next!19819))))

(declare-fun tp!68980 () Bool)

(declare-fun b_and!31695 () Bool)

(assert (=> start!84046 (= tp!68980 b_and!31695)))

(declare-fun mapNonEmpty!36329 () Bool)

(declare-fun mapRes!36329 () Bool)

(declare-fun tp!68981 () Bool)

(declare-fun e!553869 () Bool)

(assert (=> mapNonEmpty!36329 (= mapRes!36329 (and tp!68981 e!553869))))

(declare-datatypes ((V!35473 0))(
  ( (V!35474 (val!11484 Int)) )
))
(declare-datatypes ((ValueCell!10952 0))(
  ( (ValueCellFull!10952 (v!14045 V!35473)) (EmptyCell!10952) )
))
(declare-datatypes ((array!61658 0))(
  ( (array!61659 (arr!29687 (Array (_ BitVec 32) ValueCell!10952)) (size!30168 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61658)

(declare-fun mapValue!36329 () ValueCell!10952)

(declare-fun mapRest!36329 () (Array (_ BitVec 32) ValueCell!10952))

(declare-fun mapKey!36329 () (_ BitVec 32))

(assert (=> mapNonEmpty!36329 (= (arr!29687 _values!1278) (store mapRest!36329 mapKey!36329 mapValue!36329))))

(declare-fun b!982635 () Bool)

(declare-fun e!553870 () Bool)

(declare-fun e!553872 () Bool)

(assert (=> b!982635 (= e!553870 (and e!553872 mapRes!36329))))

(declare-fun condMapEmpty!36329 () Bool)

(declare-fun mapDefault!36329 () ValueCell!10952)

(assert (=> b!982635 (= condMapEmpty!36329 (= (arr!29687 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10952)) mapDefault!36329)))))

(declare-fun b!982636 () Bool)

(declare-fun tp_is_empty!22867 () Bool)

(assert (=> b!982636 (= e!553869 tp_is_empty!22867)))

(declare-fun b!982637 () Bool)

(declare-fun e!553871 () Bool)

(assert (=> b!982637 (= e!553871 (not true))))

(declare-datatypes ((tuple2!14786 0))(
  ( (tuple2!14787 (_1!7404 (_ BitVec 64)) (_2!7404 V!35473)) )
))
(declare-datatypes ((List!20624 0))(
  ( (Nil!20621) (Cons!20620 (h!21782 tuple2!14786) (t!29384 List!20624)) )
))
(declare-datatypes ((ListLongMap!13473 0))(
  ( (ListLongMap!13474 (toList!6752 List!20624)) )
))
(declare-fun lt!436089 () ListLongMap!13473)

(declare-fun lt!436086 () tuple2!14786)

(declare-fun lt!436087 () tuple2!14786)

(declare-fun +!3042 (ListLongMap!13473 tuple2!14786) ListLongMap!13473)

(assert (=> b!982637 (= (+!3042 (+!3042 lt!436089 lt!436086) lt!436087) (+!3042 (+!3042 lt!436089 lt!436087) lt!436086))))

(declare-fun lt!436085 () V!35473)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61660 0))(
  ( (array!61661 (arr!29688 (Array (_ BitVec 32) (_ BitVec 64))) (size!30169 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61660)

(assert (=> b!982637 (= lt!436087 (tuple2!14787 (select (arr!29688 _keys!1544) from!1932) lt!436085))))

(declare-fun zeroValue!1220 () V!35473)

(assert (=> b!982637 (= lt!436086 (tuple2!14787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32550 0))(
  ( (Unit!32551) )
))
(declare-fun lt!436088 () Unit!32550)

(declare-fun addCommutativeForDiffKeys!646 (ListLongMap!13473 (_ BitVec 64) V!35473 (_ BitVec 64) V!35473) Unit!32550)

(assert (=> b!982637 (= lt!436088 (addCommutativeForDiffKeys!646 lt!436089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29688 _keys!1544) from!1932) lt!436085))))

(declare-fun b!982638 () Bool)

(declare-fun res!657635 () Bool)

(declare-fun e!553874 () Bool)

(assert (=> b!982638 (=> (not res!657635) (not e!553874))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982638 (= res!657635 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!657629 () Bool)

(assert (=> start!84046 (=> (not res!657629) (not e!553874))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84046 (= res!657629 (validMask!0 mask!1948))))

(assert (=> start!84046 e!553874))

(assert (=> start!84046 true))

(assert (=> start!84046 tp_is_empty!22867))

(declare-fun array_inv!22967 (array!61658) Bool)

(assert (=> start!84046 (and (array_inv!22967 _values!1278) e!553870)))

(assert (=> start!84046 tp!68980))

(declare-fun array_inv!22968 (array!61660) Bool)

(assert (=> start!84046 (array_inv!22968 _keys!1544)))

(declare-fun b!982639 () Bool)

(declare-fun res!657631 () Bool)

(assert (=> b!982639 (=> (not res!657631) (not e!553874))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61660 (_ BitVec 32)) Bool)

(assert (=> b!982639 (= res!657631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982640 () Bool)

(declare-fun res!657632 () Bool)

(assert (=> b!982640 (=> (not res!657632) (not e!553874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982640 (= res!657632 (validKeyInArray!0 (select (arr!29688 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36329 () Bool)

(assert (=> mapIsEmpty!36329 mapRes!36329))

(declare-fun b!982641 () Bool)

(declare-fun res!657636 () Bool)

(assert (=> b!982641 (=> (not res!657636) (not e!553874))))

(assert (=> b!982641 (= res!657636 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30169 _keys!1544))))))

(declare-fun b!982642 () Bool)

(assert (=> b!982642 (= e!553872 tp_is_empty!22867)))

(declare-fun b!982643 () Bool)

(declare-fun res!657633 () Bool)

(assert (=> b!982643 (=> (not res!657633) (not e!553874))))

(declare-datatypes ((List!20625 0))(
  ( (Nil!20622) (Cons!20621 (h!21783 (_ BitVec 64)) (t!29385 List!20625)) )
))
(declare-fun arrayNoDuplicates!0 (array!61660 (_ BitVec 32) List!20625) Bool)

(assert (=> b!982643 (= res!657633 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20622))))

(declare-fun b!982644 () Bool)

(declare-fun res!657634 () Bool)

(assert (=> b!982644 (=> (not res!657634) (not e!553874))))

(assert (=> b!982644 (= res!657634 (and (= (size!30168 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30169 _keys!1544) (size!30168 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982645 () Bool)

(assert (=> b!982645 (= e!553874 e!553871)))

(declare-fun res!657630 () Bool)

(assert (=> b!982645 (=> (not res!657630) (not e!553871))))

(assert (=> b!982645 (= res!657630 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29688 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15413 (ValueCell!10952 V!35473) V!35473)

(declare-fun dynLambda!1791 (Int (_ BitVec 64)) V!35473)

(assert (=> b!982645 (= lt!436085 (get!15413 (select (arr!29687 _values!1278) from!1932) (dynLambda!1791 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35473)

(declare-fun getCurrentListMapNoExtraKeys!3461 (array!61660 array!61658 (_ BitVec 32) (_ BitVec 32) V!35473 V!35473 (_ BitVec 32) Int) ListLongMap!13473)

(assert (=> b!982645 (= lt!436089 (getCurrentListMapNoExtraKeys!3461 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84046 res!657629) b!982644))

(assert (= (and b!982644 res!657634) b!982639))

(assert (= (and b!982639 res!657631) b!982643))

(assert (= (and b!982643 res!657633) b!982641))

(assert (= (and b!982641 res!657636) b!982640))

(assert (= (and b!982640 res!657632) b!982638))

(assert (= (and b!982638 res!657635) b!982645))

(assert (= (and b!982645 res!657630) b!982637))

(assert (= (and b!982635 condMapEmpty!36329) mapIsEmpty!36329))

(assert (= (and b!982635 (not condMapEmpty!36329)) mapNonEmpty!36329))

(get-info :version)

(assert (= (and mapNonEmpty!36329 ((_ is ValueCellFull!10952) mapValue!36329)) b!982636))

(assert (= (and b!982635 ((_ is ValueCellFull!10952) mapDefault!36329)) b!982642))

(assert (= start!84046 b!982635))

(declare-fun b_lambda!14839 () Bool)

(assert (=> (not b_lambda!14839) (not b!982645)))

(declare-fun t!29383 () Bool)

(declare-fun tb!6611 () Bool)

(assert (=> (and start!84046 (= defaultEntry!1281 defaultEntry!1281) t!29383) tb!6611))

(declare-fun result!13219 () Bool)

(assert (=> tb!6611 (= result!13219 tp_is_empty!22867)))

(assert (=> b!982645 t!29383))

(declare-fun b_and!31697 () Bool)

(assert (= b_and!31695 (and (=> t!29383 result!13219) b_and!31697)))

(declare-fun m!909443 () Bool)

(assert (=> b!982643 m!909443))

(declare-fun m!909445 () Bool)

(assert (=> b!982637 m!909445))

(declare-fun m!909447 () Bool)

(assert (=> b!982637 m!909447))

(declare-fun m!909449 () Bool)

(assert (=> b!982637 m!909449))

(assert (=> b!982637 m!909445))

(declare-fun m!909451 () Bool)

(assert (=> b!982637 m!909451))

(assert (=> b!982637 m!909449))

(declare-fun m!909453 () Bool)

(assert (=> b!982637 m!909453))

(assert (=> b!982637 m!909447))

(declare-fun m!909455 () Bool)

(assert (=> b!982637 m!909455))

(declare-fun m!909457 () Bool)

(assert (=> mapNonEmpty!36329 m!909457))

(declare-fun m!909459 () Bool)

(assert (=> start!84046 m!909459))

(declare-fun m!909461 () Bool)

(assert (=> start!84046 m!909461))

(declare-fun m!909463 () Bool)

(assert (=> start!84046 m!909463))

(assert (=> b!982645 m!909447))

(declare-fun m!909465 () Bool)

(assert (=> b!982645 m!909465))

(declare-fun m!909467 () Bool)

(assert (=> b!982645 m!909467))

(declare-fun m!909469 () Bool)

(assert (=> b!982645 m!909469))

(assert (=> b!982645 m!909465))

(assert (=> b!982645 m!909469))

(declare-fun m!909471 () Bool)

(assert (=> b!982645 m!909471))

(assert (=> b!982640 m!909447))

(assert (=> b!982640 m!909447))

(declare-fun m!909473 () Bool)

(assert (=> b!982640 m!909473))

(declare-fun m!909475 () Bool)

(assert (=> b!982639 m!909475))

(check-sat (not b!982637) (not b!982639) (not b!982643) (not b!982640) (not b_lambda!14839) (not b!982645) (not b_next!19819) tp_is_empty!22867 (not start!84046) b_and!31697 (not mapNonEmpty!36329))
(check-sat b_and!31697 (not b_next!19819))
