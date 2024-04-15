; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134014 () Bool)

(assert start!134014)

(declare-fun b_free!32191 () Bool)

(declare-fun b_next!32191 () Bool)

(assert (=> start!134014 (= b_free!32191 (not b_next!32191))))

(declare-fun tp!113892 () Bool)

(declare-fun b_and!51817 () Bool)

(assert (=> start!134014 (= tp!113892 b_and!51817)))

(declare-fun b!1566510 () Bool)

(declare-fun res!1070726 () Bool)

(declare-fun e!873172 () Bool)

(assert (=> b!1566510 (=> (not res!1070726) (not e!873172))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104560 0))(
  ( (array!104561 (arr!50466 (Array (_ BitVec 32) (_ BitVec 64))) (size!51018 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104560)

(assert (=> b!1566510 (= res!1070726 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51018 _keys!637)) (bvslt from!782 (size!51018 _keys!637))))))

(declare-fun mapIsEmpty!59856 () Bool)

(declare-fun mapRes!59856 () Bool)

(assert (=> mapIsEmpty!59856 mapRes!59856))

(declare-fun b!1566511 () Bool)

(declare-fun res!1070724 () Bool)

(assert (=> b!1566511 (=> (not res!1070724) (not e!873172))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104560 (_ BitVec 32)) Bool)

