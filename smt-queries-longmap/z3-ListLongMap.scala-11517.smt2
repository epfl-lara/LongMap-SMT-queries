; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134026 () Bool)

(assert start!134026)

(declare-fun b_free!32203 () Bool)

(declare-fun b_next!32203 () Bool)

(assert (=> start!134026 (= b_free!32203 (not b_next!32203))))

(declare-fun tp!113928 () Bool)

(declare-fun b_and!51829 () Bool)

(assert (=> start!134026 (= tp!113928 b_and!51829)))

(declare-fun b!1566690 () Bool)

(declare-fun res!1070854 () Bool)

(declare-fun e!873283 () Bool)

(assert (=> b!1566690 (=> (not res!1070854) (not e!873283))))

(declare-datatypes ((array!104582 0))(
  ( (array!104583 (arr!50477 (Array (_ BitVec 32) (_ BitVec 64))) (size!51029 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104582)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104582 (_ BitVec 32)) Bool)

(assert (=> b!1566690 (= res!1070854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566691 () Bool)

(declare-fun res!1070848 () Bool)

(assert (=> b!1566691 (=> (not res!1070848) (not e!873283))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1566691 (= res!1070848 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51029 _keys!637)) (bvslt from!782 (size!51029 _keys!637))))))

(declare-fun b!1566692 () Bool)

(declare-fun e!873280 () Bool)

(assert (=> b!1566692 (= e!873280 false)))

(declare-fun lt!672559 () Bool)

(declare-datatypes ((V!60185 0))(
  ( (V!60186 (val!19575 Int)) )
))
(declare-datatypes ((tuple2!25330 0))(
  ( (tuple2!25331 (_1!12676 (_ BitVec 64)) (_2!12676 V!60185)) )
))
(declare-datatypes ((List!36690 0))(
  ( (Nil!36687) (Cons!36686 (h!38134 tuple2!25330) (t!51586 List!36690)) )
))
(declare-datatypes ((ListLongMap!22765 0))(
  ( (ListLongMap!22766 (toList!11398 List!36690)) )
))
(declare-fun lt!672558 () ListLongMap!22765)

(declare-fun contains!10313 (ListLongMap!22765 (_ BitVec 64)) Bool)

(assert (=> b!1566692 (= lt!672559 (contains!10313 lt!672558 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566693 () Bool)

(declare-fun e!873281 () Bool)

(declare-fun e!873282 () Bool)

(declare-fun mapRes!59874 () Bool)

(assert (=> b!1566693 (= e!873281 (and e!873282 mapRes!59874))))

(declare-fun condMapEmpty!59874 () Bool)

(declare-datatypes ((ValueCell!18461 0))(
  ( (ValueCellFull!18461 (v!22330 V!60185)) (EmptyCell!18461) )
))
(declare-datatypes ((array!104584 0))(
  ( (array!104585 (arr!50478 (Array (_ BitVec 32) ValueCell!18461)) (size!51030 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104584)

(declare-fun mapDefault!59874 () ValueCell!18461)

(assert (=> b!1566693 (= condMapEmpty!59874 (= (arr!50478 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18461)) mapDefault!59874)))))

(declare-fun b!1566694 () Bool)

(declare-fun e!873278 () Bool)

(declare-fun tp_is_empty!38983 () Bool)

(assert (=> b!1566694 (= e!873278 tp_is_empty!38983)))

(declare-fun b!1566695 () Bool)

(declare-fun res!1070851 () Bool)

(assert (=> b!1566695 (=> (not res!1070851) (not e!873283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566695 (= res!1070851 (not (validKeyInArray!0 (select (arr!50477 _keys!637) from!782))))))

(declare-fun res!1070853 () Bool)

(assert (=> start!134026 (=> (not res!1070853) (not e!873283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134026 (= res!1070853 (validMask!0 mask!947))))

(assert (=> start!134026 e!873283))

(assert (=> start!134026 tp!113928))

(assert (=> start!134026 tp_is_empty!38983))

(assert (=> start!134026 true))

(declare-fun array_inv!39423 (array!104582) Bool)

(assert (=> start!134026 (array_inv!39423 _keys!637)))

(declare-fun array_inv!39424 (array!104584) Bool)

(assert (=> start!134026 (and (array_inv!39424 _values!487) e!873281)))

(declare-fun b!1566696 () Bool)

(declare-fun res!1070849 () Bool)

(assert (=> b!1566696 (=> (not res!1070849) (not e!873283))))

(declare-datatypes ((List!36691 0))(
  ( (Nil!36688) (Cons!36687 (h!38135 (_ BitVec 64)) (t!51587 List!36691)) )
))
(declare-fun arrayNoDuplicates!0 (array!104582 (_ BitVec 32) List!36691) Bool)

(assert (=> b!1566696 (= res!1070849 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36688))))

(declare-fun mapNonEmpty!59874 () Bool)

(declare-fun tp!113929 () Bool)

(assert (=> mapNonEmpty!59874 (= mapRes!59874 (and tp!113929 e!873278))))

(declare-fun mapKey!59874 () (_ BitVec 32))

(declare-fun mapRest!59874 () (Array (_ BitVec 32) ValueCell!18461))

(declare-fun mapValue!59874 () ValueCell!18461)

(assert (=> mapNonEmpty!59874 (= (arr!50478 _values!487) (store mapRest!59874 mapKey!59874 mapValue!59874))))

(declare-fun mapIsEmpty!59874 () Bool)

(assert (=> mapIsEmpty!59874 mapRes!59874))

(declare-fun b!1566697 () Bool)

(declare-fun res!1070852 () Bool)

(assert (=> b!1566697 (=> (not res!1070852) (not e!873283))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566697 (= res!1070852 (and (= (size!51030 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51029 _keys!637) (size!51030 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566698 () Bool)

(assert (=> b!1566698 (= e!873282 tp_is_empty!38983)))

(declare-fun b!1566699 () Bool)

(assert (=> b!1566699 (= e!873283 e!873280)))

(declare-fun res!1070850 () Bool)

(assert (=> b!1566699 (=> (not res!1070850) (not e!873280))))

(assert (=> b!1566699 (= res!1070850 (not (contains!10313 lt!672558 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60185)

(declare-fun minValue!453 () V!60185)

(declare-fun getCurrentListMapNoExtraKeys!6748 (array!104582 array!104584 (_ BitVec 32) (_ BitVec 32) V!60185 V!60185 (_ BitVec 32) Int) ListLongMap!22765)

(assert (=> b!1566699 (= lt!672558 (getCurrentListMapNoExtraKeys!6748 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!134026 res!1070853) b!1566697))

(assert (= (and b!1566697 res!1070852) b!1566690))

(assert (= (and b!1566690 res!1070854) b!1566696))

(assert (= (and b!1566696 res!1070849) b!1566691))

(assert (= (and b!1566691 res!1070848) b!1566695))

(assert (= (and b!1566695 res!1070851) b!1566699))

(assert (= (and b!1566699 res!1070850) b!1566692))

(assert (= (and b!1566693 condMapEmpty!59874) mapIsEmpty!59874))

(assert (= (and b!1566693 (not condMapEmpty!59874)) mapNonEmpty!59874))

(get-info :version)

(assert (= (and mapNonEmpty!59874 ((_ is ValueCellFull!18461) mapValue!59874)) b!1566694))

(assert (= (and b!1566693 ((_ is ValueCellFull!18461) mapDefault!59874)) b!1566698))

(assert (= start!134026 b!1566693))

(declare-fun m!1441087 () Bool)

(assert (=> b!1566695 m!1441087))

(assert (=> b!1566695 m!1441087))

(declare-fun m!1441089 () Bool)

(assert (=> b!1566695 m!1441089))

(declare-fun m!1441091 () Bool)

(assert (=> mapNonEmpty!59874 m!1441091))

(declare-fun m!1441093 () Bool)

(assert (=> b!1566690 m!1441093))

(declare-fun m!1441095 () Bool)

(assert (=> b!1566692 m!1441095))

(declare-fun m!1441097 () Bool)

(assert (=> start!134026 m!1441097))

(declare-fun m!1441099 () Bool)

(assert (=> start!134026 m!1441099))

(declare-fun m!1441101 () Bool)

(assert (=> start!134026 m!1441101))

(declare-fun m!1441103 () Bool)

(assert (=> b!1566696 m!1441103))

(declare-fun m!1441105 () Bool)

(assert (=> b!1566699 m!1441105))

(declare-fun m!1441107 () Bool)

(assert (=> b!1566699 m!1441107))

(check-sat (not b!1566692) (not mapNonEmpty!59874) b_and!51829 tp_is_empty!38983 (not b!1566696) (not b!1566690) (not b_next!32203) (not b!1566699) (not start!134026) (not b!1566695))
(check-sat b_and!51829 (not b_next!32203))