(assert (=> b!1566511 (= res!1070724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566512 () Bool)

(declare-fun e!873175 () Bool)

(assert (=> b!1566512 (= e!873175 false)))

(declare-fun lt!672523 () Bool)

(declare-datatypes ((V!60169 0))(
  ( (V!60170 (val!19569 Int)) )
))
(declare-datatypes ((tuple2!25324 0))(
  ( (tuple2!25325 (_1!12673 (_ BitVec 64)) (_2!12673 V!60169)) )
))
(declare-datatypes ((List!36684 0))(
  ( (Nil!36681) (Cons!36680 (h!38128 tuple2!25324) (t!51580 List!36684)) )
))
(declare-datatypes ((ListLongMap!22759 0))(
  ( (ListLongMap!22760 (toList!11395 List!36684)) )
))
(declare-fun lt!672522 () ListLongMap!22759)

(declare-fun contains!10310 (ListLongMap!22759 (_ BitVec 64)) Bool)

(assert (=> b!1566512 (= lt!672523 (contains!10310 lt!672522 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!1070727 () Bool)

(assert (=> start!134014 (=> (not res!1070727) (not e!873172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134014 (= res!1070727 (validMask!0 mask!947))))

(assert (=> start!134014 e!873172))

(assert (=> start!134014 tp!113892))

(declare-fun tp_is_empty!38971 () Bool)

(assert (=> start!134014 tp_is_empty!38971))

(assert (=> start!134014 true))

(declare-fun array_inv!39415 (array!104560) Bool)

(assert (=> start!134014 (array_inv!39415 _keys!637)))

(declare-datatypes ((ValueCell!18455 0))(
  ( (ValueCellFull!18455 (v!22324 V!60169)) (EmptyCell!18455) )
))
(declare-datatypes ((array!104562 0))(
  ( (array!104563 (arr!50467 (Array (_ BitVec 32) ValueCell!18455)) (size!51019 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104562)

(declare-fun e!873173 () Bool)

(declare-fun array_inv!39416 (array!104562) Bool)

(assert (=> start!134014 (and (array_inv!39416 _values!487) e!873173)))

(declare-fun b!1566513 () Bool)

(declare-fun e!873170 () Bool)

(assert (=> b!1566513 (= e!873170 tp_is_empty!38971)))

(declare-fun b!1566514 () Bool)

(declare-fun res!1070723 () Bool)

(assert (=> b!1566514 (=> (not res!1070723) (not e!873172))))

(declare-datatypes ((List!36685 0))(
  ( (Nil!36682) (Cons!36681 (h!38129 (_ BitVec 64)) (t!51581 List!36685)) )
))
(declare-fun arrayNoDuplicates!0 (array!104560 (_ BitVec 32) List!36685) Bool)

(assert (=> b!1566514 (= res!1070723 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36682))))

(declare-fun b!1566515 () Bool)

(declare-fun res!1070728 () Bool)

(assert (=> b!1566515 (=> (not res!1070728) (not e!873172))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1566515 (= res!1070728 (and (= (size!51019 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51018 _keys!637) (size!51019 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566516 () Bool)

(assert (=> b!1566516 (= e!873173 (and e!873170 mapRes!59856))))

(declare-fun condMapEmpty!59856 () Bool)

(declare-fun mapDefault!59856 () ValueCell!18455)

(assert (=> b!1566516 (= condMapEmpty!59856 (= (arr!50467 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18455)) mapDefault!59856)))))

(declare-fun b!1566517 () Bool)

(declare-fun e!873171 () Bool)

(assert (=> b!1566517 (= e!873171 tp_is_empty!38971)))

(declare-fun b!1566518 () Bool)

(assert (=> b!1566518 (= e!873172 e!873175)))

(declare-fun res!1070722 () Bool)

(assert (=> b!1566518 (=> (not res!1070722) (not e!873175))))

(assert (=> b!1566518 (= res!1070722 (not (contains!10310 lt!672522 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun minValue!453 () V!60169)

(declare-fun zeroValue!453 () V!60169)

(declare-fun getCurrentListMapNoExtraKeys!6746 (array!104560 array!104562 (_ BitVec 32) (_ BitVec 32) V!60169 V!60169 (_ BitVec 32) Int) ListLongMap!22759)

(assert (=> b!1566518 (= lt!672522 (getCurrentListMapNoExtraKeys!6746 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566519 () Bool)

(declare-fun res!1070725 () Bool)

(assert (=> b!1566519 (=> (not res!1070725) (not e!873172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566519 (= res!1070725 (not (validKeyInArray!0 (select (arr!50466 _keys!637) from!782))))))

(declare-fun mapNonEmpty!59856 () Bool)

(declare-fun tp!113893 () Bool)

(assert (=> mapNonEmpty!59856 (= mapRes!59856 (and tp!113893 e!873171))))

(declare-fun mapKey!59856 () (_ BitVec 32))

(declare-fun mapValue!59856 () ValueCell!18455)

(declare-fun mapRest!59856 () (Array (_ BitVec 32) ValueCell!18455))

(assert (=> mapNonEmpty!59856 (= (arr!50467 _values!487) (store mapRest!59856 mapKey!59856 mapValue!59856))))

(assert (= (and start!134014 res!1070727) b!1566515))

(assert (= (and b!1566515 res!1070728) b!1566511))

(assert (= (and b!1566511 res!1070724) b!1566514))

(assert (= (and b!1566514 res!1070723) b!1566510))

(assert (= (and b!1566510 res!1070726) b!1566519))

(assert (= (and b!1566519 res!1070725) b!1566518))

(assert (= (and b!1566518 res!1070722) b!1566512))

(assert (= (and b!1566516 condMapEmpty!59856) mapIsEmpty!59856))

(assert (= (and b!1566516 (not condMapEmpty!59856)) mapNonEmpty!59856))

(get-info :version)

(assert (= (and mapNonEmpty!59856 ((_ is ValueCellFull!18455) mapValue!59856)) b!1566517))

(assert (= (and b!1566516 ((_ is ValueCellFull!18455) mapDefault!59856)) b!1566513))

(assert (= start!134014 b!1566516))

(declare-fun m!1440955 () Bool)

(assert (=> b!1566518 m!1440955))

(declare-fun m!1440957 () Bool)

(assert (=> b!1566518 m!1440957))

(declare-fun m!1440959 () Bool)

(assert (=> mapNonEmpty!59856 m!1440959))

(declare-fun m!1440961 () Bool)

(assert (=> b!1566512 m!1440961))

(declare-fun m!1440963 () Bool)

(assert (=> b!1566514 m!1440963))

(declare-fun m!1440965 () Bool)

(assert (=> b!1566511 m!1440965))

(declare-fun m!1440967 () Bool)

(assert (=> start!134014 m!1440967))

(declare-fun m!1440969 () Bool)

(assert (=> start!134014 m!1440969))

(declare-fun m!1440971 () Bool)

(assert (=> start!134014 m!1440971))

(declare-fun m!1440973 () Bool)

(assert (=> b!1566519 m!1440973))

(assert (=> b!1566519 m!1440973))

(declare-fun m!1440975 () Bool)

(assert (=> b!1566519 m!1440975))

(check-sat (not b_next!32191) (not mapNonEmpty!59856) (not b!1566518) b_and!51817 (not b!1566514) (not b!1566511) (not b!1566512) (not b!1566519) tp_is_empty!38971 (not start!134014))
(check-sat b_and!51817 (not b_next!32191))
